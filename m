Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369B4B4043
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873705; cv=none; b=Z3H2qJBPkUqNXJN5xyHTqLqo9UxXUe1pxIhCuNtGqIPn7bjz3ypSwl+VJx1G0vlPMYsc3yW7yZNgRwvLlP8wTkycThZjfiEPSBEX+JsSSpQD/k3lq7oplGWpQh9R46z/Tpvh6L+vtm2lSleuba1HZQJByZb+S0BseydK+rAX/F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873705; c=relaxed/simple;
	bh=3lrDpZyO7Scja9MyJcukoozYzhB1KrxDc+BkGHNp4hE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bn7mBi64Hhv2W43i3bGjP0hoGoTp2M6qehyH4IzNVz4NuuCekbLXorYPqzih79LyZlzjCs73W56w4YvkXRzR5VwoUigspI8o3w1gQcz/Z8dBB6hq7qxKNDYcfMLS5wzesJnaBluqWJ7xuMkJpULhHbagH7zdllpD4v39WyzP6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbADYOZv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbADYOZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0D81F000FF;
	Tue, 13 Oct 2026 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791873702;
	bh=g1iryVZL6cvf6vRJgloKUxohTwYSN4Uxkf6B8+k+Ohc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QbADYOZva4tsQtc4h6H0b8uF/JwOemMF3liqMFZ6RVnbOw57AgduRKvIAqFuEMdQJ
	 vHoZeRvasvOurBSLTA4A8x3mbY+6R/jFaBMMDOfDfB3kfYBgXhsfjs9976rc4dem0Y
	 GzUjTYqNDcSAMxqhajFgeYe3Hcr2lfb1xcxJoL04y9o6qCdGRtkoouqSGxu0qCPLGd
	 4S6cRKOZq3tnWobbStMR+VnwE6Po+CTffnb2Pg1ahfH1HoZKfbDU+3xrfJMQtK25Fn
	 jrfwWyApvkY4rLyxNDWbSZdqivnyrXgnGnJ/NkjjS5AIj4fTrRVUaswabUtswnsrkV
	 HWEAqwuZDOFzA==
Message-ID: <sashiko-outbox-169120@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/12] mfd: nct6694: Refactor USB-specific data into
 nct6694_usb_data
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-7-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-7-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:41:42 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] irq: lockdep wait-context violation on RT due to spinlock_t in i=
rq_enable
--

commit ff33329b6e251ea92cbe504a713ebdf7083e4bc2
Author: Ming Yu <a0282524688@gmail.com>
mfd: nct6694: Refactor USB-specific data into nct6694_usb_data

This commit separates the USB transport fields from the core nct6694 struct=
ure
into a new nct6694_usb_data structure. It also uses consistent names for the
USB device, buffers, and the core structure.

> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> index f9ae8476fcae9..6d75b1485350f 100644
> --- a/drivers/mfd/nct6694.c
> +++ b/drivers/mfd/nct6694.c

[ ... ]

>  static void nct6694_irq_enable(struct irq_data *data)
>  {
> -	struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> +	struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
>  	irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> =20
> -	guard(spinlock_irqsave)(&nct6694->irq_lock);
> +	guard(spinlock_irqsave)(&ddata->irq_lock);

[Severity: Medium]
The kernel IRQ core holds the IRQ descriptor lock (desc->lock, which is a
raw_spinlock_t) when invoking the .irq_enable callback.

Since irq_lock is a spinlock_t, it maps to a preemptible, sleeping rt_mutex=
 on
PREEMPT_RT systems. Acquiring a sleepable lock while holding a raw spinlock
violates lock wait-context nesting rules and will trigger a lockdep BUG and
priority inversion on RT kernels.

Should irq_lock be converted to a raw_spinlock_t?

> =20
> -	nct6694->irq_enable |=3D BIT(hwirq);
> +	ddata->irq_enable |=3D BIT(hwirq);
>  }
> =20
>  static void nct6694_irq_disable(struct irq_data *data)
>  {
> -	struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> +	struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
>  	irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> =20
> -	guard(spinlock_irqsave)(&nct6694->irq_lock);
> +	guard(spinlock_irqsave)(&ddata->irq_lock);

[Severity: Medium]
Similarly, the .irq_disable callback is also called with the IRQ descriptor
lock held. Does this also require a raw_spinlock_t to avoid the wait-context
violation on PREEMPT_RT?

> =20
> -	nct6694->irq_enable &=3D ~BIT(hwirq);
> +	ddata->irq_enable &=3D ~BIT(hwirq);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D6
