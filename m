Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50BF22A817
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787284083; cv=none; b=OBlhka9jZaEJ7uczcOws3iX5oNDLuMEkIgtZ5I/XYu1HQmayjzpBdYR7n4IaaDFtYUearaGlrgFezk/POPrl8ill61gSzmHsaF+G0FA+QdUr3L7Z+mVIclyikYXR0twT+7cMkpLWcaWAueRt+L3YDtHklQe/xiNFSk3NjU3AnPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787284083; c=relaxed/simple;
	bh=qnibdlX1Xgei+T+eTXc+Ynv/zGlT+rTBeNJtzLsh7mk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GC0blvuhCQP1srsh1phitSyQxBwElz6rB7ekrU1bG+VjCtbW5Z+MlqvFM0X+M70e+bOxn1bgVLz8q8gDsMFK2hLKpCyS16qVF1sGPbJKLyhN1+gVrHDWsvFCiB8ibZxLRZkzuFhuopy/Cx2b6WcZ88LKgE1L9vmQ3V5qFUpy1QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNfWpeIG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNfWpeIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2936B1F000E9;
	Fri, 21 Aug 2026 03:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787284082;
	bh=PrXcL33ZLnDwgJlm0oVhYFaqmtCd5kGOdQi2p2axQHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DNfWpeIGe6QHl/Ue6b6u4IGnPI3rCW3C8+YZZqcbf86Ms6cMRk7wRu4VYa8RjHh82
	 21+j/jPwIW09LFxHgrwPZg0Qm5sBWpnIPaN8ezDkObbaAbvOsdM+Zpmx1pDWdH3Ink
	 KPiS3662Ly9STBBun89smTDqkFSWOEmRWKxPhE/6bJ1p9vFAkqueatB52lvOFazyx1
	 LmRCBAe4UiWO8LwKyvnhWu31olnRDxdvvyn/Z99dqtqE1FpYNj0SbXtGHrMX+4KstK
	 Q3unYudoQBzcgtEmlZDfwonJE5VV24ST+myenAI6/47+gIdhxv4yLKQoBsaD8z7qL2
	 sEMvDHiLP2ieQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/10] mfd: nct6694: Refactor USB-specific data into
 nct6694_usb_data
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260821033505.4017901-3-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-3-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 03:48:01 +0000
Message-Id: <20260821034802.2936B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] GPIO chip is registered with `can_sleep =3D false` despite its cal=
lbacks performing sleeping operations.
- [High] The USB interrupt callback does not check `urb->actual_length`, le=
ading to stale data reads and interrupt storms.
- [High] The USB interrupt callback fails to validate the return value of `=
irq_find_mapping()`, allowing arbitrary interrupt injection.
--

--- Patch [2]: [PATCH v7 02/10] mfd: nct6694: Refactor USB-specific data in=
to nct6694_usb_data ---
commit e3cdeafa7e419309614b6129c5ba029024c522a3
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Refactor USB-specific data into nct6694_usb_data

This commit separates USB transport-specific fields from the core nct6694
structure into a new nct6694_usb_data structure. It also adds a void *priv
pointer to the core structure to decouple the shared MFD core from the USB
transport layer.

> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> index 308b2fda3055c..58c1cbcbe3f22 100644
> --- a/drivers/mfd/nct6694.c
> +++ b/drivers/mfd/nct6694.c
[ ... ]
> @@ -326,11 +357,11 @@ static int nct6694_usb_probe(struct usb_interface *=
iface,
>  		goto err_ida;
>  	}
> =20
> -	usb_fill_int_urb(nct6694->int_in_urb, udev, usb_rcvintpipe(udev, NCT669=
4_INT_IN_EP),
> -			 nct6694->int_buffer, sizeof(*nct6694->int_buffer), usb_int_callback,
> +	usb_fill_int_urb(udata->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_=
INT_IN_EP),
> +			 udata->int_buffer, sizeof(*udata->int_buffer), usb_int_callback,
>  			 nct6694, int_endpoint->bInterval);

[Severity: High]
This isn't a bug introduced by this patch, but I have a question about the
usb_int_callback() function referenced here.

drivers/mfd/nct6694.c:usb_int_callback() {
    ...
    int_status =3D le32_to_cpu(*status_le);
    ...
}

The driver parses the URB payload as interrupt status without verifying
urb->actual_length. If a malfunctioning USB device sends an interrupt IN
packet smaller than 4 bytes, the buffer will retain its previous payload
from the USB core.

Could this cause the driver to process the same interrupts continuously and
create an interrupt storm?

[Severity: High]
This is another pre-existing issue, but I wanted to ask about the IRQ
mapping in the same callback.

drivers/mfd/nct6694.c:usb_int_callback() {
    ...
    generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
    ...
}

The return value of irq_find_mapping() is passed directly to the generic
IRQ handler without validation. If the USB device sends a payload with bits
set for unmapped or out-of-bounds IRQs, irq_find_mapping() could return 0.

Could passing a 0 virq to generic_handle_irq_safe() lead to arbitrary
system interrupt injection, such as invoking important system timers on
some architectures?

> =20
> -	ret =3D usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> +	ret =3D usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
>  	if (ret)
>  		goto err_ida;
[ ... ]

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but
there appears to be an issue in the related GPIO driver registration.

drivers/gpio/gpio-nct6694.c:nct6694_gpio_probe() {
    ...
    data->gpio.can_sleep =3D false;
    ...
}

The driver registers the GPIO chip with can_sleep set to false. However,
the accessors like nct6694_get_value and nct6694_set_value acquire a mutex
and perform USB bulk transfers that sleep.

Could this lead to a scheduling while atomic bug if the GPIO subsystem or
another caller attempts to toggle the GPIOs from an atomic context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821033505.4017=
901-1-a0282524688@gmail.com?part=3D2
