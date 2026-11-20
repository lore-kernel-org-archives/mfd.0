Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202475;
	b=tY85IW5idkFonlOM+RtJ9M1eorWRcO1gfJMRMY7sUO+8UcoGJKgwcH/OkPB1QZQtwnGI
	 rib3WXGY4qOTGCyEjPmFx/oInNFD8FZEHF08mEggJS+LIyc6pP2ndqk8Tmvcwsm3IxT0g
	 p5DpwjEk1xLznaVhl7Zhx4rkhLT5TkLL8rSKyzXMN8CaXC6MfaDNOBTd6B5nAlofG4vEr
	 s+kaUHPsSIGMt9d++p4PQMvAsTj/8G5RaEU8nD1/yMB7FZGa7NVyKWehffn2AZYcHu2vi
	 GcxP7p884jV8yS7uhKLObsMbJSsd6rx6pBp103YyWB1OIRohxJg+dqr8Usr7Y+aUowQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7WdPVPrqEAVCZ0oTAu8C9RoFpPGs1RbxvC68iYCtVl8=;
	b=EEZzykk3pHTcKyox/+YITVmPoDrMbSkLuEy2oQuCp6GKrkNcfjv45GMDLolwHNAR67jv
	 xdWEmteQH3C+PX5SxG+O3B9byaBYUjVKBk80wuVq8ES1xMi6PbGvrVjrtgqwMP8ultwUh
	 6K+GRlHDgwZHDsdBiqFjGh2WFjuYm+IYi6F30siK/t2k0mJkfOYeMEL3kQmpHHTDZvihA
	 UVDGCqW0EDdFHD3Fa9IIx01SrwdFEh3jrkQuZmGIUbNatnkqbTgGVIXVoHB6HyHKeLE9k
	 A0cCfWz8XMDOTQPs3muRVXNj1GpCicmoOuAM4bUwL09UdctJqhAENpIxUuCiMHfHXMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KHcj/5XR";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCF1606A6F1
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 19:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDCF1606A6F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KHcj/5XR
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so10322245e9.3
        for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 11:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202471; x=1795807271; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WdPVPrqEAVCZ0oTAu8C9RoFpPGs1RbxvC68iYCtVl8=;
        b=KHcj/5XRKdktuK7q2JXm5DBJM3VCgXh3oI6nJPWlnXkjj0oECk4FDXSzoGzcqabjxk
         oYEAZFTw7Lte04Bsg+7X5JBxkXyILEQk/55y8w2YMBetk7XwaR67l3sL1kMI72fQdzpS
         V3t5I3QwbZt9hIbRj/d9C7kUkeb9gOiHVTCrNmur8LPkjG53Q+u5YhDAP/cVsKVsUQKY
         pazQxtwBSbY5ohVy1zdSpnioN9iNd0ar6593uhmdh01TLQkr7G7s1bTYV0+5XCCH5STL
         AjMYiduUCntBW/hH6Qlx3o4CE/GmhU8XkdfgIZvESYhgtxTwzWB/vHvRsFK+Yh5N1FXW
         k5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202471; x=1795807271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WdPVPrqEAVCZ0oTAu8C9RoFpPGs1RbxvC68iYCtVl8=;
        b=xVp2npkxV8D8Q5JewvGUO6WfuKPKAyLxiKESvnkkesKNpDpxmzHDjK9Wv/jI44I/8p
         s+6oqzVmW6dEN3kjmeKa4HYDAOF8TiM6gUv5BoRigL+aPHe9xh5dUnZdNWIdX0a7dRjs
         LwuNrFcr65besAbJdqkPLelsUoO/2N7+SWETzme1xBqgJyAUTHUI+JiETu5XWtdaJc2r
         JYla0RVZHG83u+JzP5wPgOWzZZFhiOma/hepoQPc1e2SSbo8b+yfuRDFIic+01e/scyK
         r8svRModVZN/YnUNEtAduEu0tAfkHpU+uUXefckK7Ixyz+xZ3zEKghEOig6WR2/Kdo7d
         jZ8g==
X-Forwarded-Encrypted: i=1; AL+hErFqzweMYNd4sOzAhEs0lbct37d2vg/iV3T7Oos3QC6bkLOt3gPOY+fDc/3pSIS1E2nnn38=@lists.linux.dev
X-Gm-Message-State: APuU4Z8S6ZugSUYUWRxfUrzWdoMlS/yXSyv3NnI5BpAuLmXLGcg3MLd9
	+GYxZ2dSZcAH5Ro3sm1/sfn74Ds3wit09Xd+BZOBWt2EtxRCNVoK6XZh
