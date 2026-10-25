Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905176;
	b=kijYFI3NVwi74wgtBbNeiHs+xLje6t504K7lFhyhmw7AAQJXg4vSk7qtNVMY3jhJKaJq
	 MGKBfbNifOdM8SQGM5LOFWFoZ5WsfOwJ7jp5PGLEwDTeyUJ9GqIeBmF24Y8k+2EcwBmNX
	 xgZVNfl+fY9u+BUorOotRaXJUek0/qUmiTL5MMKbxsYOEYV9nE3tq+J+j76H4zwrPF3TV
	 q0fLtFtWYUJSoSyZOoVaybosRJs0fFIKGCl1nyD1EhwPqE9u4fm+P5JMq5rHV7be7LTWs
	 qKRNKeOMdUXSXBufvMhuj0vAvzcuSmtnl34ZAYpNPFuvrm+6TTMNu7vGO7DGAu7mmCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905176;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kyMEbHYXBZ0LcidoRk3ofDtlUCqs2uwzIN//cXdb/n4=;
	b=OImuYXN/hRfi2Lzazvd9FuRXYYDSuV7spetMIlDa96fSv4iZXfCUsB34sQ4XdUyemqvv
	 lET/V/lLAYRzbRC6JvN4Bf8ZgCsULfrnIfXXEoyvMVBA90N7R4hzvQqExWOitN9oGUUz+
	 njmGWk+g6FtYkTboe4K+9otGaYJviNiLc14v0Q+eATfav6OAKdC2PD6eq8KJ3XJjjdYwx
	 VP1ip2uuiwPswYBznGf54AIT5wYMRrBvSqz0GunsxbZhFx6iDG0c09yoPi8XFTSZ4G9od
	 gKvcvLekOXo2bL2mk9L4dXAgqT+CxaB8hBgQ5bsaqaCoMndLLUX0hqfx0fKvJmUuk9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hbcn7LYJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5562E606A31A
	for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 05:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hbcn7LYJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C769C1F01825;
	Sun, 25 Oct 2026 05:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792905176;
	bh=kyMEbHYXBZ0LcidoRk3ofDtlUCqs2uwzIN//cXdb/n4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hbcn7LYJcNlV6MsjLqgKvlS0xvXy7ra7vtIFuQooNDpVqPSANXGt9/Cw/LQLSEtxm
	 1si2m7t2Cw4GShUGCJ35B16+IQyAYY26gH1OhWzXZMUI4xpJmqKI2meK9nxLWVv5KY
	 3RweJjsM8d48Fs9ALw3pHF643hk0B5GynPOzS144CSozs/oY1dF6XluBszSuYJApyg
	 EJcPsNSYrNDR+xSTOLUtXIAOXDZd8gATa9hAii+99cAgQ+yb/KT+Ng0OxgInQqWmRt
	 5zM+bhEAfnoyfZUGC/t9Rf8WIXbC7EaBCpnzw7dPYdnWhAEDf7q3DxrHIMIJQ15OPe
	 XmACTpSGWPTuQ==
Message-ID: <sashiko-outbox-184081@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] ARM: s3c: crag6410: convert WM1250 and SPI0 GPIO
 lookup tables to property entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261024-samsung-kp-v4-4-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-4-e21253295e68@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 05:12:55 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Static property entries support defining GPIOs and are more similar to
> device tree properties and are not prone to losing link between device
> and a lookup table because of changes in device name. Convert the board
> to use them for WM1250 and SPI0 devices.
>=20
> This also fixes issue with recent conversion to GPIO descriptors
> where GPIO lookup tables were specifying incorrect GPIO chip name
> ("GPIO<N>" vs "GP<N>").
>=20
> Fixes: 10a366f36e2a ("ASoC: wm1250-ev1: Convert to GPIO descriptors")
> Fixes: a45cf3cc72dd ("spi: s3c64xx: Convert to use GPIO descriptors")
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-samsung-kp=
-v4-0-e21253295e68@gmail.com?part=3D4

