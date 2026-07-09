Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2947139A075
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616905; cv=none; b=LJDnd1QxkC6+6zgTCGEo73QXHd/XbUv47p/xixjtFhI1Hk7PCxVbYPIHEzRopWOg5SbdPjNKojxdFX/tUblKmT8LOX5cjbph2Mu1uQUQ0oDaOaf1lMyu0yly2uiuGoIqYLbzxwDCx1RnMVaR6oWfRj4VV/e9CqmqiOFW9hT7ovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616905; c=relaxed/simple;
	bh=8fJYSf+cAalvx1wpVVFU4vRLRWNUpRthZLaqVXRY6zs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SCEZy6Dv8oLpyszsZZxKi9RHUIHvoxafUXMfQNmmWMdHOsf5SlxEInHZt4jCS1hPg8Le+eUhuDHG2zih+DrSTKNHkCmnyo+oUNqYxwETy/OxMdTVnZD/9xsQ9/Fsvn85OUzTyYXfkW0wjmpXXzYXN35Q8NUYYPfnaAvHLbT++Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fku1Ppnj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fku1Ppnj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1EC1F000E9;
	Thu,  9 Jul 2026 17:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616903;
	bh=9AmaCAFEaoUrwsXO5ewqEK5LJSjjC//AGvJHTukYlYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fku1PpnjPw1p23+sZtSpdEvtHhvsx0fQx5bEdY1cQNGKtYNMswnvH6z/Gl02fUBB9
	 fUN4ntU2I1eB+Ao6S9cAPNMplTPVuIU58rK86rzhjBfJGYPrhT9Xw6LZJsf/Zz6yxa
	 qvQOIEgSaMDoZfzuBdrMFY90o1+tlIJpUneb2oRKAW1Ve3kbqBQF3RLIPj9lWxS0vb
	 CYYOgjj5JNo1GFQ+bXUt7TYJ/uR6Nu1Z3cqq6jJ2DXHUtQqqh9nk5szRoHLekIUte2
	 x84EzW8i8qvsfxgvn5AmD3KNPENLLN8Sl2F/FfazzuUNBXQUyKDnrTCfym4yV/hMeS
	 I0FvQKIlklfCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/23] mfd: Drop unused assignment of i2c_device_id
 driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <cc23a3c4436796135633ca14f325f5d13c804afc.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <cc23a3c4436796135633ca14f325f5d13c804afc.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:08:23 +0000
Message-Id: <20260709170823.7B1EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message prefix does not comply with MFD subsystem naming=
 conventions.

Pre-existing issues:
- [High] The MFD cell array `as3711_subdevs` is declared as a non-const sta=
tic array and dynamically modified during probe, violating MFD subsystem gu=
idelines and creating a data race.
--

--- Patch [8]: [PATCH v3 08/23] mfd: Drop unused assignment of i2c_device_i=
d driver data ---
commit c6d9af1e80d9ed1bea412fcd5336aa29d46114e0
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Drop unused assignment of i2c_device_id driver data

This commit removes explicit zero assignments to the driver_data
member of struct i2c_device_id in the as3711 and rc5t583 drivers.
The explicit assignments are dropped since the fields default to zero.

> mfd: Drop unused assignment of i2c_device_id driver data

[Severity: Low]
This isn't a bug, but the commit message prefix does not seem to comply
with MFD subsystem naming conventions. Does it need to include the driver
identifiers (e.g., "mfd: as3711, rc5t583: Drop...") to follow the standard
capitalized description format?

> diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
> index 9741977031df0..eb03b813d58f0 100644
> --- a/drivers/mfd/as3711.c
> +++ b/drivers/mfd/as3711.c
> @@ -192,7 +192,7 @@ static int as3711_i2c_probe(struct i2c_client *client)
>  }

[Severity: High]
This is a pre-existing issue, but does the dynamic modification of
as3711_subdevs in as3711_i2c_probe() create a data race if multiple
as3711 devices are probed concurrently?

Looking at the code just above this hunk in as3711_i2c_probe():

drivers/mfd/as3711.c:as3711_i2c_probe() {
    ...
    if (pdata) {
        as3711_subdevs[AS3711_REGULATOR].platform_data =3D
            &pdata->regulator;
    ...
}

Since as3711_subdevs is a shared, non-const static array, could one
probe overwrite the platform_data pointer of another before
devm_mfd_add_devices() completes? Should this be modified to use
static const mfd_cell arrays in accordance with MFD subsystem rules?

> =20
>  static const struct i2c_device_id as3711_i2c_id[] =3D {
> -	{.name =3D "as3711", .driver_data =3D 0},
> +	{ .name =3D "as3711" },
>  	{}
>  };

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D8
