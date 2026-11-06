Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994575;
	b=APFR7aJBrwjPev/Wbt7LC4jNADfEuols1XNxyP+0LBF99v8HuV4IBV5aW17jWvk1J1EX
	 B/IZc9smAO3hVRUVpeLmT8aJgxwa6hVEJpupRvbPfyUa8287JGHJPFeoWPe8LZtOE5VoS
	 rrHuhiD8OtQHK+r/osl084Xm4/u/onTsVlVy+q7tEPQfF0Br3w28oXJ18PAwuDXjDwR1x
	 Dymm8RgfTNa8IW3kDULh2f5TS9KwiySwBxqNoLOCFUP83tORrqg2QekXgfsx4lyjKT+iu
	 PikYOm9y0jlQofwoopwZwzT+8G8lm5lz8YO2vDxnIllplCjBFODPmzNpibCU3sTCVWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994575;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tfylxQmuoohqjIDfrP9qUqJIWnHnjk3uwihdvP+tAzQ=;
	b=3Q7wlNMaw1kT931WCL2OIfP0YnTuN3rvrpULgr0RXWb+lP7Nm44C3tVgYH055tAmgoLO
	 qZt1wfsWLJTECkYlb8ijCXTuQ6PkFay6ZxVvaN8fc1jU+qttbP2merGJWEHYebKglUJHS
	 RtI/fyP5dyTCG6VnvVilmEAoc6t0XYH9oHF+ldm0WRdCGmiszMrUP6ZGnr19DIlkMJ9fw
	 4J1+fOtQGkjO6qWAH9NJ3/JWbc76jag520DgU9K3Cz4DrXmiPtgmkGPbRZSaYaqS5L7zB
	 +gItjFXMfD3N4LSiR1lkq5/c1kW0mCjPWwrvIX7LqYLJK0MaP4W6jW1pWhQBR9XMfYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hugG3h/m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A622606A32D
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 19:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hugG3h/m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9551F008AB;
	Fri,  6 Nov 2026 19:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793994575;
	bh=tfylxQmuoohqjIDfrP9qUqJIWnHnjk3uwihdvP+tAzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hugG3h/mZgs7++YxMJbHZSlofi8porX/8HFOEj1588MnxasBWBx771XnCtHwUq/gW
	 C2IbUrveBLKisbSi4hboZk9L183AAb/3HAKx43ufPUsgMvpKVO43NMnvSAjirrVLFV
	 2kSReB10csm69mJFRp51rGvd76KDig2ZVicmfD2FjH/QQ36fg104R+4aBA1xTkD88J
	 Jc10nddQY0N7ZEEBWIwMH8ndbgXOB2bfUMzM0u7HKoKKobttjYd1vGXdFombQOG1pI
	 DX7GGxJ/6p3/ty+reir/pJMTjO6MkOAiVm+RG7l4YhDldhTFN5UnYotPTEtLmmXbr8
	 dJM+t/3GIK/ig==
Message-ID: <sashiko-outbox-202175@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] iio: adc: add cros_ec_pwrmon driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Balint" <dbalint@google.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261106193129.43493-3-dbalint@google.com>
References: <20261106193129.43493-1-dbalint@google.com>
 <20261106193129.43493-3-dbalint@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 19:49:34 +0000
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
- [Medium] iio: adc: cros_ec_pwrmon: non-standard sysfs table ABI in
  energy_value_show()
- [Medium] iio: adc: cros_ec_pwrmon: premature wakeup in
  cros_ec_pwrmon_notify()
- [Medium] iio: adc: cros_ec_pwrmon: energy loss and time skew in
  energy_value_show()
--

commit 9eba526765275d37885c463963dacce7dc7badae
Author: Daniel Balint <dbalint@google.com>

iio: adc: add cros_ec_pwrmon driver

This commit adds the ChromeOS EC On-Device Power Monitoring (ODPM) driver
to read onboard power-monitoring ADCs via EC_CMD_PWRMON host commands and
EC_MKBP_EVENT_PWRMON events, exposing accumulated per-rail energy through
an energy_value sysfs attribute.

> diff --git a/drivers/iio/adc/cros_ec_pwrmon.c b/drivers/iio/adc/cros_ec_p=
wrmon.c
> new file mode 100644
> index 0000000000000..795b5f2b2a2ce
> --- /dev/null
> +++ b/drivers/iio/adc/cros_ec_pwrmon.c

[ ... ]

