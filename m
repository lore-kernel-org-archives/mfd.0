Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0933783B0;
	Tue, 29 Sep 2026 19:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711553; cv=none; b=IQmw0iURLtZatzHCUBRniymSGim8SXPFquNoQvM568zNyZA7Hj2eQjOFSqfVrdyEV8JRPLcznetNwpqe+ukPJAqBFTJqshW6dvHEfeXr+fAa2MUoiAdrRcXYYq+yZf8Hi5wgN/HXDJle1JmWcWknG2vVcNX14CFb5Xyyj/OVuCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711553; c=relaxed/simple;
	bh=dudmfVEGPoROAzkql+4mje0D6+0hZgAVIbxeoZ4hA0U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BtnOfyAC1wVydINMSH9IltTVHGiXt7g/SF0+n1qI/UvEjSRuBNQsoSgwcPBQ1JdrTiIMyMfIbNTI9vcFPDhnQljUEVGXO/g/zlagbAky1IdouRktHsKqP9T4MTu0kX19rPZxb75mKsQQWl2IlvKJkIkIPx/QeYVZ2RMA/nHT+cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXchDAuL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXchDAuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2554A1F000FF;
	Tue, 29 Sep 2026 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711552;
	bh=taVDGMcVgb/bb5/d2Z3IOII/TOq0vHbxFb+KMsyDdVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aXchDAuLv05/OmPvLydpcXQs6bIbef0JkhE8tWO8URdFarVRcyn0SjNFziysIGYgi
	 4skswzoQVTwGewwcDrZpL+LjjIiOVAuEJK8bHHN/jMkHOq0LCiYLb6IQa81szCgYBK
	 MRYotp279zc9t8mzitRNzdeSBjDk7oBOixUVC/ueSvadGi18m/tJY7mJRYyxT4kZDD
	 LhwzjmjpS/O+1EIkntM6W7TAaEbmOpDjCY3NTXnIMDjPSfWjhHRy08bHBhTATpsVxU
	 d2r/G4dwRwCC1m/dSLs0yecNxlJRfIE+B2cQhgtdgbvEC+2JlTbetWd+Tk8y97/WXp
	 pLGRXFEOlCN3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v24 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260928194511.41878-5-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
 <20260928194511.41878-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:52:31 +0000
Message-Id: <20260929195232.2554A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: airoha-an8855: violates MFD naming conventions for private str=
uctures
--

commit 74bc32f30a5a15b059bad776dd3ef21cad2cb09f
Author: Christian Marangi <ansuelsmth@gmail.com>

mfd: an8855: Add support for Airoha AN8855 Switch

This commit adds support for the Airoha AN8855 Switch, which includes a DSA
switch and an NVMEM provider. It also uses the mdio-regmap driver to
register a regmap for each internal PHY.

> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> new file mode 100644
> index 0000000000000..cd5791ef436d9
> --- /dev/null
> +++ b/drivers/mfd/airoha-an8855.c
[ ... ]
> +#define AN8855_MAX_PHY_PORT		5
> +
> +struct an8855_core_priv {
> +	struct mii_bus *bus;

[Severity: Low]
Does this struct name violate the MFD subsystem naming conventions? The MFD
guidelines require private data structure names to prefer using the device
name directly (e.g., struct an8855) rather than using generic suffixes like
priv or info.

> +	struct mii_bus *phy_bus;
> +	unsigned int switch_addr;
> +	u16 current_page;
> +};
> +
> +struct an8855_phy_priv {
> +	u8 addr;
> +	struct an8855_core_priv *core;
> +};
[ ... ]
> +static int an8855_core_probe(struct mdio_device *mdiodev)
> +{
> +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] =3D { };
> +	struct device *dev =3D &mdiodev->dev;
> +	struct an8855_core_priv *priv;

[Severity: Low]
Does this variable name adhere to the MFD guidelines? The guidelines suggest
using ddata for the variable instance instead of a generic name like priv in
an8855_core_probe() and other driver functions.

> +	struct regmap *regmap;
> +	int num_phys;
> +	int i, ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928194511.4187=
8-1-ansuelsmth@gmail.com?part=3D4
