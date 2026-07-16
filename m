Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF4B43E9FE
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222287; cv=none; b=rqA4uFJ/aw2aDX0lNyXesm54unT5X8HjqM/dJCnR2/5GQTWov777R4JUSYgnKSrbXdqmMDd6ekFCeVA+QziC6HbgxMPdQv6JOwD4bVzl1n8pTP30eokxVqyPZFs2foGLPgGXVnwFU766jb08B7+vdD57fT7j93+5WYwa+PO30XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222287; c=relaxed/simple;
	bh=Y8Yhg9LDZgOOn4IYBYFpDiXxdAtcDCdbUesWkE9/tns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukVbnjj0/V78xApwYjM2A13B1WQ36culnmIIRXMyW7NN4GUCtb4Ryxr6cFnYDi9PIxNKsvBKVIxcR/w/n8f0+VJtHGsaaaGHemt4XcS29BQdHtN+ZZGkm7SU+cd00f1wOGzFFtJkrgAzNoHHPebznrU95CSuR809lvGsrkIuDXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNwFW5xk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNwFW5xk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cac59f8b64so80970275ad.0
        for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222277; x=1784827077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+VQUfT4E2jpzaVYfn1xTQo+PWwjs/hsb3t7kl1meuo=;
        b=YNwFW5xk0j9DQN9cfVmangkzwa2gz4RxsaYylJ6ft2fKBbPBzsg3fTvlo+XhArJYug
         UpavfFSWHuE2gevH0sG0aoT3iAAF3EXwIxwx8EBmS12HvBDPKjegwZb4hp6AAfKDW/ui
         qhkv7cNk6ROd+eAaHjASEB12D08ICL/g+iiHJKnqwomSuX6LHh6/53+yo0cdHiceMQXT
         yXzw7KnmIFp9pFJmKimgaxVl4YGdVU09yMDxa2fMtHIdPwxu/AGByW6e+STn7UEB5DAK
         z7Xl+HqjsKWu9gVb2MxeuaLhn4abh6q2q+QpNCpnYMUFfXnFVwCS4/ZORsx7fP7DWzq2
         A5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222277; x=1784827077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x+VQUfT4E2jpzaVYfn1xTQo+PWwjs/hsb3t7kl1meuo=;
        b=pi331f/golK0uPXFpVGD1RNlm7EfK1CuxoYnjxGoiJGQ9goNP/If0rX8w4i1syv2Lz
         8K5+ky5E2XWhs0jmNN4oiZiB3T+YDbe+m/SXiuwfPuJnLdWTiPn1BPhfgaThL9GHoGeD
         9iBV1V6ZeTjKvx38jI8+WfyApkj+8NpxU3v/xBPXYmqtRQ/057ydZQrvk/ojiC67e7I+
         TrPmGw2wKWg59S6U95yf1JdY/TsqimrUvsd+6VoLnPYOz6iUpSKsk3GigGIgK+eAm2br
         v+fAVzpOv6wcEWYLVfjZveiMRO4DJ2H09kxOVMecf/6Syeyoqcgt8hlDya44NpZkDqWm
         ADsA==
X-Forwarded-Encrypted: i=1; AHgh+Rpgctr0cUjaj8RoV/BFJMJPxEiSGBujMZAk2J4Z2auDz5+kCL8jBFQVi0dYXfXiglGxuiI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyU1oj2Jgnot6qxZ/xCNClEVLPqZ0yuShkvSykWW7dlc+EMEP6f
	FSqTJUsEdQWZgWvtQ82vVGMs6P31oyGdbotKyGvQi5D+jLDh+xkL9yTB
X-Gm-Gg: AfdE7clS8mP6R43XzP+fWOG882gOeF6Af+S7gm2FeuHqjnH1b9EGN4pQv4rflBsmDBP
	r8nvCVi9iAhUppGcZEEbWbIwWGcC6atZyNDKR8NBhBl0F7lYZM+vIuhcPIh1nfaZdtRs5PRrYUf
	HxcsVy2XEciImlWlH1F4H44+gmdlEuzOiGKDq6ETpZehd1zmKAXA2stsyj7tHtbxcd/vX33SsPj
	IprwMYuoGHL9MLVrfygmsaOEXhgFSQbAQfFpiEzxVuWq1GpEQGIqU+fBC436vVSS326qIbsqN9m
	91VldQeIwsCVAB9WgRa0QEru5i90Za+0NTNuawo6VCAaXlpDF27Tbs9b4dmlJCQjUomcJWRKLW4
	KQuViXhao7aqSXopPPLPL2r1usMBNA0hrGQgxLaMW5PSn/zqxrZH8n0ThrIAOdkbEW3FovP2g+j
	plqh70DzzNUXySs8pieuZx+KmzTT+9R2fNXw==
X-Received: by 2002:a17:902:da81:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2cf03c7c756mr75109205ad.1.1784222276928;
        Thu, 16 Jul 2026 10:17:56 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:56 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: mfd: mediatek: mt6397: add MT6320 compatible string
Date: Fri, 17 Jul 2026 02:17:32 +0900
Message-ID: <20260716171733.300885-3-akkun11.open@gmail.com>
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

Add compatible string for the MT6320 PMIC.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..f2823338cccd 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -34,6 +34,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6320
           - mediatek,mt6323
           - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT6332.
           - mediatek,mt6328
-- 
2.54.0