> +static int cros_ec_pwrmon_notify(struct notifier_block *nb,
> +				 unsigned long queued_during_suspend,
> +				 void *data)
> +{
> +	struct cros_ec_pwrmon_state *st =3D
> +		container_of(nb, struct cros_ec_pwrmon_state, notifier);
> +	struct cros_ec_device *ec_dev =3D st->ec;
> +	s64 val;
> +	u8 ch;
> +
> +	if (ec_dev->event_data.event_type !=3D EC_MKBP_EVENT_PWRMON)
> +		return NOTIFY_DONE;
> +
> +	ch =3D ec_dev->event_data.data.pwrmon_data.channel_id;
> +	val =3D get_unaligned_le64(&ec_dev->event_data.data.pwrmon_data.value);
> +
> +	scoped_guard(spinlock, &st->event_lock) {
> +		if (!st->collecting)
> +			return NOTIFY_OK;
> +
> +		if (ch < st->num_channels) {
> +			st->results[ch].value =3D val;
> +			st->results[ch].valid =3D true;
> +		}
> +
> +		WRITE_ONCE(st->results_received, st->results_received + 1);
> +	}

[Severity: Medium]
Can cros_ec_pwrmon_notify() wake wait_event_timeout() in energy_value_show()
before all valid channels have reported?

st->results_received is incremented unconditionally even when
ch >=3D st->num_channels (which happens if the EC has more than
PWRMON_MAX_CHANNELS channels after cros_ec_pwrmon_probe() clamps
st->num_channels) or when st->results[ch].valid is already true.  In
addition, energy_value_show() sets st->collecting =3D true before sending
EC_PWRMON_LATCH, so a late MKBP event from a previous timed-out latch will
also increment st->results_received and cause wait_event_timeout() to finish
early while some channels in st->results[] are still invalid.

Only incrementing st->results_received when ch < st->num_channels and
!st->results[ch].valid would ensure each counted event corresponds to a
distinct valid channel.

> +
> +	wake_up(&st->wq);
> +
> +	return NOTIFY_OK;
> +}
> +
> +/*
> + * Expose ODPM results in the form of accumulated energy
> + * through the energy_value sysfs node.
> + * Format requirement:
> + * t=3D<Measurement timestamp, ms>
> + * CH<N>(T=3D<Duration, ms>)[<Schematic name>], <Accumulated Energy, uWs>
> + */
> +static ssize_t energy_value_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> +	struct cros_ec_pwrmon_state *st =3D iio_priv(indio_dev);
> +	struct ec_params_pwrmon *params;
> +	u64 current_time_ms;
> +	s64 delta_uws;
> +	u32 duration_ms;

[ ... ]

> +	/* Timestamp of snapshot taken. */
> +	current_time_ms =3D ktime_to_ms(ktime_get_boottime());
> +	len +=3D sysfs_emit_at(buf, len, "t=3D%llu\n", current_time_ms);
> +
> +	duration_ms =3D current_time_ms - st->last_time_ms;
> +
> +	for (i =3D 0; i < st->num_channels; i++) {
> +		if (!st->results[i].valid) {
> +			dev_warn(dev, "Missing data for channel %d\n", i);
> +			continue;
> +		}
> +
> +		delta_uws =3D div_s64(st->results[i].value * duration_ms,
> +				    MSEC_PER_SEC);
> +		if (delta_uws > 0)
> +			st->accumulated_energy[i] +=3D delta_uws;
> +
> +		len +=3D sysfs_emit_at(buf, len, "CH%d(T=3D%u)[%s], %llu\n",
> +				     i, duration_ms, st->channel_names[i],
> +				     st->accumulated_energy[i]);
> +	}
> +
> +	st->last_time_ms =3D current_time_ms;

[Severity: Medium]
Does advancing a single shared st->last_time_ms unconditionally at the end
of energy_value_show() permanently drop accumulated energy for any channel
whose MKBP event was missed?  When !st->results[i].valid is taken, that
channel is skipped, but st->last_time_ms is still updated to
current_time_ms, so the next read only integrates that channel from the
failed read's timestamp rather than the last time it was accumulated.

Also, sampling current_time_ms after wait_event_timeout() rather than when
EC_PWRMON_LATCH completes folds the MKBP delivery delay (up to 1000 ms)
into duration_ms.  In addition, duration_ms is a u32, which truncates the
64-bit difference current_time_ms - st->last_time_ms if more than ~49.7 days
elapse between reads, and st->results[i].value * duration_ms can overflow
s64 before div_s64().

> +
> +	return len;
> +}
> +
> +static IIO_DEVICE_ATTR(energy_value, 0444, energy_value_show, NULL, 0);

[Severity: Medium]
Should this driver expose standard IIO channels (such as IIO_ENERGY with
in_energyY_raw or in_energyY_input and in_energyY_label) instead of
formatting a multi-line text table into a custom energy_value sysfs
attribute on a channel-less iio_dev?

Beyond violating the sysfs one-value-per-file rule and standard IIO ABI,
each formatted channel line can be up to 74 bytes when channel_names[i] is
31 bytes, so with up to PWRMON_MAX_CHANNELS (64) channels the output can
reach ~4750 bytes and be silently truncated at PAGE_SIZE by sysfs_emit_at().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106193129.4349=
3-1-dbalint@google.com?part=3D2
