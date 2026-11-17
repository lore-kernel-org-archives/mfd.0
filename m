Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910874;
	b=ep6LuxRA1PdfUv5zTW939mRRLdLmiK0NTEAsks3hPoodJjgPzyrrcABoHGZjNEsBDN0t
	 MKcKv/dJffzLW/rCjIGSye15zA8YtdZBSlupq8xmsxuXHVMrNb1rAgMWTPSLF7s0P3W6/
	 nroM4h7H4BQhtPlhM7IqDkBZ/6Oo36+iF424kRBwo25//JrqKQ5099WqD64dxD6sImOD4
	 uUiNGjo9BxvDz1d45HUivllvOrRgGpY92vxUcFdUPy5DoUXV8CZRj+KIDno3rZjM58/R2
	 Hf7YNhabadvuUswd4VucBFVspacTL1HSFP2fXkG8UdurbyQ+LpAa8ATUvX2W+eaqEVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910874;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=I/2Ly25nM0PmWxQkbqMU9BurX+HD2tBsG2gcEN7tWaU=;
	b=V2CL5jsDTep8DYnoJOhYcoecncN8MqgckqXpUnRVj8ZA3pqQHJQcgB8cqlMmLRbUZK70
	 Dxm1x8i8okhwbryx/6x4wiU9N4o8wJlss67hFdFmqGdcEd8G4r5ACh4UiQbmO2Ak2CKll
	 JoKlUZRck19ub5U9xY7t1xaRpi8QjXudk3dSA6Pn7mdPwztRnqyP3SeZsWK0f/QQrjPn/
	 yahpuq17GbL00w6qfxPHXwdLp2VQWdlP7BNUHXe2wMPIkXbN5pDBXKW0ymVKt6j6mPA50
	 R0K9wnbiN2nSjNOEIdF2MVLH+zVwiM2gRxg8YPj6NaZdK/Ys7gH3f0rBuzNNQQybqwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QX6ME4qW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37785606A31C
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QX6ME4qW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF1F1F000C4;
	Tue, 17 Nov 2026 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910874;
	bh=I/2Ly25nM0PmWxQkbqMU9BurX+HD2tBsG2gcEN7tWaU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QX6ME4qWRAA/1kClfrsJLIEgwHRQ5Hj9qKFd840GndvI2zthALH0JRl/prLlqg6mt
	 ZFmhixo/Tf6+eJBcU5UHQnr43Br49Ypa3PfHejhR1dGrDOvEEQKYa2e6J4oM81W5q3
	 tKRW6ZOIiyDWbk6CJqNzE/un2Mf2A0SHqehCgIr6z15EU8E5c30vfLKNkSmLZFkIid
	 vpHVVRtDpeUVCd9F5H0BkGYMC5H21TCEuO5cL0kbKiEBBAdMg4o2zu/ej98uuxtxNj
	 3yk2cUNXZqJAmEHOOOJT4DxyRXm2GI++iKztOQKujUpuoYhCKQdPQWgNs03Oz8jVG8
	 bZW1rzUFetZVg==
Message-ID: <sashiko-outbox-218598@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/10] mfd: cgbc: Add virtual storage devices on the
 virtual I2C bus
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-9-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-9-bb070ad3e9aa@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:21:13 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add support for virtual storage devices exposed by the Board Controller
> on its virtual I2C bus. There are two device types: EEPROM for persistent
> storage and RAM for non-persistent storage:
> - Secure Data EEPROM  (64 bytes, RO): static and dynamic board info
> - BIOS EEPROM         (32 bytes, RW): reserved for BIOS applications
> - BC EEPROM           (32 bytes, RO): Board Controller operational params
> - User EEPROM         (32 bytes, RW): user applications
> - BIOS RAM            (32 bytes, RW): reserved for BIOS applications
> - BC RAM               (8 bytes, RO): Board Controller operational params
> - User RAM            (16 bytes, RW): user applications
>=20
> Use the at24 driver with the 24c01 entry (the most generic one) for all
> virtual storage devices, customizing parameters via software_node
> properties (size, pagesize, read-only flag, label).
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cgbc-i2c-s=
torage-devices-support-v6-0-bb070ad3e9aa@bootlin.com?part=3D9

