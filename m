Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565286;
	b=XFvlk5p9kAdU0o4AdF8pR+w5KqoRqDpl9gV0RQHRwEXZ69ttWaE1C086TiC1yNZ7A4y3
	 xxVsYi9retzYHBRhENq4EDSJXN7tdSyqqMr5lSQRTfF6chze1MEKyVmW7vwDIamyYLiKh
	 GvlCg4VTl0j8get9ZiZsxRYMsIl4XvO48Z+lCfNAeYAXNKnifWEZpEpAulFwlDFKBnKKC
	 YL0nAG7NdpJLB1r8BgEy710s0Ycrd5Fgv45HjUJf5McgzC2wq2AV8IfzaI91yLvINBRW9
	 TwzERKZ+DKAUx2HDWvmjzsVDC3mdMlZ5993SIBM4oNS0M6WlB9J2S/Ak1bye+4qzOdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZebDNhl0jDkzl6q0bMQgUQBeTiOfmvSac92uQHwiH20=;
	b=KKJ0WB0v+8JxNmesz11oj0su6trPxFtLU4CRB1JCfwMZ6AfcHzMfCZZ2z2uWK+voMYx8
	 zM2DAKFQfmMKe2UfRsY+hD1wt7OERV0KAuTGUcHDqzXRrHC6F6ILhg1+mue9W/UeZFFIA
	 66DQWja7vJJ/4KeidupcG/H2zOKvkzwZSQk/eJ1h/VDyWsSOmdSIuLr8gZ1hlBZZZlTsp
	 qPa71EhuPoajhxsSmor7u/IA3LVWDWjn60Iuee4qYx19Z7I0py7PHsbf1OfjuG3JsM0Wj
	 6ptsYHzhUj3PxToQbDMOOXW/RKqZhJLTdwQDWOxszAHcSWlMZh0FLOe898aSJqo2dzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E796A606A31C
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 06:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E796A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91b55859245so5726846d6.0
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 23:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565283; cv=none;
        d=google.com; s=arc-20260327;
        b=HToV3N30zKhLJzxGlsN3jawtp+FxeB8IEiqabEQvVFID8tggR+PRiYW8njEBZwyIqV
         gxiBVxGcvbb4tiY9TwA/UZVPo0BWXlneCgmhUVNb/jmKVX7t0IMRKM0G/NWJzD2PasED
         xu8JGYAAToz3sgE4YKU1RrXJcDMC0dIvjdN5d4YfBJVfnVz+VKZsjH2w27IekL6yy3kH
         QK2SbNuIV/a3hiTm8pQN1SXY+Gm2dDwKnKXtHs4tDt/r0czUNi7TaJw88/LZO4ndA/gJ
         4rjePmr8j0nFe1575AGryCNiih/k+lkkeLw9Xw2IlwNHLztuuLl6BdldYXg7Rzmpy+gR
         IcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZebDNhl0jDkzl6q0bMQgUQBeTiOfmvSac92uQHwiH20=;
        fh=SKlRGCwKdtdyEF8Kb5l+vwcMyvzCcNyahRdpojZj6w8=;
        b=p4r7uhBvmiLyAPGjOgixuXiv9S4ZHKmAg4QMO2ht2BDOKYG2ypJ/8zoogVnycNfYk3
         ZSGlmPfW0p43Ziv1oet+KBJN7IBlo/nmAOBdXnBOHvLtN3UliVNti4Xk99JhEA6OEa2G
         Eh/ZdZswkbMljvemup7baTbGoAeUHgCbdhgBAgMoOhKA+zJ7GLspl2p1PT0604Oh62ij
         XQkuP7BtdomIt33rnG+t82V+wOoKzhoSNA/RS2QTnlAuWARyjgqEyPkUdxSEewMs69QB
         i1ZYviJf6iDzB5qAWuaFUysb9B8MEVhHDW5MwzYVmjE0NsuN/p3nRbKxlJYlhCIJxbVZ
         fLhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565283; x=1793170083; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZebDNhl0jDkzl6q0bMQgUQBeTiOfmvSac92uQHwiH20=;
        b=HNo2RivPfb396LKBH7eoCQnJaBUc7AlubXHc1pSlPYQbm0Hoj6nWyauoJxHhgWkWlm
         yrlAW/gWbfFzp9oNxCJ+QfgplScIir7AbpnjFW731PW9qV2O3t1Vt6QYuvSWQUnhttA7
         RGgXJongAX1tG3fiyKxX4BwrCd83aLzApCHG7+/KkIouW3+LI4W4mAd4OepmzcoetIHy
         qfkwDR/5vUnbcd+yf/KkzmV/fGQk18lNTnV7M62FuHkK8u4rs8mZ4RDBIbm1CgMqJH2W
         K3H6l8Th2vGogWAU7gYMPnvuDiwcQBbciZtru9aUfEtxGhIDr6EcWVl8X14sjS60zn28
         7iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565283; x=1793170083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZebDNhl0jDkzl6q0bMQgUQBeTiOfmvSac92uQHwiH20=;
        b=KOSCe+R06v+0jXDrvRLjQLRoyNoC0Zctdepr7yjR8gLLabhLAPFF6uM47f4ijhMapW
         MXQWsicpn9PzpNJjFnukZtUYaPqo6pcGk3mJyebxD7Ni3YwgbIX83DNvIqH7OmMjxhrw
         P7tO1gsOHTaUc9aNZVLOtSFEJFWT/+WoJ0dGI9il23uJx0mn3ot6psdz3XzR07/Rff2P
         L26et2y9XgM8BqUVr3G6j5aBBHym8arTcTVpMEJ9puUTk8RCjrzr28yMhoJyNs39n1Ph
         LV1sftb9zLOcjblaDYpmmYC5XQos4MCDlOyN2uTykbsS8LAa8UyNM5SW7tWIikVmVr2e
         gg7w==
