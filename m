Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1140E3C13E0
	for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954851; cv=none; b=hkgx0qLwUzJ4IqR7iiluq0aWJDayN+pPrZVZvhvT404qWdxxsJstnaZH3TfkOXraeKpboOChG/BiqsHQwWYKNl4iENXgiKkYp1/izGvxs26sPp4WCygr2frFgLNK1/BA003tkOdzI/PT1gWRaZtkOPb7GG53qEXGXGe1xP+rV2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954851; c=relaxed/simple;
	bh=kKX+clwqIG7nHKL+eNab6AZ63bLiuD95dpGcT66/2/U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TW1Xt31AGd/UtM8AMQhbqRgTrWcffgyKlC0zlWHE/x7b7KLY7mjbqs6QCj+b65s41cFjpz/bORUdodYPEnYzrk6JqC5yqIHpnWjcaqimcw1PPpzN1laURJqM/PBle1tMfOnBz2V35k6rVQYUVT0u7fBjgRKdEGAkIoTVR63jlsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAVmUYZR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAVmUYZR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso39385125e9.1
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 01:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954848; x=1787559648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MN0cvyBLl/Yf0HEK0e3keV9BG5lWd3AQZRn2j6pmwM4=;
        b=DAVmUYZR28nYSRsUmxY4aTE0nRDanfIOOYDSpd6TC5ASq9TsVpXO4neBRMJH20yEdC
         GsNdk+lc7y+RdX7Zx3SDBeYc9041JpwXyCcnjdgFRhsXB9nZdaPsEYqEpMue2aHxQs+E
         VLK8Ct4KgJhn/0XfoBSG5R2yDwmcerxSeWi4yf/GL4S9cS/x/mrJjgZUM2B/1jS1A4WF
         Sjn3IfRsT6FFRNGbNtNPZ9g5jsKMA1APG3wKLajTgerHhTc9CrD6to3UsW2VBe/d6Lj4
         Ajd4zfhpXDOrsCEPlcQMWpdQ+DkbOPRzz4pg4oYubpv0uR8OpYQlNjXFFjq8XpbVz00/
         xMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954848; x=1787559648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MN0cvyBLl/Yf0HEK0e3keV9BG5lWd3AQZRn2j6pmwM4=;
        b=Lajv0l3zbWCt5rlsOynG3AxJ6uctvwXK6O9BaH/5JvGYO1GWHlGc+ulrhpWknS4DWb
         elj3zVF8op61xcRFkxmjcohQO1MSVz5TJ3fjJFAFI8FneCrUff0CGPDzY/U4udGLEtXX
         ugA/HURZ5GLrmgQ1rnV3M/MlQgKh7KBkmRtvTQUMtehftUD2lQLP2wlhrHHlHPZieHM+
         W58ldmQV7GpDvxG11OY64L/Fxc3Eg8be1xWZ9UTLUpClv+QpeeCq7OXCXP00CuJIRNVd
         jpU5KO1vz6s6IGLlFrGptzI1nypTIs+n29ZYYw2ztcXkkPQqBuzJx9ldefcmzjdwyRfo
         rfAA==
X-Forwarded-Encrypted: i=1; AHgh+RpUx7lWa4XFEayzj3kpdRK6vD75OGp0fwSPMIt0A+JBLyx9sODR6x65bMJ0NtLeA2jIh4s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaT8+MiYvJgY3SGrpL4giTNA8pgASUo46i98vt2VAfR0Oce31Q
	4PiNY/3lI3dFQOAGUSJZtovFJ/QxkA9+VjI0DTcTiiiuaFzYlWO38w+s
X-Gm-Gg: AR+sD11e3sC9HY1CirbqTdjtQxXHwwwOS6nhOvIUVQnHyf1a6+nLi550JoM2jFrFle3
	SU2a4Suhc2vi4td3JXLfj30NYMZlTUc3K4GYjTWtONsd4X4GnfU8crGpuNOAZYWsGz96mdTWITv
	OpCcF4egSSu9g5KDF8wSDlNqFhFe0pkc4FobwntQjf92FDMpT3cXW0Kxc/34X7y8KG9UoWCi3HU
	kOWnwmJtNeNUbKMXb2BDPFuDhnfHpPKB7XvLwFd/4NUdtQjVYfcitbAzPlKL9uVdItMPRjQ6gu9
	yh7dwN+su/UI1F2GwOcwP/3wJOPuaLmu5qzkC9e2kp1sh8eHRgRP6SDBxiGgBmsbMEHYvlTzByR
	3llGXNwluAenQEkCatNVUSPw3pj90JE8h0TmrWsYC+4DwPQi1biEVOWisetarKSID4az/6bZxgO
	v5YCX/tRFoz2heh4SOm0MGziPLCGTNIjgzyk5HlVHbVuWcuAHJt97usNu50qB0nL3sCx6u6Wd5/
	DXUy7SmGZ/fZajB/MiE8JMw18+dyb808fXxcikmkmnsz704iX+OOrDv
X-Received: by 2002:a05:600c:1c22:b0:499:9a29:583b with SMTP id 5b1f17b1804b1-4999a29588bmr67529265e9.19.1786954848286;
        Mon, 17 Aug 2026 01:20:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:47 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v20 03/10] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Mon, 17 Aug 2026 10:20:24 +0200
Message-ID: <20260817082034.20326-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
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
---
 .../bindings/mfd/airoha,an8855.yaml           | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..472da8384a30
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,175 @@
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
+  reset-gpios: true
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
+    unevaluatedProperties: true
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
2.53.0

