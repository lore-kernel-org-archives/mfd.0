Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579911;
	b=oL8lHX664is2g/I0TkPWYuMlhDswaz3WufrfDEV/CDusZ/bfxfJ78NdpN5/URqH16lWE
	 bb/Q8Udgdiluw0ucVM53CQJONHx+yHN38Aslds++kA9TXwA3Akgz/EOXWF0++acrewuA4
	 cW0HOChSg3QiQ+iDXwwRVYFCEhw29GTSPUPUrV+sdqdb0BiXgRyHhbWDIgZi3JE7xRP2b
	 zx+AxyWbFQ9htlNL92YMyK7jXnLJr3sw3emf9XWJZiNzmXZtO0hDHSCoasZIG4jhsUViM
	 7KXerzNgQETvOIvYIUgJQZRydOMc9VKDiYx+4iXmhA+keH+dRJUH6g8XIPxVYKYROuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
	b=W9aWkhAoXcBT2CoUvWQAYOuIdw3tnlkaUGmk/0dJcJo/OrP2tP5fHHifoEQWSDwib7Yt
	 LI3TbkpdfB88BBdxJK6kk+QAZgI2FOxkfpcmX4VPEO8deJ9k2ceN97zwdwahskFSAjgg9
	 LnNd83mja5LCTkiFlsmG27vHDhoskXYQQ0KiVRBKTqiq2UbFsGfk7OBEP5SNWy5nfQqbO
	 OkHJMnejyPS+Np63L54MPN/Gfdy4iz7LgOghfWbV2lhvN7md7ozVIOvYACvgM3R/KGHSd
	 Asu5Rj43FRyhbDQ1+FRdPQ0xUoZCQbWmrat0vzKqPQG6hpOoV14Ya8+sjuieUFfn8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ey7SCDWV;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C6606A31D
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 10:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3C6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ey7SCDWV
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so3360075e9.1
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579910; x=1793184710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=ey7SCDWVOqQSFeEUO+PhJe0IwLqrBm+9XmByVSzf9WH+W3S0JTQIqZ/1NRof8u9253
         g2PYETbeAOJBRqewrBfZUOqjvQHUbAhgsUn0eCj3QQRBSRaR1ODXNPUR+b70Pt5qjoY3
         UiOZmnFc3XFPQWpJ5lu0IKsst5msv/myvBtxw4F57HIzbzOaise7zhcwotn7cNNA4wAQ
         UCTJCPVojzyGLCvUxocfyjh6ak01SOruiydJhWbJqUZLPH75ZeifuHjOWO4Eg/NZtY1o
         QA5DlOTy2Fjv+0bAt4br6zyfHD1UB6HGXImjukNKgv35XuatY/1R63aXZd/HEAru5RT/
         N48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579910; x=1793184710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPY8vdhVi6Xj88wwWO8EGGblZmNfcIUJaJL4gRNaJy8=;
        b=Oxq4SUn933SpYWSB7Ef0DTdkrJJVXUF6a5LNh3PdeEKKNgjqn225Ny1/6pAuY8c7+Q
         kubJhzz4h5dVTMrTl56eSExf/FhOYdHw20jH5Pj9kJxEor6AWTKzIdVZr6vQIs/feLvy
         HUm7juYH/KTQSORPy4MxHmo267MO0eTqPyr3UOVLfBFtyzJVEw7q22BFr45D8YSRla3t
         NjiqOAokoBvIYo1kAwJn+pV1kMxFf+/1FcH3aBC0xdWXXYjK/k6j5oc7WjkHCd/GGGGf
         XgDl2RTyq5uLFtiJSjQy6eR5oCpG/yPO4D9c/RXfjyFUVZxXZIdHiHgr0mquBAejSN/b
         WWww==
X-Forwarded-Encrypted: i=1; AKwUvBz3Du0q9R94cy9iXqhiV6qLjXZqqtTB4dQVYpvGHQjchu/X0cyLIzT7rXfJW8LE0dnxuew=@lists.linux.dev
X-Gm-Message-State: AFq9FYITHj3DCm3HMxoe4JLCITtHiSfAhUqW5EezaZO5pWJSWzYln4p5
	xEfgRSr0jDiZxo6CUuScOedNbs5xdjm+tp/+G5EUOOvwz+fPnhTQlWud
X-Gm-Gg: AYBFou2GAuBp0dSJLd3WSf+fVKkbjwkT3JcTrN9WCW4wyd2Be1NEMqh6ehiejb/p4oQ
	HbC8fWX1kXWjWR8J5Uvswe/HslzAaBr7fpC76WwFmUNg5eND7UUX1WBFcq5T4HprWaO8nPYp+Eb
	hGdVpd164WbdobtGcVUUbautGj+5aNQQzAO5MZFcH3U+/zgUNpaYTs4d08VcnbqADkNQOiQfabv
	AZrusF/6H+Ir7Tan+ITiU1ji/HATD4nxDY0cPngK9+gfZfMCBFMkP0Tsi+qMkl/lwi78Wo5LE91
	k0VsMgr3kFdzjgEzzQi23TQL7lmRZBWlZvNiVx1LKQDAn6Js4ZbltEEkdOx8ALhaLJiTarjXp5C
	3Hg9j6a8Eiy6++kWLKeEyh/53ZIQsyGQXk9q4EA8laQhbJjZWnAGE+o2/yXXTnnb/Y0D37i5kvo
	e+Bcr+IYPreiPzXMHWfHTNLB6h9lkRu14tnoLT8z4kSHK3KuTNWG/rQpN+nJAxUqPvZrbOqsFJB
	0n0ak2KF5uxkYLp66HKdd1u+RNPxRI0pU+AvonYEgwqCp0mVwI=
X-Received: by 2002:a05:600d:4447:10b0:4a1:d1f7:bea with SMTP id 5b1f17b1804b1-4a1fdd1e568mr25614785e9.17.1792579909764;
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:51:49 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Wed, 21 Oct 2026 12:47:19 +0200
Message-ID: <20261021105109.199886-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..da534fa324a8 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -72,6 +73,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -99,6 +104,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0

