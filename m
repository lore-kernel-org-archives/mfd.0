Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876D7185B48;
	Thu,  6 Aug 2026 02:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983564; cv=none; b=GWg48myAU8kfwtbrXjZLyEWMy/tcekA4dz40SSVs8Te6HmMyoXR01yfjZt19y0a0rQX5eyLP3Eds2BPT/SIKYZcquE21xOr5YhdppPqcRu1ZK/eYhdm9YK3ARXJ10fZLLajGJpBRbE8YBd6v+xDN2VcZOQaucLPylazQ+Eba41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983564; c=relaxed/simple;
	bh=8CHu+4MKn77SIgbp+nEp6OzJ5MkOQ73MeO3Hk0SUQUc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oZzujjIhBCPqXR4SiHtFFMJWYZaNbdDYF9kzXJQz8zgv3Rw9LK24AnXy6psivBeaETOMpFTlv4dRAAautXjskoxZqUJu7J3nNXVe0EO9ujZflNYSNyxYt4AuzyFOPAkP0y1uliISRcm1CVqTtX1Pc3N/G91u+U3EGuxRG0f+Mz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQXJ4CH8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQXJ4CH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F281F00A3A;
	Thu,  6 Aug 2026 02:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785983563;
	bh=ATpdIH34CbW1hqSKc07+fBs7Ws7er5eiGGU0B3QoBn0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQXJ4CH8PSSp0CiwGI//fiZaJyq+d5evsmvHXEILvft6ZowJO1o6pChLQPRBq7mp/
	 bnqImCQB2PiASITTF6eLZovE+FX4jbvk6FDuHt/QSO+yrmx+zSFqKD3DJfI9fBFJGC
	 FbGmu8NVkegYAz1qsHDquMEm65NXr8BGVL8KCgiLXf0uSieyM6Frw6ZZhYNFWZEuQC
	 l+GEzo/Gs/IzYJg/iHTY6HrbxHErN1RvFbQ+gFCDkcPVmvExd7s3oa4tRuH3mqsnUM
	 65tD6BE4487LDpANtx7Ya23S5pFBBYjn4Q0xUOTYDrURV6ETpFgW8yY8AQ7DSjv5w7
	 9oQgw6c1NNzew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 8/8] net: phy: add X-Powers AC200/AC300 EPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-8-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-8-3eef49ff1d8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 02:32:42 +0000
Message-Id: <20260806023243.36F281F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Premature devres action registration causes unbalanced power_off o=
n probe failure.
- [High] Missing phy_restore_page() on phy_select_page() error causes MDIO =
bus deadlock.
- [High] Unbalanced power_on in soft_reset causes resource reference count =
leak.
- [High] Acquiring the supplier's device_lock in probe creates an AB-BA dea=
dlock.
- [Medium] Incorrect error recovery in suspend causes an unbalanced power_o=
n.
--

--- Patch [8]: [PATCH net-next v2 8/8] net: phy: add X-Powers AC200/AC300 E=
PHY driver ---
commit 5868cfc367391cc28058cf619b83005f8ecd1852
Author: James Hilliard <james.hilliard1@gmail.com>

net: phy: add X-Powers AC200/AC300 EPHY driver

This commit adds a shared PHY driver for the X-Powers AC200 and AC300 compa=
nion
ICs. It configures the common MDIO PHY registers and manages package-specif=
ic
power, calibration, and interface configurations.

> diff --git a/drivers/net/phy/xpowers-acx00.c b/drivers/net/phy/xpowers-ac=
x00.c
> new file mode 100644
> index 0000000000000..f9e6be751252d
> --- /dev/null
> +++ b/drivers/net/phy/xpowers-acx00.c
[ ... ]
> +static int acx00_ephy_get_control(struct phy_device *phydev,
> +				  struct acx00_ephy_priv *priv)
> +{
[ ... ]
> +	/* The managed link keeps the provider and its operations bound. */
> +	device_lock(supplier);
> +	if (!device_is_bound(supplier)) {
> +		ret =3D -EPROBE_DEFER;
> +	} else {

[Severity: High]
Does this introduce a regression by creating a deadlock during device unbin=
d?

The driver core's really_probe() holds the consumer's device_lock while
calling acx00_ephy_get_control(), which then acquires device_lock(supplier).

Conversely, the driver core's unbind path holds the supplier's device_lock =
and
attempts to acquire the consumer's device_lock to tear down the device link.

[ ... ]
> +static int acx00_ephy_probe(struct phy_device *phydev)
> +{
[ ... ]
> +	ret =3D devm_add_action_or_reset(dev, acx00_ephy_control_release, priv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D acx00_ephy_control_power_on(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to power on control block\n");

[Severity: High]
If acx00_ephy_control_power_on() fails, will the devres cleanup execute an
unbalanced power_off on the control block?

Since the devm action is registered before power_on completes, returning an
error here triggers acx00_ephy_control_release() on a device that failed to
power on.

[ ... ]
> +static int acx00_ephy_soft_reset(struct phy_device *phydev)
> +{
[ ... ]
> +	ret =3D acx00_ephy_set_interface(phydev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D acx00_ephy_control_power_on(priv);
> +	if (ret)
> +		return ret;

[Severity: High]
Does this cause a regression by leaking the provider's reference counts
(regulator, clock, etc.) on every soft reset?

acx00_ephy_control_power_on() is called unconditionally, but there is no
corresponding power_off in the reset cycle. Repeated interface up/down cycl=
es
would monotonically increment the reference counts.

[ ... ]
> +static int acx00_ephy_config_init(struct phy_device *phydev)
> +{
[ ... ]
> +	oldpage =3D phy_select_page(phydev, ACX00_PAGE_1);
> +	if (oldpage < 0)
> +		return oldpage;

[Severity: High]
Does returning directly here cause a regression by leaving the mdio bus
permanently deadlocked?

phy_select_page() acquires the mdio bus lock before attempting to read the
page. If the read fails and returns an error, the caller must still invoke
phy_restore_page() to unlock the bus.

[ ... ]
> +static int acx00_ephy_suspend(struct phy_device *phydev)
> +{
[ ... ]
> +	ret =3D acx00_ephy_control_power_off(priv);
> +	if (ret) {
> +		resume_ret =3D acx00_ephy_power_on_and_resume(phydev);
> +		if (resume_ret)
> +			phydev_warn(phydev,
> +				    "failed to recover from suspend error: %pe\n",
> +				    ERR_PTR(resume_ret));
> +	}

[Severity: Medium]
Does this error recovery path cause a regression by forcing an unbalanced p=
ower
state?

If acx00_ephy_control_power_off() fails, the resource was never successfully
powered off. Invoking acx00_ephy_power_on_and_resume() here will execute an
additional power_on, resulting in a reference count leak.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-submit-acx=
00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com?part=3D8
