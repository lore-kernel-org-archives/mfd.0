Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268412;
	b=23xvdzPaSidNbxX8Sd99MrP/UhT1hRaS3m1P2fuhnwegFR6KU9HwDkd6fdP8cnh7AzKz
	 SJ3Fn7omaqnv20xtKENA3S9pgV89In+6vVOlLzE6hMrdYKqpWW5eFMAzMlutLeCPjj438
	 7dhwEtPnaoDCDPjwocWbRr8mQbubn0l1pYA5JhDRS7eQmpxh3urLgmR8b8/+DduQAymun
	 DM1t+p1UgjWZCNqh6p55005WJd5Fa64UJ2brdz+0VwexowhaGcyr/VKAFd8zWWSdmL22i
	 favH300GmPPk8F8pwvyz7JISUgb5zj7dBghhCuSvO6AJuMo56YfQBDgYa/rsITVgF1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
	b=mzUnrE1fXUDiFnY3TaVZWMQsQ6YF/O+UywQ9xj9Wmd5r56g52Gs3ldKQVlBOPybadoYe
	 0S5EwIL9mqxXLwv3LTlZzKuZsUzydMb26xQGcOZu4Gmw/fX6brPUh9eiVU288W6pxD/By
	 RvIfW+002YY3TPpSqp7EdWyXxssCiUyYEAdpe8NzEfF2PIS+HonphDDhj9EVFw2DBqJ8W
	 nEkqbhyUZOJ7BpLzzDeOlWrIGxnEd/10ST6L/gV41w+SKc3vU7TOFR9UkgYl92D0LGXKF
	 rOvATOs/dAE00IrYIHq6+cNDX/t3ywphJ0qiocf7IMOHvekH+NXoEofa9qzBSaO3sdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WhA4tpwA;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DCF606A338
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 10:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DCF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WhA4tpwA
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so17166215e9.3
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268410; x=1793873210; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
        b=WhA4tpwAityJvktOkfCWXAqLyE/nRPJW8cbRm6/gPcdSBPgZwSDJkAfLxjktFI/Wsy
         xBcDZzFgxT0uNfndfUDjSOP2Sh/L8qsaNA3VB9TqaAsIP02mFBCiN+BexTIr8nWJ/oRk
         6Ty/rP0hKloljeId0YQx03MZNc/f2REGAcP6IJ+FVam1AFR4JjrhGBqWVsFoTGatTL6C
         GTptV4KY47UU2MwpaEuy8tQeFG5kkfsf62cQ/P+wBd+V9FvA+/6DYz4EpsBauQkbYb0n
         LNGJx9jnpap3TX1DCVZx498cr9LllI7R2c6OZvAtbZdZMMuu/CJQBxAdl094iDByzh54
         i5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268410; x=1793873210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
        b=X9MxMGA1d3syL2S0rej8uvrzhxDsa/61KGnVUfz0vAqq8I7FNsevBBkJOqjxOA/yiM
         Jkx/tmSxBTLvr4TkujsAXt/lgRtiZiPKeSDFsl6CTb34UzjgHP4txh3z9qUAJDBxJj1+
         xEXxHF8pBrhej3r496Wi0dTK+Jac+I/gkMRhQTZ9W39A8h9JhRxbDc8FaYBYKPrgFz1i
         bPVrHgxUdSQGf3BDhkjZU2CDFhY5g1UjzUYyZOpE+Lw1j816Lj0tBDzymrJFgA808yuS
         T9Vk1YXJQ6lM8lnNFgiUmdEvXnMpzf6U30MY8Opy8mChorRlEgCYMyaxh0LWtzU4AMLq
         dCmA==
X-Forwarded-Encrypted: i=1; AKwUvByTaAxpPSIbKKx5wILtwat/Sd8ivoupee9BIoBmLm8O8lkrVslFBvjagzt1BCAz80uUqSo=@lists.linux.dev
X-Gm-Message-State: AFq9FYL+737tSzhdByEUGFV/uk8gyZmI0M2xesd8OIzsuVd+NCDMov9f
	GoRQAyiC2kRS1OjAHgE+NqhcQBQDt/KiRmErpYy1dIh/feRORuHASh7D
