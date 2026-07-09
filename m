Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C12D39A04B
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617243; cv=none; b=ZLZrbTY8r17qdvgJYoGFnQy3Nwh9OLbKQ681P+BNhldkZyMLXmZybJXgo4cigxc0+1nRLLB0DFkwjYr0B2/7drv3is7Jy1SMLj2SaBC7Yyyh8iG2hQ7Z1j5yNT5ONVLtMzURwWsaqlMptLmBkQ+5XVEKx1v7ktozxM+KaZAN1gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617243; c=relaxed/simple;
	bh=OpgRhxX7FzNHx8bbaHDi6ORs+Bvk/gXpZEgfGO0dr6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UFaEzZjVcyWb43eQXhcF/R06lqjAPVz3UUZYy2xEGFDrf+s82snX4oAnzzO+a3W2fAxnCKaXXVBB4ucxvw6CMqBoJVj1ec9YmoN8Jj0iQTDr8QDYd4ZrNIAcZ8flIbuushQFnzE85trgJE6yV1G4DUwWqy8KSlhwstepgjnPZ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRftpjc7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRftpjc7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6711F00A3D;
	Thu,  9 Jul 2026 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617242;
	bh=EWQzPeqOc05W+ERGTP8rcpNMj1mjig4iJntU4vPvGUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lRftpjc7Y3KTWcF1P1fCbevkAlbreayG81OEUyLNQfzAzXQo7zkh9hW4NIc7tTjsA
	 yXtm7WT1+NimqtEatmqa0yEx6xhEjSgIhwfZcwoCiD01snKqYHMTUlR36OBZy8xVK8
	 6IXkIcVlKy/Db4xdl9DLBmc+Km2u6HiTk80NuZFk55bilADAheWkOJH/xBZmab6Tbj
	 Px1KyIrxRq5HSfyVW+79rZI5JCD7PFYd1/ZYG/HNHJdv3T9q2NGXyD5BlJZ1lfIV2Y
	 ElA0H2XHMyAzphGcmGMPYu5iv/szAGqYOqMVNDKmf/cnqquppfv2+HngOTykUui/WS
	 iT4B22/mLnf+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 16/23] mfd: Use named initializers for
 platform_device_id array
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <c7390ea19a88cbfe80e86b7ff308664a2eec27a2.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <c7390ea19a88cbfe80e86b7ff308664a2eec27a2.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:14:01 +0000
Message-Id: <20260709171402.1F6711F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing unwind on probe failure leaves MFD child devices registere=
d after parent devm resources are freed.
--

--- Patch [16]: [PATCH v3 16/23] mfd: Use named initializers for platform_d=
evice_id array ---
commit ec581d08b9548572f0688e2c43ff55f2b791a8ca
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Use named initializers for platform_device_id array

This commit updates platform_device_id arrays across multiple MFD drivers
to use named initializers for improved readability and robustness. It also
removes trailing commas from the terminator elements.

> diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> index f0bc0b5a6f4ad..7c00c71ca4ba0 100644
> --- a/drivers/mfd/ab8500-core.c
> +++ b/drivers/mfd/ab8500-core.c

[ ... ]

> @@ -1250,10 +1250,10 @@ static int ab8500_probe(struct platform_device *p=
dev)
>  }
> =20

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in the
error paths of ab8500_probe() right above this array.

In ab8500_probe(), mfd_add_devices() is called manually multiple
times during probe. If an intermediate call fails, for example when
registering ab8540_cut1_devs, or if the subsequent sysfs_create_group()
call fails, the function returns a non-zero error code without calling
mfd_remove_devices() to unwind the already registered children.

Since the parent probe fails, the driver core cleans up the parent's
devm managed resources and clears the driver data. Does this leave the MFD
child devices registered and orphaned?

If drivers for these child devices subsequently bind, could they encounter
a use-after-free or null pointer dereference when retrieving parent data
via dev_get_drvdata(pdev->dev.parent)?

>  static const struct platform_device_id ab8500_id[] =3D {
> -	{ "ab8500-core", AB8500_VERSION_AB8500 },
> -	{ "ab8505-core", AB8500_VERSION_AB8505 },
> -	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
> -	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
> +	{ .name =3D "ab8500-core", .driver_data =3D AB8500_VERSION_AB8500 },
> +	{ .name =3D "ab8505-core", .driver_data =3D AB8500_VERSION_AB8505 },
> +	{ .name =3D "ab9540-i2c", .driver_data =3D AB8500_VERSION_AB9540 },
> +	{ .name =3D "ab8540-i2c", .driver_data =3D AB8500_VERSION_AB8540 },
>  	{ }
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D16
