Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807816;
	b=EGodvqxDVnk43iD2gqtEPDF4YlDp9z8VEd2m2gKw/dViPTUzZY833eb49EUnKjbJce2k
	 Dp3/fqFmpBGtmccmNYFlq7cGkTbFog2OWsX7lB+JNovfRlSR5CSDc0HNeZPPK2OEY1UII
	 xtw1uZSKXtHKBHA1ebmB0LJU1IJowQCnZo+f5+wkkV0YRzh58CS1JmKnC6angSENPY4ha
	 eJK4rDIbeC8EmnU2cSUuHbfuYIo4Kxv/OsmUqQMdcM71mWUDavbP2+txWAHA4+91RuEW1
	 yYxk4Fc/iWIeV57AqFOPTXtgEKxX4cS3gjHYMY0YA85KMJ8U92Bq+b+6HNsNUGkvtiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zgWhRU1Tn9nI53y1AMiJiErLB5M5A5y8Poe7/citF2Q=;
	b=D1wguG1EClqfijNUa1INPmQLbXAAv8S8pRnJgnXoklV1WIDLf3pNl0FoUIhFNaLfAKfg
	 /L0pQsf1I7T8eb0yHDt+dqtc9nspR05/Ng0DW9U82Ug8bRq3DcSs7zV/qZf6zGihQZVTb
	 0x1EbtdLpfXBMr8f76daeMKHXk8dbXt+Hlee+xShElJFlMv7mg+oqTko98GfUNKfUkHln
	 6A+XPwewq9IL+129FGyz8D+FY+LL51VebjqJMVliW5J4ZVqZmXcPuz5cK3dMXm1cksEMZ
	 h7ibDEd7BciaJe9X/S+nYLFf01VXkVKZ57wjqyy+ee0QIBHa9AUN13CNnDiTIWQmW5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEAqYSuj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96C0606A31F
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEAqYSuj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB2F1F00899;
	Fri, 27 Nov 2026 19:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795807815;
	bh=zgWhRU1Tn9nI53y1AMiJiErLB5M5A5y8Poe7/citF2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MEAqYSujLH5vEZEQt3mMi3wVBUoo6yyLQLhROK9wm0EnbxZJIzVIhB+MR57gQLZiV
	 MRf4dOuszMbr5a7yCemcP8HvVP8tQdLRRzNmDv68ZloGE0VMxkzwsttJ97VH/Gj9Zc
	 4kH2mDr+FNLCyTmOh0Feyf3WacjzN1Z/VVmMWZRqymSrz+dIfbyDzAkKglxE4Ldgez
	 hCBnLe+JVoiBPKT0v88WAFfecyDiV5Ff1xlRtn1xT5SghOH+v8quu4vAT7fNANxYvE
	 +o5r5RIDG7rDJPmpRwv4J9BZGCYhT4Czo4XHY6Bj7ww6Oy7wKtmAzq5fWg622TnOd4
	 9hOuJ9wMvebKw==
Message-ID: <sashiko-outbox-238159@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] power: supply: max77759: follow the supplier from
 DT
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127-max77759-charger-fixes-v1-6-b364a0862d72@linaro.org>
References: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
 <20261127-max77759-charger-fixes-v1-6-b364a0862d72@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 19:30:14 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] power: supply: max77759: lockdep splat on sync_lock and
  epc_sem lock class
--

commit 921f029245ae31685b6a1b486a60a19513700fd4
Author: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

power: supply: max77759: follow the supplier from DT

This commit replaces the global power supply notifier, name matching,
and delayed work in max77759_charger with .external_power_changed and
power_supply_get_property_from_supplier() to track the DT supplier.

> diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supp=
ly/max77759_charger.c
> index fe71e81439546..655061a1dc938 100644
> --- a/drivers/power/supply/max77759_charger.c
> +++ b/drivers/power/supply/max77759_charger.c

[ ... ]

