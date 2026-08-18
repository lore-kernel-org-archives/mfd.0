Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E0F3B2FC8;
	Tue, 18 Aug 2026 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043801; cv=none; b=lGgDMHaT5/KCO0mNgqXOSb8lxhkIV13MNTBqHA+12FpvApOSELgf8099CVHWm47RX1qYArZlc8vik9lkFavdzHHTSnw8MYT9CWYRB+e6RAupyejNFnQR0QCsn+wX9qhD27VZ1shMP7NltUcquIesiUjq0ytI02u+HRL7Os2n7Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043801; c=relaxed/simple;
	bh=3Qp9pVa3lG2nWjlFpmK7/d8YeRnd6C9le8TNATrhH0s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rSVbmLO6Y8EKSZx6LseNqEiLCF76Fi5ptwWJsr+FU9ZbflOKs8L/ePPZzwT0Btntlg/byVUHhphHXni5haL4gVN0UTgD4qs4sLb1ZWxEovS07qQwnxwaUiBIalMBEAkpPHIOURQNeFvTOkxsODha0W7/Ai59tpUbFcxWZdaou7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUXwucor; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUXwucor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1FB1F00A3D;
	Tue, 18 Aug 2026 09:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043800;
	bh=ic3FH+r7+TaRCl/aiU7cF2O+Wa6N4/TZRWDdwXEtoig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mUXwucorOpw3zHU1OnV0jmJn8n/JNtpqAb/2NPKZpUNQNraLGqQlsQfS3CUGG+Olh
	 1uQtTFYCCDU1rUvBeDPuMiXEn8cG/Il2vKj7AUmhN3FeHQH6lYZ32TLYNV87C7tT71
	 w6MTv0M+xiZpa7cEVBrJJmjM1Nj0r40xu1vT+sIsaXOXZa6fao6JnBqMI2NP9DwpOm
	 b8cgj6gNbAr4lu56vtKBbD7A9zwOjw1UD4VtfWjwdpOZxce0grHoS/MBJFCaxzs0aG
	 1zuhVIB+sZ1TzBn2b/X0OWY8qlm0i9WgqNsrUjN1VwHxYX5dXygc7b1MLYyS/OhZZx
	 ubblpsm2Nbsuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 05/10] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260817082034.20326-7-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
 <20260817082034.20326-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:03:19 +0000
Message-Id: <20260818090319.DB1FB1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Broken exact-match search causes silent calibration fallback for i=
ntermediate eFuse values
- [Medium] API contract violation: an8855_set_downshift silently ignores un=
supported requested retry counts
--

--- Patch [5]: [PATCH net-next v20 05/10] net: phy: Add Airoha AN8855 Inter=
nal Switch Gigabit PHY ---
commit e5962bf38329639f7d4d409e75314ddeedd25edf
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

Add support for Airoha AN8855 Internal Switch Gigabit PHY.
This is a simple PHY driver to configure and calibrate the PHY for the
AN8855 Switch with the use of NVMEM cells.

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

[Severity: High]
Will this exact match condition fail for intermediate physical calibration
values from the eFuse?

If the hardware reads a valid intermediate value like 100 or 102 that isn't
explicitly present in the dsa_r50ohm_table, the loop will exhaust the array
without matching. This would cause the search to silently discard the
calibration data and fall back to the default uncalibrated value.

Should this use a closest-match or bound search to safely handle
intermediate ADC/calibration values without dropping them?

> +
> +	if (i < 8 || i >=3D ARRAY_SIZE(dsa_r50ohm_table))
> +		*dest =3D dsa_r50ohm_table[25];
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
> +
> +	return phy_modify_paged(phydev, AN8855_PHY_PAGE_EXTENDED_1,
> +				AN8855_PHY_EXT_REG_14, AN8855_PHY_EN_DOWN_SHIFT,
> +				ds);
> +}

[Severity: Medium]
Does this silently ignore unsupported downshift retry counts?

The function treats the user-provided count only as a boolean toggle. If
userspace configures ETHTOOL_PHY_DOWNSHIFT with a specific retry count
(e.g. via ethtool), the driver unconditionally enables downshift but ignores
the requested count.

If the driver only supports a fixed internal count, should it validate the
user's input and return -EOPNOTSUPP or -EINVAL when the requested count
doesn't match DOWNSHIFT_DEV_DISABLE or DOWNSHIFT_DEV_DEFAULT_COUNT?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817082034.2032=
6-1-ansuelsmth@gmail.com?part=3D5
