Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07AB3C3F66
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 02:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785896919; cv=none; b=ApCTEggtVee30iGsWMn0qMaCXaSR8CLJEs0+BzNZWi7QVyImAw+0Uv2Uk004ztbH4vj+/VsUvhSTEAQ4ljapkpX73RgF42MLz2NxU3a2T3SAp2O+oglnJ/2KHxkdgBhd53lJUmNW1mp98wiMAX0xV0xlFUMEc/+WB14piv9JPks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785896919; c=relaxed/simple;
	bh=x9Lw0syNJki2K15bJqB51uvJ4FZQCZJczX77O6639L4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pq7XLzOFHN6sFUkbRp8qbZzpc0v1hQJOBgd//UTA8gEhmaqCrjcpdW54ADfTdbvtZBr7ANtvYM7LSVSTgRSpuNSe2ch8Hp3SLgoRRpUOZ+esw9srZNC9kHLSFLb7IfqOddh1g/ZsIvKscBvbdPMbs6iJN1K7KGNROfiRVSx9Q3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsqq2uWv; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsqq2uWv"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb34c17b96so395540a34.2
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 19:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896915; x=1786501715; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjVtijpmJ/oNZWvDUTBmnWApL7aWLNJ+r5jlKeKXMpI=;
        b=dsqq2uWvS/6Y0vI4tRqgbnH018q5kT/QKipJMOir2xMxJ5RAuvrevWDi0MXp8iSOcv
         nz779KV+BAs9b1+1a/AGzj7XkhWxEDRtGz+LoJ5sgcxkQ84eYHdJMqBLsg0w/YyYXs8Q
         q5ecJ7s37bgUMTjBnC+sjwblzYYsuAtv6ysU/cjqu90Nc6bLu9yqllgo1Lzz45TJIfy+
         UgAOq9fKw8OXaSPEMQeEnhN9nVxNhb6jB/CqTaTeJ8Gwy7A1OmOC23vxLx1E32f7oAI5
         T+Hk9ZhfExY7erwxibVALEyTb+Skieur+nrSmJCLIczR20ulUf6GjpnFynZHVnXR6xa/
         cmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896915; x=1786501715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjVtijpmJ/oNZWvDUTBmnWApL7aWLNJ+r5jlKeKXMpI=;
        b=mBnJ4JdZnUeNRGbbbgHBmYUFC+jQNdo4CMJrK2kzyRpOvuX6L16fpGJsn8yAqT//Zv
         ypZ6owbe3+utcluwi6Im+Q2IJoXkAYt6IPbttUvTSLkABWb7pim47vCh7WZs5w6kEZ+q
         dg9plVfaryX2fR64IdP2EWAJAYfnfv/7OFsl10Hs1IzIh7VdhsxVe0EMMfx2zFlsYOyC
         5klRY6ouTxgp90l/brnEzhZTh6kc0tXqy0LzZPJqL4kBi/NEoc6nT4tkFY7iFx7J1JL0
         +3F4s2Nh6hNbie/NVeQnVrr1V7Nm4OqEWqU3itkLntGDxT1U63lhITGO8BZ4cg69Fymh
         Zplg==
X-Forwarded-Encrypted: i=1; AHgh+Rqq4Bph5ry0DOJf2PaImV1y+uWU/Y0dO5Y2qw/syGP+P6XXgEE9ZBFNrp3Y0gNTLXgL4NA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjTcgQxRDN7KeBS/qMg2NheQvmI/5tZjtIhPedNlS/9hrsnCQT
	kBHZljqb64LOGCZhsYEXMCHF8ExsgQl+kvqSriXNcteG5Qx8uGfG9ogAY7u61hRN
