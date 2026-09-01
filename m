Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD23AFAF4;
	Tue,  1 Sep 2026 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276976; cv=none; b=S9bSiPqmoXZxgu324LLOSn2eDjATgLGh5cQxLZQftXb9NiYfSg/3sTYE9gW3KRZTNmwlro1eDgFo+BuCVm3fugGQXyXYh5PuJN6WkG51DbSB2ye3fBnuG813GaAobBCaWtjMxoAahFklevue5JZDp3f76BIfUWR1dJYKAu8/1VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276976; c=relaxed/simple;
	bh=Ovy7TICr67LmstkvsfIzXzKhFPS1jmE9XR1vcmZfHE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pp7XpoI/49mTx+neoCO0RsYSKfqjret147uNmqtczQO46TzxGCXLxDNcZFQfHOzq+im+KdK2w+zSzT+P8jjm7tVv+GBzvqzGrbu+bPadichzc0jfPTc3sBvVbiyrZJSzENqZWTkcfuzdhaGPuxTaGIrphYXIKXKaKR0jlpuzcs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qgqz5zMD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qgqz5zMD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1DC1F000E9;
	Tue,  1 Sep 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276975;
	bh=MBxTqH70UcEsED2mvnquPrF2ubed/dpea68hJHUis/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qgqz5zMDT3zz0SzqLsNw2S8ueG9qARNDv2a4vEe54z0qARqFN/Zg32AbgXHEAO1PO
	 aeq6ryYrKqxtz2CZPvMSCB9FVZbmjd9jfcdIBys4OKBEnIj42YZD6+n8Wm5bM1xZi6
	 2jDyBXX/YpUlJf7EDymt54pngwU9sF2sjwXdXjA+N7gOXJCfsc/K9jchhbhEhvpYwA
	 8sNB50jo9yB9K2GYjQpMBpe8vtOo10hwT68sqQY/uWVNLYVMVe3U7RnsRJ7/IEQn0g
	 4c4k2nr1Go2MRNUV/FBQsHYLtlQdydf1EMk+aag7IG+a4WITnnYEPDCmduE8nNKHxg
	 nRZniAVD2o/JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-1-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-1-aecdb9955a30@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:36:14 +0000
Message-Id: <20260901153614.9A1DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Introducing a bespoke platform data structure (`struct khadas_mcu_f=
an_pdata`) for parent-initialized private resources violates MFD decoupling=
 guidelines.
--

commit 8a8b8fef22780db703282e4a267b644d5339157a
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 supp=
ort

This commit adds structures and registers to support per-variant configurat=
ion
for the Khadas MCU, specifically adding VIM4 support. It introduces an enum
for device matching and a custom platform data structure to pass fan
configuration from the parent to the sub-driver.

> diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mc=
u.h
> index a99ba2ed0e4e0..7a9980ea63e7e 100644
> --- a/include/linux/mfd/khadas-mcu.h
> +++ b/include/linux/mfd/khadas-mcu.h

[ ... ]

> @@ -88,4 +95,21 @@ struct khadas_mcu {
>  	struct regmap *regmap;
>  };
> =20
> +/**
> + * struct khadas_mcu_fan_pdata - fan sub-driver configuration
> + * @fan_reg: register address to write the fan level
> + * @levels: table mapping logical cooling-device states to raw fan levels
> + * @nlevels: number of entries in @levels
> + */
> +struct khadas_mcu_fan_pdata {
> +	unsigned int fan_reg;
> +	const unsigned int *levels;
> +	unsigned int nlevels;
> +};

[Severity: Low]
Does introducing this bespoke platform data structure for parent-initialized
private resources violate MFD decoupling guidelines?

The parent MFD driver is forced to handle fan-specific configuration (like
register addresses and levels) rather than being limited to genuinely shared
core resources. This creates tight coupling with the child driver and
violates the requirement that private resources be initialized directly in
the child.

> +
> +enum khadas_mcu_type {
> +	KHADAS_MCU_GENERIC =3D 1, /* VIM1/2/3, Edge, Edge-V */
> +	KHADAS_MCU_VIM4,
> +};
> +
>  #endif /* MFD_KHADAS_MCU_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-add-mcu-fa=
n-khadas-vim4-v10-0-aecdb9955a30@aliel.fr?part=3D1
