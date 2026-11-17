Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933713;
	b=mUr4JIdL+hwrM7sIt8/l+/gjjB6yS/8BbcLzQzerpssnkZNxw1cFG+Mtgd5S4o6aey16
	 ezMJvencyFFa6+SCXoKUKvZeb6vQXGwXXVxKd3m3w6VRN0h6mUmyHlWoHQvMu4/AI6xdq
	 F665/8fDvuxaNYS8fUcPSq3+pHsfXBD5P02gmO/5c26vFyG0a6AdqAqfEI2srBB+erkBG
	 OfjMIueyEB4Zks7fqATKEOTjxzYKiNV0YDvlPCXcM2s9c1N0sJ+APnJkofxIMIAGbeRuX
	 tP0SvObI36YkCZnaKqA03/Fjr3FMdie4hta8JwEM+eXZir24RgA2NCXbnR1EJ4pBMJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
	b=n6xd0V30YX3UvNwoIpfz6oRGWi09wPPpldWmiLEODjy/mL/gO3uzsMGMbPwwAEp0MhCc
	 UbIz0rZpcRPFqjDU1+g/XYumC/B25M84sl9harCLntglTP06WGcCLUt0C1CHPsJyAiVu/
	 ruIA02nbk/J6yJ8Ozq67b34S2aPgm6+FEZZ5YGM2BtSW8c9QkYh3fxfGMO67kWU2lTNl4
	 gFRTV7tUIIx3wQZo6sRUlV5DLoMTsBYtpapH1T4CzABZfS0S5Zp+V7So7aGwrRR2f3D9q
	 HUfVaBurC68M6l7ApkfvIxofmAFVSsrNNTXcQx2mEdYe7vabxLi9HtVNSxSz9Xx/CNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdzKBYKl;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3253D606A33D
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 16:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3253D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdzKBYKl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so483395e9.2
        for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 08:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933712; x=1795538512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=BdzKBYKlGB57xOfnVy/Mhi6cGVYA43mLCXWLFCekjoKmB8HsUe0+2DZd3yQtYguYjz
         hlnhTG4xDAVVr5mpm2OlVpN71TzQJLuSXyRb5anVBvKrTcfm7rs3JkVC4T+Gk7hglOkK
         ah2osgpCqsJbt2v7XLKRrGm7O5q0EF+nydWRmi2CIEyqt0xARZR3c6VypVoTJL6ZCixj
         v5+kuISPysCnnQWQ05W2PfG8/Vs2nwCfDD6naSqxD61C2ID8/cOk3Qb3YNWRS2feUhmL
         G7mcenYjIaaIWai4bEojNwuCPz+J2w7QCFBxQClpIeXgDhIn0/UEyx9pHash8d+/RcDR
         23pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933712; x=1795538512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=dfRiIVCdd5lZYWYZfYn8trN+j8IQN3AHr5trGsGpvDooR33O8SlQPTItsMgyYy7efy
         vRuql/E4lPqSIuoH35/1+YBLqtV139W6NnGI7sBfuuhk0H7C2oiATUv7JyMqcgaHgxTu
         iIqtb/YUMLSXMPby3PJJYyKHGzh4+A5FUw1yup3lW1ruCWnjm2CMISyRgTrvy/M7oEYX
         2oGy5iYZWkPEntWKZxMBNRbYH3TVv+qsv6Ul2P5/dBRKyB5i8J0hESravUNqnXmRmFg/
         VB0jOBiNDrOKVliJh2CrZN6c4HEia5JMqjS9QA378cPIl+EWVWKeJ5/PWF6OrjCHQDux
         ujNQ==
X-Forwarded-Encrypted: i=1; AL+hErE2oR7tt8A5/EtMdFS4kusBl2F6O/pPLmJh/eDuY7lBHjkV+vZw86WkcThyIMjhs/h5ld8=@lists.linux.dev
X-Gm-Message-State: APuU4Z+W7PAw4Xhn5td9SoIEeL16+nlkN84buXizm2ZCjTRNXAzWby56
	HVic7ldVsvQoruLDPPuO0rxvFfYc9OXgbQqHLdzIqPA8OaagT++iiWsV
X-Gm-Gg: AYBFou3tz37dHxQzI0ZQA8UWiblAOk8ozJqsqqSVB/M7076Ulfy4HKLYfqAi7cGSFPU
	7R0WVfG0A8bH/mGoEEwxhcTt3GtOufvVI4AgEHfj4sW//auYip2A/BkXdVNGho6ZQqaSkdzlEEw
	z2uJDi+HKWB2BFORIWYuoU7QYWo1pn4q8prbl16IR3BrGRf2XasssL4UwwjFA95up5t8kh8FeO6
	OsH8DsIE7ifgbSYGD+81i1l+3tiub77GEcRh8oxQe+tbbnC9nwigQYHaULx2a28bKp02Uf3hEG2
	12Tmn3fDaSzbePFc4R5lfj8hZz/2l0PCqeQTJddaZTiJC7qjDb7J2zDQ5zDqouP0Tqoq2oltTc+
	Qz3J24puEsu7VPYo4QYRtUsFQoXL3jwq0h5IOq6Lfx4itmDZ25BmR4NTzkrCdFAsc8Mgc9f7auY
	Y1P4CAhuEt42EGzvfbLH+1q2h+H7+LTmv9tF1XdEmMdK3KOK/fvt7H8uNdPdRrLDsFYTt/WbYIK
	5NoEYbeLTk9P38TIqL/GcChokIaMbZZRgmXfwUAejPHnMCXBZhO+N9SSp1NKtYC/dybVSM+WIPz
	Z1htxJaqUqci+UHPWn2enAOXoNaifn84YopKUowjYy+Ijj6D33IdlhFCgH7GHH77kPZsfkf8mRU
	Kd0vH7UgdTsuiLPy+q7s+70DWRe/uGUW8nTwxDfb+sItMDJ7/wek+a1E=
X-Received: by 2002:a05:600c:3509:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb55c5f579mr313862835e9.2.1794933711523;
        Tue, 17 Nov 2026 08:41:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:50 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 17 Nov 2026 17:41:28 +0100
Message-ID: <20261117164132.47167-2-ansuelsmth@gmail.com>
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

