Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3642F3C13E0
	for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954850; cv=none; b=Z7gFPhlnAqj8+KaZXiXteFQFCehjJukpa0Qg5tkVXy4q2EKnxHfi0FYoBcUphYYcz5Y+9YfZEQ2G/gcYvdy3T2zZ9b0ha5Sg/5n4SHm9/z31Xvdy4kbSPr7WylM1TQMgg4GxoIucLPltOAhHlTWZqYCfPd8qW2NAKtvsGMru1Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954850; c=relaxed/simple;
	bh=5Bv9DWXKoe1rCy2VuILgNvXFcH8nqtMIfGBD86DCJpE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kF0zauedbfIuitrcI3TaJ50yfQUG+QI1DRI/TJlavrRxlw4SH0N5jMBE9WZdJP8Kc1iBdm5e1ixGyyEnCoSjDX1b2iXLteiaVxSydKuVPcAAXzEKUdmDH4HKsYUEesi6DG6xGOYB1aLn/DZhvFJOslLudpNg5remU0D66/8qPJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlqdQfos; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlqdQfos"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49802c418b5so32436445e9.1
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954846; x=1787559646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=UlqdQfoseePkgBCxzyPI1d+KRfCHxEWTCkMR1Xx8rIgnyQPVVjdt/URberxYAZxiiv
         9tnkDwg4T7kDfb3Zxhhins7Mt8G9XVHxbWJkISWKXEzjbYSsE5aDgWdPjTHNmaPGTXFL
         KEH3szvPYmeZn2NSLD+K8eT3rQwF3t98wPPmBclbM8ZjAPaBeCRFzXHPTEe9zDov11vx
         o2q9I4nzOEHqBFY5XaPPr2fSviq263LHanxoMrSOAid8RTwXb6KiiqcjNT5jRKaaemSZ
         uqo0mR5dlwcgvnKp6X3tBsx0CM+b3qhEtZR44r9LcX0BH9yMIEZE65LtU6p6fK32TFSd
         d+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954846; x=1787559646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mBJHZiui6LC0ZFroetycbP9gbMZ7hcwLvF2peu3oVkk=;
        b=pRDMaWs9yshO8zPbRtK0wY6+JXlDxQeGNnJIYws3E/SNnfB9cAH6sxNd7XwInOoaKE
         Zrr9RxgjmAb+kHlo+IOg61N9Oxn4+AIfJ6dD5UxHHTT4+v5uUydMAL1XUYY/Dx0CPU1D
         mCD+EGnGlM06ugI1XnX0lZLHrJUMfss2lAskSzzmnNDEyfM5EuE1sUzN86y+0yKf4mYi
         e21uYcJRzDjrNMywnN5/dmCZtxkdkWLHSE1bmiSWkIUthdFAq3D0xU6mujtd/FrM+3pF
         WOApBPiIWx9HhHZ9TDJknYak3c/m8vrw0lE9Rq/EkZnS8ma2BCTpvbH77UfQkp0lUsG8
         E7nA==
X-Forwarded-Encrypted: i=1; AHgh+RrPKM6/jSoAogL2XQEtIO3EybvMTRNfDgECm3q/a/3m2jIW7e5jRY+AuarYaL6F6Fi83AU=@lists.linux.dev
X-Gm-Message-State: AOJu0YytqlLDfd2lC0kR5FqEJRYE2a63zLa3e0cQBsE+b9X6vUrjEUPm
	p6z2dWjVSBZ8/2s3f3P8AO2mdRiYiKwzqecWAlJCE2yxg2bqyOWKqLpp
X-Gm-Gg: AR+sD10H0prWuzP8rvW50eiDcsnecBm+Xr+CQoHKPRHdAAHq8cZKFV8nxYJO0Cbj6dC
	gECyNbIep+1+8RNv6xfZHbZzg7V+5IYeFBPCJ6z67xQIknNjpaWVPfYLGFCvZHdx4WSrNiyMPWB
	kcW5Q4qkW8MaU6p981a2zAef3iUJRAXIJgRiTWL0DXYI2iXuuBugVLJ4bnP2bSMs8rDxbVX5pZb
	GUj7n/0n7MnapWI8cPCRbZ9y9mHsEspUV2WAMEyn2/31ilYsXfcZXKM7mvfPtKJZ8X4x8HrSzCt
	+NVLz/bMhKiY0xonW/b+Xmt1fZjAC6ZS7QLZGYm1/C39lPeBRCz8nsUT9XkinpeLGT8u48DW0lE
	jZJKpkx3zvxE9WoAt9j3dMr6jB8ibYVKdw3WUBhnxMr7DqE5BjqqFiP3PEdVMijBjbhSeMSD/CE
	XAwADDvHiT10rnaTOhvqWNwKg+oyAoVDRx1HEYZLBAbcT4dJitGGOD3Lg/n6tzWLq8rbBE/ND9e
	zwTDHCuPMrxTtVB6v0LBO0tvhN9damvlb29xzMhrqH10pvrpXBiGCaO
X-Received: by 2002:a7b:c5ce:0:b0:499:726c:d658 with SMTP id 5b1f17b1804b1-499879bb9e5mr253882715e9.19.1786954846434;
        Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
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
Subject: [PATCH net-next v20 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Mon, 17 Aug 2026 10:20:23 +0200
Message-ID: <20260817082034.20326-3-ansuelsmth@gmail.com>
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

