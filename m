Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690A837A821
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787284138; cv=none; b=ZqeZ7+BIKSrQwA+TlAzVIVcaLOR77NFGw1L7nvOuyop74aZhPbln6RHm0TfBwkTcnqduTRhn8iY8hHuTGMPNlMO1eTD7BK0nruuVzCIRsLmv3Ad5/BwbfhEKt3Zkj2a0GbtYzpbbHTnsAwriMn5g9xORQjB88OxWXMUwssmI0ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787284138; c=relaxed/simple;
	bh=KPMzyQVGJrB0DmTcU5XfXF9l7uNMIyXpXVUnSc6TT9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nme+i/DRLEPcefFnTLTHOJCC6oJD8KYs47y/Q01nfbPNALPvrGlJ8N5FUib2b6YvIBD9C5Pxdjy9keVDyPth7D7647q323aLC8YopwliIBqHsGh731dLA69IPE60RYwg5Rsnn1ZnXQDYL2z/QtjxO9xqJ6X4ALighLf5vsbvpsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yw50MYOR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yw50MYOR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A274A1F000E9;
	Fri, 21 Aug 2026 03:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787284133;
	bh=X3Ommau1AvU85wkIDLdJvqUsOkYy8eS6+1Z+u538KAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yw50MYORTCrQh2/bkbK+pNXnN/rmCz1pYcO2Aa7c/nr6SvjK5K27SRVdDZ/GI38QS
	 7vGpjKlq3Ey1Hcq1bi91FibWbqxs3mcNObAhyYZH6x+4JUmWSbo2/7SkYVUWPwyl9j
	 TYoq57B5h8kU4t5oX/FUqWVnY9FdzvwEO4jHGQh7EhEunyUs111b2PrnQvt4iJYLxv
	 kWC2oz3XXz0M4D+A6WLJnftLLSBCg+/WTi7p7L5OzCI2PUFLeM3KSwXiKPllnm0khw
	 3+6gaev3U+yXJDQEtAATPCvmav3WAzAxLJs3bcZrBPEM7Li8mthRJ6Yh3jqVjZY08U
	 QaJOUiJhuG9uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/10] mfd: nct6694: Transfer command payloads via a
 dedicated DMA buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260821033505.4017901-7-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-7-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 03:48:53 +0000
Message-Id: <20260821034853.A274A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The GPIO controller driver incorrectly sets `data->gpio.can_sleep =
=3D false`, falsely advertising to the GPIO core that its callbacks can be =
invoked from atomic contexts.
- [High] Missing check for unmapped IRQs allows a USB device to arbitrarily=
 trigger IRQ 0 handlers.
--

--- Patch [6]: [PATCH v7 06/10] mfd: nct6694: Transfer command payloads via=
 a dedicated DMA buffer ---
commit 20bf57a851a06631ddae8833be2bd95d21bbd709
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Transfer command payloads via a dedicated DMA buffer

This commit fixes a DMA safety issue on non-coherent architectures by
transferring command payloads through a dedicated buffer owned by the
transport. It also ensures commands exceeding the maximum firmware packet
size are rejected.

> diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
> index 2289ebfde7fab..793ce54c02aad 100644
> --- a/drivers/mfd/nct6694-usb.c
> +++ b/drivers/mfd/nct6694-usb.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but does this code leave us vulnerable to
spurious IRQ 0 triggers?

Looking at nct6694_usb_int_callback() in drivers/mfd/nct6694-usb.c, the
return value is passed directly into the handler:

    generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));

If a buggy or malicious USB device sends an interrupt URB with bits set
for unmapped IRQs, irq_find_mapping() returns 0. Since 0 is often a valid
system interrupt on some architectures, could this crash the system by
unconditionally passing 0 to generic_handle_irq_safe()?

[Severity: High]
This isn't a bug introduced by this patch, but does the GPIO controller
driver falsely advertise that its callbacks can run in atomic context?

In drivers/gpio/gpio-nct6694.c during nct6694_gpio_probe(), the driver sets:

    data->gpio.can_sleep =3D false;

However, the GPIO accessors like nct6694_get_value() take a mutex and
perform blocking USB I/O:

    guard(mutex)(&data->lock);
    ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);

Will this cause a kernel panic if a consumer of this GPIO chip calls a
gpiod_* function from within a spinlock or hardirq context, given that the
GPIO core permits atomic usage based on this flag?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821033505.4017=
901-1-a0282524688@gmail.com?part=3D6
