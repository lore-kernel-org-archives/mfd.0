Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505008;
	b=Ou16BFxPJV4ljuLN2uO3vXNAe+o9UhLbfyN8dpIq6OqASlvU6VSJduREPSklW2FsdY88
	 qPXQfNaaPO0WAP5nHEiRtcwTWhhXP1vC087eocJ3C6iTCZ8l/8glREmLHpjYHFs5BaZzK
	 HRwBIgTyyulAWxDqoy5gqNMt0HPtWyIbklNxxiFcr3Aha1ut/HUMAyxL3d/rK0f9hxQ2h
	 DKVUav8kxiUm/FDYNvC6ZVUS4q3yNN5/HJz80bjYBtze88JjkTxqC5JjpG90BN19mNGHB
	 ODygIyRZ696OVxqu8SxesRT4fs0cMdQ45mVYy3Vam6YtfnMozqqdB8/qSw56RN9qdng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pUI83F+vNn47A4zRNccyxKlCOIII3kxuZu0/rPY+a/I=;
	b=riomRUnYx7IHtQP8qfBuSdVYq8SJfRNstex0gnU23P5WP9RYfeIc1+6HXyPyWu0Y/jef
	 2pS5x1TXgPx/+Wd1YvQPv/XKtyl6YmLibQVEfeypN0GWFYAZykU+nkr2mvlqxAhe6YO6Z
	 zrtOJgAMTklLmE04jQdT5jj9X7CpJqCXZX02aSv+wFTCo7bKtkVDe/sJf4AynSLJ5guIq
	 Sl4hJW9+UfND5jAI3COm47xcWpiqI0akNmjWMnADsQONzgqqCoNB0/H/w4bBLOrnBuqWe
	 xfVwf9Mllh92027KEf/mK2Buid0eXW7qpZvx185smZq8zRwD7rFyKW15TbXl3kHb25w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dHMKJvWh;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272E0606A31F
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 14:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272E0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dHMKJvWh
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ea138a3497so8084585ad.2
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505006; x=1793109806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUI83F+vNn47A4zRNccyxKlCOIII3kxuZu0/rPY+a/I=;
        b=dHMKJvWhyKZfVmni2bgYHCQJq9Kp5d/8GcoKLzg/fzy7CpACBuzKL6qgxuSkZFf2EX
         xqWJ9au2I/Nphtr02uFOZvM1LzbTBWF7GhrrEIe6DDayPlbwrU2ZBlLg2aevQkvEDjKb
         +8mZEHAhfmToRb+PhfSB0p0iLsHJymEUqfFKA5ADFdaUK+M53JongUwg6z4DewrJmfmt
         hQk4KBIgSK2IZQ1z1Hh6s0p794DD01d8o1Wdy6xko9cvQK7WxRgngpHzDL91GHq3X9HD
         ZeO/cknNwoulw1s5S/tQYqK3NIlDTZpNbw7MOC+8DLmVaxdTD3u+WQEZYGH8Ybm/f+6j
         KPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505006; x=1793109806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pUI83F+vNn47A4zRNccyxKlCOIII3kxuZu0/rPY+a/I=;
        b=ZzKOesJUbroL+kffwNccTAamiyPncEI0dieb2Z8Uz81oxMv+8tf0DV8ySD3eUIjaEp
         QTSg0z8Kjht5sz8dBmNO8lZW9xywpZ5+o8E++PkVg7YtQzYKTu7kH7we/AzTqjEc/fY5
         yVh/Tqcn6S6+o2XLDNEZD7uK9vvocP5Cl5jSMyG73VJ2pCeWMv44sIIiaaRqo/YC3/46
         yYne0Ms4fUgTnYvkxzfTv4TFKI9uqc18xRfWuyFqMOjC8MPt2k88EMTCntpiqfUEzw6O
         KPaGCfwbmrIliaowhIao1PCUKUOTyvJetq6UoJXVMwRgUNiQEYX04PP2XiCPIFVZWagW
         2Sag==
