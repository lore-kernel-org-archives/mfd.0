Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691892;
	b=SaQWrnMlrLK7MdsIGaLkj7b8dAWGnxYFiOyoNpqv4/sOXkTquwILrMRx/GyP/XGx44Ab
	 WTeCRjS+7Ebyq4ytNmPodx13tplm2j1q4Cqf/oInB1Lb/SkbBXhDPkj6newPW1XyVE/UB
	 SdyfGhpTBrI6GiRimWTZhlRlF7dzFxO7nB4lqCr4Ii3EpajNrk2+ncXcjdLB6YKR6w+1T
	 n+u5gAmjFrfRGsUo5Ud9ZbAOeuhE+3wtTeif7KdD0vVAlVMMD0b7beagQASoyueWNMQ58
	 YRJLa1yrJqL3lifwsny2kCZnDR1k1jxaulchTnOSi//FvsTKglBTH5YiUJF2KgS8FuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691892;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RHBB9PLTid0nZY8Jd/DOldagdbWGdc3nPHv+Fxe/n2I=;
	b=IZ84LVpwjr47V1vO0K9xOrLQWiUkVAmJxxSTuOAvCID+8fJem+E6h14wwYzhvO6tE3mN
	 iZFBV61w0T7e9i4l0OGZpH3+EDabDIv0ZMLrD3U7Nw/PBmsnb4iiZ4sL3flQKh4C2lXwC
	 nPbC4dS6hDWcT5oBkSsm4adTNCGpmjHZPghXSnaT5AWlyookG7DAsAmkVC5kjn1M44ZkA
	 BTtz+fsVm5KrCFZxCWVDp9bQxfQvAzUkTXikBQ+utrqn45hG6dU8QUTJ6iWjBiOlngpie
	 ZZX87qjJ0n8PZoRLhpRMGDl3Gz1VS4+bltlMNwCZtCKOgQG5Zh1G5gpi8ZI69S3J1gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXLxw9QM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943AA606A321;
	Thu, 26 Nov 2026 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXLxw9QM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505C91F000D3;
	Thu, 26 Nov 2026 11:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691891;
	bh=RHBB9PLTid0nZY8Jd/DOldagdbWGdc3nPHv+Fxe/n2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WXLxw9QMi9rbwlrkOmBA8tNlBlaQAH9N5E6Gj4FD1ADr/DW5vqW6DlHwsl6EkDyG7
	 yk2q1VVuKIf7RYviGe6Nr8EKdSp/gDChdgOii8SzMwHMe9gjToKf8eImWXxd4nOXL1
	 J0h/fyhXxMDn4p/Ts23roJ2zOCNym5ynSccT4g1kE7/0RO8fxX2abyufOrQwxCodct
	 2y19RisjF/x331koMjTd0Xo1/IqLCTgfrtw2fAuUKhpPCz+7V/BlolSFkGGQXQEiyB
	 WTZjveSxiTI1tIS1ynNtZkoeVQ5hXAhiT7Frkn1Z/vbOC+U9W2yyQSpbvwAnGkiEqD
	 38uUsxplb8muQ==
Message-ID: <sashiko-outbox-235359@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] power: supply: qcom_smbx: Add PM4125 SMBLite
 charger support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raj Aryan" <raj.aryan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261126-smblite-charger-for-pm4125-v2-2-20656509518b@oss.qualcomm.com>
References: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
 <20261126-smblite-charger-for-pm4125-v2-2-20656509518b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 11:18:10 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] power: supply: qcom_smbx: wrong CHARGE_TYPE mapping in
  smb_get_property()
- [Medium] power: supply: qcom_smbx: watchdog left armed on fail/unbind
  and bad rollback
- [Low] power: supply: qcom_smbx: write-only fields and unused includes
  in smb_probe()
--

commit 2afb04355c7bbe435f2e20cc7c837c7b9cdd0e1c
Author: Raj Aryan <raj.aryan@oss.qualcomm.com>

power: supply: qcom_smbx: Add PM4125 SMBLite charger support

This commit extends the qcom_smbx charger driver to support the SMBLite
charger IP found in the PM4125 PMIC alongside the existing SMB2 support.

> diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom=
_smbx.c
> index c6188c915703a..d23e5ec858586 100644
> --- a/drivers/power/supply/qcom_smbx.c
> +++ b/drivers/power/supply/qcom_smbx.c

[ ... ]

