Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BDE360EE5
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 22:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167275; cv=none; b=fqHPGKoKdnIus8cZ04ThxyK2pxDTcaxAjJoo3SBcxQFbhcr/YNHaaLI9uAfHLXqtcZr8u9lKnWIwJQlr8Q5Slun3X8vtTc4BgWQN4Eqtgw0Vq5WIVF1WwSv1bj8IHmGiZ0/0EtVxCz+hDyGiDe+QrxEPDhxHCYfte3rPF3Vin+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167275; c=relaxed/simple;
	bh=7y5S0ThKweBnJIFIdstxVs81WWiUsDlt//Wvk+p7bhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hB8j1jCKJNNUi8oogFJxBcVSNHHV7o2iK4IQ+bzfrsNjo+UvHiA43kwr9obC35HHm3S7oOuqyXMQHc/4O+ThCmTYf2ulIYDVRULppJLwJiY1iKgnTG70WyMUL+HdDqPaMTtXaUJJuflg8LrFY+HKs/2ZNyIiv1LWkB8vwgbNzqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzL/+23P; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzL/+23P"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so381485e9.2
        for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 15:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167271; x=1789772071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=lzL/+23PYrTF1Lq2R8wQarEYtpgacC1+nufV3i0xtQBVA1SNbrXpjkQa3un35/MXz4
         Yhj4Hl/95HYrCiAFLLsThB3xnRKi+bfz7RA7U0IxicLLhTPVTQhIF+kEIRITmBCZtK4F
         7dK0egzIfuacIckbVdjl48eBAjQbozYxiA+4s+sV63nUKC2DwHTQuLK9ZxSznzrcPJ1Z
         6icL6MZLaZaXPNsyC7kma+GXs7FbRGGTjcskInHKdIy8PRaLVykm5Z1P3E6eQSLMveQp
         ZJyFX7uBx0ZJU8kjONZgLYBOc1teGk8EwtKT8+I2hPRRENNUCI6j47mg96J6bLuyVVED
         nZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167271; x=1789772071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=tGyw8FVQZD8vTBLtgklZaF9IVAcMOPNScnQMPUo5BcACwqR/Siy+vX5ps3XrO+2JWN
         1mYkQlIF0ghYcKA/e17u+vyIXzlz9huBj56RjdOn4OxpzKhaA1mWJSuaXZ51roUIdL4G
         0Nta6py+d01PLP5Rr+DgykJH8fvHDoHmj0LQMB2DDMhTitmo9x10MJQ1FFec9pS5SU8d
         gaifbLhRmWqH0EBARJjIFkYsT/9LP8lrbxTkjuBniG0A0FvYmY4imevB85mHEMH2fE8a
         DK78rYvlNskrQC4Bvs2xmrKUUSAqtXfUdtLmzB/f83JF/DGQyVpliQLrMl3WuuL9oCb+
         k1hQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5rsmcz1cVi42azYhf84sEmzBnPXlI76fy9Qj9ucZ6R9LSfhdVskwDUukezrWUz6VJNCs=@lists.linux.dev
X-Gm-Message-State: AFuF++m20gAo70vzgodHavUmG3ioblgeN3DMo4zhCiZN8N7RkXK1cwOu
	k4bg6vA2jySt7h01iUPLPDsISHwaUHbxmVgoQFCSyfX53Vt4MK36fH80
X-Gm-Gg: AYBFou1NXilpMlfkGuZ12N1OkditMmt2iviN45nrFRn17n4q7Tx7mfZCDtnAb7Gq17d
	vyh+hKb927BBKgcBePPHYuCLLxfsXLJlgdnkMeU4I1SFDMpGHmu7loGBQ87m8pXVd7bLvodJSAx
	0D6p815N4IYUCtSIUBECOU5NmqvYjDBKwjUv+PkBsylSVGaGzI1Z3MtmMx3gfee3/Qb35zpj9fO
	wIfysxVQctOBYR1ktmVJgDhItMkDAyZD5KScWjChgN4Z7vmtcP3njiE4ifRrZXWmIyNNznv2LyR
	bJDj3J6w2+w2SM9Gwa34yxKkOkxbGQYDIKsvyqJxOor7SeswrJJP6iZg8DfcQPv+P26JT4AEbVQ
	6WX3wzdKeYZBGN3kifeGJBMNfKgZ5gkIRNo4Tgi84VkAa9BJBoaIb02n+uQ7VXxhk+uOE76RtQL
	NB2al5ENomHtOaYwSLfAWXRoJzyAJCcciDni5kITj+FJdKdg4urQA/RoPEwh6VyrU6ROOP6mlsS
	DW7dKF4ZyZPHjU9gjOBM1It6dQLSW8qCWw8hWNhseyKu49QgVjIBd3prp44I+c=
X-Received: by 2002:a05:600c:3e15:b0:49c:fc6c:be04 with SMTP id 5b1f17b1804b1-49e6cbf84abmr1600715e9.27.1789167271202;
        Fri, 11 Sep 2026 15:54:31 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:30 -0700 (PDT)
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
Subject: [PATCH net-next v21 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Sat, 12 Sep 2026 00:53:25 +0200
Message-ID: <20260911225414.225980-2-ansuelsmth@gmail.com>
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

