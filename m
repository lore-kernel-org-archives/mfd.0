Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2D731E84B;
	Wed,  2 Sep 2026 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354295; cv=none; b=GpCy7rqxHjv5MzRDm4Qs2xm9J65U3EYgWE96IeaMeT3a7d0556aZWL7sw7St63nZXvowx+QPb9TMh9IDqLliK3SFZzTPKL8TCdNHJFfqE7F3F58vLsOx9ZLDB2SwA+UqHqqr0Edtpc/OfzQyeNhrF9qDOrjPwO4nNNoLpuukh+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354295; c=relaxed/simple;
	bh=m5NMO071A0kQ6BJm12CfIsWpAOoJNNCzMqE2bqACxfE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TDTsXtSPBl0U+9gyyORc2D0xywsxvBxbnaJsfT/GmlbNCyBHxrhaqqOx/nzdBaD8ZarV0+i+1+idUGMsIefzjisps/zq5RMDULSNc1yL67p3FZWhGE63OQdEeSAHJeAN8rL87X/hPvqVDtE8c9Iz69jUEbXOyjM739BPuVZC45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kcfi1KmP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kcfi1KmP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5704E1F000E9;
	Wed,  2 Sep 2026 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354293;
	bh=SfiFjKW4NB3xsqpfNjhxbxc1u0zZPGW9rR9kjwTvRSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kcfi1KmPcU00yB9ww6OXK71EZVC2a5xPYVSLcAbNaV0X/uCAQV5xGLNtPSaF7d/pP
	 WZ1eiD898oERubrgSaFADY68tuJ4yfPL3mT2lLjKgrOyRIeU8wA3ZNYNsBC09BvNiC
	 3p5MOKZUdVjmGJMS4yusV8jld0YJ0OhcGER3XiuxudQlLpd+nHnKopcfNEbGtMc0M0
	 ITgK2V265UZNnwyE36STB2XUEAANVuKzYKpMJR1pJ6VbVWZ8iov9vdxtG9bmoAzuXT
	 Kq5TwgPkYHElWEX4pWMYaB19utPsirBx6+Z4q7CXKBqfqB56DBiX9qdC1BmaF6zEEt
	 UhCQXsMuAOArg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/6] mfd: khadas-mcu: Add support for VIM4 MCU
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-3-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-3-5f1610d83bf0@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 13:04:52 +0000
Message-Id: <20260902130453.5704E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Refactor probe() to use per-variant values
> instead of hardcoded globals.
>=20
> Add dedicated regmap configuration for the VIM4 MCU,
> with its own volatile/writeable registers.
>=20
> Introduce struct khadas_mcu_fan_pdata to pass the fan
> control register and duty-cycle levels per variant.
> VIM4 uses a different register and level set (0-100)
>  declared as a list (0, 30, 40, 55, 75, 100) compared
>  to previous boards (0-3).
>=20
> Add a new compatible string "khadas,vim4-mcu".
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-add-mcu-fa=
n-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr?part=3D3

