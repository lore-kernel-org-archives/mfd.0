Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92113E0C5C
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 22:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167277; cv=none; b=SjBj3eUQ4gMnHSQKBHT5M/9Hm/+8B6chj5cnuEgZ4WzyFDqfcShYx6A1SvRyLduIcPze/Vxp6CJv+zCnuFF/l1TkBoLtH0QIyKMVxuZt6u/3KPC3jwPYXKNeJnIhDtOJw5Zox8qos6Ec8zuWs7Ek4y9mp2GmfveQ24jDHdXBmEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167277; c=relaxed/simple;
	bh=5Bv9DWXKoe1rCy2VuILgNvXFcH8nqtMIfGBD86DCJpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfH3aeN+Jh4uk00SSbJFtlTU9rF09WWrdj/g/iIrUJLDl/HtBZnQquFZQev9spHM/Vbc/oelaptQrwKn4DTINWVd3GeKPsba+rnvwVYqh8x1FgWyhKo2GyB/O5pi1lAzDjq4XmSm/xwl+FxoyuwQZhdqiTZPRjUwdmJLQYyUG4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QS1ZEkbS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QS1ZEkbS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so182342f8f.2
        for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 15:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167274; x=1789772074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=QS1ZEkbSt9KguRM6LOHxsN9O6MIvILTKyR5wvIKnF/NQHrrfB0HEkxwECEblgDf0DK
         gmK4ogvuAibWqlKaEXhpsbHpa1wCUauwei00kXVsaRUXCN0CO3kAuP4ZXfVviI6CpfHc
         u4I0wSGdQ8lJ/IJ+MPPgjJhsuX/K14sB1Sl1uomVfo24axvkXMhqDA2iXN+lGWiluFij
         iEO5hX0rIekkppsiZjq/Bd0Ys56VA9LdLsckxnSR7n877wVIrryPJWmZzL9/e+DhvUaJ
         riMzDpd4B8PCsEN6BPRZ2NgRcjmS9T2KDXtAHwxLc7i38/okvKHwX2rIZU/mYNpjRwjm
         W3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167274; x=1789772074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=Unf3pf4jzWRQMNK2QBhSHoVQRHGJo3wDiwwJtm5X0y8/yMsBAwCxAdJBiGwclFDL3K
         Jkv3bkW5CYv+OxH1ZlNF98e5g4ONub1TcnOkxyd11UXrPkqIJ7Unk2KuXiZjPpGiiEe/
         IPTxA8yBkBhZvzOyQ1ODJF1rLLGyTXTPMTBTFr95dRM/rJkPmD4wywuCPXuHWulV28v8
         8oPXz44/q5/x9lmPEtnUhAobZn4usHEY4FpEb9oDIxEHiTb7Xf1IkGr8S+pEtaxPsZ+H
         gtBDxoNTiFTrKJiUw8UvApWpCvMun6J3uOlRZIrRwwXyHq+nUcQJfWPLFOj35iBnUSzr
         SeMg==
X-Forwarded-Encrypted: i=1; AKwUvBxIxqnGO/DivcMHlau6IsZFa8QaqxNkn65y+3HrUFQ7ud457R2eLBA0OkiNr3yr9PJ/CZc=@lists.linux.dev
X-Gm-Message-State: AFuF++nbxO69zqsVkl2+vWHdB5PDgKVMLXpZU0zcbKH7hEHkU0227OSg
	XLbC+yO2AgzG32MwuYKYeFI1fqGvFHqGCQJ5rH2sBYk/G2mQsXq6jKJT
X-Gm-Gg: AYBFou0i51Q0Ia1FYsvt2Q5m0rIkSMEiZir0WQXx4lXE5AGPRyaD1T+Q+2NiA1x5BDR
	VmZTZHBaFyoe24sEy5j0pjqFm+5+Ibw5gibuCApKLAfTJUNEimCYf0HQyyr1lJ0JXW8KkvxahMW
	GFpZrpvAZLXS+gMxOoJWvPv8571BKliFkFxn/+MtCNhga/9iANrR5q0P7NfSKPX/v+E/ebMdIuj
	Qe6ff1/o6RWsTx77Tf3xLcjraEXmUXXIBH5Cbbrfha78s3azKakIGmLjC84OCJl8UdGaivVzzvm
	7d8WjUa3gJpFRsrvJy94ZBbaV54N+VERH/u/W8SbFbv2f2wNeBHOdYEZRTmnlfYQm7xtTWtnsgM
	FLUBh9QnoD/E84FLzXzBqIebB7ozRoto9r2J8EROlH31AovGkLv9fz7sr5iS6gZ2dr+2UCU3HcL
	FHoznL7JUwsIKS5btmHa1Wps7fGqMu11bWP6bZvd9Y4Ub3VSih/BMBoU8eFgkfJItnobmiIKeBH
	GrTsluoILYjX8uiFf3+cpPJlrm5LnzXmrJDY7Qcjz6GEW90B9fRKCcvaU1CaSI=
X-Received: by 2002:a05:600c:3494:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49e619aab42mr168024575e9.9.1789167274003;
        Fri, 11 Sep 2026 15:54:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:33 -0700 (PDT)
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
Subject: [PATCH net-next v21 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Sat, 12 Sep 2026 00:53:26 +0200
Message-ID: <20260911225414.225980-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.53.0