> @@ -680,6 +997,30 @@ static int smb_get_property(struct power_supply *psy,
>  		return smb_get_prop_health(chip, &val->intval);
>  	case POWER_SUPPLY_PROP_USB_TYPE:
>  		return smb_apsd_get_charger_type(chip, &val->intval);
> +	case POWER_SUPPLY_PROP_CHARGE_TYPE: {
> +		int status, rc;
> +
> +		if (chip->type !=3D SMBLITE)
> +			return -EOPNOTSUPP;
> +
> +		rc =3D smb_get_prop_status(chip, &status);
> +		if (rc < 0)
> +			return rc;
> +
> +		switch (status) {
> +		case POWER_SUPPLY_STATUS_FULL:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_NONE;
> +			break;
> +		case POWER_SUPPLY_STATUS_CHARGING:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +			break;
> +		default:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
> +			break;
> +		}
> +
> +		return 0;
> +	}
>  	default:
>  		dev_err(chip->dev, "invalid property: %d\n", psp);
>  		return -EINVAL;

[Severity: Medium]
Should POWER_SUPPLY_PROP_CHARGE_TYPE inspect the hardware charge phase in
SMBLITE_BATTERY_CHARGER_STATUS_1 directly instead of deriving the value
from smb_get_prop_status()?

When USB is unplugged or charging is inhibited, paused, disabled, or
stopped due to battery overvoltage, smb_get_prop_status() returns
POWER_SUPPLY_STATUS_DISCHARGING or POWER_SUPPLY_STATUS_NOT_CHARGING, which
falls into the default case here and reports
POWER_SUPPLY_CHARGE_TYPE_UNKNOWN instead of POWER_SUPPLY_CHARGE_TYPE_NONE.
Because smb_get_prop_status() also folds SMBLITE_TRICKLE_CHARGE,
SMBLITE_PRE_CHARGE, SMBLITE_FULLON_CHARGE, and SMBLITE_TAPER_CHARGE into
POWER_SUPPLY_STATUS_CHARGING, this never reports
POWER_SUPPLY_CHARGE_TYPE_TRICKLE or POWER_SUPPLY_CHARGE_TYPE_FAST.

[ ... ]

> @@ -904,37 +1464,216 @@ static const struct smb_init_register smb_init_se=
q[] =3D {
> +	/*
> +	 * Enable watchdog: WDOG_TIMER_EN_ON_PLUGIN + BARK_WDOG_INT_EN
> +	 * + BITE_WDOG_DISABLE_CHARGING (misc_base + 0x58)
> +	 * Matches downstream WD_CFG_REG enable sequence.
> +	 */
> +	{ .addr =3D SMBLITE_MISC_BASE + SMBLITE_WD_CFG,
> +	  .mask =3D SMBLITE_WDOG_TIMER_EN_BIT | SMBLITE_WDOG_TIMER_EN_ON_PLUGIN=
_BIT |
> +		  SMBLITE_BARK_WDOG_INT_EN_BIT |
> +		  SMBLITE_BITE_WDOG_DISABLE_CHARGING_CFG_BIT,
> +	  .val =3D SMBLITE_WDOG_TIMER_EN_ON_PLUGIN_BIT |
> +		  SMBLITE_BARK_WDOG_INT_EN_BIT |
> +		  SMBLITE_BITE_WDOG_DISABLE_CHARGING_CFG_BIT },

[ ... ]

> -static void smb_restore_charge_enable(void *data)
> +static void smb_restore_charge_state(void *data)
>  {
>  	struct smb_chip *chip =3D data;
> +	u16 reg;
> +	u8 charge_enable;
>  	int rc;
> =20
> -	rc =3D regmap_update_bits(chip->regmap,
> -				chip->base + CHARGING_ENABLE_CMD,
> +	if (chip->type =3D=3D SMBLITE)
> +		reg =3D SMBLITE_CHGR_BASE + SMBLITE_CHARGING_ENABLE_CMD;
> +	else
> +		reg =3D chip->base + CHARGING_ENABLE_CMD;
> +
> +	/* Keep SMBLite charging disabled if probe fails partway through setup.=
 */
> +	charge_enable =3D chip->type =3D=3D SMBLITE ? 0 : chip->initial_charge_=
enable;
> +	rc =3D regmap_update_bits(chip->regmap, reg,
>  				CHARGING_ENABLE_CMD_BIT,
> -				chip->initial_charge_enable);
> +				charge_enable);
> +	if (rc < 0)
> +		dev_err(chip->dev, "Couldn't set probe-failure charging state: %d\n",
> +			rc);
> +}

[Severity: Medium]
Does enabling SMBLITE_WD_CFG in smblite_init_seq leave the hardware
watchdog armed when smb_probe() fails after smb_init_hw() or when the
driver is later unbound?

Once SMBLITE_WDOG_TIMER_EN_ON_PLUGIN_BIT and
SMBLITE_BITE_WDOG_DISABLE_CHARGING_CFG_BIT are set, the hardware expects
smb_handle_wdog_bark() to pet SMBLITE_BARK_BITE_WDOG_PET every 16 seconds;
if probe fails or the driver is detached, no handler services the bark IRQ
and the bite timer disables charging in hardware 24 seconds after USB is
plugged in.  In addition, smb_probe() saves chip->initial_charge_enable
for SMBLite before disabling charging for setup, but
smb_restore_charge_state() ignores it and unconditionally writes 0 on
probe failure or deferral.

[ ... ]

> @@ -973,45 +1713,89 @@ static int smb_probe(struct platform_device *pdev)
>  	chip->dev =3D &pdev->dev;
> -	chip->name =3D pdev->name;
> +
> +	pmic_name =3D device_get_match_data(&pdev->dev);
> +	if (!pmic_name)
> +		return -EINVAL;
> +	chip->name =3D pmic_name;
> +
> +	if (strcmp(pmic_name, "pm4125") =3D=3D 0) {
> +		chip->type        =3D SMBLITE;
> +		chip->icl_step_ua =3D SMBLITE_ICL_STEP_UA;
> +		chip->icl_max_ua  =3D SMBLITE_ICL_MAX_UA;
> +		/* Use the charger peripheral as the base for SMBLite accesses. */
> +		chip->base =3D SMBLITE_CHGR_BASE;
> +	} else {

[Severity: Low]
This isn't a bug, but several additions in this patch appear to be unused:
chip->base is assigned SMBLITE_CHGR_BASE here without reading the DT reg
property even though all SMBLite accesses use the SMBLITE_*_BASE constants
directly, chip->charge_status and chip->ldo_mode are written but never
read to drive any behaviour, smblite_init_hw_specific() is a redundant
wrapper around smblite_detect_ldo_mode(), and linux/regulator/consumer.h
is included without any regulator consumer calls.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-smblite-ch=
arger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com?part=3D2
