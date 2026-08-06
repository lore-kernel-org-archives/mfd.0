Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32370156F45;
	Thu,  6 Aug 2026 02:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785983559; cv=none; b=cpTzNDHvl7wY+f20eGSid33ukKO+B3RaPA9q4ajW5/i+QlS2O+zDltm7G60GGa2M/cNZKUjCDu8txAqmmVA74HshI0vNizp4jO31I1k+OHYTBzxpwDFWDtR5IyJb7WGNyWJWbRoMKn5LeZVOexF4KaytQIrv6uPX6DHdhU6iyTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785983559; c=relaxed/simple;
	bh=K8T0Fqg9EHFChRLPOytB/N80Mp7qwRqBdBQnU75mNAo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VWbDLGQL5LMOZd5e6PJaadbt3waJJqk+aLNgKe+gHmx5GKanj60biStjYUJNJ74xHSsQLqvdBjTbV/PJJ1ryE6hJUCMg57qeEpzUDJtSd+uTnmZNp4YTpwgiieCYB6vxgt2tKsCNbP9U6PKKt5tWt737Pu/lNelC6fFXr9q/KsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cL4EGwli; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cL4EGwli"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DCE1F000E9;
	Thu,  6 Aug 2026 02:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785983557;
	bh=vLnoGCx1jrV2dKMC8j7QYTZmSlekPjusp6n1AmxouU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cL4EGwli2ZWczCCLXoW+h0i70xHMAJFMQMqPZ0ofl9XnS7gOYmWp663JUvfrlTn2z
	 BvWZ9EbSBBrJVZ8qd9uujGmG+wFGPdSyLYkY1HZaTy5PKR8P5FEzCDqj1Pm0fsQ5R/
	 nvLvabMeJ+vOyOcGHR/0bVpVM4iMoCUctzF7RjEdEaQjG/1vMjGO/0zqEoSDRUt10R
	 0aa0o36xs6zPPyO0n6TXehykTd8rln5cOWKmVB+VxGoT1FfiIRPMYpufIRedyjAQHw
	 4UH/u237phFzstN5VNlzxLbE1NINS9V0jlRz15gAW+b9LolRcpR28Ky5Ejb03twYkS
	 HGpPLJBKoO0qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 6/8] net: phy: add X-Powers AC300 EPHY
 control driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-6-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
 <20260804-submit-acx00-of-dynamic-v1-v2-6-3eef49ff1d8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 02:32:36 +0000
Message-Id: <20260806023237.69DCE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional assertion of CHIP_RESET on first power-on wipes exte=
rnal-supply configuration.
--

--- Patch [6]: [PATCH net-next v2 6/8] net: phy: add X-Powers AC300 EPHY co=
ntrol driver ---
commit 22de676d43131faa2cdf14d10397704b51076320
Author: James Hilliard <james.hilliard1@gmail.com>

net: phy: add X-Powers AC300 EPHY control driver

This commit adds an MDIO control driver for the Fast Ethernet PHY in the
X-Powers AC300 companion IC. It programs the PHY calibration, interface mod=
e,
clock, and I/O controls.

diff --git a/drivers/net/phy/xpowers-ac300-ctl.c b/drivers/net/phy/xpowers-=
ac300-ctl.c
--- /dev/null
+++ b/drivers/net/phy/xpowers-ac300-ctl.c

[ ... ]

> +static int ac300_ephy_ctl_power_on(struct acx00_ephy_control *control,
> +				   unsigned int phy_addr)
> +{
> +	struct ac300_ephy_ctl *priv =3D
> +		container_of(control, struct ac300_ephy_ctl, control);

[ ... ]

> +	ret =3D clk_prepare_enable(priv->clk);
> +	if (ret)
> +		goto out_unlock;
> +	priv->powered =3D true;
> +
> +	/* Keep the external-supply configuration across subsequent resets. */
> +	reset_value =3D priv->package_known && !priv->internal_dldo ?
> +		      AC300_CHIP_RESET_DEASSERT : 0;
> +	ret =3D mdiodev_write(priv->mdiodev, AC300_SYS_CONTROL_REG, reset_value=
);

[Severity: High]
Does this code inadvertently wipe the external-supply configuration on the
first probe?

When ac300_ephy_ctl_power_on() is called for the first time,
priv->package_known is false because it is zero-initialized by
devm_kzalloc().

This causes reset_value to evaluate to 0, which is then written to
AC300_SYS_CONTROL_REG, unconditionally asserting CHIP_RESET for all package
types before the package status is ever read.

[ ... ]

> +static int ac300_ephy_ctl_probe(struct mdio_device *mdiodev)
> +{

[ ... ]

> +	priv->control.power_on =3D ac300_ephy_ctl_power_on;
> +	priv->control.power_off =3D ac300_ephy_ctl_power_off;
> +	priv->control.set_interface =3D ac300_ephy_ctl_set_interface;
> +	/* MII is the reset default used until the MAC supplies its interface. =
*/
> +	priv->interface =3D PHY_INTERFACE_MODE_MII;
> +	mdiodev_set_drvdata(mdiodev, &priv->control);
> +
> +	/* Validate the package while the control endpoint is known to respond.=
 */
> +	phy_addr =3D ac300_ephy_ctl_link_addr(priv);
> +	ret =3D ac300_ephy_ctl_power_on(&priv->control, phy_addr);

[Severity: High]
Could this first call to ac300_ephy_ctl_power_on() trigger the destructive
reset mentioned above?

Since priv->package_known is still false at this point during the probe,
the driver seems to wipe out the configuration it intends to preserve.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-submit-acx=
00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com?part=3D6
