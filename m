Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090745;
	b=eFPDAGPOZMiqnYeb+52to+V5b65dEicelYWnxm78PUeVO6SpbbOY0nkePUoLSLj5cGz5
	 MW5G33mYyugVoKPhuACyGEu56i0l4I0ozViw6D5x3E/TX3W7qsOYo3uxuP98BuIiG1HpR
	 3z33mBrC9E3dhpcvBrz4ICwLVbnEM2B8MyxBD1+RJhU9hyC3ia2otDvJmQWYyi3A9h9cu
	 5gVGf/AeuxLiPFKe8xCQofzya6mttJwG1OzDzt1Mn0gecF5v2t/9L8N9p8tJzX1AwmQcb
	 BUYLYkffUVUO3+M5BqgvyGJhg6dKcdDcHbxsGH9IxamtJq5ybg7pY1qS7Vc1MOHryGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
	b=4yuyy4PGUmabRHgCVO9H5katRiNpoI3N9NaQAk1qniMWSoBavPpQF0KzNVfPsqo/VfKH
	 J4oDSGPfIj/oSuTPxRsm1kj+Lsop5pxP+hC/yv6ku5yy06cbI3JsWtoqc3MakI4WwriUs
	 QehDweyneMtE4YpOQKgZGFDld+rZYXiogwh8EUSbGeWi9M/5wiB+pv7ApDtKynoFdz+go
	 S/ENvBNUzwiIns42BNBaie0NzOGv/eNfKLEFWoMlDhzhq/RparyB0nBBGXDKEw69YnZOm
	 +PG9EZXhgnNxRQaBF5jHQt4e4OtbUIJC16J8j7i0/wLrj4wl+cRja0GKak4rwpFKPtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="nv/Pbrw9";
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C53606A31D
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 08:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C53606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nv/Pbrw9
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-89ff475a152so1548775b3a.3
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090745; x=1793695545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
        b=nv/Pbrw9zNKls2t13KJyaFH591wrHcgoHEassO3xkoYqhJilNiQfoap47seuN9G2eK
         1+3A9gNabLxI97XCBzsTaeXeSMdvqpLoecfvnehWqyTOfpWBEgG5z1J6KQ/NBZ9pOIVm
         0v1zTQ/190N4O6e+oIoMMLTualS++tXMK44H8zymRk3GqEKacz8HdhAMWLXLRIvYFGHI
         nj9Rt2SrSy7G/OrkvzGSVI013gRdP414WVxPL7pC9eVQj50uDwS5NdjS6QNx+PmMITfp
         fXNr9pdx0Dbr2Q6Yeoq9LXgMK8fZSAf663P+YS/cEJkVY8C0LF2hE1+eI1J7FyqGhn4j
         2hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090745; x=1793695545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUtBDBFlnuwqHCLsz+VPCk4N74H4c6MrUI5YYlRszuU=;
        b=Jknfz9uRT6VCI2bbugWZEili/4+3yXGAE6DDkIOiwe28PDWY6HbiJUSSlkrq6ukB51
         l93kFMCsIDvkLWi2uUG9BTTZANq6C8RHYCAEjbv5yN4IHGy4erTx2xtdHbC30q90SOZ5
         Dp/Om/2raiDJlxrUf6ZIyqt3tnCNNRJjPp7Hq6HZ8psQQVtb5zzfSDLS4Wd+hgQqU3kt
         7ihHPp3Cs2+opnOGgmjTAM/vqQMR4cyfcluc5ZP1NjmNvw2PSY/ZUnbR1zu7mMVuLDeS
         0TYC0J2uM8qcqsnAZUxe94Tivyv18KjcM/aRfYNtIc9hJ9jIBBYajIup8HpHibfKkjNZ
         Q0dg==
X-Forwarded-Encrypted: i=1; AKwUvBwxgaIUIwiB/+SzMlUc5aUDtNekrp//WOOf9ssZUlC8q/sPXb/6M9v2RcsR+JNQef9Dr7g=@lists.linux.dev
X-Gm-Message-State: AFq9FYKYK7XSYmNLRYKz0/UAe6hvdrQmueIm86WZ92je78agfoqPntJ9
	lgfz1qW/2kDsVCiA9VJfFtbdkrywS19cckG3PuVskfmgkPP+RAdDbc1D
X-Gm-Gg: AYBFou0v73Zgh39a6WZPWDzzsgNRWnkq+kAe9F1B8tHmb2ULCvtL+FqzzhvdwK2aqBt
	UKOA6d2Gv//7jgfaRnuw80BjLknh+3OfM+Zg4B5qW6yK5teploiooRJi8H4Kp4wI83HAfgzidT4
	1VSMR1Na/tQv7J2kIVz386XlXhcYBoHp1Zf4S5fpTFpKChoR0lF89CrxUSv8KSkE+KGS4i9/7K+
	d4RwtKwI6+/KR4UPnf6VEEbvw4bqkZSa6I7NsCC8PjYypwYVMTiFtxTycWzW0Fkxa3/Jr7wkceH
	7kV0+HrBJE9v+x3+SJ8oCqxVlASPokJjBBp3M74HMQ1g1Sx/79B1y8uLfrxvEhTuCXvKrdnfKtA
	vh9mB0JSx2sjDL0fqXBnoc4/K1vDWm9EQbQvAdcd2dBbbDlCHXpBdjUTiiSn1m/QjiX57/AZPR+
	3ZGxDm9hO+KZofS7DOM/lTEbin4xClH9+6iDDiXovIptQtAv0XN3hqMQUCgqoL7okQ/OcWntn4A
	J12zZmFpjxmBllII9bKila5JkUB+iyweEfHIEfmsVlcvEwMLpscj1Sr65N8vJhmvXSiuQ==
X-Received: by 2002:a05:6a20:ef03:b0:3e2:1a24:fb82 with SMTP id adf61e73a8af0-3e7bfa2023bmr5501098637.16.1793090744450;
        Tue, 27 Oct 2026 01:45:44 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:43 -0700 (PDT)
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
Subject: [PATCH v5 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Tue, 27 Oct 2026 16:45:07 +0800
Message-ID: <20261027084511.1992-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
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
meaningful when the PMIC is the system power controller. Require that.
A board adding these lines is expected to switch to the generic
system-power-controller property at the same time, so the deprecated
rockchip,system-power-controller spelling is not accepted here.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk801.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk805.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk806.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk808.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk816.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk817.yaml          | 24 +++++++++++++++++++
 .../bindings/mfd/rockchip,rk818.yaml          | 24 +++++++++++++++++++
 7 files changed, 168 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..bfba394 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -29,6 +29,26 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
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
@@ -71,6 +91,10 @@ properties:
         unevaluatedProperties: false
     additionalProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..7895c31 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -48,6 +48,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
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
@@ -102,6 +122,10 @@ allOf:
         clock-output-names:
           maxItems: 2
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..b719b07 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -31,6 +31,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
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
@@ -138,6 +158,10 @@ patternProperties:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..0be2bb9 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
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
@@ -113,6 +133,10 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..a834a9c 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -44,6 +44,26 @@ properties:
     description:
       Telling whether or not this PMIC is controlling the system power.
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
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
@@ -101,6 +121,10 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/string
         const: gpio0
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..2c05275 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
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
@@ -189,6 +209,10 @@ allOf:
           patternProperties:
             "^(BOOST|OTG_SWITCH)$": false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..319c0f2 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -43,6 +43,26 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description: >
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, as the lines are released as part of its
+      power-off path.
+
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
@@ -105,6 +125,10 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3

