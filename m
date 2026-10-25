Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905065;
	b=tN1/s4uDKzJGnAaqqxEp5hOOfJ32ri2eVZU1IkqIDF+cduYf9Ahphuv23sXWoOyM5V0j
	 kJsGPkHund1P93crT/SFid5KHvJVsAka2rLp4vplpfJW57BiCNE1rIbPWiWDV5sPGZ0wB
	 ZcdqUfp2wdxa58yUHtUY4XQRZy/l8q5v8vfl5ckEnfp7CPxSnBGeQMTGYsyCl8oJ+8+LW
	 jjOPEmLhfb3Y19dH+5ugU/3vNSztbVB8QFYatZCeXdyup5c4h0HdeRdRaXSa4G8grvkAZ
	 w6BDBqRNT+8qEXyLzlICY2gBJ1pA0hPeA/eI+WXCsESewfPLzULODyxkmhduIR60XzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905065;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QBJEX8ENKjNzGTdqKULzlisIUtN6a2Y1y89Oy8wehlo=;
	b=FT8fbPn4VV+b3XMR28KSGtkVapJRWHCTHI9XWxY6nvMu/kMcPGKe1rUZ5ZKAnmYYmhYX
	 fF4r8XvCZR5oDTIr3Jp16FIxa9ru2keC2Won4qrAoM0tM13killniKy5HL4fpu2dOuVLa
	 LfGIP2ZwzSzNwzAv/r9PPQXYmyVBo5uADaVc8DeNoFUlizSf86zhM9eMWWv93nU6W6wWZ
	 Z1pNca7OA49Tbx/4Ko8/VqXXYzuMYUXPmcoH2bhxEIa3jkDXrPwvJK61WTErohbZwAON+
	 ObNeh4Afr1UqhZ+cZWhYYdr/6yPqmVaD8QiJjGBsLP9LbMRovTcnbJrMZzJzQIzM3qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEsx3LPH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F041E606A31A
	for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 05:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEsx3LPH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D061F01825;
	Sun, 25 Oct 2026 05:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792905064;
	bh=QBJEX8ENKjNzGTdqKULzlisIUtN6a2Y1y89Oy8wehlo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BEsx3LPHG4gpta1Oexbor/HWJQWy+My02KCz/MG3iviyh7b+k/gsVNJndmfpFYxqZ
	 ZiIzM3oAxIElqG78Dpr6bUZ833xWvO9VYFUXOu+IHS+2G9ZPtPEf0Wu7UORcQNiKZh
	 2V/WPiux46jVqZcTOzyf0MKEfSJzITQBpU8+4T92sDDFkraSx+39Gw5QDPRtiWzkvG
	 z0cG2qr7uune9BACxj6kgfWFtji/xvKyOZ8LjBJHMq6hAtwsSVQbGM/HcSNCRUjWBF
	 I9m8rBlRx6ErisxEG8Qy8TfhSpwU3zz5JaCYtcJFTKt4yJfF9WwplCIc1BowZ/WnmN
	 WtrlY1Fseu1gA==
Message-ID: <sashiko-outbox-184079@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] ARM: s3c: crag6410: convert basic-mmio-gpio and
 LEDs to software properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261024-samsung-kp-v4-3-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-3-e21253295e68@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 05:11:03 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Convert the basic-mmio-gpio device and the GPIO-controlled LEDs on the
> Cragganmore 6410 board to use software nodes/properties. This allows
> removing the crag_leds_table GPIO lookup table.
>=20
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-samsung-kp=
-v4-0-e21253295e68@gmail.com?part=3D3

