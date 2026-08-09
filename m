Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F9E346E51
	for <mfd@lists.linux.dev>; Sun,  9 Aug 2026 21:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310946; cv=none; b=WeJbMW84uLQA2DtEICgOYW5/unhn2v0CDcLJhsA69NjSzEz8gwIBCiWNL6JeW1AlQ+B5nT9gUeLcB+gNmxGdIuo81cmVRcxc27Sn8fMy9IfpGrqj6A2yJ8MHQzBS6sCKzJwMwexjLegdHlyjFkOBIDH7dMMcwqQGnt1qNl/2hMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310946; c=relaxed/simple;
	bh=DM1hAVZYJq9k76Uu7Eujy1xt8tFcNCoVKCiI84UGQmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgIfI+sw9wC7wZ44ycM8cqXA1Hi72c8YuDMxYuNZJuaCOYYtMbjFMfuvDuEFqv4EZAp4TJ0iz0Kv6M2Mzh1oAZYUISAzShl0AlEUKf+CxbcQOxC2OIaCROpx7J/lYxL+ZySHJlsgq/xjZzddBBaSnfO+oxo8E4lRPH3UfYkdYLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdR5kpqA; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdR5kpqA"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4798bea72f9so694509f8f.1
        for <mfd@lists.linux.dev>; Sun, 09 Aug 2026 14:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310942; x=1786915742; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acDm8bRgR8KPzf+K9bAQdb9mwDVo0dBEIic+0zlczzA=;
        b=fdR5kpqAFGPBigZp8yaPBDBI5J5hnlLzyyOmSvE5ISFkjylUiBGM7F/6/RWJghrsbG
         JRrQ9DjykqOyPTyoHQeAMuCCmNRA/DPYrChM+7qF87YeQcimbrOwnV6eMFoKR4s2BW+C
         r4kERNdh6HhiANMdxCz0zf2svP3MjpkJw9/ibuI9RHDP3vR11MdH7dLu7I25x1NpJ152
         xoTalp7fzm2z6ClHQUZTXrTpMNAhwfnnQSgpsKtaO4gBwA5hyUv20ZM/6jzOIXhtHQMO
         eBkG371rsi3km/RL8Ozt5/LAA8V8rpsZmjPL3txqji1PldkjJCVM3wRTu79uuajgsy1A
         HXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310942; x=1786915742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acDm8bRgR8KPzf+K9bAQdb9mwDVo0dBEIic+0zlczzA=;
        b=S0jVU0JjK6nDzHi3qD5K+e2lQ4q4Cx3VIjmib3DqM7hdl7wLlewnySLuKt9AkJEbQ5
         J15uqnxIxEw4QGGRMZl0wMjJxWCnCFgIeJ1izkTN2UxLFDKYTOEFQR2BoCeNkcmqBu21
         0ts/NpAnOcr8+dJ+2h9zIfCB3LeCPTIOUlC2FJWXLdIoXbQ+trMEdkwa/K34D/mdHEbv
         d6VuB+yq8gmYc98wUC/hcyFJHHklFlBwREfivP0IQmqj8O9MVxQuZROQ0hW3S0cxEFds
         qUXnoZz99L1liCQZlmyJwgLKIb+RrfhdqniiVB7zTvDQORdz1paB/urKL1azbTBXUhF/
         NGeQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0N4sDhhvK7Z4jmFspDy+J8fUs76LIyEmyzXhDuIUfxlBXbfoKtK2LlV5AlzV6fG+wEUI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7H2vnp/sGKKHyK4bxKQFa96uZBeflNRYkRdH3n/ZOzV04cbl5
	85WX1QkQklaNx9R+34TF4iIUvGg+DKvJmnBTI/P3shAzfJM9gD86AYOj