> @@ -460,6 +442,53 @@ static int charger_set_mode(struct max77759_charger =
*chg,
>  	return 0;
>  }
> =20
> +static void max77759_charger_external_power_changed(struct power_supply =
*psy)
> +{
> +	struct max77759_charger *chg =3D power_supply_get_drvdata(psy);
> +	enum max77759_chgr_mode target =3D MAX77759_CHGR_MODE_OFF;
> +	union power_supply_propval current_limit, online;
> +	bool changed =3D false;
> +	int ret, ret2;
> +
> +	scoped_guard(mutex, &chg->sync_lock) {
> +		ret =3D power_supply_get_property_from_supplier(psy,
> +							      POWER_SUPPLY_PROP_ONLINE,
> +							      &online);

[ ... ]

> @@ -768,27 +695,11 @@ static int max77759_charger_probe(struct platform_d=
evice *pdev)
>  		return dev_err_probe(dev, PTR_ERR(chg->chgin_otg_rdev),
>  				     "Failed to register chgin otg regulator\n");
> =20
> -	ret =3D devm_delayed_work_autocancel(dev, &chg->psy_work, psy_work_item=
);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to initialize psy work\n");
> -
> -	chg->nb.notifier_call =3D psy_changed;
> -	ret =3D power_supply_reg_notifier(&chg->nb);
> -	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "Unable to register psy notifier\n");
> -
> -	ret =3D devm_add_action_or_reset(dev, max_tcpci_unregister_psy_notifier,
> -				       &chg->nb);
> -	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "Failed to add devm action to unregister psy notifier\n");
> -
>  	ret =3D max77759_init_irqhandler(chg);
>  	if (ret)
>  		return ret;
> =20
> -	power_supply_for_each_psy(chg, max77759_sync_tcpm_psy);
> +	max77759_charger_external_power_changed(chg->psy);
> =20
>  	return 0;
>  }

[Severity: Medium]
Does calling max77759_charger_external_power_changed() directly from
probe and from power_supply_external_power_changed() trigger a lockdep
warning between chg->sync_lock and &psy->epc_sem?

Every struct power_supply initializes psy->epc_sem at the same
init_rwsem(&psy->epc_sem) site in __power_supply_register(), so the
consumer and supplier share the &psy->epc_sem lockdep class:

drivers/power/supply/power_supply_core.c:power_supply_get_property() {
	...
	/* Protect driver data from being free'd */
	guard(rwsem_read)(&psy->epc_sem);
}

drivers/power/supply/power_supply_core.c:power_supply_external_power_change=
d() {
	guard(rwsem_read)(&psy->epc_sem);

	if (psy->removing)
		return;

	psy->desc->external_power_changed(psy);
}

At the end of max77759_charger_probe(),
max77759_charger_external_power_changed() runs without holding
chg->psy->epc_sem, takes chg->sync_lock, and then calls
power_supply_get_property_from_supplier() -> power_supply_get_property(),
which takes down_read(&supplier_psy->epc_sem).  When the supplier later
notifies a change, power_supply_external_power_changed() holds
down_read(&chg->psy->epc_sem) and calls
max77759_charger_external_power_changed(), which takes chg->sync_lock:

CPU0                              CPU1
----                              ----
lock(&chg->sync_lock)
                                  down_read(&psy->epc_sem)
down_read(&psy->epc_sem)
                                  lock(&chg->sync_lock)

 *** DEADLOCK ***

CPU0: max77759_charger_probe() ->
      max77759_charger_external_power_changed() ->
      power_supply_get_property_from_supplier() ->
      power_supply_get_property()
CPU1: power_supply_changed_work() ->
      power_supply_external_power_changed() ->
      max77759_charger_external_power_changed()

In addition, even without the unlocked call in probe, calling
power_supply_get_property() on the supplier inside
.external_power_changed nests down_read(&supplier_psy->epc_sem) inside
down_read(&chg->psy->epc_sem), which lockdep rejects as recursive
same-class locking because down_read() is not annotated with
down_read_nested().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-max77759-c=
harger-fixes-v1-0-b364a0862d72@linaro.org?part=3D6
