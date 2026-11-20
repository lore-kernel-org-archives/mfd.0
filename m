Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159879;
	b=MmoxbawMDKYD+chDxDHyX3WC0k7fPyOCRJ/eX/5bvC0Leyg50DjM3Sfg+aDFhydHnLyO
	 o8UePtt1wJ81ona8zw81Q7Mw1eDQuc/K3DUpd+zXa1o4gbVETqZwCNZgeIQNOty2ly1HL
	 X1uKfjd9j476y4UuNiRXGOqd+xAvbOuQL5F1qwYoY8QYATxnambAvM8MQ2NpTfOpEOoDk
	 ET93q8ZpAI1iJ4YYPmdL+JUS9S3YFHpUCRhR7HZVDczZKnvhGgt0kUqN5TprTPcGAa2sV
	 J+ZkDDlQadBcv+RW5YVNomi5YjccmIlx6z0W1d3rGh9sRLiUUR9mmMCVuhmLgGy5tPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159879;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cFoN15VTtXRTnh3g8PC3YNC8CurPiyaRXbtABMmyrZU=;
	b=v25N5ql4qQWrbB1HUAWQjiNpP/KbtS6ZwLvY82jb/aD50MALpcthGtSkCLw0tA9kQquj
	 SUfCFsG0FM5D9X8hmq1w4vtTXzmOhRfp+mkk/5qUepChIeaS5BchTxMUd+tkF9rCLICG5
	 WwprtX2Reqz4sRamJxf28WHP/ln3Z/7bNqR+31vlFpKCo4XCceAa/LHIM+/CcVTcGcL/a
	 k7DuGl67ddDc1Kq0qm1lKtmIldQtZWRn3LoXyYeCChJ0L5pBvXqHyj4FNHlCdMT86m+hh
	 wxMJkgqTZu4IVkwMMjUDU2IUcwmuP6SVXtfFI2AWdT+zIda0o40D6x1b0PYfWIWHrUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VH9xy074;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6022606A320
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VH9xy074
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468D41F000C6;
	Fri, 20 Nov 2026 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795159879;
	bh=cFoN15VTtXRTnh3g8PC3YNC8CurPiyaRXbtABMmyrZU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VH9xy074d5yy6Mf/y1h+xVCbA/G3suOXbyq5ncDfKBcad339G7+SbK6xPc+ItwU1G
	 krQEq/7jT7suN18GhIV69XUlzGG+5bRwiDNqQl6KS5UwwuyVCDDPout9Vek8ebD8NU
	 EZB/c/Ll6C2t/iROvEqN7v2xr96jy1AbtDSz+GlCGUzp3GD/Fmz6r9WRioexlX0W91
	 94QkjEI3ter1bYfbOE0UOwosimJtRt5NDeOw7Bkl+f8It9Y9lXq3nwRaYvIOtw2uT/
	 KpOHxhEd3pnz17WVYp/6Td+ZtudwLtawBvN/xU3kbD6uJrPWH8vuQMMRsRmjXhtYpm
	 0hI9nPetZPefA==
Message-ID: <sashiko-outbox-224629@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFBlcnJvdCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <thomas.perrot@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261120-dev-b4-aaeon-mcu-driver-v10-4-a756687e7997@bootlin.com>
References: <20261120-dev-b4-aaeon-mcu-driver-v10-0-a756687e7997@bootlin.com>
 <20261120-dev-b4-aaeon-mcu-driver-v10-4-a756687e7997@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 07:31:18 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add GPIO driver for the Aaeon SRG-IMX8P embedded controller. This
> driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
> that can be configured as inputs or outputs.
>=20
> The driver implements proper state management for GPO pins (which are
> output-only) and full direction control for GPIO pins. During probe,
> all pins are reset to a known state (GPOs low, GPIOs as inputs) to
> prevent undefined behavior across system reboots, as the MCU does not
> reset GPIO states on soft reboot.
>=20
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-dev-b4-aae=
on-mcu-driver-v10-0-a756687e7997@bootlin.com?part=3D4

