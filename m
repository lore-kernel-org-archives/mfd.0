Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAC337B036
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787284137; cv=none; b=tlXJmcJPG16f1oHcQT618FZglZ3ErgKwMEsB8s8iP9dHGwrI6eXkKmH9r+gFK3sYhPyH2Bb1mwjdwNQOqt/no63U7bTGJJuePnuInCAselwas30DqQ90pBgT9z4bVz6SeINxgP4Or0bTscOm3moOSCuSv8iod8sHNg5iQZNiuU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787284137; c=relaxed/simple;
	bh=BTp0bZWeF3Drn02bAvGXcMVrwp2yDkZO5m6YeIv8w8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uHZ8mJq4xTsWZDZCLEbksyjukIt4GT/sWoN0qivIBdbmBEQWFyUIhqtQvAFoxv0owmtWxCkYmBxdypV8ZgA9fmzrk2eG3+dqqZPzTRCymgSN7PsAsw5NQk7ldUCyMzLj1Bas2qnQx21TjIuyJMZuKnGT4ZgmNEVnOCAigOkN2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cey95VPk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cey95VPk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619B41F00A3A;
	Fri, 21 Aug 2026 03:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787284134;
	bh=UZE66zdJ1anFtRXMdXik+/OcIgs4XGiux/WkOaWkgXQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cey95VPkLDiXtXCjqDZN2R+/ju9Bxzgs9/PNLdpdNrpDht56ETxBnbqWt+bpJCkVm
	 g1lA6Ho2wxeAvi3VUpNqnAjtRylHds8+pC1i24BOVSn9Nze2eWZcneLHMYol1hy83c
	 nU6t8nuZ7x14IRNB8vwxCl+U047JmjqAbOYR9G6dPUoK+kZy8qDw9mB5g6VASYx0Sk
	 pvfgfycMil5ohxRe7oacxRRti9CEgAsapIYYFRR7ZHkbHmIR66dHRP96tpyUjW6rPs
	 VfDw5nAjaOGKDIHL3Y8sLeGmvrNZ10+9XeEkgXSvAwPwpMffqKcosPDGYT2MfmGyl5
	 Zgx4JQByVUnOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/10] mfd: nct6694: Validate the interrupt IN
 endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821033505.4017901-8-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-8-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 03:48:54 +0000
Message-Id: <20260821034854.619B41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked transfer lengths lead to stale data reads.
- [Medium] Mismatched endpoint address used for interrupt pipe creation.
- [Medium] Missing endpoint existence and type validation for required bulk=
 endpoints.
--

--- Patch [7]: [PATCH v7 07/10] mfd: nct6694: Validate the interrupt IN end=
point ---
commit 403c0781b839695d774ed394e3d21842e56bd309
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Validate the interrupt IN endpoint

The probe reads endpoint[0] of the current altsetting without checking
that the interface actually describes any endpoint. A device reporting
zero endpoints makes the driver read past the endpoint array.

> diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
> index 793ce54c02aad..c8667984df5eb 100644
> --- a/drivers/mfd/nct6694-usb.c
> +++ b/drivers/mfd/nct6694-usb.c
> @@ -305,13 +304,9 @@ static int nct6694_usb_probe(struct usb_interface *i=
face,
>  	if (ret)
>  		goto err_urb;
> =20
> -	interface =3D iface->cur_altsetting;
> -
> -	int_endpoint =3D &interface->endpoint[0].desc;
> -	if (!usb_endpoint_is_int_in(int_endpoint)) {
> -		ret =3D -ENODEV;
> +	ret =3D usb_find_int_in_endpoint(iface->cur_altsetting, &int_endpoint);
> +	if (ret)
>  		goto err_urb;

[Severity: Medium]
This is a pre-existing issue, but does this probe function also need to
validate the bulk endpoints?

It appears that nct6694_usb_read_msg() uses usb_bulk_msg() with a hardcoded
NCT6694_BULK_IN_EP. If a malformed device lacks these bulk endpoints or
configures them with the wrong type, could it trigger a 'BOGUS urb xfer'
warning in the USB core?

> -	}
> =20
>  	usb_fill_int_urb(udata->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_=
INT_IN_EP),
>  			 udata->int_buffer, sizeof(*udata->int_buffer), nct6694_usb_int_callb=
ack,
>  			 nct6694, int_endpoint->bInterval);

[Severity: Medium]
This is a pre-existing issue, but does this mismatch the found endpoint
address?

We dynamically find the interrupt endpoint above and use its bInterval here,
but we still hardcode NCT6694_INT_IN_EP for the pipe creation. If a malform=
ed
device has its first interrupt IN endpoint at a different address, and 0x81=
 is
used for a different type, could this result in a type mismatch and a kernel
warning?

[Severity: High]
This isn't a bug introduced by this patch, but does the driver handle short=
 or
zero-length packets correctly?

Looking at nct6694_usb_int_callback(), it seems to read the transfer buffer
without checking urb->actual_length:

drivers/mfd/nct6694-usb.c:nct6694_usb_int_callback() {
    ...
	int_status =3D le32_to_cpu(*status_le);

	while (int_status) {
		int irq =3D __ffs(int_status);
    ...
}

Similarly, in nct6694_usb_read_msg(), it appears rx_len is not checked befo=
re
evaluating msg->response_header.sts. If a device returns short or zero-leng=
th
packets, could this cause the driver to read uninitialized memory and
potentially trigger spurious IRQs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821033505.4017=
901-1-a0282524688@gmail.com?part=3D7
