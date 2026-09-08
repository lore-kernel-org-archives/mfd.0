Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA549AA38
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903498; cv=pass; b=IZ3Ij4Vp44PH6cZuTeuQH3JafC3uT9e2tzNtBNHuCqgDjTWRfvbFXN93i03de7TlIG8aiodRL46Uv0Cypqr/hbAw5VtUTp0oGGtGlfqKJfMuDf96OZaLzUljlGwfcaFbLZ0RAU4HZnPFB7wEXdQ+SCySgX2OJ5Zp3X0yQbnAZFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903498; c=relaxed/simple;
	bh=ssVSDwjmS2dwY9p498QdiQJSOb77cq69dampDEHDR8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzPqkVkjMf3lyXO5ioxOsJzKybOzgNQHBZMds2DWo+o3aWR2W5HsSAN3o0a9uLDoAztAlLotPnSwUisu2hx13IIIplCZ8TEsqg+uabNdq9khn/C4OQSFMApkMHdp2e+Uyk7qKz2qrD2gAtlySNJQb0fLTbQ2/pJEbumyxhV7wJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YC0cMb8o; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YC0cMb8o"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-783d429d0cfso3637825137.3
        for <mfd@lists.linux.dev>; Tue, 08 Sep 2026 14:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788903493; cv=none;
        d=google.com; s=arc-20260327;
        b=NsQtb55fRxn95F+XPkRL7EhMTnorAiAoIlyIh5IZHvFdBFz1bdpL/UpOk2cAcYRIAi
         O1w49jEJoZ31A+r36brgDRqRIZ8VR7uXGUS5xhqp67PLi6ZlNO7dZghORJ2nWMIfjfsX
         AsmNfotvbsMb6AXDhfMoZx26YfV2xHfnP/SiAgB8oh4YQlLZmYvdHYZT6NAiHqxDKNN4
         xEiR3dY5X48b2AxLmGe9VdaSiUcNc0uP8wMWixkwlB+GBviy84KtQrKGX33ubzk6datM
         ur9Ltanl4OVzAFYvRSFyLp16Gp47HNYZwqjv1jcJkeEXZznuLLQv8ef16KmECW7++umn
         eJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4jLmDGxwfAGIYL/jv2AOETlQx7ZhdpacKiwdRFBfE3U=;
        fh=CVADZk4Qg2utq3EM8lLxbHcSpy0z9oQGJYd4L1O0iP4=;
        b=Xz2SSo+9N8VVHQhX+MD9qsxKMsxSn4dd3hJ/ZTSSMBCOhhzT+D9G3y2StypP3Mkc9O
         bgE2l6dyVScoIbSGVBzgW6GavWhzFsfetz+ZK+8yC9Zkh19v/VSovt4ogkFX4hPN8kQF
         icB6nigWIPyVuTPvsmdVFid4uoAErQPnvAXCGn7iu05f2yZ/W+cYIoSFOv/RCOvKwppy
         fRWLzsSatVqhS5xCMRt0s7cVVZm06CoGEj4iqXelfdiuL+zD19Go6FR9yfMC/MCABWXX
         6wForwFX0zWgUBgv3CXOqkvgsWCSGwZo+h//Auf8Mwd4BE3ZsSBpaIT2nQN01E4YfYKC
         DXOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903493; x=1789508293; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4jLmDGxwfAGIYL/jv2AOETlQx7ZhdpacKiwdRFBfE3U=;
        b=YC0cMb8osiG+rhY8PzaDb+aNBSfxZeBBs9cyOJL5Z7cAue9Iw2ZhBgDf7dzgQADxl0
         XLfC2lBdraV1dIpl+9BihvnhYpZII69FRUoeBLZOk6aHCdazdOI5wRwtN1PCDsq2E+/F
         lH+RJ/QWwkAwdY1mFM8iPY9Xw6EQMJVa/wBi9MMzgje7Jn8SHEdccGni28jcA4ExHpGw
         luLKrVk94EIfL3R+JbKKTgSg+p4JLdNLyeXdDcdU2tPc9w2swE0x8aZU3XXJS1u6FF1D
         tz2xhp/NVY6Nlo5gKN6nHdPxbzgkMUicMY75aS1LnHjQXB87EzYiN6ySWMk6E71Z0i58
         cEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903493; x=1789508293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jLmDGxwfAGIYL/jv2AOETlQx7ZhdpacKiwdRFBfE3U=;
        b=sCx6DUeolceOwmJIqJT5481GN01fcQNebsju+ITCEqywzYgw1wW4EXbJTkaxTcZU7J
         5+V2XIQ+/T7i5whyMZHP5Q7ZzxBovsStwOyo7lU2me2PDlNDoyKxcr71r5ApzAzNobUL
         TFSIkPNaYOordBQoLYc4CRMUU1pRrNUlR/wQAcJecMIJpZBcjIM+LgHk7e91cvejx2CM
         hd0ggwnixlxf01Wb8ReDd3Opt+DUiwvI1+AFHCeRmPxVjcJa9cOkGUFaeO43L62WhFks
         30SSPxPo3y/AMmzyGwOIQ0CMXCxf8LHADx2QyfXebk4/JzXZ7Gyjj5qlDACPcF4roWNw
         4mGw==
