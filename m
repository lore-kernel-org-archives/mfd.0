Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398CB36074F;
	Wed,  5 Aug 2026 08:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917788; cv=none; b=PXbBtpxr8iQalqKSG8QoGvFd+UdY/+odscmiQSOvqInC3QxHMP58SpC0+s6YboJ8Jg4dtCQyKAsn9X/ZxnEymRDnxJnrybL3lQ41JSHAxqZ9foIqvZxJ1BvfAf0rOTGUYIu3v1FMwwk+akxJy3MLx4qsvC2kfybkpnQJMri+ZAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917788; c=relaxed/simple;
	bh=V9Th3TgV65LAlXZ8vKDIOYe4FiVjOsGO3n0dR8ksgj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aYtZQs3UUyKCBuoz0zffQnhY7JFzPQWKoDn7GVmlmMqEVJl17w6DADHfie9exYLCmdNrS929pgV2EWCt5dN8NKdI+KGE7Pn12dIs63pXbh5OraZtQbaNmSkKuw95rZ4nKDrT8M8F+6VvPjoR1t7R9sG4n6s+nTCDU6EG2ke0oLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4YFaBDH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4YFaBDH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9BD1F000E9;
	Wed,  5 Aug 2026 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917787;
	bh=m82iw9fI3V25WDVV6gSdMwmA4oHcgc8w57jvm+Rj57Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4YFaBDHKfroh3f0X5t52LCo50uswkrvomwQ03p5vYWcCF1JYgw0N3i3eaU4e+1Ua
	 H0Ntwa6GvRbkDmLTThLU1LoUV5lBmut+i9mBLArxtn9CsErtltVqphV1YdypjU+KMt
	 n6qXrjxDDmCvgApkQIPzZ7mCBcThKGsTQDHORElYltrFEr5w1x93nQX7opc53M+T6p
	 HRvBM3NCB2kCIxznXY9hljA7Eg+bai4gPZg7UOk5fv050OkfGv7vZ6k7HoFvbJB8ii
	 8JnfBso7iA3O93LLPO/0AwfgaFBXeZDblrEW4v2c6LnAqJVugpD1Rhz3fvmsFC1jRn
	 gzDtE2nLA4pbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: mfd@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-1-75df78710b9e@aliel.fr>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-1-75df78710b9e@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 08:16:26 +0000
Message-Id: <20260805081626.8F9BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Passing child-specific configuration (fan registers and cooling =
levels) from the core MFD parent driver to the child violates MFD separatio=
n of concerns.
- [Medium] The patch claims to remove hardcoded constants and add VIM4 supp=
ort but fails to include the corresponding C code modifications, leaving th=
e feature entirely unimplemented.
--

--- Patch [1]: [PATCH v9 1/6] mfd: khadas-mcu: Add per-variant configuratio=
n infrastructure and VIM4 support ---
commit 9c30c9c20ad7d8a42c271a8ebbe94020ab58ae90
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 supp=
ort

This commit adds per-variant configuration structures and enums to manage
different MCU variants, specifically adding VIM4 support. It also introduces
a structure to pass fan configuration to the fan sub-driver to remove
hardcoded constants.

> diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mc=
u.h
> index a99ba2ed0e4e0..e4044c251b97e 100644
> --- a/include/linux/mfd/khadas-mcu.h
> +++ b/include/linux/mfd/khadas-mcu.h
> @@ -70,6 +70,13 @@
>  #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
>  #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
> =20
> +/* VIM4 specific registers */
> +#define KHADAS_MCU_VIM4_REST_CONF_REG		0x2c /* WO - reset EEPROM */
> +#define KHADAS_MCU_VIM4_LED_ON_RAM_REG		0x89 /* WO - LED volatile */
> +#define KHADAS_MCU_VIM4_FAN_CTRL_REG		0x8a /* WO */
> +#define KHADAS_MCU_VIM4_WDT_EN_REG		0x8b /* WO */
> +#define KHADAS_MCU_VIM4_SYS_RST_REG		0x91 /* WO */

[Severity: Medium]
Will these new VIM4 specific registers exceed the unchanged max_register
(0x88) in the core driver's regmap configuration?

It looks like the C file modifications are missing from this patch, meaning
these new registers might be rejected by the regmap API if the configuration
is not updated to allow access up to 0x91.

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

[Severity: Medium]
Does passing child-specific configuration like fan registers and cooling
levels from the core MFD parent driver to the child violate MFD separation
of concerns?

The MFD subsystem guidelines suggest that the core MFD parent driver should
only handle shared core resources. Private resources consumed exclusively by
a single child driver should typically be initialized directly within that
child rather than passed from the parent.

[Severity: Medium]
The commit message mentions removing hardcoded constants and passing these
parameters to the fan sub-driver, but is this structure actually used
anywhere in the code?

The corresponding C file modifications appear to be missing from the commit,
which leaves this structure entirely unused.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-add-mcu-fa=
n-khadas-vim4-v9-0-75df78710b9e@aliel.fr?part=3D1
