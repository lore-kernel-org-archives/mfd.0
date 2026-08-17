Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DFA3F54B7
	for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960735; cv=pass; b=GukABVdNtCpq51TM8zh1Fnjv8SFxokEJUisMTiVMSTz75hpGFjdqORbDxWM8o0cldxD4hToVcru8a1QV0gL+NB8BwiWOhPg+Cn6qC3pOFBf0ab18+/ZlEyCRNUBbbwNlCZZPlbBUmZHC5Al9TKOlq5stHE9pjMl4vE7rGju3Jr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960735; c=relaxed/simple;
	bh=f/xJ9b6bHOUYIhetMlxLu3Jlg/uG6SyeIHZM9qxQeIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNi+ak6ohf2vOJoy9S5kCJLGsJkU95sqCqxmelezGQs53M8UxIT2B7C1MAgIsZyuAtDJmHlcLxrO8inPc8ntx3G+mrrmP6x9CMcJ+kjNYjO2OChAIVrmydOcTnauhqJ2GmypMegVHlKpb50u5XE8BGDXH9u5sJWp1bx0zPcjiV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YM1vKFmk; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YM1vKFmk"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so3153394a12.1
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 02:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786960729; cv=none;
        d=google.com; s=arc-20260327;
        b=Tnyc3vybopDExeCXwgB/ycg0MfXAW5V8893jSpoYhokxUTchnBlqR376umyzJKpxFG
         sFGFmrmD4MkqWhbVkBLYaex3qmV23XdPWhbXUACp2LkweXS9mF3jQgeKCFV52eO6ESiR
         PQc+OmqT4BdtDS5RqX9abyPCqvgUfBoSZ8Rf/gDKl3JD3CtLsrFNqifqpJwSbjjSCRUf
         YywcZf+IZ3bJ1anMk3CfMQapSLOSevmTmm5+QkOPmD7SSbXgk/ztfSGlOjwUw1rwBQF5
         R8vdhupxpx0tcJ3IBnVQPUmFokTTFRzZGvf9E/Fxb00gAxpBfJ8hR24rY0ldunqM+wOU
         znmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFDATddCGKGnePTPiCSWY4/Z8ThU+uYOoHQ9cPmzOgc=;
        fh=KyHljg7WUqaGpaeEmRfR/gYg6n6OE/J8GUpFtr/NSmg=;
        b=Y8t4FL50K9bofPSQfB9Eozbn1YEOv1k+EjE8yYzQysmbAF0fIlbd9m5onJBagmwSV8
         TSre5/6gIIm0jZXNw2GvCWikqy16TmG3tbprA2lGGdlWE3ujsOV+QWNQI3nYpt2BMjxw
         nBb3j4O8tonZDM7rFCt+ijoAuueUpMS07CtYJiauBj0SChBI8wOUoW8Z786k2SVltqYz
         OP45CYTuZ+AofQFvhuXd7SWflvbyPGrX+XSNE+95ohWefRLNwaCF64INlAxifO3LnSFT
         rSMc84elykmErDc77iagtrTy2aUN/An2R6OiNdCQbUlpSqMt0yTqCM+9OCCyjRmzwk9F
         YbEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786960729; x=1787565529; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFDATddCGKGnePTPiCSWY4/Z8ThU+uYOoHQ9cPmzOgc=;
        b=YM1vKFmkNirhpewO7A7DSRShsKlV1MFOHQh9BuVgS9oGVa5nvD2OCpdWLz+scC29Dk
         tGvy7UY5pwnuEz+S3uaU+sl5YLgHCp+h2gy+nv4PGFa48Ht0hILnERPPaqWjk/K1RMe8
         NTrzGSCJPHkfoWMbaK/u9LohbFVZ+dc03/0aoDT2xlaRSbXrNju7xrgDjxWEtnVyNED/
         YIvyboP6Fx6CXLyBGaeOLDHMSqWOmzbmy5x97osPs9gLIlxFD6tisurOrN0Kmpfy7po5
         fdq305U9sj+t1G4Cnj94uux+pyRcIJzZYBvtuZgIEKNdsajsn1aSIcvRkWcU9SHifBag
         VjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960729; x=1787565529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFDATddCGKGnePTPiCSWY4/Z8ThU+uYOoHQ9cPmzOgc=;
        b=iHmrfXdcFSfD2AlZTf4KaMxYCnfs/hjU5/pxsbDMNksmsDF1pCj8glKBmYVlNd8cV8
         LyuzluctA4xPJmMRYsTEkRELbgp+IlWZpSdM8imw3daSNEhbgiVolquQ9vy4SmJQ/euo
         8fz+opbgRIRtzI6jYqezl7/WdFG3drVWFSVs1H/utvAsfg/RgR/TFoo/ZQKIOE76URMi
         GhXaTI03QTJPWDphX8D/BvPIofXCjHZPewiJKTf1ULUmWj/3/X6BOol5vcchsWf9FMi2
         t57t7nSSKntIEL3WdKmxkvXGjQ4zPPIeh9+kXdApaOMF7fITOaw77X52ncFcAurndcOh
         veTg==
