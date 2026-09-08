Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E1458E2C0
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 17:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886982; cv=none; b=uL7WBHJxGH8XlrgEgSaJf5bhsi7Yr/stba5HO5lClx1F8NYiRCYrnRdVXzPiCA2dhtPbtNbAMX6KFIDsxThbPTaCBUq2jh8kGHkpGP2peYJFgTaFi9PJ7nbISV3OKv0UeckhuXvVS+WoRRmucRz9LYRrQjqqX4hNrUbQxvC7DnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886982; c=relaxed/simple;
	bh=BH4Ni2DbN1mGve54AF71Z2AA++XJS/SfUOizPm/KW/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LzZglNux4bO/Ib/C9GZ23PkLv0Gomgyo1uoRUrD/lAa5xY9WoR95QeopdKAc9s5ch8myGPTFK3B+c+eL7f4w8oN+LKBFLFMD0BKKsAJz+LXY5LALLNNvnU2/3cof0dlRZlmMknpHhBtFkupkw4cQuBI8rjgUgEq4i9SSPTHnwbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bodnTjAd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bodnTjAd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3561F00A3A;
	Tue,  8 Sep 2026 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788886980;
	bh=+TaAjsRZnXg0IqKd2chFU0aLLjAK/6XntrYR7xjvUUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bodnTjAd5cAnP8lqsMgv+NreX0Ly8GipDyd+l6k1LFrlyQszGEBd0BZumxzrcckFg
	 IbbrCrlNET+GHHdDcLVdt9mx3GR4Vd8UGeUevy9eFEwGrpvEv6d8Fu4Y1LIinVb5KD
	 sZJckUpGHrxEGDmXFh6g3x32ogEgxqMiOy1/7lSBs8g2vDGHi8EaakvqzKbPmZadBv
	 ys7uyySR04LtH3Lys9bdZMhGekHG6NKL1J1DipTMT93GhvXM9wrmvfEe6vgUfPI6kE
	 gBVLFUR36QGb9sclnEvcmILIFG+toVoyUHTSKGDhpKiIjx7EtV5p5i1cUrlYQmGnil
	 MZ7Ayrbemk0yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pwm: lp3943: Mark parent device's platform data as
 const
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260908165341.1423611-2-u.kleine-koenig@baylibre.com>
References: <20260908165341.1423611-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 17:02:59 +0000
Message-Id: <20260908170300.3E3561F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing NULL check for `pdata->pwms[hwpwm]` in `lp3943_pwm_request=
_map()` causes a kernel panic if a PWM channel is omitted in the device tre=
e.
- [High] Device tree property values for PWM outputs are unvalidated, leadi=
ng to out-of-bounds array reads and memory corruption.
--

commit cc9c1df7bd1a0efa270bec2c911d64bf2ee78fa8
Author: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

pwm: lp3943: Mark parent device's platform data as const

Platform data should never get modified by a driver. So add a respective
`const` which makes it explicit that the pwm-lp3943 driver indeed
doesn't modify platform data.

> diff --git a/drivers/pwm/pwm-lp3943.c b/drivers/pwm/pwm-lp3943.c
> index 10537e74be288..0fde89018d2a4 100644
> --- a/drivers/pwm/pwm-lp3943.c
> +++ b/drivers/pwm/pwm-lp3943.c
> @@ -21,7 +21,7 @@
> =20
>  struct lp3943_pwm {
>  	struct lp3943 *lp3943;
> -	struct lp3943_platform_data *pdata;
> +	const struct lp3943_platform_data *pdata;
>  	struct lp3943_pwm_map pwm_map[LP3943_NUM_PWMS];
>  };
> =20
> @@ -33,7 +33,7 @@ static inline struct lp3943_pwm *to_lp3943_pwm(struct p=
wm_chip *chip)
>  static struct lp3943_pwm_map *
>  lp3943_pwm_request_map(struct lp3943_pwm *lp3943_pwm, int hwpwm)
>  {
> -	struct lp3943_platform_data *pdata =3D lp3943_pwm->pdata;
> +	const struct lp3943_platform_data *pdata =3D lp3943_pwm->pdata;
>  	struct lp3943 *lp3943 =3D lp3943_pwm->lp3943;
>  	struct lp3943_pwm_map *pwm_map =3D &lp3943_pwm->pwm_map[hwpwm];
>  	int i, offset;

[Severity: High]
This isn't a bug introduced by this patch, but does lp3943_pwm_request_map()
need a NULL check for pdata->pwms[hwpwm]?

The lp3943_pwm_parse_dt() function allocates and populates pdata->pwms[i]
only if the respective ti,pwm0 or ti,pwm1 property is present in the
device tree. If a channel is omitted, the pointer remains NULL.

The driver registers the PWM chip with npwm =3D 2, exposing both channels
to the PWM subsystem regardless of the device tree configuration. If a
consumer requests the unconfigured channel, lp3943_pwm_request() is
invoked and lp3943_pwm_request_map() unconditionally dereferences the
pointer:

drivers/pwm/pwm-lp3943.c:lp3943_pwm_request_map() {
    ...
	pwm_map->output =3D pdata->pwms[hwpwm]->output;
	pwm_map->num_outputs =3D pdata->pwms[hwpwm]->num_outputs;
    ...
}

Can this lead to a kernel panic if a PWM channel is omitted in the device t=
ree?

[Severity: High]
This is a pre-existing issue, but is it possible for unvalidated device tree
property values for PWM outputs to lead to out-of-bounds array reads and
memory corruption?

In lp3943_pwm_parse_dt(), output pin mappings are read from the device
tree into the output array without validating that the values fall within
the valid output range (0 to 15):

drivers/pwm/pwm-lp3943.c:lp3943_pwm_parse_dt() {
    ...
		err =3D of_property_read_u32_array(node, name[i], output,
						 num_outputs);
    ...
}

In lp3943_pwm_request_map(), these unvalidated values are passed to
test_and_set_bit():

drivers/pwm/pwm-lp3943.c:lp3943_pwm_request_map() {
    ...
		/* Return an error if the pin is already assigned */
		if (test_and_set_bit(offset, &lp3943->pin_used))
    ...
}

An offset greater than the size of an unsigned long could corrupt adjacent
kernel memory. Additionally, in lp3943_pwm_set_mode(), the unvalidated
output values are used as indices into the 16-element lp3943->mux_cfg
array:

drivers/pwm/pwm-lp3943.c:lp3943_pwm_set_mode() {
    ...
		index =3D pwm_map->output[i];
		err =3D lp3943_update_bits(lp3943, mux[index].reg,
					 mux[index].mask,
					 val << mux[index].shift);
    ...
}

Could this result in out-of-bounds reads and undefined hardware behavior?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908165341.1423=
611-2-u.kleine-koenig@baylibre.com?part=3D1
