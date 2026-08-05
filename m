Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE28466B1B
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 12:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932435; cv=none; b=IpzYb9sPH8ajgODncIjF7qUJi6v4QnhFVf7QJKSAjBcxXZFcGVfTGZ5NEOiC+6nCmKW970fBD+zGlKlVV8Ml2D4NdYeNnBeMk0ajiVYzGvLCdT18WNi46VtpHEMp19S1xXkF/oLaMTuIyktMGUwnqKI1IhJ3fVB+ftiIkJYbikA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932435; c=relaxed/simple;
	bh=3X7WL8xkq/xgDF1Yg+6dXU2AAPke6iAzEkoxOpEOTPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dJeifXPkH477GYB2R9DQzzXzYCDpjH+32Pl0R+1/XPdLpE6sVwGC1YT51ux0pFcacI01sqt2M9+6TMPsVin8XDM2KJzV1+y3fxshxnhZK1z6x7DCJgWyEiuJXvs7yglRqXF3xL+Rea7hk15gAQw3uS5OfTK05w20JhmtFEAV21g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=UNKu0Nvr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="UNKu0Nvr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso8730375e9.1
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932432; x=1786537232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bz6C6stmStVMzEFUIQDnKapYsxwqb3V9iw0SJh4YNFs=;
        b=UNKu0Nvr8SKJaSKogVMMf2qdCUkrACaA54TCdK3MSsr6MKAQJVEFIk5cpVA4/7LUj8
         xaIsrHv67r7k8fQebzHCiqd9pAvc1Z+i40uGR8XIYEWFeZFPDYLJNS3IHUGlw7T4JCWE
         WKjaKqHBcnbXRM3TzACAjpBPEFK3QgcjmlHZCFbt3QVyHIXJVbgQ3iVK5NNkc6vcv3GM
         zxuaaC6BGQD0S2SDpKv+MgpmCaRXBB6HJEmCTjctJA/0CTathwrHHLx6d2U4a62TP56h
         6P+Jp0m7xDhpZu1uRctKBq+HfY6T4WRzMx65XV2xc5iGrjmJvKg/G7Rdklda9ujyKYKf
         uuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932432; x=1786537232;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bz6C6stmStVMzEFUIQDnKapYsxwqb3V9iw0SJh4YNFs=;
        b=seg7HY3xfwWAKu2fIsY/s/Abm3OXPVR7BfXImseLU9DqfADc3IDFlM4PRAeSDRvts6
         vdW3spB8oFNWDxPqela7afbnUpsXuQjDKCnUjPwIfh1O/w37X5RB3AMj9nqw9fFrwifL
         H2k+pFB89OkLvIolpnmrklDTHk+iZgObH5dV2/3Nak3IAc3KYuzlib1gsFxTvWoiAmOU
         vt8mCyIfVFbrUuU7uYtAtAM5PDOndBOF2XlhTJoW6oNVua3zA9UeiU/mQGVE+WssUwS2
         Cp0ICQ8JZejaBDy3BALFns7HFBr9g5qbGN4fs7xhoakpdSDDlezS/hCWbX6/oIcNHQho
         dqPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoN3DXlTf/RYkvA6WgFFcFXUtYgcKmeXq8ShXN8/YBkrocq15w61ECMlcF+rLAY9OnfHC8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxURL7yT+KMoYRs1qTcnkCzkX59SlIUgZcZHtjv4rA4EXU4wM66
	BFxH6NmuBZHH8Nzw0n0VYDPqxuMD8I5qkJoAKlQyCdN+Gu5cPipURbIsTGRv2zWC554=
X-Gm-Gg: AR+sD119BdKuszh40lnvJOZsZPl9SXSxSgdVpbmDxdJxUOKoOE8ZlAWhXnPhDcnRkux
	LLT3cPLA+uQRhjUvzxHLPj+TsHbbzEsvvke2vqEU7vl+8CJqiePZziZ/0RmZd2+dP1jGu/G1pSo
	i3rQF+A4d8bCnqa/AXVQ96lrNvruFFNql6AejNUHao3izP2j5Sb5ttDekmjvdQZB4DC9c0R2+/9
	crXxpGw0Ws29grhExHCIJWQbxxrQQwF/O2T0UHxZ8cdo/2CxZOoF/REt2nAeLFgPg89ImoihO3m
	wOzdAI1jQYxAwZEoiHtgkTpPDM0P1uKIfYluJq8Bd9pcqH1FJj8I5H15iktYaxWBF+3N1MPPGM/
	d9Hp5GIazAvO8YF8oBD3neNWl6PdKK4psyXhIPfs0QTWYtNVjobbGdT0PtdWCGugQguKCxecT2l
	hiVrCLjlsFhordgZVoV5KP2o7wh+hurZTgauoOA0ugnYZ2W31Dh6B9iPNHS80OpGrRitfz+o0yg
	UWNYV4PRwnoTQoUCQekIMTkHKW17iGCQye/vuPdn+BYhSIvpgRg4CC4dsqlMERS8yPxn/1T4R6Z
X-Received: by 2002:a05:600c:198f:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4994e7cc5a4mr72969715e9.15.1785932431891;
        Wed, 05 Aug 2026 05:20:31 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:31 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 1/6] dt-bindings: serial: 8250: aspeed: add ast2600 and aspeed,vuart-over-pci
Date: Wed,  5 Aug 2026 14:19:48 +0200
Message-ID: <52d5bce1cf8ec3ff0b27e7313655cf7ffa2236b5.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASPEED AST2600 has 2 Virtual UARTs accessible over PCI.
The ASPEED AST2600 can be used as a PCI device.
2 Virtual UART can be exposed to the host via this PCI device.
These are 8250-compatible register sets and can be used to have UART
communication between the PCI BMC and the host.

This boolean can be set to specify if a VUART is used over PCI. A VUART
over PCI needs a syscon phandle. The syscon gives a regmap to the SCU,
which is used to set the enable bits of the PCI device.
On the aspeed's chips, the clocks phandle already points at the SCU node.
But deriving the regmap from the clock provider would misuse the clocks
binding. An explicit syscon phandle states the dependency directly.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 42 ++++++++++++++++++-
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

