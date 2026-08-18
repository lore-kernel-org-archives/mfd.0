Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444D122083;
	Tue, 18 Aug 2026 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043811; cv=none; b=qZRFjSiQ+2++0Q5rHvT6u0om6S7I6zaNgkDT5NVHks9Vvm+6FO4IBnnbZOekQDbFph7s7F/I3kNu/NcpIDyb5m6Noc8JznS1xcAtFwuCvy6EE+ncGUUSySVfV634yCLb5woKlVPYo7POihzTsyIL5U7Zgb63SdmQGsQee2sv0Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043811; c=relaxed/simple;
	bh=LxJ7RQjhRP4W8UUjg5z9x9MsbqzSmsWcGbICkYZOZwE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qNMeqfinEJB7PD9ihCJBEONEvRpY3GQUPlKkmumJFPBAggObc0jlWWfjTvXp4UOSkwxLCmS7GAKitHd3FsDxePnyof79/QOnRlJkM6mBMf8UC49NOJUkxCe2+LqAQCrJeNKTtdsCTYyQINx3sHBrDPBSfjGQxBHuxXIGmYhjolA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1BaSVac; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1BaSVac"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154B21F00A3A;
	Tue, 18 Aug 2026 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043806;
	bh=rTbzkWdfdSfbiZQN7IIy18CVNyfQ16PpIPL9jtlTBxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q1BaSVac3xoMBfjFu5Fe9QN5kTKAoVsX5sMIN3ehHMLGAyRC0aQp1wKQFnmcruhZy
	 +IYWV74ZtABdlEifUga5Ab/o+07YLHJbCFVqdFWEGA5O/hz9OP58ts769bE9uNKmsi
	 I2FpCdYy7DLrSy8ER257wyCPDhk4bVpqAupYGP5iLRSJ/5Z8hx68onIrWDRmBYFraR
	 QH0mQ19geCWLzVkig30InWUiCI1exdiXF7VoD6PH/YPaLSgWNjQohHXUrnbPMQL98g
	 Q7ZS+fUMCHMNpZ+J8v0KoMBUfapwZU/VaNhJ57vszwyyA7qCi0yH7dTum9AUAqK29a
	 bTjGpPT5rO4rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 08/10] net: dsa: mt7530: move MDIO bus
 locking into regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260817082034.20326-10-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
 <20260817082034.20326-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:03:25 +0000
Message-Id: <20260818090326.154B21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Recursive mutex deadlock in `mt7530_fdb_cmd`, `mt7530_vlan_cmd`, a=
nd `mt7530_irq_mask_sync` due to unremoved manual locks.
- [High] Mismatched lock acquisition and release, plus recursive self-deadl=
ock, in MT7531 indirect PHY access functions.
--

--- Patch [8]: [PATCH net-next v20 08/10] net: dsa: mt7530: move MDIO bus l=
ocking into regmap ---
commit 93dc44aef1eb650f9b327c234ee71f5777a75b62
Author: Daniel Golle <daniel@makrotopia.org>

net: dsa: mt7530: move MDIO bus locking into regmap

This patch moves MDIO bus locking into the switch register regmap by
configuring the .lock and .unlock callbacks. It removes several manual lock=
ing
wrappers, relying on the regmap to protect register accesses automatically.
It also attempts to switch MT7531 indirect PHY accesses to use reg_mutex.

> --- a/drivers/net/dsa/mt7530-mdio.c
> +++ b/drivers/net/dsa/mt7530-mdio.c
> @@ -148,12 +148,14 @@ static const struct regmap_config regmap_config =3D=
 {
>  	.val_bits =3D 32,
>  	.reg_stride =3D 4,
>  	.max_register =3D MT7530_CREV,
> -	.disable_locking =3D true,
> +	.lock =3D mt7530_mdio_regmap_lock,
> +	.unlock =3D mt7530_mdio_regmap_unlock,
>  };

[Severity: High]
Will adding the lock to the regmap configuration cause a recursive deadlock
in other functions that still hold the manual lock?

For example, in mt7530_fdb_cmd(), the manual lock is still held across a
regmap_read_poll_timeout() call:

mt7530_fdb_cmd() {
	mt7530_mutex_lock(priv);

	ret =3D regmap_read_poll_timeout(priv->regmap, MT7530_ATC, val,
				       !(val & ATC_BUSY), 20, 20000);
	...
}

Since mt7530_mutex_lock() takes the non-recursive mdio_lock, and the regmap
now automatically attempts to take the same lock, does this code self-deadl=
ock?

It looks like mt7530_vlan_cmd() and mt7530_irq_mask_sync() also still hold
mt7530_mutex_lock() while calling regmap operations.

> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
[ ... ]
> @@ -597,7 +577,7 @@ mt7531_ind_c45_phy_read(struct mt7530_priv *priv, int=
 port, int devad,
> =20
>  	ret =3D val & MT7531_MDIO_RW_DATA_MASK;
>  out:
> -	mt7530_mutex_unlock(priv);
> +	mutex_unlock(&priv->reg_mutex);
> =20
>  	return ret;
>  }

[Severity: High]
Does this leave the locks in an unbalanced state?

The entry path of mt7531_ind_c45_phy_read() still calls
mt7530_mutex_lock(priv), which takes the mdio_lock:

mt7531_ind_c45_phy_read() {
	mt7530_mutex_lock(priv);
	...
	ret =3D regmap_read_poll_timeout(...)
	...
}

But the exit path now releases a completely different lock (reg_mutex),
which wasn't previously held.

This pattern also seems to be present in mt7531_ind_c45_phy_write(),
mt7531_ind_c22_phy_read(), and mt7531_ind_c22_phy_write(), where the
semantic patch updated the unlock label but missed replacing the entry lock.

Additionally, since the entry path still takes the manual mdio_lock, do the
subsequent regmap calls inside these functions also trigger the same
recursive deadlock mentioned earlier?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817082034.2032=
6-1-ansuelsmth@gmail.com?part=3D8
