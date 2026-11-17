Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910666;
	b=VRCbw4dYhufJrDGazRldvRAmQ3nDImQ1COk1joV0JaAidXM0u8evzAOUbOhnTl1wUinn
	 AGyp5bW15ZBs4aH6h8E7g7queuamZUjqNrMDYx62sAGxdnXKNjvpxpb/GPHxSKKZCK70K
	 UyLCDxrkelZTgC7PHuo4x+AFUA+M+P4MIxaWEyfCije8Venq3aYpinLTrK190kQUXcb/K
	 IfEPwt7sP4fhs4UdI6aAz8n1ik5Y0bHdYW/a/HzF8Pltjo7qv4uJBTK6lncO6swO7Bobm
	 ItZzVzOo9uqLTLsms7V2npZrcgA5py8GlOphiY3CED7Zk2j32C8gbtB2X6O3L9GGPCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910666;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JDSqARI81PpI5lzxeJ6U4Bo8UxKiwrpQXTw5X4RPi4E=;
	b=I1qufbAfnoVYYOeXqGUnCyn6ucAm2Ma8eFt3QrYvJbyznoC1Qex8zj3L3I40Pheye1o0
	 QO8yHBlFyY16Hh9zJnYNrMR9TFm4r+9iOy1RBJTuOkOAxl2dieLSC/HoJZBClnGdHxzoS
	 RMw7salTEf3SLC9ssuE17+/LNP+XY37xm8YEw320cj8AHdrbfWMJnrKM+qtuA7FR680st
	 1vf8EVYxRgU7S5bUtnZxf384T8YvnLnvuih3vh0g/2IP+rQ1egOh1WYgDvzEsz3wEz03g
	 kG4liTJQtVr93CcVZMh8+ZbDpgCfnXAQRUgLL9R75pGEbpxmT+JIfC7iF7gX6pm4jbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A3D+JSgj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B16C606A899
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A3D+JSgj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5BA1F000C4;
	Tue, 17 Nov 2026 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910666;
	bh=JDSqARI81PpI5lzxeJ6U4Bo8UxKiwrpQXTw5X4RPi4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A3D+JSgjeTNbU+NdvwD4CVKxlzlP9A5Ah7incGCQSe9mQj4SO2rbdwd9iDQp0mPjb
	 E0rSww4esee7L68oQkH6z1vQxydnBSStuLBPtrvnJOWY8uDMOzyC5mKy4+8QMYv3pG
	 PLeswCxZfqUiPlz4XV4Fk2vkxjbdKbkj/aqF4x2HeiPWP9+W6/tqb5Mhh/6UNcO+Us
	 9CnvETKRC4LJNtu2LgtwU9721dQ+xankDfSPRyCGw6GMWmlhKVW+4qHYXlWK6Y8moZ
	 4h9WAuvwwE8VTFke5yFKBBRbx4ldUBuVNgAf+9KmR3Qyf9nE0504EOE6gkcBNVjL9F
	 zCZM6VTCBvZQA==
Message-ID: <sashiko-outbox-218586@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/10] i2c: cgbc: Add support for fixed frequency
 buses
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-7-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-7-bb070ad3e9aa@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:17:45 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Some I2C buses run at a fixed frequency. Add a fixed_freq flag to struct
> cgbc_i2c_platform_data to identify them. But the frequency is still needed
> to compute read_maxtime_us, so split cgbc_i2c_set_frequency() into two
> functions:
> - cgbc_i2c_set_frequency(): sets the bus frequency (skipped for
>   fixed-frequency buses).
> - cgbc_i2c_get_frequency(): reads the bus frequency and computes
>   read_maxtime_us.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cgbc-i2c-s=
torage-devices-support-v6-0-bb070ad3e9aa@bootlin.com?part=3D7

