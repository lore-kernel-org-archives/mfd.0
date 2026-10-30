Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379283;
	b=BEZ34R93lB8vG7PU6oMORe/csv1E5hxqpJz3W1lzEEuernuch1ZVwycis1DX/3yevgzI
	 04ZFbMDwT0BHHowlS/dVX49KiEMv0w8Wea/kwQRlZaiWaKDWVjl1XdpzxltOQQVrKd8Kr
	 nizPQeZmKn5qkWJPk40Zc+NPGoGz0lfxJK2ge6Op4goYXsrPJ3+ASQ610ta8dWrQTaeSP
	 EAA4xO+7ndzU0qM50sBOwSXh2KCGU+vdGqaoAw7XshA46Ok+D/7b8tw89zvoZ91uglEBi
	 RZcdpeBz+4MrtjgEbZ0WGkHGuqL6xq2seqEit3crjkwqv+J8lFsGeChapmj+OvgA9uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379283;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=gqsTvJ7a41yrqqE2dPsUN6jUpWjVThA+jIrQQJW3MfE=;
	b=S0bqrUBbNkzhCR/NpeDkeP9w0/gT3CqT4CjTllP4U9R5wHp5sRQ1aRhsTjeIgycbxzbd
	 oLWLoEOVlxMV5SEvWEUG6+yAIwR5kP1lTHIuv38C4LvMfFXtwXzkIVbMfY85T1ctyn5V9
	 odXWLa+mXFIgv+Y9/Ip13uwbAsOgu8a4FaAQZb8iIbCieXga1RqFu3XD4zQX9CExSoW/l
	 A+DamWPLQ/ukO1qf1FyXjf2546aHr+I0OBFavIi+R7CvJAYitu0hm7K2htevLR+zJl2eM
	 iOnUtzMUK20Kw2IIfoE2CmtLU+xzAVxrzipxhR9M1x9HU0oCVTa+2sERymI0KFMKvmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=PbHeaCVv;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE6606A31F
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 16:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFE6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=PbHeaCVv
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52f74f11b;
	Sat, 31 Oct 2026 00:54:33 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Lee Jones <lee@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	stable@vger.kernel.org,
	Support Opensource <support.opensource@diasemi.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] mfd: da9055: Fix potential use-after-free during removal
Date: Sat, 31 Oct 2026 00:54:24 +0800
Message-ID: <770185795ca9b919a9609a329362253befa6d26a.1793377422.git.liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa18dbc0a6403a1kunm46158e5a52a1c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSx9NVklKTBlCTE1OSB1IGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=PbHeaCVvvrXXrsiivjWdRruKkTkmTs+Crsd1ApkWew7M0oE+Wxk/4mwlDeRb11SmBVKJnGnt41w1WQiUznmMOYgtFdYdlKqyf6aMpN1U2BXfg3SxtRfUoQoJ/tFzG4jGbcqYhPNcoakomUKA3YGyeoSXzW5h0LAliZRqWaV9ZMc=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=gqsTvJ7a41yrqqE2dPsUN6jUpWjVThA+jIrQQJW3MfE=;
	h=date:mime-version:subject:message-id:from;

da9055_device_exit() deletes the IRQ chip before removing its children.
The onkey driver's remove callback then uses the freed IRQ-chip data to
look up its interrupt number. Remove the children before deleting the
IRQ chip.

This issue was found by our static analysis tool under development.

Fixes: 2896434cf272 ("mfd: DA9055 core driver")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:gpt-6-astra
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 defconfig plus COMPILE_TEST
and the driver dependencies (W=1).
No runtime or fault-injection testing was performed.

 drivers/mfd/da9055-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/da9055-core.c b/drivers/mfd/da9055-core.c
index 158590ad37d4..72820c153f23 100644
--- a/drivers/mfd/da9055-core.c
+++ b/drivers/mfd/da9055-core.c
@@ -393,8 +393,8 @@ int da9055_device_init(struct da9055 *da9055)
 
 void da9055_device_exit(struct da9055 *da9055)
 {
-	regmap_del_irq_chip(da9055->chip_irq, da9055->irq_data);
 	mfd_remove_devices(da9055->dev);
+	regmap_del_irq_chip(da9055->chip_irq, da9055->irq_data);
 }
 
 MODULE_DESCRIPTION("Core support for the DA9055 PMIC");
