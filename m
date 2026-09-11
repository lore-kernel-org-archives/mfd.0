Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACFF3F6601
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 19:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153343; cv=none; b=ZcjfQz6KfA0PzUDo00UDlrXNaRnm/BfsRiOCi6ZlsiCF0EQbzg1S4agCNYVHyekDswgxp8dXC+JGsxdg7omhFpMgFlykfIcXrcZCjhJnf+qK4RNQ/BKQZq5G5W6A08zp3kXYKURHhH7rkQfSuyAAeAvFx85bScFrv6ygDpSbmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153343; c=relaxed/simple;
	bh=f9iKvjCeRmcUqqKNkWabPrHkH0bDFpRF0oNCvPKYB/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dmpKt1P45KyBE+MeIycqGQBwkfa7P8VtMZfkC69BytDGDHssPa17kMtNf6GGlqkWmDE8C7TiUnDHTCqUkswKitcHTYGqcTONd8czuInrJoLu6lO8CrWfpI21WSyDjAOEK5/3mukbHFystkaZjEsgJ6fsGwmIleX6G8MtHE3yONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvTfOW4/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvTfOW4/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517821F000FF;
	Fri, 11 Sep 2026 19:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789153335;
	bh=OFwEReWmzmdfLZvJAJwi2wUlRFOPXw8S+2SvUE0WhKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CvTfOW4/QH/bNIHQqsrDDp4KK65P0Zp8JP237do+p5RwA1C/EUxuPFT+2F8OVaPj0
	 xhEMKx8BTAavs4ido4FPTsCG/587EVIcOHsG3dj0nf4Wo2maSzpF4v34X8n1/VPVER
	 HsCSNZ7nDNcln+fJStcZlI+RhSSDJ9cfuEl4Fg2FqTVarhrkH0iN91pomPjYN10QHS
	 Oj3maKhJKUcjMkTMsCqmEvE6a2CReWDRILv0jNuEJkXC9jtLakdaRjRq1OEpD9Qo3M
	 ZpdC1JPksCrf1paih4Wn1+q4eSvjxg2ppT5xrQBWFpiy6ZO8V02dEooDbT5rC79aRY
	 WbMkuUqPeI/Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/9] mfd: cgbc: Fix use of negative error code as
 valid session handle
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260911-cgbc-i2c-storage-devices-support-v3-1-594b53fbc5ea@bootlin.com>
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-1-594b53fbc5ea@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 19:02:14 +0000
Message-Id: <20260911190215.517821F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The platform device `cgbc_pdev` is leaked if `platform_driver_regi=
ster()` fails during module initialization.
- [High] `cgbc_command()` can return success without fully initializing the=
 caller's data buffer, leading to reads of uninitialized stack memory.
- [High] Truncating `istatus` prematurely in `cgbc_command()` desynchronize=
s the driver from the hardware data stream and corrupts checksum validation.
- [High] `cgbc_wait_device()` uses `ioread16()` to read an 8-bit status reg=
ister, which may read undefined adjacent bits and cause erroneous timeouts.
--

commit 5958523826be2db0df4509b215ea904388b04fd3
Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

mfd: cgbc: Fix use of negative error code as valid session handle

This commit fixes an issue where a negative error code from
cgbc_session_command() was directly cast to u8 and treated as a valid sessi=
on
handle. It adds an explicit check to ensure the return value is positive be=
fore
assigning it to the session variable.

Closes: https://sashiko.dev/#/patchset/20260713-cgbc-core-fix-cgbc-remove-v=
1-1-79274ad62b3a%40bootlin.com?part=3D1

> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> index 2becaf797646d..4a409234e66c8 100644
> --- a/drivers/mfd/cgbc-core.c
> +++ b/drivers/mfd/cgbc-core.c
> @@ -103,7 +103,11 @@ static int cgbc_session_request(struct cgbc_device_d=
ata *cgbc)
>  	if (ret)
>  		return dev_err_probe(cgbc->dev, ret, "device not found or not ready\n"=
);
> =20
> -	cgbc->session =3D cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
> +	ret =3D cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
> +	if (ret < 0)
> +		return dev_err_probe(cgbc->dev, ret, "session handle request timed out=
\n");
> +
> +	cgbc->session =3D ret;
> =20
>  	/* The Board Controller sent us a wrong session handle, we cannot commu=
nicate with it */
>  	if (cgbc->session < CGBC_SESSION_VALID_MIN || cgbc->session > CGBC_SESS=
ION_VALID_MAX)

[Severity: High]
This isn't a bug introduced by this patch, but is the platform device
cgbc_pdev leaked if platform_driver_register() fails?

drivers/mfd/cgbc-core.c:cgbc_init() {
	...
	cgbc_pdev =3D platform_device_register_simple("cgbc", PLATFORM_DEVID_NONE,=
 cgbc_resources,
						    ARRAY_SIZE(cgbc_resources));
	if (IS_ERR(cgbc_pdev))
		return PTR_ERR(cgbc_pdev);

	return platform_driver_register(&cgbc_driver);
}

The error path here directly returns the error code without cleaning up the
previously registered platform device. This leaves a dangling device on the
platform bus, preventing the driver from being loaded successfully again
without a system reboot.

[Severity: High]
This is a pre-existing issue, but does cgbc_command() fail to fully
initialize the provided data buffer before returning success?

drivers/mfd/cgbc-core.c:cgbc_command() {
	...
	case CGBC_STATUS_ERROR:
	case CGBC_STATUS_CMD_READY:
		data_checksum =3D ioread8(cgbc->io_cmd + CGBC_CMD_DATA + 1);
		if ((istatus & CGBC_MASK_STATUS) =3D=3D CGBC_STATUS_ERROR)
			ret =3D -EIO;
		istatus =3D istatus & CGBC_MASK_ERROR_CODE;
		break;
	...
}

If the hardware returns CGBC_STATUS_CMD_READY, the function returns 0 but
does not write to the provided data buffer.

When called from cgbc_get_version(), this trusts cgbc_command() and blindly
consumes the potentially uninitialized stack variable data:

drivers/mfd/cgbc-core.c:cgbc_get_version() {
	...
	ret =3D cgbc_command(cgbc, &cmd, 1, &data, sizeof(data), NULL);
	if (ret)
		return ret;

	cgbc->version.feature =3D data[0];
	...
}

This uninitialized byte is then exposed to userspace via the world-readable
cgbc_version sysfs attribute, potentially leaking kernel stack memory:

drivers/mfd/cgbc-core.c:cgbc_version_show() {
	...
	return sysfs_emit(buf, "CGBCP%c%c%c\n", cgbc->version.feature, cgbc->versi=
on.major,
			  cgbc->version.minor);
}

[Severity: High]
This isn't a bug introduced by this patch, but does modifying istatus
directly break the checksum offset calculation and hardware read
synchronization?

drivers/mfd/cgbc-core.c:cgbc_command() {
	...
	/* Check command status */
	switch (istatus & CGBC_MASK_STATUS) {
	case CGBC_STATUS_DATA_READY:
		if (istatus > data_size)
			istatus =3D data_size;
		for (i =3D 0; i < istatus; i++) {
			_data[i] =3D ioread8(cgbc->io_cmd + CGBC_CMD_DATA + ((i + 1) % 4));
			checksum ^=3D _data[i];
		}
	...
}

If the hardware sends more data than expected (istatus > data_size),
istatus is truncated. The loop then reads only data_size bytes, leaving the
remaining data and the real checksum unread in the hardware registers. The
driver then reads a data byte as the checksum, guaranteeing a mismatch
(-EIO). Does the driver need to read all bytes the hardware sends to stay
synchronized?

[Severity: High]
This is a pre-existing issue, but does this ioread16() on the 8-bit status
register read undefined adjacent bits?

drivers/mfd/cgbc-core.c:cgbc_wait_device() {
	...
	ret =3D readx_poll_timeout(ioread16, cgbc->io_session + CGBC_SESSION_STATU=
S, status,
				 status =3D=3D CGBC_SESSION_STATUS_FREE, 0, 500000);
	...
}

If the adjacent register at offset 0x03 contains non-zero data, the 16-bit
read will incorporate it, failing the exact equality check and causing
readx_poll_timeout() to fail. The status register appears to be 8-bit, as
cgbc_session_command() correctly uses iowrite8() to write to it. Can this
cause erroneous timeouts and break driver initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-i2c-s=
torage-devices-support-v3-0-594b53fbc5ea@bootlin.com?part=3D1
