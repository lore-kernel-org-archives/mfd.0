Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565458;
	b=OlguZvk5Jw4onjWJldmiX4YffToV9w3r5B1eBG+nXr4lBb9oHu8g2po6JgOsBUjlFhIF
	 BgS7KkRyrj93qRxDds6DgmnhbyKDbNKD6tMgdHwvbJVH3uZtmhZ3ns9+gDJIaMzbuMz9r
	 xiHjGwu/xjrRD5Q0yOQHEWteDTyJ6duLh6y9/+RNOEMrsKYKkqQVrUfAiLJ9OC4+G6a6o
	 88o5/ZcAdpC9HqQLrhl9i/12prK52a1ZDmSTP6bgfUkrl73lU0aIWyW6+yzDOX8T4FRAW
	 b9d07SGNNoUhCkU2s9U/9+qi6OrLh8JeXoWzvvWE01rmHQOJOdYQNDwX3RmiRHvt9Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nZ4GrCrxZZ8zsc/ycY/qdK9MP/BYV/nhueSVtx0nY78=;
	b=bp3qu8lZ8R5X/UGy9SPLXJPqXxRBkAegqa/6mxAj61mSg8YINS7HnRHb85nrGOmHZixn
	 AVO1nxXOux0Q5dMpIz4yGCdER0hybYQDy+dCJMaOBzj8v2cpXR1xLRlIMmzuMLjPge/07
	 thmD5mA+ZyyubxC3M7AasJgVUHDqZBD18AC6qTOzdrueSOdo7lGFTsYJ3hFCHdfGoB2tQ
	 Eb6FqRtRohuqnpHTQ5loPmjLIbWRutlw5UVdgecVi4a3kECuvC325BOvQSrOmCU4U4WwG
	 EoQosxjkEPenOr5fJ1RRPojJAwSchD8w3XypSz8SDkM1/r9pu41NJfl8Z5r4KQoblLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g80Jmac1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6093606A31C
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 06:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6093606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g80Jmac1
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91b8306b9f8so6845476d6.3
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 23:50:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565457; cv=none;
        d=google.com; s=arc-20260327;
        b=R75eWNmyBpUwIfZz+ykCccX+k1fe+s/KWRwg7y9J5S/nqwh40kkv3Jx9L53TojBfi1
         0vlf/3K1SSyX1tHjvF6sXgWkjHQRp+O8nmC9vBbpTHnFC4P5sgLSVCXhM/rqFWULjr0c
         YsyADw0THfAIg+x+JCBpgeuya6Vqq/NZB7vcSUpag+yYWngoMpHgFLNlUokSE3tpulKo
         G0OhqLXjBz6/h8D5g1u8fFQSTu1N4avQnoZw7Bpd6Bzf+lP/ithBaB3AdU9hbfLlqXeJ
         YMKBM1+q/MuCqCxooVfpZGvDRzCtbbec3h5RI+NsieTrnbVxPC4WggjziByLXwxljNey
         Xr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nZ4GrCrxZZ8zsc/ycY/qdK9MP/BYV/nhueSVtx0nY78=;
        fh=SKlRGCwKdtdyEF8Kb5l+vwcMyvzCcNyahRdpojZj6w8=;
        b=CrqWRiw/GSjpHS1n+QqDyTR1p9SgqC8bUP5A8GPQGPSuJi/YtrYSteQ3KIhB2/PPdB
         38lZxBpKuz1Ot1od5JL55VFVCkJQgYbzUrQG1MI6R7vILenTm/N0J6AWQv/3wbkBljt6
         M827eF+wp0jIaNyU1YHzlOA5iz7T/8e7uyxrl7XusrhAqcUwOkym7DR7K16DZeT8VD5b
         jSgpGOEIb9qfSLb3JiJA51rM7qK/xtCQ0NOpmnNlwiqNs9cAe9alW/pLm3ejKeZvXQgE
         5uPTPDJYcGOvr0bcMrx+BQdUl8umNhjBfgwXpaBBGxaiEhQWtl5zX2LtslXOvqyqXb4m
         tRgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565457; x=1793170257; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZ4GrCrxZZ8zsc/ycY/qdK9MP/BYV/nhueSVtx0nY78=;
        b=g80Jmac1DRf4eWKn3Vop8+wFJNy5ddCE7MEbGelbkScbYy1AVQyc65kOdL16b5eaOc
         WoWYRQ1kKii5fFOAsna/KF+bqSjb9KEXPN92MA+EfHbyPGOiR4M99jZ2yWNA43BhSzak
         TnoDUNxm1bbFJ7UMQaLL4o9pmnq0bOkFdcmToXmP6akxgEqPslTgmm73+vmLz2u04hJB
         SQ1uM15ZwPRfJ72tnzIcr6JyXgJ5r8yLR612qieFvohCbyeoEgRA3LHC9IPgSmVzPcfV
         PgTxGDIY8GYoONRfKB0kbfvvh+s4KiyRAE+73/mwwaF5jmPcF6tEiGrl6yMiexAhjhKy
         wUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565457; x=1793170257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZ4GrCrxZZ8zsc/ycY/qdK9MP/BYV/nhueSVtx0nY78=;
        b=gtcNIaDhShQ0eOCDSWrDgp6KNk0rjL5O/hkmTjPnUW43XMEiZsiIXKcHiZFHzipizp
         PRnzXtVh2QRbcXqE894OTDUw6rmv2nk1e+OLyQetNHiOhZ9kWYaps8EqVNNycEcHCPhG
         KBcpSm3JNrK8USSLPgHjNqtAirhCb7uzAP01RB3kPhuScKCmDt7+DF58L8jbFiSnNuov
         3JqZFjzjLTFHzNA0Z5USmB/PnHGyELwxhANtxpBT0mO8rEaFvdgWvU0GGrg21aXkG3Mq
         xojih87v1ycOxiGY/K4rJcnIroUYOFm4jgDhccJS0xGdQ7LON4GjTYJr63702bkkW8lq
         MtQQ==
