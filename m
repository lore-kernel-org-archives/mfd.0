Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A8C1A8F84
	for <mfd@lists.linux.dev>; Sun, 16 Aug 2026 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786896054; cv=none; b=QBp0Uclmw4lTA3TK/VcNqsBTdb6AvPkSfIX9p0kCSOat4gTZVNvukXV6pn7sp8Ff1H2tSPWCF4G4q6G37O9xv940iIX1wyurBua5O1Tq2Z+Vg3EaHkOmhb6nKf35jJqP6fOXtn0CarTAkG0Fm0+IhejjOqyLc9DxVHAA05vJWqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786896054; c=relaxed/simple;
	bh=5mIqHEDSAbVA9cPjCk8gWbfzC8c+xOZxPsT7VO9k1N4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewoU2PLWeJZLSdLS2jLVaJ3XiAByph13qsM6ceuMntdT889G4yTCH/oU/cm1VNABf9Oy3FWlOM4mugVS8Gp/xsqQg/S0m84ohZ1iRhakdlv96z39CskCIJ5jViDHqZCoO8nZcp5DjHrNQw3jdWcEJM9TPxwuRBFboKgDN0tQngE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hc8imfK8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hc8imfK8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso33334785ad.1
        for <mfd@lists.linux.dev>; Sun, 16 Aug 2026 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786896052; x=1787500852; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkirOfVRfO6V0utP9IJiT/V6RJ481m8i7Trlbe9HF58=;
        b=hc8imfK8Q20Q0YsQUJEZJkHoD4eZbNA7tQCMK3wKtL1Lz0PHYeAmXb8633Wgic3kbP
         hmMyE3vG04btvBIYkbTBSwdrIvDFQ1xN/2pyef5QaID1BnwIEnbtWFw/1dsfOZuOUG2E
         FEpwjVfeFwJ2dG4Yk4ZJhSrXOi/CRKgEghAD2TCWhEiElU6DqZ0ffiLBfI3C2sZz38C3
         +4ExSjnsaoLNxVuYCTsS1R2stB+vrwXhUbDr/Q//qfio2QybwFElctcSIS4Pk9u9keiQ
         39rjwO4hVunQBEKgGfohYY0HrshBLkI0SBsG8MH2Qyi3NnnJnaqc0qPCC/0gncfFMocR
         96sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786896052; x=1787500852;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkirOfVRfO6V0utP9IJiT/V6RJ481m8i7Trlbe9HF58=;
        b=ChSE3pmrNW1nIu0AVteGGO5AFCjUfdSDNDt9881DbYxytgHvqdkGSgMM027ccyauel
         sq1woQJE4U+/7VGIAic2LQH71rbmWk3jfWt03IKsPYdWzevy8ZNVQE+ynX8yPUEDDgMq
         SgueMNoi+pYDODFCUZFW9WQ3t2FKTYdmC9nzyPFp8IHAoCSx7uUrVTgLMXoBtvOpiTfX
         1C92DhsxjmcRa8/Ra+7x2hcAR6Ytduz2/yp2rrHkecYdrCVsxLeyOcuLdVSgBjBsB3WM
         f5U9R4OBY1AMoGtkLSLMBK6iItvDzrV27pLZOVwBAJu7awHkr5mEYy57zh2ZUcGvM8tg
         zr5g==
X-Forwarded-Encrypted: i=1; AHgh+RpfZ524Xxq+6rnKiT7X7TX3KZqjE8XSK06h+xOFYfAqU/nQmJ4q3nfHCj6pjNa5PBwf6JM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKpmCJgGIV4WVTu7bu8cEHEQo0cLPiAHqu4xaERC7cM96oT4rl
	1azw2eQ9x0Mm2IyHEmdmA0Qe7XV4Pnq4WiAVR7mxeFtnPHIvag85BteT
X-Gm-Gg: AR+sD11/b3AbgY2ecskpPQcv3ioluDERNbWiPkau7wPyr8u2/8aEm5EKx8Bbov52vs/
	z/I3+XuplrMDsEkWYtYz7sApVjnECzUbQdYaNFbV81gIw9QKG/GYlr/vqvdffLjmwchY5T9TwVr
	VPximyKtAprIiXFdPIYoOA1eVCZ+91DrMxsSm/asZD+qz9n4kiRg6lUD9MlJs9nXaXmeK1sg4Vx
	ytVn3+tRxOwo2oSestYx66sg0ok/1MFs5BCzLdI0tfjkgM0fjPJxLmpzhwHdJd08mLMtYfE7Kzi
	FUHPulXB1CTfUrtBrlWkUj0T1817njCDd/YluXyNOLAxRAb/L+A+NqUKhdW9oHRDOoFfRyFH9vh
	UpWCNblVdvC9GNwEHYHAKtS4nLim4ljjqc/7Y43QxtGhmlNscjEv5+5MJKDBHxK8vUdrvgiFqdK
	XiBG2ngDyDxHFHmSVx9KqVjLL7CJh9VU4oYP5bvCP8Ajh79Wp3ZOlyAGOZy4jZ74yHrL+6uhWKt
	txU1s3xR6TXguWQ+tC1y5WR0oTY6eTaGOvjBws=
