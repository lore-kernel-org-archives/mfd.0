Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82FF399346
	for <mfd@lists.linux.dev>; Wed,  2 Sep 2026 19:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377339; cv=none; b=LfFnK85AdvtpoSIJoRbD3iBBXpmceg9AHzlNIdBT35TCSEadodOSOUeWGGeDCRNmDrrZSc1wK9wQfixAxjtmHhzgsmTNk0NmtdF9+s/MLT81FYranrEsTzOdnBsDm4Ai8t5tpmTupFGj8atCpNlqQWu+tIkUTP4OKxNvdjlRSrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377339; c=relaxed/simple;
	bh=FM5tgF1f4gTluCeeCOhkUzBtb1GjjHUL6PkplRSqmH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmF+qlb3QH74iQTJeYQMZUa/69POGQdTDuWdHXREWmta22aubfraRA1kOyIIPgE67M1uF7WfuT6ezQ01fusvuLRQtTDsbwzg3B92ZQh4TLLxD3qXoE7GnbVlfny4rC0Z7GFl1SQjMv+zAsS2yqlwuDYGER3YsJw9SzerEMDZJ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=at5+gohF; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="at5+gohF"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46a4870536fso1066094fac.3
        for <mfd@lists.linux.dev>; Wed, 02 Sep 2026 12:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377319; x=1788982119; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMCbMlmB432oqXei5UybzmEnI0WWfLuR2BGyq3YWjxU=;
        b=at5+gohF2T9p/kgEdq3G1aCghavQgjS35aYtLKWMozQZFGV77IDUMq1FiwxSVJ9RWs
         4SFrWfTVmEnPp5w12/xVfsdiBy8KGa5hOsWq1i/PXCpWSo7uPQp+M9a6puow1eWhFlom
         ZieSTD/cmbo0SEEMZ6iz53dpcRjslGDYBw+wDwgYxIRG3h81w3S7gVvbZEm6cKF4fJQQ
         llJASDWHvqJaWOccCs/AvQlc672B6/OL2h2XJZlbARHTeSKTSJI1YQS1OgQyCXdcQUkY
         z6Dp3BmBjk1v9OEJqhEi4B5lLnsS4VnrBauUhViu8nj/iCmnykxDOW1iVu4TjrcHvJct
         YFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377319; x=1788982119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMCbMlmB432oqXei5UybzmEnI0WWfLuR2BGyq3YWjxU=;
        b=HmzReudF6liPmU/yUgp8pKiv0LgklrzSQbvBxyHkEHj8wjB+hb+M9APyMaJpHeTwbH
         y5ogC83f7KkdrHBCrh+qOPjwxZPuMX1Wow+Zkr7dy5bEAfq1qWHLNPnHu3iE8kNOIrNm
         XnG1ANmKE0FbWnvW1fMLu4CpKfA7hRsbgsHoaE4sEMEDDBiOk7GaxbV6j9tYJgYICWQm
         3eS90YRUz2Dxp5PiMK/hP+FrMZss/o78StD5peDfkYxzDHEEOFTj73rZi1KGHyb6Q9n7
         zemuu1b+WHIVdVUBNDNeS5OejaRZA67NixDZCxPG5DwWxcS/AmlWIq4i+2INkq89kpt0
         kECQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWv9jfAsLdw8iXyRpzvtypXNIvxEU0P+c0pqHa4wY+dvj2I/Y86/ywTV/KC4UVDC6Pstw=@lists.linux.dev
X-Gm-Message-State: AFuF++mGgHJEjh5P9ObuBFwgMQ0E0+e90PZNqVN63qRb/Yt+TKPpMKFW
	F2YZXtO79IXnsbjgVV9xyLa6SpZRpLaFe7r5mpnmJBebD9Y/QvCAjCkr
X-Gm-Gg: AYBFou0AEkfNc3Alu6Hexc/LR1iZGi4U53BGPmI/Q4+vQfxaicJs0fhuPwc4T4EIGm7
	3WU9RO40PFl9byciGQHbvpDWKNjYyhvmoLBYFMkNAu1Z0lxl3+bawMkIXEZj14w8ZBtiF5yiNnL
	7b9e2i/8gMBR5oc4qI/aIZTXAdEOizAjIn2m/OzWHBen6Z3PyvKVYdhqcKIMZZ4jtd3UFt1CoJ/
	PvbnWEX0LLGTvRyZqcFmrYA7udJ8aJJKK1pixzfsZW84T+iz3cRZzAJ064fVMjj9gfu5SURuUsk
	G5DeqRfobQ+BwavsXM1TTHf6n0RWcuwjUB0EjJuqglageMWavWFEoZN8NFfBXpqHPLd88PLQF2X
	bMNrRRYvb2YivkjZqRNwHDxBr7hhsvwIp5jvUdWCe1KV2usMenlKHP8WDPqunUWFEkuiOxMeBHU
	KJUMSDIdYT+KNnlDGwn5vBXbP1lchPHsnVMPt+MFiFFJwsM8XW6YFStxc/2vORxv4xqufYx8jkL
	A/9YsOQEdHVqLPDeq43yedc9Ir8CiXkggMQWwo7zTZcFXE4xkHYMJyezQAaG4IqvrkvoOtvZzC6
	Vrj/G8Ag9IhZpkYVBZHVpoJVomQ4Efgw6IuhTHnCmq+YmCBt/LlhjoTkYLWiN+tzN0vrhdW4J1z
	FL+/M3pi3/0LMPVNRy9c=
X-Received: by 2002:a05:6870:1426:b0:46a:dfdc:c77a with SMTP id 586e51a60fabf-46f86ce6964mr6864969fac.10.1788377318780;
        Wed, 02 Sep 2026 12:28:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm4932181fac.6.2026.09.02.12.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 02 Sep 2026 13:28:24 -0600
Subject: [PATCH v8 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-submit-ac200-mfd-v8-1-2aa06720b8ac@gmail.com>
References: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
In-Reply-To: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device and its shared input clock. The Ethernet PHY
is represented by a PHY package on its MDIO bus, with a phandle back to
this device for access to the package control registers, so it does not
require an MFD child node. Function-specific supplies belong to their
consumer bindings rather than the shared parent.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..609831b15c80
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+        };
+    };
+...

-- 
2.53.0

