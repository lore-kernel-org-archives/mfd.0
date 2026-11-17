Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910184;
	b=OF6g1GRXyd9DHXF3lCU9JQpMyiqqkxL1R/ScafEGvcSXyrLTvXgZMxvnDmtBuP3br1sZ
	 5rzVS+SnMV11nxbeMxOEHkwA74wf+ZjvigD2QIlB1orv4fDVwBdG49ySpnBBPo3j2RYf+
	 skvn0ZxDB8DFfxHCMVLMIhy0ZasZuk1W/z6SLl8pGHXcuI/chSp7tCQkCB0vcgTlzllq1
	 /eKjYiCowu0IVkwtWDoBn2YzX9EYCg9VcMkGdoYC1YPlB+y+KG5+weKpjf09C0T2oFWmv
	 UCaydhhXjid2KwEjne3i6gIo4hQ53Xc0tawV23uJbKVXmNhmmm7jF1wUpjTEcy6qCXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910184;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CO/1hxvIaRo/viNxc0CXvYfdXZqjZRzzfXILYqsMipI=;
	b=pHm1zxjdFdzeeK8L8wqznqc8Qgt6yD3jVTLN26cWyCoW+/EizcUiXVzfrGdNOZ3zg7sS
	 iUKQnQVXk/5Q3qpJHw0duvK7xXH0pZQtGF7qSPwIRb7zFQsfuhrM0O3aeHquXJKTvSq5J
	 qCGu88BMYIyTmCU7sZl4+hReSCM99mW/FDWQQjGUlQgr7CjXSR6khCZDdKXCHH3FP2SRn
	 TY7geF0eTodlFWw+AvgFYJ1J1n2rrUYczdpzQrlNnV8B2I5V0vZXd6hD2oP71ATW/U6xp
	 hXqw47z7hkk0F4H9EXZk2AeXkDgKtt0DlksEC+JrNH3wHxWyySssY7pWkr8D9k6T/Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTXc6iBr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5632F606A31C
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTXc6iBr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADB41F000C6;
	Tue, 17 Nov 2026 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910183;
	bh=CO/1hxvIaRo/viNxc0CXvYfdXZqjZRzzfXILYqsMipI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kTXc6iBr0rIw4HUAuh/tkENPWYnP1pUzhL5sg/7fTJCzwlZ3bQxX0MIm7J49tZXmp
	 2ha/V/kIGFc2oG0Q45U7aWxdH0U4+W1my4O843PrZaXZI/379hNWmir/Gca+aMM7xi
	 lX1HKqpJ2Yj5blB36V3FEgKUerJeVFbHNrQw4Sgzv1lqez93gwLChSdzRwa6oQLU25
	 /anVRl+J5yVhdlcxm8FHepSZTzGB2i0aOb5V7BP8t/Oy9LH7nVFqf2jYxOrhHNsQrf
	 nfpMwdZ6sP/8rhTFpolQZW+94d7kuHrQTZaWhIRsP7A7twJzzhi1gFHqvMsS2c5rSV
	 GU2UXY7wpn+aw==
Message-ID: <sashiko-outbox-218573@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/10] mfd: cgbc: Add I2C platform data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-4-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-4-bb070ad3e9aa@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:09:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Define I2C platform data for each I2C bus in the cgbc MFD driver. Platform
> data passes per-bus parameters to the I2C driver, rather than being defin=
ed
> inside the i2c-cgbc driver itself. This makes the i2c-cgbc driver more
> generic.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cgbc-i2c-s=
torage-devices-support-v6-0-bb070ad3e9aa@bootlin.com?part=3D4

