Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B144503EC
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366043; cv=none; b=PTUlnvnoyYUlKPlPj73klRGX7wPuFPFxoKd17zkL26G5MyCpE7cu+dJf6y6cQmOf60R1qSY/dBqHZtYkPmyc5FBqWXeEO7wIDTvryZ7ss7QBSLdczOPU3rd6+FHDCkKjg9GsDDNWpMmxMN9hS4h07G/Gia9tEdUeru7VdIbV8IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366043; c=relaxed/simple;
	bh=PP0TZYjPYdLFe1GbH7zA39csv3loWZPDQBCoLP+6FSE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LqlWMvu7hGEMX/dVMUtshe3N8IppAAvrqsOG/UQnXTTMoWKA05s6134HNMGOQ2ejC+QjA4eCuRwAS98FiQ7hcnUl3/nX01ZAJ5va6SwcYvk6Ijm/QT/bhPZ40wicLwaUPC0nBF4aTDYpM078WGQhHqaKL5O7K62T3roTGanSu/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnZhuhde; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnZhuhde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209DA1F0089F;
	Wed,  7 Oct 2026 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366035;
	bh=uns1HhrDdtBoMYVXaZIaOWflOht/KKXM4jXy2RZ5w8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EnZhuhde2lty7OPyF0xaafqg4EAWWWSinPFwTsJowwAANDzyYtOa/kjOBeuXndtv1
	 ci0fERRbH3NFhWZGVHo5kZIqgXJIvp+lriUtiyq9iQxBCqr6Hf/X2N90svSTOsrxZ4
	 2G2W45M6tz2ckrCf70aF1h64AlMkyRL/Y1BJCP28QgvBjNIDeIbULjm7ZFNYQ3sAyN
	 CBzoM1/pA6RLgevJ7dv0rJi4YEQK31zvs6SyFvgOnxhZtNBc4arzrOx4wzBOhoxirD
	 SGa+pDwyT8MHbSNLJc5bCE01wTuv1b1VO3OU/lULq22X2sHqQ1tzbT7Etg3kDWWPea
	 yf6/JnN+c87/g==
Message-ID: <sashiko-outbox-162811@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 03/13] mfd: nct6694: Check the length of received USB
 packets
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261007092102.3768818-4-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-4-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:40:34 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mfd: nct6694: irq_enable is write-only dead code with missing ha=
rdware mask sync
--

commit 2c09e36bb163557eb6e9fd5c79ae3e61a1464462
Author: Ming Yu <a0282524688@gmail.com>

    mfd: nct6694: Check the length of received USB packets
   =20
    The response status and the interrupt status are parsed without
    checking how many bytes were actually received. A short or zero-length
    packet leaves stale data in the buffer, which is then taken as a valid
    status and may repeatedly dispatch the same interrupts.
   =20
    Reject short response packets and ignore short interrupt packets.

> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> index b9526b22754ce..de0027c98726f 100644
> --- a/drivers/mfd/nct6694.c
> +++ b/drivers/mfd/nct6694.c

[ ... ]

> @@ -207,6 +219,9 @@ static void usb_int_callback(struct urb *urb)
>  		goto resubmit;
>  	}
> =20
> +	if (urb->actual_length < sizeof(*status_le))
> +		goto resubmit;
> +
>  	int_status =3D le32_to_cpu(*status_le);
> =20
>  	while (int_status) {
> 		int irq =3D __ffs(int_status);
>=20
> 		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
> 		int_status &=3D ~BIT(irq);
> 	}

[Severity: Medium]
Are all set bits in int_status dispatched regardless of whether they are=20
enabled in nct6694->irq_enable?

Looking at nct6694_irq_enable(), the nct6694->irq_enable field is updated
when an interrupt is enabled:

drivers/mfd/nct6694.c:nct6694_irq_enable() {
    ...
    guard(spinlock_irqsave)(&nct6694->irq_lock);

    nct6694->irq_enable |=3D BIT(hwirq);
}

However, it doesn't appear this mask is ever synced to the device hardware
(for example, via an irq_bus_sync_unlock operation), nor is it read by the
software interrupt handler in usb_int_callback() to mask out disabled=20
interrupts.

If the device's top-level interrupts are level-triggered, could the lack of
hardware masking cause the device to continuously send urb packets when a=20
child driver disables an interrupt?

This might lead to bounded interrupt storms at the usb polling rate, as the
urb is repeatedly received, ignored by the irq core, and resubmitted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D3
