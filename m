Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F393F104F
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 18:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153051; cv=none; b=o6u2kHDWjVg63n4BhSBvLYZRpRZbJDUiMk6muyWrvCpGaUfv/8S//GMyt+RegZxE0JWv3qJU+JLl4gYbM+M+L/+vSUslUEvwkp9+6PU8J/tFegNfll8SIxmL/w9yJBZ40ulFPz3BWEulEFQYzjhPqSUTCFUiZcJIvDyNx04JjTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153051; c=relaxed/simple;
	bh=J2WjtCoUAeJzLBtGDHgO4mitDjgkIP9caolZTit2Djs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ADhuVevviBvHSUblVH7avyuNf2E2osQ1geg5GMF7WAdpvy59hC8sfEL91EFnbtjGL2xRxwEdsUsfw3LDPS3WQ4K4CTzrwRvye5VqWElH5LZ8+AEeziBiibLM7aKwPyOHus/MX2lXkz7Ke6wpa1Bt5FOzGFdi9qFIaNP0xo+CF6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WS6s79XX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WS6s79XX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798D81F00893;
	Fri, 11 Sep 2026 18:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789153049;
	bh=J2WjtCoUAeJzLBtGDHgO4mitDjgkIP9caolZTit2Djs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WS6s79XXlvFtIimVL4ijbDw/FTmUIe0Ud9wiOdowCfpAC1MG9OnsDFQHkMGQBnTSq
	 iWNuxm4CQ7Ksp2Id/QuJL/goEfbATuVbx3KBMULpV6lZ53HFKq9rKhc1+YdX064Slb
	 MToFC1pD+UhGnEcdjgsRmwgVPx9gQJ89PEvvJ3V/XhKxArK1yjVlt6n/8KCqn2RZhy
	 gmtYLun1l6BpShJwYM7uWsqadC+uoJtuH99WHBj+OSXjW/aPuWrfobKOV+Sy3ntGDO
	 QVfFA9A4cN+6Q160nqv9IsTtXBiRqSiCkUwpytVr41Hs+0kFKbFmOuOCH+ykYqxs0/
	 6Mkd6YntQLrcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/9] mfd: cgbc: Use PLATFORM_DEVID_AUTO for child
 device registration
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260911-cgbc-i2c-storage-devices-support-v3-4-594b53fbc5ea@bootlin.com>
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-4-594b53fbc5ea@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 18:57:29 +0000
Message-Id: <20260911185729.798D81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Since parameters are now passed to the i2c-cgbc driver via platform
> data, the I2C driver no longer depends on the platform device ID to probe
> the correct I2C buses. Drop the hardcoded cell ID in favor of
> PLATFORM_DEVID_AUTO.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-i2c-s=
torage-devices-support-v3-0-594b53fbc5ea@bootlin.com?part=3D4

