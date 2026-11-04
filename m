Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795188;
	b=IID8MOWEy1xANrjIpt+sCUfz3NRWFhnO0ZGqyNMB+DtVEr9equbJ3UGheB7GvTCHsWh/
	 2XKfgut8hMv3FiH0vOKS+tWyhPZ46OZv7a//7xSe51ek+Y0j+u0pG79acBPh4megPbUUe
	 QT39YbgNI65HcDdZzd4QRHZrGn7RNUf3sWltecWX+o8H3KpSGfC5MYnd5E8trSyyigTXb
	 Du/aPR9yl1FewxUvcPlRwCSMkGUX//YQLOr32MyJ69PSHo05Lrc7sQdC2btzEsJ8h1oDO
	 +ixh6NvhMmVE4ms/3xvUgi0ud6HyGfbdrGbzJ0HU6e30Aev329Bb9MDz3RdWn/cw7Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
	b=beAZZY4vgo0swKrLz7MjzqoT+dJnEelv0Pp8Rn+1AmFcWOIfda+8Rh4R+Sldm+h/Fwcy
	 NGxtEXOVbcN+jxSuKkAw8FZpqSj5ANOKPNCsk+C5Xhv05BUZQoaBH8l9Qt8gZs44m1qce
	 MzYUSK2xmMiHFbwbvFjUvtzGIpy0LIhPNE9bLPntr5yFmUuTcfo875hAGO1KyBJ6Cz4qW
	 8c5RDvZORAYt9GQSf1RDqS9+WFXTLakFN5oxa4GNw1PKASvtqKlEevDzbmh+kPXM65Zxc
	 qN84R90yaGeCjKetUN81QWo2JHkx8toJ+iUY+x6VjsULc22ovhMRb2R6MmL4bgF95xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JX+V8glS;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EDC606D806
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19EDC606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JX+V8glS
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so4419065e9.2
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795186; x=1794399986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=JX+V8glStA9HoapUe6BNHyyLdrsz4Sga6oj7TXhqHmDx2F7PC69BW8VbhNAeHED/0g
         ldn6bN7lr4ild/h6ZA7SKWe/ff39a3IeJl8JvGEUr3wuQhd7rDOtUrc+Fs7DYLCiihgk
         HwfaMM7Vdaewp/ypblapkiNLdJPXYWnmimQYwTdluQdLz9UvXHUBgKaFdzC7pT1aQOhF
         WnjehwU8+Ene0ri+u2DIn35pOqoJmpb/zYraCnodiQNcHrGzDMHsUKoZ8BVwXksXxKGE
         Y7WR5IV29zfNelppW+xEQwR7xuaeFqlUKyHWh0bY2jPlPJ5cB6pGBXM9Q8N1vUYyZlKQ
         kLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795186; x=1794399986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=ZNri1VlXq1ApV0Uof/f8LD5+EiTs8GEHvTDBBCkv9WjJd7jBy5EV2J82noOc4XbNCC
         GKTD7h4owRxr8rhsclUhcRjHXCE4GJDZ6dRmzHJ4YlmdCXAWiPJX6ETYoZPkqQEmrP7q
         6N9Ra1L/W7l2rO47vLk8GGmz8D37FrVGCqkzUwTce2st4D/ZAWP3GiieX7wLi8csZWyL
         eIB+fbHT2gawA1y66QTaK0YXuyhLQibTDlN/kGTbqfzsVpimto5C+rhOIySGmSHx3K4Z
         Tk5NKrWbeUipwuFNYugoVisRgACQMF69CX20tn0+RTQiwIKpfeFfByobThGP33mWf/1p
         IoVg==
X-Forwarded-Encrypted: i=1; AKwUvBxvgjB4INonOjSAos3YY7+jz5mkcXmFNfp1K4t2k0lGJmY2mn30u8v9CLU+0B8nWfBLxkc=@lists.linux.dev
X-Gm-Message-State: APuU4Z/HYxPWlwLDmcgG76o6t/lBKDBDNgmC0hj9WWXGQtRxF07h5gVs
	hX2qfZ7r2KbfloNNYUtiF6DTZWQ2+Pi59uC+raGmNEl7sagZFvWJp6Fr
