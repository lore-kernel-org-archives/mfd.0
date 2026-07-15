Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EAB382380
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784144467; cv=none; b=getPMZqOtLSzRs4xWLXWKbdJlSuJO7tOIZvlzI5nQ94gnhtKHOz3ccQfebRODF4NXmUEVZOvtwNk0dzehQjDd8m7k+KryEI4gi26CqSRrJNkWeScoqXBTKNcbDG3AhFqBwhATAhKNcG/xQ1SVPgdcOMjsEWYzcPj39ZyA8IB+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784144467; c=relaxed/simple;
	bh=knjjJVFccT2K3PSELUTS64HWtFTUHlwWQjxhI/QKro4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MndGns0/CTEzFV6bPo/GRTC0488WKGBt8OO0vqFn3DjmNRPLgsMgjn/hxlcXg04KVr2M5Gtt0Kl2OTkgcCpyzPJ/Cd6sCZlMRopZ8PaorRGg5o2S668Nk+QbmA72a5Fu4STASPV1VSWerNbPWK5WxBs+mn2r99NIAdaZ0YmJ4E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyIIMxgn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyIIMxgn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A301F000E9;
	Wed, 15 Jul 2026 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784144463;
	bh=4Ls5/bls+eHTLcMz2yp3RlmbYFPBjcMbcK+GhFBGeWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FyIIMxgnsfH1v+jHB9JxXSOflWLj8vnLQrAKwwHTScmJW60jD3lTsiUEuNeWn7LGz
	 kYtr81j5q7T3YGKf3WUvDtbyCiaxBtTj0Yb8gl+ijrD+VkWmHJwBpprilHpF9jBjX2
	 P0ykVvOkfLh1e3PGG8W52X/y4TM0WkNbNTR61tPAOGKpxOPwVH6fI7SIHEFAN0AKSS
	 d4ZWprNWhg0YFOIVsHZrlrjTYNynZNzW3B2qX6OSYORaYu//2vF5QjhA3VPLkJeKdC
	 /FNU6MnM84B/h8m98TivFvok/3hKjwrqAx/Gc9Ldsv+PDmCenw02b0lJbkZ/jwpOTj
	 V4mcIfoPoQiFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:41:02 +0000
Message-Id: <20260715194103.26A301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Removal of `gpio_set_value_cansleep()` breaks the build for `driver=
s/mfd/si476x-i2c.c`.
--

--- Patch [1]: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep() =
---
commit 0128b6379880c534503058a0dec618848431c9df
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

gpio: legacy: Kill gpio_set_value_cansleep()

This commit removes the legacy gpio_set_value_cansleep() API. The commit
message notes that there are no more users and that it must go via the MFD
tree.

> diff --git a/include/linux/gpio/legacy.h b/include/linux/gpio/legacy.h
> index 557ef635935ea..4001208d5d636 100644
> --- a/include/linux/gpio/legacy.h
> +++ b/include/linux/gpio/legacy.h
> @@ -63,10 +63,6 @@ static inline int gpio_get_value_cansleep(unsigned gpi=
o)
>  {
>  	return gpiod_get_raw_value_cansleep(gpio_to_desc(gpio));
>  }
> -static inline void gpio_set_value_cansleep(unsigned gpio, int value)
> -{
> -	gpiod_set_raw_value_cansleep(gpio_to_desc(gpio), value);
> -}

[Severity: Low]
Does removing this function break the build for drivers/mfd/si476x-i2c.c?
There appear to be active callers of gpio_set_value_cansleep() that will
cause implicit declaration errors when CONFIG_MFD_SI476X_CORE is enabled.

For example, in si476x_core_start() on the success path:

drivers/mfd/si476x-i2c.c:si476x_core_start() {
    ...
	if (gpio_is_valid(core->gpio_reset))
		gpio_set_value_cansleep(core->gpio_reset, 1);
    ...
}

It is also called on the error handling path of si476x_core_start():

drivers/mfd/si476x-i2c.c:si476x_core_start() {
    ...
	if (gpio_is_valid(core->gpio_reset))
		gpio_set_value_cansleep(core->gpio_reset, 0);
    ...
}

And during core stop in si476x_core_stop():

drivers/mfd/si476x-i2c.c:si476x_core_stop() {
    ...
	if (gpio_is_valid(core->gpio_reset))
		gpio_set_value_cansleep(core->gpio_reset, 0);
    ...
}

[ ... ]
> @@ -148,12 +144,6 @@ static inline int gpio_get_value_cansleep(unsigned g=
pio)
>  	return 0;
>  }
> =20
> -static inline void gpio_set_value_cansleep(unsigned gpio, int value)
> -{
> -	/* GPIO can never have been requested or set as output */
> -	WARN_ON(1);
> -}
> -
>  static inline int gpio_to_irq(unsigned gpio)
>  {
>  	/* GPIO can never have been requested or set as input */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715192415.1326=
037-1-andriy.shevchenko@linux.intel.com?part=3D1
