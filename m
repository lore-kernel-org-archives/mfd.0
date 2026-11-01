Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547675;
	b=iw/RZ9scDTURnMi8ueeOvQeHm9UY/KJ4bfoF2NnXeOiF/8NmDgHUzX+mJ+q4fblSVr9m
	 /QRFTUEpI41pI+T6duJHKc2HlEC/97c/ELis8+AgOL11nXJq8oDf9qdKlb8NhxH9vk+yG
	 8+Y9s3Lp9rZDa3sFBF9QIRNrXD7Jg9xOpwbo2ptu9guq1XZH68L4NGkkxRfuHQXpAJWAf
	 Q220y/zNoS/0oRtc3D6bnRHXtHDQljzULB1yIhz9n0A8kbucbEEAw4a58s9LWGwQdJS62
	 WE6amH/+ZtbRBC9w7f4SYD256YUNOWbzaHYjJgWN5FYtBewVeAz0/SpeOVbrPe+zoMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
	b=Olcr/U8sXFPwQIfPqcYFDM2EsTZIYz+VNhoD6iAjURmy0AoCdMpKCXA0//A1l3hieUkO
	 vpWPH0DzxQGR/SkWVGzc9oSXOuSDxv8ouHG4HvTzbaZDJbQtQE7gwbRF0kdpmqQjllgXq
	 OWp/I7iwk7WaNvStn+8XDD1+dZumrSzJ7zUV81OET6ImJ/EzSfAVQmtd+eoXfy+6EfOn8
	 XZnDaQh7wFlU/IJPXE7bEKx0un2lBpW83rg6HVOOF+05rLeAaRcVxQ2dmZkVbLHGph16G
	 BtFixU0IGRA7oOpWWaExkQGvhIrY5THU88matxdD7Ql01JlVjKCQjxzG9oKWGbfJ75g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqLvdrm5;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD343606A32C
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 15:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD343606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqLvdrm5
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so781422a12.0
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 07:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547674; x=1794152474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
        b=sqLvdrm52/sQ/3jYZS3KQRaB3z0gBhw9jsdVkuGnHOhRWxo+h6MOltEiBCKpODFTK9
         1RAegDefSc3VsTI3y+v03Z8DuokIkApY/Ppp03MqzlT+FbSYIQv/LjEcoWfaFN2KlMgB
         OnSbZ763a8VQSWVSyrntV1MHG3QNyAd92ErnzAFbCW5ss/EHbBBfo2n43K8jiq6KD0L8
         VWOOIlyOItfYc4pty1BWPqU9UHnPbY7Jxb5cAhYHaxWIrwF69N1e4TM6309Se1nsEZBz
         ZPUTmwqmpiPEiHvBu8WLmqqIcEKTenU7N2xS3GzBUT2SULANeHUkTxqO/3nPUVNCKLJ1
         UKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547674; x=1794152474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lnaBOUQQ4XDI1nNodunw8QSDiqgsme6k9gqV20nFXM=;
        b=CyIuDxy8me/m/RyPIUSNldg4qEseHM0wvXQIXLEDOad4HzbVD8rLYCHiuDkEiXSp5a
         hllQnX04xWpHC2F7OCNX/7cxoG8ab8JWYn4pakNC4xriZWAzPv9TVtojYrQq7rymn9B8
         6TCz7LDF71fTPB0NUXyHnfzvu0LxEKxJk918Pjk01bMP+si3PJb8s6/tPPmaxZyBlnui
         yumSSkSzHcykQBy/73OhhuAjFAqV2EIvh5Sp0QvLN+JWRcknHNL+t77lDaoR90A1dpzT
         nqCmHl5jlPkae6lyVkao7hrfV7mCkP9H7UmXKxULWk7Dv6MR3lxLVFep1JMuzdL+FGMB
         xbag==
X-Forwarded-Encrypted: i=1; AKwUvBzNL9t60SShJnP7G3PwFimGQ6cKsx+fArv8zpGm/OuA5b3DUoza4LLRXmBrQoocusfGJc0=@lists.linux.dev
X-Gm-Message-State: APuU4Z9IYU7TUa4VJI5JpPNFK90CJaznpYcwDfD9y10VDySUBKD7Yh5y
	R/hsXyAHpEtH4coDksRhfetxDjLLOXCKmRP1qBL3MmlqooaSMEjgV07J
