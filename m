Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AE34C6536
	for <mfd@lists.linux.dev>; Fri, 25 Sep 2026 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360696; cv=none; b=gv8QzAtwnjVNiZpaGv9CbmM7RrhFn24asxJxb1MsguaHB4UC/oKkdfcN6hyHDmbULVX0L6+1VBH9od6z8XvXN5wbWwE2KZ9tdYBcEjEHNdn9w8gvyH/DshNccpp+Pj5ABPqWNmq9UBIRMKpwiarbVbyDPhyEdgzBPljOFzL4UHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360696; c=relaxed/simple;
	bh=eGGtJucMub/H5IDPYhp85xFBOadbNNPXVb/tk0RokT4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2J2zeRXHsHlvBhJa56IKJ3ugk5LZeY7sdKx73URazUeEax1SwSgHChsQinIqJDuVFzwAbiwj7wlBVaC9qQd9B4Io0Pi1Hj1ShsrVQVr4fBSMiL0CsEY+Yk6Mh1dUdfheNyP9vFYwCy4I2iOkIpnQbBYKn4XtWWS2GbSa61lunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0ncPyau; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0ncPyau"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so4393895e9.1
        for <mfd@lists.linux.dev>; Fri, 25 Sep 2026 11:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360692; x=1790965492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=i0ncPyaua48sPiyBa2hSRCWkoezqiqWStvuQpuJt69IMBscYYLI4tB7nvFMGf6b/6Y
         L9gwLFkvtoCHnT03oZH2Kq1C+ZZTKrozZn0uxNeA1/oEHaJfc1rX4DCDvmSWizhWJ0pb
         Buze6CRO/TM+8eGUG+ulBFcDiopc0uJkwN1FI3tJd0PjtObh9TsehsxUEMWqPtYn5nHW
         LXX1NKmLvqgzTYV4hF0Gu1JD0FMwzM0SLV62erGr63iWwHCA+agBO+ktWxSr9dINu+XF
         djSZl6+yR6oZPi71/d2DDcslTcPtza0e5vOGtBr14W5ffz9bP8d+Gu+jYL2bzwMoLusI
         ay8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360692; x=1790965492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=Uch7nw6FndVrLsfd1dJ1wBD16VTg3ulalJBsNCzSS1l6U1wnrqOtTNOhi938ujwFVA
         10TtzicH4g0Gk7zgDu8DIvdcEo+6OFJ8eG/fQ1anjqCaniFnkjij5LINI5wKIsdoP6PM
         LyIV5bnv81xE9W2CaCzUVJjP8ZAeObFZ3u6Wq8wcjfmURtLFeOkdaNxsMCFSCKfSueJp
         Pnn0d/qeuf2FqWwKcs6v2Uq4xW3UQqWS0ohT3nT3XliRQt7T8vqvYCleLVQMUCg0jeAQ
         Liv71a+GRHNESwKrbuhcYu0b3hzzf3UO0D6YqcVJ9qLk0c/9Odthn0VG3oGbfTvSi/is
         wEOA==
X-Forwarded-Encrypted: i=1; AKwUvBweAUCv5gmOCd2ObJECr9nXw5sS4OR6fU7dtzaGLJ2yNi5ePYTdG9kZ2cZoFdNB/q7DMgE=@lists.linux.dev
X-Gm-Message-State: AFuF++ntpqdtQXO75JN6HrengNFmZcaz67AtEBJggTt2jy90WpigCDVp
	ZTKOUA+zIkRgqk4KniuDDKSaaeQBJDkFhcUEVHZ+QaN6sdjcSd38zZH0
X-Gm-Gg: AYBFou3icM0zmSWIpRCEfjjd7gzoET7imQNzUjhpbOEIxipOeMT6X9urDD46lD+WQyt
	JaNaESjebtj2bY9k1IQdCV3Bf/RFGWGdDIPwSECO9hQmElr+IgeoOtPRJW3ilaZPseoUNE3ORQg
	35BAVlQecy5gxleuuV0dhF5JFFzxsh/Z0qTstjwFS3Qn8s+8Kbo3Q7qHwrRd/g0lYsGr/1s/lQW
	wK4p8/8F8TbbADNIaUYiGhUZc3yoC337/jdJGMa231YbHawLk/EeoRBHWSms3rzbLVrpdIISV0g
	m5JpQuh3J+EpNIsepdQp5hjr+hSsv/KDBEkKoIKGOOnWWng2uAZxYeFlm5ofhI+QeiHht3qPJis
	jVUR+4NDtFUEMNeu3mxL4aS0J4znaXUdHkFjGg3BW+i0re0P6L4Q1BW4Ah4BJdpi0a5UBZ5hVpL
	njMZNekmmKUL41CHNL924a0Io5IAPg6zK9YUMcvzucHjHvfEPTwBIHUjrtyIRWtSYP8/sZ+UrOL
	k1SKqHeJ8wukGf20FSuCpIXzMKBrhWAn/Rhb77vvskzLsgA31yeBAmLm6QS09kdYw==
X-Received: by 2002:a05:600c:630f:b0:49f:d69a:1a04 with SMTP id 5b1f17b1804b1-49fe6704682mr112960035e9.16.1790360691982;
        Fri, 25 Sep 2026 11:24:51 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:24:51 -0700 (PDT)
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
Subject: [PATCH net-next v23 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Fri, 25 Sep 2026 20:24:23 +0200
Message-ID: <20260925182435.21207-2-ansuelsmth@gmail.com>
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

