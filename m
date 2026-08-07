Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40BE4B04BD;
	Fri,  7 Aug 2026 01:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786065953; cv=none; b=PAJ0bhqSnmZjRwWue40p0/R5KC95h5OCsk8SfFdnkafZxtvXjCtuYoQ5N3XYmPP5/0CKllCxxLjBxtpYgsON8o0P7UUACfsh6JEl5FmpDKZbFiwH6brE9hFOMkpC98dGZuKgF6TinLbJvpbZzd01lt3d5REpy2roGm7JhleQpZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786065953; c=relaxed/simple;
	bh=2a3FLIurZvzYK4vNySgYNPoJF1/8iHPebA3ct8o/+AQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=smTBqJnNRySfhJbHe0nm+oi7t3BENkvNxv1l9Bqoeck9fMDN3YJbucP+wZ7V6oxfxobRX1aP2lZCicDIdSFXEZMl0bcYX/CMdzglS+xBqX63vnABP5+zQnwqShyoFSKonL+qmCBsA8oBEZASR1eN+lrwZYIi5UlY9CmcfgKbIYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDKiU1w3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDKiU1w3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396BE1F000E9;
	Fri,  7 Aug 2026 01:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786065952;
	bh=XGbRnHrRZRT4vzD+R0HWrk/IOAGFOzA7Nk2d6v6RPqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nDKiU1w3/o1ch8zOuhg98uETptQZ5oc1NRAZOw3tfEH2uxzBSfqxuvVKr2kcIRDFh
	 xv0PLfjfjEkdpv1mBRhaT2nVgq+GHY6VXx7zaoEXdegnXU+bdxgPPc+hPE2dOTPyuu
	 z6lVDLSWjM5lFdFdmQBZEV9nCVAU4eeL/Gdy60wtDZanmozm46oyZYgxjfjL6OVv0a
	 fZc3Yqg2i+/N5xv+wysV87g8jXKeirQB3IZtElB9ZkzUHq2tq+47Mr7i2k2/PCxQno
	 GVgQb0+HF/rhpTnFZaPP7PegKmJOWHkMey3RYe9G7nOU5J1IvCPmSqOp6LhdX3x0Xw
	 xAmgyn0VdQIUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 4/4] net: phy: add X-Powers AC200/AC300 EPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260805-submit-acx00-of-dynamic-v1-v3-4-32c3210a6f25@gmail.com>
References: <20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com>
 <20260805-submit-acx00-of-dynamic-v1-v3-4-32c3210a6f25@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 01:25:51 +0000
Message-Id: <20260807012552.396BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `phy_restore_page()` on the error path of `phy_select_page=
()` leaves the MDIO bus permanently locked.
--

--- Patch [4]: [PATCH net-next v3 4/4] net: phy: add X-Powers AC200/AC300 E=
PHY driver ---
commit fc0883818634a8eab77474550b0a3aac9604dc17
Author: James Hilliard <james.hilliard1@gmail.com>

net: phy: add X-Powers AC200/AC300 EPHY driver
   =20
This commit introduces a new Ethernet PHY driver for the X-Powers AC200
and AC300 companion ICs. It provides package-specific I2C or MDIO control
initialization and implements the standard PHY driver callbacks.

> diff --git a/drivers/net/phy/xpowers-acx00-main.c b/drivers/net/phy/xpowe=
rs-acx00-main.c
> new file mode 100644
> index 0000000000000..2260ddea4b315
> --- /dev/null
> +++ b/drivers/net/phy/xpowers-acx00-main.c
[ ... ]
> @@ -0,0 +1,536 @@
[ ... ]
> +static int acx00_ephy_config_init(struct phy_device *phydev)
> +{
[ ... ]
> +	if (priv->is_ac300 && priv->use_low_calibration_tuning) {
> +		afe_eq_rx_detect =3D
> +			ACX00_PAGE6_AFE_EQ_RX_DETECT_LOW_CAL_VALUE;
> +		tx_level_value =3D ACX00_PAGE6_TX_LEVEL_LOW_CAL_VALUE;
> +	}
> +
> +	oldpage =3D phy_select_page(phydev, ACX00_PAGE_1);
> +	if (oldpage < 0)
> +		return oldpage;

[Severity: High]
Does this error path leave the MDIO bus permanently locked?

Looking at phy_select_page(), it holds the MDIO bus lock even when returning
a negative error code so that the caller can safely clean up. Since this pa=
th
returns directly instead of jumping to the out_restore_page label, could th=
is
result in an unrecoverable deadlock for any future accesses on the same bus?

> +
> +	ret =3D __phy_write(phydev, ACX00_PAGE1_APS_CONTROL_REG,
> +			  ACX00_PAGE1_APS_DISABLED_4S_VALUE);
> +	if (ret)
> +		goto out_restore_page;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-submit-acx=
00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com?part=3D4
