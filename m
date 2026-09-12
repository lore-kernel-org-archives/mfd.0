Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867A83803E1;
	Sat, 12 Sep 2026 22:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253708; cv=none; b=CC0D2x9RlkRfHHad4Zv0hm+G8go+F0JjZQov+1JawEsDscCGYQUv78gTA+VjLmwLVer4vXmejzipTwvsoaIN2mu9PsBRrIHFxCbUt9vlwHMJFRuMC/+PStjhhHy7IoWwlRbDalVnZxhnc1lQmSKHRJbQOgmXqLbfXhxBCG5cxeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253708; c=relaxed/simple;
	bh=I03rlrfwRCfIG0GhbVTxLLErS8ek1p0Lqq4nH5ROXMk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JPqxCylOhOAMvgbCJetKeNEi6pMWuGlCtH7Z7SIGJFw69uKaJd3nW7knLwnYtL0USQYQgHp2h30DYFDiTnimB3x5GL8/AttL1EBazx5wncuIMob2Wibg8DJfQJSzRVliNIbydSWjisPdvODLLtNylKq7Xv1ZjBLWNFIDhS4HIVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJ5xDByk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJ5xDByk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF9C1F00898;
	Sat, 12 Sep 2026 22:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253707;
	bh=yX/HpEWi45jTYbdD2qRebg9cVg8PZFAvwW0uvcxbm5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gJ5xDByk447Nsc7C69l4IV9lEpnrWmXQm+qOitbhd1h+SeQnwFmzBB+U0hcmHLI6Z
	 Y4PYuuiudue+udZXII4t/sU0m08mTPoZzrrc9mOEDwAXUhuH3VWG3nwYvc/qwas7Tn
	 2bGtm70CnHyfv7A7IPIwrCnhTcjjDifU1kMxijvA1pxTuKLzxEJYA5JUgVOtt90TBO
	 3LEUfHTxI53heoWo8c8ORjiZi4cNJPOD+1Y4/KU8Cevkm3Tnh/CGpW8QeM+4U0YgBX
	 UKRnk6BCxTDKM1PIRIRDn9wRGeVSj/t5gUQzsnGXy4Jbi2RQTZWS4J6Q3FQQcQ6XRg
	 ufBdrr/SeuOvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 5/9] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260911225414.225980-6-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
 <20260911225414.225980-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:55:06 +0000
Message-Id: <20260912225507.0CF9C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Forward loop over `dsa_r50ohm_table` with duplicate values causes =
a severe calibration discontinuity for an EFUSE value of 127.
- [Medium] `an8855_set_downshift` silently ignores specific downshift count=
s, treating any non-zero value as a generic 'enable'.
--

commit 836fad6c28da3b4cc1aa1daa6879476d597247ba
Author: Christian Marangi <ansuelsmth@gmail.com>
net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

This commit adds a new PHY driver for the Airoha AN8855 Internal Switch
Gigabit PHY. It configures and calibrates the PHY for the AN8855 switch
using NVMEM cells.

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
> +	else
> +		*dest =3D dsa_r50ohm_table[i - 8];

[Severity: High]
Does this loop unintentionally apply the fallback value instead of the corr=
ect
resistance mapping when shift_sel is 127?=20

When the EFUSE calibration data read from NVMEM contains a shift_sel value
of 127, the forward for loop finds the first match at index i =3D 0. The
subsequent bounds check if (i < 8) evaluates to true, overriding the mapped
value with the fallback dsa_r50ohm_table[25] (which is 94).

Additionally, if intermediate values not explicitly defined in the table=20
are encountered, the strict equality check fails and i reaches=20
ARRAY_SIZE(dsa_r50ohm_table), which also falls back to 94 instead of=20
mapping to the closest index.

> +
> +	return 0;
> +}

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
Does this silently ignore the specific downshift count requested by the use=
r?

If userspace requests a specific downshift count, the driver checks
cnt !=3D DOWNSHIFT_DEV_DISABLE, evaluating to true and setting the hardware
enable bit AN8855_PHY_EN_DOWN_SHIFT. However, it configures the hardware
without actually applying the requested count or returning an error=20
(such as -EOPNOTSUPP) for unsupported values.=20

Tools like ethtool will report success, but the hardware will silently use
its default count instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911225414.2259=
80-1-ansuelsmth@gmail.com?part=3D5
