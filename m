Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6279409292
	for <mfd@lists.linux.dev>; Sat, 19 Sep 2026 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820994; cv=none; b=FxHXCQld1OPCPPrlpjmH1lJBPPQJlExNca7PB5h/96s0geLn4spTeowZE4gLa8zDSe0dPl/Cdsnkq/n5x0k8auGVjgGFE3Rgo5iRq6sHGn17/FrCzv5h+jjKsd8j7wl+4RbCQ9tC5DQ1YtRqulf0zu+LzrA7058O4QGGTydu2/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820994; c=relaxed/simple;
	bh=7UirNnKptkM23XV21O98MU/F3kZMMKqkqZFRUqz79+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFkVZV7joEf1YUocl8rkMe0TUZrsbN9OZ1ak1opr5zlunbYQXImZn31PfC79V/FCTP/LAMvbSLYDLZ24DbBtKepV9+tEsOq4j3yfDAZW5MFiONJqgSGheyCWj8zNdS8luazipmsm1sDdSt0RseN0iKjAsDA7HSGS3iqx+Xp1xzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxbY75cg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxbY75cg"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6185so10179415ad.0
        for <mfd@lists.linux.dev>; Sat, 19 Sep 2026 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789820991; x=1790425791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8MmcjKlyf4A3stJwDXl+4IDRDF8eUG006ktFMDeykK4=;
        b=kxbY75cghivWX8W74hgb5beR2/yRSPGpiBU6hqnsmjchGpR9yyXWuhP9t+ktC3ddRf
         2DC0+25pxaOuuWAgvgt3bd5laCIvHWQirNLTATM8UDlfib5HXvGyMEfL2fi/1ePpT1bs
         AU9mYpWX+YjGKsrwPHOR8oIYR7+6oHr8HX2zN//XlJNHa3Ov0/VdmIo9XKfRzftMZeR6
         QtyKswsD3RvVtVe9T16pfSM7666fd56jQ+gKwLWRoabY0dZkPtEOgNL+udaE2xgv00zI
         ZA28t9/wjd+J8rXo7ujghdKIovYvNFLVC8shWGZIk7hjSZsgiOi9wnNEjkmXNxlDcazG
         t23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789820991; x=1790425791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8MmcjKlyf4A3stJwDXl+4IDRDF8eUG006ktFMDeykK4=;
        b=h9w+FQBmUdhL02zvB7zb1xVL5tD1ylYxjehpLpcVVrgd43xyL0uhn/BhRJZ5iBfY/0
         tQAxsiKDvCD/j+jVwqqTJpKX2FL6Z5aCARic60zDhLb3dzkO6/GxiOWaItZ+Pqrhroz6
         HJc5UcuR4ipWEIYe9MT+jgubTYm2dv03aIsLAf9HOgGvr2/U8cZRYoRTeq2s8Fv8FRFy
         LJYqyOzuD1MTKgQt7iGfNPJbotrFnb0pG2YsScnOrQaKWxqJmdIXDlUv4qzKoKMC/OFC
         tcOwMh+6DkmMr9ST510hTZ9OCiX3KB9zxjbEPAngB8Ww7L4wsmRRrmEJ0JrWnI3daj+t
         2IXw==
X-Gm-Message-State: AFuF++mjtSHcScMWI1Qkks681ucY8nLi0G1NVtG0TebPRd5f2AyFg2Wi
	yBSw6R8AL3CeatQbsfyxX7TUpDzGd/Vmx8lMXBvBVzLLuhE5T34rRRIU
X-Gm-Gg: AYBFou2pFGPVqkqqv+eBnyBJyTrml3ca3iqFGGH1gzOHbTZn/2b2oVFOmaJERdzttaH
	USfDbiiXGuWGZkyUGFYw340ohvlPheq+SMzhCUb1Cwo5kAUleoLLElO/7oHoSVFSJu5ikAb9Roq
	lyT/5WMX6KkkHXqy6tgZTsGPKHshrjM47LrXj1S0ibL4hrSuLOagLoTVn1av6M41frc+huGM2H7
	Rkw/60vNmAcFeF14UCOferSpzPMRBj2Z4BXk4oeviu/EVmfawEBnQJlPksuwPplzrSpvrVceWBy
	a5Kn6uVnAZJqTjoKr0ekRjiI/Hb71EBPvemqjtN4ggJLar6aCsvhIoDsBQiuW1pvhyEsCBb72dt
	d1KcxEyIElLbiaAwA3qPJIoH0AtwG1t0FCuMTlDHg94tT6RvxcTeHlc3QU5W1azzh+qG0dNrh88
	2hcxxh3bz6FoU/r5g7b7gaAwPLo0IeufjAeXkqjLltZ3+ocfIS8QUryyNfF9jTCXl1lOycz8uDq
	TBZf8BxIuE=
X-Received: by 2002:a17:902:d48e:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ddb1b9a0edmr96579045ad.23.1789820990640;
        Sat, 19 Sep 2026 05:29:50 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:29:49 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v2 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Sat, 19 Sep 2026 20:29:28 +0800
Message-ID: <20260919122930.1418-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written; with any
of them left asserted the rails drop and then come back up.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk808.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..d59f6ba 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,24 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written; with any of them left asserted the rails
+      drop and then come back up. A line left asserted by another consumer
+      therefore defeats the sequence, so every line involved must be listed
+      here. Only meaningful together with system-power-controller, as the
+      lines are released as part of the PMIC's power-off path.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +131,9 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3

