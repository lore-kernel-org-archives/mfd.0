Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102086;
	b=shwoNUqr+JGYKyvz0OrAJzjylCXmHYJXsdg5O67/hUoIqjm32oWl4iVvympJBUNB8I5E
	 53pE/r9tgFvW08N32FpGFxiy+ldsBfdJr6xj10NMdeNjqB3Zc16q1hseU9z6XUOleOdBO
	 w4fA4eYAO+OmNgDV9J0Bw66ev+E6quDz0ziZW3yhV68Tx/R3I77LCWUxKiASSSjTx7RSW
	 LJqWmW5+xwbAH0IIB7MRjBF9BOAnLEl2WAx25AswM/qWcqfdwAL6dIH7yqCe6/yhfriRd
	 EbqRHbv7nUf/5leZGvzIh6PlZ9mgxPT9ZQsl3SlXrB9K6Z9HH7TD+1vp89ZjS5T7qIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102086;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Meqw/TKAdwfGEXIZnKIzyJqbm+wkOLMMm8kvKr4tD6M=;
	b=arsqMhsbZPZhAoEFNdVh+Q+fg4B6qlXGxBIf+x+r/vnoAhDKXPixW/84xaWxdFuycA2y
	 KZ2HaraapHu5UhYpUu0DJGqt29dxQufV+Mv4lRBqt4HRtHGFi3pmq1gjJ0Az8MC5dkyR0
	 8+mYMzDwhtDzs5uzR+qr2qHg+o783nSunpcAYafqP5rJaMHVFs3pEtORVB9KdiH/oSsbB
	 oEjevy3lFFXXBAhYYhz8C/RCeJioFFHWj5lU8YSIv6g0ioFDCUXVisb/YDnyQXkcq0X6w
	 lz5up9woUauc73emvVLCKkCJXRJKLSCG1XHRr3ifbcRQwYiFiYBzhqFmCp5c6zKYRNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=imwXxcGH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE4606A31A;
	Tue, 27 Oct 2026 11:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=imwXxcGH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0EA1F01828;
	Tue, 27 Oct 2026 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102086;
	bh=Meqw/TKAdwfGEXIZnKIzyJqbm+wkOLMMm8kvKr4tD6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=imwXxcGHHmTMpmO/ZwbWqLevPFc0pAzmmvIjPeyfog6G14js+nzY/czGviadi1c3k
	 wyob1h75J7pnC3t7/Uie7Kvub3YmoPaDzcNb0X3T1nvCwu0gVaWeaW2MSIZGh9E5zD
	 URqm20aAWkUxwH+djlDvy3/x9nWZiM3bj5uRIAERHDFUxOpO7bjPzMFgFd9Wv/beHE
	 W0tWDYIp41+ow1savgdhuTlbow11vedIkEwP0gBUTyFCE4ug6NPXI8NhnIf0fgnCgF
	 EpcSxeT4RKko2Hlh/6fHEam61ymsqRYhDMPNRxNe4qZ23EO+XASnkgdRVlngJHvgDe
	 4BgUnxaN7knjA==
Message-ID: <sashiko-outbox-186485@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] mfd: max8907: Convert to use device managed
 poweroff handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261027114634.79706-5-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
 <20261027114634.79706-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:54:45 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mfd: max8907: max8907_i2c_probe() drops maxim,system-power-control=
ler check
--

commit 5deb6448298f2829c11e1c8af86067bd08a79d7f
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: max8907: Convert to use device managed poweroff handler

This commit replaces the global pm_power_off assignment in the max8907
MFD driver with devm_register_power_off_handler().

> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index 2a38e00a10c3b..e282dd82ece69 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c

[ ... ]

> @@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
>  	struct device *dev =3D &i2c->dev;
>  	struct max8907 *max8907;
>  	int ret;
> -	bool pm_off =3D of_property_read_bool(dev->of_node,
> -					"maxim,system-power-controller");
> =20
>  	max8907 =3D devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
>  	if (!max8907)
> @@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
> =20
> -	if (pm_off && !pm_power_off) {
> -		max8907_pm_off =3D max8907;
> -		pm_power_off =3D max8907_power_off;
> +	if (of_device_is_system_power_controller(dev->of_node)) {
> +		ret =3D devm_register_power_off_handler(dev, max8907_power_off, max890=
7);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register power-off handler\=
n");
>  	}

[Severity: High]
Does replacing the maxim,system-power-controller property check with only
of_device_is_system_power_controller() break system power-off on existing
DTBs?

In include/linux/of.h, of_device_is_system_power_controller() only checks
for the unprefixed property:

static inline bool of_device_is_system_power_controller(const struct device=
_node *np)
{
	return of_property_read_bool(np, "system-power-controller");
}

In Documentation/devicetree/bindings/regulator/maxim,max8907.yaml (added in
commit c254fcc966ae), maxim,system-power-controller is still documented as a
deprecated property for backward compatibility alongside
system-power-controller:

  maxim,system-power-controller:
    type: boolean
    deprecated: true
    description:
      Telling whether or not this PMIC is controlling the system power.

  system-power-controller: true

Should max8907_i2c_probe() check both
of_device_is_system_power_controller(dev->of_node) and
of_property_read_bool(dev->of_node, "maxim,system-power-controller") so
existing DTBs using the vendor-prefixed property continue to register the
power-off handler?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027114634.7970=
6-1-clamor95@gmail.com?part=3D4
