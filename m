Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE37F37475D;
	Sat, 26 Sep 2026 18:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447121; cv=none; b=jZu3qgUGyHjeKeatdLhhvUalsPr/tu0g5zn7yOauHsXdxCZ+UY/nwi19HYHB4yMyDRapupBcKksZ0qX89Cyuhqs7y/gSwiCD7CiX5A5X4dnmgi3DkDDSFtBSSlDJC7ZyRLzlkc0LkFQzXqdC+rIewhqaPkBNjKqHe95b/PIIltY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447121; c=relaxed/simple;
	bh=l/Q2KOhzvRiakPzmviTgUEWa3cJO1aow0Fjd705smQU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qPJ/ppSYgA+/qejP/906tZJszorMm+LawsVqHUMR9gqXFhmby1/uILk/qXLphRT3O5pIXum/LTn+DGcpryQyI1UlhEjpPsp4CjdmAUuymqenqxkfCwPEPJfdd6fBJKaaj1wHWZykyLnJgZucU25+FqZ7NfFreeV5KaQcQVXisu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PB35ELl4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PB35ELl4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4431F00893;
	Sat, 26 Sep 2026 18:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790447119;
	bh=E7Dvrru3WPQQpj1JmTM+Bk3V4umuui/BXDL1Tz+nJy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PB35ELl4hpUo+SjnIOfUyt7Wy4hHC6kv2F10igpc0RxCsNuhstBnmmiFyhizZqBHL
	 IITaf6UWXiAfya8KC7nvN08bgGPwDyenQDKyM9faap0zUKb9saNxFbTd8XOE2g3Xzi
	 ataHQMdKxpEqenIiZti6LUUmPuWKm6X8OsjNXQP2dxTeV0pd8dYQEIMUIiwQjA4qS2
	 skqq9GefQMUJ/EyLfflsM2PeZ4PiJXW2JDyqM2zDvvEErJT1SQmXZdIz9TUurV9klg
	 FusHTaBDCwA1bCZS7JRnncwOFdmic+m7E3iR01hqiTATm5fLnftwX636Y63siLAfJi
	 RgmiLQWPjWoIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v23 5/9] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925182435.21207-6-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 18:25:18 +0000
Message-Id: <20260926182519.1F4431F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] net: phy: air_an8855: incorrect r50ohm calibration for 127 due t=
o forward search
- [Medium] net: phy: air_an8855: register clobbering in AN8855_PHY_RXADC_RE=
V registers
- [Low] net: phy: air_an8855: an8855_set_downshift ignores specific count v=
alues
--

commit c9b4d007095aa6a972d5abbc505cecf057eb353e
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

Add support for Airoha AN8855 Internal Switch Gigabit PHY. This is a
simple PHY driver to configure and calibrate the PHY for the AN8855 Switch
with the use of NVMEM cells.

> diff --git a/drivers/net/phy/air_an8855.c b/drivers/net/phy/air_an8855.c
> new file mode 100644
> index 0000000000000..bc22256fd5f95
> --- /dev/null
> +++ b/drivers/net/phy/air_an8855.c
> @@ -0,0 +1,275 @@

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

[Severity: Medium]
Will this mapping produce the wrong value for 127?

Since dsa_r50ohm_table starts with multiple 127s, the forward loop finds
the first match at index 0. Then the subsequent check sees i < 8 and assigns
94 (table index 25) instead of 127.

Should this use a reverse search (or find the last match) to map 127 to 127
at index 16 (where 16 - 8 =3D 8)?

> +	else
> +		*dest =3D dsa_r50ohm_table[i - 8];
> +
> +	return 0;
> +}

[ ... ]

> +static int an8855_set_downshift(struct phy_device *phydev, u8 cnt)
> +{
> +	u16 ds =3D cnt !=3D DOWNSHIFT_DEV_DISABLE ? AN8855_PHY_EN_DOWN_SHIFT : =
0;

[Severity: Low]
Does this code incorrectly ignore unsupported downshift counts?

If a user sets an unsupported downshift retry count via ethtool that isn't
DOWNSHIFT_DEV_DISABLE or DOWNSHIFT_DEV_DEFAULT_COUNT, this simply applies
AN8855_PHY_EN_DOWN_SHIFT and returns 0 (success).

Should it return -EOPNOTSUPP for unknown values to maintain consistency
between requested and actual hardware state?

> +
> +	return phy_modify_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1,
> +				AN8855_PHY_EXT_REG_14, AN8855_PHY_EN_DOWN_SHIFT,
> +				ds);
> +}

[ ... ]

> +static int an8855_config_init(struct phy_device *phydev)
> +{

[ ... ]

> +	ret =3D phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_CTRL,
> +			       AN8855_PHY_RG_AD_SAMPLE_PHSEL_A |
> +			       AN8855_PHY_RG_AD_SAMPLE_PHSEL_C);
> +	if (ret)
> +		return ret;
> +	ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_0,
> +			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_A, 0x1));
> +	if (ret)
> +		return ret;
> +	ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_1,
> +			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_C, 0x1));

[Severity: Medium]
Can this clobber the adjacent fields in the RXADC_REV registers?

phy_write_mmd() overwrites the entire 16-bit register. By preparing only
AN8855_PHY_RG_AD_RESERVE0_A and AN8855_PHY_RG_AD_RESERVE0_C, the lower
8 bits (RESERVE0_B and RESERVE0_D) will be unintentionally zeroed out.

Should phy_modify_mmd() be used here instead to preserve undocumented
hardware defaults?

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925182435.2120=
7-1-ansuelsmth@gmail.com?part=3D5