X-Gm-Gg: AR+sD12Qink/tNnrpW5DelVyCas06dGSYWhBb5Zh8OqJG8QLqLu0TtnSPY099T6Ui6c
	1RplEfY5p8ZVmLfcQHbAlgP6J5dj4Kj8ASj/K5WqUnTSaUboxmcGdv+IkWE4dRvzIMkwtREdue4
	v7QaaCZO02iVfuMMVLl7qWZpG/BY9Cs+nfMBRVlNdR8icgonLgT3zYlGugG+OFcVjgMUBiIQPJx
	GEHIs+OrO4dugnJP0zUViTgFACg43a1L65B+rK11RsscFEfTNkkdDea8Suv2cfCOTBIqMdBT4Gy
	OQB3hAcL7+1n+LfhTTJQF8EOLAiVmpLjuR3SUTsP02xf7noInyTQF0VGEmYgcWvgFwjyVWGQnP2
	HBMixkvgTF76WtFIL40HlVJQ7F8WrYrLKJyqTSM7Ns6ifvDbFmp02Jb2JYFAVnMjxXs1uADkVs/
	7RDLKSjR++Mmw6IdxlA4ni1S277V5xDVOTVNfxRFmlwmnHswqLWxpMMOZDu8VRD7FZM6s9sBcN4
	uozgexYkA==
X-Received: by 2002:a05:6000:29db:b0:47f:e797:41c8 with SMTP id ffacd0b85a97d-47fec4e8f84mr44755800f8f.4.1786310941931;
        Sun, 09 Aug 2026 14:29:01 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:00 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 10 Aug 2026 00:28:21 +0300
Subject: [PATCH v10 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-zx29clk-v10-2-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10841;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=DM1hAVZYJq9k76Uu7Eujy1xt8tFcNCoVKCiI84UGQmc=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEOhPutG4kT66u/yfdhDES/DBEjHA5myfnF2
 oQ2l0b9SPOJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxDhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJqiQ//UY9pqvw2o6FnDFej6lpUzRFuyLLXD2/
 rcMiPRGIRx5yLtMEICY+MvUIPIH4+NkhL6VK87defohMDyzkodiRZtAQUVjnvrbgwHXvbDUf+OA
 zWCOkzq9TA8VRYinP6WtCQ5qAyxFiR6XSU379EwduNQoMkmTCD8JNIcxk/E/a0O7O/QCknhWoPc
 iRIfRlJhXr/qr7ArYVl8Pa4qg9DsMJCY3ryDMTn4HIrvWijwOWj2xzylOeH975Y7Av1Uc3U81so
 GU85wboPI/DuTCDQbcQnvvPfc67PrdbHeKONhX+0iSCzJVESXufP5mOrNrluls7OYqvyJQCnAkl
 pPZL3QnWqTBEwylCCIZgxzIOnqC0IwAdScadYhkKUGidFSCvjfTyDWYrX5DgQievhK1dsFXah5n
 LB1RFLa4gDUotwMe0LkdjwgEUxDNUiXgxKXzq+8lmZ1IqOHfamKysXOTWDKKJJcicv/C2anNcFA
 G2qQ6PyPbm4v4rXdJiFpZuTxiqAOaGyBZvwC2UPiNnnJOO08iGM0zoIqbOJOVjknXYkVl/hD/R5
 /J3ISgeexzcVqJCgstkFwNUF5OXtV+duB3EIJg2pw5KrWfx1fwex72S/cUeYhx5nUtJ+TQQiCMA
 Jm8jp/5qkJQkCoaSi2VVTKY5VFYuq5DRHZ+28vmnUjw1wNE5rK14=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This controller contains clocks and resets for high speed devices on the
zx297520v3 board and hardware spinlocks that I expect will be necessary
to communicate correctly with the LTE DSP firmware blob.

I don't know much about the hwlocks yet other than that they exist, so
there is no header yet adding meaning to their indices. Presumably that
meaning doesn't exist in hardware and is de facto defined by ZTE's
firmware blobs running on the rprocs.

The zte-zx297520v3-crm driver will instantiate separate MFD children for
clocks and resets, which are handled by separate clock and reset
drivers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

v9->v10:
Add ZSP PCLK and ZSP bus reset. I don't know the exact difference
between the ZSP reset in topcrm+0x13c and the one in matrixcrm+0x3c.
Core state vs axi connection is my best guess. Both need to be
deasserted for the ZSP to work.

Fix order of clock-cells in example code.

v8->v9:
*) The SDIO controllers and GMAC depend on topcrm's ahb clock for
register access / dma operation. Add the input to the binding.

