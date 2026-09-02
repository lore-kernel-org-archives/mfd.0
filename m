Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D2C3B14D8
	for <mfd@lists.linux.dev>; Wed,  2 Sep 2026 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377700; cv=none; b=MG/sJrnw00sw4NuaZNVnpos0YwtITmrzCYO7xhZ/sDy/WSRn69Vf7qzKxU3bgY+IOZ98JxWnhvAv0W7Rr0pnPd76FuxC28RKzui20WAWPL8uEZ2chSgOciM2xG1F1iJQKYnB93Lp5B/Y2oEAYqOlojmh5QW0s56ttQU0gpzxsJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377700; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CE+IvYHiGFpsQ50wadpUrJylKWSxGhYhKaIpDf65QNlNmvM6BbweLp50oNHeScDzHY69uCy3gtSXo48Hg3wJMGRROjj17PyQk+Npr3/sV8+fVtjWjkFIsMwsw7DWA2DDbELZi1U3FLSWJ20VqkX+1MVc6H5CBpJvl2w+HlvnU0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IliHmJ3E; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IliHmJ3E"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48436251906so1563602f8f.0
        for <mfd@lists.linux.dev>; Wed, 02 Sep 2026 12:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377682; x=1788982482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=IliHmJ3EXQI2tfp/TiNP3+vZ3k6i5+ZpG31skLKeIePsa++zcvz9JSQsZHR3e469lw
         er8eRoxh/+hYDYdHF0TJ6r4OuBaSpQnj8T/3AEVSxSufVnvha0OVx33mPR7xn2Zloj0E
         RfBDy3Sd/TMXNi4n8DYoAc0hDSPI1z7MtzfWmPg8rHy3H2Clpti+/BHpltptbkpPgiyI
         vRIyruNR2evgMabV3VcWHWJNG56F3fkhopjMLW+rHe6ksyiPSIgkYaluSXK3HE3D7gp1
         ViY+bPBvE4lnATBl9hrR+jTaZJ8r28RNqXVIeUL7w92Tjb3eMedyMhHUJQ4DUCQzwil6
         gBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377682; x=1788982482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=c1N0QV8xxSshLi/XXMyU84nGtaPVUTPDzjoEpkbE/xkZCfEAaCzjQomNHCOf9O2qzi
         Hsv0URiBEcvHse6+U1fF08gnvU99nt+KWPPHcbLjd/NJOi8SYgLTsRstRmMePVHhb96u
         QLLCEXrl0ZhChOCCK0haOo7Ye4cKpBfxRWxpBK1KoluyR2EBJnsEHcVJWfkjePvMbqDQ
         pNcVmD30r3l021cSnsdy0kLX85e9JNRd8UHaQHg15QNyPAcjXQAwamAvGEszDmFSCOFU
         2T8iWlIC676lMzJE1TrLiDHpJlHVPbqmahgfcswjtQcP0ADz/eLjQcaV0NfvTraVbAlO
         1GXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkpgPz9m+UDqod3SYcaNQ/hZ4WNPzHAlInuoIGL6NPOkTrLHrSNy/3/lhZbdQb8Dq5S50=@lists.linux.dev
X-Gm-Message-State: AFuF++kAkBJXS1+s0qFLN381lgXTLu7twuZldn4Woe90z737D4N96v1b
	wr9aQ6YWeLw4MGNYabwM43oPT5a8J3IPVyI7pfsE1Td5C0GWpIb373rMVmJEBAXY
X-Gm-Gg: AYBFou3zK3GJ7WjIp0Ycw4hQMalXXg1FOlMGc9Axo4QXGO7ML+Gf2F9NhZsGR1GH7aS
	D+6Rm3DZj0NrXR4+RHvzCM7oL5KaaG/DcxEHGguIJFDK+4wOTOAA1CjYD2GGSvMms24EcjlexUM
	annwyQgfnpoYVv6vDIJ7EfDcEbNIf6gZoGQfkxTY1n9W+U143hoqwKdLloKE7apD388MZWwLCvH
	Z4s6u1bZJadpangYY9/Mt4Fa+v0BvZ2zw3IbLna3Igjr7igYhwtvSMlQfjzgnJ9Gx4gt16lNEd1
	HKT7U9AwQQc+acM/lH6fwAFJKfBT+Hok8WsaRfsb5AB0j9866+15UddaCp9mGSpQf3HgeJ8Gz71
	8UmV9QaOGFKdtPrmvK2Duoux8lDOh5ftfrZ0LoqeRXdVXURJ2tEfFCGPXKrxuBy2J9s5stxF3ct
	0xn+MePyUjdFqkz2hFK0PwMtso3XIQqYKVa719zHZzQetubOxBPbp1k2m9
X-Received: by 2002:a05:6000:480a:b0:47f:eac2:6f55 with SMTP id ffacd0b85a97d-48488f2229cmr14997817f8f.19.1788377682430;
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
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
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed,  2 Sep 2026 21:25:38 +0200
Message-ID: <20260902193351.185771-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
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

