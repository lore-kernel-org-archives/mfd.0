Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE2B51A14A
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750367; cv=none; b=ZX1hM7mL+CkxM3kB964OCrX1cKlSn3VVZRYStwb2wh82zSDuH602a21O0ga/oLSIzLbyWzbceocXyzxwqqEUnlyGLffx5O+ztPFLyFgdtNbTF5D30iS2P87V8kQwHc6I6sopmAQrteVBaxu8um2oe1pk130CDHqKejt3nW6d6wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750367; c=relaxed/simple;
	bh=ut9bu0ogvOe3LaZe7HaU4YRdS8uXZFfbEqCnduNcrb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1jrR4acc8U+YQ4iatq9KdBW7JR6iYtiQpNnVoiOU2rzPu/Xt8d1Kc8Y1WV+y048M5P7pAtTrYwgz5PYPIgHHttT62NQuRIPFpjqKtARFxM7OtCh+nLmL62LEeXeU3e8p2LNB/OBqWct0YZG2I5J4WL2q6t57QxPzE3F/SIMozw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Wi2vPy84; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Wi2vPy84"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadea0so63505485a.1
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789750359; x=1790355159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oe9FkoIahCgEzPBuPDqtCAL2bGeR9kc9QC4Nw24cDKs=;
        b=Wi2vPy84IZVx1ESTL9STEWkwI/IEqarMoHLXKM1o1wLalje/0ujQiw+6CRCqq8U3Qm
         9C0qPLYx5ehbopQ1Ts5QCsq2Uc5F8QCiwZQv1i1LUAARo6RMA9W4CRP/fio9LTSXbiWe
         ESLe1Xk5UezbqVdh4h/i9upr0loNgpgr+PDXJLTQqUZvmReDzSIkRHhMovfoel7n4VXr
         HcQOK5g3auVCU/K3j9GSq+o0gOzT+FySrAiaBMuSDPDgsPijifEPP1lUSnc5u718mSIl
         TWkeEB8inbQN+7bRv0kwBBKuc3H5uZEoRs71lGmga8V4X3nvwo1sIZ+TCTJkAg8HCS4U
         wcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750359; x=1790355159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oe9FkoIahCgEzPBuPDqtCAL2bGeR9kc9QC4Nw24cDKs=;
        b=1VL/pScUrOIw/BHYe++IlFuzG3KPN8cofACuXUBwxGVuhwgtegWGMNt2NJ2uZJy9T4
         e5xvXba8HNeQOuTJhXj1ivBhKb1PKmGY/1yplyx9bEKVLfOZMQ6pItCBFYhKQCRCB+p8
         LHvujf9Q9GgEx2dSakAGnctMBP75jC5+igZzaSWpkJj764VrSVpw2X3ESKYL4/6Udy+X
         X4w3lrZEgALba941zpn2GO9sE4kd1moB0Y+qaS4Y7e6OH2j3YOpRS6ZCzcGleYPCmsYQ
         JxxLpJKw1Z6g5E69WxjJGebE6w5C9onsftSk5z4O+s0nf+nSaIyYVGvHwXiIQ1WuxMV9
         voGg==
X-Forwarded-Encrypted: i=1; AKwUvBxqzlKP7+IcjcN/35FpX7c09tbOd7kLeo1wnx2pvApsXgr3HQsWaO0W9sl7h4jdsmAnqk0=@lists.linux.dev
X-Gm-Message-State: AFuF++nmDlT5bCpu7cJXbG+c+KMy3m77YgItzQhrWoJogwcEPcNh38zL
	aMOz54JMNxpok8cxqjiagjpzgpLOeIGUsaUicHs8iyL8uAP8dKISs9K9fuHFKsdL7lQ=
X-Gm-Gg: AYBFou22lQt96FI1Z4KnvFBcWuHSBia/Q7qPxRvnmumlKFfrOi2WPL0rG9evKJWpY/Q
	9MIP4MVO6Bj31NVOGPjMS5KVASQUSl6yVYiKJKfdPL1NDQRdn7oslpu3EBJPMf/DSB9HbOpeTPK
	sJImqUcvjtbHdtdqpxykyamb6KfeWJ/dbtcngxbpe8prFXXt5VXR0v29HwFlOjtA6Kb4H3VXOdE
	4sw4mbFFWjngqRNnDhHzK8Om8BdygnCxzZs7v8/fqiGHLt/JfryNL0d378bqplnngiKEQEUC9m3
	l3gPNiFrnESq+5Cs6SFBCh6AAYJ3tPKCz23VHGgPvwJw26y4bN3xHeQzjBlHLC4DwyoHCsfQ1AP
	/oxKa3vhMh50+xgf/0C41DDyx6M+CDJJCTMSg7TKsCfKeJ+Pg06SCXQYiYE8Y9L4ox7VOMyQ4rr
	AGubg6petotltHGxaXrZ52ijTdYAcXdTw0v5BO3LBB82ne8VFNmKPOFhVtsslCfI9dJYZxHQyvS
	ZM=
X-Received: by 2002:a05:620a:4103:b0:93b:d7a2:dd39 with SMTP id af79cd13be357-93bdca3fb9cmr469299485a.73.1789750359512;
        Fri, 18 Sep 2026 09:52:39 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0762dsm183582785a.39.2026.09.18.09.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:52:39 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	p.zabel@pengutronix.de
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
Date: Fri, 18 Sep 2026 11:52:30 -0500
Message-ID: <20260918165234.687224-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918165234.687224-1-elder@riscstar.com>
References: <20260918165234.687224-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for a system controller used in the Toshiba
TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/mfd/toshiba,tc9564.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml

diff --git a/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
new file mode 100644
index 0000000000000..32e73a727c82a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/toshiba,tc9564.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 System Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch includes
+  an embedded PCIe endpoint on one of its downstream ports that provides
+  access to various SoC peripherals (including a clock and reset controller)
+  via one of its BARs.  A system controller provides managed access to the
+  first two pages of this memory region to ensure accesses made by these
+  peripherals produce well-defined results.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,tc9564-config
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    syscon@0 {
+        compatible = "toshiba,tc9564-config",
+                     "syscon",
+                     "simple-mfd";
+        reg = <0x0 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cf846853fdc79..b2d3257b8f892 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27674,6 +27674,7 @@ TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
 F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 F:	drivers/misc/tc9564-pci.c
 
-- 
2.53.0

