Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910311;
	b=nSn8H8z5ZV6s+q/4pZYDwjwFMxMVvmEoIklCHZ2B6pPvGfSnxuYPj14JhVOlBagQhDMl
	 MgPiiS0NF3eFhCTqsBSo49UKlkFs4NULHc2qyDXFVdIBekZOlcYFt4Phv5FHpJQTnEpoK
	 sUSNUgz0JvQwQmjJEYtQzCxvPzbCWqDTWPlxC+O6MQjyKIcXYLcW0Z62mUcXAIChiXxmU
	 OzKwJn1wgbDrTnhiYdNW54bJzevpcueoClVRJKxdLH/NyI6m9gP+rfKKrbiLPfnDJrvKR
	 UUIA9HgEPH/4Vylh+4NsBTc3AlfvmXUvkWhwfyZMJv7b3O6VU6Idl45ksjLlOf5jfBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910311;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fPWMe9R+8QayrEPNOzi+HsHtPDNaZdRz7m7brOpzUHE=;
	b=dM9EtK0l++8Fuqvr/1my6zwTMls1b3jyvVwypCBm83Oda2BPSUq3+3Q9GVfTXDSTzfPP
	 HF807jprCXHM+eBbvxu5A5tjbojmqn8L9bvge2y/5re4Edi55YGIOwWSNkali5pTGQamA
	 xWJnWRz2V5Nh8nYLQmTkWwFzkvvHKMLDgzo+tv2h64/Sy/p94oCUsCmtkwpmLLHu3PZbN
	 /+jRatWf8lG7jJ2HDon+MUwNduFuxHJaihmaDPe01LsI/vzOg9MDtU4HQUJNdfx1WM88m
	 Noz8e8yXl/xX8A52aMOEByH03KlpnvS9I59lhg+LSl2TlMsbC/GRzswbse6RTPo1ImQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kj6KgINn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F48606A31C
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kj6KgINn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8AA1F000C5;
	Tue, 17 Nov 2026 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910311;
	bh=fPWMe9R+8QayrEPNOzi+HsHtPDNaZdRz7m7brOpzUHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kj6KgINnQwN6weUKHp0OJ/agLbDll8b0HF2N5m/kghaZ2qkRyjfsQHCsBj1OPZvIK
	 sr1IE/bXZTjmcCGDS6WvDuQYJ1uHoxwdPqoV95sl4pm1gnHqeAnFUCed2c2o2aHX7g
	 l4cPzTCEkLVq8WFBRnZ1CCniPRBy89jpgHfCFjHYJfEw9k06zLsTCFNELkwLqRfo6V
	 paBUv0i7msrXno05qg4JU+89FNDDxlS/iqqy0W9NinSP0rhP0oRFB5ifgtF56ZorPC
	 qrFApF8O/SwvCEEfnzEJhE1pAZQU9To03cPHcWW2ZYgxBInQlBZoammZpsNr4KAs5s
	 gyHDakgjEcJ+g==
Message-ID: <sashiko-outbox-218575@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/10] mfd: cgbc: Add virtual I2C bus support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-8-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-8-bb070ad3e9aa@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:11:50 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Internally the Board Controller has a virtual I2C bus with some virtual
> storage devices (EEPROM and RAM). So add a new I2C cell for this I2C
> virtual bus.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cgbc-i2c-s=
torage-devices-support-v6-0-bb070ad3e9aa@bootlin.com?part=3D8

