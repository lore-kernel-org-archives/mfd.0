Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CEB38424D
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858505; cv=none; b=oF8SgB+iG64KncDIm73QIH5g8J42OnLEnUo7W1uTChkXPGiF7AmBYMrB2uTWmPxdaY515Ncs+KbjuHFE8KsVdqb0mXcZxQ0OigDNpPiuVF/lOoGTjLfplRhjg7rwVKYPrMp83dJqmlu0LE4L0N5DJYFiopNZhiVIZ0DWmFHe64s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858505; c=relaxed/simple;
	bh=SuyMuXpXC5nv06p3mfIttc1S4julIZAF78WaYrF45UA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PdlPEtc7Z/wxus5I0YEhqwkL2XBFwTaidQ4G44Pn7ImeD7nIManq8fU7DYBHPu3rK8mIImAeqIa4HNLjxG7Q+pMlApl+4OtgxtwRMmYi8TAQgp1vO30A0GJTj82wHd6b6516qJC+0xj/vhdt9aoSvbvBNkra2m1h4waeZ89Vuck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSjS9aSB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSjS9aSB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458301F000E9;
	Tue,  4 Aug 2026 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785858504;
	bh=GDdDICInNww0bEerXQdg3atOTvcuXmRe5YifG0YiFVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gSjS9aSB2BP2U7meyqsRvh+qRKwiDI1rg/Gj7IDL3GbVuS8moCJ6RafR7zhQCZiaO
	 zjvTCRaCtz/OwKQE6y4yf/CCKMEA1ETuTk+vCjsDvofBYrDpIaP0G6dysnUCD6cFnU
	 PPo/rTVwj9+nVvsLlieOmiQSBpGBjaXZOgHacEFaBqXv/Bwk1oYc2l6+NnT3l2FwWi
	 CjpF/EwVUMoEhosMkKlOrZw4vb+5KdDBgAMkHhjEMtT9A7pw+FiPM3ViS5T23vSzpX
	 Fw6thqq6D+QajK/INJoBq6d+AIJM5paZ2uk362+okpKhdtUDcxAcBCjumTFX+HmeEh
	 AanAtjlIBcCsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] mfd: cgbc: Add virtual I2C bus support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260804-cgbc-i2c-storage-devices-support-v1-3-fed38510671c@bootlin.com>
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
 <20260804-cgbc-i2c-storage-devices-support-v1-3-fed38510671c@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:48:23 +0000
Message-Id: <20260804154824.458301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Hard-coded cell IDs are used for the newly added `cgbc-i2c` subdevi=
ce instead of `PLATFORM_DEVID_AUTO`.
--

--- Patch [3]: [PATCH 3/4] mfd: cgbc: Add virtual I2C bus support ---
commit 4f0038d5dc42bfd45540675cdbf89f68ab3673d5
Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

mfd: cgbc: Add virtual I2C bus support

This commit adds a new I2C cell to support the internal virtual I2C bus=20
provided by the Board Controller.

> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> index 4a409234e66c8..81bd0a381ca13 100644
> --- a/drivers/mfd/cgbc-core.c
> +++ b/drivers/mfd/cgbc-core.c
> @@ -240,6 +240,7 @@ static struct mfd_cell cgbc_devs[] =3D {
>  	{ .name =3D "cgbc-gpio"	},
>  	{ .name =3D "cgbc-i2c", .id =3D 1 },
>  	{ .name =3D "cgbc-i2c", .id =3D 2 },
> +	{ .name =3D "cgbc-i2c", .id =3D 3 },

[Severity: Low]
Should this use PLATFORM_DEVID_AUTO instead of hard-coding the cell ID?

>  	{ .name =3D "cgbc-hwmon"	},
>  	{ .name =3D "cgbc-backlight" },
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-cgbc-i2c-s=
torage-devices-support-v1-0-fed38510671c@bootlin.com?part=3D3
