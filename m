Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26C53C1400;
	Sat, 10 Oct 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648701; cv=none; b=GH2yrRJzOZswYPHFvr3feEzyr3LHkXOlGNh5q4AvCfu+xxl+9SVT0EC0Eb2RpMcf/JgYCz/GEft5HHfrJ1Ol6QmRDs9ukbnTT146YHoVtGZ0lk/Odl+73KY8YbAFgpzd/D+eanZjOco6Mq/20SYakBElFh79hQ3IfwPO7pojoEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648701; c=relaxed/simple;
	bh=I9gxS1xVQ/UG+eX01aG2vLkz+Bb7pLP2T5CmJxdw7s4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dnAeVbOr/h42cCIqUq1URgyAeGOtn4ZWlr//uloViVDTAlyL5W3yd25D1OY9KsuXTayFFTGuBnRNXRGB2ni4ykbZKW3yG+Pmi430p7NjDitVjD3WMld+6izCJ5yB4cyEiwQU5tlXgJlKOY6lzNAjW/gSytjcjckZVmppVZ+2hZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6wHP3Gu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6wHP3Gu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4948E1F000FF;
	Sat, 10 Oct 2026 16:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791648700;
	bh=MB7380QqamRZdps+DGgxUejunXVWP/xO0lMG4u83Hnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c6wHP3GuBWq/H6T3hkGmx3Ctxk4oHsqTDGjGt5co5rN0WOLTFpiiUoUX2PyGvC+c6
	 rj53YkPqyIaFCx6ge7Ub4PA+qxacSfsavupTpXy+jHYBLlYuQI7d0mH1JxfItQc6K8
	 ldXpbg5Vk7wNbxcAw2XtP7MKjwWrYZ1hjqkQgRp5m6lR4nVl+WAfLMEV5YMxXoJ3xm
	 zyHYRNDQZd3knYBirRAI07h/yp0OxmrVb8vVHf+M7Q36gNxNfBQa3mMCBuSa2/uIHp
	 uYsig2aieSqozutpn8wFqPziidehxMuf+i9uKmswAKFiM7J6qDsNI1clN5evYhWtx3
	 Hs1ok0EFShDjw==
Message-ID: <sashiko-outbox-166720@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 05/10] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261009161102.38961-6-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:11:39 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] net: phy: air_an8855: phy_write_mmd clobbers adjacent reserved f=
ields
- [Medium] net: phy: air_an8855: Array linear search underflow causes valid=
 high efuse values to fall back to default
--

commit e8cc9bb475e2accd40605a3774a8e659a3156338
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

Add support for Airoha AN8855 Internal Switch Gigabit PHY. This is a
simple PHY driver to configure and calibrate the PHY for the AN8855
Switch with the use of NVMEM cells.

> diff --git a/drivers/net/phy/air_an8855.c b/drivers/net/phy/air_an8855.c
> new file mode 100644
> index 0000000000000..bc22256fd5f95
> --- /dev/null
> +++ b/drivers/net/phy/air_an8855.c
> @@ -0,0 +1,275 @@

[ ... ]

> +static const u8 dsa_r50ohm_table[] =3D {
> +	127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
> +	127, 127, 127, 127, 127, 127, 127, 126, 122, 117,
> +	112, 109, 104, 101,  97,  94,  90,  88,  84,  80,
> +	78,  74,  72,  68,  66,  64,  61,  58,  56,  53,
> +	51,  48,  47,  44,  42,  40,  38,  36,  34,  32,
> +	31,  28,  27,  24,  24,  22,  20,  18,  16,  16,
> +	14,  12,  11,   9
> +};
> +
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

[Severity: Medium]
Can a valid high efuse value cause an array search underflow here?

Since dsa_r50ohm_table contains 17 occurrences of 127 at the beginning of t=
he
array, a forward linear search for 127 breaks at i =3D 0.

The subsequent logic if (i < 8) intercepts i =3D 0 as an error. Consequentl=
y, an
input of 127 falls back to index 25 (94), whereas an input of 126 correctly
matches at index 17 and maps to table[17-8] (127). The forward search breaks
the - 8 shift algorithm for saturated values.

> +
> +	return 0;
> +}

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

[Severity: Medium]
Does this inadvertently clear the adjacent reserved fields for pair B?

phy_write_mmd() unconditionally overwrites the entire 16-bit register. By
writing FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_A, 0x1), this inadvertently ze=
roes
out the adjacent 8-bit field AN8855_PHY_RG_AD_RESERVE0_B (bits 7:0). Should
phy_modify_mmd() be used here instead?

> +	if (ret)
> +		return ret;
> +	ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND1, AN8855_PHY_RXADC_REV_1,
> +			    FIELD_PREP(AN8855_PHY_RG_AD_RESERVE0_C, 0x1));

[Severity: Medium]
Similarly, does this inadvertently clear the adjacent reserved fields for
pair D (AN8855_PHY_RG_AD_RESERVE0_D)?

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009161102.3896=
1-1-ansuelsmth@gmail.com?part=3D5
