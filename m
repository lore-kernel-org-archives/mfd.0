Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EF33ACA7F
	for <mfd@lists.linux.dev>; Sat, 15 Aug 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785286; cv=pass; b=i5hg93vuDcoYWP70S4s23S3Yr7R8Zhpyq0d8cyyU7A8Kds5D3St/pD0MC8AzJ4MJVi6sVnLtzVfdiUJY5IYjtqsoDVEVwT5T/V0U+4sGWzl898TYMYb/QrPf19/VkMZXteqrXTFSDrlaKNN7JFSsxx/Df4DReu5/+3USbLGQ35Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785286; c=relaxed/simple;
	bh=5fQncidyqju5XwIRjWaEWUVmeKeo8nb3CtmIXxuvC0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcWZxGssIN4vSYsrqVi458BWpJJinAahNmpKTr8fmdbJniAnbD9YdPrt8M4JBwJSKm5nUBleZbEX7pGui01NwKakeDZE/UxhwMvzuuwvSf/B3OWahz+eutQJ6daMT3KNZibZXPRnFPyCQGgxK9Vk9LEqOFsKzmwntTOqZU2d1Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7HHhc+5; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7HHhc+5"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso2593491a12.1
        for <mfd@lists.linux.dev>; Sat, 15 Aug 2026 02:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786785281; cv=none;
        d=google.com; s=arc-20260327;
        b=UihC41GbXNPA5OxB0gvUkoLOFSUdSkx7bQsEQ+MyKty/tL+J5lnfjAyL0YZmSzbpvv
         cqPC7BKiOi1yNznnbBAXhyXLm7aSZNarNmwmZVzDNH4t8tZPiFpSPBCsjvltO6++6sNJ
         olsQYUAU1hV1Co5elzwNif8Gk1hnN2wXeEmoPDYNu1o/KJZl3Q3Rq5x8hCsbty2p+PsS
         cgUi0FtxTVa4WBntTC1ZV8jiMeARkBWCucPHiV6/Lw8s6ncs4EGgAL8ThY/KQ23uOLd2
         JqX1gyUiAQBAeAp+5LWgZpJZNlVeZdSlnMD4/b4dcHdVGHzBA5tBhemb1PAFJE/fPXY2
         pVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l1AHP1yiadUPKvA53vmM4QSUOpatBxef1dyJnSggtJU=;
        fh=w+pGLD/huzeFpRbnRNLOVzYzDjm8jkvOvtoZbtHjlAI=;
        b=bQx/dDaAyxu/Maa8c2Mt0k29xvkP12iht7c0CH7NJ98VxvouViQ7uoQkO9ZNEyIswz
         tKUFlr/UUXmDTFgpucAx0haQGG50Y2zIxCuJmk0c4tpKMetYJTi2cCnb4N6WZoTVPtWl
         YxgcC3kGPem9ia8HSbGi4k58yV3fP68TRhsxHdmR+IkhjfCyvL+3Bwo4dwOvX1lkygsZ
         AvWY11WWZ/E0XHTMIucGW1EEX+FzMHtWFWCm+3CmQNhSW+g8ITq1cwYUrFYhJjn98mA0
         1RvnE/H4rFo8uos2OCn6zTsvFrRm9FxvyvK/po7ZyJPRzqapCx9m9sT5Ha6lbrl2d4e2
         SnMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786785281; x=1787390081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1AHP1yiadUPKvA53vmM4QSUOpatBxef1dyJnSggtJU=;
        b=f7HHhc+5cFgQTGiKJiLds0CB62eq4ADk7JL/64O0uopQJ7LtGexbgqRK0o+fqPGSLo
         s09eKW17ggAQakPiEZ9MaytL/LzMda/YV5UDgpuNIMYsTv9SWCXrCV3JHaV+QCaC6Zkv
         sVgbOW2I2ZB1isz1vLkhEIVdI/IfxaXu8gCkIOnkX26rAVZNiztHINVbxf+XL09Z9H1r
         9evFqTrRdLmJ/WkCOOuHaMuur4DtLam+0FVpbz3gSXvLtcQjq4MdRRH/kerzchan92O1
         1OmmhWE6x9DfawdZVDC6QSpqp61fUOemh6uAPfnXJktt21ROx+CDRY3uFlWMRV53mOL3
         MPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786785281; x=1787390081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1AHP1yiadUPKvA53vmM4QSUOpatBxef1dyJnSggtJU=;
        b=pGxw7ZGmnZz7yemGb12VeVqBrlZ+4LcpjdUbDYiuby/481Wn3cnihMD1Gwx4neoT4N
         y7Gmk09M9hBt8hN3rSYh/XykKSaLKlWwdwjtL6FnKyPP8SRqj/yE4or0qp7scHwCKF4N
         pXXzKcfgbCHg/BmDE0HM7x91nxnfSsaeWwlerdVF8GyXiFFOo7NTZoteYSMqmg671iuX
         fp4E1QrQ3S7M7ZAiJqDSARC/NdUhAonreCmJoyNtTbsTni+3oTzcb+FEF921A9o7L4o/
         XDOmOQuqP8iDdbHO4B0bl4NPrJluQgvaKOk6ZWWx9MLGL8AK+hOS23wODMGyTVr9Hkga
         mwsA==
