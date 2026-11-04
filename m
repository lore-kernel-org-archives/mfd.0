Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793820732;
	b=kqx9BpZxfxUTEYEBtzJBefvazWTp/hAToyd+lndFhbMVXc1NK0VwpLrcIXj5eQDg2ZmC
	 9zE0mKNYXU3pEdY4womGtLhRBjZpf1rlm5pHYV1K1L3wqTV0U1QNxfK1SEKIJf1MoNqB4
	 GVEWtukiDusdMu7vSVwL6IcKSDvVqPlO8j4ztJSQ5IZahSUi1OQPaYUwp7RHbbhAdXfAe
	 1LhICGQxwpA9oBQeSj0GRQ8NRUmRgcWW7NBdJDnh/pFNS+TxMxBKRUU6I/EMJ4ezVGsQx
	 CbIcfW9GiK5Y2mY2N/vhRDzHjnDu61RLDkdtIIV8Rr20tFTEPeh8zdYtjSbjeNh1eWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
	b=rzcvm2JJI2KOSZcPte4vwK4uX56drGrfkCDh1+GIkty3I5nX4em1bvNW6k961BPNQOp3
	 Ozy9F0fOgNaQU1hkz9RRm8pEZwPdjvWcKlfJli8R33/SkXyBfRW6EMOqolmifd4FI7FUZ
	 /uBpAG5m7xAEXc3tnrznNFvlZbow4FAcTmTsG+a4PAbhNThDIOAu8fhVe+InKw8LaRqYE
	 pErXtDZQUUZD+vN3GljQEyyUxT0LiVPrz0N5A5aXQjwRHHTElgty+lIjO8azBoG6lHWcv
	 fB8bKArIc7TC5FmU6BIHSVht9ndB728sNXECfZts5pt9D7hsDNasJYz1xQWj6lvJ9Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Hg/15g8M";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BE5606D16D
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 19:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7BE5606D16D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hg/15g8M
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so732286a12.0
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 11:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793820731; cv=none;
        d=google.com; s=arc-20260327;
        b=F5MvoOkR/+F43fJN7OJQm3s380HJMBDiziKYpjVSdviW0s9PjTxEFAO1G1EADJXjRW
         5KIz4kAfEleCiIgSpI/hSaJ4IhqoerGjUybT8n2ATqVMN7Y6/YEhjKX55UE3nRLnxB9e
         IMxK+S0kBNEFLKf7/maF3XhauvkQVbdkR30q10msX8KDXB6Xl1IZ5BoBVC4KKML/54ws
         nW79XJMksA6jh2Bl1mu2h4kPActQfsGyxOaTzdGA5GK+jT2lLfXIJMtha1vJ6hsZNggE
         1OE+AI7Ei8JlQq/eMvIIXkdmyk3gLQHUSnMS0FMHOHxH6CynLqxCKTNH1yMDM9Zlrxej
         lI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
        fh=hBik53CLEhJ/M3HadkaZqOtSHVz1dr6uJSQgdvyHmT8=;
        b=U4IS4JPjw5ZJj/KDqBh35JLCcbdBHd+L5TEn5fOrl52g92Sey4ASyD8UYr7ETPwxUL
         rRgCUrNcbxB2zhehIPcA3YB9l+PjRQwiq5JOdCnot4t63jff+juVFG8NlGDfey4z8gvI
         xE3KkRHBVHKFoURpqO4ewGbbZbGTExs/WqKUxdShN0VHInFciA3KlqgFoa5TnNHxMIXw
         oZGauqQSA66amUmVhSLkvcr5iR1xTChIPC4j/TFy1GalzU3r58AFBANrzn+hlzTieAdp
         7aaDQyhl9IBwx0tJek9VF8axfqH/yk1AyHlNQZwbX6LKwLl1ifFImfYEPx1g5q7fSQoQ
         +PtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820731; x=1794425531; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
        b=Hg/15g8M6iDcd4O/oFltMoCO81qo77fdK0cEN2AAt6TQ2ZWHTorFUTp5Lc4Z4lUdht
         o/gYTlSJug+8jcaWEaujLWO86n2A7fD8JJ4oXsPXJaB1f4FKOslMcb8P4zVrRQxvOdOT
         EbaRzF19KOT4t3VptYgvgQAknHw7awX0zV1149o1H9rVbRudvjuoMb9T1yZtCHVPV9cO
         baQ8t7Bz6/ZzLg8E1E8pDYxilCPT0eAX5GCu3iZPhwnn/L6bXLIjr/9nb4Xey2jqM1hy
         tPuyh3ckgDuPMubT6bTb8EQkug8ezxop9Rxbb4vNaHMM0Hyezuj8jlWBCLyXIakzt94S
         Cs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820731; x=1794425531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3nAHmGYXnMcDe++jv2dspeMNBjGKsE0qUJVOHBRkC8=;
        b=zNpN1MFOzyF1fyiNI0asr1oZYggZnQayP5UKxAlefJC5F1mCWZgSn+hZQTQ0jteuJM
         d4cIwYkNLuNkG+/vdAD+Yoe2HMx83gGPiJiLpGM8tBaZlfWcsDbHWIomPGD/00Rltelj
         iQasEUlnilIiUtWWkVosutlaRm0hwjwsEnLIsvk0phjVNPwwiIgx9ShHaqdzkhf2kQU3
         NEUOuLFBXNyCJ6fpfC1ugt8MUvjAaHsxEQJYDgjcakLfP4P+XI3DEJm20bJT8aEyCyi/
         ILpkTD54TsRHXyopQ5n5jT4K1pZHETL+xTXZzJ2UboHQ6KCPXwXJyQH8HCVJG45wqVvt
         O/kg==
