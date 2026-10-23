Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750564;
	b=kOPO716wHy4ZnzG6a86pX9YJSpHCiZ1RDUg3BkcvamwRbOwdIhTKqhkem/PlvlsTA/AC
	 PsZ8ma+vAhYo9u5EEH8ZvMSDzGuHGpzVOYRKz7Hn811FJp5Yoc4jfp/i+dvxv99zIaQu2
	 42RA6bKKrPyD4z2dPgGxTrSmktOL/7ewp03kL10fsblmWHW6sqYwoBo0f9dpPdpEdNrjK
	 N5RvhfGF+BDji2i2+sPjWmXa1b7U5Yuy/i45rVu8cBlubBn3j2EwKbxpbs0cZqANP8rNx
	 cTgNQs1Cx92p1rcERS0MS5b+8dfERF+nmFhtoDMnVwYM5HgEYO50D2ApjJ5hMZWrerA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750564;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XpMfmQ6uvJLjRojavDTWCJMaReLXcpR4f9tnmhjtMoA=;
	b=oAgxHMFsjwH5wHRIP49MADJtzHe7iJpOyfsKLVrsTNEnQtbCyUEEOicQwePaxoUlmr7/
	 AbZLnNMJ75OpCmbvwdG4Ow6j1GG9c2Z4/IB1DFGdsrgn1EjWEGNQKN+tBRK5en2oCYClU
	 /GQS5Nz4roq9u+6ioHmp9FeambDtNt4c5j3EHoxg28huIosIplW9O0fJyCS4LM6yiL4q3
	 4/xIpY11homuSZbqF2bX/vRuvSElN6kYZXgaQ1iLE2MN2ggOwj6CrKSB9bglkFxTDjoTZ
	 6fhMEqduoe218O+lzR3sny8Qkw6Y+qDsiP/mpxqdOsklr3P7j4PsMM/lUbj12Lkr+VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RbERZJla;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189B2606A31A
	for <mfd@lists.linux.dev>; Fri, 23 Oct 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RbERZJla
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3D21F01825;
	Fri, 23 Oct 2026 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792750563;
	bh=XpMfmQ6uvJLjRojavDTWCJMaReLXcpR4f9tnmhjtMoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RbERZJlapjpjtFV7fh/9RU0CHdRNTPL09bldwmlr0ACSiM2VUkYQN+yKocmEsq4In
	 WfuensoR5mcRvhHvwr9pCl7IwPSt89VPnyGn0Hw/dZBT0Wu3phSOg0IwQ6oRLFWJ0w
	 EUfIccvl/+e8H2CCAUIX2kiDQ2iEiRQHxdac4vCZrxUp+HbihCWMJrLCEYZAMLb20c
	 ZoRF+5NaZdq9FtVPoDZ85dlixcdXi3c+axelwQou3d03SJWqJES0gM9HBTKY+AHKrY
	 9kafpWdhY4f//PPbgyjKkf6QqcFwS/URE/Mbrx7qVf8biLXgLbOM6p2iXRDfWa29sJ
	 EQWClQLIzutCA==
Message-ID: <sashiko-outbox-182663@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] mfd: axp20x: Add support for the AXP2101
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261023100401.67592-3-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
 <20261023100401.67592-3-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 10:16:02 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: axp20x: axp2101_cells array is missing static const qualifier
--

commit 4362cae65ca6638f0bab6f82e4bb84e80e901bf4
Author: Olivier Louvignes <olivier@mgcrea.io>

mfd: axp20x: Add support for the AXP2101

This commit adds AXP2101 PMIC support to the axp20x MFD driver, including i=
ts
register map, IRQ definitions, power-off handling, and MFD cells for the
regulators, USB power supply, and battery charger.

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 50df66de24e06..b87d7ef5ba455 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c

[ ... ]

> @@ -1061,6 +1137,21 @@ static struct mfd_cell axp313a_cells[] =3D {
>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>  };
> =20
> +static const struct resource axp2101_usb_power_supply_resources[] =3D {
> +	DEFINE_RES_IRQ_NAMED(AXP2101_IRQ_VBUS_PLUGIN, "VBUS_PLUGIN"),
> +	DEFINE_RES_IRQ_NAMED(AXP2101_IRQ_VBUS_REMOVAL, "VBUS_REMOVAL"),
> +};
> +
> +/* No driver handles its fuel gauge yet. */
> +static struct mfd_cell axp2101_cells[] =3D {
> +	MFD_CELL_NAME("axp20x-regulator"),
> +	MFD_CELL_OF("axp20x-usb-power-supply",
> +		    axp2101_usb_power_supply_resources, NULL, 0, 0,
> +		    "x-powers,axp2101-usb-power-supply"),
> +	MFD_CELL_OF("axp20x-battery-power-supply",
> +		    NULL, NULL, 0, 0, "x-powers,axp2101-battery-power-supply"),
> +};

[Severity: Low]
Since axp2101_cells in drivers/mfd/axp20x.c is never modified at probe or
runtime and is only assigned to axp20x->cells (const struct mfd_cell *) in
axp20x_match_device(), should it be declared as static const struct mfd_cell
so that it is placed in read-only memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023100401.6759=
2-1-olivier@mgcrea.io?part=3D2
