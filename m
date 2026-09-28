Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030634F68C2
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 19:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624764; cv=none; b=c1PUlvjZCj7fV3upGd4Myr5OibWiw8W2csgqyoZJlrRfHXASSyxstQvx1ePQLi/DhTBufVCp6TsPMuoBPuvSURaAiTaTDT28qw8iaUVmgsQGbLI4TlS25ZqwIxNupOXI89zNvKZvvkNqbPbJkWvOkf9QJpDBvhLwOfjhArB3nEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624764; c=relaxed/simple;
	bh=pOEzLfSLCr+9oxyGNTSsgNcprEznMU5MGTfyskpEb9w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VvPXWnR6nOQhNMvJOOIvF7HQGRdmYdG04ZNOlgSQ4e2tuc/iXh0jlwlojafKyvEI5DwZIuur/5DRTDbPvFb0vlqGEwTMDfO9UPKPaKRZbxj2GBiUtTQ0Q7reiXHFOTDzfjQwKc014+/oTrR2wTQvkXgmRMFsncs0ZzrLD4JvZ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krEZkZDJ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krEZkZDJ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso13085315e9.2
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 12:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624760; x=1791229560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=krEZkZDJJturQr1vio1qpOxacuphJ75UvOKN8xOXiVUqLeuOf3VaycL7LS/9lJInyg
         IP0jeqH00eelQ24CXSBydCWVj49gDzcT48Jsi/d8l8c/4p176HZz4xiM29N68FrjJUSd
         02fj4kGB+zMBcWPE0/7vcep/WbeFHoVQu8+A+JpgYGmkObQ7W6zZrmv4ZshdwYw1RqHo
         hm38LCYHUddhr79zrdWhp/r75ZDUGlg7eBetk1EnyhxQFzQu/XXNYBES35s4Qee8gf1S
         wuWR9wqrt/LSml7btNsfhCBdg9NEh0+hYVzg85NY69fFafZHRKqonhhtOrO0rp0KqFOs
         +ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624760; x=1791229560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=D7mQr3bt0N9cat/hZVB2yzzW3JfcN6qXHwwErYFVGMlF2ls0kEI8d/BMvHbRux37CT
         t0LirsvuQ61poytU5j6goYxgU3jjQSyWtDVn/OmQg8je21ZTFpylEy+s3DMVsxUsL76A
         R1qp0u9WqFsfZGGq8Y6xlRoOs4/UfsdO/PW+nW4hje3tW+zlxMIxCxlANIyBBfOfe8Jl
         bwBDZJ1P1V1W9LwSduZmlgPPsKhusSkLQFKBE9udn786aXcuh3kE3QnzNqoABRefu1EA
         EvH7E1iGiKWmdY7cygJj/p7ANtGXkZWS1x1W6pVVOmou7/qPA/XtOC4Mr0Q+R9Ye2vYT
         /14Q==
X-Forwarded-Encrypted: i=1; AKwUvByRtlMIm7TCbNVWyIh7PGcJUSfhG4Wi901H6ecYAjR3J1xF6GIFfb36qU0iMPUBTY4bziM=@lists.linux.dev
X-Gm-Message-State: AFuF++lS/71BOIcuaW7ZTseyT867Z3jwFRwgCdpr77D5VcpV36k58opG
	uxc2FT8TLvwz5QuJjh/rG8YhwcSblIZDKBwmO6wwEgihoMrNhLAJv9jL
X-Gm-Gg: AYBFou2Y8KdcA5BhIWr3h/LPamgOzCS/Djll6m3YFBOxgOIaoa2FOtk7SXJo5Qdshzz
	SX+M2rF4QThp30Ls079LJ+q3KChovwdzfIr3UYp8dgj9dK4ZTlVAweIIhBHhGNSwbQPlHvxME0O
	Z9k738dvOJZ4WMkz82hwqVo6NJUppqe6G8o6HFZiv8ey+LkP2GVS2Y0a62Ld/I7mlfMijSjlZhp
	FiUUbZ2pKM6RehqdEAlyYenPbdz2kH6uxChsWMZztyDSTggrX6FnR1fnUYIh2shipEF92dQrwzM
	ubfFto7HlKn2fmsyKXIyoVu/naU/q00xv2qLBs5bE+kxgr+li/wE7MhwcnS4Zkbk4mSOFEezi0i
	gB61O/vXXVsWSMKDLllMvjZZNhMCe/MZMiTNAhQ1afvWBPiyCBWGtPv2DEs+EoEiRcTVWaWxDos
	M4jHxuRcEVLbv8mGWx1FE9jj+RjByuXyB2fRY7nofxulE0dIqYT8qx8aOkpGbjLyYfmLmtfPlm1
	thUZrqjPvZ0kbg9YqGIxm5R3dzBI2/ZwSzBCUetr2GelRoF7Etl++gxOOIVG7nZ1Q==
X-Received: by 2002:a05:600c:870c:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49fe66d76camr237998245e9.15.1790624760097;
        Mon, 28 Sep 2026 12:46:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v24 03/10] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Mon, 28 Sep 2026 21:45:02 +0200
Message-ID: <20260928194511.41878-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..48127e956c96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+  - ethernet-switch
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.55.0