X-Received: by 2002:a17:902:e78f:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d3b0c93b91mr210811775ad.11.1786896036704;
        Sun, 16 Aug 2026 09:00:36 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:403c:f88f:3e17:55ae? ([2406:7400:56:e503:403c:f88f:3e17:55ae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7a32bbsm26462705ad.26.2026.08.16.09.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 09:00:36 -0700 (PDT)
Message-ID: <031e1ccd-c4d6-4dfe-8920-fa7b0e5deb7a@gmail.com>
Date: Sun, 16 Aug 2026 21:30:24 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mfd: Convert TI TWL6040 to DT schema
To: Eduard Bostina <egbostina@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 mfd@lists.linux.dev, Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, m-chawdhry@ti.com
References: <20260816092847.2522994-1-egbostina@gmail.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260816092847.2522994-1-egbostina@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Eduard,

On 16-08-2026 14:58, Eduard Bostina wrote:
> Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
> schema.
> 
> During the conversion, the following updates were made:
> - Changed 'twl6040,audpwron-gpio' to 'ti,audpwron-gpio', which was
>   misnamed in the old txt binding.
> - Made 'gpio-controller', '#gpio-cells', and 'ti,audpwron-gpio' optional
>   because modern platforms do not require them.
> - Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
>   'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
>   twl6040-vibra driver.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
> Changes in v2:
> - Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to 
>   'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
>   twl6040-vibra driver.
> 
> Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbostina@gmail.com/
> 
>  .../devicetree/bindings/mfd/ti,twl6040.yaml   | 142 ++++++++++++++++++
>  .../devicetree/bindings/mfd/twl6040.txt       |  67 ---------
>  2 files changed, 142 insertions(+), 67 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
> new file mode 100644
[..snip..]
> +
> +  vddvibl-supply:
> +    description: Regulator for the left vibra motor
> +
> +  vddvibr-supply:
> +    description: Regulator for the right vibra motor
> +
> +  vibra:
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      ti,vibldrv-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for left driver
> +      ti,vibrdrv-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for right driver
> +      ti,viblmotor-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for left motor
> +      ti,vibrmotor-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for right motor
> +      ti,vddvibl-uV:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: vddvibl default voltage if it needs to be changed
> +      ti,vddvibr-uV:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: vddvibr default voltage if it needs to be changed
> +
> +    required:
> +      - ti,vibldrv-res
> +      - ti,vibrdrv-res
> +      - ti,viblmotor-res
> +      - ti,vibrmotor-res
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#clock-cells"
> +  - vio-supply
> +  - v2v1-supply

I think the vibra supplies need to be conditionally required when the vibra child is present. 
twl6040_has_vibra() uses the presence of this child to instantiate twl6040-vibra, whose probe
then unconditionally gets both vddvibl and vddvibr.

Would something like this make sense?

allOf:
  - if:
      required:
        - vibra
    then:
      required:
        - vddvibl-supply
        - vddvibr-supply

This would still allow TWL6040 users without vibra, while retaining the dependency for users which enable it.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        audio-codec@4b {
> +            compatible = "ti,twl6040";
> +            reg = <0x4b>;
> +            interrupts = <0 119 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-parent = <&gic>;
> +            gpio-controller;
> +            #gpio-cells = <1>;
> +            #clock-cells = <0>;
> +            ti,audpwron-gpio = <&gpio4 31 0>;
> +
> +            vio-supply = <&v1v8>;
> +            v2v1-supply = <&v2v1>;
> +            enable-active-high;
> +
> +            /* regulators for vibra motor */
> +            vddvibl-supply = <&vbat>;
> +            vddvibr-supply = <&vbat>;
> +
> +            vibra {
> +                ti,vibldrv-res = <8>;
> +                ti,vibrdrv-res = <3>;
> +                ti,viblmotor-res = <10>;
> +                ti,vibrmotor-res = <10>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/twl6040.txt b/Documentation/devicetree/bindings/mfd/twl6040.txt
> deleted file mode 100644

[..snip..]
