Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C5C3E9287
	for <mfd@lists.linux.dev>; Fri, 17 Jul 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290918; cv=none; b=tqGmrQzjzu5Um9Y3CNZPtJ6dfDvYBSXz5FhjsbPxKJpxSubkgjYCzhry6+kJB4EMD0Q5oXe7vxm1KMKhoHyr2/vz8zL1qp6oio9bHUsCWZnFEd66mCZhhKVvo+Fal5TqyV0Dz6WpmB4hJ+QNvO0gIp08QCw/y2cOZ/QWChlZzNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290918; c=relaxed/simple;
	bh=BHKR74Jrqx8dTXdlxzA6nOxoAWrYWi9+t5wo9reTYHw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WDaot/SIKOzCP3zzCG0RrZfHorUBNHbqR7uM5/73gFkQQ801p0l3erdTyb8MPDM8OJ6zNYP7qcYMRbk5WhHFnWJ3C+8FyOkFOVi47ojSZNUeWfr8GRfYsK1qMr7enj/JLoQX/xDpODc80lX3KzQclsM6YyQjOGCw7Ic/WWSFRh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyf5QRLj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyf5QRLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E551F000E9;
	Fri, 17 Jul 2026 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784290914;
	bh=uGB88zOiAqmWlJAo921dRhudHMXsbVlOHNzKa+GLVeA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hyf5QRLjclHKovFLIyuHvC0h3v+92sPfMhcixYVX+GNQ6brb+aTg9EyZCUIs8XS4d
	 LeYen2OR+68drZsK6jZHOHm04VIrtbs3OBB9r2/qk/4AaAovA50ufpdMgswRyOjwc8
	 dWXO6rwsCz8T20EtbepakljtpXpwY91HAdjau9Q47ysa7fbbOxatEZbD200uEbdU8N
	 I8c8eE5GZLTpENQVx23iZ99daqBm7OCEv1HqTDea40TYFBl9mQWv50aVwZEC45Vn6/
	 jLPzPLavLWCQBoaEO16GIWn9NSFaFrSCLSajHyB4gq1v63nLyrXQEAmVfiHVBk0cgp
	 xXdPeV7duCMfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: viperboard: fix native fields type in
 structures as little-endiand
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Lukianchikov" <avermoal@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260717121015.11666-2-avermoal@gmail.com>
References: <20260715145243.461827-2-avermoal@gmail.com>
 <20260717121015.11666-2-avermoal@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 12:21:53 +0000
Message-Id: <20260717122154.05E551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized.

Pre-existing issues:
- [Critical] The DMA buffer `buf` in `struct vprbrd` shares a cacheline wit=
h `struct mutex lock`, leading to potential memory corruption during USB IN=
 transfers.
- [High] The return value of i2c_add_adapter() is not checked in the probe =
function.
- [High] vprbrd_i2c_xfer() returns 0 on success instead of the number of me=
ssages successfully processed.
- [High] vprbrd_i2c_receive() uses the same struct pointer for the outgoing=
 request header and the incoming data buffer, overwriting the header and br=
eaking multi-chunk reads.
--

--- Patch [1]: [PATCH v2] mfd: viperboard: fix native fields type in struct=
ures as little-endiand ---
commit a510e96109198a25ffd2275333a8ed6cfaf2b401
Author: Mikhail Lukianchikov <avermoal@gmail.com>

mfd: viperboard: fix native fields type in structures as little-endiand

This commit updates several structure fields in viperboard.h to use
little-endian types to resolve sparse warnings.

> mfd: viperboard: fix native fields type in structures as little-endiand

[Severity: Low]
Does this commit message description violate the MFD subsystem formatting
guidelines by not capitalizing the description after the prefix?

> diff --git a/include/linux/mfd/viperboard.h b/include/linux/mfd/viperboar=
d.h
> index 193452848c047..de2be92bc2e89 100644
> --- a/include/linux/mfd/viperboard.h
> +++ b/include/linux/mfd/viperboard.h

[ ... ]

> @@ -94,7 +94,7 @@ struct vprbrd_i2c_addr_msg {
>  	u8 cmd;
>  	u8 addr;
>  	u8 unknown1;
> -	u16 len;
> +	__le16 len;
>  	u8 unknown2;
>  	u8 unknown3;
>  } __packed;

[Severity: Critical]
This is a pre-existing issue, but does this struct definition later in the
file share a cacheline between the DMA buffer and the mutex?

include/linux/mfd/viperboard.h:struct vprbrd {
    ...
	struct mutex lock;
	u8 buf[sizeof(struct vprbrd_i2c_write_msg)];
    ...
}

If a USB IN transfer is initiated in vprbrd_i2c_receive(), it maps
this unaligned buffer for DMA.

Wouldn't a concurrent modification to the mutex (like adding to the wait
queue) be discarded by the CPU's cacheline invalidation on
non-cache-coherent architectures, corrupting the mutex state and causing
a panic?

[Severity: High]
This isn't a bug introduced by this patch, but doesn't this code ignore the
mandatory return value of i2c_add_adapter() during probe?

drivers/i2c/busses/i2c-viperboard.c:vprbrd_i2c_probe() {
    ...
	/* attach to i2c layer */
	i2c_add_adapter(&vb_i2c->i2c);

	platform_set_drvdata(pdev, vb_i2c);

	return 0;
}

If i2c_add_adapter() fails, the adapter is not registered, but probe() still
returns 0 (success). When the driver is later unbound, won't
vprbrd_i2c_remove() unconditionally call i2c_del_adapter() on the
unregistered adapter and crash the system?

[Severity: High]
This is a pre-existing issue, but does vprbrd_i2c_xfer() return 0 on success
instead of the number of messages processed?

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
successfully transferred messages.=20

Doesn't returning 0 cause callers like i2c_transfer() to interpret a
successful transfer as a failure, breaking I2C client drivers attached to
this bus?

[Severity: High]
This isn't a bug introduced by this patch, but does vprbrd_i2c_receive() use
the same struct pointer for the outgoing request header and the incoming da=
ta
buffer?

drivers/i2c/busses/i2c-viperboard.c:vprbrd_i2c_receive() {
    ...
	/* read the actual data */
	ret =3D usb_bulk_msg(usb_dev,
		usb_rcvbulkpipe(usb_dev, VPRBRD_EP_IN), rmsg,
		bytes_xfer, &bytes_actual, VPRBRD_USB_TIMEOUT_MS);
    ...
}

It receives incoming USB payload data directly into the rmsg pointer at
offset 0, which overwrites rmsg->header.

If an I2C read message has len > 512, doesn't it trigger the second chunk
transfer in vprbrd_i2c_read() and transmit the corrupted rmsg->header to the
device?

drivers/i2c/busses/i2c-viperboard.c:vprbrd_i2c_read() {
    ...
		/* second read transfer if neccessary */
		if (len2 > 0) {
			ret =3D vprbrd_i2c_receive(vb->usb_dev, rmsg, len2);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717121015.1166=
6-2-avermoal@gmail.com?part=3D1
