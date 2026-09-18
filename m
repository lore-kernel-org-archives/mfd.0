Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2179F51A15B
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750368; cv=none; b=PRznAkGB9RDKYtjAwiSVgOvTvnsYe4rCyevekkAB6+TOiITrCwvw6BN8XcUgawW7fi5G+24thH9dnb16g6dnXtNhur/NlPaMkwqZUeooEK3LtCvyFlSpplOIIPSoD01H5TgnLX5i9gyrfE7LdWf8QtFcSrXPP6FH+JzhsdtCFUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750368; c=relaxed/simple;
	bh=QIb3/8jhfeL45bNJQcRZnEB0rmAEFremYpY1OyHjPAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVoDpIVxuaQn/+0hDZD2SVCPLbAlw6DquM4isTr2UmiSVZ1h/TVPQYz6DSreSgG2YrI0Tis8DEBvseofSbKbxNPiHXHdszyEIHP6QSeu4wHBjr7xwCY5CAImj0DPz9O0kUlygFS5cjmnW3K9vHnZREM1Om4K9GMQl/QT8662wH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=IBSBsiYK; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="IBSBsiYK"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109fafd7so82136185a.2
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789750361; x=1790355161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYKMeLZs9/LbC7ro7TTSjk8sEK++X3mMETojD1ueTmI=;
        b=IBSBsiYKznQz+kKDEClcKlG6XNu6ezz7RpXZnzuU37frWCnBlW2+3+5d1hDboTrjQ2
         DjVmI2uQOlATjNPCfDruFHhhaljDwm0g4ZiSDIEmRpCDH9C9cuHDnqYJi2DnndSnl+3m
         YvzR3GwMcgqVWqchGQKNCJh4a/WAhkAb6+0OcRp4Y27tD11CgVBNM9ai4Syb0FlcW+JC
         BASKQMsxagwuu6F+bwM+YCVFIsoCw0K/jJoNYHb4L0kKBrTjabWoZ1zK8YZBZTn8gjJe
         hDrWyJ/GdQXkjNTLnbT1Q/n9mAJWxu7/gIpg2DG/sPaLcNeQxbPb0TuQwMFP9HOYBkxq
         YbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750361; x=1790355161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYKMeLZs9/LbC7ro7TTSjk8sEK++X3mMETojD1ueTmI=;
        b=glX/SOP0zVO4EtzdORMbRsE/mgl8l4Hh+M9R06jjmEnrviZSzXhj307KU9Jwl5JVmA
         PNm5dYcTHEH9YCyRaIF07wfD2fsDp7fUYrttkAS0G6Bszo5quNkTZp8NUpLcmrdYYvhx
         UyfVHoInXj+abA6khNaO7m4QEYUbzfCC0uNDnX78wWMJ1qwYvOfZX8hT5SJlcx3tA6WP
         xUZtlwnIcN44IU6svwrKVmIDlfVxZkNsAlN0/OmM9Qzez0ebBjlTvATNEVkpxIjHO0cg
         OwSinTa2O8OVhUSAUSn+G/Q1tHZ45KJai+YZFnKVLKBSkjg5w0hhLl7FGsk0LvdF7unK
         7pgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxQxJ+pN2AA3tuUXvFrTwWUD7qP8Ltj6HrnKtS05ZXy9a9BSS4WRJUrJjco1kJadP4Upg=@lists.linux.dev
X-Gm-Message-State: AFuF++klMO1I1UIhxqX82Wn+AHglhCqSGQ/SSYnpv9USOHd783krfHAN
	4R+uL/ayyHDyHaUX6qeiIN/iqKM56D0UKxAKuY1wYFEoHZ4eolTnCGg3Z/qOejFGCzI=
X-Gm-Gg: AYBFou3wMYViUuMRBJpxMX3Gbk1EKVApZo+LeNpNGmwK71lPe2UYPgkyhPib+9kg3aK
	IJpv4I0NzjjiC76GJ1CFhUiN5fzCj/BsJVRRWfcACoQEfRt9ENIifzf+kJvfkkZ6ia3oDdnqMa/
	yrQdTE2qYb/oMKH0vju7mhlBFYE2uOMMjwMyT0WizDSCXUnfbh0kfZxT21TqkADfdPERo5gYJ/G
	/hqEDjK0LtbytbX/QomlAfMbBWHsyGjFZ+7TMH7DvC8z7vFGUzmV4ET/BijnhE7NYvKQ7ESCGf7
	Z5sIj+WW556iu/5Z7yQAfIsbIyTQJAJssmJnHzwU4VhzwZM/eVmXU4t0vGAi8Pe3jFuywSJw9Eh
	sblO18zoXORPz21AOMe0/9Djt1uGvNm+cxPKSZbCNjABc+0Ekabw8d4u9U3K8qw8tSraApwKaXK
	cSH507sTFIde85hBZHwHe07+8RrMqcFgWVPlf0e51SRM2SeKPeem+Rxezl/VxkLfKpBs97naOew
	7M/