X-Forwarded-Encrypted: i=1; AHgh+Rpv2AVc3v6KnVkXRDgOqDqLEMXiuyu1aTkc/CE4+79uc5FD5D5oBNjrG8Rql9UCfP+lBcc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyT1qg3JFKwNBA58Ekddwqqk8yi1YSVp7KutIb/kXvJZl9S51Li
	rpeMnVeKDo15hFfW6xGOJMk47UmNNkK/J8XL0DfaKgDwI6Y3kFNYCi24bmZSkT+8ER0APcSuO66
	hV7eCLYfX5CxIylxI1dxpLjxI8Bvc210=
X-Gm-Gg: AR+sD10e4wtvPvJWD30UcHlfjgKVx2BcEo4AhyEbgLSsmWRAUOUFk8Xi/DpAKcfZ9lX
	h/cLcTFLkLDqqjZ3oa4NmslTJnWE8E5cGkwKKbGfsbVnBBMSsrAVo92U4kNSYS0DU8+KQwbmoD2
	QFd6d4e79gc2ePk3PzXeg2rMROFqZ+yu8jKpHdhRn5RvjDABUb1IPA3rq1CSuk1Hi9xuQexmqUH
	Uv/Fy5b0dm0cX40j8zWGqCgtlfd7PPvH/HVqPAbZKZpFa/5/keHn+oj6tX2OTvVYr5EgDAxysVe
	fbawyMxDok6Metme/AIKWCdws1Ao4pMXJ2f1zR3zpisoiKgtKDGm+dsoRxT3uWLlEo5yi/kkSr8
	hUCw7LMhnlhb/
X-Received: by 2002:a05:6402:249c:b0:6a3:8586:9b73 with SMTP id
 4fb4d7f45d1cf-6a38a926287mr5303643a12.6.1786785281054; Sat, 15 Aug 2026
 02:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260815083451.2147129-1-egbostina@gmail.com> <20260815084635.BECD91F000E9@smtp.kernel.org>
In-Reply-To: <20260815084635.BECD91F000E9@smtp.kernel.org>
From: Eduard Bostina <egbostina@gmail.com>
Date: Sat, 15 Aug 2026 12:14:30 +0300
X-Gm-Features: AcwNN1XLq_7Rvilq510EdyjugR4FFUzRoIg_f3AqTgOwGlF-ckiD4eTzrM4zuSY
Message-ID: <CAEFOc61s9761y+7zcuWmNUeRuOWika=uhAhOay8ufL7vVhNk8w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: Convert TI TWL6040 to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, 
	robh@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 11:46=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The YAML schema defines incorrect property names for the vibra=
 default voltages, mismatching the driver's requirements and breaking schem=
a validation.
> --
>
> --- Patch [1]: [PATCH] dt-bindings: mfd: Convert TI TWL6040 to DT schema =
---
> commit c57af8c690b680b78b9119a5988e020149e24c1e
> Author: Eduard Bostina <egbostina@gmail.com>
>
> dt-bindings: mfd: Convert TI TWL6040 to DT schema
>
> Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
> schema.
>
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Do=
cumentation/devicetree/bindings/mfd/ti,twl6040.yaml
> > new file mode 100644
> > index 0000000000000..a93835aa91535
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
>
> [ ... ]
>
> > +      ti,vibrmotor-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for right motor
> > +      vddvibl_uV:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: vddvibl default voltage if it needs to be changed
> > +      vddvibr_uV:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: vddvibr default voltage if it needs to be changed
>
> [Severity: Medium]
> Does this incorrectly define the property names for the vibra default vol=
tages?
>
> The twl6040-vibra driver actually expects these properties to be hyphenat=
ed
> and have a "ti," prefix. For example, in drivers/input/misc/twl6040-vibra=
.c:
>
> twl6040_vibra_probe() {
>     ...
>     of_property_read_u32(twl6040_core_node, "ti,vddvibl-uV", &vddvibl_uV)=
;
>     of_property_read_u32(twl6040_core_node, "ti,vddvibr-uV", &vddvibr_uV)=
;
>     ...
> }
>
> Since the vibra object sets "additionalProperties: false", won't valid de=
vice
> trees using "ti,vddvibl-uV" fail schema validation?
>
> Conversely, if a device tree uses "vddvibl_uV" to satisfy this schema, wo=
n't
> it be silently ignored by the driver at runtime?
>
> > +
> > +    required:
> > +      - ti,vibldrv-res
> > +      - ti,vibrdrv-res
> > +      - ti,viblmotor-res
> > +      - ti,vibrmotor-res
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815083451.21=
47129-1-egbostina@gmail.com?part=3D1

No in-tree device tree uses these two optional properties, so
dtbs_check never caught them, and I carried the names over from the
old txt binding.
I'll fix them in v2.
