Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164178;
	b=cVdwqC/yTAXRJxjqcyMVapYMOjEPc5XquSrTAcwh6umuwNpl3wjPE98fvCBsnf30EL/o
	 4sK9Kwii5YSwv12l+UUYh+jlJQbAHIIBqHuTmxdt4/TDmEb5x3csfcbzxUlXNV7Nm9p5i
	 4RxLLibZaDjPPC1dX51gNvNUZAas84KqTgid1KkQIrvnMzQxoW4zztjOxK6KmoPrT4xT4
	 uG5gxgUNayEBJGp9efQOpl97lBkIqLIo+txYaE3s4xAAIavjedmgnrdeqrNXeQtoC2+kH
	 py1SCIYgCEgslqoVzRfUMxl94P6hcPYEp/D+h6Ltl9zzp4qncItQFwxZMgi1wK7nmvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164178;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=+1lJYtcw6OQFMO4dJ/PuwxGhumkrMqkJn9g2Egf88P8=;
	b=PXdXS9So8kWy9MHKOQjvl8ZGX/7Yy/MUVvtAgRwXVcIsUXd8dhgRGF66vpzkHg89YtpZ
	 tqPTAqKp4XyOW3zlv+LXITNK1Nx8pZvtRhGwFp65aW/XJmg0KqfiOKr2ZO3YyrWtayrA+
	 gcEUBHqlJPn3wB0pPLYV7fGKyZsJ15nh3+BY5O7GKpMp2PE8mjfCg6wnk64r3Wcpf/pZx
	 5JJuen7sGD94+zq1HIs1YBsi198kRGqrOE3cLXdfHmHGVINRTXYGJMB7+86+n0qnPzW/J
	 SC9c1PvdW1kp98z7WJwupYo0k4sD/qy9amNyqoRNIc/hKKmKOMqIRJbmkLaTssguKRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VtWaAAZS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EAE606B487;
	Fri, 20 Nov 2026 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VtWaAAZS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273C61F000D4;
	Fri, 20 Nov 2026 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795164177;
	bh=+1lJYtcw6OQFMO4dJ/PuwxGhumkrMqkJn9g2Egf88P8=;
	h=From:Date:Subject:To:Cc;
	b=VtWaAAZSFX1ll6fL8pFKrVAlDRGPO+tXtpOZ6oJX/BY7HbxWw46OZ4oh+wiEMAi/p
	 HtHYqJCrTEVDLj+NxTboRWyG9AgN/WYv3UacA0wAZamRNA6zua+0NN8iVgu1m7BkbD
	 OZsa1BAmzIKRdgRlDz4qkGI8iFFYKMC6m88ba1uYjvmXxxFR0XiXD12rAobIuxewPf
	 E4wmPI5GguqB5ShyfqTR9vpEl5oCbJdc19dr/GBO92LTO2NfAH35SAoXpPprUPzxbm
	 HDaSUaQQ1VP+pZVXI0LrPgBWtgfA9CTsBRMsPGzFJBmTTCPwMl6ya+FDUr4Az/48Hw
	 R62xO086Eo97w==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 09:42:53 +0100
Subject: [PATCH] dt-bindings: mfd: ab8500: Describe the ULP PLL supply
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ux500-mfd-ulp-pll-supply-binding-v1-1-2740b61bd839@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQrCMAwA0KuEfC+QdnNKryJ+OJvOQK2hpTIZu
 7vgu8DbsUlVaRhgxyofbfouGMANgI/nvaxCGjEAevazc56pbydmeqVIPRtZztS6Wf7SoiVqWWk
 8j5eZ0xR5mXAAtCpJt39xvR3HDwUaLghyAAAA
X-Change-ID: 20261120-ux500-mfd-ulp-pll-supply-binding-373860f4d0b4
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

VintCore12 supplies the internal ULP clock PLL on the AB8500.
Require the supply on its clock controller so the PLL can be powered
while in use. The AB8505 does not have this dependency.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/mfd/stericsson,ab8500.yaml    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
index d819954ee731..6b995c397270 100644
--- a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
+++ b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
@@ -60,6 +60,9 @@ properties:
       '#clock-cells':
         const: 1
 
+      vintcore-supply:
+        description: VintCore12 supply for the AB8500 internal ULP clock PLL.
+
   gpio:
     description: Node describing the AB8500 GPIO controller. A few
       GPIO pins available for misc usage.
@@ -652,4 +655,20 @@ required:
   - key
   - regulator
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: stericsson,ab8500
+    then:
+      properties:
+        clock-controller:
+          required:
+            - vintcore-supply
+    else:
+      properties:
+        clock-controller:
+          properties:
+            vintcore-supply: false
+
 additionalProperties: false

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261120-ux500-mfd-ulp-pll-supply-binding-373860f4d0b4

Best regards,
--  
Linus Walleij <linusw@kernel.org>

