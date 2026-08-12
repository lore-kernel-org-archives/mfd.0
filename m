Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D32402442;
	Wed, 12 Aug 2026 21:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570634; cv=none; b=O9rofblDGefdw7O3x19BXDw2BdU7p/PGbQS+kHHCwwtAHoq+20eLw8khgLGUynAV+Zj2ga2GusWW01JG4GrCoUWxmDpp6+aefe4dpvBWtsPafLaXtB0y6hftJP+JGMSTxRxt6R1MV7W4yNsZzvp0ZGW4zR4UspPvy974V9fCQ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570634; c=relaxed/simple;
	bh=LpHr7DNIYxCs6OFkg/S/Ppp2GPvfdNAXgtaV6LyAIug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UHF6xByeqfbRSI83vRQ77o9D5AHZ2NHBwZtWx8Ndj7bw1WXwjjk5e9p1pDGMhw1m2mvl23MckNGQtXGs33JUOrGDY1MISiblwAzCFoyXt1whzaRSqkyqyprIg1WjcgWJgQiiG5AzFv/2WBHZ43NRIge6WrUJ4LVrdg1q58rK5b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnoU0gLX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnoU0gLX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8671F000E9;
	Wed, 12 Aug 2026 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786570632;
	bh=Jtl+pzoMEkLEvQ1wRvkZtFot6YNvqe9T9ucZvo35SRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CnoU0gLXKbbVkZuxR8JcLYeTze+h0NYXGW6apQgAEexmGDdfbD7yIp1j7V9ntfJDi
	 q7xr2bezleIGWN9MOEmHAzR6PwPmd3QbvvBVZ4gJxxNsLlIrG2j0UpfeYBBisRwaPu
	 AQteiGURPgwKq8An52MV7FXxCUYTqwrBdrrNfSyBo97OCy/A82sCKxHxTlGMOm7gQb
	 ruc/fuoIOi0eK3SGuk8M1XGfMCqZv42CQaqraevOF+vKGnneuZ47GJzFp47jNzSJS8
	 7Hbj6gnOvKTOOS46eeygMKBwTi7dhNactZS7gCpnPHw/ulNxKw1Zeh58MWvOilcCuD
	 rkswhDEoBMOCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v6 1/5] mfd: axp20x: Constify axp313 and axp717
 cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260812-axp318-regulator-v6-1-d6b84b55c000@baylibre.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-1-d6b84b55c000@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 21:37:11 +0000
Message-Id: <20260812213712.1A8671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Hard-coded cell IDs are used in `axp806_cells` and `axp809_cells=
` instead of leveraging `platform_device->id` or `PLATFORM_DEVID_AUTO`, vio=
lating MFD subsystem guidelines.
--

--- Patch [1]: [PATCH RESEND v6 1/5] mfd: axp20x: Constify axp313 and axp71=
7 cells ---
commit d0271b0bfb6609a5dbfc9c713361a49994e56202
Author: Jerome Brunet <jbrunet@baylibre.com>

mfd: axp20x: Constify axp313 and axp717 cells

This commit constifies the mfd_cells arrays for the axp313 and axp717 chips.
It aligns their declarations with the rest of the supported chips where
the arrays are properly marked as const.

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 679364189ea58..22baab6e10fa6 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c

[ ... ]

> static const struct mfd_cell axp806_cells[] =3D {
> 	{
> 		.id		=3D 2,
> 		.name		=3D "axp20x-regulator",
> 	},
> };
>=20
> static const struct mfd_cell axp809_cells[] =3D {
> 	{
> 		.name		=3D "axp20x-gpio",
> 		.of_compatible	=3D "x-powers,axp221-gpio",
> 	}, {
> 		.name		=3D "axp221-pek",
> 		.num_resources	=3D ARRAY_SIZE(axp809_pek_resources),
> 		.resources	=3D axp809_pek_resources,
> 	}, {
> 		.id		=3D 1,
> 		.name		=3D "axp20x-regulator",
> 	},
> };

[Severity: Medium]
This is a pre-existing issue, but is it safe to use hard-coded cell IDs
like 1 and 2 for the axp20x-regulator cells in the axp806_cells and
axp809_cells arrays?

The MFD subsystem guidelines require using PLATFORM_DEVID_AUTO for automatic
cell indexing, or platform_device->id if numbering is explicitly needed.

Can this hard-coded cell ID usage lead to device naming collisions in sysfs
or driver load failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-axp318-reg=
ulator-v6-0-d6b84b55c000@baylibre.com?part=3D1