v7->v8:
*) Start clock indices at 0
*) Fix indentation

*) Add a prose note about discovered registers that allow writing
CNTVAL. I am not exposing them in any way because for now I see no need
to use this functionality. It is possible that the counter resets to 0
during standby, which means someone needs to fix it up using those
registers.

Nevertheless, no syscon yet for these reasons: I have no idea how CNTVAL
behaves during standby. It might be just fine. Standby very likely needs
firmware handling running on the Cortex M0, which can restore CNTVAL if
necessary. If Linux needs to do it, it can probably be done by the clock
or MFD parent driver. Given what I've learned so far I'd rather add
syscon later than put it in place without a clear user.

Details of how to manipulate CNTVAL will be in the matrix clk driver.

*) A non-change in the binding text, but worth mentioning: Register
0x118 contains gates that gate off matrix-synthesized PLL fixed
dividers. They reinforce the understanding of the top->matrix interface
and the adequacy of the bindings.

v6->v7:

*) Moved it back to clock/

*) Remove syscon compatible again. I looked into remaining unknown
registers and I am convinced that there is no odd misc register left
that can't be exposed as a proper subsystem provider.

The controls in 0x100 that ZTE's DRAM reading code exercises are auto
clock gating controls and the actual mailbox is in a different
controller.

Unknown registers in 0x120-0x12c are a frequency voting mechanism for
the AXI bus clock. The driver will participate in that voting rather
than set the frequency via 0x0. If need be it could be exposed
as #interconnect-cells, but it won't necessitate "syscon".

*) Reduce the number of input clocks to match register controls in
topclk's input control that affect matrix and LSP.

*) Add DDR mux and gates. Not to change them, but to make sure CCF knows
about which PLL is feeding the sysmem memory

Changes
v5->v6:
Add syscon compatible - Conor suggested this after v4 and I forgot it in v5.

v4->v5:
Move binding to soc/zte
Remove topclk from the example
Add #hwlock-cells for hw spinlock registers
Add more clocks I stumbled into: sram0 and another LTE related device

v3->v4:
Split matrixclk into its own controller again because syscon/regmap
deals poorly with device nodes that have more than one memory region. As
a consequence I am passing all PLL outputs generated on Topclk down to
Matrixclk.
---
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   | 98 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 42 ++++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 13 +++
 4 files changed, 154 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
new file mode 100644
index 000000000000..5e9506db7365
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-matrixcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC matrix clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This controller contains clock and reset controls for high speed devices on
+  the zx297520v3 board: The CPU, RAM, SDIO and Ethernet clocks and resets are
+  found here. This controller requires PLL-generated clocks from Topcrm as well
+  as the fixed 26 MHz and 32 kHz oscillators found on this board.
+
+  This controller also contains hardware mutex registers for synchronization
+  with different processors on this board.
+
+  An additional curiosity are registers that allow setting (but not reading) the
+  ARM architected timer's CNTVAL. This is not exposed in the binding because
+  there shouldn't be a need to access it.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. Resets are defined in
+  the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-matrixcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 kHz external oscillator
+      - description: AHB clock from topcrm
+      - description: Main PLL output from topcrm (usually 624 MHz)
+      - description: Main PLL subdivision factor 5
+      - description: Dpll output from topcrm (usually 491.52 MHz)
+      - description: Gpll output from topcrm (usually 200 MHz)
+      - description: Gpll subdivision factor 2
+      - description: osc26m work clock from topcrm
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+      - const: ahb
+      - const: mpll
+      - const: mpll-d5
+      - const: dpll
+      - const: gpll
+      - const: gpll-d2
+      - const: wclk-osc26m
+
+  "#clock-cells":
+    const: 1
+
+  "#hwlock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - "#hwlock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1306000 {
+        compatible = "zte,zx297520v3-matrixcrm";
+        reg = <0x01306000 0x400>;
+        #clock-cells = <1>;
+        clocks = <&osc26m>, <&osc32k>, <&topcrm ZX297520V3_AHB_PCLK>,
+                 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+                 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+                 <&topcrm ZX297520V3_GPLL_D2>,
+                 <&topcrm ZX297520V3_GATED_OSC26M>;
+        clock-names = "osc26m", "osc32k", "ahb", "mpll", "mpll-d5", "dpll",
+                      "gpll", "gpll-d2", "wclk-osc26m";
+        #hwlock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d8be58f32901..4b852dbcde74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3904,6 +3904,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 3aed94ccc26f..a5e5d5f17c87 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -63,4 +63,46 @@
 #define ZX297520V3_HSIC_WCLK			54
 #define ZX297520V3_HSIC_PCLK			55
 
