Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6A74C9DEA;
	Sun, 18 Oct 2026 16:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340122; cv=none; b=EanWDhHOYiaCqjYFmwGns3nmoy1Lnxjnp2S6E8mTs/Xred0Bayc9fO6WUb1b9G62oQm7JTq832k2C4nIJOGHiAnePuuWheAMUsZhnXOkK5tWs7n0GfnyCmxRxr1WYm5wsyMAqLZ3+HtNFcze63UDY4v6eN2lq6nUG0G1+q33KFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340122; c=relaxed/simple;
	bh=3R4/rdo6K/JeF6S24xxJElFtHvY+OxoU81kshSxjFdE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uFE/Wqfd7hJ7ZCbgs2HQXJ5VewJXtBzHV7J52CsgTWe+Ng9AzbVvsyrQVf5H+vzxghl1Rhz5CiCFggQOsKuwf3MIxeCOyueqcZEv4MF3y6wNcywszU546PWY2lQftXEWss2KmN+pw6cyHoiKm9zO/QTM49d935894+ohA+yenjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H17Olv2V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H17Olv2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B39F1F000C5;
	Sun, 18 Oct 2026 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792340120;
	bh=pV0cHJbM8XW94Pvq06H1yhA8MNxog3MGIjFAMl9Gua8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H17Olv2VHKyqwEGLYmJf4D/UmLvcEhbkcbvlksU76b/Nv6PGhjNOEPeZb1izId99H
	 2XKlODZcxrloVap7HOYY88l5ZVW5adquDvIIP6pC4ssscDzvP9JxlOPlZYjFT5AR8c
	 AqqPpxDCGN+pEH+FXZb47DRTurEnLMdQn4INohluD1YIyAclCbb9UoUS4EK4uN07T3
	 bduGPnHyJz53UKbgiuf6AqShG75SWSWK/mWIM9C/KCpsPMaACPPoGx3HjxMXAwP6Rk
	 ZyvYUd/3NXyr+7otAhnCKQjlInQQefQX84Ig/fFJhgKxZrpfhcJZsuPFz87if+gnBZ
	 7faRzFiFDH7YQ==
Message-ID: <sashiko-outbox-176271@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/8] irqchip/realtek-rtd1319d: Add driver for Realtek
 RTD1319D and RTD1325 SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261018160653.3940371-7-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-7-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:15:19 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] irqchip/realtek-rtd1319d: unreachable DRTC IRQs excluded from su=
bset masks
--

commit e59f4cebdbdec34b9436dc4ae09a46cfa2ab3770
Author: James Tai <james.tai@realtek.com>

irqchip/realtek-rtd1319d: Add driver for Realtek RTD1319D and RTD1325 SoCs

This commit adds support for the ISO and MISC interrupt controllers on Real=
tek
DHC RTD1319D and RTD1325 SoCs.

> diff --git a/drivers/irqchip/irq-realtek-rtd1319d.c b/drivers/irqchip/irq=
-realtek-rtd1319d.c
> new file mode 100644
> index 0000000000000..4bac12c02cbe2
> --- /dev/null
> +++ b/drivers/irqchip/irq-realtek-rtd1319d.c
> @@ -0,0 +1,197 @@

[ ... ]

> +#define ISO_NMI_WDT_MASK	0x08008090
> +#define ISO_NORMAL_MASK		0xf7ff7f6e
> +#define MISC_NORMAL_MASK	0xffe0ded6
> +#define MISC_UART1_MASK		0x00000028
> +#define MISC_UART2_MASK		0x00002100

[ ... ]

