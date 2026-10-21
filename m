Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582477;
	b=XNIeI8aRpr4sk7sNknbY37EKeG9TJEhQ7Bohuu9Q2al9NaBdoNKSyuPQJrMWwSTI6/5n
	 zTQLEzOwZXuSuDsVmi821TJnxK5kL0Cvi8a86LYbYBJx7+ULO42iGcseyC993UzappUhz
	 DPFysxsu02cIOb0rT0NbOjOifmz/hYdQiYMjmPiFYpVqofb5T9whSnMkm2TmWr2yBe+ZC
	 En1rSm7TdwpMXiz3qSqN6PExzy1pPvM8qMXUGzuS6ZjI1X3i51tCd5OVuXdoukseNIRVb
	 PKY2Kmu/tFS5sSpniDGqQDF8IsBW+mIWo2ATYBMMN2KQFgtjGdMUpCHyZ4MgaYwhE5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
	b=X9r+tfeodukdllIZTKLcK+Qb9dALR0itnRoQdSETnLzrZUDlaG+M7ZzjsxEDswbp3FzV
	 pAfwjdlwzypEOSn0yOIXBKcx9c+2Y6EHuTd2qD7d2pEJwg0Ri0o4OTcyxFsXvwgVifu+8
	 43t2M7mNmFS3q3IyY59zcqwMO/hTtEd7p6BBin1tEX5VvPR0Kmgl1Mq/rPvpboSwAPKwx
	 ZWgSS3zKthwZenP9Xjf1a7j8PHMY9+iWFDxLTexMSHUtFQL6z4x6ZevN8YVgM6Jy7dbmr
	 X9d6VFFEXdElrHTJj1JwiKkt60YqVjthlOg67VzaATxahHlY+IFlZi5ntj3F+4Z+SFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iXPg0OAd;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0AF606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 11:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC0AF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iXPg0OAd
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dc202a60eso276141f8f.3
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582475; x=1793187275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=iXPg0OAdSuRDrwXz/f+wD/0tfkvaiHNhxnGa+7Cyy/+yrAVNtpxHbVYMDtoHuxctHP
         8mp1uY9FSkALqpuc5osZWvPMXysXQuKEFROAc1sS2wgx03W7SsMWSmuNKw+g4jn7zsJD
         gHJgrtlfo47Ro8PcvaElKbGHwKgyvRGA1lTYU8DT2T63ch6Iez6I9jNigv1yIXGoiVle
         mv8YzJW8jGy1CBgcjS3C7ZjWhX1Lby+8I0oi5PKdgnc7NpjHLc+988tRztvrKeumlJdN
         U+g0VHqIiPNYhumZzcaV7mmWJA71ShGQ12vuOuqWdS1k1ID2YtzqRIwIJhq3XycjDZIq
         RdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582475; x=1793187275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=YDozEUX6gUhm6mCMwoovuWXgL3YUBDDSNKnNazjEJQIOu3Z/bCcDVn088g4CUZbdOS
         gaRjzcaAqG3n+vHIBiQ3IAgGgpCXfgcthpCSyVAfpZutSAP7Zu7H1Mbs93Rg2gC9xKz9
         LCJbnP8kAmAdbZ/Mrg6yxTJeZeLJ5B+/kYCuwuDX1h4MueFQY+n0OB9DsM4trjNL2y6Y
         swB/ekjYAfaokpxNdZcyqyTXMbJ++qCCSp1ip+j7nfE1trvN0FfqzbLj40AF9ygWxcXq
         YSGr8MISQ8Ctzyzb3ceZHBkuS8ZJDvx9iOQYcSBM8JWRcteH8HnshmCkinRxM7FYSLJk
         a9qQ==
X-Forwarded-Encrypted: i=1; AKwUvByJXoA6Pn82JUOcn7kBN99w1PTw4tN1QucNl75WeURwxX2STJxDOlQDZBHU23Rw5VSKJ7k=@lists.linux.dev
X-Gm-Message-State: AFq9FYKc6d0aJl1OZyhp/ydB04x4TRD3VJ/IE+RqzYn/ERiGR4AydARA
	lcaWlXa92rNbsAiV3FwqBUJhFLAsZgPGe5yZvBzjki3vnw/cgOmKqN5s
X-Gm-Gg: AYBFou06grxrqrRX+aKJdYgkcUpCP96ieyZWgqeFuzi9Z5/+Jnr0sSdbSGCkvjRC6nR
	aAsxP+zVAaWCAbrD2hOTnZ5etybR3Gj8YeVEjHSniQYtIqdl+R0L4kSVasgvRyYbSva5DMEL98U
	wOh2d6bpPqf9OnePQJ66AkEhUzABffO0GRBMn5tzAuTKsg8N/u/jXwB1aDWUwcDLtvY69jNQ8ZF
	8/mdLcOYcf6bE+/7XZsk/HASqajHroNRGT3LvoNl4ssSY2c13+ztz0sYaeVG+6eAq5Sav2INyye
	wsBy4e5tfZ0km80he/RaXdPd17s0PfQJLG+k1vEENG8oh69UtsSh0IcrHKWIm80AxB4qZ+G88mi
	BWVKUa97Qt5i/+LPOAsdpsLqvwdTZ/ZLOaR4Mlyxd73yCos6rQU3nuMniH85OwCn7kiTlMCF+/Y
	bxVnCjD5ZkyVWnldZHW/cJbqEToiBvGYIhrnO5+nfg2ysdLPldrsaohwqAw4Q/VyLopUYbKj2SY
	P+9gUXQL9mWBkcbV50kRERqtW+iyJQVDKOW5LaQvsEGRlJviQQCTSyhuQ0cfY+R02eSnl/+Eia3
	f+OK1n0YiM3hASG0eaWJ+vdQAE1edCYOMKO9fuISgKiFeAju8ksvQwHCYNpn
X-Received: by 2002:a05:6000:4b0b:b0:48c:414f:cc12 with SMTP id ffacd0b85a97d-48e264d185bmr3297266f8f.40.1792582474839;
        Wed, 21 Oct 2026 04:34:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25833b9asm5068768f8f.33.2026.10.21.04.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:34:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/2] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Wed, 21 Oct 2026 13:34:16 +0200
Message-ID: <20261021113419.283015-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021113419.283015-1-ansuelsmth@gmail.com>
References: <20261021113419.283015-1-ansuelsmth@gmail.com>
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

