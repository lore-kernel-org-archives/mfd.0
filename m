Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DFC41E6DC;
	Thu, 15 Oct 2026 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057191; cv=none; b=c2lqpMIMGNIhS93yULpqU113iDHtk3njM8WkYZ0cKSjL/9UV7GfBnb5DuPRUwnp+XNv/G7It2cyjx6uhlLaIfFUKxpvKTIPoTufKTqfutvO99m1IHjiY2esjo/Uv1vUu1GvcrNBqj9kmG818vGPSLx8MzUlP+sip7CN/0WsKF4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057191; c=relaxed/simple;
	bh=0OIzKZa4/mS1Keh9uEYZb3Ny5d+oD8yFyCka8xNUFgI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Q4J4GHrDwvmx/Trxq/qYBmXs1cHtjw51f6m1QMVg9Y8v6SzhsTnidJTntBKbHeZA2eS4IfagpcOZSmfa8tFuw2ABFmWPha8cmj/8SfH4+AaugqFtJGe4qCY0+aCn/J8CAdjuACkZxjDpHV8dSya3KCorHULs74F1u01KPn6Jz/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+LZI6tR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+LZI6tR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4861F000C4;
	Thu, 15 Oct 2026 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057190;
	bh=85/+QU9eLSJ2r9nsHOiRQQg3IsAYbRr1Bj6NxNpHDAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V+LZI6tR+wU5JhUVot1o3ABQB6BJ97KTi8hPGEErmHoMck/krvjF7uIKxI38O9zSn
	 ShZROyd9VhaJtZxFF9eTg2grewxfAhWtzmJbTFblpgPKXgfrXDHXzSupsrm6isZKm7
	 cA8VxcQx6nKs4RdE0d8hteW1frC6TxLpAlzazZSHnv2GK5CCtjaLOANRlmTITHV3K7
	 22+nR5iPlb+DYNBKTfdH403Ib7akJN27bZmlKr/mVpNyG3lWRXrYrMz8TDT/bqrX3f
	 Lmcg1HTw7IiqH/ytBVj52A+qPUvrXQbuH5JBd/dOIIWtLLrU64+YX89Mr8pJ7/g83X
	 B6w37b5DnOFRQ==
Message-ID: <sashiko-outbox-172584@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/9] arm64: dts: qcom: pm8150l: add LCDB regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261015-sm8150-display-card-v1-6-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-6-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:39:49 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] regulator: qcom-lcdb: deadlock in qcom_lcdb_handle_sc() during not=
ifier call
- [Medium] regulator: qcom-lcdb: hardware state desync on write failure in =
set_voltage_sel()
- [Medium] regulator: qcom-lcdb: state desync breaking subsequent enables a=
fter short-circuit
--

commit 4cf3328d99c41fa55695e4085137c0f502bbc641
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

arm64: dts: qcom: pm8150l: add LCDB regulators

This commit describes the LCDB block for the LCD bias rails in the pm8150l
device tree, enabling the qcom-lcdb-regulator driver on this hardware.

> diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/=
qcom/pm8150l.dtsi
> index 3911d6d0d2e28..f54ddb6f7946f 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
> @@ -141,5 +141,23 @@ pm8150l_wled: leds@d800 {
> =20
>  			status =3D "disabled";
>  		};
> +
> +		pm8150l_lcdb: lcdb@ec00 {
> +			compatible =3D "qcom,pm8150l-lcdb";

[Severity: High]
Can this result in a deadlock during a failure notifier call?

When the LCD bias short-circuits, qcom_lcdb_handle_sc() takes lcdb->lock
and makes a blocking notifier call:

drivers/regulator/qcom-lcdb-regulator.c:qcom_lcdb_handle_sc() {
    ...
    guard(mutex)(&lcdb->lock);
    ...
    for (i =3D 0; i < LCDB_NUM_RAILS; i++)
        regulator_notifier_call_chain(lcdb->rdev[i],
                                      REGULATOR_EVENT_FAIL, NULL);
    ...
}

Consumers commonly react to REGULATOR_EVENT_FAIL by invoking
regulator_disable(), which invokes qcom_lcdb_disable(). That also attempts
to acquire lcdb->lock:

drivers/regulator/qcom-lcdb-regulator.c:qcom_lcdb_disable() {
    ...
    guard(mutex)(&lcdb->lock);
    ...
}

Will this cause a self-deadlock since the lock is already held by the notif=
ier
caller?

[Severity: Medium]
Can a hardware update failure result in a desync between the driver's cached
voltage state and the actual hardware state?

When changing the voltage, the internal state lcdb->uV is eagerly updated
before writing to the hardware:

drivers/regulator/qcom-lcdb-regulator.c:qcom_lcdb_set_voltage_sel() {
    ...
    lcdb->uV[rdev_get_id(rdev)] =3D qcom_lcdb_sel_to_uV(sel);

    return qcom_lcdb_write_voltages(lcdb, lcdb->uV[LCDB_LDO],
                                    lcdb->uV[LCDB_NCP]);
}

If qcom_lcdb_write_voltages() fails and returns an error, the cached state =
in
lcdb->uV isn't rolled back.

Since future operations rely on both cached voltages to compute the boost
voltage (bst_uV), could an unapplied lower voltage cache cause the driver to
calculate a boost voltage lower than physically required, leading to a
regulator collapse?

[Severity: Medium]
Does this code silently break subsequent regulator enables after a short ci=
rcuit
recovery fails?

In qcom_lcdb_handle_sc(), the hardware is forced off by
qcom_lcdb_module_disable(), and then it attempts to recover:

drivers/regulator/qcom-lcdb-regulator.c:qcom_lcdb_handle_sc() {
    ...
    if (qcom_lcdb_module_enable(lcdb))
        dev_err(lcdb->dev, "failed to recover from a short circuit\n");
}

If qcom_lcdb_module_enable(lcdb) fails, it emits an error message and retur=
ns,
but leaves lcdb->enabled_mask untouched and non-zero.

If a consumer later tries to re-enable the regulator:

drivers/regulator/qcom-lcdb-regulator.c:qcom_lcdb_enable() {
    ...
    if (lcdb->enabled_mask)
        return 0;
   =20
    lcdb->enabled_mask |=3D BIT(rdev_get_id(rdev));

    return qcom_lcdb_module_enable(lcdb);
}

Since lcdb->enabled_mask is still non-zero, will qcom_lcdb_enable() silently
return success without actually enabling the hardware?

> +			reg =3D <0xec00>;
> +			interrupts =3D <0x5 0xec 0x1 IRQ_TYPE_EDGE_RISING>;
> +
> +			status =3D "disabled";
> +
> +			pm8150l_lcdb_ldo: ldo {
> +				regulator-min-microvolt =3D <4000000>;
> +				regulator-max-microvolt =3D <6000000>;
> +			};
> +
> +			pm8150l_lcdb_ncp: ncp {
> +				regulator-min-microvolt =3D <4000000>;
> +				regulator-max-microvolt =3D <6000000>;
> +			};
> +		};
>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-sm8150-dis=
play-card-v1-0-5c14928cef29@oss.qualcomm.com?part=3D6
