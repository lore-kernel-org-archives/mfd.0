Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565399;
	b=2EMyTd+zbLJWlqs3hzFHOvXuGZKuqAWpj4sAh+7k40ZMK8Cx37NxW8yPSidS6gIIIJ+d
	 z6UkH2IH4XL+FHGNo5jze9Mda9lc3qT+q1IhZC9YIs3cK+tizh7riGiNK4Z8TV0ymzwM+
	 Q2DDUp8VmbrP30bR5OReUSZe+x+QGSLkJjMnMqtdaPBki9YENNGxq0pnewoAyK2h6RSvl
	 iuxX5eZdYD6CU/lVzjx5TtfnIYcJmjqh6DR6KRMqfQ4EBYnproqwiX0ij3/rWos67XiLD
	 MpC9jZieFTYd7aA8P77FaZUaLUIPhFgrexCbp7gGq4BY68v2xhzptUmGLHLRinxqLEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=byop26hI00dKGF4kjtrv1czumNMi6PlxA5087mNvBAk=;
	b=hbNhcijDqr4i957nPJtnDf2HZSKoW4djKga93F3BtEhME1Zcd8MxplfBS1oLj2mISjfq
	 eCPSwexavfCPVnVz3xQvWJGDm6/aYppGWuGRWFBL7BvYSehOAD5sptrF3wXDnMnp+2R2p
	 TwY+9I27mOafQvDj90GQRBhue1IXcygHRAhAGrnVun4hSZW8hJSz16zR/ujnSPfiBjsPY
	 gT3ebP8Syca7m9RDtf4Hb8BJXfaylAH1ruykKCfIWdwIOOlBzlS6XZEtN22YqRuOiI2wo
	 XENxpcOEbnfoXPKCvG/kFNEPTmU3Uw8X1isS6hUL61NXc/ZYtRBb3YSVZySMs7Ut9Qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pxiobd6r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD1F606A319
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 06:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD1F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pxiobd6r
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f269e335eso44497885a.3
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 23:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565397; cv=none;
        d=google.com; s=arc-20260327;
        b=svU94LEyDtwTH7HwhMKVb2a9j4FKqUb3LpxR/eTPfLGpk73iC8OP0+lKNBa4Lm5nme
         Txt6C7BT6PJe5ohHO9tLrmTs5bJpU/goHlW0jukVb8i6vPXmqcFzAMz+5eX0+Cg64ptr
         j+iK0qxp7U1DJHJjExdFcoI7bio5uMud0ylYq5pRwC0izt7RlRuOuaSqyKd/wWNPsWRi
         nN5cnb0kUXFON+RthEKL65ms1MPgdaVWigfBmDn5HyPonYF0BOy+fANVV2xg/yBmJ9JR
         q6eG1U30Jutv+HlCAIuumQtfCFqdjwqLBQJILD/3EbeUqvMzbk8vnAj1s9sI12u5EG2M
         sERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=byop26hI00dKGF4kjtrv1czumNMi6PlxA5087mNvBAk=;
        fh=SKlRGCwKdtdyEF8Kb5l+vwcMyvzCcNyahRdpojZj6w8=;
        b=k3kr0h8Zv3JiUrOieKTNXPaK2/qC6G2+WeTDQua+fEc0KtxAaQ0vO3ill2EHF06qV1
         d9AagfXuwyS8a/0coUxIbpp4GwpaTk+l1Hje8+Qb2gnao4J2BVq73qqdhJMbQoW0dqby
         X4mQJGemXJgVRTa7J8mNNQzqR7cVmNDAd6rDWplRyTgHwJUVre7YAGzU5MgrKkd1tkG9
         WbvTIrAujwv8c3KvIza0AdvmJUOah4OorSwUaTwYepoMKdOU6b6x58sKcu/Skki8MpRV
         aT79ibAwGreVhTJLISeqw8Xg0Py4qOZaM+sHkBMop+orxQcOw21E97DbD/RnRBTSPUrL
         Vjxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565397; x=1793170197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=byop26hI00dKGF4kjtrv1czumNMi6PlxA5087mNvBAk=;
        b=Pxiobd6re6rUtoRdXVHL2VWUAnsV+G9SMHfqBhnMoX68MMytoVEhqtjZcQWM7zaMlY
         kAlUvLk7D1xDBO4MjfBo7cbDn9qjp64Hnv1CSEyfvWGsw1mzkUHDA+u1DMKi+57m5SnA
         J2UEmGD6e6ujLqaFuBZWBjsK+KNd82DQ3FwdZbm+tv7CbSGeZVCQEbc4G1V0Az8eNTm7
         emA9XmbXaysxZ6wx3KyNGFV9rOj52Qo0iUpKa8NopYvWqx7J4tZq1KUeF++mAH/TSHeh
         2UpCNm8IF5+JZS9I3DVLHxiyUKXFRxGH5rL0XXQ/Pj46thoA0AExRK0tQ1B+EPRyzT2r
         a06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565397; x=1793170197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=byop26hI00dKGF4kjtrv1czumNMi6PlxA5087mNvBAk=;
        b=boR5b+0s9bxu6349XL+6cIzGPDPxTotguI9Y6/1ARUT5pYM6FK/epFmhsOCWRHiqcv
         B2iNu8NCQt4ccSdB3zzK/pzkHj9qlm0Dew/XMbJQvoEPmxGGI6Fz+5Oi2zdf1b02QApf
         NmYfjes9BFQ1YxfuT5eQp5ibA6kHI0e3d7cqmuE/Rp++6VMZvkBceE3atUurUcoRbDPm
         T303rSbI8jgcAgLuJ/GJeznztDTcjDkdLPdgPyBNdPycc5e+W2LgFpZRcRWitRBTcoAO
         0COUboJGrsYrKGFym6TcSRWeOZs8ibnDSjn9IhW/OPtTUii/bn/J53N2zVaklAWDd15g
         KHLA==
