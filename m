Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE2035C19B;
	Tue, 29 Sep 2026 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711554; cv=none; b=p16gPLs32ei+6IlwMBZ0LhjS9IE3WQyowVl36wA0XcZUzOdZ6sobY1LyVH71HJb/O0E5R46Gwp94ub6FWZfVjnvpVCYLyO0D5UZvRqfhMfCpzVk8Q8jr7FhFYS09MVpt/1eQvf2csFtsMIrboNQoaLc3mc9BT7gny+qwZvKAbXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711554; c=relaxed/simple;
	bh=rrWdAeL2q+VPiEND1pYTc2DU71+hYA/vw27fCah5Sx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LEecRlZLtKc1nGk67k87nXuNXWWPYFSfH/ToEy1gMEhEvOP2KiCYezSUWL6rF3Rbqqy/iGPq0bqVlukh8QlKOXs9scbldthEMTvlvzf3+jo0dUAgL67R/wqRpWR2ucBZlOQKev7GtOUKqpjs8YQIDErlWf7JWUr2JcUglNLeHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9azbd43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9azbd43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9701F00893;
	Tue, 29 Sep 2026 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711553;
	bh=5Toem1T0jCPFG4WaGvT/0js7jc40Zh/4L+BGj61ANfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z9azbd43HZRLV2s43b2SJ4Qw6C/eQ/qQyaSEZC1TpdKw1ygUXJLTrEIgopOcsxI7b
	 7eY6oTwN0WOioVgRe3axLzZizqpDe+pPPBmkLZE2kIqRS6oVfCA/FMEjU43hhoYWQr
	 VTWySO2V1K954MNUM/zeQYsg9E5bTgA+0i8i0zxySQ3R6gao8PjDjFF4F5kdbvCOB/
	 ol4hf6LEKo1iDV6xopwYK4M6ZnWKdkxoCHOvy9CIjx+48mWy9Logg7UPQGCDz/yzix
	 Ivi7WlsbnbSfmBSkZIn/apsKoQf8WLmKvVKyaXQjfWF3IV65nRRzDHVy+H+jnJYjSv
	 q5g/+q8yQICIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v24 05/10] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260928194511.41878-6-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
 <20260928194511.41878-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:52:32 +0000
Message-Id: <20260929195233.1A9701F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: phy: an8855_probe() fails if nvmem-cells exists for non-calib=
ration purposes
- [High] net: phy: exact-match lookup in an8855_get_r50ohm_val() breaks cal=
ibration
- [Medium] net: phy: an8855_set_downshift() silently ignores unsupported co=
unts
- [Medium] net: phy: phy_write_mmd() in an8855_config_init() clobbers adjac=
ent RXADC_REV lanes
--

commit 33dc7857103418b012780d7052f73bf932464765
Author: Christian Marangi <ansuelsmth@gmail.com>

    net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

This patch adds support for the Airoha AN8855 Internal Switch Gigabit PHY. =
It
includes a driver to configure and calibrate the PHY using NVMEM cells.

> diff --git a/drivers/net/phy/air_an8855.c b/drivers/net/phy/air_an8855.c
> new file mode 100644
> index 0000000000000..bc22256fd5f95
> --- /dev/null
> +++ b/drivers/net/phy/air_an8855.c
[ ... ]
> +static int an8855_get_r50ohm_val(struct device *dev, const char *calib_n=
ame,
> +				 u8 *dest)
> +{
> +	u32 shift_sel, val;
> +	int ret;
> +	int i;
> +
> +	ret =3D nvmem_cell_read_u32(dev, calib_name, &val);
> +	if (ret)
> +		return ret;
> +
> +	shift_sel =3D FIELD_GET(AN8855_SWITCH_EFUSE_R50O, val);
> +	for (i =3D 0; i < ARRAY_SIZE(dsa_r50ohm_table); i++)
> +		if (dsa_r50ohm_table[i] =3D=3D shift_sel)
> +			break;
> +
> +	if (i < 8 || i >=3D ARRAY_SIZE(dsa_r50ohm_table))
> +		*dest =3D dsa_r50ohm_table[25];
> +	else
> +		*dest =3D dsa_r50ohm_table[i - 8];

[Severity: High]
Does this exact-match loop lookup load incorrect calibration values?

Since 127 occurs 17 times at the start of dsa_r50ohm_table, searching for 1=
27
will always break at i =3D 0. This triggers the i < 8 fallback, applying a =
value
of 94 instead of the intended 127.

Also, any intermediate EFUSE values missing from the sparse table (e.g., 12=
5,
124) will fail the exact match loop entirely (i =3D 64) and also fall back =
to
94, which could cause massive discontinuities.

> +
> +	return 0;
> +}
> +
> +static int an8855_probe(struct phy_device *phydev)
> +{
> +	struct device *dev =3D &phydev->mdio.dev;
> +	struct air_an8855_priv *priv;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->needs_calibration =3D of_property_present(dev->of_node,
> +						      "nvmem-cells");
> +
> +	if (priv->needs_calibration) {
> +		int ret;
> +
> +		ret =3D an8855_get_r50ohm_val(dev, "tx_a", &priv->calibration_data[0]);
> +		if (ret)
> +			return ret;

[Severity: High]
Does this broad property presence check break probing on valid device trees?

If the nvmem-cells property is present for another standard purpose (like
providing a MAC address) but the calibration cell (tx_a) is missing,
nvmem_cell_read_u32() in an8855_get_r50ohm_val() will return -ENOENT.

Because this error is returned directly, the PHY driver completely fails to
probe on devices that legally use nvmem-cells for non-calibration data.

[ ... ]
> +static int an8855_set_downshift(struct phy_device *phydev, u8 cnt)
> +{
> +	u16 ds =3D cnt !=3D DOWNSHIFT_DEV_DISABLE ? AN8855_PHY_EN_DOWN_SHIFT : =
0;
> +
> +	return phy_modify_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1,
> +				AN8855_PHY_EXT_REG_14, AN8855_PHY_EN_DOWN_SHIFT,
> +				ds);
> +}

[Severity: Medium]
Should this function return an error such as -EOPNOTSUPP or -EINVAL for
unsupported downshift counts?

The requested cnt is completely ignored unless it is DOWNSHIFT_DEV_DISABLE,
always enabling the default downshift behavior. Userspace configuration will
desynchronize from the actual hardware state, as ethtool will report success
for counts the PHY did not actually apply.

[ ... ]
> +	ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_0,
> +			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_A, 0x1));
> +	if (ret)
> +		return ret;
> +	ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_1,
> +			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_C, 0x1));

[Severity: Medium]
Will these raw writes clobber the adjacent RXADC_REV lanes?

Using phy_write_mmd() rather than a modify wipes out the RESERVE0_B and
RESERVE0_D fields located in the lower byte of these registers, destroying
any hardware defaults or prior configurations for lanes B and D.

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928194511.4187=
8-1-ansuelsmth@gmail.com?part=3D5
