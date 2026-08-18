Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85B74519A8
	for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049107; cv=none; b=ro7YC4qGHwRP3YTpo+bLytUK751cA0VtRKDpNcFLuTeVaD2Ui7Dua89qnzI3DBKKvextRGjDSaciEnk2B3ExupZ/mhElYH2kGCshg4AJ+b+D1VdwX7mcN04iYv8ltEcH7Vid8Dlnk0v05/zV8j2ibwoNZTW4lExJ8mfdBRGF6Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049107; c=relaxed/simple;
	bh=Q7nj6LmwwpL1RbkA8x00LOMLutDmfvD1gklz47xTeTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSM20gsCC83GLT4hmSIENHFE1sHa3TvhmwFRbdRMkDGg98wD8YC69vb2Bv6px08RbGclZQlYsBcudUCGWKE2jEwqjOI8oBbtdOvHpU7lVN19NzajrAibSaH15NePIGwhmbhrrq1zjXKKJYuae1qR5rEVCnAjQgGyeYol6Oh5wfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Wq3dA9TA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Wq3dA9TA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495437bb891so8050295e9.1
        for <mfd@lists.linux.dev>; Tue, 18 Aug 2026 03:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049103; x=1787653903; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXAR0pfuBaAQ9k+v1xXQaQosy7aMoQd3gplGbAsity0=;
        b=Wq3dA9TAk06QBt9eLgANVtHkpBWob4atxQ5G2n3beo6Cpn+mPpWePDiDnerbaEuwpA
         Wro+8gy5pMwM8uUQ+LT79YwvJOc/S0tO/vHWOzdELhLnvSlcp27NOQhpSnjegCtgT6Fc
         YOasoQhFmdHlzA187evVWsSpViraJDH0ypa4+c2uMwHK03L6geXMD859V1c5gYwbox/m
         NZru74+sfGQLwISKlWOKPaaotEJ4/gxJC/+yVUDUf9otvJmRd3Wn/7cz2SFf7GRZrz3N
         J1OgWwY8Sgike1EOhOfnvNtTJkrd98LlsY6oAggalL1BcQ6hvzZ2HxAhf5F/MibLhQiv
         waLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049103; x=1787653903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXAR0pfuBaAQ9k+v1xXQaQosy7aMoQd3gplGbAsity0=;
        b=MZokQ2DFahmo9exznxa6sC4PdlpOMJyU/MFdO6c9ujxIB61SAbuRUSxTAUyOfBvGfG
         fKuTMVEICZcX1FGE3hvOwcAb7aPBCPYBRk9j/k1H7R5x+Uusg8BCR61w+uCobbpIV85n
         wxyQqjtr6WjCUD9d63lwRrQp0U1e7qqObjJhgNavDgiHioW5BJ1qqtW6MYaA4wMyV7P4
         muz2+Rp6YzP1ahkqCrE8jU4/jo9RoGGUyqb0/VEnRe4/yPnuRn45WHrkGIaJHDIHLkj7
         ej14FoIJkCu1aMfGXxKII6xfhu9KSnizKqgcOngPG1hL9h5jE2zRXQMx3A81yETuRzMB
         sjPg==
X-Forwarded-Encrypted: i=1; AHgh+Rrb4yyk3Auc609UJQuNQPPOWtbO6jPu4hALtajyL29szUKbI666Fg/kJrBvZyH2Uv7TUUw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yykc+0N9POy9FC+kHaZqSxmSXfeXkq9Xw19YZjLljqX/Ep35Mbp
	p2ZIV0/k+8uJUyJICFm/8CDnCA7Qt/2g/wM26OzqjJlYS34EACIMfvUaIo9vZLlee5U=