X-Gm-Message-State: AFq9FYJh39dbkQFrJVelROaSVmbeRGtNriuQCbMhBMV8n7OBZ1KyenVa
	nBkxQfpMIR4SRv4B5l3ivX93RUPIP5/xR2yT71dMLvhEPgW/9OA/7LeEcw44lLe17FHFw0C6+xC
	pfJlAv1GvYBGGC52QX6qPmDJDSUCpDRTpVTJN
X-Gm-Gg: AYBFou0/no1/RdxXh2yxzPAmbI55HEo/Mr4bOzCHpQGIL/U4E5Gct2JtZwOgZha00Vu
	WEaGnbAZi69KfGePMaMXFFE1Y2/JTWh3fz84lFncwPmTrLPMdSubVDOC1CMBUafFpIYHHoZpqhU
	fIZxjilMH518WDXkRPws30u54wwUW+MFl1Yy1t2Js2gzLT30MWnQgIjOYWuqWs4wEgzwPsobXdU
	fICnseUsgbdzr01nOg5ZeesQG0sksjsN7v+m9k7urri7BIyKsdYYBwmnzdygVNf1OAtHHK96BpX
	ueZTy97YfKt4rV3S8dSqtmjCkldboS1amJ+D2yQvvVcITKTtEFrFKVbvVj5+du75BYwCS2ziXLL
	8JcYWtU/s5UcalHWTshXA5oYN5qbf8mFr2uP5xg==
X-Received: by 2002:a05:6214:5001:b0:919:85a3:313e with SMTP id
 6a1803df08f44-91c12ec6c58mr19603226d6.17.1792565282908; Tue, 20 Oct 2026
 23:48:02 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-7-a0282524688@gmail.com> <sashiko-outbox-169120@kernel.org>
In-Reply-To: <sashiko-outbox-169120@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:47:51 +0800
X-Gm-Features: AclHuK8leOvF9ONCDArFqCNXOunnjuvslXDH4iF86BFZ8ghLkyV1E7Y56MP_8_0
Message-ID: <CAOoeyxVJs+3Wpm3m2YDXPO5JaobW=9HRmiO6-ob55E_m5vf3TA@mail.gmail.com>
Subject: Re: [PATCH v9 06/12] mfd: nct6694: Refactor USB-specific data into nct6694_usb_data
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] irq: lockdep wait-context violation on RT due to spinlock_t in=
 irq_enable
> --
> [ ... ]
>
> >  static void nct6694_irq_enable(struct irq_data *data)
> >  {
> > -     struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> > +     struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
> >       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> >
> > -     guard(spinlock_irqsave)(&nct6694->irq_lock);
> > +     guard(spinlock_irqsave)(&ddata->irq_lock);
>
> [Severity: Medium]
> The kernel IRQ core holds the IRQ descriptor lock (desc->lock, which is a
> raw_spinlock_t) when invoking the .irq_enable callback.
>
> Since irq_lock is a spinlock_t, it maps to a preemptible, sleeping rt_mut=
ex on
> PREEMPT_RT systems. Acquiring a sleepable lock while holding a raw spinlo=
ck
> violates lock wait-context nesting rules and will trigger a lockdep BUG a=
nd
> priority inversion on RT kernels.
>
> Should irq_lock be converted to a raw_spinlock_t?
>
> >
> > -     nct6694->irq_enable |=3D BIT(hwirq);
> > +     ddata->irq_enable |=3D BIT(hwirq);
> >  }
> >
> >  static void nct6694_irq_disable(struct irq_data *data)
> >  {
> > -     struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> > +     struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
> >       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> >
> > -     guard(spinlock_irqsave)(&nct6694->irq_lock);
> > +     guard(spinlock_irqsave)(&ddata->irq_lock);
>
> [Severity: Medium]
> Similarly, the .irq_disable callback is also called with the IRQ descript=
or
> lock held. Does this also require a raw_spinlock_t to avoid the wait-cont=
ext
> violation on PREEMPT_RT?
>
> >

Thanks, the report is valid. The issue dates back to commit
51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694"); this patch
only renames the variable.

irq_lock only protects the irq_enable bitmask, and nothing reads that
mask, so the .irq_enable/.irq_disable callbacks do not mask anything
in practice. The IRQ core already keeps a disabled interrupt from
reaching its handler: handle_simple_irq() marks it pending instead.

Rather than converting the lock to a raw spinlock, v10 will add a
separate fix ahead of this patch that removes both callbacks, along
with irq_enable and irq_lock. This patch will then be rebased on top
of it.
