Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2701538736C
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734128; cv=none; b=YVrEpGjj/kry1aRLaLB7qGMP+JPRgPhCbO3u0Ute9tLElFxWWVqdqYb7iQiLb3+RU6iNm5DKHn5fhua13I2NqGMbIgAnXNRbAU2EAf59bIjPi4sR9/eLQWkoE7oKnvpsCEFEmcxG0m3zL0ZT4TJQfGKgmCq5mCpk76T94b3QZbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734128; c=relaxed/simple;
	bh=n3evcqugoeKkN8mct7F9d78wCyor72fP/A5f+80l5jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBm7gf/MYvnBkggbiQaUqKpY+Jkm3FaPuNUf1ZbEsIhhczaasYzzq/I+Pxvs/Go2uMzBfN6EfcA3Vd4+TsviZm2so63B3Np7mzNpeLkXawBzyb9j2uyC5HD9F+0MA1fwA5LFi3vI8MpxNqYYnRWU7jEoMeubR0lHjp7ZZmDuzpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l620XnLG; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l620XnLG"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7ec49608332so1441068a34.3
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734126; x=1786338926; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDt8py0RwqfKJ99qa00T7ayi3DardBnaCg62Nlf4UJY=;
        b=l620XnLGL9QhCX6s/+BqVn1hwf5PWcLx/AwBSK0LF4CgnAX8ZbtkAhN82vyQX77I9t
         eAvfxuTsrq9tkegKbAxr/+dIIioDLPmGg6TzEjHvHyn6hQzG9EjaqIU7VyqeJhE6aY6q
         DEh7ztBos9+mJjVoZfsRPwYNi5+ItkTGs8BVgw5Zde/VUcokMEQYpwvoAXcFn9oCI7UG
         XAuIsAiga1uUno3Yaf9ltye1LXtcbu2ZFjSqiSAjSqId43K4SyRlKyDwZLLxFIvw9jbi
         1pvaRrI12oKjpR7IrQ3cPTA9oYAg72v+IPjJLwJ/iqtDHbMga+Ka2QzZb+VhGFzouJBK
         Lb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734126; x=1786338926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDt8py0RwqfKJ99qa00T7ayi3DardBnaCg62Nlf4UJY=;
        b=BeJkUd/uoC8PSEMEBH4YQWFK8RRgAmINDyQtkqsQBxCH+CkgDm87sOjW84yLg6K0x/
         MBz6nkRh+rZP2ZePekZuUev1clvtEWNW/Xt/uxoG41Wip8blytwF68fp0sz+QyX9HLrW
         A9DGfjpLeSJxyzSiBSPR6H9xGUPmP/jQZEqKxdgF1s3hJJMYPxzGuRJAjDT0nRvorbgD
         bULN8gTTg0ltb7SDyl/LX8Fe4kk1ri7ruQvl8PhUwBo24xgI6snBTqM3HWlco6BjRk+X
         xRUE3uOAUCUsrgB4AzpeR65LTq4+IRpljiwDGY6AAhV5ggwLqgvozhC1HtrYwwVo52Wz
         AjWw==
X-Forwarded-Encrypted: i=1; AHgh+RqmP0JxhwNc7Pl8xNOow1xVgMUXRPt6i2iPLfHyDTjgr9ETAxLfROwgVBbHqtMLMZf6xJE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa2OE3h357l2zi84iXYgXLJXV+Z/ZNdXxWhdDn2iNdrwqr0qC0
	b/malAsWXwNeALcPAnwcU1P0/EuIQodCLcRp11vN+/DCEkRUqR38GqGU
