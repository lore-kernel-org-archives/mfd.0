Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933714;
	b=p7PdfufGDNmSn925RbhJa+wOhNHSFjtSt1vKPmYzMmiJbfZFpJ+2DV2h6pKSr0BLf0z7
	 uYa/1tk/bRBfu6EUOQTeMnKF9orbFgzmwLQlkMKLgaTl6jVZpxNNKgEofj9wn+e54yJlQ
	 B5QzBZzHlbd9gAyK7MKggU1GGotEi1ywblKwSEwOLIZ0NGo1CejJ+VAlQo4RZqTHvaOsK
	 7kqJdAFTeea0QGrAliUt9QRHE0g3gG1Q/Bg3LlSGSS+7d/092U2vG+oQzwq1udq5YuJuJ
	 1D7GlVmeKCKNRjjzBTA4yTavowi+qRM2mI+ovLC6FeYFxR2aeJPsOvzKYqeFOoTnmgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
	b=0SlKcZSt5nfiGqD069aevLHp14BMW0Jk3aYOLwHjxDOlf24N2BWPmum9l49Nr5OEJyVF
	 bI0bk8PQrmN0waGYtdvun7fHC6DBUxPTGZUrDV3FNvQrB9dVi7UkOG9CwZ08g1JT1j07w
	 6e9uVu61UxxCvplMY6yVchtvnF53EOm5wJBU9BGWVoOcB+pZaldWDaMLjJ1kKDXENp1C+
	 mal6oMP6GKk6tSACNJtVF0SXM+RWZNYZHH6VrTTl5H3kqzFQYrVmuseC01XEJka5rX1IL
	 LnXy4Z5Lbw5h1RRLDUuzFVMmqEFcOreR0Zg0tVHtwvcpz/cV7Ge4nUUgDRqGZ/5MNTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=co3Cg8QL;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776C606A882
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 16:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7776C606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=co3Cg8QL
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so1055475e9.1
        for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933713; x=1795538513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=co3Cg8QLb7d3jeRiL1c11Qsa2hdbuiH/DfedWpvfFe/lvgTYNiOiED1hBaWD2Fcaku
         IhghnY32To9q7f7csmDnUW+qxYeYjODFeURd0FmeeKwc8Tm+3CYLXTIUknYiOYJrH0e5
         QnI0Ao6ZOfSkhZp6q4+YCgb1TyTMldzPMZObKuBx8n4dCxOaxQzLSgRzLOJftS/Edif5
         z1iPq1Um0aqu7jLN/kW5TvmPOGOuudqQE3srciR/rrV19/F4mDCTQ+xnO3drAsFzhUCm
         GXHqtfNESOT1LAIa/jozoYkIthS26MbhMnUBovI5BlUjnq3Qtp3VKGOeep4+ka5+6FlR
         z/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933713; x=1795538513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=lG+iVYW2LWPj2Y4Dqsznuq2s8iNnoGNH9y39/AT3GeNMYwwLBYcMnCsRQFg9wFxmoF
         J4y+j1xMVYdgBRrhzdLxvtSux/Nltx8yMl8B99ih+r5z5isp7tTYjKRUJ5tjKJ0eCiBx
         tmZxKlvq/mHRAlWxNMRAIhwmZDeYGL0WzWnN04YRw/jaMphhdGx9sG3rj6QqiZ4Clt6o
         xocBAiJNLFmB7KkmQcHgfD1UfD9NVVxQwlCMsM56kSO6cdUDgUOqmcf5PN+rNMnrMsJ3
         YpSwovOGiBG6Dw12JOdaDiH5qIjR8/ygJkVbQQ5lnB7M2glV2z9p1qlc7OZQafIrtZdg
         8X2Q==
X-Forwarded-Encrypted: i=1; AL+hErHOGrFPHyeTJF2pP3nVJv1ihnxGhs1j/Hd0z7wKI+ej39sNVGoahpdeJDcmD9ftTsHLo/o=@lists.linux.dev
X-Gm-Message-State: APuU4Z9+ahYPmtdAkZiDsyEX3KMKFbzJ/lR/x3wyDTVCNeuHsk6CLr9y
	sMuuc4G5/e0Kh1pAKHtdRLIRc8vdIEuZGFbwJUOrqZZaRLGnLWmlhmMD
X-Gm-Gg: AYBFou0vzxWDaKbiQ4UfFZ7SqAyUw5I8hD6+kTFxZOgVooGA2avXgoIAa0ymRCLKOqG
	HhTvHBp9UQDX3OQgJKz0Mk4Z6xyF/TTnXryqcHYvQkEft1YrNUrCnbiBk5JILrJ0WVZQEICNEgk
	RZpmKLaJo9p12ji5JibJvXbvuAxhTuxI8kN3p2kqBul+9gv8dmK486H+jnAy2wCT9fhQOeXB2ND
	JrbqiWkVLBBIlcy0EJGzKsWSPEyeibusWm4OgD2SvFlE2T65HndPAzipWNSjpHIQemw2CYe2a8z
	MLzaQDvKNZLI2SdGWwdSmoD2ohOvSL5g0ghPFxiUpHAmwKybJvnMGymgdgYV9TKoO0bskcEF6L/
	IXf5amYQ4aWRAMpOMkrVlhHRj5O+S9oQhlEtOwkh8P1lOsZMkXwlRG+YxQFKahjsZZfXifYNBeY
	6h7CT2h4mA3moUu6W1Pgdqd5VrJVE85xxILwy4D/iipGSqiPTzdiSJCReB+j23hQOaUHdJxF/wS
	pRnhpLnmS1uwlBKmCFMRzFcrGxVEFDIFwtt/C9j9jg3I5XUGsg1BCWQkEmXOmywxLFjTWl6gvow
	AdlTXSoOSinI1VDyn74HMXsJOC62q9jd3fs+duUOb2P40znp0z+POwVxYKDQ9iUFKHM2GCGJrkR
	ZXk7nbELBGIvPHyXIk0cIGdV+oO56kD+gFA==
X-Received: by 2002:a05:600c:1988:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb5e2693b0mr281411975e9.0.1794933712865;
        Tue, 17 Nov 2026 08:41:52 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 17 Nov 2026 17:41:29 +0100
Message-ID: <20261117164132.47167-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117164132.47167-1-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
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

