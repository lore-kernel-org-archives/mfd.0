Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869FF3AE1B9
	for <mfd@lists.linux.dev>; Wed,  9 Sep 2026 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946092; cv=none; b=LGDaebYcCYX0EKVX9s6eDo0srFgnBNFCjllQr9IV1wLpF5XZwJga3lr7P2B1xaMrKoJd+YQ/NUpzLeAr115HxVy0dQmtn9VZ+Ho7E0qdpD2V8N827TqJHALo4pxKbaPZoYGbhjn31YtOgbWadSWQq09ka/l8LPbeiv28/Kx1A/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946092; c=relaxed/simple;
	bh=LxC8kMJh4jwFnRvJn3SSrwAQzwqAMDmM2iIR3W+ZNrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoM/UfgRz28zBgJUt/cg7Vog1mBpQcutvB31epYpg/G9ZqOQltYa2W2+sE3QuvsI3+FwcGpPGOlpFjL2cc4g/4U51nPlOtJXAhnhQYCz/rhXVdUJ0kDfjBKitqBsNQ1yMwpsqMynbX6h+JxY7JfV5D+b7OQ/raQ5Ke3agCmFzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYVyhCCa; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYVyhCCa"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd2so4965a12.2
        for <mfd@lists.linux.dev>; Wed, 09 Sep 2026 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946081; x=1789550881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nl/aBnK5PFHcg41MgSw1Z+yHeAR93xAdwKOpAL4NF7c=;
        b=MYVyhCCao3ML9YY1oCZnFcUq23QdTHmso50VFocOfBx0A/Z4CmbwIONqwEnl9vCv6R
         FnpxAq0MIJ4PsojvATotzUo+iFz+nvA3APXvHWTAsf2BbcwwK+exJff5ha5XeU+avukh
         gQAbmRYTtpw/7FCEIiRS5hh58LjE3IvxPSxOAPnNIil5giaFC5gre+UInmSce0PCO5Et
         yEl6uhRW/8CWaDCtEtiHbAtHqdhPmviMoQcVHbght8f9G28sfNHlyZRljaWhDbWjnNVD
         uAjGOphBL9xEGMBc13ZXLhGIOW/sNOMb6H8YhnlFbzHmgCku7xjDyDvOOaWkDPCR1F/N
         G8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946081; x=1789550881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nl/aBnK5PFHcg41MgSw1Z+yHeAR93xAdwKOpAL4NF7c=;
        b=CN8lEzljniHn42FBlMeECObFeiXh5js51F7og/XpfmlnorundDF7pDsLfvpySGIcoW
         Q1eD+LVZOkJD1u3syau1iBhJcAd2nw+a7WDj11ogi0x3Ri4wzBcOWNtAfcmTXU6sGpU1
         vKAfVMGix89PgfyimS2PeLpz1bsVqCRMOvkFogxWDuwrbAi9V0OzYmSHcWOWIOamZN9+
         SWOMIZnmdd8jx0FDIjg7A9KzzC03MmjTimOdtU3a2SZ4AUnrTZQ9fh5Ko5tRVQwu2p2S
         7pYprw0D7Vb5iXAmcoX05fiIifq3e5daZUIl6/sY/grI51zv1hTjp7l4fpM4woESJkru
         HZfA==
X-Gm-Message-State: AFuF++mCjUp0ZDqStrwlTcJhnDHLRdQmJr/dg+83rlzX/+O1Qucx4U/5
	mrG9Rwy4ogpYOutlSuXa9+Y7W5R1ZnkRoNmHIWsAsk2flodM3L507QhS
X-Gm-Gg: AYBFou0SPEKXgMhgqwctHdsMk8eUxVda7vfoSw0CA6yi8l+XbiqVynMLgtpylxcqqTR
	GrLrQvm/99q1AReW22nbj/E4y0yYg3TReVvgD2vR03N0/tmL/8etbHMZYLVTwmw1hW7NMj0Ek/3
	CoP5pdX8GhA4fruV9ZaNcp3kfLqm3iy7gMdxLNkXebCbRW2sztuUbwjKdgHDkn6L3H2nxs/uXdK
	CtFAEEjYEu3Mtt4U2JKCWS/zLT5hRBWGf0j7ebdLu82dycL99Ldv6tLkluNrZyhXHmBNmvN5PwG
	4j0mLsXoOaZo93ngUkxiaJmMCG++QLzDlKVxsy9B4JvIWnSypdcylD3Z5rGeXf5nrsTsJbmzJFF
	aj+T1vD0fNNRa1SQW0SOpn/WhDbudibw/i21dv6cZlDv6xo/ZOzulZ6oHoId+htk0vws5d6znSZ
	WEglGHMBAY6WN/LGrtA9KGkkaYPwD2UkvQ1LQLFc/e5GYEYcdNh3cE8L9+FWhAFyby+WOMhEoX5
	b4MTrLVlgJY
X-Received: by 2002:a05:6a00:b82:b0:857:4dea:e20e with SMTP id d2e1a72fcca58-86942f3f103mr305995b3a.0.1788946081268;
        Wed, 09 Sep 2026 02:28:01 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:00 -0700 (PDT)
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
Subject: [RFC PATCH 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Wed,  9 Sep 2026 17:27:26 +0800
Message-ID: <20260909092728.1859-2-yaozhonguwl@gmail.com>
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
 .../bindings/mfd/rockchip,rk808.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..00cbb27 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,23 @@ properties:
 
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
+      here.
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
@@ -113,6 +130,9 @@ properties:
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

