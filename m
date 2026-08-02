Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357EC1FC8
	for <mfd@lists.linux.dev>; Sun,  2 Aug 2026 20:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702852; cv=none; b=MyJ+4qAew4MJheCYku65gsqBEnX91AwjZ81E/VqlIuLI366Oa4bksADDbT5vw4t6o8KDHXgWmZRvhhBzZMrY+anlpioDzieK69p8clbfmYfHs1VPnzKKjTizrCLFVvXYM9qcVlFUrlk3FodKvJ1tI6cSviWHlA9sJlXCLxY0D6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702852; c=relaxed/simple;
	bh=YxQqoI6CL9jVmvvR5b+MmbVYGGxzOOfvxDANYulehzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlZm125u0DPlrfE089oJJZrh/L3O3JfnsZPv6M2vom21h9PvL4afEtc3DHaqezUHqpz1cv46KvEEY70D9QmFr5gHQP1pJQ734jGA3sQDeaovKFcgmNC/U4gnJ532RqdKa9N9ucaUWV5PX+BCJEpo4503QL3XfcclmElrjmS2ngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/ZZ4zWq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/ZZ4zWq"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so12742285e9.2
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702848; x=1786307648; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFb3ikGwdzChQBttTqJkEcd2RHk/IiKtG2e0llG6pg8=;
        b=i/ZZ4zWqLmz9ZgVv9LVVhGwHBc4eJpKLGXN2scL/XwuGDKUYfcyds6uxXyECyx/yp8
         p2PpPONRV7xXCaUioJBA8OHtjIlpJp7o43pao5hFAAAPxvO48s6FklKKAj499jCDt8fu
         5nnMYUBeYNSU/NoQS8uPQHERMbb1SSII8isE0oOL6aoBBBU6yunsCy7LSxEFygavSWlQ
         0lQI/tqjW7zF6Dd4Bx8R0LkdzYamVFXC2cd3QfjQAd03B2vedCwnFWRkvK+8YaoAc0ta
         65YToJek0bSp5/5VjV9kwRXte8NIqx5pOBmCsBERZx25bFT34RtnDwpEsFO6DiHb5GUa
         /s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702848; x=1786307648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFb3ikGwdzChQBttTqJkEcd2RHk/IiKtG2e0llG6pg8=;
        b=Vy1MiK4jEWg3OLbycLOtBGmC38ycy0xSjblifv8CsbjzzmEnxSDYGyOfmf7lN/R3JZ
         b1Ogowb7TV6sVELqLQXUi/4aFSenScnJr9ieqqke7gc/6V7wHTH0OYvCqrCZZEIdAVPU
         Ul2zukH29TWolF8Kw4yCjaguJk+OqxZjrbMLtO81+DM+WVW5TrQs1cR8u9S/a7rqY6QZ
         Bm8dE7WdWrRY2gbU5lrpKSZq+ws+kXaAL4G251ByxFNk2lIFtzvWfWOXEZy2bursSuHZ
         PA5t75FbrEBQFJKscljFmgqYZuvjEqJPP31RtgwaPXezcrFlvIhv+Eis25NehH9Td+GO
         UHkA==
X-Forwarded-Encrypted: i=1; AHgh+RrX9gFX0ibGZi5GGCRIWVOrEoq6caxmKxeG67EOVr/uINi64mUhsamH4NbvK21HK8y7m8k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb3cee8kSfdTv1457XYa2ceOW3TwddV38ZieHM4ww2S6Ij9pMg
	mTXAlNS2+rUmUrzACm29yeVDQz+pXavlN2HTb/zl3XbrIQa1CoKvZgDklCAtQMMf6nU=
