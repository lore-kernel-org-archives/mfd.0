Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237478;
	b=ki0Hqk8tnUzODhzLVJ7F3sTURNoJ80rOEZqYhTmaI8sZmTiUaxQwtKbyyNidnJlmlAkO
	 t3C2UbzzOPZ65hljDrAMFz3qg3cunaFIqh2YcEGNyerJ+56VyEczmc657Sbht0OEZXFIl
	 9QTRuI54wbmiUWS6AedD9XXAI2a11uK54g3rI7Y7+woqlZLIhhQckiF72XUDprE/SLDvT
	 YF7glUbUEvafEwg0OF0Nij81BhWoMHZ+S6EBVaKdGpqEgyoBeeK9cTaxgB7H/oY/0iI95
	 8MRUCRE25+q5KHK7I6sBfPLgHzgoRVoDkhyIy6Yf9+iAMdgYuMIQrJ6mcF9ytCHKhFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237478;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=512HRb/s0pdARgCLQJvvnv420H5G1kWlVJHa0RbPlxY=;
	b=libBIgbj+tvxuPsY/RIL4gw6DZC2gEvgNu91m4/q2WMW+5/rMNYvkOU59Wy08/2QI842
	 c5MElqdD/S4+rt+urNITgYvGVPBdkq/smqqbDTSanX//89sxFlH8tvNrChJvigsP760Y3
	 cOjpmAReYherAc8YooCs1T0XPI1ZOoJjpuZzDQ8n39R4D8HDjZglWgNV/bCQD8IFJaEw0
	 j9pDKsbVh1HdlQpkCerA9Wc2n/8K3y9vKxMaAJxfmPzZtNSYsC4iTw9mv7YyDonXf7J07
	 YgMMuNbSnRZBt799zgGtuBn6HxS0aDMzr0TkgxIKQS5vHe+sV2SgKPSiiIThVnGFWxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ins0Qdby;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AD8606A31C
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ins0Qdby
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67711F0089F;
	Mon,  9 Nov 2026 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794237477;
	bh=512HRb/s0pdARgCLQJvvnv420H5G1kWlVJHa0RbPlxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ins0QdbyDrfspcnT/DoOSigg4XlO+dCnctjBptbpqjNRbG3PJaTwPoQBuPQa/MBsL
	 GpGclilJ6AduMkp9aw3F9Xm9NbNhHUA77LaTAi/Ekz5e5w3VpCI+uno95zntt0GqFu
	 psmfwvXb4NksKhmdJgcwJtv8uufe8wt/egWCGP9kmIGQvX+Y2CdDCriJrI4qlUBYQV
	 AlO1ks/n44RGKQxjtSjapuPztxum37vyndjEJPRCpHjoK+zHFUWBgEqSubqTm3lA/O
	 gbfXCGJ1qBfgUIUTjwnsYiDdYpsORqFwMgjjbI3IM1zG3sIUxT57NiSUeJOkKmQvGX
	 pBUVUFin5uWkw==
Message-ID: <sashiko-outbox-205157@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 4/7] power: supply: rk817-charger: Resolve boot state
 of charge from coulomb counter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261109145833.1363319-5-macroalpha82@gmail.com>
References: <20261109145833.1363319-1-macroalpha82@gmail.com>
 <20261109145833.1363319-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 15:17:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] power: supply: rk817-charger: 0% OCV ignored in
  rk817_select_boot_soc()
- [Medium] power: supply: rk817-charger: uninitialized stack read on
  regmap failure
--

commit 81d76cf3fd44b4d0012b4edc42b6b53c11d35284
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: rk817-charger: Resolve boot state of charge from coulomb cou=
nter

This commit estimates the boot state of charge from the coulomb counter,
saved NVRAM value, and battery voltage, and periodically recalibrates the
gauge from rested open-circuit voltage readings.

> diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/=
rk817_charger.c
> index 8843871948b9c..fe2c949ac5a50 100644
> --- a/drivers/power/supply/rk817_charger.c
> +++ b/drivers/power/supply/rk817_charger.c
[ ... ]
> @@ -337,6 +346,42 @@ static int rk817_bat_calib_cap(struct rk817_charger =
*charger)
>  	return 0;
>  }
> =20
> +/* Calibrated microvolts from one of the gas gauge's 16 bit voltage regi=
sters. */
> +static int rk817_bat_voltage_uv(struct rk817_charger *charger, unsigned =
int reg)
> +{
> +	u8 bulk_reg[2];
> +
> +	regmap_bulk_read(charger->rk808->regmap, reg, bulk_reg, 2);
> +
> +	return (charger->voltage_k * get_unaligned_be16(bulk_reg)) +
> +		1000 * charger->voltage_b;
> +}

[Severity: Medium]
Can rk817_bat_voltage_uv() compute a voltage from uninitialized stack
memory when regmap_bulk_read() fails?

bulk_reg is not initialized and the return value of regmap_bulk_read() is
ignored.  If an I2C transfer fails, the uninitialized value is exposed via
charger->volt_avg_uv and fed into rk817_bat_ocv_recalibrate() and
rk817_select_boot_soc(), which can reprogram the hardware coulomb counter
and overwrite PMIC NVRAM with bogus state-of-charge values.  Similarly,
rk817_read_or_set_full_charge_on_boot() ignores the return values of
regmap_bulk_read() and regmap_read() before reading bulk_reg and off_cnt.

[ ... ]

> @@ -751,15 +795,88 @@ static int rk817_read_battery_nvram_values(struct r=
k817_charger *charger)
[ ... ]
> +static int rk817_select_boot_soc(struct rk817_charger *charger, int gaug=
e_soc,
> +				 int table_soc, int nvram_soc)
> +{
> +	int soc[3];
> +
> +	if (table_soc <=3D 0) {
> +		if (abs(gauge_soc - nvram_soc) >=3D 10000)
> +			return gauge_soc;
> +		return nvram_soc;
> +	}

[Severity: Medium]
Does checking table_soc <=3D 0 treat a valid 0% OCV lookup as a missing OCV
table?

power_supply_batinfo_ocv2cap() returns -EINVAL when no OCV table exists and
0 when bat_uv is at or below the 0% OCV entry.  When table_soc is 0 and
gauge_soc has drifted from nvram_soc by 10% or more, this branch discards
both the 0% OCV reading and nvram_soc and initializes the state of charge
and coulomb counter to the drifted gauge_soc instead of dropping the
outlier.  Should this check table_soc < 0, matching
rk817_bat_ocv_recalibrate()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109145833.1363=
319-1-macroalpha82@gmail.com?part=3D4
