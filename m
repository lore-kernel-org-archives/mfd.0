Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EE5261B70;
	Thu,  6 Aug 2026 02:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983564; cv=none; b=n3jWibAkNsFtYEPzVzsiLElgYHnx2t7uQnddkpZjComA1AB0W4W9v5t5IFBRiu9eLtOrB3M/aYUDABODIe6ktbqzvezFh+LfLhDXeo49OjZ7kqLIFBs1i77G3jkC+OZp7zsN0zAxeEc4diXb5diYqXIwUKMsDLBoykjjezFhNwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983564; c=relaxed/simple;
	bh=Jt4pVcHOUjLILhJVMkZaWva0AZEreTjJbdT9Ds9pcMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CGckpRhTN5zPpaO/zx2hq37AlcdhU9cmlf4INk48+oJZoQaCosGCA+NGj+z14Dhs86hQP1hEMoBMhughpPTu8OB1Wg2l3pResujg2NdJ7WNA5yMFKTEDj0f+uhrNbEe8ScUpSkfKIHjsQ53oPsuExhSyeb68TquyWJQQ+ByGnEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBeq4NKf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBeq4NKf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556DF1F000E9;
	Thu,  6 Aug 2026 02:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785983562;
	bh=XBIAt49lvYOrwnGY5U1HLe2/OgHiEQmiVponHG6lITY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hBeq4NKf7+hdLZmb/alfr6c++XgDRLjc5FTjU0pqyJGop8sDHntyNkZoymBZbZOuZ
	 Z762dq5CvDIxKmomBYVpMgaSlsVZyrMiQZcF2lO6lsDVwIYVsOW786nnhLFvvlEonI
	 aqIY9/dDH3l4D2mcPUhYkYsfKD5XcX8TZGFP9ijgYaPfsGWTlj3tadtLnFmaDwk3Gb
	 7Ag+TmxaEsMFZEJANeyc1iLAnKyqKgm3oBIq/pDBM9GfCgoWwVgzxmzoBregSUvIIU
	 cwpuX2D1Su9N6Xux8kKe6iKvf71sxrwoiHW3TPr7a73eX1Ius5y50VHp7tWdgZzn9V
	 tHrbQIVbQ5H0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/8] mfd: add X-Powers AC200 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-3-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-3-3eef49ff1d8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 02:32:41 +0000
Message-Id: <20260806023242.556DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The driver uses PLATFORM_DEVID_NONE instead of PLATFORM_DEVID_AU=
TO when registering MFD children, risking sysfs naming collisions.
- [Low] The commit message prefix violates MFD subsystem capitalization and=
 formatting rules.
- [Low] The `i2c_device_id` array uses implicit positional initializers ins=
tead of named initializers.
--

--- Patch [3]: [PATCH net-next v2 3/8] mfd: add X-Powers AC200 support ---
commit 98ebae297c54eb1823cd6d77c3a20fc90dde205b
Author: James Hilliard <james.hilliard1@gmail.com>

mfd: add X-Powers AC200 support

This commit introduces the MFD core driver for the X-Powers AC200 mixed-sig=
nal
companion IC. It initializes shared regmap access over I2C, applies vendor
resets, and registers Ethernet PHY control children.

> mfd: add X-Powers AC200 support

[Severity: Low]
This isn't a bug, but should the commit message prefix follow the standard
MFD capitalization and naming format? The subsystem guidelines require
capitalizing the description and using the driver name, such as
mfd: ac200: Add X-Powers AC200 support.

> The X-Powers AC200 is a mixed-signal companion IC with a paged register
> map accessed over I2C.

[ ... ]

> --- /dev/null
> +++ b/drivers/mfd/ac200.c
> @@ -0,0 +1,207 @@

[ ... ]

> +	ephy_node =3D of_get_compatible_child(dev->of_node,
> +					    "x-powers,ac200-ephy-ctl");
> +	if (!ephy_node)
> +		return 0;
> +
> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, ac200_cells,
> +				   ARRAY_SIZE(ac200_cells), NULL, 0, NULL);

[Severity: Medium]
Could using PLATFORM_DEVID_NONE here cause sysfs naming collisions if
multiple instances of the AC200 are present on different I2C buses? The MFD
subsystem guidelines suggest preferring PLATFORM_DEVID_AUTO for automatic
cell indexing to prevent driver load failures.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add MFD devices\n");
> +
> +	return 0;
> +}

[ ... ]

> +static const struct of_device_id ac200_of_match[] =3D {
> +	{ .compatible =3D "x-powers,ac200" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ac200_of_match);
> +
> +static const struct i2c_device_id ac200_i2c_ids[] =3D {
> +	{ "ac200" },

[Severity: Low]
This isn't a bug, but does the I2C subsystem require initialized arrays of
type struct i2c_device_id to use named initializers instead of implicit
positional ones? It looks like this should be { .name =3D "ac200" }.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ac200_i2c_ids);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-submit-acx=
00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com?part=3D3