X-Forwarded-Encrypted: i=1; AKwUvBycVRXBZ3xRXvoBxSm/XZShP7kV+Ql/sSiRezYQFqmR6ihcUjRxIrVDe1gzKhJP/3iJHnM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8KI6RGNBGCm4Ac2daVzYczpwCle+vXKtf94qnSkCZhu40WN1KS
	tZWjVqq/8RF8zdke4AQqurct0z0+Nqpj8RmVMMXOAX6tYVXAs6AlGJX9G098rru7ms45RYkmumc
	EHvw8ednDDd520pbboRmPobBHnkUss7Y=
X-Gm-Gg: AYBFou1UmFQxDKnJSai8d8xoiwH5fIRkzTGy/5i/U6yeCIVPECVt8iQ2e6/G+5jODLy
	KrWA0q+yshHND4dY0MvyTRNGg59iGgxBcHYW7H9R9wW76ArWo3GN8MOYNDWNkiBDcPa4kO5Uj9Q
	fmZ6V10lyrNrpu43c7H1btXW/2rm74W6YrSzko8lAr5FEJuviG5k41RPu6JDUFqbvEHQYZsIiIc
	uOhmPGkOQ4IBgQfv5Up0012VdYdm8rpgfAxzIxf9qwODEQw2yjR/OlqB/esGXwGHlolKtvq5l59
	B7VkJeuZM6105Q5Zg0PiPQli2q+FGyBd0pAHLOqwsc1ouTsuLi7hVcNKFDw4Ed2UEmwiJyxduTv
	nwf3BPsTRQS7eW/sY7dmmWYW1YxvYG08nDuulItg7WwWcUUy/26w7
X-Received: by 2002:a05:6300:6301:b0:3eb:3b69:77d2 with SMTP id
 adf61e73a8af0-3eb3b699956mr8004490637.37.1793820730833; Wed, 04 Nov 2026
 11:32:10 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101223125.302001-1-pmazzini@gmail.com> <20261101223125.302001-7-pmazzini@gmail.com>
 <20261104192845.41b086ea@kemnade.info>
In-Reply-To: <20261104192845.41b086ea@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 4 Nov 2026 19:31:44 +0000
X-Gm-Features: AclHuK_sPS6tNsygd2RlmqWR3IgNt41nRWT_eWvnGH5AVKDifX_oDkfFeu2npZs
Message-ID: <CAAxh=jtn2W91m9RUQqN-o=FEr+F9H2gdTKgE5UQ+MQX9w_QDWg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] regulator: sy7636a: bind to the I2C device directly
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Nov 2026 19:28:45 +0100, Andreas Kemnade wrote:
> we need that regulator enabled for i2c access, if Patch 5 is merged befor=
e
> this it will happily try to access the device without it being accessible=
.

Right, I will move this patch before the hwmon read change in v3.

Pablo

On Wed, Nov 4, 2026 at 6:29=E2=80=AFPM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
>
> On Sun,  1 Nov 2026 22:31:24 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> [...]
> > -     ret =3D devm_regulator_get_enable_optional(&pdev->dev, "vin");
> > +     ret =3D devm_regulator_get_enable_optional(dev, "vin");
> >       if (ret)
> > -             return dev_err_probe(&pdev->dev, ret,
> > +             return dev_err_probe(dev, ret,
> >                                    "failed to get vin regulator\n");
> >
> we need that regulator enabled for i2c access, if Patch 5 is merged befor=
e
> this it will happily try to access the device without it being accessible=
.
>
> But it then is just another error code than ENODATA.
>
> So if that is considered harmful,  probably this patch needs to be reorde=
red.
>
> [...]
> > --- a/include/linux/mfd/sy7636a.h
> > +++ /dev/null
>
> but if it goes in first, this part will make trouble.
>
> Regards,
> Andreas
>
> > @@ -1,34 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * Functions to access SY3686A power management chip.
> > - *
> > - * Copyright (C) 2021 reMarkable AS - http://www.remarkable.com/
> > - */
> > -
> > -#ifndef __MFD_SY7636A_H
> > -#define __MFD_SY7636A_H
> > -
> > -#define SY7636A_REG_OPERATION_MODE_CRL               0x00
> > -/* It is set if a gpio is used to control the regulator */
> > -#define SY7636A_OPERATION_MODE_CRL_VCOMCTL   BIT(6)
> > -#define SY7636A_OPERATION_MODE_CRL_ONOFF     BIT(7)
> > -#define SY7636A_REG_VCOM_ADJUST_CTRL_L               0x01
> > -#define SY7636A_REG_VCOM_ADJUST_CTRL_H               0x02
> > -#define SY7636A_REG_VCOM_ADJUST_CTRL_MASK    0x01ff
> > -#define SY7636A_REG_VLDO_VOLTAGE_ADJULST_CTRL        0x03
> > -#define SY7636A_REG_POWER_ON_DELAY_TIME              0x06
> > -#define SY7636A_REG_FAULT_FLAG                       0x07
> > -#define SY7636A_FAULT_FLAG_PG                        BIT(0)
> > -#define SY7636A_REG_TERMISTOR_READOUT                0x08
> > -
> > -#define SY7636A_REG_MAX                              0x08
> > -
> > -#define VCOM_ADJUST_CTRL_MASK        0x1ff
> > -// Used to shift the high byte
> > -#define VCOM_ADJUST_CTRL_SHIFT       8
> > -// Used to scale from VCOM_ADJUST_CTRL to mv
> > -#define VCOM_ADJUST_CTRL_SCAL        10000
> > -
> > -#define FAULT_FLAG_SHIFT     1
> > -
> > -#endif /* __LINUX_MFD_SY7636A_H */
>
