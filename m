Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753070;
	b=MqDbuuoditAamy8j2SnmaVp3PkkFhGFG6OQ4iXhAvy3nI3gj1usL4dRnL8iCA3tDrU8l
	 rMm1RQKZAcRZXLW56H7AzMvlVdqijXxzYuWd3eilYTJXFYLhgLkzMfQBhCbTTWA5nfrEu
	 SEN638kTglX9uO+a3QbwpfSs12hxlNVVDc0kgQmKQ6ll+ueL7v/UXxz+yehBS4jLSjzLd
	 1K5ej9P2iZLvxxjxHgMLcuLV/Kj0jnjJNuLKZWzL+L/njk8Sa2MjoQ7gq+jlbSyRBDFfa
	 3FL8b2654BcwdZeojtXTW/Pt8OkQ71B6GDhb5KoVk7N/xRrYVTDfbZIp5QgNMg+gkbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=rPJ3lWJj+tovApgLVThNQ8lLu9fMR7Gm1SEZN5ItOqM=;
	b=WIa3QcRdcB8rEI6aUk0KenXNkGmXUz3fi4mQtbYN2rOi+WXpzEmClpBzJmjRNvZV3rVX
	 8sPfDqwcgdpmTA29Fc7LehcMOWLp/yQZVlcTDcKuF6TKMwtHrhdJnzd70TKyMomdMGs5U
	 Msmn5ZERaRce9eIL75qafAyrw8PhIh1OZg1rZpMu0DVUMOJ1qCOQE1IU5uHNaady0MfSX
	 zqC48db2VrUOdUGXgyMZt0sI3aFhj9rctfAu3yve7iMJqWnNcndC1gKEdeKQGmCYWcvjs
	 bJ7S0hoJ10dEEByJ6J1jRJ2yYRINZn2OVqp/RLH3ySZ1XmIgtElc2u44DIst/+dXJVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=Q9wh2CtD;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98479606A337
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 04:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98479606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=Q9wh2CtD
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jbKrk4mDkz8XrrM;
	Fri, 27 Nov 2026 12:17:42 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795753062;
	bh=sGnRkQHi4fUwx4lC1vSiANCwS/aXw+QyMv/B3B6IAgY=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=Q9wh2CtDEtb2acSySDSGKs2O7M+5f9JQBNYbDCl+YdYpgPyY+mt1L0503/Ns0eO3l
	 3gMUyXHKT5For4lH2hiBbGcww3f7Y7V//9FUr2ApyFyTBCNlOud6QnyJCeFcn3ewGT
	 BAJK/6Nfj78yyD7EPbFblx1HLwoeHTusGBW20aFQBfocWInD6Oxw/MpCru2Bo05BPc
	 61Fx/nMbv0oDgS/luziZjSPWCRq7CQ+Qx6RnBu9rJUIYeFRI1ifclWA4fYed49ztHj
	 mRbaw0lfG+YZcDkNw30l+BpI2FPK1g/sIwr4CNuUwAzNKNCiKbH5chDIQwqrlJkyBP
	 tNjUiUfgHbQuw==
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 6AR4HZmx048874;
	Fri, 27 Nov 2026 12:17:35 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 27 Nov 2026 12:17:36 +0800 (CST)
X-Zmail-TransId: 2af96b090460954-0c26d
X-Mailer: Zmail v1.0
Message-ID: <202611271217367487h3LD_GuX64e0UExSRdAR@zte.com.cn>
In-Reply-To: <20261127121734430rp7P_HaHukJyZYs7OMQjx@zte.com.cn>
References: 20261127121734430rp7P_HaHukJyZYs7OMQjx@zte.com.cn
Date: Fri, 27 Nov 2026 12:17:36 +0800 (CST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <support.opensource@diasemi.com>, <patches@opensource.cirrus.com>,
        <ckeepax@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyIDEvM10gbWZkOiB0cHM2NTIxOTogRml4IHRoZSBUUFM2NTIxNCBtYWluIElSUSBiaXQgbWFwcGluZw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AR4HZmx048874
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 27 Nov 2026 12:17:42 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6B090466.000/4jbKrk4mDkz8XrrM

The TPS65214 sub-IRQ table has seven entries because INT_SOURCE bit 6
is reserved. Regmap IRQ indexes the table by bit number, so the power
button status on bit 7 accesses the table past its end.

Initialize each entry at its hardware bit index. Bit 6 is implicitly
zero-initialized, so regmap IRQ skips it without reading a status
register.

Fixes: 7947219ab1a2 ("mfd: tps65219: Add support for TI TPS65214 PMIC")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Changes in v2:
- Use designated initializers for the hardware bit indices.

Previous version: https://lore.kernel.org/all/20261107162119836VR3jHjgaOF-Np7Cmm0nl3@zte.com.cn/

Build-tested on Linux-next next-20261118 with GCC 13.3.0 for x86_64.

 drivers/mfd/tps65219.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 69cf52a595d6..f65fda6acc74 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -262,13 +262,13 @@ static const struct regmap_irq_sub_irq_map tps65215_sub_irq_offsets[] = {
 };
 
 static const struct regmap_irq_sub_irq_map tps65214_sub_irq_offsets[] = {
-	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit0_offsets),
-	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit1_offsets),
-	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit2_offsets),
-	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit3_offsets),
-	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit4_offsets),
-	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit5_offsets),
-	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit7_offsets),
+	[0] = REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit0_offsets),
+	[1] = REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit1_offsets),
+	[2] = REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit2_offsets),
+	[3] = REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit3_offsets),
+	[4] = REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit4_offsets),
+	[5] = REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit5_offsets),
+	[7] = REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit7_offsets),
 };
 
 #define TPS65219_REGMAP_IRQ_REG(int_name, register_position) \

base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
-- 
2.43.0
