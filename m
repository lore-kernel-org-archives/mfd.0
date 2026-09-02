Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C4E4756AE;
	Wed,  2 Sep 2026 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354138; cv=none; b=JSyGcW/GgVIB1n0Dl+RqXEsXmRJEZhDC1fxj6DLunmIxJf0rJA2jmTnl1dnZQ3/2268DIJWkhq7B+LPg4PykMZer6E8WrvEFbP+2zD5jGMMCfNefMHn9YA9B4XgIGsghzKd8aHXa6z2Y82u25xjTTNhSqs+D3yKkC0bWEmuXVp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354138; c=relaxed/simple;
	bh=9P2dm+lE8V2ZVSEAWh/LHNTE19CxkjZ2odRPyZWvqQk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CTae7LSckt06PL+BhsZiPsRCZ8vok5zitKw79+wBfqmhiLBww56qtNHv6IcR1JuGK6uQzeDEkqPUnCwn4nkMw3Hw3hfRvLS7g0Wk1ZC7w1aP43Dn3xHAG58CBIstk2dKS1h2H9s6119Ov/GkzfTqSTwmB8btM9vr763RenLKAYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEVj8FK9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEVj8FK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BC21F00A3A;
	Wed,  2 Sep 2026 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354136;
	bh=8nenKJP/ssNGfl8oKVblXsmCwc+pLn2VBTadIzA5UHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TEVj8FK9mQmq/iwm7LgBb7166tSrVZvpIzPnJ0TzECOLIhn7ysc1lTZui02EFanHZ
	 ytNp6DMP72tbeNUfoNNlTBZ2JlwXOpT4CoQ3YrTM+bskgxVaiR130NbqFEGbg1Eb6O
	 EwRJa5uldFoZVZdAA4rodX2xb6XJxKVFm+lyLw6gR9CYg5fq3eVgwxJ58ZK6Y6hR1O
	 fu/2RE9Xyy0Tx0JGo8uc1Ypp6vQxdLJ+r6pTa2N8Xx6CW/fY5nOPim2C9KdDnpI1+K
	 +ZTjEoEqKImcNPMW5ptic4JheUc6XyBYv+eWYuWqBgFtJdePJnpHPae8B9VWm/XI5Z
	 /DjEneVwAny0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-1-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-1-5f1610d83bf0@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 13:02:15 +0000
Message-Id: <20260902130216.55BC21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Parent MFD driver introduces child-specific private resources (fan =
configuration) via a platform data struct in a global MFD header, violating=
 MFD separation and coupling principles.
--

commit 85d716a1f91fa9e8e2f48479df8c7b07e0cf0279
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 supp=
ort

This commit introduces per-variant configuration structures for the KHADAS =
MCU
driver, adding support for VIM4 specific registers. It also introduces an e=
num
for variant matching and a fan platform data struct to pass fan configurati=
on
to a sub-driver.

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
Does this struct introduce child-specific private configuration into the co=
re
MFD driver?

By defining khadas_mcu_fan_pdata to pass thermal cooling state levels, it
appears the parent MFD driver will be forced to handle configurations speci=
fic
to a single sub-driver. The MFD subsystem principles indicate that the core
driver should only handle shared core resources, while child drivers should
manage their own private configurations.

Could this approach create tight coupling where any new fan variant requires
changes to the core MFD driver, rather than keeping those details contained
within the thermal driver?

> +
> +enum khadas_mcu_type {
> +	KHADAS_MCU_GENERIC =3D 1, /* VIM1/2/3, Edge, Edge-V */
> +	KHADAS_MCU_VIM4,
> +};
> +
>  #endif /* MFD_KHADAS_MCU_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-add-mcu-fa=
n-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr?part=3D1
