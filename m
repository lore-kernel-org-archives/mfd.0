Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA963BB684
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 02:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785896917; cv=none; b=A9SwbR97nviLEYslVIN+lomezABTj2xWQhoK8YlNUBbkU+KjIWV4CiHV/IA79yEWijPvbdnZnJL++mJjpjI6kSkTkRslReenaAFChrC0QrPME311/1tunTV9aPODxQey3KPOScN6qmSfpPkPAMqLxd55sfJ6+3QASmAQcbkT4Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785896917; c=relaxed/simple;
	bh=q+8gVOKLd88te1BW659igZ2T20EfQQD8SX4NxV6IpGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yalu6Rzdq+AcaejqvkzluwCsoa/4swNl5rw8UEVVznvkY0djVe2OB5DimropVI/7/x/AEiJ4UG5MPDGwu5v3oEw+rR+1lvp50FVluqkqHR8vOHI1TPIGGGFsysuRFUoNEpFCyXTlpUjeMRwyRSt6T+Amv6w14JvxJVtULR38FDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyjGP6nD; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyjGP6nD"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7ebd88be784so359872a34.2
        for <mfd@lists.linux.dev>; Tue, 04 Aug 2026 19:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896914; x=1786501714; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AGkeXkcQmVAMhKi4BRouTjNasW9FdK69cwCP5dyljV8=;
        b=gyjGP6nDvkYrG8lBONxIfepLdN+WnvEqcHXgM1AXijEQ5o6ohi9izcaL0vjgYeS1PY
         zQHGHidpagggcs49bzqjUPPkiTItv2o7ojqFXRAn1a8+UKkI/te0HZG0UWmDkhN5TNEs
         knmmV6Y+oo1QTILqFDTlzT3ECetej9ciwBlfWCQ3TNncbp8UtyQmKx/QrRpnsYwz4oPh
         zFhEeGOxAwdpT59iOAGCcWM4VVAuxP95zj2dX9JeVZ+xickZivkHEOwI6bMohLfmSZ9N
         huykuonSGk2OfNFnDbxZYhIFdPuDYsf/Q6LbEBGcXqZL4a97WICElxJGlbT+fiZGOMbr
         pbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896914; x=1786501714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AGkeXkcQmVAMhKi4BRouTjNasW9FdK69cwCP5dyljV8=;
        b=bezQRGEEruDoG9SXaYNdUmFiTlAiacvTztCbFZn8rfMohGGrivfexgkJIfj9NKYhjg
         H4QBcVKgnly4qFF0avQq+gx4b3h/8DzCEA+vT2TTwTRlqFmINAL7WDOd9tOy81RAIgcq
         m36oA3Gezeb3GNPlSJbrIzCA3K9uwpacDCZJ2uOCx+sjH0eMGPtCJsz+y+OqruI8YjY9
         YurNv1Y9RfBBpeNsnQGvfI7xef4xEDZ4VGGdlILDZxS1e4ApyoCRVJbHMbnhdY7BeCwE
         FJ3R1qfroA8AfPGM5hc0fZBdKiKHlgLrvA7B+dDPhKKRg9y1TIzDMr0mJWlmbdN0rmBJ
         Oy1Q==
X-Forwarded-Encrypted: i=1; AHgh+RopCY1lC++/MV0p+7vC9UrTrGvNwS5wLi9v4/TdOu8bKn6n9GrIh0lE47p/nVc4z/PdK7E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2QPtidD8dl5ZcghsMY/TtWg5vYp0kgG88Sf/PFyoV8NsYpPMI
	hFqFpF54PiLnRi6qkTWUUW8vS/vhR5Icyos9EDJ4j0Z5ZxHK+n4k8nXjWVreIMA0
X-Gm-Gg: AR+sD123fTadE7UG3rEePw4cztHp4uQyDpJscWh8+Yl+ZO29iLxAj6O8NaC28zhi0Xm
	bi1oCIfI9wFpKXjQ+CA5OtCd61tdQRUQZ8pZrX3dw9tT/JucMr148VL6LNnsGM5ctPXVI6cCXak
	lMWUJv1zZjDm4PfHeAwkDySfhNfASbbmz4Iu1mKohuLojMGz75YW00u6EAkZxXBBuTMpKrdddsF
	DbZ5DCophTJ5LidUEL7bSv4nuaLU4VkWS5ujCVSlq18Az3umupN1TpZf8AnxRPFwvXaqMlW5DWI
	fl3IwFpzgUQVZkh8YGTPgnJJ2x1M/Et5WSaXJ02IHgPRfCUVZDl45PH0SDcECw43IBHa81OXow5
	CXZBEmhbzroPS0fMqgaR/bKGLrZkJLGrWl3prMERC/43qhISvKhA8fFxeMxvIO28px/IP03u/5+
	3OebaCvwAB69BHnAuvKH7L5ztaze6P1ezyiSxHW36trVUGgZ88q7S4fgkTz+YAYgFQTJ5ugsGtd
	GfYbuS1ZMJCXDEaoaGktROBdT+c/EshiIMr4IF8o1gFaI8dx5gUlhtuBKYlzBe5m86HerumX382
	MSzDaxMoEwdRspU9WPfok86784dsg2A4EiPUDYeVOSNMTRBEEy98Nmoyr//lPhNvUOHHdV81DtD
	vB+uek7lkd/0C1Xaq
X-Received: by 2002:a05:6830:7010:b0:7e9:d634:77b8 with SMTP id 46e09a7af769-7f1e5c13e8cmr2629082a34.2.1785896913436;
        Tue, 04 Aug 2026 19:28:33 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:27:03 -0600
Subject: [PATCH net-next v2 5/8] dt-bindings: net: x-powers: add AC300 EPHY
 control
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-5-3eef49ff1d8c@gmail.com>
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

The AC300 exposes its Fast Ethernet PHY control registers through a
separate non-PHY Clause 22 address. The manual defines that address as
the link PHY address plus 16, giving control addresses 16 through 23 and
link addresses 0 through 7.

Describe the control endpoint, its required VCC1 supply, its 24, 25 or
27 MHz input clock and its SoC SID calibration cell. The actual PHY
remains a separate ethernet-phy node and supplies the MAC-selected
interface mode at runtime.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac300-ephy-ctl.yaml      | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
new file mode 100644
index 000000000000..8a616ff3e89f
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac300-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC300 Ethernet PHY control interface
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC300 Fast Ethernet PHY has a separate control interface accessed as a
+  non-PHY Clause 22 device. Its address is 16 plus the address of the link PHY.
+
+properties:
+  compatible:
+    const: x-powers,ac300-ephy-ctl
+
+  reg:
+    minimum: 16
+    maximum: 23
+
+  clocks:
+    maxItems: 1
+    description:
+      AC300 input clock. Its configured rate must be 24, 25, or 27 MHz and
+      determines the corresponding EPHY_CLK_SEL value.
+
+  vcc1-supply:
+    description:
+      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog front end,
+      and internal digital LDO
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      SoC SID cell containing the Ethernet PHY calibration value written to
+      the AC300 BGS_EFFUSE field after adding 3 modulo 16, as prescribed by
+      the vendor initialization sequence.
+
+  nvmem-cell-names:
+    const: calibration
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vcc1-supply
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-control@10 {
+            compatible = "x-powers,ac300-ephy-ctl";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            vcc1-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_calibration>;
+            nvmem-cell-names = "calibration";
+        };
+    };
+...

-- 
2.53.0

