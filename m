Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB6243E9CD
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514016; cv=none; b=RJmJ/7rc1KPMnJguthtDz+bQo7PbnuWMHaDqrxt90l6KxgJPArB9JV+3VbZzdNYA1oztZruUWujf9vSWVt3pvfHYogYAOHn+eb+NYWjwrLuFPl4ABm0g+kvBJAiUaIS0lAK74v0wBy07HKlqqVry+vSTmcdg2bS55RWcURQb7WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514016; c=relaxed/simple;
	bh=X80VD+BeEDWgeBkAHdnE1UoBvmAMEG2lTMJ/lNSBay0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PFIWIURhiZ9amOoDew05Y3m/V1YriUrtnV5qSekSHRqi/NPUtC+z5Pfm4QRJhYYHjH2MteOAgvRHeprGHeU8l5PU6YO0E+xBEP2r6cSThXvz2zOTAX+cQ0A3/B02i7NPlryiZjx0tWkt1Q6yOA4oOtimBaE2aQGQmvOhHvgVq1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lkrkbmbo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lkrkbmbo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c00f74baso4158555e9.0
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783514013; x=1784118813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltAZgPc2qTBdTDCtOOXVslMk/0yCzQbFFc7sQVr1uZQ=;
        b=LkrkbmbodeB7KRLozx4cJp4/X6IS4fQdjGi74hJ9n6WO6k2ickik7VKgAR4B3b+VkB
         8zMzgPnXl2Wcbn8yi5SXqnLRlUXYm1TJs6mjHwj5tyFUl3n0l4Nk51LxhEU5lKMolT2V
         t6aITo91tZhqIN992EC/kTcWsY/h0XiOsHz2kSro2KRHHGXik4cY1tj/V6BsK1icaC97
         O+6PQ7ffX2SYFBVgNeLJOnGmRiNpS3RSJyK6Sf5707h4tWkKVtcTb22twwdrrISgkguS
         tlYLlhrGl+qD15cilz0eE4xX/BPbEUkJLNaLJXeEn3GGk++ehEjL3pihEaYC40DtVT70
         1imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514013; x=1784118813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltAZgPc2qTBdTDCtOOXVslMk/0yCzQbFFc7sQVr1uZQ=;
        b=S4vH1vqVDA+zlu+nQEI3ugZ6ZpyFGsh2mWl9Kky8yX+Zw4043fFfI1CTwiaAJZA/Qo
         Cd/kBnQZ8C0E6dOrQ08P8VziBmkD6ETED3avmMvWnkofTKKVpRzi/mmZZgV/c93eytml
         4ObGN79FTokJ7CGQDIH7reAhGHzN1Mb9QFxwIeP7LW16rCkUOZKH/oht0ZWHYPinXeQb
         XNqIfKC57NtAi7/9/lHcWhexzUnF9IFZ3Sh8j43Xx5LvnaY+fYQU3vl96On6hI39CS7b
         MLdVIhBev2rQDOZwA7t9UXuoA4oRlRxL9gsnuK9eZedr+Z2bY1+yEzBBA8B3FCKdOw+k
         6yPw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0qbC0cTY5675kTOt6CC7U/oOWOtmSHEtN5HGWumPmMpP7BC+kTD/jTYjidA+6qgh3UxY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCQiXUJJH0K/i+lsnXXC6fCfUoEAlULgVTFWaGaTuwR/fZw2Mi
	lI+Vk9P5aT2M/1iRzAVd34M4cIdsodm1EJ9kPx6J+TfwdVO6Y7QfLo9R
X-Gm-Gg: AfdE7cnFvX/VhZyN4l1PbFaml7EPxnOfkUbzAwj3lWM0ZFi5DrF85V+v8XE+LT92bqy
	dL8fzGN6CV1jzDKt3TloCWUNUBhDDjUht70Lg5elPeTXPnCv6KMnHdLgwRksxNYr6hpkYuXkyx5
	WSgfFCW0TGUX7zRopjGJWTXXDsRLpqGJqZ9Bl/hXhJoPwDz8K9AQJEBT8+hZ9w2FLBAiMc8CU6/
	g5JwjDZ4zmniCTmFiHklYhcTx1W00B4vCqRar8BUJE3yg40EcbIHRaK9iW6GxagMo61PP2hLaMi
	QNAXKeoZt7WnG9FmHWq7xWf1u1Xr0xJYQAB+WIydx4S9nDNR5q9GmJNhsibI7auvoyOsB8sMhzv
	mV0/0sqD+4xAmeLIWGAc/U7oknQGcO2Qe6TbD2cesQtnWb1KgWoTDuT3RSMQtG1gL8G2TRDtLC1
	KCHmlA8EbzHkTXJq9QMFuP/bjHYM4y47l5P08byOiUqXc4qU3ZRL7gVwI=
X-Received: by 2002:a05:600c:8711:b0:493:c816:4b64 with SMTP id 5b1f17b1804b1-493e6892f76mr24414505e9.1.1783514012740;
        Wed, 08 Jul 2026 05:33:32 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0f5b811sm222873515e9.13.2026.07.08.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:33:32 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: mfd: Convert OMAP USB TLL to DT schema
Date: Wed,  8 Jul 2026 12:33:28 +0000
Message-ID: <20260708123328.1768794-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the OMAP HS USB Host TLL bindings to DT schema.

During the conversion, ti,hwmods has been made optional to resolve
dtbs_check warnings. Modern OMAP platforms do not require this
property, but it is still required for older platforms.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/mfd/omap-usb-tll.txt  | 27 ----------
 .../devicetree/bindings/mfd/ti,usbhs-tll.yaml | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml

diff --git a/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt b/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
deleted file mode 100644
index c58d70437fce..000000000000
--- a/Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-OMAP HS USB Host TLL (Transceiver-Less Interface)
-
-Required properties:
-
-- compatible : should be "ti,usbhs-tll"
-- reg : should contain one register range i.e. start and length
-- interrupts : should contain the TLL module's interrupt
-- ti,hwmod : must contain "usb_tll_hs"
-
-Optional properties:
-
-- clocks: a list of phandles and clock-specifier pairs, one for each entry in
-  clock-names.
-
-- clock-names: should include:
-  * "usb_tll_hs_usb_ch0_clk" - USB TLL channel 0 clock
-  * "usb_tll_hs_usb_ch1_clk" - USB TLL channel 1 clock
-  * "usb_tll_hs_usb_ch2_clk" - USB TLL channel 2 clock
-
-Example:
-
-	usbhstll: usbhstll@4a062000 {
-		compatible = "ti,usbhs-tll";
-		reg = <0x4a062000 0x1000>;
-		interrupts = <78>;
-		ti,hwmods = "usb_tll_hs";
-	  };
diff --git a/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml b/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
new file mode 100644
index 000000000000..78f7a109392c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,usbhs-tll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP HS USB Host TLL (Transceiver-Less Interface)
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    const: ti,usbhs-tll
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    description: Name of the hwmod associated with the USB TLL.
+    $ref: /schemas/types.yaml#/definitions/string
+    const: usb_tll_hs
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+    description: A list of phandles and clock-specifier pairs.
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: usb_tll_hs_usb_ch0_clk
+      - const: usb_tll_hs_usb_ch1_clk
+      - const: usb_tll_hs_usb_ch2_clk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-tll@4a062000 {
+        compatible = "ti,usbhs-tll";
+        reg = <0x4a062000 0x1000>;
+        interrupts = <78>;
+        ti,hwmods = "usb_tll_hs";
+    };
-- 
2.43.0

