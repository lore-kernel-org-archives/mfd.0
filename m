Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E264E13EA
	for <mfd@lists.linux.dev>; Fri,  9 Oct 2026 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562278; cv=none; b=TjnpB9W0lE/bo7pkaRAxGq8tFTHey/y79lGNIS+rlodQod7inbnbVHuI2FIeP+uiyqP+k3KPTRZwpOVYnaE6JQIl2QzGxv1JpGn88J6808G4Gw50oRHZbclV8sHhE4I/jujF+zyDJVzvphk0DXMVboHMvUk9CNlH8UuEuOPb5B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562278; c=relaxed/simple;
	bh=/IYRt7m1hBhlgCk4AnhppCirk0sLdTYFTGd86B/RQ+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZOHGmiuSxLcbE7w7/1LkXLY7DPBeFmdqGNR35YqfTQK1w/iM0pU+A14GDybsC9GuBsUJa/KCQuctGzyGagKddJhTj+qwHiL9WGdAMgF+ibgVu0bR3fI4lj4PUud73N8VciT1k2S7T1P61d9pezy1Pt3fJnUgfMBMCbto/Ybuac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0P3Ky0s; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0P3Ky0s"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so142455e9.1
        for <mfd@lists.linux.dev>; Fri, 09 Oct 2026 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562275; x=1792167075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=i0P3Ky0spUdUaTirEjqlX/8lEN/ayxhGGGIccG6m3RbNvrmHPwSNJlSIJAWOORZ9WD
         iQjvYyL9HuA4eu9mVj3jCjQwafwWXmCSsBWkptFJ6jxT/EPDhmKMmUJtdLGngNl7TVtJ
         OdWq8TdiJb277xNokXmj9estWKFvlH3vbyJXUCnn1+V+p8/P3ULedmGeWTQnvZq13NxN
         fMd4h0gxYZ81A6N5hwjkreZvP8QEhv5qn3wfIbxnlEgsOxxATIKQmDK0iyNKExexu3Td
         6N/wKqacZ3UaBD4AX0JRm39aMclCX0cBkbaamLj3JVcsM8vCE9dSuG/K0+SixRrwgig2
         b4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562275; x=1792167075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=D+QyIvV7N+5WA0uuZIinHPJ8lt4Zzz6pvM+9WgAhAUtdo4FI6HHH/Q4B+K1UhucrYO
         W9dbqMgtPH7gX35orG5e+XkbJ15ojmQQ3fcQ+wSyqz8YPLQ0aJGyyhya80R+0cSB4ryu
         VC6pPH/Hr0LslSsSWXPaI3ybJ2QBISto7u//+ZGThnhdE5OqOdGQM1LvhmE3pwDXir+c
         fMD4hGCP3Es5IUFY136qUlNK9hZR9Tspfy3aag82rQSTMmmNZEaY1q5wXH5jRrmtyUlO
         W/HEQgxk8RYC8gGZF25IojVoJklNWOTpD4DcgKHHMcWWoA6dJRx5L3esy9xv27huT14T
         8NTA==
X-Forwarded-Encrypted: i=1; AKwUvBwGGCjtlmzkm3WcnN/Z0bTTCVQ3uAYR3TDpRNoh5uTh51TGjtkJZU/2+Qeagtlp9/+zbB8=@lists.linux.dev
X-Gm-Message-State: AFuF++mY4/MAFI8uKMvndOKxPf/FuqwS6QWF66Uw4aC77ZJZtjhgN5Li
	Vptst9vY7EuQDB0Zz/CAMt/GV01oxJZln9nUPshfxz1Ppx9SFVRXT3uN
X-Gm-Gg: AYBFou2hx7sKfWPkYWtVGoq1fwvmWPoqoSlZgjAjlMfKfJnOimR/SO6xHaDRdc58sE5
	hD13ycxQFjYCDCpXGcZ0yeE6PHd+kz4RTE4vcnSx7DHl+ta8uD+5cimdn/YFiaUWQuQqh6eTYnd
	1eFT1AAwR+06+v3tbut80rWYD6RN+Xmu5hdu6lAfPf49dJ4gBn3jTZNkzAztAlwT4H+O/QGFLMI
	6YyIUnTCPqKRgECvZVa16VTfRG9Fhh99rIRLarcO10kkCJU2x+bAj/CVl0PwVBgIyPOIIgM2m1H
	vi8a2rSQw7zAib3lch6g1dhTp2NcbpRoDWHzYl9yxqQeG8J1b8mkt/M+ytOhUvK6xQ0jLcPchSh
	+E+YCEmeR8Vg0bMXAba5j8hLFspmMQiP/1L+fU1/pRJRSeRsst5a5HzNVwF04iscOFg4Flu1je6
	LNDy9Tr0FOVxJ8+7maQg8LBvYM+WoujcfJbePFzczgAqjeYiDAAAjKW8btCZxV1LffxZuOT7nHw
	0h81fDwLnUyxnaMnW9ugWEPqPvtwSoGsDQiEriaCteIyVckbhhxBVMYT0gHl22kj0m4yWDdYazP
	9lzYIYECY2xGT6S88g==
X-Received: by 2002:a05:600c:37cc:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a18e44396cmr51955465e9.2.1791562274820;
        Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
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
Subject: [PATCH net-next v25 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Fri,  9 Oct 2026 18:10:47 +0200
Message-ID: <20261009161102.38961-3-ansuelsmth@gmail.com>
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
2.55.0

