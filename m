Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697474D9F7A
	for <mfd@lists.linux.dev>; Fri, 25 Sep 2026 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360699; cv=none; b=LyfrTsXZ1RXnifT7qXy8EUyHZtSURz+1RGej3/m8+jUi4TVUXNcbcQrdJOZ5IX0NnHSuaYQzUL0DNnnKARgbcWqIHBdRrVmnI+rRAQ2XyaZbep3F5Eui97QRpA9yYvJBIdQ3J5ZXWcg+84RsfGITq5+5+dJpb1FsRr12rTO1a6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360699; c=relaxed/simple;
	bh=/IYRt7m1hBhlgCk4AnhppCirk0sLdTYFTGd86B/RQ+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVviZHzzmgcfYXy1HGUG/jttUwIiUjWseXWJqB3cBeWuujLRLDl6ElnZIn+1e57KhewBX7FreNNIwVmj4DV45iLmYRYUL68EjihzLdTRU7lloFnohC663gSF3uRKbmysiZ734ARyRMkBqizqvC/e81tiSFAUMKcyEUyH4HyoinI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1vvSZHN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1vvSZHN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so6261785e9.3
        for <mfd@lists.linux.dev>; Fri, 25 Sep 2026 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360696; x=1790965496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=F1vvSZHN/Wgnv/1tWPui6uwJZjoUVwqpSleCSKL5eGjyr1Dxw9zbZdTNNVQ4r7foaA
         vv48wmczMTRlvjLLBf/yh+0OLkmDnCG6tHc1sVyDhnomKIuwLfIpSZuLOCKo5pHhHL8r
         KWEDLsd0qmLlzkZtdPnT+i5nWucTrXQAAqXPi3BEUCbgL/gh6JM1XOwyZgp/t60aACWd
         3l3K6IaknoXDF5y7661eXJsW2sLTHS8KLzH6IFnd3OYAx8oVvoQYbwhi7TDmIWx/xYwx
         XSUzFpZmD5an4TRp9+Gn13Vm2dB+U90p80dYvgIRthjEYUi5l1d+Ku6cgZucyAvi0MhM
         HK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360696; x=1790965496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=K2swk+dWEytZVE2QGPAAfBDaWVYzv5Wn8G8BzeWiqKpU3N2KWuQM3y3ieEURH7n3vh
         AynZF8z7bUUAaeB/3VdBjEDMl/DivLfOPfopL4GW5/vvsvtxB+I+IyJbaDd0RJG7xa4v
         7TZ71liuwUzm/3rgz4HH0wiMQ1Z9N6u1s3J9cqnt7zzVvIoAmQIVm7N3bp1buQZONszn
         Gl4PiPsUGDQZSkDJTBH6VNDRXqZBf43/PM/r3CZrDYYDVVzwTM+YlXHCk8W2kjsbd9x3
         WY4Vlo5z6wNYAau9K87ubKyHnfwv4LvYAcW203BY0jU6FeMGFrTk0zNMuW6OGE1CJmVg
         ilNA==
X-Forwarded-Encrypted: i=1; AKwUvBxN2EyiPxW8pUhLeD7eoE/Jj33n6HErH/atEF3Rmz/CQkZHn0UKf3IvY6Zl3i0aXkIiwsM=@lists.linux.dev
X-Gm-Message-State: AFuF++lNftBPOMKe7+/92oQhBIlM5wS2+6nSYQn8UtAcmsJAxY7b7RP5
	/q+zblTj7+knizj4YC1knHYL5E8VC7+S0qRFsAOlUCbCa2NjbdyNiqBg
X-Gm-Gg: AYBFou3WrTl+adFCu2zxj6VanY/OKfyGHm3/aneDf/64F/58uXz65JErHClAPDDPFYL
	tBnYiQhJCCAmf+4axp28pwRGTOu8ZB/kVAUkG4EndAwIYizSCOjIcl/bNqwLPh35QcBgERkgWVy
	yy+wytt7fb8LF2YcLZ+V8+MTIhZCaQ3N2PCXqPWic7gQ6NQJPcpqCZyyb0GtdQuuVMfB8gBR+tU
	fGts02NS5+qz4XNLoPYGA1YnMLnMFK8/hv9YH3FpQ/3dWQvBa6+tZIk/yvVykHnRI3FkDI/mNgl
	eM1WdgiKYWe7Jilg7UPJrw633rJcU7wPbs4eL8biob/wBYOJ5W6WDE9SKXhsXXkGlwx6L67tM+W
	uQVKncXxE+AwIZNR4QAKNsrNchleFgEAXYnV4Iywe1nm6i7OpXlMUawddAjtYbX0WDLvz7m9wWh
	IespNnyVJaMHmFWzwiG5B95f7XKX0dC5/IwG+RuBMiAuEzxnDhYO2j0PhAv+KQhUrJNpEULgkzf
	rUwlUbckgPme4HTVkagWvIE9en+A/uMDMVk2BioTYMqclErso7vXBhpJb62hpsN
X-Received: by 2002:a05:600c:6994:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-49fe66e6468mr115600995e9.20.1790360695684;
        Fri, 25 Sep 2026 11:24:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:24:53 -0700 (PDT)
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
Subject: [PATCH net-next v23 2/9] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Fri, 25 Sep 2026 20:24:24 +0200
Message-ID: <20260925182435.21207-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
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

