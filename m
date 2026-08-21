Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598EB22A817
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787284089; cv=none; b=AOsR1R1sS0j8Ut2vSaLzlh1cTgZJhjovXjQjL7eOrz718i4X/0adxH+G38LWchf39vD2R500oAfooVJaeWeQ/eslR3QQwLR73MENsVK1LOva+dnQYuw3mtH2PqXlJZqCqwHbQ4+2T1Q5zOL7uUfZedutqWbknXMO4Ik0GYZXyu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787284089; c=relaxed/simple;
	bh=y/y0dtODWYi+TIykiXSf5vpoN/83xbYy8dLrYybmXUc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j/g/ZgNM3DJMK+/SJu04+ZktUHurlw0pQJgHB2Td7k6bsL/w13Bd8Wy0mNLegDpwxgMU1tuaUo0s6cT2J3rok1pKv0IQuvoZK6hkeD2RPqRKGCMS/8QdHaWQdset48/DU9sLjeGt+nKK6xgb7gC0QGBn1vcM/yWkgV37+FRyjuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePKUARQg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePKUARQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68F61F000E9;
	Fri, 21 Aug 2026 03:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787284088;
	bh=4zuURh6NPyg7LKZDOuwAMYQRp2p4kTyuJ+kUcCq3Y1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ePKUARQgHKAsRbBq8hOeWIttMo6KLCUeFUQKRy3SbjVkpu80JPdqJKvxyJ5AK/zQ3
	 N7kpPpN0iUSikIOo4jBNWDJ3dB8ESyIsLwgva7VD5c7cJruxDL+RpEa3ECkRGQ7w1B
	 ur3+K0ztoKywtNQ8w1y4shGHyZxVh6EyYqH952pV2dGDGjDj1uw76y7/NjkVuoPOhW
	 DvYl0SagHMyym7Rh93EW+LOE4NMvVRe0ehn6PfqtVUZyxrHXBCNKOQACfKxDBtzZtl
	 dekOqNE+LhbnwireZ6QSNbeDuNKljDpxAOUUrPla1N372vZ9zaU5cF7DUunk9Zv/fq
	 Ofc56h6bYuZhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/10] mfd: nct6694: Submit the interrupt URB after
 the core is registered
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821033505.4017901-9-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-9-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 03:48:07 +0000
Message-Id: <20260821034807.D68F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing validation of irq_find_mapping() return value leads to spu=
rious system interrupts (e.g., IRQ 0).
- [High] Missing urb->actual_length validation leads to processing stale me=
mory and spurious interrupt storms.
--

--- Patch [8]: [PATCH v7 08/10] mfd: nct6694: Submit the interrupt URB afte=
r the core is registered ---
commit 8c344a9772877b334fe47602ee4be5e3e806ecab
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Submit the interrupt URB after the core is registered

The interrupt URB is submitted before nct6694_core_probe() creates the
IRQ domain. A device completing the URB early makes the callback pass a
NULL domain to irq_find_mapping(), which then falls back to the default
domain and dispatches interrupts the device does not own.

Submit the URB once the core is registered, and kill it before the core
is removed so the callback never runs without a domain.

> diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
> index c8667984df5eb..cc3e7b7b3a0dc 100644
> --- a/drivers/mfd/nct6694-usb.c
> +++ b/drivers/mfd/nct6694-usb.c
> @@ -312,20 +312,20 @@ static int nct6694_usb_probe(struct usb_interface *=
iface,
>  			 udata->int_buffer, sizeof(*udata->int_buffer), nct6694_usb_int_callb=
ack,

[Severity: High]
This is a pre-existing issue, but does this callback risk dispatching
interrupts the device does not own if an unmapped IRQ is received?

Looking at the loop inside nct6694_usb_int_callback():

	while (int_status) {
		int irq =3D __ffs(int_status);

		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
		int_status &=3D ~BIT(irq);
	}

If a malfunctioning or malicious USB device sends an interrupt status for an
IRQ bit that has not been mapped, irq_find_mapping() will return 0.

By passing 0 directly to generic_handle_irq_safe(), wouldn't this bypass
validation and incorrectly invoke the system's handler for IRQ 0 (typically
the x86 PIT)?

Would using generic_handle_domain_irq_safe() be a safer approach?

[Severity: High]
This isn't a bug introduced by this patch, but could this callback trigger
an infinite loop of spurious interrupts if the USB device returns a short
packet?

In nct6694_usb_int_callback(), we dereference the transfer buffer:

	int_status =3D le32_to_cpu(*status_le);

If the USB device sends a 0-byte packet with a successful status,
urb->actual_length would be 0, and the buffer retains its previous state.

Since the bits are only cleared in the local int_status variable and
the URB is resubmitted, wouldn't the exact same interrupts be triggered
again?

Should we verify urb->actual_length is at least 4 before processing?

>  			 nct6694, int_endpoint->bInterval);
> =20
> -	ret =3D usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
> -	if (ret)
> -		goto err_urb;
> -
>  	usb_set_intfdata(iface, nct6694);
> =20
>  	ret =3D nct6694_core_probe(dev, nct6694, nct6694_usb_devs, ARRAY_SIZE(n=
ct6694_usb_devs));
>  	if (ret)
> -		goto err_mfd;
> +		goto err_urb;
> +
> +	ret =3D usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
> +	if (ret)
> +		goto err_core;
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821033505.4017=
901-1-a0282524688@gmail.com?part=3D8