X-Forwarded-Encrypted: i=1; AKwUvBwToIuilN7Hy+Kz676QtZKFtdENF3XkhUGT03AOUfAoVBJjJa9b32R92LUA9pYL2ot0Emw=@lists.linux.dev
X-Gm-Message-State: AFuF++mQMJy2Ri9qJND6oQhoOx+s6sM29j3UsRGldvGFqk2xkVANUci4
	6qSDoOi0A78a1AO5J/jl+smbNCGmituhM0gpFK4hUGpUn9emgluDo3cO+bgUiVKP8gYZH9keCeB
	s/BGIFwk8l4Ack09tRbygxAnb8K4cBRc=
X-Gm-Gg: AYBFou0N2YwkMQq+bUvCusUMEfcbHmHGXJqd/0B2Qv2So9K/3QYT7piCwNGBCghTupS
	Vi3bzBluxLpJFC3WiBYgyslAbXi9qACJ7wJi16HvQoGK1miOJCg1YKd6c2KzRK1xc5c/xvPW5D0
	lMNNNQ8K+qju3uOlx77RVhHtPZW8RITClLrRXgMAk+k5JpVAxKuucMCvSYzOZ8RTnAIxehR8YC4
	qc7PkJ6Yb5yW8yzglED93sgqFfGGFGqJz8Fn3Fzd8rp+0LcEd0TRn4QYWIw/Bp6j35mfP/Ie5EP
	h6rYbYlQUhOR5OuKIMUkzzTF+yBX0nFbqYrEqUsEL8ahinyjtiWsmpoas2/ADNp/eL94pWlEz+x
	wUxIBu41MTlK4dFDWLh1hQaadvqdxunM2Xt9hiR93jFvr6d92Ou9WKlWmvY+MJLW3kpvMq4/ETm
	1F8v2z1OZLw5EmFegP86NGnO05gzgJNORZM2ptow==
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-78a4a96d8c3mr14080328137.5.1788903492257; Tue, 08 Sep 2026
 14:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907-submit-ac200-mfd-v11-0-58dd9dc7f69a@gmail.com>
 <20260907-submit-ac200-mfd-v11-1-58dd9dc7f69a@gmail.com> <20260908-semisoft-appendage-ecbeb9b2d88e@spud>
In-Reply-To: <20260908-semisoft-appendage-ecbeb9b2d88e@spud>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 8 Sep 2026 15:38:00 -0600
X-Gm-Features: AcwNN1UkidVz5Gd_E6Th5guOx-OoCVgj0ZJUHg6bA3hbnSRk_No17K-VefpmGY4
Message-ID: <CADvTj4rZnsSWe2NOKxpmTE9inyUFU2Cz4AS-zwuBEXkM4hjkLQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] dt-bindings: mfd: x-powers: Add AC200
To: Conor Dooley <conor@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 12:05=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Sep 07, 2026 at 03:03:14PM -0600, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
> >
> > Describe the shared input clock, audio DAI, TV encoder display graph an=
d
> > optional bandgap calibration in one parent node. The codec and TV encod=
er
> > do not need separate firmware nodes.
> >
> > AC_LDOIN and TV_VCC are distinct 3.3 V supply inputs. Describe them
> > separately without requiring different external regulators. Require the
> > audio supply when the DAI is described and the video supply when the
> > display graph is present, while allowing PHY-only configurations.
> >
> > Describe the optional shared INTB connection without an internal
> > interrupt domain. Cable detection status remains readable over I2C when
> > INTB is not connected. Include wired and unwired examples.
> >
> > The Ethernet PHY is represented by a PHY package on its MDIO bus, with =
a
> > phandle back to this device for access to the package control registers=
.
> > It therefore does not require an MFD child node. The input clock must r=
un
> > at 24 or 27 MHz when the Ethernet PHY is used, matching the rates encod=
ed
> > by its documented clock selector.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> btw, this is kinda odd. Jernej has a signoff, but no other attribution.
> Are they a coauthor missing a Co-developed-by

