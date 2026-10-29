Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285868;
	b=ktp8Fv6iEoizxY9J+w2qEhytBGLoxD1A6sv25TIU6BG0LYFh22zVobTggNb6G+7ZGKNc
	 4CIUZqiv9Q5Z8ALFbWJ211LFELoF/cQdxzxSO54YHPdt0D/5DNVZk0KvmdfBVbq13qXBM
	 LFI3JSmBjEo2B+WngRg3wwartxtidyEJ/0B9CzIJKKh3MH8/MVxehK9GdWN+GBZklrm+A
	 aQT8IGjIroOCTNTpsRgcSisuVQzfz712qRfiP6uF8zpuRT15UChAxvMGtkTdnibMPfF1Z
	 knKUu0t5RSoPp7igGIf1FIuYi8eDkPlbgVKntAjz6k2ZpnpSto+Kc1IUg/zDUJVdYbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285868;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IJBf2YeFV9Ghfw1O4b9ohaEQNSAGkr+xag49RYjZQUg=;
	b=yERgTSSZGSb0V7kqm9OgPcRlBTpZNeiGZl8YChBtLyzxkUX4TK/o/3C4dK9wQHiuxiC9
	 QWxhktqk9Twdvxcdg78f6kO4LZNQJEOm8u6kd/vRsSqOh81tQENTF0L29S7Q47N05Vdg/
	 rOHtuhxsruTCu4S8F9b97n9D3DsvX8X6A2oxi/1+G3rY1ysgnfO2Oyt2RefofFBYF5ufG
	 SAdvVsPD8UCVWWSt5szRoBgh2Xq51gRKYY3N61JfGBC5fpTymqlYtNhBthF0zrc4IpVRL
	 eBRkhsvCQ9fstgvvgecPTpXhlKF0dYjlc5DvsB0/cU2ZtAk89heLoGio12tJnsfVqMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MmnWOEPa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A4560A380B
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MmnWOEPa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FB71F01413;
	Thu, 29 Oct 2026 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793285867;
	bh=IJBf2YeFV9Ghfw1O4b9ohaEQNSAGkr+xag49RYjZQUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MmnWOEPa7aVeegW/9hm0vWhhflMSUKmIl2Q4Pj2bqm0g7KO5/2WPKpHEV/kCzHhjz
	 kLhEVKRRYH4admZfJ4D6gcMuKjfeNe/VkGwgh3w6m98AE9O9fYGB7ue/lRdZLLJYRP
	 KSTvVvjw9CFh0fyW2XDvA0rK9Nu89WLqEd8PylpLZjrd54DdY8ilVkU+w+ij+9inaI
	 2Qch1+Nl0yj6VDC/HvRUf4O9D9YMDoT/CRc9v8I4B/nfvFfE1NeSSlV47iolRx9ID/
	 wM4x6SO15tZ+8nZZO1lwGmg0gMP/W1Gv1fJEuRde1Ce6LCAdtFfMoezHFjmsczAApq
	 74gggqWMMBcsQ==
Message-ID: <sashiko-outbox-189562@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/4] mfd: aaeon: Add SRG-IMX8P MCU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFBlcnJvdCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <thomas.perrot@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261029-dev-b4-aaeon-mcu-driver-v9-2-f9b6d0cc180d@bootlin.com>
References: <20261029-dev-b4-aaeon-mcu-driver-v9-0-f9b6d0cc180d@bootlin.com>
 <20261029-dev-b4-aaeon-mcu-driver-v9-2-f9b6d0cc180d@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:57:47 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add a driver for the Aaeon SRG-IMX8P embedded controller. This driver
> provides the core I2C communication interface and registers child
> devices (GPIO and watchdog controllers).
>=20
> The driver implements a custom regmap bus over I2C to match the MCU's
> fixed 3-byte command format [opcode, arg, value]. Register addresses
> are encoded as 16-bit values (opcode << 8 | arg) using the
> AAEON_MCU_REG() macro defined in the shared header. The regmap
> instance is shared with child drivers via dev_get_regmap(). Concurrent
> I2C accesses from child drivers are serialized by regmap's built-in
> locking.
>=20
> The MCU wants a STOP between a command and its response, so they are
> two separate transfers. Both are issued under the I2C segment lock so
> that no other transfer on the same I2C segment can land in between.
> [ ... ]
> registers file, would execute the command.
>=20
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-dev-b4-aae=
on-mcu-driver-v9-0-f9b6d0cc180d@bootlin.com?part=3D2

