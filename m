Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82D94E77FF
	for <mfd@lists.linux.dev>; Fri,  9 Oct 2026 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562282; cv=none; b=OJK3ibDRTzmMp5Y1bzgmzpcUBmvPLVN13LjA31Z8/W60LlH98nf0HTwHbAI0ZoX4Z2mLsYnR+9HV5NUPciGoVq8Ajn5PNPYTFGmrhTTJqFsld2oC5lDK9cMqac6EbbUwDP/0gcV9znH/O56t7X+ClZQtVI1tdgP+9ZchO1xBGLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562282; c=relaxed/simple;
	bh=pOEzLfSLCr+9oxyGNTSsgNcprEznMU5MGTfyskpEb9w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3czGjRokjZZ/3adIPu50q+V4EwZ8UmylwtWg/zysI2iKhB6eZQEJjrKHxVdhkDw6Kv62EJOGy3mDnhUZm7LvawP7Tk4G2KemomC9SuzUv5I7TLPb4td93FhUNbKsl3265YVWEBmBOffs67ETfPWOt2v2o/R/lVNI9K376/Ugpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSUkDdSX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSUkDdSX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c6f764f82so1615944f8f.0
        for <mfd@lists.linux.dev>; Fri, 09 Oct 2026 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562277; x=1792167077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=DSUkDdSXPa7c548RR4SZEeTxwX3N49kZfBv3tVOc26VVyJtFJ47+2gZYm/0CryFiv8
         d9HlnZzZX3bB4ONE04Ni5g+szf92pSib9EYS/HEAbZ9epI+DaAF0mUYdIwKS/h8GO0t2
         +mPQTZCO8sVdJL8EYhc5d4+xktIUfak7FI0V8M5eHKklE0nL6WWq79rv1Lw/wMYZUmkO
         F1lF4jFpmtrShWT4wjc3EH2F35mVtNTuGmt38f3MUHvjMX95xtih/p7Ev3eMY96Rz4Xr
         pXSCpBpQzGYE/gxEEYCxwdZjb8jtyhWMJjBoAqlHcmyQwv1YirMUR4KvIytAsPDQ2qRt
         XfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562277; x=1792167077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=t/PlLKjpSuoGhaH4nOuSr1xSepSyPuljN/SVqSvmevZuQr3SJxCSIJ0uao1fymSitn
         jL5hAP7f2arrqGMGk4YR0hYkDHFliL3AR9XMhcowm3DHBVr4Cj0ime2CtBrKCVUYiHse
         JMoGF8r2zt51fuXpz4WEaZMiJwcJ2/Ssl4MnK4aFGnyF06r4klnH4odxdvY/EyNlpqVC
         cBLt1/t11Z3K97vHMmSxnzkT2FkdjBzihSCSCnEBR00WJA3u3j2/bjO72XG2VlfkGAwu
         IA9xV5Z5WIyVZaXZKGQH9rv4rS/Upc1gkMIgmD+5ggzU6kXmD/8DHyQTtqawDIEUQ4+U
         COVA==
X-Forwarded-Encrypted: i=1; AKwUvBxLKZovf/zCqIHN262Qi8cJtyhoYjjg/8xzepsmw+ix/MincjM7YrZteFbQHDYbHPTvf7I=@lists.linux.dev
X-Gm-Message-State: AFq9FYKI5jz+CzUEEN19/VSvU3NwuxljagQCPgsDiHTDBq6Y99e1PPsz
	Q0TOYz3rsQC6zYbEL2KLgLSl4w5FaQIPo30W0Yp2RgtEaDnyNvWJJorp
X-Gm-Gg: AYBFou3vV9IypHM8HZ0x9SOQuobw+XO4ZWsJGuIeGNIHfQUVZrIh87jAi5tV6GoKyxw
	i9i/xnu2a2QYsqE7iQ1J1hwK/s9cV6vuI3F3XGr99sNYOVAb9RTe0IQ7TP9mLVBmsuveHvzjS0S
	6fofHtMWqwXnpACtGll/36ILxG3uA0uA/+jozg4ysngfByQYgt4RuzBAg5rAe087jaN/IPuI2Pw
	eBsbAk+bJ1P1DfGlB79Q+LH8ZzMUiAMa0YorbxsR/OqIJDFX+e1tN7s33rAJ61n2HNBF2r0l3tj
	6WjBa4yBxA6e8DX+WMTtnjVoUsQ7SpsvdEoAxCidNVe13dds+kG4URMcP41kx98lyWt+71YeEsM
	SOKgHqpyj0KvBawDInx7prczLHt76nl+IEsVHxLrMZ0WR3w0IwT+sQ33OFUQiI+VLlOLyIpwFkk
	MYp5IP8z8LXl9FGSBr0piT3WcehvdTNVd+/9NfmFgKAKeRQ73g9oHUmxjv0goiULSpxQlFaVgtf
	bDy8/QqmhkSuOzi2HeByvj0tpcVf0EtJ4E/ABRLEJuLooT/bFJimecFE9c+59w/i4H10ROYI3hB
	jXqz+8joIY5JogvWjg==
X-Received: by 2002:a05:6000:4313:b0:48c:5358:f999 with SMTP id ffacd0b85a97d-48dbaaf07d4mr4638604f8f.37.1791562276952;
        Fri, 09 Oct 2026 09:11:16 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:16 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v25 03/10] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Fri,  9 Oct 2026 18:10:48 +0200
Message-ID: <20261009161102.38961-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
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