X-Forwarded-Encrypted: i=1; AKwUvBwO3CdGeZWoOEu//4ITAEZKzeAs5ie87cIDezHQSBO9mHl5esFRmu0r318HfXro+ePENz0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLj2l6Z/1/PYI17CPFWJVDebswy/cey69fhC0NBB4GAwXKr8V5p
	0ff87lF9EnHHvlr4ZV2ZKz9j3KGU39abdPiUVnLyFbTDTQLRUxdgIEie
X-Gm-Gg: AYBFou0BkZ6fDPPPotIFbkKAzc+9iffQBrGZ5JqkdeN8vTAEGhJt9ry7riRlJuMN34x
	lunJGHsXVdJVaFg+Gx1OA4W8EGk38TfpIk+CnmsCWFqL7jYCyDwYQX6cd/CgLHqwgP2Oe9CF3kX
	ZFtjXUZH1aHaKF1ihya2arrcxdNkPXVheCSSC1B2TPihhZKwnJNdbmifBH9f73D6BpN/0g94iz2
	Lp+zKiY47ETqy8bw7Kz2oM8H2ERPIXBOQ8EPEZ2pR8K3ai2tcjw38L5tHLeQRZ4OtctI0g+gCkI
	CjbVNGQb0vXC1NfUUge0ngcbGq1jUvgUoSMjpDJMusDNXsqA3807WRgggkeDiCcpoYbCDnM/dA5
	Sutokvehz8UsE3jof58O5N1EvLxnSvqkHAsKWX0Um+a95dyZuNlKv/EpffgZA2aPPngfEePTVje
	JfzQOaq6fjNmYzAKcEiqQnn1SDQ/ZFEUBx9qgd04jIxtCUEA+aZUJ4MMCTJtg8mOGmqwIe8WBaq
	SifAfMh6GM=
X-Received: by 2002:a17:902:e547:b0:2e8:93b5:c555 with SMTP id d9443c01a7336-2e9a6e5296emr88242645ad.61.1792505006159;
        Tue, 20 Oct 2026 07:03:26 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:25 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Tue, 20 Oct 2026 22:01:12 +0800
Message-ID: <20261020140127.720-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261020140127.720-1-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written,
otherwise the rails can drop and come back up instead of staying off.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time. The driver reads them for every RK8xx variant that is
the system power controller, so add them to all seven RK8xx schemas.

The array is bounded at two entries. Firefly's vendor kernel handles
exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
files use one or both of them, with an RK808 and with an RK818.

The lines are released from the PMIC's power-off path, so they are only
meaningful when the PMIC is the system power controller. Require that,
accepting whichever spellings of the property each schema allows.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk801.yaml          | 23 +++++++++++++++
 .../bindings/mfd/rockchip,rk805.yaml          | 29 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk806.yaml          | 23 +++++++++++++++
 .../bindings/mfd/rockchip,rk808.yaml          | 29 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk816.yaml          | 23 +++++++++++++++
 .../bindings/mfd/rockchip,rk817.yaml          | 29 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk818.yaml          | 29 +++++++++++++++++++
 7 files changed, 185 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..2f9554d 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -29,6 +29,25 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -71,6 +90,10 @@ properties:
         unevaluatedProperties: false
     additionalProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+  power-hold-gpios: [ system-power-controller ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..1a11c98 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -48,6 +48,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -102,6 +122,15 @@ allOf:
         clock-output-names:
           maxItems: 2
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..3df5501 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,25 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   rockchip,reset-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2]
@@ -138,6 +157,10 @@ patternProperties:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+  power-hold-gpios: [ system-power-controller ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..a331a2f 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +133,15 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..f90e5d5 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -44,6 +44,25 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source: true
 
   vcc1-supply:
@@ -101,6 +120,10 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         const: gpio0
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+  power-hold-gpios: [ system-power-controller ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..b1cc54e 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -189,6 +209,15 @@ allOf:
           patternProperties:
             "^(BOOST|OTG_SWITCH)$": false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..96ec07a 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+      The lines are released in the order listed, and power-hold-delay-ms
+      elapses once, after the last of them.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -105,6 +125,15 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3

