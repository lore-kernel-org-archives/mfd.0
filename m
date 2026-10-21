Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579935;
	b=JF64tptud8UWSQZ4S0vpffy7cBCjzvgwWhOfDDv0P80B5rUc+fysnlyDlNn5UgdcTtO6
	 Iq4KmrRotR9istHUmnT+hEgs4a9qKkqXRPRwSQMNMbDWXb0UCKKRUu4iAZ5CfVfzE0zo5
	 nKjEYmNr+LAVckIf8vdr3CVJX1HHzPYf6phPkiSUjo39qTeS/7sF2F41EOE3SWRmaoooR
	 Vjls6b/PSAPyBCllAERi9Bs8ZBMSMYeMDaXXg9TbVDualBWTKKqy+319s2/q4h5EnUdNv
	 Knl4L+2suSzMHpTtGc/y0n5hwgDwzUK9DtveRGE26HAYXzCphyt3v674sNoMBM94UXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=0zKPW4zUwmDskEsLAz+MLHP0T8dcQTX1wyHHEHRQrUnaEnMQbmq0kfZfDtk4CdfSUWPR
	 LTYkssb60z1uxvErDYG2qk5rz5T4T7T9rurLaL5MJAtZRVkFWFcTR3ZYgWFMrlejOmEjF
	 sD00fs3Iax0ruCww/T+n7k8EzA+S3btIcO1ZHQbg/zqczH9cSq/ysUc340Vz5i3l+mD2L
	 PFWx6++nZ1Oe30L/S3Som2Qfic3mHJWlOUQsdUs6J6vFMaiR6MxOEBAzrNR3oHpFNGzwn
	 MRtYObwVP1423JTg9B2AxbamHKPzCF9O+fTih28MC5F08DPj84KyLy1NduENNeRPSiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W3o/gDX2";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A72A606A31F
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 10:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A72A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W3o/gDX2
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso384402f8f.1
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579933; x=1793184733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=W3o/gDX24271zoBysjRH8tvJ4yQ8MmqvcFBhZkVARzpCreX1fL3LXHyCA0/gibO65/
         GNr9+mRUc7GGrcXfOkqiplo+S/5eGphIs40grBTjGHOxxEVr2uiXZT1r3tDubM5Ly8sC
         p4jGEpsj7VK+MTpCjmPjyWVYXUajgwybN92DoNOntATwH1uwigm4fosnD26GYLFoq9+i
         +m0s5DWTstSPrlNgpYLOS2yqkUt7b3oIQH+eWHNYMdzXDLK08vWkRdS7+NqApGDBpavj
         uFvNhs3xdGT5R+eibyqT8cGK6dH1WVupAnN1RrcKpw5KEMor2RQ4LVXh3Prc9HpC18VB
         mHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579933; x=1793184733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=ZXWzopM1ioXj04TvsTo+QciGTypzRUiLM/TP0b+sthqBaZ0xzqK4B4pJOOexi0F5d6
         wRDLbwnhQnSnCoXxQQd1TcVOB8L0Pprbqd9OIcnTZV+IrW/H2jexyzdd3Bt7vOuMDknl
         WdLZXHZRWfMGStvfK3oNfE5G9/WnXqp+/hniuyRFXUC7I1w6wiTidGhKzWc8blcsqU3/
         bvuTidLT0bfkS+86UQSedNKCAdwQbo4Rmmro+RQ7eAfr6lx58k2gQ1u8wGTc+IgZ3qHN
         ynmiD4ohNRahup1D2L0FziJiUQMve18v7L4AQPh65v+JGn2G0FTnuzHAsGOWr2aqyQRz
         5LkQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/za4giMA20lDrhYNl2Bzygip2B+RtFjBubQW5n7GQ5pfK/TgwGNTapPpGV7OEnO4Eka4=@lists.linux.dev
X-Gm-Message-State: AFq9FYIGvx55ekP/3TbZaD0dOIIs8keftIamBOcxK37uQdV5upoq1IW7
	PZZFsh9bZ2ebDZS1TCFc6JwOCwKqYSDHghqhtpb43SYLUTS38k1av8jG
X-Gm-Gg: AYBFou36AbM+UbAmM34Mea3Hf1mj2k+WMYKPgnLkvDbkZOYZQggXnnd97LoC7gp/EGV
	NLM6ruV6jXlVMdSQYz2MdkXe0fna/WO2nFhwZk8jqdIF+bvFocVhZQfU8bZRtHM81T/pYYntJ78
	khzfNtr8U1vqST3pQOk+Dsl9XALtq4ooNWnfpRBoWaGG0t0c2hh2KUHBGjKtiYQySPVWVv4U7kM
	ydTTsJW4GOedTbmpx1GJxI7byOKRKjWJcs1FRwnh42QvwLb5KsuYsqZrAqqQtgySmjoe2hTuaXi
	TsgqmhI0lMmZ6CXTpFIEy0JZMk2wDRhFZQ4GG1q5VOe5EMGG5FidfxHHNsBgoy38exoP+h9Pa6U
	GZRmGRh3ALF4wyKKSwHhpH0vtheU/RuAZ8JC0fptwkUc5N+qkPdFdwLqu7Rzb07HUsj2tVEIPzY
	TTj/mhGk8k+dISZkjXFLenTksWOP+qEl6765d/wFZbcp0gg3OjJHBPePTN4px7n+i3KXtvwkn7G
	c6WKpRUsHcrmjLbEs/asdFxqhfYiMdA/7Zy39DVwm/O3JKEwL2w
X-Received: by 2002:a05:600c:8b0a:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a1fdd23003mr30749575e9.22.1792579933214;
        Wed, 21 Oct 2026 03:52:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:52:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
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
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed, 21 Oct 2026 12:47:20 +0200
Message-ID: <20261021105109.199886-3-l.scorcia@gmail.com>
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

