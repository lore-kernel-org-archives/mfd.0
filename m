Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517822;
	b=HXBTiIBF794mT9pjw5/urIabzs1SdvEZYeCsko8YxXmp58nxu4nye5UI3n5g/4ttCVjy
	 5uGIyQSAFIJRVzO3g/VCJm+DVB7FhCbjSANXInnRKjywwpbSxNoUUOgwRORJaY0TE+3E8
	 /LAq34nIyUXLrSAaX3hSz+UYUioV9OiMaGHWdVMOp8gpRtNQ7udxpxgqsg3B/WoHqbgJ6
	 9Pcjh+RsakET8GhRH12LzWUcd3PqYyZoPmSNALLMGybMQm8Y3BGBms/xnpTiFJU2j+x/x
	 iPPQaVFdlX3VMuCUJil03asoeOFp1NzXYgwQhTiEU91/brA6yxzAxUOCdzM5YPLBAoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=PZEig28mvPMeKAZ0SUEgZ1Bu/wzMII9yI+F6GeXaMwUxVLB5nIucA48xfrmBjBKlRtGy
	 2ieNCjeziDr1CeM8twDCfXNbRU28112OvyFP6TsOoNB4UpyWKMuCErbTJYMeUHUvV84C6
	 7DDF29ehGgAyaq7R5LRNo8gS5Q27gdSmLKLbtajBixv0L7IGgsmcHasDl7TnnZkvl8xrt
	 ysSlBrovgmM3E6TEIOSMrdMJsRC+v6yTNLFTBSzCj1MrYASLR1GzRrRJC1cn5EvTSVYV/
	 4FMgNGVpEmlXSEQeD5SfVX/9rlPy1EeybndOS3CtyI7P5Fqrod9LEWZnT8iuSSDh1GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SrtFyVY9;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A27D606A321
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A27D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SrtFyVY9
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a01933b584so25054905e9.0
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517820; x=1793122620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=SrtFyVY9z5jPeifQOhZrshsADPthi9GWiMdCAYjQpJqvguMcXskD9nHwXphDwu75/Z
         x2lhHPq7rhd6dmq9XlK3truisnsUbkCu4+z+8YtErDo3aMucMzKgljH5dY1mJTCBR8RG
         dOYyJRyodOJmHks16nhzFZkJWwOdoR+4rccaqPlrnYUAINP9ioqJpElLbfhDDXer3L6h
         ySYk1LCPXDrN8FVA1OPz82C/td/CIwAzfhxsu022TXHHgv/TgQ4KlvgsuhVs5JGr3gYo
         u4OJO4kYaIrOc4WjaJmlooEJxafhbwpxyc//re4y7qwSQleI73/t3bw5A81ljeByRY43
         ztvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517820; x=1793122620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=eRpoSjmx3CXU5Lz021rNmBwdfZyF+8RNjxximnZZihgANgAZU9qt1Y3MZr9wqcVQIW
         yG7GybYjDyRs8xNfelCJ54T/Q1phn3c1SFDoOz6muBund5fOX3NzIxI7BK/eZVZSj+qJ
         aA0ikZAK6TF/wXAe7BZE4Ti/3PCu3ACeFac3BJC2O5Qo9CWZw9EuXHAVOt9S8UHAsOuV
         FoBBx6VewCx5IbygwQhTQp+VVOwcDIgA0kAbfXlib79Q3A1Vbp9Jdq7V1d4bDOya+wM1
         ji3IEHV4R+KI/4aEknCWhVJhEN2KzQ2PBZuYigk8BpyS/hUNvNqquHrroWaA58VL72nm
         PYpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD6bDE0spz33Oozo/0eD7AR86x7f/9a6/Ko5+oY6s93wsQo6vV+ecQBh/a3Bqx2F6YtTE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLegnLGSr5Pb9NEAMSStNEINYesqogeYK2n6pcv2ykeMicF8iQL
	Q+mzLOK6WtffPrWfttAwF1zQNACi1KFsEMoflOsU+ITb+0/yGkmJ6Np+QDbLGpn0
X-Gm-Gg: AYBFou0PR5LbF9CeUJJ/kz17L5d41xLUZcWoikBZpWtvQMAcr++yJ0BNn1JvXezSmXu
	ejp0V9J31S64LYEgoGNE7pYjLcl1tz9rPTetxcNEJ3cLmD1yMymyYo8U8z6NiOtDyR3T6p4y7X+
	+ujwYymD1uRXxz9Y5AsfaV8FIg5fvdC83FHE/JmE0pVruYcxjoP/DZG6mUjIpDmKaYB+1Hnrg/O
	gO00GGZQyfds4+aDKJNktx1TaES27xy8dCwnPFyMj45u0um/bXHIjYRVtN6XTL7YclFRuCsGd3M
	TcilBke1J8u4AjzByBypLMP03Yy1fgeUwdvppIB5xLDWIvX2oIzZcX3CtvVGKAmm72+U/3gwJzM
	htVMYTHWqUt1YVPAGBYoLnuCLGMIFGoaHVKpueSRw4y5kyjDtfnJ4CSW7jdzU8gBV4iPfKO1G2F
	lRAGfy2ICQGaMXnGbcD9Jz2QEtGrsejVkfjoFA2spDE3pUqGckz63Yy1fEUpvLQsd8gdg=
X-Received: by 2002:a05:600c:c87:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a1fae2a902mr22956085e9.3.1792517820215;
        Tue, 20 Oct 2026 10:37:00 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:59 -0700 (PDT)
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
Subject: [PATCH RESEND v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Tue, 20 Oct 2026 19:33:23 +0200
Message-ID: <20261020173556.632798-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

