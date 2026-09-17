Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180A63EB7F8;
	Thu, 17 Sep 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632680; cv=none; b=KCFZaEpCycTfiE4sRIcsoJrveARf82TLDfs2PPTnH6H8R0nVdf9gsc/ffzd5/1vdhQyRpoLbhwbMGSoazR2ZOfc8oDjzhx/j+Cbw6zUiSabYDKRptPBkNH3G8DWljzaCRRKKjhpDwcV8XD/GPeWAvmRyjb26bfFZKxBGZU2mNgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632680; c=relaxed/simple;
	bh=C8GOUSGG2p753GU/d8fnijIVm/CIaPQvvAfkuQDpRdg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z00kKehOLrKQbn17pebXxPZH2l8CSp1wIH8GP5pKoIAuwuVlUgeOmDGuLH72CgGPraav2AyB3uxHB5oqy87z0/BZrTvGv0olEDUQ9qtIs7iheFWQduJOLfrm2psGfyr96U3a2eSugzDimTLtM53qYNxbad0QJLMlDhnWrrcQZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuPPAf/i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuPPAf/i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835FA1F000FF;
	Thu, 17 Sep 2026 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632678;
	bh=tjCANDN9Cmup5RNH0pmtUarjfOrz4F1NfcznTrPGBKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OuPPAf/ixhkMKZtufAwleeFqsXVNLMHJFyK5RB7ugR83JjGPNyP+LML/+1+ptnVeW
	 RUusJngLCsXHfboW3jAK9VQDYhcMNQZ8hFElaZ1HKw0Pn5/Av1VJ6RDKx2KHdgsq4F
	 MHrQQBvijWAaPUCSj3lEEYcow1B/XLrll5cKply9Z/iLR+5fLn/9MEFTAqAViwovt8
	 OC5h7iN/qEkeG8VxOU09eg7KjifBWN4Pc9HV2AZDppnws7CJ7qQ+8OlIgKwFiwxCxF
	 ig/M9jcIwQuUfuw9PhBiqHkrVJAO5Lwnbyq5s44YDGX7sVygCta/ozB25wuDXeXQH0
	 zCPITHErJPRBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/6] mfd: khadas-mcu: Add support for VIM4 MCU
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-3-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-3-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 08:11:18 +0000
Message-Id: <20260917081118.835FA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: Incorrect writeable registers in VIM4 regmap config
--

commit fc44329d7ee6d12a0077930b2632df3554d1e38f
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

mfd: khadas-mcu: Add support for VIM4 MCU variant

This commit adds support for the VIM4 MCU variant by refactoring the
probe function to use per-variant values. It introduces a dedicated=20
regmap configuration for the VIM4 MCU, with its own volatile and=20
writeable register checks.

> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index 0e74efe14f367..4b37e74e2b04a 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c

[ ... ]

> +static bool khadas_mcu_vim4_reg_writeable(struct device *dev, unsigned i=
nt reg)
> +{
> +	switch (reg) {
> +	case KHADAS_MCU_VERSION_0_REG:
> +	case KHADAS_MCU_VERSION_1_REG:
> +	case KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG:
> +		return false;
> +	default:
> +		return true;

[Severity: Low]
Does this function omit multiple known read-only registers defined for the =
MCU,
such as KHADAS_MCU_MAC_0_REG and KHADAS_MCU_USID_0_REG?

Because this switch defaults to true, any unlisted read-only register is
incorrectly marked as writeable. Because the regmap uses REGCACHE_MAPLE,
writing to an omitted read-only register will inappropriately cache the wri=
tten
value instead of failing, which could poison the cache for subsequent reads.

Even though the khadas-mcu-user-mem cell isn't instantiated for the VIM4 va=
riant
(meaning there is no active code path writing to these registers in normal
production operation), should these known read-only registers be explicitly
handled to prevent future caching issues?

> +	}
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-add-mcu-fa=
n-khadas-vim4-v12-0-497cd543a148@aliel.fr?part=3D3