+#define ZX297520V3_SYS_TIMER_WCLK		0
+#define ZX297520V3_CPU_WCLK			1
+#define ZX297520V3_CPU_PCLK			2
+#define ZX297520V3_ZSP_WCLK			3
+#define ZX297520V3_ZSP_PCLK			4
+#define ZX297520V3_DDR_CTRL_PCLK		5
+#define ZX297520V3_DDR_CTRL_WCLK		6
+#define ZX297520V3_EDCP_WCLK			7
+#define ZX297520V3_EDCP_PCLK			8
+#define ZX297520V3_SD0_WCLK			9
+#define ZX297520V3_SD0_PCLK			10
+#define ZX297520V3_SD0_CDET			11
+#define ZX297520V3_SD1_WCLK			12
+#define ZX297520V3_SD1_PCLK			13
+#define ZX297520V3_SD1_CDET			14
+#define ZX297520V3_NAND_WCLK			15
+#define ZX297520V3_NAND_PCLK			16
+#define ZX297520V3_DMA_PCLK			17
+#define ZX297520V3_MBOX_PCLK			18
+#define ZX297520V3_PDCFG_WCLK			19
+#define ZX297520V3_PDCFG_PCLK			20
+#define ZX297520V3_SSC_WCLK			21
+#define ZX297520V3_SSC_PCLK			22
+#define ZX297520V3_AXI_WCLK			23
+#define ZX297520V3_GMAC_WCLK			24
+#define ZX297520V3_GMAC_PCLK			25
+#define ZX297520V3_GMAC_AHB			26
+#define ZX297520V3_VOU_WCLK			27
+#define ZX297520V3_VOU_PCLK			28
+#define ZX297520V3_LSP_MPLL_D5_WCLK		29
+#define ZX297520V3_LSP_MPLL_D4_WCLK		30
+#define ZX297520V3_LSP_MPLL_D6_WCLK		31
+#define ZX297520V3_LSP_MPLL_D8_WCLK		32
+#define ZX297520V3_LSP_MPLL_D12_WCLK		33
+#define ZX297520V3_LSP_OSC26M_WCLK		34
+#define ZX297520V3_LSP_OSC32K_WCLK		35
+#define ZX297520V3_LSP_PCLK			36
+#define ZX297520V3_LSP_TDM_WCLK			37
+#define ZX297520V3_LSP_DPLL_D4_WCLK		38
+#define ZX297520V3_SRAM0_PCLK			39
+#define ZX297520V3_GSM_CFG_PCLK			40
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 4a0eaec0e981..54e5b24f859a 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -27,4 +27,17 @@
 #define ZX297520V3_USB_RESET			18
 #define ZX297520V3_HSIC_RESET			19
 
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_ZSP_BUS_RESET		1
+#define ZX297520V3_DDR_CTRL_RESET		2
+#define ZX297520V3_EDCP_RESET			3
+#define ZX297520V3_SD0_RESET			4
+#define ZX297520V3_SD1_RESET			5
+#define ZX297520V3_NAND_RESET			6
+#define ZX297520V3_PDCFG_RESET			7
+#define ZX297520V3_SSC_RESET			8
+#define ZX297520V3_GMAC_RESET			9
+#define ZX297520V3_VOU_RESET			10
+#define ZX297520V3_LSP_RESET			11
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0