X-Gm-Gg: AR+sD13/RLky7TKTsQoeOGZBHJAZJLERt7+iNC+eSOmNmY2G4s07Cgz9Rs4QheCyg/1
	80l85a40wVNxhEAOWs9AbzCFNt4ia9WapxVEydaE1OQWNBvq4g8BSp5DEO4szyIOPVX5CP3Wr8i
	sAH0paPs/VjsWg02H+KTAM2A8dQu/p9l1p90XrtgSU0nkihBc9lVSw/wgNYlCAr9AigObhmfIcP
	R7TVmkBzn8gfFL4YcbtGXjDIbuuH7QrZ50E7rnT5SFcci2s/9qfGaFIu1t7R5zJF8fuIpjFC8bA
	Ub1gPG6jqXterBrJnCVZ6ZE+JRsyQM9hDYn1F0jGh/PlSvFD83J2YBu47HyYX5i2MyE7QWtk3a4
	U9U39TF74PMUPeJKC+I5mG7UUktaKT1wABU/km/c9Gynle2LNnoPMGFxNSsigdw2JR7/Rgbf1R6
	OBvxU5IpC892DN59no+hXkbrnfGjB7rOk6PJBWc6tTG+nNQJTiSh395kqhVCgmhduDdSm2ysl4g
	ubjRcqWNN8GrEgLWsg1jZjeg7tyva1cZ2m1lvDJQW+6qSLyO1uNhYV/DXlVuj/J80GrhFVspSWd
	fgGsiNnubnqnq3qN7CzMoVsAZEVJ2GWx6qevqLvE+YPZVucQUlFvZvBRgni+VJKxJLKhrYCbdl6
	Vs6ndhpcslpUziunfVfvXryAauBI=
X-Received: by 2002:a05:6830:3741:b0:7e9:ea28:4c1f with SMTP id 46e09a7af769-7f1e5d893e2mr2408593a34.8.1785896915399;
        Tue, 04 Aug 2026 19:28:35 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:27:05 -0600
Subject: [PATCH net-next v2 7/8] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-7-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC200 and AC300 MDIO link interfaces report the same Clause 22
identifier and use a compatible link-side paged register layout, but need
different package control interfaces before that identifier can be read.

Describe the forced-ID PHY and require exactly one reference to an
enabled AC200 or AC300 control device. The PHY node's reg value is
programmed through the AC200 control interface. For AC300, it must match
the address selected by the package straps and is therefore limited to 0
through 7.

Allow a system to provide its optional two-bit SID configuration field.
Bit 0 identifies the AC200 or AC300 package and must agree with the
described control device. Bit 1 selects the AC300 low-calibration tuning
sequence. Omitting the field skips package validation and selects the
normal calibration sequence.

Also describe the optional xMII receive-clock inversion needed by some
integrations. Requiring an X-Powers control reference distinguishes these
integrations from the Rockchip RK630 PHY, which reports the same
identifier.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,acx00-ephy.yaml          | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml
new file mode 100644
index 000000000000..c280bcf8aa25
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,acx00-ephy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 and AC300 Ethernet PHY
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 and AC300 expose Fast Ethernet MDIO link interfaces which report
+  the same PHY ID and use a compatible link-side paged register layout. Each
+  package uses a different control interface to make its MDIO endpoint
+  accessible. A fixed board references its enabled AC200 or AC300 control
+  device. The PHY node's reg value is programmed through the AC200 interface;
+  for AC300 it must match the address selected by the package straps.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: ethernet-phy-id0044.1400
+  required:
+    - compatible
+  anyOf:
+    - required:
+        - x-powers,ac200-control
+    - required:
+        - x-powers,ac300-control
+
+properties:
+  compatible:
+    const: ethernet-phy-id0044.1400
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Optional two-bit SoC SID configuration field. Bit 0 selects the package
+      variant, with zero for AC200 and one for AC300, and must agree with the
+      described control device. Bit 1 selects the AC300 vendor low-calibration
+      tuning sequence. Omitting the field selects the normal tuning sequence
+      without validating the package variant.
+
+  nvmem-cell-names:
+    const: configuration
+
+  x-powers,ac200-control:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AC200 Ethernet PHY control function
+
+  x-powers,ac300-control:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AC300 MDIO Ethernet PHY control device
+
+  x-powers,xmii-rx-clock-inverted:
+    type: boolean
+    description:
+      Invert the xMII receive clock inside the PHY. This is required by some
+      SoC integrations, including the Allwinner H6 AC200 connection.
+
+required:
+  - compatible
+
+oneOf:
+  - properties:
+      x-powers,ac300-control: false
+    required:
+      - x-powers,ac200-control
+  - properties:
+      x-powers,ac200-control: false
+    required:
+      - x-powers,ac300-control
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+  - if:
+      required:
+        - x-powers,ac300-control
+    then:
+      properties:
+        reg:
+          maximum: 7
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-id0044.1400";
+            reg = <0>;
+            nvmem-cells = <&ephy_configuration>;
+            nvmem-cell-names = "configuration";
+            x-powers,ac300-control = <&ac300_ephy_ctl>;
+        };
+    };
+
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-id0044.1400";
+            reg = <1>;
+            x-powers,ac200-control = <&ac200_ephy_ctl>;
+        };
+    };
+...

-- 
2.53.0