X-Forwarded-Encrypted: i=1; AHgh+Rpf1V3RHujN0zAGKXljcjIx2bJBipyqAAKlAZFd6KYqQZrtlmex/zsr0bYPsAZI3W/6078=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFov9nrjba6XypIDE90u1/8YWQDhyYeTGPi0rGLQvGs852ZtKz
	ugANzGZlRhkWu5MbaTjKv4JG7B3cVKe2st8g+2c0GfDDzNNX9hwQf9Zi6aY6kVE6fSlOJTFt3T9
	LmFLZX8iOYaX/uAL6exLaTvwZv8c5WLU=
X-Gm-Gg: AR+sD13BI91wdCoDcQxO3lMdDpiYSLKH8HGdrtKYj2pZg4qgJgnl4+8f5BZMLM5h+jE
	xYumLM8Ltlw8A8v/qtOzVao7WcELT/RutiFGuZ6K+HcFarpuhvQ6wzGilAAedEqFaOqxfOmtrQp
	w+ixbR7c4sLt0heKnfc/uhXNJWBshqPsH7nxNgj7NiNQzef5CD2GrBg4SM0XzpVWk1IiTlunOa2
	2X31TXrtuOdrRZAMpIzXqa7KsgXR/ilkUz4rXwKtEwQZsleSZW1DRlmBRl1oa1KzHrWuOQR25B1
	wGrmmMXzRthI7mPAgq1dd+nMkTa8ow1PJmobqQeK+E4V0FbqtirGgSiWM4tdWeu3iQoMSnkV1Av
	sBgI51zV3x2esoAyU3uvxCSuU29gT6LmWWw==
X-Received: by 2002:a05:6402:3708:b0:6a0:8885:e6e2 with SMTP id
 4fb4d7f45d1cf-6a38a90da8dmr10858787a12.9.1786960728872; Mon, 17 Aug 2026
 02:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260816092847.2522994-1-egbostina@gmail.com> <031e1ccd-c4d6-4dfe-8920-fa7b0e5deb7a@gmail.com>
