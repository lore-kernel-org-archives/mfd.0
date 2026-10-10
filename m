Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15C373BFE;
	Sat, 10 Oct 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648702; cv=none; b=r4WqWCvZI1VSWwNT8Uwbkdc8iVRZyMJ3dapUiqNRFh4xX/cFuYpnlOAZCy2fYaTJYKxXOlHCR2nSTp26GZyuY88dtdjOP8t/rqaH3w0ZiP9xjx4la4X6R4QfkwcuXhyQZevHRavZhQDI5FcNludu6TIMeLVHLmCXJE1QPE7hjNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648702; c=relaxed/simple;
	bh=JwfCfP1xnTRHNqbf6yKjeJEkdL5HqOlw0JjM92v0tOY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ktXc1r6za8jtI3EYgCstTSQHTFWl4sAKMskemawuErkc2grjP8YWm0iUfFwVpsIlOrD3jfRFBxVOCR8bkMcGCKK5LlyqwSFwEl6y3Rm1aCsryRoMkulQo+tmFNVqhmMSCn3B7B3GCYyCs8o+y4FVPaRz5piEXP7RfgN4Z0ybcpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxJ5BchT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxJ5BchT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470B21F00893;
	Sat, 10 Oct 2026 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791648701;
	bh=x3w6GnSYHPBCEPGETt6fx3Mzy2wFQGpIe+sdPF9hs3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lxJ5BchTBT4YIkLF6LFvSONBdpSLBO/rPWYwWPnKpz2bnGRJgSrGa8YqO++JpSwQt
	 op9/a/YsmFUxACyfWqn5lpdYDzyCEMNqiWDOLcwEU9MZ+/CE5GPtC6ndwlgBYmefbe
	 2RRTM7JdXpmP2s4LyDKAt2gqrE1xmjGoUUWuz53UI8iCCCr/zCwqaTQSziTW6lD1iA
	 cvtPHB+Z1c0ZMXOrXXxX23JKIFibbJKRHg/1DBgDf134MtsF0FFCt0rcmCbN4hf2Ys
	 zdb12MfEcomb8uHc1pAQCZs+gou/koWnSAjiaLTJt5d9umzqlyiUyHLuy8SOmUZ9dS
	 CKzszrspN8HyA==
Message-ID: <sashiko-outbox-166721@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261009161102.38961-5-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:11:40 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] mfd: overlapping regmap readable ranges for General Purpose and =
GPU timers
- [Low] mfd: structure and variable naming violates MFD API guidelines
--

commit 05d4dc95b969f0fcf66d11398aafad3e7eb7c7f1
Author: Christian Marangi <ansuelsmth@gmail.com>

mfd: an8855: Add support for Airoha AN8855 Switch

This commit adds support for the Airoha AN8855 Switch which provides
a DSA switch and a NVMEM provider. It utilizes the mdio-regmap driver
and registers a regmap for each internal PHY.

> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> new file mode 100644
> index 0000000000000..a2778511dfefc
> --- /dev/null
> +++ b/drivers/mfd/airoha-an8855.c
[ ... ]
> +static const struct regmap_range an8855_readable_ranges[] =3D {
[ ... ]
> +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> +	regmap_reg_range(0x1000a100, 0x1000a2ff), /* General Purpose Timer */
> +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */

[Severity: Medium]
Is this range definition correct? The General Purpose Timer range
(0x1000a100 to 0x1000a2ff) fully overlaps with the GPU timer range
(0x1000a200 to 0x1000a2ff).

Could this be a typo in the hardware memory map definition? It seems like
the General Purpose Timer range might have been intended to end at
0x1000a1ff to avoid overlapping and potential register access boundary
issues.

[ ... ]
> +static int an8855_core_probe(struct mdio_device *mdiodev)
> +{
> +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] =3D { };
> +	struct device *dev =3D &mdiodev->dev;
> +	struct an8855_core *priv;
> +	struct regmap *regmap;
> +	int num_phys;
> +	int i, ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);

[Severity: Low]
This isn't a bug, but does this variable and structure naming align with MFD
subsystem conventions?

The MFD guidelines suggest avoiding generic variable names like priv, and
instead recommend using ddata for the instance variable. Also, should the
struct name itself avoid hardcoding implementation details like core?
Naming it something closer to struct an8855 might better adhere to the
subsystem guidelines.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009161102.3896=
1-1-ansuelsmth@gmail.com?part=3D4