X-Gm-Gg: AYBFou3zbh9NmZM5ihAw+aJEUisjmasTw+0K3Pfcx7x6OxpxxkQQFYcPY1J4u1p5Q/j
	sVqRKovc1b4L3UlnKVA8zF6Ub0T26q50JRuBQtsCeA/NSb85dmGWhWs/JA5fVQ7OxINXcEMyMTr
	l6s2bv2uaxKXeLMCjWtVlZrnh01LlyNq49puUMoYg34pg03cr3SroBPj0D+Gf7lSk9jQXG9+fsq
	Q0IrqrG5CwTcNPdOOGyZP/bfb67SMaHOZohUrSL2jjjJLQ/BAQe3XRjBGui1b3MaccIXg2sNQ5D
	xK6wmXv0fbarcH5pFqJghgulYIjGgVw4JctUQmHF4GtPSvWLJowWZnviBeHE6mp7ZJVHiCoM8UW
	Ca3bb+RKcqaZA6EPSBX4jAAuTNLClPT63+vsxtV5F+W7m//iPqrqJuic1F8MpVqfJt2frxDY4na
	woNlEWfHOv2goeXcgUC7+wMF9moS9nzjAwzFKO497lrF15ItxaEY98ruIG0qrsmPp+tSa4kPCb0
	3znbaq8dkHScGMoWT+yxDMAvwRRxM+pPNF9rceSpUL160YtY8Si8+qwwmtmEIe1LSEo4Y7nkddJ
	cS8YI0x4KwtdYXBZMUwwF6+utNTnrFD5bPsTI7D3hKUNmC00QEyn6cyQj1Go8w==
X-Received: by 2002:a05:600c:19d4:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4bb8880ac6amr96586425e9.10.1795202471009;
        Fri, 20 Nov 2026 11:21:11 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:10 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:50 +0300
Subject: [PATCH 1/6] dt-bindings: soc: zte: Document zx297520v3 socsys
 controller
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-1-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7623;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=NdfxG+rjqtXpuMXB6FHKcGgU0zKZ4pW041ggmfB9o7E=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2WVW5e1KPkQL1gQ9ewMRyMEsKrrUGaOVV+J
 E4z6Uz/UYqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKVqg//Uy+x4EEaYrDpooZbWoCBB9I052DMyfA
 RTFbDzHKeZGrNXnYhcdCJs0VTL8EriH9BfRET0/SkxeqQ5Q13T1QGDXKNUWrYdhYjCHELjNeatj
 OTFmFwSGcDU4R9PA5hE31PSckAXrDzzJ5HJP7n+BALE0RZYmQiNmIOs6XLs4P5cMdKZ9skDmb6j
 U5RrAWXt6MMRaWndbLC2e4twXHhCVoaNshzHwyxR/rqfqz/+1tC1xiQa18vO7HyGvL4tD+xS9HU
 8o9HXruAjlHF2TgnOSFyh7KL2cwFv8Dh94MJnf0S+4coGZ0cbJx4BE3TbyvtGiFgMJEOFjqFq/m
 ysCz5R346kum1NQMYBNu1JRWNAM9FKWG3pLfgPpTS2pFSxCBLVNgtEhUJ+/Shoy2ndZDniNEQ/a
 ddlR2tvnj39IGnnlEooP3GD0Stsbz6mnHVa2RXCRpTYLS/Rqr9zoiPrSE9X9F1M0BhCcSYwb1Hj
 M/wLT1lSEZ/oc+0jPXqoGFDYK8oUjjj3vXgfZhKz/8IPcTvdyNtm3bgy+uaM/DYIDkMUC5Lnwip
 5e5rnXm1A8RU0Ijmc/2MZt4SzscvNE85ggrV6Nbrx4x2G1ilD3/3vbdwRbtPLQ46JTl0khwWfn1
 ZsWy/8B+CLoVnYIvWyqLAWgMXQnhOKJ3SYnzmllKjrnoTwMsOLVI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The best way to sum up this controller is probably "misc". ZTE probably
put everything they didn't bother to put in its own mmio area here.
Documentation in ZTE's sources is very sparse and even the blobs only
touch a handful of registers.

The controller contains power controls, resets, DMA multiplexing,
auxiliary USB phy controls, i2s controls, the proprietary DSP boot
address and many others.

For power controls I could confirm that the USB/HSIC and a GSM-related
controls work. There are 5 bits mentioned in ZTE's kernel though and
there is a second register that is used in a very similar fashion by the
LTE blob.

For the Ethernet PHY reset register there are 5 settable bits,
but only one of them produces an understood effect. I am using
reset-cells=1 because it is likely some of the other bits have an actual
meaning.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

ZTE uses the name "SOC_SYS" in their downstream kernel. I am not
particularly thrilled by that name, but couldn't come up with a better
one yet. I am open to suggestions

I do not want to commit to exposing the GSM related bits as power
domains just yet, so no handle for them is defined in this binding. They
are inside the RST/ISO/PWR registers just like their USB counterpart,
but the PWR bit does nothing and the client driver will have to assert
and deassert the reset to wake up the hardware. This is easier to do
with a reset controller than a power domain. The ISO bit kinda works
though, so I can't just pretend they are standalone resets.

