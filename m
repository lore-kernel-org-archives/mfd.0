Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B7D331202
	for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253748; cv=none; b=d5T/dIqBcaa2fkEgwBnKID9e5Wstqm3WYh7QbLT1JGV4HeQVwfJCItS45QcfgEk6r02bfMsAVShxWeC5om5Lf9t8xa+R3tevZ3M1rzJbU89vHnPYVc3ofvX/cyfGC3pc4DOIWSWqw6uy8+pXOjN1qgxvvugKvqtjm5QXYAJ8EPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253748; c=relaxed/simple;
	bh=5Sm6KIJfhjcCGEhvCw+IXc43CVf5mJrLFBXr/fZhCvY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dc4hM4lma+MjuwMZVzUw/ujEP9DetTYQG8RvcqJyZ4y4ghG75JFghdkRp7o/ykQLGI67xfKNSd612t/TvBzY8bELbKp2XjpX6KMQncFACO+3VjoWDA54Xn9ttRGXvzgV7/3A5mf3gT2yVebJE3CB2HyDGqxeI0DhEySlRsh2YIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+D6lBkd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+D6lBkd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so24224f8f.0
        for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253745; x=1785858545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PFKmpoYj/DOWR15QwgbvHgBV41qd6U9IB+q4KUeTZyY=;
        b=W+D6lBkdn3FEC8MeszkMXoAxRkom6k/a6Lw6jMI7W/8/bSP7qyjG1ZSArhpekybs+2
         o9PIyQlGEmRSrW7l20TJF4A2Evubv1Ym9bVkdYBbqEdxSeYmMC9TQniuMI/8tIR46GVa
         e0ovRPjFoobPKP1/er+uwxWsGtK5v8i1dC9qeE8WKOr5L+CcnPky/jzUYWRA2BEnnp8l
         07J5tqqrxriPq80Kac1YHe4TA5l6U95ZrXHE+6HioLju62hf2JJpAlx42pQn1V3MDQkU
         loTT0MM2j4NZZCRsOU0+K3q6NACIWZ4iVhSdf+Tlx5gSdNJBdaGifECmkt/rc1ehKNRB
         Y2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253745; x=1785858545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PFKmpoYj/DOWR15QwgbvHgBV41qd6U9IB+q4KUeTZyY=;
        b=EPVL47Iy+bxzhKyPr3aFfzDJhGvlQP8hnHFV4T52Trii50z8NPcxtZ+0ojllalYOKn
         Ry8Skn8oLq1BafTwlVKSiuwCBD6qSnh78X9AuFl6epEEcrRqIbgJrlsLVB9fO9DG+JOH
         XXASX0FJWIexhCkJN9GLYI6EzbFzv3P6aGSYKKZlV7q9zIyljQ0I9MC5xHWIw80SDfjR
         xYr+t6XUoIj/2SBcpFByAXOrEvltgJICKmmXcTf3Yg8U6Swr1hS6Ywkb6sdUoBfWbnCm
         EbASE1wGZ+DKgPJLEIcV5Qa/to+FAFZQP0IypjPvnMFOOKB+3fQcd1Si0JWIncNwl1a6
         qQYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnKs2pwPnzZFrMJxklqwEvV4co5xVWF6Ky7XGOo/AdEK75XNSPCTrjtMg+/dlP9uG7WsE=@lists.linux.dev
X-Gm-Message-State: AOJu0YypV7HggIVmVFHCsc5Sd2aFF4uWVnxFT1V1+7k+cHNkDCrvc3GS
	AATQiYW/OM4XEudWyt/ZMWrHvIYFE2zIZk5sVMp/6nUxb9gdszyaSFT5
X-Gm-Gg: AR+sD12LOKasKVIZ0I8MrQDUbmX2g7xMB/evX6t5QFErEr5Vozgd29ZceUALYRUGzpC
	T9ogN/LbTA1G4U6InjpnbjPAW1KWcfnzuKG+T9OdeChuYIIqI7Aaf7BnnEwDSc/31Te6MDCbgzD
	iT8Lrn+fOgviURCoIfZBbhLCO1gvWQBwitUWNmETm5WPYAEz1MLyZV2VxwmyS8l7FGjnQIFxUZ+
	FOkNWdZkkLul2iJ2Y8OMGkDVN2Zn3QQSzwmkrhUq947oxFo3QOnrEY0AJj2Po135i6vYF6vKuCL
	aqTxnmBa2bm7odBxZ3uRYJdsiBX8yXgUmWs6UpWqhsKQM+AEgZHvyUK9S7PfATLi6VORUZEg9Qx
	2RnFOLMW2b9vXMm1C0dUr5aiRzHEzwGpa8YjKkCtCJprfIYqR/XmW4m1p7stnP/fqpVgqofkApL
	w/jadq/Ppo8+xCguIHZQ==
X-Received: by 2002:a05:600c:3b85:b0:495:6936:120e with SMTP id 5b1f17b1804b1-496c65a5f06mr34662995e9.39.1785253744771;
        Tue, 28 Jul 2026 08:49:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:04 -0700 (PDT)
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
Subject: [PATCH net-next v19 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 28 Jul 2026 17:48:28 +0200
Message-ID: <20260728154846.1828945-2-ansuelsmth@gmail.com>
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

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.53.0

