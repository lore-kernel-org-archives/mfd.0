Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AEE3CB2E0
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510083; cv=none; b=BlqVEATl9kCnX+jboFH3GAX+bU2muvgZ0UDl5GUNARnGcE/62uIyEQDXbvewFAqTMN887D87Dcqhw0zxJgpeJfVwVreYReWNIGZUILsz/RxyJ0A/XIPTwojFOCgKwFs0I3I9TPvRbyJeKWlmWM9JrzTrY1zal/b/fOEHm831nyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510083; c=relaxed/simple;
	bh=n73TheHiavrc8kAtoa1P9Szw1A/FRVKZ+2n0mhRtW60=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FlVPa5N+cChzCogP/UUPYHFLLlNIjGVc+WLCeMo7/8MZg5CCBeGBxEiew2OMgJSaLy+Ha3TeR2BTVD6F/zH3tuPSvcEmptDsEA/y+542dyUco60K9cVYgScSs9zOshmIl1iheOej5ktclJHyncGzSqtoCDiNoUPpR2DIVySVDYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUZG+YRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUZG+YRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C885E1F000E9;
	Wed,  8 Jul 2026 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510082;
	bh=EiFOYYt9QPwSJr/PwLI+NHe3ODVmFT1ngm4h7l1914Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KUZG+YRrz32k22Vw07FMndx8sNdeT0Ez06TiPZx9UIbJTh/C6jUCu9qdv0mYLN/v+
	 Sl81MBN+EcWZk3YOIzqIs1VeFBc9KfeUiyMzaeA7fto8hffAs1nxNtrXnwASyn6Exz
	 oOCNli+2dmxxrV1smpPzHmfclUaTofrgruCkbjliMwF3Tdoq0I9Jdaiu1xnzqwWhZ1
	 JXLTG53NTMitFdy5BK21lHIGtlsVSLJ3iBdm1m8Soz9af367onYc0qK9yrMZLIn27j
	 UXgVTjVSiuf/TAICgiHVqXNz/unJMETQEL7HPP9JGc7SffeakqIC2QWXjirTIQCS3t
	 kYbYJLS60G+QA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/23] mfd: lp87565: Explicitly set driver data for
 the generic dt compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <1e596fe18a6bd2ea363be3615eb512dff9bd18a2.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <1e596fe18a6bd2ea363be3615eb512dff9bd18a2.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:28:01 +0000
Message-Id: <20260708112801.C885E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The I2C device ID table `lp87565_id_table` omits the `.driver_data=
` field for the `lp87565-q1` entry, incorrectly identifying it as an unknow=
n device when probed via I2C.
- [High] The probe function fails to properly propagate errors from `devm_g=
piod_get_optional()`, improperly swallowing errors and misusing the resulti=
ng `ERR_PTR`.
--

--- Patch [4]: [PATCH v2 04/23] mfd: lp87565: Explicitly set driver data fo=
r the generic dt compatible ---
commit 4968e817f8387b287a7ba469356ea70ac971b3dd
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: lp87565: Explicitly set driver data for the generic dt compatible

The driver relies on .data being (void *)LP87565_DEVICE_TYPE_UNKNOWN
(i.e. NULL) for the generic device tree compatible. Make this explicit.

> diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
> index b78ae79df5fa6..efea1ba82811a 100644
> --- a/drivers/mfd/lp87565.c
> +++ b/drivers/mfd/lp87565.c
> @@ -26,7 +26,10 @@ static const struct mfd_cell lp87565_cells[] =3D {
>  };
> =20
>  static const struct of_device_id of_lp87565_match_table[] =3D {
> -	{ .compatible =3D "ti,lp87565", },
> +	{
> +		.compatible =3D "ti,lp87565",
> +		.data =3D (void *)LP87565_DEVICE_TYPE_UNKNOWN,
> +	},
>  	{
>  		.compatible =3D "ti,lp87524-q1",
>  		.data =3D (void *)LP87565_DEVICE_TYPE_LP87524_Q1,

[Severity: High]
This isn't a bug introduced by this patch, but while looking at device
matching, I noticed that the I2C device ID table omits the .driver_data
field for the lp87565-q1 entry:

drivers/mfd/lp87565.c:lp87565_id_table[] =3D {
	{ "lp87565-q1" },
	{ }
};

When the device is instantiated via I2C board info or sysfs instead of Devi=
ce
Tree, it evaluates to 0 (LP87565_DEVICE_TYPE_UNKNOWN). The child regulator
driver then falls back to the default configuration of 4 single-phase bucks
instead of the correct configuration for lp87565-q1 (2 dual-phase bucks).

Should this have the driver_data explicitly set similarly to the DT match
table?

[Severity: High]
This is a pre-existing issue, but the probe function seems to improperly
handle errors from devm_gpiod_get_optional():

drivers/mfd/lp87565.c:lp87565_probe() {
	...
	if (IS_ERR(lp87565->reset_gpio)) {
		ret =3D PTR_ERR(lp87565->reset_gpio);
		if (ret =3D=3D -EPROBE_DEFER)
			return ret;
	}
	...
}

If devm_gpiod_get_optional() returns an error other than -EPROBE_DEFER, the
error is swallowed and the ERR_PTR is stored in lp87565->reset_gpio.

Because an error pointer is non-NULL, the condition if (lp87565->reset_gpio)
evaluates to true. The driver then incorrectly passes the error pointer to
gpiod_set_value_cansleep().

While gpiolib's VALIDATE_DESC() catches the invalid pointer and prevents a
kernel crash by returning early after logging a warning, the driver falsely
succeeds probe without acquiring its critical reset GPIO and repeatedly spa=
ms
the kernel log.

Does this need to be updated to return the error for non-EPROBE_DEFER cases
as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D4
