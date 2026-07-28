Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D33368B6
	for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 15:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253751; cv=none; b=s3g0ea3CfPyBNraQSNrG832hT0arrAjOIdf+k03ZGTjQ6k4k89uBXDurFpkEavOZ4eXcg1dpnqN021OY6Thuo/6WHJpV3KVZ900JdXsvRZRcb8DiVzXhxvLxZ/HeFJunM04PgcnSI3kSqMN/N0VX2Y7Bel3/vQLTkjrj6noGHw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253751; c=relaxed/simple;
	bh=5Bv9DWXKoe1rCy2VuILgNvXFcH8nqtMIfGBD86DCJpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8wdqwJk9DMGnNVCyYrEnA2rwCnseTeeGXNk9mpyaVc2iB/HA2ez+h0DTIhR0LYBNMxwPppcj/YhtNUMeeIkrSXQ98X8vsVE0OUQMINQcD24uNvirozYZdHpjiJd9kaDwOa1JqArVJvfddlXUYjIjRQqDOlKPYAMyXb3yWMpEP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUklZMEv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUklZMEv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495635a85d2so15185e9.0
        for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253748; x=1785858548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=JUklZMEv8jgDTDrECKlVgpo3CRq6UUXwFNP20hORtIGqf5eucaXfAzLWIti6YxIS28
         cNli5yeZcH0vpVkQ80w/VQuSl8Hm+iOLlkre9gBN23gFGKiDiTwiZtd9wGPU4VWKv/Vz
         Cl6q1Tc0rQv8DpAUOjG2yisD1UVUQh7a31amP3UTlpVXcbhlbXNUtShw1kKooC0e80Qf
         bHdoLmZ5X7fSgBvQWYQ56bqRLdaQJ33LbgliXF7Qs4tkrn0xiquVhmoui5xZpH06rsnh
         B9yMT9KT3M+FdUgDquzracBTK7Tf9Xe+rIRLbFS+fwXggu2Ohc+GQlMWbimB7sPuaBY1
         2nJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253748; x=1785858548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=ovzveQ3JuzlSWzE39nP0S5qgs7aJ3eLPIcrytcIR8JFy56sMAubAFwShcgaEy0l9RH
         XQOvt4ElcBHHfEkha1aYxrUnbt6h8gY9Uii8XOZhhcyJxrC9Z4qED/Kd6iDxJoSnyt7r
         cUXUrMi8WjN+iBD7H/WFT18No3uuXBciO2m1QQWgdZrKte9/oXT24e6wP5Io3Uh+SsfC
         6xKdmbyYF0uA899fYIeoMgvk6WNDr7qY26G8YcoDGXI2MfO2SorMO4+cNp8cFB0WcyoC
         0UXVZvnbPN62a32/Y3TfgtgkmA2uFLo+zCoTIx3rXJ1C9I+tKLU/teqNFUBaDPXugJBW
         VbsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHWht7voYVh7bni+HzI7M2piSfeidjEcTqoFk/u6+nBUsRHftpyjKHDDCj4rjn7gkl7qc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywujthi7SKl01RYSF5ry+xiOz+Iv0GrmfxNYpF5wfdjssgF4+FB
	gg89ejjzO3LqBkQ4doOtSZIgvtL/wLe2O0SSir/mxJPgD1v7isututPh
X-Gm-Gg: AR+sD11FA5ohr2um6gUH9Fgek8lA/mRcPvYPfkzhRPowMGHAvx/rYs8zoooy9qtTfxT
	55vxkbVqHm9h/T3XG9ccdbIrxtVDifl6yxc2eOdUakKS2tAVdZvInRLkF09A+hRg6aF3iAvPig9
	+7X9RrH9F9NBCCaoGlWB+YNnyceut8t41DbSnwOO57ETsnVVy3V6doCfhsgS9QOab9fOk5nG8pp
	6O0+cvm16LN9oc7H2w20o7Ht/BsWG9sSgwrLGloZuudFyWXviNcRkOlHyBwUb06arjNYTijhxBM
	xWuTWaRBJ0cpBzqHGp9WTTIjdeYBCVW0eJ9M85vCxg/qHmWUff+6PAZfru4zJJKGseDEOz9MBJX
	KwYN/SCra2x0pX13T421gVkwCgtvRmd1HH482LnWhhFntTZZhD5abhSvSkKp62zsk2MyF0CV+Jh
	/T59ZEEqfnKLBUJyr9bg==
X-Received: by 2002:a05:600c:3e18:b0:495:71fc:3a64 with SMTP id 5b1f17b1804b1-496c6569058mr33783105e9.25.1785253747906;
        Tue, 28 Jul 2026 08:49:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:07 -0700 (PDT)
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
Subject: [PATCH net-next v19 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 28 Jul 2026 17:48:29 +0200
Message-ID: <20260728154846.1828945-3-ansuelsmth@gmail.com>
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