X-Gm-Message-State: AFq9FYJbQOP8oylrONGYzG7B4ByQYt6jgqfEcNmqGKrcYpUF/9iWzRoF
	UHON5qbzaKw/Ir3H6JcnP8O9K55B6TUaH8oia4+zPKYKIiMWjdLnM8C5TuXOY/DSnd/TRkyckdq
	TstjVzPWK0QoV9Xo49eAVcW6jOtmWwSvF88vQ
X-Gm-Gg: AYBFou1xNkREhDdXZkkPkMxFKQrVR2KH9kOPvW7PU3UBkpmOF+cyS0rouFsqfnz16Li
	oGwWKREiExTR7UQwhLvf8m93YJXzT9x0tx50/D/g6ZtP4tNjePoOjG7EjDXO+pvnA21pQNiVxXk
	a9dk9BhuBMQltsZY6BcgJpqynp2sooWZq5fyV7BhVJ5QYDaFQ5QnU6NGYJCKtIXHs/6ztuzL8Qh
	lgCAvfxaEViPQMdPqp5dDFUT56FFRFk74FOZC7D5YBq6JhE3lmzpyjRR80VuMJCAIHdp/K+m0WP
	77VFC/CwB8WlHsVWvpChs89bm8jO0in9tbfyZHSGBMAcxNaFvfnhehOq8lEHjRTIVgUgBcNznM/
	DQxBXhSa1EnqUh9Ena6KB2shqMVgfy7fZi0i/pg==
X-Received: by 2002:a05:6214:3bc5:b0:914:525b:8ff3 with SMTP id
 6a1803df08f44-91c12ee14ebmr19628896d6.23.1792565456830; Tue, 20 Oct 2026
 23:50:56 -0700 (PDT)
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
 <20261013063259.2734757-13-a0282524688@gmail.com> <sashiko-outbox-169155@kernel.org>
In-Reply-To: <sashiko-outbox-169155@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:50:45 +0800
X-Gm-Features: AclHuK8l-GakzbBBAFJIhdIP9XwIuXlTamlHLll5qwcy-5fawq88ReLULCKF1yw
Message-ID: <CAOoeyxU3KT25s0V807xFtk3Yo5RNqtOcADNm9dyxJijjRuoaPw@mail.gmail.com>
Subject: Re: [PATCH v9 12/12] mfd: nct6694: Add Host Interface (HIF) eSPI
 transport driver
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] mfd: nct6694: uninitialized kernel memory leak in regmap_read
> --
>
> [ ... ]
>
> > +static int nct6694_hif_regmap_read(void *context, const void *reg_buf,
> > +                                size_t reg_size, void *val_buf,
> > +                                size_t val_size)
> > +{
> > +     struct nct6694 *ddata =3D context;
> > +     struct nct6694_hif_data *hif_data =3D to_nct6694_hif_data(ddata);
> > +     u32 reg =3D get_unaligned_be32(reg_buf);
> > +     u8 hctrl =3D FIELD_GET(NCT6694_REG_HCTRL, reg);
>
> [ ... ]
>
> > +     return nct6694_hif_xfer_msg(ddata, &cmd_hd, hctrl,
> > +                                 hctrl =3D=3D NCT6694_HCTRL_SET ? val_=
buf : NULL,
> > +                                 val_buf);
> > +}
>
> [Severity: High]
> Does this code inadvertently copy uninitialized kernel memory to the devi=
ce?
>
> Looking at nct6694_hif_regmap_read(), val_buf is an output buffer provide=
d by
> the regmap core and contains uninitialized memory.
>
> If a caller (such as debugfs) requests a read from a register offset wher=
e
> the NCT6694_HCTRL_SET bit is active in the hctrl variable, the driver pas=
ses
> the uninitialized val_buf as the tx_buf argument to nct6694_hif_xfer_msg(=
).
>
> Since tx_buf is not NULL, nct6694_hif_xfer_msg() then copies it to device
> memory via memcpy_toio(). This would copy the uninitialized val_buf conte=
nt
> directly to the hardware shared memory mailbox, potentially exposing kern=
el
> stack or heap data to the device firmware.
>

This is intentional. A read of a NCT6694_HCTRL_SET register implements
the firmware's write-then-read command, as documented above
nct6694_write_read_msg(), so val_buf holds the request when the read
starts. The only caller fills the buffer before the call, and regmap
debugfs never accesses SET registers. No change is needed.
