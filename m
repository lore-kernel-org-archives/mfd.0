Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795153035;
	b=Kgx1IPkfZronuTJDO/Y3xkg1eVPlY7jbcSp8qbtOzRt9An1tRQcD15DOVWt8WiVETk8J
	 GCOqL/qUuKmNd1GoI8jmgcIw8SWsv814VOpqOzHLxUUvdrnzk+lj/9ls0Ttd6zbbcJ6G6
	 dst1kC9vCjvDCdw4Wcj43Jc4UtWBonasDUMVjERdrHsRhxyD1kV5VnNbcU+IcKmWdcomW
	 YRMRc7SkIUifkRudEGJ95hWvEhJ7kQISIUvaI1OefgTQ+N0VxneMVzyvUJ62yqpnyn/CE
	 OX9loS07AXUygLVKjlLS2QDR/5v4za/R2G+kTbtJcD40t8Amw0hw65ioxIbTbCFbmhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B/0atRX3itSILPoLTT2jiynyQu/IGk6Wpmy+FZVV2so=;
	b=rNErwFbBiviLlDqsFS4V3rid3BdOyGeKhMIWiQ69ClWNT/8MFJzqYbfhJIkIFTrFv7dN
	 1srBdh82z9MVqt83Af8dVl6PpP5wJU5Ugh1E/n+h4uZKQCHsab/BQCFFNXJwfyB/xt2+z
	 VEnWCoWrXB2O+Qt2HPGsilAihNwsmxGk/M7vYgFbT1imztg5DKwfvrof8VJ/+nPTNEtXm
	 cc/jRzIaEoWMOxG9tMpwDcDO8rPY47xsN3i6drtCbQsbbOlVAqmOkdBcd5UtzMb6DzYVK
	 v3TkUDL9UaJ4T/4nfXPoFNksFoPDu24V1S1iWXlJLEX3OQXzEZOjfbrjKD28WthfTVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ao6peS9q;
	arc=fail smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CC5606A320
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 05:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CC5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ao6peS9q
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55ade1de0b4so6492541cf.3
        for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 21:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795153034; cv=none;
        d=google.com; s=arc-20260327;
        b=bYZr4AA3/3LZ5G4Ssy9HrSuMDpTRoGLxnXJLltm6kKWoX7oP7whwhnSaRmi2KsODO9
         hDfRUSQeu+vAmu4A7WTKxs1zpZ6xw9L+KAMc/tmwDCFMog6tADq/gg17onR6gWUkyNrE
         pSqMaAn1Ox0yzPr5EyH1D33ODfcutAK/8elfgPL6hvzmGZUgirIX0Vo+3fNce0NfNLoM
         Bm/8U7ZBB6Gj7c5Pz2lSnrDQHIF3bWqiecFpb2hqKsPf0z7dl7V5hbZmOO00hYy+mmYF
         OnnTsJXQtOeiAwBDVk3SxfdHWtTFP8xYPlTsF3VIZRSi8nGmkeZUPnt+Tjj5DPMH3JpR
         82Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B/0atRX3itSILPoLTT2jiynyQu/IGk6Wpmy+FZVV2so=;
        fh=WIzNQJOvHMCW5pVQKVfY1PEzEMg9jNQFjQ6Wn92qo+M=;
        b=UScqYjSWmamwlD7Rf71tbpU0NIUdO8a7XgOZR5IlOUuzUgoOLzxKyXZ+JEVAUwWIEN
         2NbUGRMTeEDVD+5hj2UrsXIO2mH4sTXdXdXd+cR0QUaVIss4YwCEHIJLktvYg/nsaSf5
         Heq4UFfjLtoAQJtYQmVJvZcZg0F7/XYPDYryaIHFOEgWE5Ba51mlnFXSkoZ1ZzEPBDoa
         Kx3uoTfdnGN7cT31huUnotdpfh06UjVM2s1FTrKPoAn84Ayh9nxn5efu1Wz9EwpxbBsm
         EdrhKs5JkBJxAOL1hwrK4rJsj1mUriMcTzIkoj9v1h5qolehr1LTdx8EjtOq8xq1Iaoz
         fypA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795153034; x=1795757834; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/0atRX3itSILPoLTT2jiynyQu/IGk6Wpmy+FZVV2so=;
        b=ao6peS9qfMEHzwqzmb/MsFN/9oW/JXdrvp2finU/3+fa2nCsNNzlebRfLKS+NY9RRm
         sS6SPlLU7Yrlk+McQfxUBqUBmoyxmMbplSmHJNeBhM4a9xGn+DWvaSlC/G72l6wvHGMl
         lyF6VoBW5A2r8yunVqKN3iu2e3ZVuXh4X7erJjr96/JgcwzYV6yAEYx/Ikl2uzWUYMf3
         pbTSbskXmMuG5zKMi6NDjE8rmeHKd94A+9VahhMuHDyCRdJKvRIXK2OGOTbKJVWlHyqQ
         g/xJH1neZQXO4cjTqfDTUWfhLqIjx5wllO8zXd3nDe6acf638knZn5EIIvwG3Gsgzbhq
         O9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153034; x=1795757834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/0atRX3itSILPoLTT2jiynyQu/IGk6Wpmy+FZVV2so=;
        b=uXC3XZ9bGq1MSiJwk0C1CGZ4TsEUi8c6oLiFhjg+smskqzanPOCKWmzNP/iCR3dj1m
         3yegl8TL2sSR0MA5V+8kM5eaxzQgQBsMt8zqfv3UCHCef+PftyJBAL+HSTIVBsD36t5K
         5+kmas5jOOtzT4JBjfvckFXeUxmlZ2u2lJ6sDahWo2C6O97PGyPeXkhi2FMmkV5rPXcp
         YlnttUrxP+sjILiEKfkQb/owT+YqjbsDQkHqmeZKrSmGc5Ns2/PWW2yv4cYcj6JXNNYw
         kRfxErMvGjv1ErAe5qIl9lJdR7kRfrGJnQDnv3iDcuZ2YAJxBDFhmXQb813Z9sXMNR91
         ns5g==