X-Gm-Gg: AYBFou1qkOPXXzfB0SNsKyKg2/CvePKXliwN5nhkwPMg0kZg8w9J2iFFIqlsxxtEdE2
	i3gkn1ZrEeePA1vjNRf2zsfSzdE4+p59ki3KXeOqEN/Sx8++CwyaJc3YYweTvGFeKjb3oFrU/pl
	unXkGG04yrXeT7P4G+Ohl7+hLVwneFeTMQnpPtXPla6YVLfmCHacVT2m7yiPD098HqAvkYD1LcG
	/dzJQdQ0daxIFmdDU1byzFu+/1bcDEof9GmWbEtAekCk2GIyGInrGY70aI2hMWlysHWaklcoTfH
	0FUpdmqbcKdiY4r+NIlkZyuYYS/XShWozq8XWWkjuqUSual8NMz3C6/KOTMVacNC0TSiE4Xntsa
	/pCr3jNiSrW4fhLVJGCFdKYpW8kEB+Daxn0TUHe+79ZMAe2ZoJQA3VCd+tVFKX5U3Rv5k5y+sGV
	DFp5vNPldyPt+63AJPYoHLBXA6a/5CyeKxcyzwzLWI6CoqLl6yQbnLnIkWEFS3CCvHXCkeT7eUO
	olQQkPIk5L8N1sUZkAaM2zrR3+pEwVuDI1l6WTFn72EBxdw4rGInjzgT+S3qxIADo8YRxbQrVC9
	z3KlP+75prUTa0Y5IkS4fa9LPpNdMwDmb2l7nZHpF5L6sBrKMh0RF/XbUGxUfgb3mcTbgUF6x2U
	A8hQOttIB
X-Received: by 2002:a05:600c:8184:b0:4a5:1c2a:4bb6 with SMTP id 5b1f17b1804b1-4a967ab15c5mr99622405e9.32.1793268409952;
        Thu, 29 Oct 2026 03:06:49 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:49 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:24 +0100
Subject: [PATCH 2/4] mfd: rk8xx-core: keep the PMIC interrupt disabled
 during system suspend
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-2-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=2691;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=L2myRTbrcpVngJZXrNjm8FAaUWxZTcJOyBmmVMEVxWs=;
 b=5roX3q8fy0xNI6ewi2I12L2R2JapjPSuuY5TaRN3vlegp1g1Oc3/GfvhvCPzLXeWV3msOj/r3
 ynNr0KDMGwyD0+1RWAD6ZSNcsvIFpjK3KJMTq3YCxA49RRB0C9KieTE
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

When the system is woken up by the PMIC (e.g. by the power key), the
PMIC interrupt is handled as soon as interrupts are re-enabled on
resume. At that point, the bus to the PMIC may not have resumed yet, so
reading and acking the interrupt status fails. On RK3588 with an RK806
on SPI:

  spi_master spi2: noqueue transfer failed
  rk8xx-spi spi2.0: Failed to ack 0x79: -13

Disable the interrupt at the end of rk8xx_suspend() and re-enable it at
the start of rk8xx_resume(). Both run in the regular suspend/resume
phase, while the parent bus controller is active. If the interrupt is a
wakeup source, it stays armed while disabled, and the pending event is
replayed by enable_irq() on resume.

Store the interrupt number in struct rk808 for this.
---
 drivers/mfd/rk8xx-core.c  | 19 ++++++++++++++++++-
 include/linux/mfd/rk808.h |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 21182df45d1b6..2ae9107fc5161 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -851,6 +851,8 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (!irq)
 		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
 
+	rk808->irq = irq;
+
 	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
 				       IRQF_ONESHOT | dual_support, -1,
 				       rk808->regmap_irq_chip, &rk808->irq_data);
@@ -929,7 +931,20 @@ int rk8xx_suspend(struct device *dev)
 		break;
 	}
 
-	return ret;
+	if (ret)
+		return ret;
+
+	/*
+	 * Keep the interrupt disabled while the bus to the PMIC may be
+	 * suspended: otherwise a wakeup event (e.g. the power key) is handled
+	 * as soon as interrupts are re-enabled on resume, before the bus has
+	 * resumed, and reading/acking the interrupt status fails. If the
+	 * interrupt is a wakeup source, it stays armed, and the pending event
+	 * is replayed by enable_irq() on resume.
+	 */
+	disable_irq(rk808->irq);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(rk8xx_suspend);
 
@@ -938,6 +953,8 @@ int rk8xx_resume(struct device *dev)
 	struct rk808 *rk808 = dev_get_drvdata(dev);
 	int ret = 0;
 
+	enable_irq(rk808->irq);
+
 	switch (rk808->variant) {
 	case RK809_ID:
 	case RK817_ID:
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904c864c9..1255de484ab51 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1461,6 +1461,7 @@ enum {
 
 struct rk808 {
 	struct device			*dev;
+	unsigned int			irq;
 	struct regmap_irq_chip_data	*irq_data;
 	struct regmap			*regmap;
 	long				variant;

-- 
2.47.3

