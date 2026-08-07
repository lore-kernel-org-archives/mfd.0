Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6D11A680E;
	Fri,  7 Aug 2026 01:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786065953; cv=none; b=iFj8umVPRQ00shaQmkVr/xN00Num4pkcX0xGlbgFz/nCrjQB9yiXbTtNZ34T7GeUsvrRvrjsaabM7TN15tdL+qto9vBEWVA9cYzd9uor1t2uUxEtz7I8kFTiDdmdVzQgV5tJKtcIHKnxcNBQUQbfVYStk8Wpbb15A0F7m+M3N+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786065953; c=relaxed/simple;
	bh=S8uLAwe/VTP4lTCqIaO+CJadZzKn09uD1BPmkFmMfo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dHk2LVk3i+9UDn28z2OW/SdYFmTMUItcHlyXmnol+8DMf9Dxbq9HO/qej3CXWhJsbiJVHvwtt/6G7BWWpvJj5FEMDmtKdeehYb1yGGQ0pN1nYOM9mA1rEAUP8K/7oDFLDdNiYtSXkzz/ZH0qP0Ior7y1t18KOj5d4lMzx7thv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+ubUDVC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+ubUDVC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9CC1F00A3D;
	Fri,  7 Aug 2026 01:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786065951;
	bh=VmKCmuQY43qsQohSXpQC0CD1jre51pexiQdVFu18NNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E+ubUDVCSiG+1MRMPN4OvIQQAw93tNtXaC+WUiteJHFcNx6muer0lDQufYF+SowD6
	 lr7UEwiiwnQCCdYVz8wuHBrD2AF+WkQwoQXkMLWMv4I4I4DmLdH5BmS70v8UsYyxFG
	 PW/r0Z4GgTxNhDgy70PK5hrdXCWMEjqDDz/jELMt/UW3KR0TyiUrBurzE2vG0a1g7Q
	 JTUoHEdjJ4daRV9RFFQ5nUszY7l3Vwi3ZIQ4KYuu/aOa4HAC+0c2ejLq+6js2k3dxn
	 34fv+vzCCProXif5enayZW3GofCjcOZhhXoPSrGmCZBM89HwHfawGSrc176JuOI5Iq
	 UONsBWMk+8n/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/4] mfd: add X-Powers AC200 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260805-submit-acx00-of-dynamic-v1-v3-2-32c3210a6f25@gmail.com>
References: <20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com>
 <20260805-submit-acx00-of-dynamic-v1-v3-2-32c3210a6f25@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 01:25:50 +0000
Message-Id: <20260807012551.3B9CC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The commit message prefix does not follow the required MFD subsyste=
m format.
- [Low] The private data structure instance uses the device name instead of=
 'ddata'.
- [Low] The `i2c_device_id` array does not use named initializers.
--

--- Patch [2]: [PATCH net-next v3 2/4] mfd: add X-Powers AC200 support ---
commit f27704a7e16fcc27a2ce774a23d85d9a4464373b
Author: James Hilliard <james.hilliard1@gmail.com>

mfd: add X-Powers AC200 support

This commit adds core MFD support for the X-Powers AC200 mixed-signal compa=
nion
IC. It enables package supplies and input clock, initializes the paged regm=
ap,
and sets up basic chip reset and teardown handling.

> mfd: add X-Powers AC200 support

[Severity: Low]
This isn't a bug, but does the commit message prefix follow the MFD subsyst=
em
formatting guidelines? The expected format requires a driver name and a
capitalized description, such as mfd: ac200: Add X-Powers AC200 support.

> diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> index 0000000000000..e8346a3faad5e
> --- /dev/null
> +++ b/drivers/mfd/ac200.c
[ ... ]
> +static int ac200_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct ac200 *ac200;

[Severity: Low]
This isn't a bug, but should the private data structure instance be named
ddata instead of ac200? The MFD subsystem guidelines prefer the use of ddata
for variable instances to avoid hard-coding implementation details.

[ ... ]
> +static void ac200_shutdown(struct i2c_client *client)
> +{
> +	struct ac200 *ac200 =3D i2c_get_clientdata(client);

[Severity: Low]
This isn't a bug, but similar to ac200_probe(), should this use the ddata
naming convention for the variable instance?

[ ... ]
> +static const struct i2c_device_id ac200_i2c_ids[] =3D {
> +	{ "ac200" },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but should this array use named initializers to comply wi=
th
I2C subsystem initialization rules? For example, using { .name =3D "ac200" =
}.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-submit-acx=
00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com?part=3D2