X-Forwarded-Encrypted: i=1; AL+hErEYRMBARIfFEuPyDnS0CIZ/zcC3XoAvtBaogWJKHg91QCuOo9bSHpffLHc2nG4KPI3m0M0=@lists.linux.dev
X-Gm-Message-State: APuU4Z9uaNViVA6JyGJCYiAaf4DQZvyQZexIWUUjbZ+MFM4IsmCMYAGJ
	+RW98CcN6P07BkERLHzoUaVN5EtcQsYZaV+90G6DtxuRB/ClKcoDGXC3j7UM49ZKm9OCCQxtE4b
	c+jSFKVySXU07aHn40BHgWxWo6FCgZsM=
X-Gm-Gg: AYBFou2fq6WpzMQAWwyT44ozsU0G10DCrP7BoyxEw92HQNUhLPw0GvHI7CXxxsk9yI4
	U0iOzSkL8V41otxxGqvW8RUpVkh7BcSVv/qAF+jhvy0mfSKgy9C+tM5mttAZOHSPQIAe3oB4z6S
	5VtNilYWDpGiHeFOfGbNSwmO6XP2ODt4UBhyz+TVF7ocRyuJSI4HkbRU4FZPeO3vs4B3xSpb5Bk
	WjK7mSuxL7UCULb9+KpLREGW6iKwMjjatUAkfRUZ4gQYrTMhBWjs3c8fAeQSfs5R18KLfPYJlFO
	VEK1etfGMd2YJLZn1ij5mLVQecIJ+jGzUHVUHZKzdTl9SIJT1Spf5UH96Y4ONbekO//iwnA2I0A
	i6P2tbIdA0q4l2BqRTM8pGUado0A3I6tM3XvCB9Q=
X-Received: by 2002:a05:622a:228b:b0:55d:2caf:ae7c with SMTP id
 d75a77b69052e-55d76a6e947mr36676041cf.19.1795153033968; Thu, 19 Nov 2026
 21:37:13 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-6-a0282524688@gmail.com> <20261119101233.Z-LmZvya@linutronix.de>
In-Reply-To: <20261119101233.Z-LmZvya@linutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 20 Nov 2026 13:37:02 +0800
X-Gm-Features: Aa3M54rJzQMDbjIWqoH0okOv_GH6h7gkNtMRDZ7Tenmh0mHV2sFIdcgXND8rGn4
Message-ID: <CAOoeyxXMPyG+PWiW5X5NHiH5WMaktCDPjH5-069MwjD-TC=amw@mail.gmail.com>
Subject: Re: [PATCH v10 05/13] mfd: nct6694: Drop the unused IRQ enable mask
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: lee@kernel.org, Ming Yu <tmyu0@nuvoton.com>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, 
	mfd@lists.linux.dev, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Sebastian,

Thank you for the review.

Sebastian Andrzej Siewior <bigeasy@linutronix.de> =E6=96=BC 2026=E5=B9=B411=
=E6=9C=8819=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:12=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On 2026-11-18 16:16:16 [+0800], a0282524688@gmail.com wrote:
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > The .irq_enable and .irq_disable callbacks only update the irq_enable
> > bitmask under irq_lock, which is a spinlock_t. Nothing ever reads that
> > bitmask, so the callbacks do not mask anything. They also take irq_lock
> > while the IRQ core holds desc->lock, a raw spinlock. On PREEMPT_RT this
> > is an invalid wait context.
> >
> > Remove both callbacks, along with irq_enable and irq_lock, and keep
> > IRQCHIP_SKIP_SET_WAKE. Without .irq_disable, the IRQ core falls back to
> > lazy disable, and handle_simple_irq() keeps a disabled interrupt pendin=
g
> > instead of calling its handler. The behaviour is therefore unchanged.
> >
> > Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
>
> This sort of makes sense. But how does this work? If the interrupt keeps
> coming the irq-core will just suppress it?

Yes, that is my understanding. The NCT6694 does not provide an interrupt
mask that the host can program. The firmware reports a 32-bit status
word, through the interrupt URB on USB and through shared memory on HIF,
and the transport handles every report and dispatches each set bit.

While a child interrupt is disabled, handle_simple_irq() only marks it
pending and does not call the handler. When the interrupt is enabled
again, check_irq_resend() replays it. The parent should not be flooded:
on USB it is the URB completion, and on HIF the handler clears the
status on every interrupt.

This is also how the driver behaved before this patch, because the
callbacks only updated a bitmask that was never read.

> If that is your whole business why not use dummy_irq_chip?

Thank you for the suggestion. I am looking into it now. As far as I can
see, dummy_irq_chip only provides no-op callbacks and also sets
IRQCHIP_SKIP_SET_WAKE, so the behaviour should stay the same. It would
also let me drop the irq_set_chip_data() calls, since nothing reads the
chip data after this change. The only visible difference I found is the
chip name shown in /proc/interrupts.

If you agree, I would like to switch to dummy_irq_chip in v11. Since
this changes the patch, I will not keep your Reviewed-by unless you are
fine with it.

Please let me know if I missed anything.

Best regards,
Ming
