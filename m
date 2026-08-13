Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2672F49250D
	for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640071; cv=pass; b=u0YbP2sUFG+e7vMuNZIEtQICcfvCKvzuuT6mYEFWge97mQUv97ouauFdFZ0z/vgPAVlkFU+4cJ0GlO+tiI2yVsNx8QxboF3oYF7+hRJf/SNC4GgsQMs/YS6UWNciEDJQRfsa/r7qWefdWjcnMDZoHR8WudRkvo6/o64KV3mGp6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640071; c=relaxed/simple;
	bh=7Fvq3zqL/KzBPneeBMfdo/0oBRye38WJc9bujdH1Mjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXvsV4/pM+9NrI+oVe+222xWiCpowsOUA85KCWklxcHcMCNh4mbj6FF+dPb5xEL9h3F1w9QOOafz/ale2i2pzqnoJC3yYyT0/SiidWrpVqv2PycJbOiOxHrIjSJ6UlnEsFW6iQXlHfNUivRE4Ss6/0Pcnc6SlPZftWo5B1l8tmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ms0MadgR; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ms0MadgR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1676648c1eso1667266b.0
        for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 09:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786640064; cv=none;
        d=google.com; s=arc-20260327;
        b=si9xfEwXBam/YneiNixZq98PMoufnCvLplTTbQ8OOUsErbNeXV96J6N3Qe+U5j8xnm
         dWheyNGlYckRYiSUJ6za+HYhLUktnVd92Lvhcb0FALxlZjOJo2+w3zg9q80FSE+SwssU
         32XdmXHqPBH84pQmG4/RTK5ARFNUccJM3IbInCGgZ3sQx98L8+JxGlc3lzAUlj1f0n2Y
         s/6hDS007dN7zzVnNDKG3Q2HaOxYo0+611jKJZl9YeFpUpzD8b9FHOZ+SfEycUE3pDn1
         RnGR3NYo+gXvl2HU1EP5/W4pWD3++O78kAjtg62t8YZ/XsyyId1yXjWa/tXBOP+AV8HB
         Zl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ww9P2ixuZzBUhiTpprwhy2KM8BvHef44lGTvhAxYQG4=;
        fh=rNF5hIxNJyuaS9vQB6Jw+lBcIQ3GVwb5Yxht9bD2Q0s=;
        b=i1wDL9fMS5qwWU6zsKDYXpumVyEQhMF6auUccH3qZEGlRzUN2URL3KT3fvCAY+yyyh
         S5hahAOrZ6yN9huGHE3E6FKzHxrDFNAfYU/waB4WC7TOHNgpgskHprAHmI0yaCJ+EaKT
         /wHhjR+hcxgV+puGZLOEBtH49OH2xsmrQLWnJr1xWiqc+OTEzJ/0qJ2i8WJEdAsnmABj
         O75UnvhF1EmqWakDtLl3aLts3jcZeDTRy8C6mBYSltKAUTQC3L1kpndDsUPWWYOsqRgv
         bjEZggNz7Af3jZoLD5Yz3nOxsiM2A0DrIf4oaZbIIZKteEiigXB8v2W8oRQOamJpaJtt
         ondg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786640064; x=1787244864; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ww9P2ixuZzBUhiTpprwhy2KM8BvHef44lGTvhAxYQG4=;
        b=Ms0MadgRmTdDMA6COSpMlM5ZZWEf1LltO/QRik9zUS9mvs3O7ualhN/PoE8c41ugAE
         GthqUPbzt/I4j4cRUSTE9JMf4i4kJnuZiJHMMUzMxEZbs8dX6l5bWMCVzSISqYALcnXJ
         PVYqGDc9v/EFbB3FBi1tSHabse813KGRF1hM1emFGmdOazg5XFTY4pNGxnqyPlZ8Vuk7
         d0j+QEsXFxkPrNVcpU5t0N4sCL78GJ1PPL7a1dqlRyr1QH3acmazCFl6M0vdAMbHgBic
         cKmYrjO5Ntt8cQfnp3Fw4LIJcOJBbSNpt1KtELlYNch7mubbwaCjiKBsL9HTBYbe8h2r
         yFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640064; x=1787244864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ww9P2ixuZzBUhiTpprwhy2KM8BvHef44lGTvhAxYQG4=;
        b=PiWLRWrbSL+0IzGKDGeb1G3k7i1pUcptLH+wnQDc3DC5TqpCOBUWcFc+rtkkYWqqHE
         erRsDwiPAGzvmvswjyeWZOCXnOivpn4OsaH8u1rFh8c0JyAVOdlPgKlyiFkVSVZiN2ga
         DME8DeYgFEoa6RuNFyjj6JbDySfTfYSAT+oGMKgpvbMtj2tNZZly/PB6tF8zIuGB2/v6
         sgmAPKhrWvFtgxndYjXJe0xq+R2I4+cxS5Ly6kSMmpq/s2OvkxgYJiywF9AV23QmE+Wi
         2gvvuSNgZynSZr9P+f9qWKzSXAaRsOxTis/otAjAGJCvdT4CTBkuZkBd/jVbuQsprZAu
         JY7Q==
