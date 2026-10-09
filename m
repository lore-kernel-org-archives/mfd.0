Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5CE4DD3D6
	for <mfd@lists.linux.dev>; Fri,  9 Oct 2026 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562276; cv=none; b=m5HlCuj0UQIbmodWgfPOgsbESXm7lf0jE9dWtmmj38MJpAsioNLsIbGIOjbNP+8CqWU0AmC6lci77AW2ube/vr//2e28IjuOiWuuZ0r+HE1E2BFMoDoC8THlClb9U5nycG4bo33SpBkXwc0GjwaGbGw/tF1mw+By6HgoMlYnfGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562276; c=relaxed/simple;
	bh=eGGtJucMub/H5IDPYhp85xFBOadbNNPXVb/tk0RokT4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pW9KqKqaUFu9Y8emlz04rFiFJMLRh2AhsPjcttr0rALttSb9/vHrA6iEdYH9CY5WGOEj0YgAGIs9cqzbJXzeVDD9HQZYgc7jQtQQFU6PyXNsdkpqMmKSay0E0l0+2wd/6kCNyWaNuBEy7IK4UQNLU0QdZfmbC0iKmWB+J2VA/58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SC7KPqLF; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SC7KPqLF"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af27fe287so3234404f8f.0
        for <mfd@lists.linux.dev>; Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562273; x=1792167073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=SC7KPqLFrFe29YlvowCkso4es3b6C3sebrGG/AuhjBLIBrrmS9IRukCiktZ0uk3Qae
         fLGsSekakW4/HGr1CUWXOuV00mRFHLdshhAYptwtp3zK8EIS0OLFAtUvhUbol9KBXCMT
         LyfKwxzD1M/rgBVTeglCliVAZbEvEip0NDklGzEPa04O9v4uMn8en+dpQJY+8RoXPjh/
         SbAUx/3evj+WFMlLidbH+3zplk3Izk1lJ12/odnNi7D7YHxUm9X7WR/xs423tRvfI/oI
         jcS2kE+dxipDvQdrBdMg0C4ZGSp50KKsImUl01hg8MUG/kGux7Ounu7/T8dCNrkMI2KI
         /o8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562273; x=1792167073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=xujn1mNqOKBkTAyGWRNjjE2r3gGUv2gIOGkQjuRO2I+YM8+6cWhzz3GGgTa32SxSpb
         RUDgkZIzb1CKiH1BcaFyyw9xngOx5VxHPkBbNNeoKfJoxv7S6Aj84ypSGdl0ID7Alf05
         3CENQNOdaqIzzr6nJ/zxnCVSEvkUd9B2OyI0SNKqJDqFWPcAQTNbfgsZlxW26DOxDuxn
         yhzxmnWAYHjv+q19j1J/7Kc93btt3U4ozNaA7BQfxDFgR/mJE0VD06eVY3/E3NitoCta
         g5Pnd3DswAQH/BgHd8uS0bE6MiR11Y2ldRHPX/7nKuceU54hkfvvk9QX5I6b1aLmr1UF
         r3Fg==
X-Forwarded-Encrypted: i=1; AKwUvBwxvh1EwlSPH6B8K2qmzThB7qqw11bfzZYIh42Wmj6Ytp3adtDwDBBfpNXcGhgoGTyRkDA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJgBqCFUduIhsp2BbdgmlgkmCCoqe3ok4Ov66K5UvF+bREW+HA/
	RsjKcXRgONtMBExvcSWu6XcL7u53AUsQJDXdF6/6IgZCrk0rSzQquxsu
X-Gm-Gg: AYBFou1OzlEJiob8xUTlEjEnDFywskEm8/Ha+5Zw9h0JS4q90SySvp5t8UozQdMCW1X
	f92gIp7tAYl/BvLiMVKiY9gSmnoTK/cl56nYmcUWO2S61X6hrvkRCHWm9W6Uil+4rWYjVzbYpVs
	zQc7FvQJYkAC3MPZMdlPoneX4wRExcvWDc/3P9BA9EJ5XsgfAAkVLtUqZDQ9nD6InoU8ATT+YGH
	X++nfbbm+B34+0hcVWLUjzpbr/0ZXCIjwxY/B7d/EuVVZYpfC307OQ2Oe4l/kSoIsqBWgZAHtCw
	FDi2NUEDTatP0yWUZx2hTCBv6Iq8AcxM8qd3vnr6STBEwgMk0ZkU/WYUSaGSdLYL5S0uPwKYZoj
	GUQ6qpgscbhM0Ixzp0QPsC/A0ULJnlPcLEciC1QhAJfyOTrfU8AHezcw5hruWNQT4SWsPFX2eKy
	b4VC50QWvx/Wp8ErLLEfImO41M4B5unZHCHckstTRVVemGhdjJh5e2BLqbshBioG8hPGpEaLUi3
	ozZnYxOvLvIG1LwvQuN76hDCQRwQeJR7V/DrVNCOoEfredUBrAifTlsq1GK9Owndny78pVBRt6f
	o7sTG8iRPC2pig2NdQ==
X-Received: by 2002:adf:e007:0:20b0:48c:656a:f36c with SMTP id ffacd0b85a97d-48dba77cefbmr3915875f8f.3.1791562272816;
        Fri, 09 Oct 2026 09:11:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:12 -0700 (PDT)
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
Subject: [PATCH net-next v25 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Fri,  9 Oct 2026 18:10:46 +0200
Message-ID: <20261009161102.38961-2-ansuelsmth@gmail.com>
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
2.55.0

