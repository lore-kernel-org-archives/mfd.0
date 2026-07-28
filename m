Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D43E33E34B
	for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253755; cv=none; b=WOJyEv1A2ImhiH1YnlsmjCktw1tb9wV31UAt2cTNU36pIm0UZ2VdvbM4jgEqLENUpw4hjNX72a/aqGPNGWtUXnexNPA3DgP3AS2zLiDSzKNSd5iiBdtitFCzbqOPpTwZu9YEh5lqn99095J2jYnjT+bkruHkOWPu4rp0IHVNws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253755; c=relaxed/simple;
	bh=D0rHVc7iBpZXkfS4z83mpuZH1Go8dorICWjn3SYQb7c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juVaEDfun577nquX6QvAdkqDw+/J38bLhZ49NUQ0+GxvAsx5CpKkhf/K1Vc8Ct0FSWFxBhLINNmBD2Rng+Wlg4M3kU2mHBkOVXX5WsVkOu4wj9qVVe8eSd6sLqeWBF6HmM2nYbw7wPvLbW+s70VB5th814dp51kc5xnSIb93EEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEvyv1hi; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEvyv1hi"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f7854678bso8799f8f.3
        for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 08:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253752; x=1785858552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iZ5Ahml9vc0Lc4cZvlseqL+CGWwYxJKEQ105WcAHSfg=;
        b=DEvyv1hiW8mFfXyr/7cUzk7hN43e1vWco0HMo0A50dPSRMeRD+P1s/+eGv3DMb+t4+
         Dx3d0FTeKAab4E1R1/KS4Nwrs29In59RfwE9QaiPNV/JMo2N7biFJ+YvqyWQwg6SR1GO
         WfXl42OcqbuKXzqyCqiW/+TQAq+LJ2UNB0KKK1V37C2+Mmaa71Cpf21dnTh9fq0YZeFl
         /+HW7b3ak9ZHfDzqmpeWfLdMWQaTTXWYIIoyNE4S2+wGHqODXMu7DvzzSy33CPbHYWNB
         +z8559rkIrA+10HiAw8VaNJsN3HGHyDqB6zB9qX5W7CHelWFIt3x2mhFR4lvOut8u99/
         4Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253752; x=1785858552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iZ5Ahml9vc0Lc4cZvlseqL+CGWwYxJKEQ105WcAHSfg=;
        b=nnKlcYLoU86oggUW2IlG+LerHBMtKWQbjsfPHkSz4uLBcGiDzMHJEcnRIe0h/6nhKa
         9mpYk+YkbHZaqNFysSQnEfThNyXq5mVvHcTa5jFTmZ/WydlVFLunSVEXiFYA/RmHJ0AD
         +qw9DasRcA+Mh53a5fzhBY4m+CZL+iYcnN1z8SbCNag+wjbDthdwp5+RnzFa8tmqSnJm
         PdASGbx06LyupsoPMb+A38ynGk6kTZxmXGcWIP9654TOhRE5M7LuDMrVJuDTM/B+XT2v
         8GQdZxV+4GgzwQXKGA1y9Pc8LzrTrVfhAvn89Mw96pSm/Zzt02qBXNvZkgH8N1A7E0BP
         5Nqw==
X-Forwarded-Encrypted: i=1; AHgh+RpyEItrYrt07aNl+lhiKUfCH8YRD/GXNCB3ptFYxVMq73Q5JQYODDUedPAoD2YEQv9ixUo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0IyRkxfoiQgcUXZMFUYiJrJYVMB/LOLvLbXD5XC4YSs7IU856
	ZhXrzRd79zB34Vp46Uf7QDoWsCge6bh9k9ZwjcO4gq//dbs21KA95cimzkuPcg==
X-Gm-Gg: AR+sD11LPbnDukNkR1vjr9EL6PnepNzdB8vxLnzOBR1DPYTKA0w26V/FPlpOjodmkCr
	uXyZhJG+64OGrf0gRgI3oN5qYpQx1lQZpPB9stVfqaiPk+/TWTAr5p7eiPK7DFdJxQRVqGHk0n+
	rjGZz1MptC9Dx7XkD1/Pi9E52yqx/IWMf7ZIEH2RVWqhRLwgq3uO38zDcDoqVyZCAA7bmDYp8bV
	FjywfpTPL2QTzY+dn4NH9EdJvI67TgjlLHgX3tVh4malufgMkp4ms9xQImsR80D/+a36VEHioAv
	aKSZ4fLTGE6Xqi5BS8zRDquxPJL8187hnUILGB3N5x7YcLgUQXvEPaTylbEjzheUaDo4yOdIhiD
	wOPhG+ef83KHEtGLQBvhmIrnPjfphcTH4ihSZ9Nq0uzP26ShbzeX17JtxM2zp6f9u1s7iGbqdqh
	Mg424y/OBPpCbFo5QhiToydPyWagJ6
X-Received: by 2002:a05:600c:5486:b0:495:7040:c7e9 with SMTP id 5b1f17b1804b1-496c6414bddmr31261065e9.6.1785253751459;
        Tue, 28 Jul 2026 08:49:11 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:10 -0700 (PDT)
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
Subject: [PATCH net-next v19 03/10] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue, 28 Jul 2026 17:48:30 +0200
Message-ID: <20260728154846.1828945-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
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
 .../bindings/mfd/airoha,an8855.yaml           | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..647d6d4c4c6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,173 @@
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
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
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
+            reset-gpios = <&pio 39 0>;
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

