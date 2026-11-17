Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933716;
	b=B9P6+zGUWOEwwWHl99S7a0ELMLN0cC9Vmy9cpArHHsu5/1t3twj1nVR5az7EBvQGGDa6
	 Fqx6pqMkkoZLjsBoUepGcJ1Kfs2hof4zpV6R7OuaVk2z9FRqpXxLFfLX2VNtXCpU2/vbn
	 WxybA5LxT+qmvB7KyIAfdnuvz8PjXWP5qDXNtfP7KovtcKDcLFsz8UGsiEDlQ7disR2Or
	 mcxwAjJw3P5WmFah22cDXRq6HpPEPbo/lUT6056fK5WMZI+NxTnr21iug1XEvW9CCNEPT
	 Wu5IfBVP6MvKeNFH8D7S//0/QLFFl3RWuwEunOGd9NfrldpJNeN2jgWOTnBT8rY0g5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
	b=yDJNuubdGIRwdsieIh7eoZ27gWAeNSssaLKL6U/J6lzyJ/rrANkQ7FPypgBHXa1c3wY0
	 wEviRgBJXhpha01Eyi2Wr9783xXAsBVVnKxaItkc63QUP+IZU02UN3lJC3Jl1ko/TOR2k
	 bbHnT52W0IigGs4nRUFJSQfPoANPsZhYSYTL5B2jcIpM6Z4kiovuGZudLYVYZwYg/m1Mw
	 SF6La/HuNBdlqQoKHbvp684p1uKo3320vn1UPML/A4YTMxsHjIPRn7uCV1YaQZiBzSE7H
	 UtfYLNDjm3D1UShneSkwboKkvTPEAWBxM4s3vQzB8YRXVfaQHQVj5TDckpJtRHUocKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=piPTE7d6;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3841606A8A2
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 16:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3841606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=piPTE7d6
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so668125e9.2
        for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933714; x=1795538514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=piPTE7d6C+GOYahrOzSrhPrr4IkUkRrgKIfJ9dmDG/O9LpehQjcLFNU47LC43V1yBj
         VEb5MRci9f84Z8WfFIioTT15En84/OnDs70o5QIJK/3/2wKF/5q90hlsB4ARLkGEHU5i
         aQTD5iHMAkeybS/uDCbuR7LSfgCDhfrXNf8sXqg7YgaD4H9pLysA1eSDdAHwuUerbVT+
         HzxrDl7Hs0+DrgD8RWRoIX+1Q3Dscy/7HyshJw1XCHftCSpRIvHgvGRxhx3uejsNMJCN
         9QhcrE7YDAaKcZpPzKkNyLSBkje5ElIpgHFR7wU46cnJXZ6am8MGI5k6x2oyHUDpDRAE
         oO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933714; x=1795538514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=ajRw2R9D8Jt3xB53kT9e6dfdQ8iBv//cirwwzMjaBeIkBPamnbT5c9u+WYnSaHcQbu
         rU+0QrVUXN+XQGj+DMAXMaoDeb0OWD8TVQjbnd+PZahIYHnOCfgErhB0pPUlGi8cplcu
         EM2Jk/jd9YuGvXpmN33kM4aPG5TamFmI1DGKH2Rm2xzMc4FBwhHquxthsyNXSOs7kjLb
         8j9XsDY30Yws/WYgBDatU3qIdriarFJunAngRGBm6C8DW3KAkdU1bJHY9lc47EJ8vxaO
         +3RgMHaaYCt26vxD8bqur2e6FCl6wKaRLoxC1rJWvrUrn43BHWAM4UWf1DxQ/75eNLCM
         N7qw==
X-Forwarded-Encrypted: i=1; AL+hErF2winkoK09dB5TOYy1MAD6ltekdgiY/nKgu/IoU0bLLVDNdObORjxGqyNK2IGM+pZexmk=@lists.linux.dev
X-Gm-Message-State: APuU4Z8KDBewYxw+5RI6/GPB2qPUIqHLgOlayAgbFnm/w//jLgP/6MSa
	JfED/RfK9/zEbjfmtmuYRW0RPOMJkozIR3BcPsp4/KQj2dFvkL3+HFzd
X-Gm-Gg: AYBFou14bEcKBlKWjXImFjkiTLuGkxS3kS67f54HH6adhFpQ5rpGkkCeS4n26XpccJb
	V9p4ztLT2HiVJNfozaaHsk1Zgy6CrzVVo7m6zzk1s66Ye2Qk7Br2eNaXqrqYEKxl7fqgj65GFcG
	M4XE7SWxHhewtR5N/DIO/TGkZp98OUqFmyrNdlIl9P4jmAbJbhB0f3DpaBAbamUG0w/1glKNy+Q
	aWZEU2Lruz3AsOlddct4holE8+hpa/N3oKqqXXlwTAW67LEa4K7SRc5IntHgxT6F2ZPdrfkNcNv
	rX0cOC6WPdni7Gr2GDRIXz2GeZcs5DoNYzkREzqwXAoPrfs3D5FS/Mb/BtYzVHpQXqzUyRy6TSp
	jNPyXbEqnh46/CmVrBd7vM8p7jbgUMjfFbCLwWP4+BulWVzT/wa1xdvrkHgy63Eu70af8Xf5IWc
	sPdNfheKhvP+UeBcHVXxHyWjoctpMMsypwdr9YW0sKMSnyzETClut28poDQp8xR5U62yIYkyepU
	lSwgeRstS+bMiWemGybp0BjhrPITjxeiOecRvxBbly36WLEzGNqfN0t/W7RyoDH5GjAyLrJfFqK
	ltwikzkP/SHPc8a7yUp6LEa+xqj/PgBWlblPSNEfyJ4Y3kjl8W72M1gCkIjeiLxl929p4ogeCCi
	/yF38JREqlNxLi/T0r0R6yqQlFAVcM9RLRsI=
X-Received: by 2002:a05:600c:1c0e:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb68e5bb4amr237923745e9.16.1794933714168;
        Tue, 17 Nov 2026 08:41:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue, 17 Nov 2026 17:41:30 +0100
Message-ID: <20261117164132.47167-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117164132.47167-1-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
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

