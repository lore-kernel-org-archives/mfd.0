Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D12243E4B5
	for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 12:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228765; cv=none; b=pef1a35l/Ce2iuum/r/z0biy12cX3jv0zKQzYnoRNXFyEL1BVImhi3ty3TVdDqzhEpKmonsUfmd6jQjZUmuyUgLqFNXQi1WWyb+YU/Jh8HMJ5jYFEMUTkeaDHi4ObY+T17pSqhuMh7kH0Dlg4qDH4xHvY3UNzdt+6xYjaMK+jTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228765; c=relaxed/simple;
	bh=UGIM3aTui+shPbVvhLT3b5f6OpTvEv4JPJold/DY6lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RT0Cxt8h669fCOVt9N2k4vPyXHYDGeECyY7xVlmS8SSRJVWd8Q+lhh2LbZZmXOuzMo3E3pN7R7zC65knA7kI65mfZnNwrQ0ChiKn3zTyXV2MpnK3Xxrt7YHA55Pvl5OdFZ9vWdmKVA8xse/QJx4CcJzzZVv5VDRnrZx1a/1WpIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE4c/tGt; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE4c/tGt"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so20346985e9.1
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228762; x=1787833562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=iE4c/tGtVu8b4eSaUcvGujBrYxRsgc+wo8rJ9zTEW7/Cdfp+G7fp3zsIKhD211J0k5
         9K8IaGAsCU6Hfrefk17rn6GOq0UUXaqPlD4cUHnQBrZkDYldgUDaD017u9rKupnh/Y4T
         excH5N8B723EvWQ2hpd13k75z937AP2IXJVmXqieTbLb+ds9Pg42fl8lS/6SxVS5zfpP
         P42eu70RxKK9yDu/41lNZbE0+UEhSIBsB8mXo6xWwvagOcVVpSngRwjJdiCW8MOdwZwH
         P1ItUbNM46L48XS6G1PO5HrEzxPlvYEbFD71T3XMv0UIP6CAfmP7its5QgILDAfTAqN0
         NmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228762; x=1787833562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=aHBOBH2+HHHhhhyqfqUC8rqk7DVVenNOAY+cMJ0uJWumEVr8LDYQHVjcF2wDDHj7p7
         aTeZio+0CeLbJ/fLF4/QxvcQXRYpjWUfXO+TVY4UEcNtdE680oScvjuQUf+E7EdfxMCl
         uzDfWYdYtX3jh5VS+EvwclOmq64Z41ZZASx/m1/Is7oLQsaLljd6xVYTiyy+e6qoQGaR
         Y5BMbD0Qvm9cVTrk/ctqeSTBzMOKUMaNb90GFaszcsj1R+wCUdf4Sb6lIkJmIGk+tMvE
         ZuLYBIuAhl/NCOY51pQa801JYlA5fIyCZPFGeXZPJVw+F2NQeMzJEIjbmhzNF65e543R
         YN1Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro/0PE5ex5RHWiRcRgdQ3jQZs4paNgvmOM7SyQZ18pH1Xs7tK7L2w8FkNkfjIHXKtk5r4s=@lists.linux.dev
X-Gm-Message-State: AOJu0YycCkNv2fSTMU/dw1UU/nHykot56lhHfnb5U3qLrQZttIuX1Oh4
	GeeiF/CVMmIy107tMbUEzoSxt8eQAj4afkuFUV3TYOUkXdJWIuRAhmFT
X-Gm-Gg: AR+sD11l2nzXYyDcRcgX+VnlXWSdoKg8CRIL62LxbAkEnhv59w3qn0TbS0ajKgdudJx
	MHxBXy5abO5kBMCw60IpAjUUeBuvmET9WKe8IoztVZvxMByaCJqf0AxpRGgXu8pQk470wpF2vLU
	Kgl0Vmtplr4WVjiGfxBo1jUqfOq4v5rxhgeyqDAiudpkHec3iL1KTkU8lDcxXRsJ1Awl/ccN9Fv
	AyM8xnGuYSHkmWB9krYhq2AhgY8k56laxwFUtN19Oi3myzQvuKe7/XE2UTPPcqMRCpGkcPKs5XJ
	8zcSFm8YI7vKbSR1PLEYr4aNh1Gkn5wAz/hV1H6Hnu/c7moWWITCj7rR5fYUltySZh/ZsDDd89y
	ZAiQZgRAtBIRMsmvRPLiUhITRg4pH/7JeHQiJPXEHBXZuiOALmpPO8Qiz5VrOBmcwRIDPW4loVR
	wW4camoVQgZVRsYuoUNwH838IrAeUV5XHixwcJ9NWXnj1DKKvLDIpwpg==
X-Received: by 2002:a05:600c:8b65:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-499aa1722f5mr231760135e9.6.1787228762272;
        Thu, 20 Aug 2026 05:26:02 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:01 -0700 (PDT)
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
Subject: [PATCH v9 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu, 20 Aug 2026 14:20:00 +0200
Message-ID: <20260820122242.120039-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
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