In-Reply-To: <031e1ccd-c4d6-4dfe-8920-fa7b0e5deb7a@gmail.com>
From: Eduard Bostina <egbostina@gmail.com>
Date: Mon, 17 Aug 2026 12:58:36 +0300
X-Gm-Features: AcwNN1WLvoPFCjYSsUV8RlVbrVMgXmJcp7Gzohczv41aTBBn-L-WhXmQsK0KmuU
Message-ID: <CAEFOc62qU514Nd095bg=8E-yLrpd4QnRhpLp-12WKvx17A_dCg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: Convert TI TWL6040 to DT schema
To: Dhruva G <goledhruva@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	mfd@lists.linux.dev, Rob Herring <robh@kernel.org>, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 7:00=E2=80=AFPM Dhruva G <goledhruva@gmail.com> wro=
te:
>
> Hi Eduard,
>
> On 16-08-2026 14:58, Eduard Bostina wrote:
> > Convert the Texas Instruments TWL6040 audio codecs family bindings to D=
T
> > schema.
> >
> > During the conversion, the following updates were made:
> > - Changed 'twl6040,audpwron-gpio' to 'ti,audpwron-gpio', which was
> >   misnamed in the old txt binding.
> > - Made 'gpio-controller', '#gpio-cells', and 'ti,audpwron-gpio' optiona=
l
> >   because modern platforms do not require them.
> > - Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
> >   'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
> >   twl6040-vibra driver.
> >
> > Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> > ---
> > Changes in v2:
> > - Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
> >   'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
> >   twl6040-vibra driver.
> >
> > Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbost=
ina@gmail.com/
> >
> >  .../devicetree/bindings/mfd/ti,twl6040.yaml   | 142 ++++++++++++++++++
> >  .../devicetree/bindings/mfd/twl6040.txt       |  67 ---------
> >  2 files changed, 142 insertions(+), 67 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.ya=
ml
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Do=
cumentation/devicetree/bindings/mfd/ti,twl6040.yaml
> > new file mode 100644
> [..snip..]
> > +
> > +  vddvibl-supply:
> > +    description: Regulator for the left vibra motor
> > +
> > +  vddvibr-supply:
> > +    description: Regulator for the right vibra motor
> > +
> > +  vibra:
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      ti,vibldrv-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for left driver
> > +      ti,vibrdrv-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for right driver
> > +      ti,viblmotor-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for left motor
> > +      ti,vibrmotor-res:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Resistance parameter for right motor
> > +      ti,vddvibl-uV:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: vddvibl default voltage if it needs to be changed
> > +      ti,vddvibr-uV:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: vddvibr default voltage if it needs to be changed
> > +
> > +    required:
> > +      - ti,vibldrv-res
> > +      - ti,vibrdrv-res
> > +      - ti,viblmotor-res
> > +      - ti,vibrmotor-res
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - "#clock-cells"
> > +  - vio-supply
> > +  - v2v1-supply
>
> I think the vibra supplies need to be conditionally required when the vib=
ra child is present.
> twl6040_has_vibra() uses the presence of this child to instantiate twl604=
0-vibra, whose probe
> then unconditionally gets both vddvibl and vddvibr.
>
> Would something like this make sense?
>
> allOf:
>   - if:
>       required:
>         - vibra
>     then:
>       required:
>         - vddvibl-supply
>         - vddvibr-supply
>
> This would still allow TWL6040 users without vibra, while retaining the d=
ependency for users which enable it.

You're right, thanks. I'll fix it in v3.

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        audio-codec@4b {
> > +            compatible =3D "ti,twl6040";
> > +            reg =3D <0x4b>;
> > +            interrupts =3D <0 119 IRQ_TYPE_LEVEL_HIGH>;
> > +            interrupt-parent =3D <&gic>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <1>;
> > +            #clock-cells =3D <0>;
> > +            ti,audpwron-gpio =3D <&gpio4 31 0>;
> > +
> > +            vio-supply =3D <&v1v8>;
> > +            v2v1-supply =3D <&v2v1>;
> > +            enable-active-high;
> > +
> > +            /* regulators for vibra motor */
> > +            vddvibl-supply =3D <&vbat>;
> > +            vddvibr-supply =3D <&vbat>;
> > +
> > +            vibra {
> > +                ti,vibldrv-res =3D <8>;
> > +                ti,vibrdrv-res =3D <3>;
> > +                ti,viblmotor-res =3D <10>;
> > +                ti,vibrmotor-res =3D <10>;
> > +            };
> > +        };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/mfd/twl6040.txt b/Docume=
ntation/devicetree/bindings/mfd/twl6040.txt
> > deleted file mode 100644
>
> [..snip..]