X-Gm-Gg: AYBFou34s9nKbx0KdHn+F+wSLjr+e9Ap/jgmfUyiBED5yKO+2TVN+ZUdUQKZkGOPVPX
	Y03HyURd7pFeb2tEYGYU275oIqZ9P9qRzM4Ywnqn/Jn51sC6JLwuh1fA/lUc2jCr5Bj3VvLudAj
	ZQmZ+QsrsXOPqmNGO0C6qgX2Txw7FjfTz5HAZr0RV3/okMX2oDPnWs2MZUkeAjHwFhFAeGBV3vG
	+iPS/psHUno0yTdVr9CpZyqu4IsWn6DdTIl9Z6R0loG+mFDHoxS2l6T6JgE8b6jFMKS6vmxHkNL
	XOQK7K5gVZTDqKbu0G05JHeYDPaUE9NPerPJu/Cax7AWDvw9YfFXVPv3NWxfVR2Y0SSLvdTtSG4
	vUIEfJY8Wkz/pLlLWZyhhMpp6YAB9SjydXQe4oEXty5+gRLMYeNRsC5M1qSFN9h0jW1PMV/3vi/
	i0ME0i/5oWBZpHEes0tcdS+tdMi58S+tmLWi56/40XZgrz6CWo91ZpayaPEArPpQfO3BUA4w15+
	XLaDCDu6SPBM6f/46+4TO+5jKwZO3bIn4PF6Ks5igVxGWC3yw71sh5IiMlgo7um9hDl/rX2NobR
	KAVTZznq7rZc882z3i2hKPklQpAwjoNEeJygAW3swA==
X-Received: by 2002:a17:90b:4c08:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3ae8957cb02mr6684585a91.8.1793547673934;
        Sun, 01 Nov 2026 07:41:13 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:13 -0800 (PST)
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
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: mfd: rk8xx: add board level power hold GPIOs
Date: Sun,  1 Nov 2026 23:40:50 +0800
Message-ID: <20261101154053.3874-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
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
the system power controller, so define them once, in a schema shared by
the seven RK8xx bindings, and reference it from each. The bindings
switch to unevaluatedProperties: false so that the shared properties are
allowed, except rk817, which keeps additionalProperties: false and lists
the two properties: it also references dai-common, of which it only
allows a subset.

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
 .../bindings/mfd/rockchip,rk801.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk805.yaml          |  3 +-
 .../bindings/mfd/rockchip,rk806.yaml          |  1 +
 .../bindings/mfd/rockchip,rk808.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk816.yaml          |  5 ++-
 .../bindings/mfd/rockchip,rk817.yaml          |  4 ++
 .../bindings/mfd/rockchip,rk818.yaml          |  5 ++-
 .../mfd/rockchip,rk8xx-power-hold.yaml        | 42 +++++++++++++++++++
 8 files changed, 65 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
index 7c71447..38108fe 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
@@ -76,7 +76,10 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
index da23915..ddf2b2f 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
@@ -87,6 +87,7 @@ properties:
     unevaluatedProperties: false
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - if:
       properties:
         '#clock-cells':
@@ -108,7 +109,7 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
index eb5bca3..5ca76dd 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
@@ -136,6 +136,7 @@ patternProperties:
         enum: [gpio_pwrctrl1, gpio_pwrctrl2, gpio_pwrctrl3]
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
 required:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..d51f815 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -119,7 +119,10 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
index a58d945..c0c8dec 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk816.yaml
@@ -107,7 +107,10 @@ required:
   - interrupts
   - '#clock-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
index 2cb6d17..6207c42 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml
@@ -55,6 +55,9 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios: true
+  power-hold-delay-ms: true
+
   wakeup-source:
     type: boolean
     description:
@@ -157,6 +160,7 @@ properties:
     additionalProperties: false
 
 allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
   - $ref: /schemas/sound/dai-common.yaml#
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
index 90d944c..c9b863a 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml
@@ -111,7 +111,10 @@ required:
   - interrupts
   - "#clock-cells"
 
-additionalProperties: false
+allOf:
+  - $ref: rockchip,rk8xx-power-hold.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
new file mode 100644
index 0000000..6be3e1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rockchip,rk8xx-power-hold.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK8xx PMIC board level power hold GPIOs
+
+maintainers:
+  - Yaozhong Li <yaozhonguwl@gmail.com>
+
+description:
+  Properties shared by the RK8xx PMIC bindings for boards that route power
+  hold lines from the SoC into the board's power circuitry, which have to
+  be released before the PMIC is asked to power the system off.
+
+properties:
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
+dependentRequired:
+  power-hold-gpios: [ system-power-controller ]
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+additionalProperties: true
-- 
2.55.0.windows.3

