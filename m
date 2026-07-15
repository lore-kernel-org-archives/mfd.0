Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECCD4611CF
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128184; cv=none; b=Fo/jTFHJQKFZkxtgaCzvmgO6OUCLPpsD42G0bcM4nL0l4TLTkyK20S9JbC3D61HEFb89iHu52l4c6KHTcx7ziXTFIVJBhFyWdSfm0AOkvRt43rPfg3LyJc/pOB19DJtxXUQ8JAgwkxPj+SP8qNCA7Of8lsorrzWIrSH6m4lBp74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128184; c=relaxed/simple;
	bh=QQn18HGKmKoptkUzNngAk/MXzSubPEJ0sXhkvzEN+kw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u8fWAiH8FYvzxO059JhSUr5jqqfCXgjMew+3H8lCZ1o3kSCi2BNA4KvBx2qtPijjixNFthbhsitZfZq2K+KAj2UwwqYrnTomRnGpiAoziBHs1saOoIO92K8AnfxC674M7c8Il73eOntpaKqHzt3dA7WLMy1TV+JKA6N6jxm1b58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGLBMg9Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGLBMg9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C568E1F000E9;
	Wed, 15 Jul 2026 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784128183;
	bh=tiDb+9Z2SktqZLKIcE+xe//O9azwBffvd6LQ0dfdU+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IGLBMg9Z1q1a4FEU+7/ZRlXP+vXUDPm7V6U1ZBmilSVsurT89bCzQhQJ2LBwMKCyi
	 4jOU7hiWspDwS3+uaoYimTy/aNcL4QkBL7jJYI5Ay9M+3tO2y3zL/RV84W8Lni4RxT
	 RWOasBmIapjtxr6kbVkb5kGcwNFIEmitJ1cbl/JlK/fsjP9FYgDACqL2k46lO+Il/Z
	 jn1Y/twZuQtTjcvoqUjC+BJNl6x0mjS5VRQ0tWblZlGpjqdZWCx0/aqOXXQBiCHRo6
	 v7WVU7p+6YPdBQtuD/UvfOgdZz8tUsMfXrC8g+HmSOSkF+mBVnojF/JvHemf63knWM
	 a0UlYB+wmn84A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] mfd: viperboard: fix native fields type in
 structures as little-endiand
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Lukianchikov" <avermoal@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260715145243.461827-2-avermoal@gmail.com>
References: <20260715145243.461827-2-avermoal@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 15:09:42 +0000
Message-Id: <20260715150942.C568E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Medium] Incomplete fix: vprbrd_i2c_write_hdr was not updated as claimed =
by the commit message.
- [Low] Commit message violates MFD subsystem capitalization guidelines.

Pre-existing issues:
- [High] vprbrd_probe() hard-codes PLATFORM_DEVID_NONE (-1), preventing mul=
tiple devices from probing.
- [High] vprbrd_i2c_xfer() incorrectly returns 0 on success instead of the =
number of transferred messages.
- [High] Ignored return value of i2c_add_adapter() can lead to kernel crash=
 on module removal.
- [High] Buffer overwrite during large I2C reads causes corrupted USB comma=
nd headers to be sent.
- [High] DMA buffer shares a cacheline with a mutex, causing data corruptio=
n on non-coherent architectures.
--

--- Patch [1]: [PATCH v1] mfd: viperboard: fix native fields type in struct=
ures as little-endiand ---
commit cb2959fa53e5e3eb2ffeb7ffb3dcd0156c7fb289
Author: Mikhail Lukianchikov <avermoal@gmail.com>

> mfd: viperboard: fix native fields type in structures as little-endiand

[Severity: Low]
This isn't a bug, but does the commit message violate the MFD subsystem
capitalization guidelines? The word 'fix' is lowercase, but the guidelines
request capitalizing the description after the subsystem prefix.

This commit updates 16-bit fields in raw USB packet structures to use
__le16 instead of u16 to fix sparse warnings about endianness mismatches.