X-Gm-Message-State: AOJu0YzXNzEUeY4C/Me2zyxOOUvdOWxIoqhXq9ZMtAHo9UBKw0z62ZKd
	EVZljEdXq6gsY3W6CGnkiKYF1u9Au9uVJBjuQ0Z73C6S/3HcOy1P9FlB9O5DTAupdYZv76OsWnP
	SJ2wy53Wx6ICWmiMTUuAEfxPcab3ykJk=
X-Gm-Gg: AR+sD12G6jCfA9sbOhgNA/4VAGQLBx5hDNnAZ/HJZx9Emi5BVtP9gm7v5q9ncj2FjH9
	L7F+doO+iyOsNRPe1JbSR5Wv8dZceu/4sWQ764LnuADvlz+LPSbFyKjqA3tna4eTABTDiJze9pR
	zjv7lIMWmjhWO7T6R8/cFTL5hLMsbfT/Axr4G3Lz4NWmEJZZFjP3tFgCslJ+t0E1/CQifWXW8xs
	0OM/oZ+EUXZ/yCI43QQDHZoDtAX9lBxVRbCOuYKATntEMcacnVzFc+Y1thvI1/uFfpifwRuIzte
	mPGhWtiqT67HuOxUMI+9fioA5UCp/KCPTrOTrQUqeEk1ldu5GAjItVBvGqLDGDgt/1jdyVsJvNp
	xrgc=
X-Received: by 2002:a17:907:3c8a:b0:c16:1290:11a7 with SMTP id
 a640c23a62f3a-c2108f6adc6mr198642866b.1.1786640063579; Thu, 13 Aug 2026
 09:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com> <20260813164117.DE8F01F00A3A@smtp.kernel.org>
In-Reply-To: <20260813164117.DE8F01F00A3A@smtp.kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 13 Aug 2026 22:24:12 +0530
X-Gm-Features: AUfX_mzwE_muvtzUi7sgoturtrvJi-GJEAPGrT1WA_uTWsInh6m2LlCJF_HFSLY
Message-ID: <CAOWyW_6Wayw0gKMyhpy2wE6oSbikM3fKCopqxHodddM9zt1-FQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The schema enforces non-compliant, legacy device tree node nam=
es (containing underscores) for child nodes via `patternProperties`, blocki=
ng the use of standard generic names and contradicting the commit message.
Yes nodes with underscores are kept not to break older dts/dtsi files
which uses underscores
> - [Low] The YAML example references undefined phandles (`&devctrl` and `&=
pllctrl`), which will cause a fatal `dtc` compilation error during `make dt=
_binding_check`.
no this won't cause any errors related to references ( tested on version 20=
26.7)
> --
>
> --- Patch [1]: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to =
DT schema ---
> commit f59b6bface010fc243ef7f899dbb8dddf737e2c5
> Author: Bhargav Joshi <j.bhargav.u@gmail.com>
>
> dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
>
> Converts the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema. Adds "simple-mfd" support, enforces chil=
d
> bus properties, and adds validations for standard child nodes.
>
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.=
yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> [ ... ]
> > +patternProperties:
> > +  "^keystone_dsp_gpio@[0-9a-f]+$":
> > +    type: object
> > +    description: Keystone DSP GPIO controller
> > +
> > +  "^keystone_irq@[0-9a-f]+$":
> > +    type: object
> > +    description: Keystone DSP to ARM interrupt controller
>
> [Severity: Medium]
> The commit message mentions updating node names to conform with standard
> Devicetree specifications. However, these patternProperties enforce names
> with underscores like "keystone_dsp_gpio" and "keystone_irq".
>
> Does this block the use of standard generic names (like "gpio" or
> "interrupt-controller")? Because additionalProperties is false, using gen=
eric
> names in a DTS file would cause validation errors. Could these patterns b=
e
> updated to match generic names instead?
>
> [ ... ]
> > +examples:
> [ ... ]
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    device-state-control@2620000 {
> > +        compatible =3D "ti,keystone-devctrl", "syscon", "simple-mfd";
> > +        reg =3D <0x02620000 0x1000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +        ranges =3D <0x0 0x02620000 0x1000>;
> > +
> > +        keystone_irq@2a0 {
> > +            compatible =3D "ti,keystone-irq";
> > +            reg =3D <0x2a0 0x4>;
> > +            interrupts =3D <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
> > +            interrupt-controller;
> > +            #interrupt-cells =3D <1>;
> > +            ti,syscon-dev =3D <&devctrl 0x2a0>;
> > +        };
> > +
> > +        reset-controller@328 {
> > +            compatible =3D "ti,keystone-reset";
> > +            reg =3D <0x328 0x10>;
> > +            ti,syscon-pll =3D <&pllctrl 0xe4>;
> > +            ti,syscon-dev =3D <&devctrl 0x328>;
> > +            ti,wdt-list =3D <0>;
> > +        };
> > +    };
>
> [Severity: Low]
> The example uses phandles for &devctrl and &pllctrl, but it appears these
> labels are not defined in the example block.
>
> Won't this cause a fatal dtc compilation error during make dt_binding_che=
ck?
> Could we define these labels on the parent node or a dummy node in the
> example so that the build succeeds?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-ti-keyst=
one-devctrl-v1-1-6f0aa87d9af8@gmail.com?part=3D1
