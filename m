Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691404;
	b=m610Bbl4VAkzfiDt3obGSH6mSvyAyafGUuKwuEzPfPRek7Dy6Xk4NhBz7b/jVQNND8YO
	 FuCcDfMAl+85FvgzgcajRWG+yNmmp+vBktmrYjAt7McYlErURktPUgqNba7amwFk6/N5o
	 dkLGi1HJU7wZSZx9WsExKLVhrGGLdEAKIUv0EzEuoum8lq2zdEfNa35BPP2oqF5GSQiOy
	 X/vrSVK1zGiRhw6GsJcjiy6c3zuw7lumsX8bkAZNfsz6aD89xD36QkcV0j0m7kGcBYo7o
	 BjNqPgyO/KtS1l1JkZhXG0CCJp9m6MMMwxanx7MmHem0ORkB0bUAToWVFmb7I7SsVBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691404;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NWd8D/ggteamK/i3dbONpF/gMpdizrnBXGdhTocPbCk=;
	b=PXVdFno+9Wsf5uVyEgHhIIRT0hIN/kOhUwJIaNqjCH3zO2PGo3SSWgWxlVoV2ghHJnz0
	 JQpk3mAq9qBL+NlMfebluRZwUzKE/VhAVI4ElhtaOtu/m/W/6GDkMIuXAiToIkQ7vO6Df
	 WY08qFwKBSuI83dKy8h5zyiuya/1gmt/C+MJ5xs8M2fyjYaWyCkBJ8AKRTXd5mbKvmxi/
	 esCHMJQwaBQb8PkhbLPZclZx5bJw489d5zzu19138X40TXBrnp5vD6+LcfuZIk17GAYax
	 ty8hMhPsD8u8Ip+TDM+DIt8qJst6L/0mZJ1fYpQKsww9ltcg5UZytzBu8EYN2Fh9hww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G0PIZZov;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A388606A31C;
	Thu, 26 Nov 2026 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G0PIZZov
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFED1F000C4;
	Thu, 26 Nov 2026 11:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691403;
	bh=NWd8D/ggteamK/i3dbONpF/gMpdizrnBXGdhTocPbCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G0PIZZovWAnw1xbnmF/Q26vFdEIXJEVzqAwthZdFr2Jhxw2dd/AiItxe+NPaOGpsF
	 QmcA4hxe3chH4ifXw4AHW0RcUQXoICSCKT5BFEKuCLq1H72xfxE2fbmw/xLZSLpoVf
	 FyciEapF1CdtELpjEGoHY41zvILvQhxxtnfdgZehx72SCOth0ESlqzfohDf5dI4RBp
	 gHmx0eijejxYBy2b5HRnsd8bSfdVjN6CrNWwsiJyJJ5YL0lLqnPIMG8557trQLlnm8
	 WfRR1UvkzkoReeileErFEjxIgND7P7lAYKYzVp7qSQi1xjwcP80E1XfO31DzjrOOPe
	 A7ppHabJA/n4g==
Message-ID: <sashiko-outbox-235333@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: power: supply: Add
 qcom,pm4125-charger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raj Aryan" <raj.aryan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261126-smblite-charger-for-pm4125-v2-1-20656509518b@oss.qualcomm.com>
References: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
 <20261126-smblite-charger-for-pm4125-v2-1-20656509518b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 11:10:03 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: power: supply: raw ADC register values in JEITA
  properties
- [Medium] dt-bindings: power: supply: pm4125 reg and IRQ claims
  contradict schema
--

commit 57cf825c23ab90280bb771024041e96a79554ade
Author: Raj Aryan <raj.aryan@oss.qualcomm.com>

dt-bindings: power: supply: Add qcom,pm4125-charger

This commit adds a Devicetree binding schema for the Qualcomm PM4125
SMBLite switch-mode battery charger and references it from
qcom,spmi-pmic.yaml.

> diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm4125-c=
harger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-ch=
arger.yaml
> new file mode 100644
> index 0000000000000..4c88d836355b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.=
yaml
> @@ -0,0 +1,119 @@
[ ... ]
> +description: |
> +  The Qualcomm SMBLite is a switch-mode battery charger IP found on
> +  the entry-level Qualcomm PM4125 PMIC. It exposes five separate
> +  SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks and
> +  supports USB input current limiting, JEITA temperature protection,
> +  battery overvoltage detection and a hardware watchdog.
> +
> +properties:
> +  compatible:
> +    const: qcom,pm4125-charger
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 4
> +
> +  interrupt-names:
> +    items:
> +      - const: usb-plugin
> +      - const: bat-ov
> +      - const: wdog-bark
> +      - const: usbin-icl-change

[Severity: Medium]
Does this schema match the commit message and description claims for why
qcom,pmi8998-charger.yaml cannot be reused?

The description and commit message state that PM4125 SMBLite exposes five
separate SPMI peripheral bases and a different interrupt set from SMB2 on
PMI8998/PM660.  However, this schema defines a single reg entry (0x1000,
matching SMB2 where the sub-blocks sit at fixed 0x100 offsets from 0x1000)
and the exact same four base interrupt-names in the same order as
qcom,pmi8998-charger.yaml (where chg-state-change is optional via
minItems: 4).  pm4125_adc in arch/arm64/boot/dts/qcom/pm4125.dtsi also
defines both ADC5_USB_IN_I and ADC5_USB_IN_V_16, matching the usbin_i and
usbin_v channels in qcom,pmi8998-charger.yaml.

[ ... ]

> +  monitored-battery: true
> +
> +  qcom,jeita-soft-thresholds:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      - description: COOL threshold as a raw ADC comparator value.
> +        maximum: 0xffff
> +      - description: WARM threshold as a raw ADC comparator value.
> +        maximum: 0xffff
> +    description: |
> +      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
> +      comparator values written to the BATIF ADC comparator registers.
> +      Example: <0x5314 0x25e3> for COOL=3D15=C2=B0C, WARM=3D45=C2=B0C.
> +
> +  qcom,jeita-hard-thresholds:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      - description: COLD threshold as a raw ADC comparator value.
> +        maximum: 0xffff
> +      - description: HOT threshold as a raw ADC comparator value.
> +        maximum: 0xffff
> +    description: |
> +      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
> +      comparator values written to the BATIF ADC comparator registers.
> +      Example: <0x58cd 0x20b8> for COLD=3D0=C2=B0C, HOT=3D60=C2=B0C.

[Severity: Medium]
As reported by Krzysztof Kozlowski on v1 [1], should these JEITA
temperature thresholds be expressed in standard physical units rather than
raw 16-bit ADC comparator register values?

Encoding raw BATIF register values in qcom,jeita-soft-thresholds and
qcom,jeita-hard-thresholds bakes hardware register encoding into the
Devicetree ABI.  Since this binding already includes monitored-battery,
the soft (COOL, WARM) and hard (COLD, HOT) limits can use the standard
alert-celsius and operating-range-celsius properties from battery.yaml and
be converted to ADC comparator codes in the driver (for example via
qcom_adc_tm5_temp_volt_scale()).

[1] https://lore.kernel.org/r/a5f859c1-0779-4ae1-88f0-bfa12268e09c@kernel.o=
rg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-smblite-ch=
arger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com?part=3D1