X-Gm-Gg: AYBFou2/wQsF+uKqz9d0tdRRFeDmiUSdgAsszsQ4eCFj1RlqiUoXRJiReizGoCP5H6+
	FbEBk6w+Sh8TlylpJXA8xh6yETLOJ9yzkwYpuQBpGfByIEBZTDYUahzjCUQaxCmR0lNCqxDHmdg
	6j8X+yNm5EaUdoIERMYdh72buQ0xEz3/PE4YKeGTrlw4sFOSNVAo0yiwgMZsSWmR1/tnaXe7+Ow
	xpGOGDF7KcRO2EE8VgoYj5ECdr42Mx0CvN9EBnieBXMEpLZmT2lKRg20hvx5+UE82rxulg1obid
	syci2LT0k0Ldqwp1DtePerPnxqKCC4LoGjWqAMmOGQXFCOKiMgKHtgDHhgSx38XEsqxeuTPBRkS
	2DKtgIuiBc9mkXlgM4OYXid/XoCRbzflYOgHcIPDX6bdB2/3C0Ar4TfiMSfK3A30UtY2PQyMkV2
	opwtqLj6TxpQktlBMMlMQDCUQz9pGlHyHtKmFp27peTx449+CmG7fqx4aNfolW4jiKVJhAVZt6+
	/hOyGCr+ym0rY5EB3P8eVwrXxr2guyMZnyKX/FZfJ52BI38HcR6aRXkZ4ONdpgF2BP1J8iYh7aP
	i+KukmBw3bqjcH5CpGIM/ZBdPO1mnTzcHDxqIzhneedXK1n+Rw==
X-Received: by 2002:a05:600c:698d:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4ac185bd1e2mr362326075e9.16.1793795186366;
        Wed, 04 Nov 2026 04:26:26 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43da9825bsm50492415e9.15.2026.11.04.04.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:26:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v13 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Wed,  4 Nov 2026 14:26:00 +0200
Message-ID: <20261104122606.215629-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104122606.215629-1-clamor95@gmail.com>
References: <20261104122606.215629-1-clamor95@gmail.com>
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

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 0000000000000..60b6375864aaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,tf201-ec-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controllers attached to an I2C bus,
+  running a custom ASUS firmware, specific to the ASUS Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    description:
+      The 'pad' suffix is used for the controller within the tablet, while
+      the 'dock' suffix refers to the controller in the mobile dock keyboard.
+    oneOf:
+      - enum:
+          - asus,sl101-ec-dock
+          - asus,tf101-ec-dock
+          - asus,tf201-ec-pad
+          - asus,tf600t-ec-dock
+          - asus,tf600t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,tf101-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,tf201-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf701t-ec-dock
+          - const: asus,tf600t-ec-dock
+
+      - items:
+          - enum:
+              - asus,p1801-t-ec-pad
+              - asus,tf701t-ec-pad
+          - const: asus,tf600t-ec-pad
+
+  reg:
+    description:
+      The ASUS Transformer EC has a main I2C address and an associated
+      DockRAM device, which provides power-related functions for the
+      embedded controller. Both addresses are required for operation.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: ec
+      - const: dockram
+
+  interrupts:
+    maxItems: 1
+
+  request-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: asus,tf600t-ec-dock
+    then:
+      required:
+        - interrupts
+        - request-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@19 {
+        compatible = "asus,tf201-ec-dock", "asus,tf101-ec-dock";
+        reg = <0x19>, <0x1b>;
+        reg-names = "ec", "dockram";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpios = <&gpio 134 GPIO_ACTIVE_LOW>;
+
+        monitored-battery = <&dock_battery>;
+      };
+    };
+...
-- 
2.53.0