X-Gm-Gg: AR+sD11BVqhpMrppiWZwvteQB0PiO0DmDGt/R7dw0k2QRnn08uz8pg3kXQkF5t3j9nK
	SyiVIs+I/HcTZDJFgD18zSyL64RjW3h4xpdslzEutg2UPSg6sU+OEgePQCfJx0Jt2k9/66pnd5R
	SmnhyzaKzyp9cueKt85/Btziy89W5Vnw+kdoGYDrLxVCPNnCGkG1EwfW63D0EseliXLbatV3oS3
	mQlzYHriKLqOp7TnNHCfzaKZojEz9lX58QGRhxxRpogEffqTN/nIqCS01yI/FBXmtachN5hGnJ8
	39TQ29+5J6Emcju7bQIGNyJexjHptnc3o/TTWNkBTkDyTeNe4H0K9ArY33k9XyeAPjcKY3PMYm9
	AonPlOG1Kq2Mxk8XWxHEGdCmrcXzXyHaV9qoKGS7LJekn65NFXkiaWpcgdbIsfo90p2mQ1OQ7dd
	WSxfACe4Kcef5H53SGSn+KP/TgiZ5E1E50doPPW9kzcxOFtHZBeT3FTWX3tj1ciqrn+ggjD4Z1c
	/IVymXTjFOdyEIigaLVqrRhUFo0AwPzvSWeDsff12SzZWQtt2oQ+m8PtGpe
X-Received: by 2002:a05:600c:8b77:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-499a206a553mr70558395e9.6.1787049103159;
        Tue, 18 Aug 2026 03:31:43 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:42 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:14 +0000
Subject: [PATCH v6 1/6] dt-bindings: serial: 8250: aspeed: add ast2600 and
 aspeed,vuart-over-pci
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-1-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The ASPEED AST2600 can be used as a PCI device.
The ASPEED AST2600 has 2 Virtual UARTs accessible over PCI.
2 Virtual UART can be exposed to the host via this PCI device.
These are 8250-compatible register sets and can be used to have UART
communication between the PCI BMC and the host.

This boolean can be set to specify if a VUART is used over PCI. A VUART
over PCI needs access to the SCU syscon to set the enable bits of the
PCI device.
On the aspeed's chips, the clocks phandle already points at the SCU node.
But deriving the regmap from the clock provider would misuse the clocks
binding. An explicit scu-syscon phandle states the dependency directly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 42 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..8dd4b7af0c0d 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -18,12 +18,34 @@ allOf:
             - aspeed,lpc-io-reg
         - required:
             - aspeed,lpc-interrupts
+    then:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - aspeed,ast2500-vuart
+              - aspeed,ast2600-vuart
+  - if:
+      anyOf:
         - required:
             - aspeed,sirq-polarity-sense
     then:
       properties:
         compatible:
           const: aspeed,ast2500-vuart
+  - if:
+      required:
+        - aspeed,vuart-over-pci
+    then:
+      required:
+        - aspeed,scu-syscon
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-vuart
+    else:
+      properties:
+        aspeed,scu-syscon: false
   - if:
       properties:
         compatible:
@@ -106,6 +128,9 @@ properties:
       - const: ns16850
       - const: aspeed,ast2400-vuart
       - const: aspeed,ast2500-vuart
+      - items:
+          - const: aspeed,ast2600-vuart
+          - const: aspeed,ast2500-vuart
       - const: intel,xscale-uart
       - const: mrvl,pxa-uart
       - const: nuvoton,wpcm450-uart
@@ -297,7 +322,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     maxItems: 1
     description: |
-      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
+      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
 
   aspeed,lpc-interrupts:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -306,7 +332,19 @@ properties:
     description: |
       A 2-cell property describing the VUART SIRQ number and SIRQ
       polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
-      applicable to aspeed,ast2500-vuart.
+      applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
+
+  aspeed,vuart-over-pci:
+    type: boolean
+    description:
+      Enable the VUART over the BMC PCI device. Only applicable to
+      aspeed,ast2600-vuart.
+
+  aspeed,scu-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SCU syscon, used to enable the VUART over the BMC PCI
+      device. Only applicable to aspeed,ast2600-vuart.
 
 required:
   - reg

-- 
2.54.0