> diff --git a/include/linux/mfd/viperboard.h b/include/linux/mfd/viperboar=
d.h
> index 193452848c047..3e700cce5cb4d 100644
> --- a/include/linux/mfd/viperboard.h
> +++ b/include/linux/mfd/viperboard.h
> @@ -62,15 +62,15 @@ struct vprbrd_i2c_write_hdr {

[Severity: Medium]
Was struct vprbrd_i2c_write_hdr intended to be updated in this patch?

The commit message states that the fields in this structure require
Little-Endian byte-order, but the structure remains unpatched as u16,
leaving the sparse warning unresolved for the write path.

> =20
>  struct vprbrd_i2c_read_hdr {
>  	u8 cmd;
> -	u16 addr;
> +	__le16 addr;

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does vprbrd_probe() prevent
multiple devices from probing by forcing static naming?

drivers/mfd/viperboard.c:vprbrd_probe() {
    ...
	ret =3D mfd_add_devices(&interface->dev, -1, vprbrd_devs,
				ARRAY_SIZE(vprbrd_devs), NULL, 0, NULL);
    ...
}

Passing PLATFORM_DEVID_NONE (-1) instead of PLATFORM_DEVID_AUTO assigns sta=
tic
names to the subdevices. If a second device is connected, won't this cause a
sysfs collision and probe failure?

[Severity: High]
This isn't a bug introduced by this patch, but does vprbrd_i2c_xfer() retur=
n the
correct value on success?

drivers/i2c/busses/i2c-viperboard.c:vprbrd_i2c_xfer() {
    ...
		mutex_unlock(&vb->lock);
	}
	return 0;
error:
	mutex_unlock(&vb->lock);
	return error;
}

The I2C subsystem requires the master_xfer callback to return the number of
successfully processed messages on success. Will returning 0 cause the I2C =
core
and client drivers to erroneously believe the transfer failed?

[Severity: High]
This isn't a bug introduced by this patch, but can the ignored return value=
 of
i2c_add_adapter() lead to a kernel crash on module removal?

drivers/i2c/busses/i2c-viperboard.c:vprbrd_i2c_probe() {
    ...
	/* attach to i2c layer */
	i2c_add_adapter(&vb_i2c->i2c);

	platform_set_drvdata(pdev, vb_i2c);

	return 0;
}

If registration fails, the driver probe still succeeds. Upon device removal,
vprbrd_i2c_remove() will unconditionally call i2c_del_adapter(). Does this
attempt to unregister a device that was never fully added, leading to list
corruption or a crash?

[Severity: High]
This isn't a bug introduced by this patch, but is there a buffer overwrite
during large I2C reads that causes corrupted USB command headers to be sent?

drivers/i2c/busses/i2c-viperboard.c:vprbrd_i2c_read() {
    ...
		/* second read transfer if neccessary */
		if (len2 > 0) {
			ret =3D vprbrd_i2c_receive(vb->usb_dev, rmsg, len2);
			if (ret < 0)
				return ret;
			/* copy the received data */
			memcpy(msg->buf + start + 512, rmsg, len2);
		}
    ...
}

The rmsg buffer is used to send the read command header and receive the pay=
load.
The first USB IN transfer overwrites the command header with incoming I2C d=
ata.
For reads requiring a second chunk, is the overwritten garbage data sent as=
 a
command header to the device?

[Severity: High]
This isn't a bug introduced by this patch, but does the DMA buffer share a
cacheline with a mutex, risking memory corruption on non-coherent architect=
ures?

include/linux/mfd/viperboard.h:struct vprbrd {
    ...
	struct usb_device *usb_dev; /* the usb device for this device */
	struct mutex lock;
	u8 buf[sizeof(struct vprbrd_i2c_write_msg)];
	struct platform_device pdev;
};

The buf array is mapped for USB DMA and placed immediately after the lock m=
utex.
If the mutex is accessed while DMA is active, will the cacheline be dirtied=
 by
the CPU and overwrite the DMA data, or conversely, will DMA cache invalidat=
ion
destroy the CPU's modifications to the mutex waitqueue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715145243.4618=
27-2-avermoal@gmail.com?part=3D1