The hardware behind the GSM bits has a self-arming watchdog. After
2.5ms it puts itself into a broken state and can only be recovered by
asserting and deasserting the reset in socsys. Like almost everything on
this board it is enabled on boot, so the client driver needs to assert
and deassert the reset before touching it.

How much documentation is appropriate in the binding .yaml? I want to
document the identified registers *somewhere*, and since the yaml lives
in Documentation/ I put it there. I do understand though if the Linux
kernel doesn't want to be a backup SoC datasheet.
---
 .../bindings/soc/zte/zte,zx297520v3-socsys.yaml    | 100 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 include/dt-bindings/power/zte,zx297520v3-socsys.h  |  11 +++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |   2 +
 4 files changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-socsys.yaml b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-socsys.yaml
new file mode 100644
index 000000000000..094409c72333
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-socsys.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/zte/zte,zx297520v3-socsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC miscellaneous system controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This controller contains registers controlling numerous components of the
+  zx297520v3 board. It is poorly documented by sources available from ZTE.
+  Information about it has mostly been deduced by experimental testing.
+
+  The device contains power controls for USB and at least parts of the GSM/LTE
+  stack, a reset control for the Ethernet PHY, DMA multiplexing, I2S controls
+  and additional (beyond power) USB PHY and controller flags. To round it out it
+  also contains a flag to bring up the SoC's Cortex A53 CPU in arm64 instead of
+  arm32 mode.
+
+  The "include/dt-bindings/reset/zte,zx297520v3-reset.h" header contains reset
+  defines for this device. "dt-bindings/power/zte,zx297520v3-socsys.h" contains
+  the power domain defines.
+
+  The following registers are mentioned in ZTE's kernel and U-Boot code dumps:
+  0x0:
+    Bit 23: Boot ROM and sram2 remap
+  0x20:
+    Bit 13: A USB control "USB PHY COMMONONN", but without noticeable effect
+  0x40:
+    A mailbox system to read DDR mode registers
+  0x60:
+    I2S configuration
+  0x10c, 0x110, 0x114:
+    Power domain controls: RST (Reset), ISO (Bus isolation) and POWERON. ZTE
+    names devices "RAM", "DSP", "EDCP", "USB" and "HSIC".
+  0x120:
+    DMA channel multiplexing
+  0x150:
+    Ethernet PHY reset
+
+  The following registers are used in ZTE's power management and LTE blobs:
+  0x14:
+    Likely the ZSP rproc entrypoint
+  0x180, 0x184, 0x188:
+    Likely more power domain controls for LTE hardware
+
+  The following have been deduced by testing:
+  0x20:
+    USB PHY and DWC2 controller controls:
+      Bit 0: Force PHY into USB 1 mode
+      Bit 1: Unknown
+      Bit 2: DWC2 controller endianness
+      Bit 3: DWC2 DMA endianness
+      Bits 7:4: PHY clock adjustments
+      Bits 9:8: PHY electrical configuration. Setting them both to 1 allows
+                operating in host mode.
+  0x24:
+    More USB controls of unknown nature
+  0x2c:
+    HSIC controls mirroring the USB controls in 0x20
+  0xbc:
+    A53 mode controls. Setting bit 0 enables arm64 mode, others have no observable effect
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-socsys
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#power-domain-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/zte,zx297520v3-socsys.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    syscon@140000 {
+        compatible = "zte,zx297520v3-socsys", "syscon";
+        reg = <0x00140000 0x400>;
+        #power-domain-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9b6a2da28aa5..ab8797b8d0a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4033,6 +4033,7 @@ F:	Documentation/devicetree/bindings/arm/zte.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
+F:	Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-socsys.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
diff --git a/include/dt-bindings/power/zte,zx297520v3-socsys.h b/include/dt-bindings/power/zte,zx297520v3-socsys.h
new file mode 100644
index 000000000000..fb54e5deea2a
--- /dev/null
+++ b/include/dt-bindings/power/zte,zx297520v3-socsys.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger
+ */
+
+#ifndef __DT_BINDINGS_POWER_ZTE_ZX297520V3_SOCSYS_H
+#define __DT_BINDINGS_POWER_ZTE_ZX297520V3_SOCSYS_H
+
+#define ZX297520V3_PD_USB	0
+
+#endif /* __DT_BINDINGS_POWER_ZTE_ZX297520V3_SOCSYS_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index b21d5901a7b9..7146e479695a 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -59,4 +59,6 @@
 #define ZX297520V3_TIMER_L11_RESET		16
 #define ZX297520V3_TDM_RESET			17
 
+#define ZX297520V3_ETH_PHY_RESET		0
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.56.1