X-Gm-Gg: AR+sD133cZiRF4MVXXSUjGTR0gQXFgVqRzjO/taNpzevETwNltuxjKn3AGXwGdWGvmj
	hv59L3kywDddfvPl6cIdKfL8lYwficmJqNxyOiE6XDOhynsQn1AFmvbvTYBfluaG5D3HxYYq7du
	DklDmev+ZdGkbKYRXRPb0Nb6MkSo3CRTZSfSauHRykYPoTbeov/DzUPd5PyZrlHH7/kXv15C4WZ
	UQI602pV+iXjEHD6ZLytaY7V7RzXeJAJL7EmLxR3zE02HkNH7pfKEFZduMjNI/D0YtGw+ajRIB4
	wpFopR1JtN7yha5clNLZq7CNGEhZlYeyzLXJhEOeC7IIwRgfKu2IAXLxNMEunt+ywspTZDA/ztg
	FSipVyBJrNJvxzmgJZYRI56Opzle6+afzCxh3s1piCDCJkQVuePKwbD/hBJFlLkyU2BFvnhgFF9
	IDNE8/gTXIu6HkOtJGLva5THXeWnYx0pPs4VSOlaSq9YqNCeioeRkBG2NIWXzlU/3QUREGSdhv
X-Received: by 2002:a05:600c:c113:b0:495:4811:d71c with SMTP id 5b1f17b1804b1-4980c674e51mr128211295e9.13.1785702848361;
        Sun, 02 Aug 2026 13:34:08 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:33 +0300
Subject: [PATCH v9 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-1-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=15112;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=YxQqoI6CL9jVmvvR5b+MmbVYGGxzOOfvxDANYulehzI=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6myWW7xJKwXRJHpy0rgbEONZAKFifcLOaGtU
 zRJFCY3fHWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKiPxAAs5ekc7r2AEA2dpJ6Abfa1L+OmSWOeFd
 lH0TpwMPPevo5DilXhjMKnztX2A06tQc6EyGFYrQMNIkI9Yl+oH85FkFaMPcYF8YA5ay5Uynx56
 9v4iUWnvPMtRL/mqmLVB463EB+7qBx900++rdI/pFjEX/Qhac3Qb3ZkJfJTYuOr985ONVmggJwl
 h+3ydcILZAfl2mDFLLYuGlsIdFAsAqqYW1bJKR2ndqnGtfd1AyBUEWzTjeqXaBO4dhiSO5xOqtu
 tMAtAaaatOpl37swFwoes3LhnVyiLjefQMtS/1kq20ouAfRiUichXvwmzDIzsi4kdre0BEoJeuE
 MDEvUvuH65W1qwwsbcm2aZsXZUQ52jYQRX/IzK/y+izxTj3fR1o+QgqV3diVQBhAnI7Ilwcme2w
 NgqDOqG2ir5ltM71nArr/RHeu9rFPixykXKMpmO9NnxUleVvm9Tr+t6RWkStWg9KHwjyFSaxekX
 bnIWvVe0C/8IXWz4TfXY+2547xgjg/LjA4a6+QjInMZGohjPXVQGkPbyQ1tYIgRoQdy5NLJhUMz
 c/186HOC0F2vt0rWrgetQ/fq8X9fCjiXVIME3TUBIIpiM41kPP8tJCm1mIlsJWur5SwAu9o2svG
 9jqGycghjaguImRGtSFbu09z3Su8XhL/ndLQFoG9Mic4IqvqBiL0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

These SoCs have 3 clock and reset controllers: Top, Matrix and LSP.
Clocks go from oscillator -> top -> matrix -> LSP, with a register in
top controlling most clocks that get passed to matrix and a register in
matrix controlling all the clocks that get passed to LSP.

Generally every device has two clocks (one work clock, and one that
connects it to the bus, I call it PCLK), two reset bits (I don't know
what the difference is - sometimes asserting one is enough to reset the
device, sometimes both need to be asserted). PCLK and WCLK are
controlled by individual gates. Some devices have a mux and/or a
divider for their work clock. Some devices, like the GPIO controller,
only have reset bits and no clocks.

The top clock controller is fed by a 26 MHz external oscillator and has 4
PLLs to generate other clock rates. ZTE's kernel mostly relies on the
boot ROM to set up PLLs, but one LTE-related PLL is not configured
on some boards. Therefore my driver contains code to program PLLs. It
produces identical settings as the boot ROM for the pre-programmed
frequencies.

Not all clocks will have an explicit user in the end. I am defining a
lot of them simply to shut them off. The boot loader sets up a few of
the proprietary timers, which will send regular IRQs (although the
kernel of course doesn't need to listen to them). I don't plan to add a
driver for the proprietary timer as I see no use for them - the ARM arch
timer works just fine. I will add a driver for the very similar
proprietary watchdog though.

The clock list in this patch is pretty complete but not exhaustive.
There are other bits that are enabled, but I couldn't deduce what they
are controlling by trial and error. Some of them seem to do nothing.
Others cause an instant hang of the board when disabled. It is quite
likely that a handful more clocks will be added in the future, but not a
large number.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes v8->v9:
*) "unevaluatedProperties: false" for the syscon child node (Krzysztof)
*) "additionalProperties: false" for the binding itself (Krzysztof)
*) Remove USB PHY resets, but USB controller resets remain unchanged
(Krzysztof)
*) Rename syscon reboot node to "reboot". While both "reboot" and
"syscon-reboot" are common in actual device trees, syscon-reboot.yaml's
own example uses "reboot". DT's Generic Names Recommendation
contains neither (Sashiko, patch 12)