I had just retained the existing Signed-off-by from some of his patches
that got incorporated into this one, is using Co-developed-by better
practice for attribution? Should I use both a Co-developed-by and
the Signed-off-by for this sort of thing?

His work came from I think this branch and maybe some older ones:
https://github.com/jernejsk/linux-1/commits/opi3-eth/

>
> > ---
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
>
> Thanks,
> Conor.
>
> >  .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 168 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 175 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml =
b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > new file mode 100644
> > index 000000000000..75dafa7c1071
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > @@ -0,0 +1,168 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: X-Powers AC200 mixed-signal IC
> > +
> > +maintainers:
> > +  - James Hilliard <james.hilliard1@gmail.com>
> > +  - Jernej Skrabec <jernej.skrabec@gmail.com>
> > +
> > +description:
> > +  The AC200 is a mixed-signal companion IC containing audio, video, RT=
C and
> > +  Fast Ethernet PHY functions. Its control registers are accessed over=
 I2C.
> > +  The audio codec and TV encoder are described by properties of this n=
ode.
> > +  The Ethernet PHY is described separately on its MDIO bus.
> > +
> > +allOf:
> > +  - $ref: /schemas/sound/dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: x-powers,ac200
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      AC200 input clock. When using the Ethernet PHY, its configured r=
ate must
> > +      be 24 or 27 MHz, matching the rates encoded by the documented EP=
HY clock
> > +      selector.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The shared, level-triggered, open-drain INTB output for the TV e=
ncoder,
> > +      Ethernet PHY and RTC interrupts. Omit when INTB is not connected=
. TV
> > +      encoder cable detection status can also be read over I2C without=
 an
> > +      interrupt.
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
> > +
> > +  ac-ldoin-supply:
> > +    description:
> > +      The 3.3 V supply connected to the AC_LDOIN pin for the audio cod=
ec LDO
> > +      input. This may be the same regulator as tv-vcc-supply.
> > +
> > +  tv-vcc-supply:
> > +    description:
> > +      The 3.3 V supply connected to the TV_VCC pin for the composite-v=
ideo
> > +      DAC. This may be the same regulator as ac-ldoin-supply.
> > +
> > +  nvmem-cells:
> > +    maxItems: 1
> > +    description: TV encoder bandgap calibration.
> > +
> > +  nvmem-cell-names:
> > +    items:
> > +      - const: bandgap
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input to the TV encoder, carrying CCIR656.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Output to the composite-video connector.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> > +dependencies:
> > +  '#sound-dai-cells': [ ac-ldoin-supply ]
> > +  ports: [ tv-vcc-supply ]
> > +  nvmem-cells: [ nvmem-cell-names ]
> > +  nvmem-cell-names: [ nvmem-cells ]
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        mixed-signal@10 {
> > +            compatible =3D "x-powers,ac200";
> > +            reg =3D <0x10>;
> > +            clocks =3D <&pwm 5>;
> > +            interrupt-parent =3D <&pio>;
> > +            interrupts =3D <1 20 IRQ_TYPE_LEVEL_LOW>;
> > +            #sound-dai-cells =3D <0>;
> > +            ac-ldoin-supply =3D <&reg_aldo2>;
> > +            tv-vcc-supply =3D <&reg_aldo2>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +
> > +                    tve_in: endpoint {
> > +                        remote-endpoint =3D <&tcon_out_tve>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg =3D <1>;
> > +
> > +                    tve_out: endpoint {
> > +                        remote-endpoint =3D <&composite_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        mixed-signal@10 {
> > +            compatible =3D "x-powers,ac200";
> > +            reg =3D <0x10>;
> > +            clocks =3D <&pwm 5>;
> > +            /* INTB is not connected. */
> > +            tv-vcc-supply =3D <&reg_aldo2>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +
> > +                    endpoint {
> > +                        remote-endpoint =3D <&tcon_out_tve>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg =3D <1>;
> > +
> > +                    endpoint {
> > +                        remote-endpoint =3D <&composite_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3a19da74d00c..419340093c9b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -29504,6 +29504,13 @@ F:   drivers/net/wwan/
> >  F:   include/linux/wwan.h
> >  F:   include/uapi/linux/wwan.h
> >
> > +X-POWERS AC200 DRIVERS
> > +M:   Jernej Skrabec <jernej.skrabec@gmail.com>
> > +M:   James Hilliard <james.hilliard1@gmail.com>
> > +L:   linux-sunxi@lists.linux.dev
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> > +
> >  X-POWERS AXP288 PMIC DRIVERS
> >  M:   Hans de Goede <hansg@kernel.org>
> >  S:   Maintained
> >
> > --
> > 2.53.0
> >
