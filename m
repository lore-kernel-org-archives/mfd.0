Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68394466B6C
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 15:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857390; cv=none; b=CX8Rnr5WQPbOp4Ay80UTQsrsF5/FImV+FOrdyjzO5vHR5Zqbo6Tg8P63kATuCzYQ5TddyDrU8WawuWKOFLzj15vCuMXKv3oJK3hcMNWDxZD7qh/V/hgJTWiE+692xcNLVD1rUnD55maChVdOQriym8K/Qfw31XLeU39v4wg133o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857390; c=relaxed/simple;
	bh=EASjHB60BOz9k34rAmA66iCbT5N+3YswlGmaCJUepcU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ed3A1NNIGSmWZLNl+n8W6UkKBRUwlK+8Zm9ThMmU0ax164Y9P3Oz4cT7Lj0mKjCSzOG9rPzdZnZaAr6vaSqBaw1C0fL6PHpkVlYYlwf/GgkBP7ZKVLXKpBAoDiVbC3A1SRh7+C3h/GF56DaJWlPlvrJZBRpWUDTI/f5h/Wn4hJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cd4Apqil; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cd4Apqil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83AB1F000E9;
	Tue,  4 Aug 2026 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785857383;
	bh=oJ686uoUihHQg2wwD2bOEy1XrdXRnpOTa6S5YLlsB5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cd4ApqilSKbv2W6j1lLsKqRvVZMek8kN0tILdOVjuCB/qqfUqicqs2NQ7pBx6DBtd
	 0LhV/QOR8rnIdIACUYsZgZjLnbhjabb2OwKvxUkPoc+adEIegXuilJI0mhiHlp3PGa
	 dSIFXg5U418sEKyZTIghOZDNMfDr34ucFW2HYiq3qVh6Y8N11LSKxSlt/sBAB4uO24
	 YKSjUGSysMiBxxSp8GaeABkUc8a5Ea9qogRY1BHuMOti6zqbRP67cH5w6dJm392kud
	 0bCwgSMSQlgJpibIpKwrh72HOKrKzkANXq4LmcsCzyAa2zx4fi82ULwMV+VG2e1ynK
	 EQDCteeA5H7Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] mfd: cgbc: Fix use of negative error code as valid
 session handle
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260804-cgbc-i2c-storage-devices-support-v1-1-fed38510671c@bootlin.com>
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
 <20260804-cgbc-i2c-storage-devices-support-v1-1-fed38510671c@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:29:43 +0000
Message-Id: <20260804152943.B83AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardcoded `.id` values are used in the `mfd_cell` array `cgbc_devs=
` instead of relying on `PLATFORM_DEVID_AUTO`.
- [High] Uninitialized kernel stack memory can be leaked to userspace via s=
ysfs if the board controller firmware returns fewer than 3 bytes of data.
- [Medium] The `mfd_cell` array `cgbc_devs` is missing the `const` qualifie=
r.
--

--- Patch [1]: [PATCH 1/4] mfd: cgbc: Fix use of negative error code as val=
id session handle ---
commit d37d718d69c4fd9448146a18eac17c7d57dcefc2
Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

mfd: cgbc: Fix use of negative error code as valid session handle

The cgbc_session_command() return value was directly cast to u8 and used
as session handle without error checking. Casting a negative error to u8
produces a valid-looking session handle. So check if return value is
positive before to cast and use it.

Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260713-cgbc-core-fix-cgbc-remove-v=
1-1-79274ad62b3a%40bootlin.com?part=3D1
Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")

> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> index 2becaf797646d..4a409234e66c8 100644
> --- a/drivers/mfd/cgbc-core.c
> +++ b/drivers/mfd/cgbc-core.c

[ ... ]

>  static struct mfd_cell cgbc_devs[] =3D {
>  	{ .name =3D "cgbc-wdt"	},

[Severity: Medium]
This is a pre-existing issue, but should cgbc_devs be declared with the
const qualifier?

The MFD subsystem guidelines require mfd_cell arrays to be static const
so they are placed in .rodata rather than mutable memory.

[ ... ]

>  	{ .name =3D "cgbc-i2c", .id =3D 1 },
>  	{ .name =3D "cgbc-i2c", .id =3D 2 },

[Severity: High]
This is a pre-existing issue, but could this cause device naming collisions
in sysfs?

The cells use hardcoded .id values instead of allowing the MFD core to hand=
le
auto-indexing. The subsystem guidelines recommend using PLATFORM_DEVID_AUTO
to prevent driver load failures.

[ ... ]

>  static int cgbc_get_version(struct cgbc_device_data *cgbc)
>  {
>  	...
> 	ret =3D cgbc_command(cgbc, &cmd, 1, &data, sizeof(data), NULL);
> 	if (ret)
> 		return ret;
>=20
> 	cgbc->version.feature =3D data[0];
> 	cgbc->version.major =3D data[1];
> 	cgbc->version.minor =3D data[2];

[Severity: High]
This is a pre-existing issue, but can this leak uninitialized stack memory
to userspace?

If the board controller hardware returns fewer than 3 bytes during the
CGBC_CMD_GET_FW_REV command, cgbc_command() might still successfully verify
the truncated response and return 0.

The code then unconditionally reads data[0], data[1], and data[2], storing
potentially uninitialized stack bytes into cgbc->version, which is later
exposed via the cgbc_version sysfs attribute.

[ ... ]

>  static int cgbc_init_device(struct cgbc_device_data *cgbc)
>  {
>  	...
> 	ret =3D mfd_add_devices(cgbc->dev, -1, cgbc_devs, ARRAY_SIZE(cgbc_devs),
> 			      NULL, 0, NULL);

[Severity: High]
This is a pre-existing issue, but should this pass PLATFORM_DEVID_AUTO
instead of -1 (PLATFORM_DEVID_NONE)?

Using PLATFORM_DEVID_NONE combined with hardcoded .id values in the mfd_cell
array violates MFD guidelines.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-cgbc-i2c-s=
torage-devices-support-v1-0-fed38510671c@bootlin.com?part=3D1