X-Gm-Gg: AR+sD10JwXjqRhwBY+JF9i2sIT0lBQi7X2cBeoNRBhvladhqiKIIC4HotN4QNFLjTpw
	nEF8Zyo/UqfAGiYZNg00XbH7gv3Sx1xVnh0Ph/0tpNwoYFAOAX7UK9wq1aOj2h+g1ebxupN5OSB
	AhOsndWYpgG3Mk0kcpe3tFSy2lewsSv2eEeI0gAlz6Wl7i/5AxW1U7aZagKIPUCwRRCJ7hFzmSz
	XTOU1mRZR3dXSm0KwccXqFXg7s3xCG4FHgFeP7SWP2uPb7+80yGKX5HTeM1U9ye6CAhjdzZo0We
	C01hhwGF2MSwtdguh/FNSvSrh8FhFWKQr+QqfCLcUA4NU3UpRESHN+imWdiOuMnRKkRuyEuV9z6
	7uY/Rwrsw5EHIUz1jnXsPvVf5oUey/cU4U17AKsZnHsxiu/bIqVOEkYqFwYz/9awhzRAVu/zJxl
	0XfjnpZipCyzLFhgeGEoPKY1DESiKz0mIKItTnouhdXRNi69ZDZrEKTNwWG4HI3F0cRWzJbMUS0
	IJgiEM0BqYnWBpsw8FqQXXzDmEv3GYZB3VGo3ZjuLXC87qmj6epKipc2Xc8aNkxHCZP7gAls4uU
	8X3fHi+kdvwvz60Z19p651dZk5qEvcbHvDnq1azLotE5sNIdKqUEG2jmDgk10HHMvtrFO3dpUJF
	wFvKF9Pw7qiDmqlDOpx7Ie29AohqvylMP0+78
X-Received: by 2002:a05:6830:83b8:b0:7e9:d277:6e2e with SMTP id 46e09a7af769-7f196cae28amr13872954a34.7.1785734121347;
        Sun, 02 Aug 2026 22:15:21 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:11 -0600
Subject: [PATCH 01/21] dt-bindings: net: allwinner: add H616 EMAC1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-1-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. Add its distinct compatible
without an older fallback, since using the primary EMAC clock register
would not work.

Constrain the PHY interface mode to RMII, matching the hardware. The
EMAC1 clock register also retains the three-bit TX and five-bit RX delay
chains, so allow the existing Allwinner delay properties for this
compatible.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml        | 18 ++++++++++++++++--
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..34def84e6c21 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -21,6 +21,7 @@ select:
           - allwinner,sun8i-r40-gmac
           - allwinner,sun8i-v3s-emac
           - allwinner,sun50i-a64-emac
+          - allwinner,sun50i-h616-emac1
           - allwinner,sun55i-a523-gmac200
   required:
     - compatible
@@ -33,6 +34,7 @@ properties:
       - const: allwinner,sun8i-r40-gmac
       - const: allwinner,sun8i-v3s-emac
       - const: allwinner,sun50i-a64-emac
+      - const: allwinner,sun50i-h616-emac1
       - items:
           - enum:
               - allwinner,sun20i-d1-emac
@@ -91,6 +93,17 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-emac1
+
+    then:
+      properties:
+        phy-mode:
+          const: rmii
+
   - if:
       properties:
         compatible:
@@ -100,6 +113,7 @@ allOf:
               - allwinner,sun8i-h3-emac
               - allwinner,sun8i-v3s-emac
               - allwinner,sun50i-a64-emac
+              - allwinner,sun50i-h616-emac1
 
     then:
       properties:
@@ -109,7 +123,7 @@ allOf:
           maximum: 700
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            PHY interface TX clock delay chain value in ps.
 
         allwinner,rx-delay-ps:
           default: 0
@@ -117,7 +131,7 @@ allOf:
           maximum: 3100
           multipleOf: 100
           description:
-            External RGMII PHY TX clock delay chain value in ps.
+            PHY interface RX clock delay chain value in ps.
 
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2449311c6d28..102ec98ac2a0 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -57,6 +57,7 @@ properties:
         - allwinner,sun8i-r40-gmac
         - allwinner,sun8i-v3s-emac
         - allwinner,sun50i-a64-emac
+        - allwinner,sun50i-h616-emac1
         - amlogic,meson6-dwmac
         - amlogic,meson8b-dwmac
         - amlogic,meson8m2-dwmac
@@ -622,6 +623,7 @@ allOf:
                 - allwinner,sun8i-r40-gmac
                 - allwinner,sun8i-v3s-emac
                 - allwinner,sun50i-a64-emac
+                - allwinner,sun50i-h616-emac1
                 - loongson,ls2k-dwmac
                 - loongson,ls7a-dwmac
                 - ingenic,jz4775-mac

-- 
2.53.0

