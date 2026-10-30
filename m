Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336076;
	b=SP/5fOFYNRqjS06AU0X+hP67K9oq0qd0DZkpjMJtggDXqhdmNN5XBYrsPumX/QoyTySm
	 jOGmIZa60qEkrXOp7tCmfLgAd9q30i8dcZFIZkUnH+AQ9tOApdYpzzruNZYWEr12vuTC5
	 asoK+QA8n90IbhZPJLvDAvZhkxacH3tDlLEEURHFcjty/Nt6J5PPnWppFPimeG5X1exif
	 Dq+GZnbkvd5q5IhDP3Ez1Fm1e4OeZ0ykolQ5sHf4p2ZkpXK4Yp/mY5CMC6Ql18+U+T1HL
	 304rPsmmWW/KwFFQ7Ag23J/iqKnI+y75yUpt0+It+f+4/myeCb+JE30Jo1oc4M6xPOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336076;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XDR+z05wAJMvHf3aWYv837eS/J43xs5HpTX4trXbpOg=;
	b=AMzish8FAYIVrwUSh9gCbgVCalsAJoIIDxcVjbilwxRFAZ9hI3eZ3UNvFwGCnvhhGIJS
	 csXgcb91idT2vo4l6EE/3AxeqJTGglcyJmxsGYW8coWdl5OEKjsX3bwEUCtYI8JozK1RW
	 KkqeEiD1r8oTor/SDeMjmedYGwEbIjD2vNYVW2EjuREQJzvRtg9oKzPPRlV8sUe2Ag29f
	 J6RKF59XZW+MZf9SUYlOtQQCRsCicrYNBevtlFQjJs6C6y8/MQEo/eNemwNf210Ztxk+M
	 xPKeqN2eaN/ycJoPQ1uG5HM34wqrV9kdX6IN24Am03JdD32q6Bdo0kOcMyjWnz2cddQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3AVsP3J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BB2606A326;
	Fri, 30 Oct 2026 04:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3AVsP3J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D691F0093A;
	Fri, 30 Oct 2026 04:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336076;
	bh=XDR+z05wAJMvHf3aWYv837eS/J43xs5HpTX4trXbpOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R3AVsP3J02Vt4mw0UhSILgq5UhwMqVNMRtMfrWFPSNZXXZ7GGeEJHiRl5pMHOlHB+
	 XRR6Srv5SPEmALKAKGmPo4lP1CQA3zB6Kb1IKu/o0VG8iwOGy3KuL4qfOBFLpM/PS5
	 UGoTaIXid8onCMpqa8Zv4IcY2OqEYvfu9xD9CIVH7Go5sZEWJhrehsfcpKNI862/Gz
	 mQloWAfqlsxEZfAEyC8MTPBAvoBfk12VT4tPRXiB9ZMzPFj3yhWBOl4I5ENZ6RmVqh
	 hBphxl/oXIbpmT+sQtqmDCIW61IwnMZY+J0swJYXvJDyJTNw5t4vHoK7M3jb/XQMDt
	 MxZ6AtnLKMEmg==
Message-ID: <sashiko-outbox-190513@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 5/9] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260915123812.14747-6-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
 <20260915123812.14747-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:35 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net/phy: flawed calibration lookup logic corrupts valid efuse valu=
es
- [Medium] net/phy: phy_write_mmd zeroing out adjacent fields in RXADC regi=
sters
- [Low] net/phy: downshift tunable ignores requested count violating ethtoo=
l API
--

commit 86e9fad6319a9402e15a273e59be80e0d645c59c
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

This commit adds a simple PHY driver to support the Airoha AN8855
Internal Switch Gigabit PHY, including configuration and calibration
using NVMEM cells.

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
> +
> +	return 0;
> +}

[Severity: High]
Does this logic incorrectly map valid top-end EFUSE values to a fallback?

If the hardware EFUSE provides 127 (which is the first entry in
dsa_r50ohm_table), the loop immediately matches at i =3D 0. The code then
evaluates if (i < 8) as true, forcing dest to a hardcoded fallback of
dsa_r50ohm_table[25] (which is 94).=20

However, a slightly lower value like 126 matches at i =3D 17, bypasses the
check, and maps to dsa_r50ohm_table[9] (which correctly yields 127). Will
this discontinuity erroneously penalize top-end calibration values and
drop them to 94, potentially corrupting PHY TX pair calibration?

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

[Severity: Low]
Does this downshift tunable ignore the requested retry count?

The ethtool API for ETHTOOL_PHY_DOWNSHIFT accepts a specific retry count via
the cnt parameter, but here cnt !=3D DOWNSHIFT_DEV_DISABLE is used as a sim=
ple
boolean toggle.=20

If userspace requests a specific unsupported downshift count, won't the dri=
ver
enable the hardware default and return 0 (success) instead of rejecting the
invalid count with -EOPNOTSUPP or -EINVAL?

[ ... ]
> +static int an8855_config_init(struct phy_device *phydev)
> +{
[ ... ]
> +	/* Apply values to reduce signal noise */
> +	ret =3D phy_modify_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_TX_PAIR_DLY_S=
EL_GBE,
> +			     AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_A_GBE |
> +			     AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_C_GBE,
> +			     FIELD_PREP(AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_A_GBE, 0x4) |
> +			     FIELD_PREP(AN8855_PHY_CR_DA_TX_PAIR_DELAY_SEL_C_GBE, 0x4));
> +	if (ret)
> +		return ret;
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
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

[Severity: Medium]
Will phy_write_mmd() inadvertently zero out adjacent fields in these
RXADC registers?

Earlier in this function, phy_modify_mmd() and phy_set_bits_mmd() are used
to carefully preserve the state of pairs B and D. But for the REV_0 and
REV_1 registers, phy_write_mmd() completely overwrites the 16-bit register.

By writing FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_A, 0x1) directly, won't this
implicitly zero out the adjacent AN8855_PHY_RG_AD_RESERVE0_B (bits 7:0),
breaking the read-modify-write pattern and wiping out hardware defaults for
pairs B and D?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123812.1474=
7-1-ansuelsmth@gmail.com?part=3D5
