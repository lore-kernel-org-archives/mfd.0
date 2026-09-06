Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31738396567
	for <mfd@lists.linux.dev>; Sun,  6 Sep 2026 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788694289; cv=none; b=ANkmPYPUIsb+AC0tp1tlOnu3O8UuQb2Qf7hoIHTX4DyTM+5w+qMgXfijJOEACJsvaauJXVsRH3u7SF/GPtwvBPHlAFc2YRFbOg1HyvlyEUBSJvOCnYBToAbrd+vCSAvKZ2AKEJgcuo9vya5URAPkUqhgq7dbuGrI911KZ+g+zis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788694289; c=relaxed/simple;
	bh=lGobi/n409cPGNse1IiRHtC3+/FLSguo30p5rQU2LZk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iUgr+QQh2i+jJUk6OoV7qIsUoBGUyH25qmeXUCjwmZJkOay6Yj7u9YyMpNotpADxY9me2pI0NgR+3/LBvT70G+abA8X+4jjMYBp4A1uIB9akSKbOBfAGWE2Zn5PFhGnYOobH7GWokyk/OUbafmL5qk+o5p2pW45vfKLmGtSiBOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOW0bu74; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOW0bu74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A601F00A3A;
	Sun,  6 Sep 2026 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788694287;
	bh=9PTY5N+Dj7urqnWHVtzdFZ7x+pHt+ywW6aPnPfG6Eac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nOW0bu74Zs4pjPW+QUGrIE7zB25BUGUQvmO2LtFUqEAMpZraJ7Wk//rwRvcj1Gw4u
	 NLYORGZzBFzfkZzKY9kY5iTWRBlrW/XHH+V3gaCyW4jTYBQkrOWohku4e5UVArTVK/
	 baH0FKOuBzfgv17SP81Mjq9fq4k+gdQGD0mScElHrbjBvH9Cp7OzAMJRRAWny26Wt0
	 xqGsoIL5UxwV1WBWpI9W8OZ3WQ9nlfi9QlTgVKclBTV+E+invFJMNJKdwR/XoTKOSQ
	 kVmW7d9OeMEkMR0yBagoIe9cXuOngYlTUg1k3udjnKgEGmj8twbD3aWOPYYaCaqDtH
	 U2WhvzvSbzQ6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pwm: lp3943: validate DT output indices in
 lp3943_pwm_parse_dt()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manush Prajwal" <manushprajwal555@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <6a9d4c6b.79b5ea6e.147aa1.5883@mx.google.com>
References: <6a9d4c6b.79b5ea6e.147aa1.5883@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 11:31:27 +0000
Message-Id: <20260906113127.93A601F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The newly added bounds check for device tree output indices is inc=
omplete because it performs a signed comparison. Negative values can bypass=
 the check, leading to out-of-bounds memory accesses.

Pre-existing issues:
- [High] Missing NULL check on `pdata->pwms[hwpwm]` leads to a crash if a p=
artially configured PWM chip is requested.
--

commit 6bf884f857d8ed9b87f551fe2b3bdb8a985eae4f
Author: Manush Prajwal <manushprajwal555@gmail.com>

pwm: lp3943: validate DT output indices in lp3943_pwm_parse_dt()

This commit adds a bounds check in lp3943_pwm_parse_dt() to validate PWM
output indices read from the devicetree. It ensures that the parsed output
values are within the valid range before storing them.

> diff --git a/drivers/pwm/pwm-lp3943.c b/drivers/pwm/pwm-lp3943.c
> index 10537e74be288..1ce2a1bbc5fd5 100644
> --- a/drivers/pwm/pwm-lp3943.c
> +++ b/drivers/pwm/pwm-lp3943.c

[ ... ]

> @@ -247,6 +247,11 @@ static int lp3943_pwm_parse_dt(struct device *dev,
>  		if (err)
>  			return err;
> =20
> +		for (j =3D 0; j < num_outputs; j++) {
> +			if (output[j] >=3D LP3943_NUM_OUTPUTS)
> +				return -EINVAL;
> +		}
> +

[Severity: High]
Does this bounds check fail to reject negative values resulting from type
conversion, leaving the driver vulnerable to out-of-bounds memory accesses?

A malformed devicetree (e.g., loaded via DT overlays) can provide a large
32-bit value with the MSB set (like 0xFFFFFFFF) for a PWM output index.

Because enum lp3943_pwm_output is treated as a signed integer type under
standard ABIs, the value is interpreted as negative.

The newly added check if (output[j] >=3D LP3943_NUM_OUTPUTS) performs a sig=
ned
comparison because LP3943_NUM_OUTPUTS (16) is a signed literal. The negative
value evaluates as less than 16, incorrectly bypassing the bounds check.

The negative value can then be used as an out-of-bounds array index:

drivers/pwm/pwm-lp3943.c:lp3943_pwm_set_mode() {
    ...
		index =3D pwm_map->output[i];
		err =3D lp3943_update_bits(lp3943, mux[index].reg,
					 mux[index].mask,
					 val << mux[index].shift);
    ...
}

>  		pwm_map =3D devm_kzalloc(dev, sizeof(*pwm_map), GFP_KERNEL);
>  		if (!pwm_map)
>  			return -ENOMEM;

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a missing
NULL check on pdata->pwms[hwpwm] to lead to a crash if a partially configur=
ed
PWM chip is requested?

During probe, lp3943_pwm_parse_dt() iterates over the ti,pwm0 and ti,pwm1
properties. If a property is missing, the loop skips initializing that chan=
nel,
leaving pdata->pwms[i] as NULL.

However, the probe function registers the PWM chip unconditionally for both
channels. If a sysfs user requests the missing channel, the PWM core invokes
lp3943_pwm_request_map(), which blindly dereferences pdata->pwms[hwpwm]:

drivers/pwm/pwm-lp3943.c:lp3943_pwm_request_map() {
    ...
	pwm_map->output =3D pdata->pwms[hwpwm]->output;
	pwm_map->num_outputs =3D pdata->pwms[hwpwm]->num_outputs;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6a9d4c6b.79b5ea6e.1=
47aa1.5883@mx.google.com?part=3D1
