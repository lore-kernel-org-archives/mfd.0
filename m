Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285699;
	b=EgRvD8fyKmyq61pm13y1oWn7QWkhvkE67Ib1h4oicgVA0blOV0zQU28XR/sqJoKuVgF7
	 UeTpEHmLKh0Ba5si19sBMQWkknKRW3IIOx5Jt1wr8c8wqX62HmBSklspZ0XKIHPu/DLyl
	 Xu8Uq8i9+zSzJov5oZ+Lx372HoxECxosbTt6+RdK/hTzuE8RNcf2GRDu4CbypuR/2oMil
	 AsrKpdZz2sIuseZ3YnblIj91TI8r91kpFNGZkcIWVCkTzyNvp1uhtmLzUm6J46XC39UpK
	 cgbv/DKfMtEUoGZe5imuPVtmKkToRhESYbXh0Cge7bn2ogt68EZKtjjhwK5bng6CyIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285699;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1pLK8Y9oFyrrAeii39TsMIuWjANvy9SWizA21KobJCI=;
	b=yPNEIYxJJl5fzUtXuzaX3IRT9CbufNYMfNtkBLBs59D3Ex1anVTclxob+U5esno/3OE1
	 LOczxbBentm/YR+8QNKRgMec9LoXqIifEqzDyYSUggVPQqxi0qrFUxVa+v4xuZhw7h2A3
	 4A/Gd9sFbuLqsLrXYKffreFIkMxJXgtXaMLYv0LhF+GprcX/AiPfJ6JasER4nBVw/rOHx
	 ko+U3xiB7e57yU3mull5QEV+JvJ7dxEv3Jb8IaoJ9RdUsmbE3wI7S5haX7IvD0W4Oy1Nl
	 NVX9N8qkMV5GAT1O65y2QXuH+rVfhITU5es/QkGjc3HtvjpWHTYPigiEdRrOCOLyixA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKtio6eV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB6D606A31D
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKtio6eV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53261F01825;
	Thu, 29 Oct 2026 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793285699;
	bh=1pLK8Y9oFyrrAeii39TsMIuWjANvy9SWizA21KobJCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HKtio6eVl+AWuQIfSbYADBTTALnbjUqAqok5an9EU2s+jAc6RYODstRhCyPzvo5R0
	 hMguNUu4CXKTjUS2RDyGE6JEgzwx996+Z8Nx97vmPxTc8VqvbDxCuFkNRsEolkTwZ4
	 2B8hdv0RmqsjcmcIryKBSrdsZf3RUT4noDWVtGHSezaxEKNVu8piV3dLi/l/48yPK1
	 hpBJXVGo0RXJldqFfsF/OzbXCebUKrVw4a8bdSaLPDcv9qmNMYK71AqYDzRVGm9hvw
	 aEe3EE1c4HRtC7E5DUK3dZtom/0ao68MrFqJpSXvf/rVosCJrdQaDDyea4ypLv19FP
	 b/vy3+rFIqRnQ==
Message-ID: <sashiko-outbox-189557@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/4] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFBlcnJvdCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <thomas.perrot@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261029-dev-b4-aaeon-mcu-driver-v9-3-f9b6d0cc180d@bootlin.com>
References: <20261029-dev-b4-aaeon-mcu-driver-v9-0-f9b6d0cc180d@bootlin.com>
 <20261029-dev-b4-aaeon-mcu-driver-v9-3-f9b6d0cc180d@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:54:58 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-dev-b4-aae=
on-mcu-driver-v9-0-f9b6d0cc180d@bootlin.com?part=3D3

