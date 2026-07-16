Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A92143E079
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222281; cv=none; b=E0W8XgGC1mEt0EJm9/GHiNf5ck5a0MEBwWG7H5NYV4dNnz6NW935QmGH6Erz8QO4yARijhCwBUenep/OTYcayKYS60ZWpnC14ICKak74b+VJkKpY+/ZMNRO6aRX+fwCV68ylhlDPVD6gJ9lJP34BM+JM8DuY9UvzrX7Ydh+vB6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222281; c=relaxed/simple;
	bh=J0ZsmPYEowQMOMxEQ5XSmmwU88gF6MVEkonHVpC3RRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrgbvMISEtBG5w6kOMQHGitcNAArckEvZxMgyjF1mfzruCFmRXoxfJUC2Qq70EkTAa6kPqsFpUW5AI3/61Z0yCFRglbZXC1E4PsFnZ0TKMP21m7td4kX8yZHxrDtuynxjPhS8NN7kU2aZw+pLi4YRUq0b6pA3d0ivccailBUQCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyZ1oXhi; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyZ1oXhi"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caf228a910so54073955ad.2
        for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222274; x=1784827074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YOzE4Dspd5jzvIIg5G/ODj4WmBPO1vOc7GQ0jrswag=;
        b=kyZ1oXhi9ztrxacW8ldvz5+DfBDpjVQAB1GatrvrKfvLu3xbxZ9+jnE+GQkifv/6xr
         ebuzXorX5zNx0BCjvNiZEv5O6GHIpHxSvlLCSnwtqjjnyJ1pjgiKBLaeNB5x+IShSXaJ
         Hh0mYlMkvTpvo60G5qhX8CqeIrcNVdZei2LrftkftvLlYY1e2cfcQyeXLz7ehUOD0Xr8
         c8Jog5R5r4Ocb+3o69w3eAD/VhB+pZaOcSDvyK5uD2GDm0PGa1CqzuU0JcCdiv9pjjh0
         wJ/XKRLAmdrdUqkXKKEbiSWI43KA2anEwNO2JEuawYZpOdQlVUj58xR6WraO12xJpc7q
         61LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222274; x=1784827074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YOzE4Dspd5jzvIIg5G/ODj4WmBPO1vOc7GQ0jrswag=;
        b=jjfKLCy+LN68hL4tk9FqmP4QZLdiaOC53ys7Fx/jnYf+lC7jP9yRFdYJNcQKoLEEtL
         RrdSIJJZ7UmYxFKHM52PLLx8q+/Tfq/2ykMXffgN9jYgziqMxULy+udkBwB4kYJd9jMa
         47IG0SD6ZQGwNwH5d/4w9COfAhybpHpOoLCAzg8sLa6IA04SGa/ocNe3BDhInq1pgHme
         jlbf2az8tWq6LqfsJFwnne2q/u/TuaGeGxj52KIW2B7TRIMbPcz4/Xes9ZJaq+7TVudV
         TS7PHBwLFyJoPJjTwaTLYNNJT3GpTwEsQPQBzitxwTz8LcoW72PxhXZcdLPWkPd+kldp
         c5EQ==
X-Forwarded-Encrypted: i=1; AHgh+RpI40mKymbIcltHs1+XVgJi2ebXCwAHmUsA+wUP6xt8U85BHrsgYwVzWClgMhEjQVOtP/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwW7Y4To5wO5T6J25ho9XjGWsCIHpeKNdNNws/6oNsyqgeD9HQR
	xXaK7wQHuCde2U2IzYV01YSCZnMptTBJD5aA1+Xjzw6FLRF6FpDg4DeG
X-Gm-Gg: AfdE7cnxPo2+HmF+F5Fyx9rM2i6WkS6xpniwOeyZwWQ/VQcX2bUsrfxVDMgrqajiB0r
	HvFkkXU9QHNkIpdhRs7AuEjzn25DGUfb0bL9m3BL5Rm5HfqhkRXm8XPFmXJ6RBJ4doSAGANnBIp
	Omk8q5lK6wFkpYm1KJKDuaDdMJp8VHqGMtUo9xTuRkeqx6tY1eMzyL07MpT6+VVECH2x/hZ2ief
	95TdFCm38ETqjVaIC/L/TgU5a7K9nf5B2TehaDaEVsnBJdQmXKhGFe8CaionEowQGnp7OBYAlLO
	qeQxXjYpFpXQXzKCJOXpQz8hWmorOALcL5dqRAzuI22MNOKfoLo8Jc4e1KWqw1etdxB01N2Oww1
	bDhZG0UGFNNRqARl7aY9PBTf6zNP4uD/Nfg42LpzEkgkhtbhox2DjRCgBRkvvd5SdwBgWwbHRbz
	8kxBjMFMFBj3CleT1chKztvdiv8q76T4mYtQ==
X-Received: by 2002:a17:903:1cb:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2cf03c36420mr81705655ad.18.1784222273587;
        Thu, 16 Jul 2026 10:17:53 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:53 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible for MT6589 SoC
Date: Fri, 17 Jul 2026 02:17:31 +0900
Message-ID: <20260716171733.300885-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for MediaTek MT6589 PWRAP.
Also update the description since MT6589 has pwrap bridge.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..a487ed39e6cb 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -19,8 +19,8 @@ description:
 
   IP Pairing
 
-  On MT8135 the pins of some SoC internal peripherals can be on the PMIC.
-  The signals of these pins are routed over the SPI bus using the pwrap
+  On MT6589 and MT8135, the pins of some SoC internal peripherals can be on the
+  PMIC. The signals of these pins are routed over the SPI bus using the pwrap
   bridge. In the binding description below the properties needed for bridging
   are marked with "IP Pairing". These are optional on SoCs which do not support
   IP Pairing
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6589-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap
-- 
2.54.0

