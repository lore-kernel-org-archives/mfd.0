Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1453A7F41
	for <mfd@lists.linux.dev>; Thu,  6 Aug 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030462; cv=none; b=lp/jqToXeHaE5W39d+VSRqq+OVk5Fs/U0NDurNgEtf0z4j85CG6FwgmYEQx4kX1rPJdmGKVEEJ4uOWIt9We68OaPLEW/141WFHN49wOW/88saSmyoS/ws/LLUkPLeKaU9mltm84U558xdRc/KLpsTG4DEKOHwlIR4Jp/fHzZsf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030462; c=relaxed/simple;
	bh=IFHjfuJw0ENRitSFvo6z3+5jr0wb7v9M4JU4epLfTVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P2QLWizmF0UdTTsfiUyUYmc1yTA27oGwa/uQYUfMpxZ8uC+V9aPAaY2zsnQYwUT4FwoD6Uq3ZLT+6lMjwe0kYn77GpHTvY+uuTfRWkEtJ1oL32vcGhBH7ch7adpcnHEhK7YLkeCzalzyf/Fw3JLf0XtmGFP/93K4BP3FRgJObyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nE/cak4K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nE/cak4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE021F000E9;
	Thu,  6 Aug 2026 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786030458;
	bh=o9NBY7I1SfKKu427uDxz524cFJq38j9zDocGRvvvqY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nE/cak4KEVrnw1r06qerlxATnXTW3I7WuuGkS7/1umro0Uz6NWp++R9LZ/zryrUSd
	 BwFftz3DIH4u4EpeNHjvxdRZ5reW1dM64jQJpayML3db5LEjQLmM82BT2+TaAZAa+g
	 egKgs70kpnkYXR+0tfBUu1xU/SwwhsZDz5yPKx/KuQSsymKTBC6TY3guH+Z75yKMnj
	 Sxv8jvLo82LtSRN62JAoRI9xb2rjyG4Mldz9RcXyye7UMa7smFPKXf1hV0h4V2h93g
	 m/0r1bnJN3reBB+5FjNp0+fB3T9F3H8uLug9ojEn/R1QegqsZeJhfzo5R2f0YIiJMn
	 jWvKmCQqsRmMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: da903x: cancel IRQ work during teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyan Xu" <getshell@seu.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260806152032.894-1-getshell@seu.edu.cn>
References: <20260728065557.1517-1-getshell@seu.edu.cn>
 <20260806152032.894-1-getshell@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 15:34:18 +0000
Message-Id: <20260806153418.8EE021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description starts with a lowercase letter, viol=
ating MFD subsystem guidelines.

Pre-existing issues:
- [High] Missing NULL check for platform data (`pdata`) leads to a kernel o=
ops if the device is instantiated without it.
--

--- Patch [1]: [PATCH v2] mfd: da903x: cancel IRQ work during teardown ---
commit 2a17d672041aff8f9dbc3cb91964d70e165a4c40
Author: Hongyan Xu <getshell@seu.edu.cn>

mfd: da903x: cancel IRQ work during teardown

This commit adds a devm action to disable the IRQ and cancel the scheduled
IRQ work during teardown. It also ensures the action is properly released
if child device creation fails during probe.

> mfd: da903x: cancel IRQ work during teardown

[Severity: Low]
This isn't a bug, but MFD subsystem guidelines require the description
after the subsystem prefix to be capitalized. Should "cancel" be capitalized
here?

> diff --git a/drivers/mfd/da903x.c b/drivers/mfd/da903x.c
> index e86b39de3303a..f3e983bd21b0d 100644
> --- a/drivers/mfd/da903x.c
> +++ b/drivers/mfd/da903x.c

[ ... ]

> @@ -529,6 +538,11 @@ static int da903x_probe(struct i2c_client *client)
>  		return ret;
>  	}
> =20
> +	ret =3D devm_add_action_or_reset(&client->dev, da903x_cancel_irq_work,
> +				       chip);
> +	if (ret)
> +		return ret;
> +
>  	return da903x_add_subdevs(chip, pdata);

[Severity: High]
This is a pre-existing issue, but can passing pdata here cause a NULL=20
pointer dereference if the device is instantiated without platform data?

If the driver is instantiated via the i2c sysfs interface without platform
data, dev_get_platdata() returns NULL. This is then passed directly into
da903x_add_subdevs(), which blindly dereferences it:

da903x_probe()->da903x_add_subdevs()
    for (i =3D 0; i < pdata->num_subdevs; i++) {
        subdev =3D &pdata->subdevs[i];

Could we add a NULL check for pdata in da903x_probe() to prevent a kernel
oops?

>  }
> =20
> @@ -536,6 +550,7 @@ static void da903x_remove(struct i2c_client *client)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806152032.894-=
1-getshell@seu.edu.cn?part=3D1
