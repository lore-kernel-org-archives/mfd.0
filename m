Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D573137E5E7;
	Wed, 14 Oct 2026 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971338; cv=none; b=G1J+9v82iR4akZD+xTEIh14yMcdJeYuRj6o6C30PK7V4f8Zb5n8NhQ0qbwQrqHLMrHsby0oc0lpv8MYkySzFYnjEFCsHwIJ+4oqcmGF9dwQpZcA5uIKPb2VqEqbU/GlhhWgTwIDEx5PHgXICsaUePm7q13YhUAfBGU38l5UqWXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971338; c=relaxed/simple;
	bh=5aDelTzEnHOmWErFeARF91uTVmXN8sVAe4b0S+VIWjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNQZ+k8r2ATvb0apgyNxbg9W8OTfHqtnJKEpz5cudWxMv7UBERtD72U1pGFLFz27Cueozb4md8GnZ7RXsGGg56sYOeODEg9q7llK9qJeWBg2iNGeZOcrFQOwgU4jyV1YiHlpqXdC8mhuT77C3RXtoSk8pRsVfvEO7E3AVZmhDhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu6gZgrc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu6gZgrc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305351F000FF;
	Wed, 14 Oct 2026 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971336;
	bh=aoG6XZEoB/ISweJKCMFQ1pbFNJP0l8DivugMCR6LHUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eu6gZgrcUoabLBD7GonwJZR716smKc11/3i831Rcgs7y+PsuQ0f+kT5ArpXfOlWjO
	 QFDOfFvpIdck/smZkYYqnzjMHqnMTV95G+yEsFNkYleQmFTYudGqEd6bof89rFELFv
	 oB6l7piCmGINDXAniwqHvzGOk9ont22UUc4RybjtgKx6JSXzzvg2HLzrNSaWBCPpdp
	 PCqZVDz/78ByR/CQdx6BL6huLfRccnV3fhlZcWtTH3DddxeS/GUztD8W+KV6rakscC
	 OEik1Gq/FRyOqakigEpunaZGDOVYKAbBclVvgtVxsLNnk0D0X9616J/FQ8ctkzvhrO
	 2Gb5SltmkLsFA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 11:48:44 +0200
Subject: [PATCH RFC 2/5] dt-bindings: soc: Describe the BCM6846 Processor
 Monitor Bus
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-xg6846b-bcmbca-xrdp-reset-v1-2-daf5d177e113@kernel.org>
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The third generation Platform Management Controller (PMC3) accesses
SoC block control registers through the Processor Monitor Bus (PMB).
Describe the BCM6846 PMB controller and its shared register bank.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
new file mode 100644
index 000000000000..85850dc16418
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm6846-pmb.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/bcm/brcm,bcm6846-pmb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM6846 Processor Monitor Bus
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  The Processor Monitor Bus (PMB) connects the third generation Platform
+  Management Controller (PMC3) to the control registers of SoC blocks.
+  The controller provides configuration, arbitration and four keyhole
+  interfaces for indirect register access. Its children share this
+  transport, including serialization of complete register sequences.
+
+  The PMB interface is part of Procmon within the PMC complex and is
+  described by its bus child node. The register bank starts at the
+  PMB configuration register, not at the beginning of Procmon.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb
+
+  reg:
+    maxItems: 1
+    description: PMB configuration, keyhole and address mapping registers
+
+  reset-controller:
+    $ref: /schemas/reset/brcm,bcm6846-pmb-reset.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    /* Called PMB Processor Monitor Bus in vendor tree */
+    bus@ffb20100 {
+        compatible = "brcm,bcm6846-pmb";
+        reg = <0xffb20100 0x200>;
+
+        reset-controller {
+            compatible = "brcm,bcm6846-pmb-reset";
+            #reset-cells = <1>;
+        };
+    };

-- 
2.56.0