X-Gm-Message-State: AFq9FYLFJWBMcml4lv4QqnE3IEKuoLeXatAdtTUGhTMRgsGK+fY6NKdg
	74jRzPo8BJaeC9kHAKkdoRVDKTYLuvneCV5cWbkuDG/Eo4indV/bv+KMKQ053wN3c6lqFKePa/c
	Dr1uoCHNvN8ioo19v2VfuCcf1ORpHc0c=
X-Gm-Gg: AYBFou1pOyN29+iPBfOhtn+N5u1vP+Fclew+snMI5SFirLknNv2RuKIGOGbO/O7l8R4
	iVs67SamOCXHwLVxk0Z/QyNouxQF1hrsPgMGXVsD7P2ZbcWmI8FyviklQhGQt/hvOticxRv0xoT
	Sx+fMKCMuqPWJk/h6RaJCNt/LdKo17JFNORDYdHRSQRAdTm/+EUxsLQd3OuB/gbsCkkKxSfnbnO
	3aYgiSLIWwJrRPZ9VOoAS2xW0RQo1Mx9yLVpw+IoyXXrSF/j+zQny91hRoiBsCgPlgI1k67EOqt
	3FFTch90K3pms9ZtZad7YBzXCh3K/hdjEtsMSiIkoJ5ULw+/uRKqXDaiam4M3a6QFSo/Hsr8DKG
	3cGojyeCgJy/o+Y1GBH8bXmJ5n2D5/SBeop2cYg==
X-Received: by 2002:a05:620a:17a3:b0:93e:5e2c:8bf2 with SMTP id
 af79cd13be357-93f57f1efbemr275798885a.21.1792565397525; Tue, 20 Oct 2026
 23:49:57 -0700 (PDT)
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
 <20261013063259.2734757-10-a0282524688@gmail.com> <sashiko-outbox-169142@kernel.org>
In-Reply-To: <sashiko-outbox-169142@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:49:46 +0800
X-Gm-Features: AclHuK-nXMNcCny-Rh0EBmuIB8LxFqooM3YOtF1zoHaqSsrx1181Jjhs-i_POrQ
Message-ID: <CAOoeyxVZ-shU+XgaaHR07dARtVokwstuVNcctSSPW-KaT8pwUA@mail.gmail.com>
Subject: Re: [PATCH v9 09/12] mfd: nct6694: Extract core device management
 into a separate module
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] mfd: sleeping lock inside atomic irq_chip callback on PREEMPT_RT
> --
>
> [ ... ]
> > +static void nct6694_irq_enable(struct irq_data *data)
> > +{
> > +     struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
> > +     irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> > +
> > +     guard(spinlock_irqsave)(&ddata->irq_lock);
>
> [Severity: High]
> Does taking this lock in an irq_chip callback violate lock nesting rules =
on
> PREEMPT_RT?
>
> Since this callback is invoked by the IRQ core (such as enable_irq()) wit=
h the
> irq_desc->lock raw_spinlock held, it executes in atomic context. On PREEM=
PT_RT,
> spinlock_t is converted to a sleeping rt_mutex, so taking a sleeping lock=
 inside
> an atomic context causes a "scheduling while atomic" BUG and lockdep spla=
t.
>
> Should ddata->irq_lock (declared in include/linux/mfd/nct6694.h) be conve=
rted
> to a raw_spinlock_t to be safe inside atomic IRQ callbacks?
>
> > +
> > +     ddata->irq_enable |=3D BIT(hwirq);
> > +}
> > +
> > +static void nct6694_irq_disable(struct irq_data *data)
> > +{
> > +     struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
> > +     irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> > +
> > +     guard(spinlock_irqsave)(&ddata->irq_lock);
>
> [Severity: High]
> Does taking this lock in an irq_chip callback violate lock nesting rules =
on
> PREEMPT_RT?
>
> Since this callback is invoked by the IRQ core with the irq_desc->lock
> raw_spinlock held, it executes in atomic context. On PREEMPT_RT, spinlock=
_t is
> converted to a sleeping rt_mutex, so taking a sleeping lock inside an ato=
mic
> context causes a "scheduling while atomic" BUG.
>
> Could this be resolved by converting ddata->irq_lock to a raw_spinlock_t?
>

This is the same issue as reported on 6/12; this patch only moves the
code into nct6694-core.c. The separate fix in v10 removes the
callbacks and the lock, so the irq_chip moved here will no longer take
irq_lock.
