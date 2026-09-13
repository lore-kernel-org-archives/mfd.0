Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39232472AE
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333295; cv=none; b=hUaS9rN9cZSXsXROkOwLFtdOcpvx3RiZGQkUDyZvYOlpil5vA9kU553lLfFufPWspPOJxIWCSVKNL1E5Aw5QaXMz85Xv6OVwMR++EiIgxoG4UDpbO4BAVbZEpU5IzE/6ZQ2peIYyqnZsjqFvEtBCteiUzis0LnrmyT9pAMGZ/0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333295; c=relaxed/simple;
	bh=QYEHlO/QQnikdP6wsnJqxRlUCyj/fdq0HM9y3KeNSWY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tMcwAT4+Rt6FVmAhwHHoeNEdnHlVjzg/hnEqvZVkICTzPS3eYknuvovmTZo2rWsQ7tOQGfwaBvmpUeWFInMmrErXzjMnoAB5vx7it/FbNTN5hwBcBruagzFrjzjFrmkHrNt5hAAWDdzIKOWsQ7RwqLZ1Kt1iqgA6nuBWhc6zHS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eeiiPC6E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eeiiPC6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8161F000FF;
	Sun, 13 Sep 2026 21:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789333293;
	bh=d82QoLKXP+KaBOqgrLjDSP0sjEfioUkwlHtnRf/IF+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eeiiPC6EtgB2RCew2Gd2ISAzPWlJtSZvWS8Ti4zbrc9hNJur7Nc+9IDbheMmTEebj
	 E4j191e+S/zCf2NL0EZyZHqD0VH+TEpJV5p3dx3t4cMtiKRezPFe3wTBM+ZbZ3JBXo
	 l0pNE8Jpx8Bdfmkpvyx7lILUGwPRAn4drvrZxYhlQDsyuexNrlyfVujmEPrTCzeA+j
	 GmSjsv0j3Ja/nVQ42rdXp1ivoyQKEPBi0qS4LrRFSIbXf7nx2oNS26gfSE9yEXZTyc
	 LIpEXjq9UTtB9i0AYOsf3E6pl6a2B7Gifx8IgPa4oZ2gRjVk5yXPyWCow0GtddCGnK
	 yV6UEp3D5LOFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: twl-core: unregister the auxiliary platform device
 on unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260913205013.54777-1-mhun512@gmail.com>
References: <20260913205013.54777-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 21:01:32 +0000
Message-Id: <20260913210133.3E8161F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message subject violates the MFD subsystem capitalizatio=
n rules.

Pre-existing issues:
- [Critical] The global pointer twl_priv is left dangling on probe failure =
or driver unbind, leading to Use-After-Free.
--

commit e934e995c4acbf6c01e2cc4e04fc84cdb6e5e228
Author: Myeonghun Pak <mhun512@gmail.com>

mfd: twl-core: unregister the auxiliary platform device on unbind
   =20
This commit registers a managed action to unregister the auxiliary platform
device on unbind. It fixes an issue where successful probes left no way for
twl_remove() to release the device, and also removes the manual error-path
unregister step.

> mfd: twl-core: unregister the auxiliary platform device on unbind

[Severity: Low]
This isn't a bug, but does this subject line violate the MFD subsystem
capitalization rules? The MFD guidelines state that the description after
the subsystem prefix should be capitalized. For example, it could be
formatted as "mfd: twl-core: Unregister the auxiliary platform device...".

> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index fba10ae9a78c6..f86df356d658d 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
[ ... ]
> @@ -754,17 +759,22 @@ twl_probe(struct i2c_client *client)
[ ... ]
>  	twl_priv =3D devm_kzalloc(&client->dev, sizeof(struct twl_private),
>  				GFP_KERNEL);
>  	if (!twl_priv) {
>  		status =3D -ENOMEM;
> -		goto free;
> +		goto out;
>  	}

[Severity: Critical]
This isn't a bug introduced by this patch, but is there a use-after-free
risk with how the twl_priv global pointer is managed?

Because twl_priv is allocated with devm_kzalloc(), the devres subsystem
will automatically free this memory if the driver unbinds or if the probe
fails later. However, twl_priv is a global pointer and it is never set
to NULL in the twl_remove() function.

Since child devices created via of_platform_populate() are unmanaged
and never depopulated in the remove path, they remain registered. If a
user subsequently interacts with a child device (like twl4030-gpio via
sysfs), the child driver calls accessors like twl_i2c_read() which in turn
call twl_get_regmap().

In twl_get_regmap():

    if (unlikely(!twl_priv || !twl_priv->ready)) {
        ...
    }

Because the global twl_priv pointer was never cleared, this check passes
the first condition and attempts to access the freed memory to check
the ready field, leading to a use-after-free.

Would it be safer to explicitly clear twl_priv during twl_remove(), or
otherwise adjust the allocation lifecycle to avoid leaving a dangling
global pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913205013.5477=
7-1-mhun512@gmail.com?part=3D1
