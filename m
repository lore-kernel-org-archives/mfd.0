Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE99C37FF67;
	Sat,  8 Aug 2026 04:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786164729; cv=none; b=AYAYMQetI8TMjfnULsk9m5Zv1NxXY4txhoKr3qc/VouDOdP2o/w7uqnzKz5XBey/gc3SHe/xNV/UYd8nyBz4jvsscmhs1XERd0C0PszbrEXAYtqFZYadkiuNyqQQhvxdHvuHAbPP6auK1FVUR4AYudQrCRVjl9wLB1K4vKFe13I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786164729; c=relaxed/simple;
	bh=zCBlMMb3OFqm3z0y477dibucYDxB7LiLwT1SyLyHuaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s52bdPCEJ/sJQW3bum/Y0Gf/qkVa/uTUoXxyW/yZx6+C+AziCAuEErV7S8K/arhu5e7vc2p/p7UcTsOYVyRyNxoo2o8TtJSzT25uyAg2BCB0qzS9a5D1ecCyO0II4rgrhz/alDll2r/+79REivd+rZB6ieHKEIeIVv1casyiH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYd+O8Ns; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYd+O8Ns"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8A11F00A3A;
	Sat,  8 Aug 2026 04:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786164727;
	bh=o443vqwn1er0YGhhtKpQbUZyP8uAqfhZH57DOevqiGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jYd+O8Nskg4kQiXPryUAdzuhqVjCLqA/8ukSDSxJ02tr4z3vrfq6mtLOMrUrpBGxr
	 rCUToSxhnAd8buuxMHJMssAe9viwNLrYHStJDlR8iCjcYGY1e/8NKoRJzEd96zguLA
	 C0Qn6bSCA75GgR17Jkx2Mpo0MobQueBEGxnhseQTMFx1+uR35Zw/XIpLCUQtKwimIy
	 48kUlkwmKkmIgfoF3YtGqK+5/f01lvzAsgwnjQh9+c8PGRXPQlTyIy9lIhvLuSxdcT
	 t6nWdKdRAEJA0hPeZQDyESRHHgcMbAt54JsThGU9RszSOUrwwxCah/cCcOLuFcBYTl
	 DHYbxdnF+YgqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 4/4] net: phy: add X-Powers AC200/AC300 EPHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260806-submit-acx00-of-dynamic-v1-v4-4-9bf2f7441632@gmail.com>
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
 <20260806-submit-acx00-of-dynamic-v1-v4-4-9bf2f7441632@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 04:52:06 +0000
Message-Id: <20260808045207.3B8A11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use of device_trylock() with a fallback to -EPROBE_DEFER is an ant=
i-pattern used to bypass lock ordering.
--

--- Patch [4]: [PATCH net-next v4 4/4] net: phy: add X-Powers AC200/AC300 E=
PHY driver ---
commit 6bc6a63de1c66219eb59d7933bc21eede2472534
Author: James Hilliard <james.hilliard1@gmail.com>

net: phy: add X-Powers AC200/AC300 EPHY driver

This commit introduces the Ethernet PHY driver for the X-Powers AC200 and
AC300 companion ICs. It configures the shared MDIO PHY registers and manages
the package-specific I2C or MDIO control registers. The driver also handles
clock selection, vendor initialization, and power sequencing.

> --- /dev/null
> +++ b/drivers/net/phy/xpowers-acx00-ac200.c
[ ... ]
> +struct acx00_ephy_control *
> +ac200_ephy_ctl_create(struct phy_device *phydev,
> +		      struct device_node *package_node,
> +		      bool has_calibration, u8 calibration)
> +{
[ ... ]
> +	if (!device_link_add(dev, &client->dev,
> +			     DL_FLAG_AUTOREMOVE_CONSUMER)) {
> +		ret =3D dev_err_probe(dev, -EINVAL,
> +				    "failed to link AC200 device\n");
> +		goto out_put_client;
> +	}
> +
> +	if (!device_trylock(&client->dev)) {
> +		ret =3D dev_err_probe(dev, -EPROBE_DEFER,
> +				    "AC200 driver is not ready\n");
> +		goto out_put_client;
> +	}

[Severity: High]
Is this use of device_trylock() with a fallback to return -EPROBE_DEFER safe
from causing permanent probe failures?=20

The networking driver guidelines define trylock with a fallback to skip the=
=20
work entirely as an indicator of a flawed locking design that bypasses=20
proper lock ordering. If the lock happens to be held by an unrelated=20
subsystem, such as userspace sysfs access or power management, at the end=20
of the boot process when the deferred probe queue finishes, could this=20
cause the probe to permanently fail?

Could this be replaced with a proper dependency or synchronization mechanism
that avoids bypassing lock ordering?

> +
> +	if (device_is_bound(&client->dev))
> +		priv->regmap =3D dev_get_regmap(&client->dev, NULL);
> +	device_unlock(&client->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-submit-acx=
00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com?part=3D4
