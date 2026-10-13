Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8B327A10F
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 12:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894852; cv=none; b=WRD2nQQoBWbCyfCJRmfAf+mWFFr0a/qQ+PhHGvyFRUKbe42lDg+7z+VVPQYaGu+ff/B9AFzZE2vUfrNTskoD79TAXXasVuy72W8R3/VlUM+gHSxyy8w7HxjjIQjDqWRKvTdX7G1ZqwnkiOz7w5KPdR4YQFyVYScf62/cH0gw/oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894852; c=relaxed/simple;
	bh=dv8TDGHBD/VMA2oXSjPioL/lO/AvrIEDSpELndLQHtI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=aFlexY/F8EpTaD51F/I2uF0Z8I2ph2XiT8l43M4eG3aClpoAByQk+60CHwd7M38frBk46gu4BADMTtRbT7wWwgFUeUlPvhoz7NQ+FNfmWRvHhuxf0ETCZy1AoNzWt55V1Zn680oeHNfEXvt6RBz4USpI2o9rpmc+3qws+00ZoP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cp0Qw3fk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cp0Qw3fk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A616D1F000FF;
	Tue, 13 Oct 2026 12:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791894850;
	bh=25c6457EnPKSfsjepwkVHab75sTG+iHt5PmIob3npnE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cp0Qw3fkwyrHZE2u+blQVfdy8VbingJCTUYoMd73IF1Focx6xATQH+KNtpGtMpDSL
	 U4uJZTXqwtCM61Wgz1RhUXzLor0xCoaFYe08a0RQZD0a1ihi21LvddPuhKmI1N8FWQ
	 OaoRlGaS3pLDHbeY//2+hsDsnWQvGPHx5mpslpzO5CTXB+kbLEeZ9kRVRh+OuTHO6D
	 mG+BGLZFwdSx6MevEhTz0YwzDSIHOLVNVScBayTrS8iORvz7wrFpwSHsJmDsGMaM49
	 uwQoREHTsz526UwlmaCGoidATeSoeJQlkXJV0BEdWGJmEpugnyHvE+lcaOn2mZwjQy
	 x99g6zCaPl5Wg==
Message-ID: <sashiko-outbox-169717@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] MIPS: SGI-IP30: shut down cleanly on a power button
 press
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imre Kaloz" <kaloz@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013115820.13293-3-kaloz@kernel.org>
References: <20261013115820.13293-1-kaloz@kernel.org>
 <20261013115820.13293-3-kaloz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 12:34:10 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mips: ip30: concurrent ip30_machine_power_off() scrambles RTC I/O
- [High] mips: TOCTOU race with driver unbind leading to UAF in ip30_machin=
e_power_off
--

commit 01338bb2869999b0a3fdb7a5d240c7d0c419fb37
Author: Imre Kaloz <kaloz@kernel.org>

MIPS: SGI-IP30: shut down cleanly on a power button press

The power button raises a kickstart interrupt on the DS1687, and
rtc-ds1685 cuts power at once unless the platform supplies a
prepare_poweroff hook. Supply one that starts an orderly power-off,
cutting power directly on a second press or after 120 seconds.

> diff --git a/arch/mips/sgi-ip30/ip30-power.c b/arch/mips/sgi-ip30/ip30-po=
wer.c
> --- a/arch/mips/sgi-ip30/ip30-power.c
> +++ b/arch/mips/sgi-ip30/ip30-power.c
> @@ -52,6 +54,30 @@ static void ip30_machine_power_off(void)
>  	ds1685_rtc_poweroff(to_platform_device(dev));
>  }
> =20
> +#define IP30_POWERDOWN_TIMEOUT	120	/* seconds */
> +
> +static bool ip30_shutting_down;
> +
> +static void ip30_power_timeout(struct work_struct *work)
> +{
> +	ip30_machine_power_off();
> +}
> +
> +static DECLARE_DELAYED_WORK(ip30_power_work, ip30_power_timeout);
> +
> +/* Called by the RTC driver when the power button is pressed. */
> +void ip30_prepare_poweroff(void)
> +{
> +	/* A second press powers off at once. */
> +	if (ip30_shutting_down)
> +		ip30_machine_power_off();

[Severity: High]
Can concurrent execution of ip30_machine_power_off() happen here?

If ip30_prepare_poweroff() is called from a threaded IRQ handler on a second
button press concurrently with ip30_power_work firing or pm_power_off()
running on another CPU, could ip30_machine_power_off() execute on multiple
CPUs at once?

Since ip30_machine_power_off() and ds1685_rtc_poweroff() don't appear to ha=
ve
atomic guards or spinlocks to prevent concurrent execution, would this race
scramble the address and data writes to the RTC's indirect I/O registers and
cause the system to hang indefinitely instead of powering off?

> +
> +	/* Shut down through userspace, powering off anyway if it stalls. */
> +	ip30_shutting_down =3D true;
> +	orderly_poweroff(true);
> +	schedule_delayed_work(&ip30_power_work, IP30_POWERDOWN_TIMEOUT * HZ);

[Severity: High]
Does this 120-second delayed work introduce a use-after-free window?

If the rtc-ds1685 driver is unbound via sysfs or module unload during this
delay, ip30_power_timeout() will race against device_unbind_cleanup().

Because ip30_machine_power_off() checks dev_get_drvdata(dev) without
holding device_lock(dev):

arch/mips/sgi-ip30/ip30-power.c:ip30_machine_power_off() {
	...
	dev =3D bus_find_device_by_name(&platform_bus_type, NULL, "rtc-ds1685");
	if (!dev || !dev_get_drvdata(dev))
		return;
	...
	ds1685_rtc_poweroff(to_platform_device(dev));
}

Could a concurrent unbind trigger devres_release_all() and free the RTC
structure before ds1685_rtc_poweroff() runs, causing it to unconditionally
dereference a freed pointer or NULL pointer?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013115820.1329=
3-1-kaloz@kernel.org?part=3D2
