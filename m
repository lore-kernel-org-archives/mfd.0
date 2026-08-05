Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1113345FFC7
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 12:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932450; cv=none; b=DPeTQUrQsy1d/8346T4UEm3T/Zq8mqNEqt43rRLMGN1hCm6mKBXRdQZE0V1fNKfGbuGGDqkCmc5Y8CFirOfGmHb1P8dU1n2RJq5y1rR3V0jmsnKuDV2w6bIYvC9m/nxu4GmjbeersNTEgOCkRk0hlBE1HX9iz6q8jPuPFw0UaCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932450; c=relaxed/simple;
	bh=dkorfggf36ztPK+fgZCnE3kh62ef0QtYuBdCi01480Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9VXCAQEcNE3z27ZuLg/lJL64NuLgFn0DwtvK4jgfG0E6Eg08sAgHOnAlIVyYhMvL7iP+VikvEPMuGJHpNhSC2zh5eF0Es9OjxMo/H296cnVFh26ZncHZeSh0mlkknx8kRw5ISoP3NfWYkXfl6EIfiXq25NuXJolLOfjJRPKpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=hccwGpGJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="hccwGpGJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495635a85d2so8104335e9.0
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932446; x=1786537246; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R478x+VsQssRpU/U+H9eTTLOJEK424oXp8O1P95M0Gk=;
        b=hccwGpGJtgPxY3SzFzao964gEK4eHOhQLvQQuFp4+R/Fld4/jlqeigF4QKPBRN0EzX
         7YGsvFgChIl/57M/th81FjMX+FJ46+Pwa34HRYIoHdbW15fc0dZm6dPZvj461neRfgOZ
         aefq3Sq2fnDvRzh/2LL7hPB7Vxj2tU2xokdJ+7kdKe0qbDnRr5iHsRtp15jpMvu8txn7
         fxXSL+wOlN+/8EFYe+3a4Qp5S3dOE3BaJLlZCB90m3O5P6Ue83ZT8OVY38Nin7fUZ23h
         V+wOYRFHVYh8fgfp5auwJfUcb3fKnTtQuNI7DprI/nyWDyRXNYwWmDFBfP+IVuZ5bCEQ
         +O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932446; x=1786537246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R478x+VsQssRpU/U+H9eTTLOJEK424oXp8O1P95M0Gk=;
        b=L3PJo3kNDhtDwnS0Amz22j7UCgZYrcjDurLtacgyU6rgRUYlCrKcj0HKuBKQlfSLLQ
         bpPwnUMZuZb+9rKSx8PQ4931hUEOU/JqCaxxVFN9Qth8CSA4OGbRjEu9NZCzHWj3Nq9X
         5MYePlKEQarG65Lg3fAAe0kodOZQlhLhDAkoc5a3J+EcJpUjWCMCnliLJ+zHXJyt3YF8
         jqHKCqLFEbPkDz7kDAjIOwlPV27cojfgcRRMlO9XjKbW2y3T8C6VsfiRYiZDNDlqzLoD
         7CdMGWjJcTPlHDVBB5u+J981VbRNDaj0u2SFF3WnGRLjWUthwDJADZ4dag0mEOojKRVr
         8emQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfhB+nf+Xbszzav9F9jTPF55/dIituVP4bDljHmr3V3DELhHOeL2wGPycEnUDddT/6O0o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLoPERfPzAyJ5E4JU8oPkBc3tRmXpv+LHN9y/JMDQoPiqBaNDO
	v9DV+aSYrHXDxhFJS1MlE/tf1vDmO28DB8+IsaIeDHTlXHuK/FaNDOl+qiOjAEA66rI=
X-Gm-Gg: AR+sD13AFYBl1gM4RryKYRcRaDv9DdBvaDYwxx1RaKc73nJqEkP2SgRoLmQ8CzvFePl
	NUGwMYP4nOPPUueLDs4TtuNqXJKg1Qp1mwJoNk0PKPsL6TJRAeUJiwvomitREB3mU2FHJbWsGG1
	y6ZY0r6c4zLR22TD6X0x0K7x0/83kUWKYy1urIM3+Iq+v/yoJkVYCOoqGi2j3ErJRR8tgMBHClc
	75Nd3Ti3gcSy1gLs26wFySHHlJVovzMWL9QWrKOo2ioOTexTNO496skYxdTlv2nAfR3j5uFP+wS
	05sNJxrQJty1Ln2aM7aL/1O/wCAmO9w6aL4Q6fB+zZBfoND+4e9f1amQybqY3oZQx4bolFxFBwT
	hI5kjKJk2z5kGbBSKVRQmY2aVzbDV4OOdt2MYLQ7Z5jNDy8RBmOBhPXPxUW4pDrzs4TfUEa7S7w
	eW04BM/zmnnhVBKtm6y+fyo+xIRZxM210FFUTcPttEdstlG9HPfPgR08E7UUH/K9khatL+O71FO
	7Q7deYF36cDy3RCn2ObOEEUJ+yWmDOXXd/bY+m2Pu3mU+UMGkww29QattzNNi95yn05nkDgNqlG
X-Received: by 2002:a7b:cb95:0:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4994e7c118fmr56108875e9.11.1785932446337;
        Wed, 05 Aug 2026 05:20:46 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:46 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 5/6] ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
Date: Wed,  5 Aug 2026 14:19:52 +0200
Message-ID: <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the ast2600 compatible string.
Make it more precise and enable specific ast2600 properties.
Still use the ast2500 compatible string as a fallback.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..7c02633f2bd6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -707,7 +707,7 @@ emmc: sdhci@1e750100 {
 			};
 
 			vuart1: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
@@ -717,7 +717,7 @@ vuart1: serial@1e787000 {
 			};
 
 			vuart3: serial@1e787800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e787800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
@@ -727,7 +727,7 @@ vuart3: serial@1e787800 {
 			};
 
 			vuart2: serial@1e788000 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788000 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
@@ -737,7 +737,7 @@ vuart2: serial@1e788000 {
 			};
 
 			vuart4: serial@1e788800 {
-				compatible = "aspeed,ast2500-vuart";
+				compatible = "aspeed,ast2600-vuart", "aspeed,ast2500-vuart";
 				reg = <0x1e788800 0x40>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.54.0

