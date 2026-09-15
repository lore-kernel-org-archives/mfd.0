Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C5940F721
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475910; cv=none; b=lcryd5ueAIkut+CpKp/VY28B6Wn2c/3qrvT7NQszPMAHlfBz1s/RETEiW2asYCIh9BNTvKG16sdCdmSUMutIXUE6Isc2vxD5E9BK3vqImoAoU3vw5lD6Rp6KD5jdliWmseBkqkt3hG5pKrL1d6btP74V3hok6lgPblS70L2OBLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475910; c=relaxed/simple;
	bh=7y5S0ThKweBnJIFIdstxVs81WWiUsDlt//Wvk+p7bhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqccgsMimv/Z2thBkPF88Ycvd4Gm1BI9FXinjV6BshQ4CG+8xRxopADaB6Xm8Ove9cx8UEDq56xuaufUsyhA9NX5BYZVhAvvDrrIn5ToJL0gJvLk+IWalg4BlzajvwbwqhoqCH5gSvq3IQGhcTgxd+jYGvPZ+yWz7w6j0VbddyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PldRQLMd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PldRQLMd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so27614045e9.3
        for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 05:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475906; x=1790080706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=PldRQLMdlScydE5QFeW4fRh7oxhwGarzBm8XBAGiT+ab2WzeK9Ccer7Tzy2CNT00wE
         4BzTFxKNr67NuEiNgInIV4tlovkLYNGKoEY7a9zy4lqqD+OMxPjUSGC6SE7411pAtU5u
         sJ5vrn7JTZv98i10gTdhMJiLNjIAbf2x0/FO57RCzGYgxtr0zfKsXYsB3HQ01FxLfKlC
         HeAuh0Ej7QnArj632NQZ9V9a/MqCaix1FjraXhoTBc++MdPZCfIDx/7h8Fb1Da56qp+A
         j4BRVRs8i4x2VK+XK0cm7nANJBf+uKPJVW0bpZKDuPPM8BYyTRw3efgKPGZLeBG41dnI
         Zvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475906; x=1790080706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=HLf/aouO5pqd+zfnGehOBodeMc1Jgm+ysu/Fj9WXIZDkG0n6zCTAS19Epc/NLwRRSa
         yzlw2c2+Rcr+4qVi2+1qU8k7yN9U1Hkc7eMQYqBFu32elSznmkqRdRS2zGemoxCBgsf2
         7SpampWl1n+pND8ZGrxOuRtkrBulmXOdCkiDD7YghYuaJpNe5OQrXQDjzqgV0gDXYeOG
         0FGgb7eQixhgQBdwsu70vOx/VmrtZcV1I95mlZaRazajVRp+ywhShpQMmjhJpWEPSJ/I
         osrbVhVe+j0rj0JAR2Anta0UGUDv2WMPhFYgdoULhnSner4J8aA58XKou1MQx6eILtGX
         rGwg==
X-Forwarded-Encrypted: i=1; AKwUvBxXMEhYOD5eJf4ic4vMzkTfp8KkJz1wvP3fUCYUM3B38wO8fXeo9S8kuZ6u51dXR+NRBuY=@lists.linux.dev
X-Gm-Message-State: AFuF++ku0Bb6YEEPaP+8IUu/6SfD/0ARYyjFhtlMCz2HlBDC7uammQ5K
	X5BhPsHv97MVTE3w++HE4DlEjvcRZreTEG2RF6G7AsXoJIZq24hN4Dhf
X-Gm-Gg: AYBFou2CaZbbM/NOWlkg2m3zBZ6rmNUSofxCgB4ZG+C+4/43xQkPVGj2bPnxkVdZMnD
	pWjY2W4vtPz3803hb/AQcWQ7Vtz3W58qAR/ePXrr1PYXmr+qW1vLpntNICLPz53HyzrBq5EN9cx
	QvapnpZ/BGWTD72xMGbFrM6uzYAPqijUjN1ujIigrtfaqVp9aWPoPDFHDGLuf2VDbmZywMS644D
	Q3FWZZouuYC3SD3m20XK0/CwsmDgmBDo3zVtNG8Z8Ch5Fq2h3YNAdSqVLS+BnRCITmgfghvACd5
	ybTlpU5HBKQlBOamc5ha1+5NJ2AQHniDu+jtmySqHfPeWb2aJY0aBDaSgGITmURgRJ5nEmN8Jdh
	JdT2ys4j+S3CRuN5+PfLqb+E9hL4MdlwlsHh7Cut6l28mfZRHQhVTnoajTZvNZ+ohZVzr7pwq2S
	/GBvOzEi3CpEd/NWg1aXIUF+zB401kIn1Xyggq7k7oISYSkaa3ZZ8jTbnl2yb9WkxFj5hpqiHsH
	92QDor22fYOVeUVdcO3N/06iKePtJKqXBXywcU5hb0Iyy4/sQh1udwAXbijmeGu
X-Received: by 2002:a05:600c:3b89:b0:49c:ff3c:973f with SMTP id 5b1f17b1804b1-49e7a692d5emr106570525e9.24.1789475905719;
        Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
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
Subject: [PATCH net-next v22 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 15 Sep 2026 14:37:58 +0200
Message-ID: <20260915123812.14747-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
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