> +enum rtd1319d_misc_isr_bits {
> +	RTD1319D_MISC_ISR_UR1_SHIFT		=3D 3,
> +	RTD1319D_MISC_ISR_TC5_SHIFT		=3D 4,
> +	RTD1319D_MISC_ISR_UR1_TO_SHIFT		=3D 5,
> +	RTD1319D_MISC_ISR_TC0_SHIFT		=3D 6,
> +	RTD1319D_MISC_ISR_TC1_SHIFT		=3D 7,
> +	RTD1319D_MISC_ISR_UR2_SHIFT		=3D 8,
> +	RTD1319D_MISC_ISR_UR2_TO_SHIFT		=3D 13,
> +	RTD1319D_MISC_ISR_I2C5_SHIFT		=3D 14,
> +	RTD1319D_MISC_ISR_I2C4_SHIFT		=3D 15,
> +	RTD1319D_MISC_ISR_DRTC_HSEC_SHIFT	=3D 16,
> +	RTD1319D_MISC_ISR_DRTC_MIN_SHIFT	=3D 17,
> +	RTD1319D_MISC_ISR_DRTC_HOUR_SHIFT	=3D 18,
> +	RTD1319D_MISC_ISR_DRTC_DATE_SHIFT	=3D 19,
> +	RTD1319D_MISC_ISR_DRTC_ALARM_SHIFT	=3D 20,
> +	RTD1319D_MISC_ISR_I2C3_SHIFT		=3D 23,
> +	RTD1319D_MISC_ISR_SC0_SHIFT		=3D 24,
> +	RTD1319D_MISC_ISR_SC1_SHIFT		=3D 25,
> +	RTD1319D_MISC_ISR_SPI_SHIFT		=3D 27,
> +	RTD1319D_MISC_ISR_FAN_SHIFT		=3D 29,
> +};
> +
> +static const u32 rtd1319d_misc_isr_to_scpu_int_en_mask[32] =3D {
> +	[RTD1319D_MISC_ISR_UR1_SHIFT]		=3D BIT(3),
> +	[RTD1319D_MISC_ISR_UR1_TO_SHIFT]	=3D BIT(5),
> +	[RTD1319D_MISC_ISR_UR2_TO_SHIFT]	=3D BIT(6),
> +	[RTD1319D_MISC_ISR_UR2_SHIFT]		=3D BIT(7),
> +	[RTD1319D_MISC_ISR_I2C5_SHIFT]		=3D BIT(14),
> +	[RTD1319D_MISC_ISR_I2C4_SHIFT]		=3D BIT(15),
> +	[RTD1319D_MISC_ISR_DRTC_HSEC_SHIFT]	=3D BIT(16),
> +	[RTD1319D_MISC_ISR_DRTC_MIN_SHIFT]	=3D BIT(17),
> +	[RTD1319D_MISC_ISR_DRTC_HOUR_SHIFT]	=3D BIT(18),
> +	[RTD1319D_MISC_ISR_DRTC_DATE_SHIFT]	=3D BIT(19),
> +	[RTD1319D_MISC_ISR_DRTC_ALARM_SHIFT]	=3D BIT(20),
> +	[RTD1319D_MISC_ISR_SC0_SHIFT]		=3D BIT(24),
> +	[RTD1319D_MISC_ISR_SC1_SHIFT]		=3D BIT(25),
> +	[RTD1319D_MISC_ISR_SPI_SHIFT]		=3D BIT(27),
> +	[RTD1319D_MISC_ISR_I2C3_SHIFT]		=3D BIT(28),
> +	[RTD1319D_MISC_ISR_FAN_SHIFT]		=3D BIT(29),
> +};

[ ... ]

> +static const struct realtek_intc_mask rtd1319d_intc_misc_cfgs[] =3D {
> +	{ MISC_NORMAL_MASK, },
> +	{ MISC_UART1_MASK, },
> +	{ MISC_UART2_MASK, },
> +};

[Severity: Medium]
Are the DRTC interrupts (bits 16..20) intentionally excluded from
rtd1319d_intc_misc_cfgs[], or is a subset mask missing for them?

rtd1319d_misc_isr_to_scpu_int_en_mask[] defines enable masks for
RTD1319D_MISC_ISR_DRTC_HSEC_SHIFT through RTD1319D_MISC_ISR_DRTC_ALARM_SHIF=
T,
so realtek_intc_unmask_irq() will set BIT(16)..BIT(20) in MISC_ISR_EN_OFFSET
when a consumer enables one of those interrupts.

However, MISC_NORMAL_MASK (0xffe0ded6) clears bits 16..20 (0x001f0000), and
neither MISC_UART1_MASK (0x00000028) nor MISC_UART2_MASK (0x00002100)
includes them. When a DRTC interrupt fires, realtek_intc_dispatch() filters
MISC_ISR_OFFSET by subset_data->subset_mask->ints_mask across
rtd1319d_intc_misc_cfgs[], so none of the subset handlers will dispatch or
clear those pending bits.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018160653.3940=
371-1-eleanor.lin@realtek.com?part=3D6
