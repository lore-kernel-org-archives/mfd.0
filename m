Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9116941A51B;
	Wed, 14 Oct 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971341; cv=none; b=ZDFwsW7nDaugChGTMl4HIcP3sKVmwoC6N2yae4Irazbn6D9beI1fenB/r5bs4K40MH5KoaI062QNJ4Bx+2R8JD5k4yh6i+iOl6WKoe52aVCgSN71kbnGhRjfS0bcSXHmrK/rqfQfKdao2eDb/dybzDZrZraoTWfjwpAt1KRxU2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971341; c=relaxed/simple;
	bh=0060hfBOgoxp6mfHGO/tSO9v6MDqhOjwL0atWag24pM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7Fb2/ktNFMFvNosM/TcgnN8eMwp+ch2NImpqrxj13gKZQmhdMf857+xDjVWmRO+NAzcvmCBR9lmE9ujQ72UQ8b+md+Uxw9RW/uNaafKo3EcZVvem1kdft4xV88bqAWUU0aNmpPahgeGbkX0W/vAjicBRr/3KFOnUAxZBIzUMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKbS8uR1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKbS8uR1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10CA1F00898;
	Wed, 14 Oct 2026 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971340;
	bh=fipltp7h58DIRPjsKUqX+pygdBiAII+egwZxMv0noVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TKbS8uR1LitcCwArXDCOChVxR8chAtFKr3+c+wgIx83U3ncAb5GrTSlavuOQ7/cpr
	 gkuh2XOSlhrURbsbYYKx7dmp9VPahiNhjZ04mJHw1U1pQ4EyB2Rht6hcwPOmrLD6WU
	 CC93s+IBi3GS4uC3CZOCTMXg5c1NxzKgUt/EqWbmfkAi7DP4NVZ0jBuvAGGZfy2Cl5
	 xPfEW7bKWJeMe9sacvjcj+sZcfN7FobKXVcqveeRWsFlMOUBVWKjOtEvezix+zbJdn
	 WjfSCQFQO9fR2eacyxNlPtuY1qoGQFEws3Nm2K6xnfTVXtZ5Rw05WqVskd2E9amgBw
	 Yp9RMuUmPc2Iw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 11:48:45 +0200
Subject: [PATCH RFC 3/5] dt-bindings: reset: Describe the BCMBCA PMB reset
 controller
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-xg6846b-bcmbca-xrdp-reset-v1-3-daf5d177e113@kernel.org>
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

Describe a reset provider below the Processor Monitor Bus (PMB)
controller, which owns the register bank and serializes accesses.
Use one specifier cell for a SoC-specific logical reset group ID.

Define BCM6846_RESET_XRDP for the coordinated reset of the XRDP packet
engine and its three Runner cores. The vendor PMB device addresses
identify individual blocks, not this group, so assign it reset ID 0.

Define separate IDs for PCIe0 and PCIe1 soft resets and PVTMON analog
acquisition. Describe the scope and prerequisites of each operation.

Use only the SoC-specific compatible because the reset groups and PMB
interfaces differ between BCMBCA SoCs. There is no common reset
contract for a family-wide fallback compatible.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     | 46 ++++++++++++++++++++++
 include/dt-bindings/reset/brcm,bcm6846-pmb.h       | 15 +++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml b/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
new file mode 100644
index 000000000000..c8a1e5132fa5
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/brcm,bcm6846-pmb-reset.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/brcm,bcm6846-pmb-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCMBCA Processor Monitor Bus reset controller
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+
+description: |
+  The Processor Monitor Bus (PMB) provides access to reset registers in
+  BCMBCA SoC blocks. Each reset specifier identifies a logical reset group,
+  which may span several blocks that must be reset together. Blocks must
+  be powered and all affected users quiesced before requesting a reset.
+
+  BCM6846_RESET_XRDP covers the XRDP packet engine and three separate Runner
+  cores. All participating blocks are asserted before any is released.
+  The bus interfaces remain accessible throughout the reset.
+
+  BCM6846_RESET_PCIE0 and BCM6846_RESET_PCIE1 pulse the PCIe PMB soft
+  resets, including IDDQ, while preserving the lane-selection straps.
+  These are separate from PCIe PERST and the controller-local resets.
+
+  BCM6846_RESET_PVTMON resets analog acquisition in the process, voltage
+  and temperature monitor. Its clock and power configuration are retained.
+  Users must coordinate with any firmware performing voltage monitoring.
+
+  This node is a child of the PMB controller in the third generation
+  Platform Management Controller (PMC3), which owns the shared register
+  bank and serializes access to its keyhole interface.
+
+properties:
+  compatible:
+    const: brcm,bcm6846-pmb-reset
+
+  '#reset-cells':
+    const: 1
+    description: Reset group ID from dt-bindings/reset/brcm,bcm6846-pmb.h
+
+required:
+  - compatible
+  - '#reset-cells'
+
+additionalProperties: false
diff --git a/include/dt-bindings/reset/brcm,bcm6846-pmb.h b/include/dt-bindings/reset/brcm,bcm6846-pmb.h
new file mode 100644
index 000000000000..3cf31ddcb66c
--- /dev/null
+++ b/include/dt-bindings/reset/brcm,bcm6846-pmb.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_RESET_BRCM_BCM6846_PMB_H
+#define _DT_BINDINGS_RESET_BRCM_BCM6846_PMB_H
+
+/* XRDP packet engine and its three Runner cores. */
+#define BCM6846_RESET_XRDP	0
+
+/* PCIe PMB soft resets, preserving the lane configuration. */
+#define BCM6846_RESET_PCIE0	1
+#define BCM6846_RESET_PCIE1	2
+
+/* Process, voltage and temperature monitor analog acquisition reset. */
+#define BCM6846_RESET_PVTMON	3
+
+#endif

-- 
2.56.0

