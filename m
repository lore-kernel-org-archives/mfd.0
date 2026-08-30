Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DEF2F0661;
	Sun, 30 Aug 2026 22:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788129866; cv=none; b=dGsifsCd0VXL0fYiG/urA/q74fUDCA+aUiVfZ1RFxcjfnm+nb7aD1U/lxkQJyKwafhKKZVUNabrRUayThxXi3fsUgVNAso08rVC98KPcPx/9xS6Rb8pXjPIBqR+btuggRpywx8r5G7vhLwhCJ1C8pDJ4W3dZo5CPsK6mGYpp6+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788129866; c=relaxed/simple;
	bh=K+UUB8MtjeF4ZHHbCLUmzjXdNUN3kQXf4WwKtskPaIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sA6xV4BX5unTSe5QrTMHKpd1gXRxfX/v251HPg1Nr/C3d4Otd02LyY+bvIcnBAoXkwYet+KqFlWGfDS31KPYteXgCzpiIakSHYffRmodJ0oxRBReT6C2VI0jwcYDPpr9f+Zd/UE4Eyg4RLwtCi19Xx7qJy6dJrDTmS8rC91V7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imwNJmWb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imwNJmWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F901F00A3D;
	Sun, 30 Aug 2026 22:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788129864;
	bh=fk/B8z7/c/3J/r1W0a/WdHgNj43GYE9PEeVOrA6jt8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=imwNJmWbLITb9/SkchbMFEONhvJt5Y6rJGa9fXkfesmLf+U4dByH6HNcQJh3xznXz
	 h3nBRyc+M0RQtrQpQSHMR5xrqXkZR8MWcGr7NUVCMugWQmFljzcY8A11O5pso3XMJZ
	 lHTig6GEX/gfK9j4m7WQ9xWdsY83KbZx4e6wnbpngFrtH4BVMT8SOUcZPMd5uu5VuB
	 cEr8n8GutNVMG8i0GoVOiw6eHJ3kEdDrxVuA/+AT9AU7Yw+irG6godx++G3s7HWIbu
	 WlS8ISEn5S8s4hAr0+aZBoyYyKQnVKVnBZ7l7m8A/Yu1djKjh5cwSRHBdbGpCKjZ1I
	 rQ/qQvgpifKlQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 00:43:37 +0200
Subject: [PATCH 08/13] dt-bindings: mfd: ab8500: Add regulators
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ux500-dts-snowball-regulator-v1-8-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The buck converters were not initially added to the device tree or
drivers as they are mostly always-on, but their outputs supply devices
which need to reference the correct regulator.

Describe the six AB8500 buck converters when the regulator node uses
"stericsson,ab8500-regulator". Describe the AB8505 converters under
their native VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM names when
the node uses "stericsson,ab8505-regulator".

Keeping the two namespaces conditional on the regulator compatible
avoids representing the distinct AB8505 VSAFE and VSMPSC rails with the
AB8500 SMPS3 and VAPE node names.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/mfd/stericsson,ab8500.yaml | 102 ++++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
index 0fdfbfdfe88a..d44652aede0c 100644
--- a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
+++ b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
@@ -439,10 +439,110 @@ properties:
         $ref: /schemas/regulator/regulator.yaml#
         unevaluatedProperties: false
 
+    allOf:
+      - if:
+          properties:
+            compatible:
+              const: stericsson,ab8500-regulator
+        then:
+          properties:
+            ab8500_buck_smps1:
+              description: Analog buck converter for the VSMPS1 1.2V I/O
+                and memory supply.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8500_buck_smps2:
+              description: Analog buck converter for the VSMPS2 1.8V I/O
+                and memory supply.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8500_buck_smps3:
+              description: Analog buck converter for VSMPS3, which supplies
+                the VSAFE power domain.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8500_buck_arm:
+              description: Analog buck converter for the VARM processor
+                supply.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8500_buck_ape:
+              description: Analog buck converter for the VAPE application
+                processor supply.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8500_buck_mod:
+              description: Analog buck converter for the VMOD modem supply.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+      - if:
+          properties:
+            compatible:
+              const: stericsson,ab8505-regulator
+        then:
+          properties:
+            ab8505_buck_smpsa:
+              description: Analog buck converter for the VSMPSA 1.2V I/O
+                and memory supply. The selector range depends on OTP
+                configuration.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8505_buck_smpsb:
+              description: Analog buck converter for the VSMPSB 1.8V I/O
+                and memory supply. The selector range depends on OTP
+                configuration.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8505_buck_safe:
+              description: Analog buck converter for the VSAFE permanent
+                logic and DDR supply. The selector range depends on OTP
+                configuration.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8505_buck_arm:
+              description: Analog buck converter for the VARM processor
+                supply, with a 0.6V to 1.39375V selector range.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8505_buck_smpsc:
+              description: Analog buck converter for the VSMPSC multimedia
+                and graphics supply. The selector range depends on OTP
+                configuration.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8505_buck_smpsm:
+              description: Analog buck converter for the VSMPSM modem
+                supply. The selector range depends on OTP configuration.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
     required:
       - compatible
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
   regulator-external:
     description: Node describing the AB8500 external regulators. This

-- 
2.55.0

