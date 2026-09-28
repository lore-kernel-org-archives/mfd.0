Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1DD4EFFBC
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 19:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624761; cv=none; b=ZJ1ohootNwc+Lqq5U66h5PZVPSap4MtOpbLtNMsXh8uVUK+vVXiAF/CeV3Tvh/pQXFq1KBf1H264sgox/oF9pWVdrQ1rRxDHc4SdMGOlbWJSaz7df7zU1rXCbxBXiaYyr9fwBBE6/z82BPumYuTpodBl6gHB48G1WLwIGZTMaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624761; c=relaxed/simple;
	bh=/IYRt7m1hBhlgCk4AnhppCirk0sLdTYFTGd86B/RQ+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFDgAKNJHBQ3nxZvE1Qu2RySeQacNp3Of1gcJQ9O1NqNhbPMJNP3GN39IvR3IDeDCg4BdKrZAArycPWf/aQwaG61oGvIrvNPUepO3D6iX/6IDJsQ/FKY0MTKYyvguYq3ROoKgNuGXV4SM2ljzfbl6OsTsZkEQP/knKFoZHmX4ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfGVrsoe; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfGVrsoe"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887d06c669so2653778f8f.3
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 12:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624757; x=1791229557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=DfGVrsoeEPyiwNP2gIUqxXDWOiNNLyeUoHsXaPmhozqM8MP1B3FGEzLd3oZEHE8MHn
         NscixTArXiZ27N37iwwAisLJDo+PzYM3v5XVJWFEuvn23ETPtOGsacP1/+/2iPgFwA7D
         +Mw+4K6WsujTirBlw8Z23b8kIuLpd2QRm3J4UemK4Mr6WbWmGD7enox8kEy/XhT4C7im
         HxkNkYf24buvmE/nVOGebBKFt3uuYRv8hj8QAjO8lzN3TTJg/L5mMjdRv/rm4Paxb86V
         dZpr3mGKPj+3gHnFFoAbTEpduEyJoameHo71ttQpMte+rgLEEtp2dGKoovdnul7+MPnT
         Skag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624757; x=1791229557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=vWukda24Z3OOm1/pBFVSWY7fEorvuvOAzPaoPNkgHMHs6Qbc2N15XBc59pWivD1fpj
         RZ75hYjh+YXA7BYE9GfllDQZTS2OLacbGW8V0yOA2l3murdwzgGuqRNJlYesMUk82xls
         BcCmyQrD/xqXV/zlschGd5sB/cajS/jRBKMUVfM/PtOmjAEyMeECjzIU936VBS2SD3XY
         lb02FuD8p21t/5tFLxbQ63Ly9PGumu5YFrTIddYATUhxa/4lxJDac8e+1R79yB5tTbxE
         KgkQCUoQtBfkDQzpNPXjhc3YSb+f47DF1H+qd0qWpBydYh/XasG8oCAXkJPAITaM75gP
         5AZA==
X-Forwarded-Encrypted: i=1; AKwUvBwPzAZPqQV4ZWLXGJVN4umi2LX/9Cw9d8KZQMwUOEXZcJwF5VmC+6OgcJ75XECcUrxZC7s=@lists.linux.dev
X-Gm-Message-State: AFq9FYIAQrR25K7GfMaWCDgjT9+yprW/j+nOqgZJFtJ2TqDzeFUqvH5P
	JpEhXK83AJHiOUBbcTcBo29Vnua5ical4HoYIjJKcLIyS46CvhNknqf3
X-Gm-Gg: AYBFou1cY7PDmwp3QyTD7OqHVaS10JKaUUiiUe65Y18DoxYuEV7ABZF6x9QId76V5QL
	v0b815r5zDK9pejTGbK+9/ZzpPAmfWTMuf6wUEn6KRMC/RA7uJlG2Gm43L4qrvUFh9PrYgVA+W+
	+0/LIUEvaTzsEbx+BmbBVMAe92ivXVCfwV1SXW/RpQQjqs25fjaXJ4+UfdU4PSFi+kFHwQG6S3+
	lGiSuX5ea8MsnPs131n7R+M1d/wRiDuJsCciCiW6exyT6IElEf1Hl3BPP/U17zuC6a6iewIu8ND
	pzdak+vwZaHDlR4LCPdO56gTKBFatsVk+pyDSdrAWqAB4ZbBXucWh3gqxhlfcCItkGNuiNx5lE6
	xhbtWtH8F0VS+0V1YFsOoTVnvmrQbjFzW6lZ6Hla0mJ0RzlwHH6DXN/QhjvnA6oyqxbFWGH+THO
	I+M8itlGUxVAyaQuBY91aOodUhHnxrgcVjv2pbuku3ZC7bghqucj5wvDjrYWzZoIg5Gjpj/8O6J
	d9PSi3prJ4fPN/T0STDyP/yWUrqxCJOCu5mvLHLCIg9dwpHS7M3kiaSVujeOUW8
X-Received: by 2002:adf:e188:0:b0:486:f980:2361 with SMTP id ffacd0b85a97d-48872ac750cmr24124073f8f.45.1790624757303;
        Mon, 28 Sep 2026 12:45:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:56 -0700 (PDT)
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v24 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Mon, 28 Sep 2026 21:45:01 +0200
Message-ID: <20260928194511.41878-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
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