X-Received: by 2002:a05:620a:8399:b0:93b:d8bc:a864 with SMTP id af79cd13be357-93bdc8df17fmr414369385a.65.1789750361027;
        Fri, 18 Sep 2026 09:52:41 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0762dsm183582785a.39.2026.09.18.09.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:52:40 -0700 (PDT)
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
Subject: [PATCH 2/4] dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
Date: Fri, 18 Sep 2026 11:52:31 -0500
Message-ID: <20260918165234.687224-3-elder@riscstar.com>
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

Define the binding for the clock controller functionality present in
the Toshiba TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/clock/toshiba,tc9564-clock.yaml  | 64 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 include/dt-bindings/clock/toshiba,tc9564.h    | 54 ++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
new file mode 100644
index 0000000000000..cc7019bd240e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 Clock and Reset Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch
+  includes an embedded PCIe endpoint that provides access to various
+  SoC peripherals (including a clock/reset controller) via its BARs.
+
+  The SoC is represented using a devicetree PCI endpoint bus, so the
+  clock controller is bound to its driver using a platform driver
+  compatible string.  All of the clocks are simple gate clocks.
+
+  A total of 21 clocks are implemented, though two of these are not
+  controllable.  Access to the clock controller relies on PCIe being
+  functional, so the PCIe clock is assumed to be always on.  Similarly,
+  the PCIe controller relies on I2C, so the I2C clock is also assumed
+  to be always on.
+
+  In addition, 13 resets are implemented.  Similar to clocks, the PCIe
+  and I2C resets are assumed to be deasserted and cannot be controlled.
+
+  Clock and reset ids are defined in <dt-bindings/clock/toshiba,tc9564.h>.
+
+properties:
+  compatible:
+    const: toshiba,tc9564-clock
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/toshiba,tc9564.h>
+
+    clock@1004 {
+        compatible = "toshiba,tc9564-clock";
+        reg = <0x1004 0x20>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b2d3257b8f892..66d0e7e65adcb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27670,6 +27670,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 CLOCK DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
+F:	include/dt-bindings/clock/toshiba,tc9564.h
+
 TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
new file mode 100644
index 0000000000000..75732fddd3025
--- /dev/null
+++ b/include/dt-bindings/clock/toshiba,tc9564.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __ClOCK_TOSHIBA_TC9564_H__
+#define __ClOCK_TOSHIBA_TC9564_H__
+
+/* Clock IDs */
+
+#define CLOCK_MCU		0
+#define CLOCK_INTC		1
+/* #define CLOCK_PCIE		2 */
+/* #define CLOCK_I2C		3 */
+#define CLOCK_SRAM		4
+#define CLOCK_UART		5
+#define CLOCK_MSIGEN		6
+#define CLOCK_PLL		7
+#define CLOCK_SGMII		8
+#define CLOCK_REFCLKO		9
+
+#define CLOCK_MAC0_TX		10
+#define CLOCK_MAC0_RX		11
+#define CLOCK_MAC0_125M		12
+#define CLOCK_MAC0_312_5M	13
+#define CLOCK_MAC0_ALL		14
+
+#define CLOCK_MAC1_TX		15
+#define CLOCK_MAC1_RX		16
+#define CLOCK_MAC1_RMII		17
+#define CLOCK_MAC1_125M		18
+#define CLOCK_MAC1_312_5M	19
+#define CLOCK_MAC1_ALL		20
+
+/* Reset IDs */
+
+#define RESET_MCU		0
+#define RESET_MCU1		1
+#define RESET_MSIGEN		2
+#define RESET_INTC		3
+#define RESET_UART		4
+/* #define RESET_I2C		5 */
+/* #define RESET_PCIE		6 */
+
+#define RESET_MAC0_MAC		7
+#define RESET_MAC0_PMA		8
+#define RESET_MAC0_XPCS		9
+
+#define RESET_MAC1_MAC		10
+#define RESET_MAC1_PMA		11
+#define RESET_MAC1_XPCS		12
+
+#endif /* __ClOCK_TOSHIBA_TC9564_H__*/
-- 
2.53.0

