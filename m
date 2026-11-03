Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737851;
	b=UBnENUTRV5Qdgc/iKdGpC13/2c8MqCth0NZEhga3jAhbtYEpE2/FdB/DBmDQsP9x8odi
	 sOJ91P2nCEggPH4CvBE5//jvjkc5ybOz5jbMh5QH0aO3EoshNxgiNy087JZNJs4vDXqny
	 m7a030eCExaCAetTq0sdfJztMqfJDZdmYu5j5raL2k7YGOADnczJzcC+IvFYyQCvoGFpc
	 0lOjlolU+NdtLFnrT5RlZaCr/koyzGwekvjm2RKBT9IrjLGtLBJWTmnjYOR58gDtlV2kE
	 CNtX/vye8QTQ8z1yPgV7Vd0QFtYAFsIeF1DDsp2rl5r+MayXKYz5J7iZ+44L2JGaSYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FZfYo8SuzajjbwV4kqNY7tywvSI0LOY4vzOInvykOJI=;
	b=xlvnkF/J9mTBc1WoUXZB7Alyr4RnJ6Q4Lq+2ZSmfAg+Dbl66z0BC+u53QJ10jhhurmit
	 JW1nUBF3uBI5z7hLK+D73PM+FtDxCqAPrOayzKayzHElUT3Q9R1k8k4mcba3Z6K3FeqfM
	 Hh5gUQdnj9t8zyqUB9SzbGlSxpnoPBI+XUB+Y3TVurLCrJDJuY9vdjKhf8NaP6G3p5H5y
	 na1F5DQF07ZN/m6c66phNsOea6c3ABIswgNA3pZs+MsBfiBWfi5060PvVCob+NFuXUMKY
	 18qF977dzTqN/u8E/NygB3Agqo3jSu05pdfiDLTnCbcw/oTG5hxMK+qE/Uy4n/yq3hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBEqeOGF;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D60E606A334
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 20:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D60E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xBEqeOGF
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14351435e9.1
        for <mfd@lists.linux.dev>; Tue, 03 Nov 2026 12:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737849; x=1794342649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FZfYo8SuzajjbwV4kqNY7tywvSI0LOY4vzOInvykOJI=;
        b=xBEqeOGF4MzVBJnx9ZHVuqUcXKP2LqRHtB2g0uHHfknAR7DqsLdo435RqYHSryw6MG
         jQVm9TLpTIfX8Qohaze948x+Cx+JtZO1Owl7KTZrHXju5QOCAOx825FopcfbNGoE5HC1
         ekSRERXAzvQk+bbPbXAs8WYMJwfPG5IHM4gCkI2NFrpBRWND+SNfKv2ZObQKaGML/1zM
         11th9/gfVJfPh39hco/mwuDqy14eQFujhbQS8fCgTCtqjyZ6ag4YkyNBqxEIYMiKGqQY
         kSJd3HwuLcZA4ApMiFexxIldRKU3wBUcM0IjZ+um+xGsPLJgKElxaV2y2Kl4V+a682Xy
         Zfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737849; x=1794342649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FZfYo8SuzajjbwV4kqNY7tywvSI0LOY4vzOInvykOJI=;
        b=DcZlbhLaCZGZ7mo8xA6Z5rUas9fijidiNHY6XG+K6pGJ7CAwq1fp6RVKdhFJAL+s6F
         golokdB4Uu5MxHthk6knfpEZfD9q9jrPV9RT1bGwRc/nnbX0azMISypexUeUpVZOdXgp
         oE7qVM7df9LQvEhn2QLMXnaaXnuST+5e6Hecsqg4eZ0HlawTraWavK+K/qZIeQxD4gsW
         ZRnUgRdhj06IRIQFqHgY+VvkU6jOLE1FcPmu8VzvWv4R1FlanGuOrWRPfe7Jh93bXMlO
         RAk0UQZOhcE1W9+F+dvSzuBkLknGAwn4RrgofWVYpgJsyL+Fg/HeRcpoOkLil8dubE+U
         vqDA==
X-Forwarded-Encrypted: i=1; AKwUvBwWc0ksjMIJnR/nxQaYwzOVh/p/MnrQ5u3Gp8ZdaYLamK29G7vav1TlEakGhdepd/0M1rE=@lists.linux.dev
X-Gm-Message-State: APuU4Z93xSmUBOXQSkKJhxnjGwOOo1dLXJbPRMutA9p5/DGQArWCpMLD
	zh9dE17YIQCRyn8CaFtkp7DYaJlehPTgLh2847wm4wqvxOuI3LcACJGUEWSfbg==
X-Gm-Gg: AYBFou1eHIL7D+o3cpyMxWbqf7+ye/Xmcuh8WInGPGo17D+3blYbrMcEdZph8Qq0Cgx
	cFOXU94pafKwuQrAlKIPoW+f6Kidj+1D+aEAmpjoh68o8bVB++BqZlaSOiyh8s8c5uUV4D8ivQ1
	mgkaqtz8RiI7hVqU1WTOsgQnKuM3OY2VDA9wS9BFyNkpPxL6daCtbRBEUQ4FIjDofmdVgUOQjOb
	/2VanDF3cdnHUnHX0kQ4JrKQEOxSm4sqlbw61fo0A+N1qeUXRv9s8I8FT7Y1cOYy5HkTAL0fcYj
	2Mu72gtHasoS8OZ5posHE5PLgA+8F2IMzN0tIrgyB61S/OpTMNqGn+Z4s2Cw8VffQI+Axy/92HY
	y5T3ZkOo85UcWQvI9Z4Rfxey9cnzY5GzkLrdpYwl1HUbs2ITXNZFedwY5HugatkPQYubBRwnl9M
	IQvwUkfG83Lu5ojGLudCGo9YA/X674+h4Ip8+jnHoERi/Y+sGLoPsG/LpUxVqaZ+Qp4vmaCDvuO
	+jpRTdVGu4bJwFU0kEDG7RXMYg1ro5AUFhKxhKa/elo320/c6eDu4sTB3tnuNvf8A8PyUQeXGQX
	AvCoAvDGG+lGL+qLgHQH4nTn8GJSjaUmx2RQEV0R1WpXejVUbxxxklkvuD1bhrkmgUrh0Chf78O
	Q4bBdqJosmWjRzRtB0aFCySR17UF7Atkd4Q==
X-Received: by 2002:a05:600c:1d11:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4ac174712admr336521505e9.10.1793737849367;
        Tue, 03 Nov 2026 12:30:49 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm75110245e9.4.2026.11.03.12.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:30:48 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue,  3 Nov 2026 21:30:31 +0100
Message-ID: <20261103203034.12869-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103203034.12869-1-ansuelsmth@gmail.com>
References: <20261103203034.12869-1-ansuelsmth@gmail.com>
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---

This was already approved by Rob but I dropped since
I dropped the DSA switch section and reference (since
it will be handled by the other series)

I have a question about this... Can I send a follow-up
patch to this schema to add the ethernet-switch
and make it required by this or will be an ABI violation?

It's not clear how to handle this detail. Would really
love some guidance on this.

(or maybe the DSA schema should be pushed with this
series?)

 .../bindings/mfd/airoha,an8855.yaml           | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..ee7241154851
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.55.0