Changes v7->v8 (all Krzysztof):
*) Fold the PHY into the top-level node
*) Start clock indices at 0
*) Rename the phy include file to zte,zx297520v3-topcrm.h.

And a non-change despite/because of new discoveries: USB has more PHY
and DWC controls in a different controller at 0x140000. ZTE calls this
controller SOC_SYS, and it is a textbook case for syscon: It has a lot
of different controls: A remap flag for boot ROM, a control to bring the
A53 up in arm32 vs aarch64 mode, the entrypoint of the LTE DSP, SDIO,
I2S, ...

USB-wise it has a register with PHY and DWC controls: Endianness for the
DWC2 registers, PHY clock adjustments, PHY and DWC host/device switch.
In spite of this I think topcrm is the better home for #phy-cells: The
USB ready flags in topcrm are essential for bringing up the USB devices
whereas the soc_sys controls are a curiosity. Host mode only works if I
externally inject VBUS. Clock adjustment is too inflexible to be of real
value. Flipping the DWC registers to big endian works, but what for? If
I find a use case for changing the default USB values in soc_sys it can
be handled via syscon.

soc_sys also has power controls for a few devices, including USB. This
will be handled via #power-domain-cells.

The self-referencing reset property causes the following boot messages:
/soc/clock-controller@13b000: Fixed dependency cycle(s) with
    /soc/clock-controller@13b000
/soc/clock-controller@13b000: Fixed dependency cycle(s) with
    /soc/clock-controller@13b000

Do I need to add post-init-providers? As far as I understand it, this
message is informational and not a problem that needs to be addressed.

Changes v6->v7:
*) Moved the bindings back into clock/ (Krzysztof). Use clock-controller@
in example and in the later DTSI patch.

*) With a lucky find in strings in LTE's cpko.ko blob I could make sense
of the register that controls which clocks get passed from PLLs into
the clock distribution inside topcrm. Importantly that also narrows
which clocks can possibly be passed to Matrix, so I could slim down the
bindings considerably.

*) Add a usb phy child node with the phy schema added in the previous
patch. I don't expect the USB status register to ever be in another
place, so the binding expresses the @84 expectation.

Changes v5->v6:
Set value for syscon-reboot example (Sashiko). It was my intention to
set only the lowest bit, and I think Sashiko is right that without
'value' being set, all other bits are actively set to 0. It shouldn't
matter given my understanding of the hardware (afaics all other bits are
ignored), but actively clearing bits was not my intention.

I haven't changed the name match for "syscon-reboot". I see plenty of
examples of hardcoding this string as opposed to having a regex for
syscon-reboot@12345678 in other bindings.

Changes v4->v5:

Rename from zte,zx297520v3-topclk to zte,zx297520v3-topcrm and move to
soc/zte
Fix path in MAINTAINERS
Add syscon-reboot node to the binding
Give the USB and HSIC PHY resets their own reset control
---
 .../bindings/clock/zte,zx297520v3-topcrm.yaml      | 122 +++++++++++++++++++++
 MAINTAINERS                                        |   4 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  66 +++++++++++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h    |  12 ++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  30 +++++
 5 files changed, 234 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
new file mode 100644
index 000000000000..ecd332f421b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-topcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC top clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  The zx297520v3 top clock and reset controller generates clocks for core
+  devices on the board like the main bus, USB and timers. In addition to clocks
+  it has reset controls for peripherals, a global board reset, watchdog reset
+  controls and a USB status register.
+
+  The controller has two clock inputs: a 26 MHz and a 32 kHz external
+  oscillator. They need to be provided as input clocks. The controller provides
+  PLL output frequencies to downstream clock controllers.
+
+  The USB PHY is exposed as two PHYs, one for USB and another for HSIC. Note
+  that while the controls for both PHYs are always present, the PHYs themselves
+  may be absent. If this is the case the controller never signals that the
+  missing PHY is ready.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. The resets are
+  defined in the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header. PHY
+  defines are found in "include/dt-bindings/phy/zte,zx297520v3-topcrm.h".
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-topcrm
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 kHz external oscillator
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+
+  interrupts:
+    items:
+      - description: IRQ reporting USB connection
+      - description: IRQ reporting USB disconnection
+      - description: IRQ reporting HSIC connection
+      - description: IRQ reporting HSIC disconnection
+
+  interrupt-names:
+    items:
+      - const: usb-up
+      - const: usb-down
+      - const: hsic-up
+      - const: hsic-down
+
+  "#clock-cells":
+    const: 1
+
+  "#phy-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  reboot:
+    type: object
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+    unevaluatedProperties: false
+    description:
+      Reboot method for the SoC.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - reboot
+  - "#clock-cells"
+  - "#phy-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+    #include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+
+    topcrm: clock-controller@13b000 {
+        compatible = "zte,zx297520v3-topcrm", "syscon";
+        reg = <0x0013b000 0x400>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+        interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+        #clock-cells = <1>;
+        #phy-cells = <1>;
+        #reset-cells = <1>;
+
+        reboot {
+          compatible = "syscon-reboot";
+          offset = <0x0>;
+          mask = <0x1>;
+          value = <0x1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 92a2167f1eb8..d53c0a2c7d9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3910,8 +3910,12 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
+F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
+F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
new file mode 100644
index 000000000000..3aed94ccc26f
--- /dev/null
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_ZX297520V3_H
+#define __DT_BINDINGS_CLOCK_ZX297520V3_H
+
+#define ZX297520V3_M0_WCLK			0
+#define ZX297520V3_SRAM1_PCLK			1
+#define ZX297520V3_SRAM2_PCLK			2
+#define ZX297520V3_UART0_WCLK			3
+#define ZX297520V3_UART0_PCLK			4
+#define ZX297520V3_I2C0_WCLK			5
+#define ZX297520V3_I2C0_PCLK			6
+#define ZX297520V3_RTC_WCLK			7
+#define ZX297520V3_RTC_PCLK			8
+#define ZX297520V3_LPM_GSM_WCLK			9
+#define ZX297520V3_LPM_GSM_PCLK			10
+#define ZX297520V3_LPM_LTE_WCLK			11
+#define ZX297520V3_LPM_LTE_PCLK			12
+#define ZX297520V3_LPM_TD_WCLK			13
+#define ZX297520V3_LPM_TD_PCLK			14
+#define ZX297520V3_LPM_W_WCLK			15
+#define ZX297520V3_LPM_W_PCLK			16
+#define ZX297520V3_TIMER_T08_WCLK		17
+#define ZX297520V3_TIMER_T08_PCLK		18
+#define ZX297520V3_TIMER_T09_WCLK		19
+#define ZX297520V3_TIMER_T09_PCLK		20
+#define ZX297520V3_MPLL				21
+#define ZX297520V3_MPLL_D5			22
+#define ZX297520V3_DPLL				23
+#define ZX297520V3_GPLL				24
+#define ZX297520V3_GPLL_D2			25
+#define ZX297520V3_GATED_OSC26M			26
+#define ZX297520V3_PMM_WCLK			27
+#define ZX297520V3_PMM_PCLK			28
+#define ZX297520V3_OUT0_WCLK			29
+#define ZX297520V3_OUT1_WCLK			30
+#define ZX297520V3_OUT2_WCLK			31
+#define ZX297520V3_OUT32K_WCLK			32
+#define ZX297520V3_RMIIPHY_WCLK			33
+#define ZX297520V3_TIMER_T12_WCLK		34
+#define ZX297520V3_TIMER_T12_PCLK		35
+#define ZX297520V3_TIMER_T13_WCLK		36
+#define ZX297520V3_TIMER_T13_PCLK		37
+#define ZX297520V3_TIMER_T14_WCLK		38
+#define ZX297520V3_TIMER_T14_PCLK		39
+#define ZX297520V3_TIMER_T15_WCLK		40
+#define ZX297520V3_TIMER_T15_PCLK		41
+#define ZX297520V3_TIMER_T16_WCLK		42
+#define ZX297520V3_TIMER_T16_PCLK		43
+#define ZX297520V3_TIMER_T17_WCLK		44
+#define ZX297520V3_TIMER_T17_PCLK		45
+#define ZX297520V3_WDT_T18_WCLK			46
+#define ZX297520V3_WDT_T18_PCLK			47
+#define ZX297520V3_USIM1_WCLK			48
+#define ZX297520V3_USIM1_PCLK			49
+#define ZX297520V3_AHB_WCLK			50
+#define ZX297520V3_AHB_PCLK			51
+#define ZX297520V3_USB_WCLK			52
+#define ZX297520V3_USB_PCLK			53
+#define ZX297520V3_HSIC_WCLK			54
+#define ZX297520V3_HSIC_PCLK			55
+
+#endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/phy/zte,zx297520v3-topcrm.h b/include/dt-bindings/phy/zte,zx297520v3-topcrm.h
new file mode 100644
index 000000000000..b36ccf2f54ef
--- /dev/null
+++ b/include/dt-bindings/phy/zte,zx297520v3-topcrm.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_PHY_ZTE_ZX297520V3_TOPCRM_H
+#define __DT_BINDINGS_PHY_ZTE_ZX297520V3_TOPCRM_H
+
+#define ZX297520V3_USB_PHY	0
+#define ZX297520V3_HSIC_PHY	1
+
+#endif /* __DT_BINDINGS_PHY_ZTE_ZX297520V3_TOPCRM_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
new file mode 100644
index 000000000000..f60aaccf0f4d
--- /dev/null
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) Stefan Dösinger.
+ */
+
+#ifndef __DT_BINDINGS_RESET_ZX297520V3_H
+#define __DT_BINDINGS_RESET_ZX297520V3_H
+
+#define ZX297520V3_ZSP_RESET			0
+#define ZX297520V3_UART0_RESET			1
+#define ZX297520V3_I2C0_RESET			2
+#define ZX297520V3_RTC_RESET			3
+#define ZX297520V3_TIMER_T08_RESET		4
+#define ZX297520V3_TIMER_T09_RESET		5
+#define ZX297520V3_PMM_RESET			6
+#define ZX297520V3_GPIO_RESET			7
+#define ZX297520V3_GPIO8_RESET			8
+#define ZX297520V3_TIMER_T12_RESET		9
+#define ZX297520V3_TIMER_T13_RESET		10
+#define ZX297520V3_TIMER_T14_RESET		11
+#define ZX297520V3_TIMER_T15_RESET		12
+#define ZX297520V3_TIMER_T16_RESET		13
+#define ZX297520V3_TIMER_T17_RESET		14
+#define ZX297520V3_WDT_T18_RESET		15
+#define ZX297520V3_USIM1_RESET			16
+#define ZX297520V3_AHB_RESET			17
+#define ZX297520V3_USB_RESET			18
+#define ZX297520V3_HSIC_RESET			19
+
+#endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0

