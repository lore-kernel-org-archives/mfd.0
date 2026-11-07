Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038871;
	b=AzjTp/aPPgXHPgHEPEqdkXYl/we3xyed6PdO9fFJ4/h7sg/ErvrUaicC3i1h1ou4Cwif
	 3PrCyNlpXDR7+R+HGsKODBXxd6icieD9XJ2rUi+g49HeLCMKf4N61ar16PjqGsqB0KUWI
	 2JFq7Mjzz80Go18ajcG0iWFoKnn6GhiB7qPXsaehlHa6YU77oxbr9j5X/dOkN1znO3b0I
	 KDIA+UZPR2GTZ10oxf6ANPEQs+HsPbBcfroZ17qUBWNe5k7kUoCpIQwV2/RLmA7um82HP
	 JjHqvtTHxbeUSY/HM6wCCPN8/Tw2bKh6ceFFI+eKj4XbCgsuN8VacVTzE5a5kglBt1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038871;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=oZs3roWAwDTBLE9lO088xle60+3GzTwY9uksTU9Bji8=;
	b=iztfOnmsiE+UzbWqxKZG65bnWR1WksVNqyyXNj0gysJ2YjIwVlU21Is33SuKFes0gUKx
	 by3urawt8yn0IN1Y1UHubD5n9mBknfYWvcUiLfhwO5eB5gPi8J3TWc6nnd6R/KlNAC0FB
	 6nHDN4HVh+MLxKT8hXiQClFM3sSdRhK5TguQxaJZR680Aya4f3tDR2dCH8cPc1I6Dgz+a
	 mpsuvic93XHnip9i6ybBkvfb1gmIaFNVnghNc8QppHsetEFR9jTSUoT98LnIyusR9MGMK
	 Hpr9+RhQwj4ynm0vOoQiCV6TJ6oBOrQeJDxAGDAwAexjljJAVY9qnoArrX1sDUvODJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCED8606A334
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 08:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCED8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM7vS41QJz5BNS0;
	Sat, 07 Nov 2026 16:07:48 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6A787efV022675;
	Sat, 7 Nov 2026 16:07:40 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:07:43 +0800 (CST)
X-Zmail-TransId: 2afb6aeedc4f9f9-845a6
X-Mailer: Zmail v1.0
Message-ID: <20261107160743097R9VvfD_5S5vK286ZLzPhG@zte.com.cn>
In-Reply-To: <202611071607376342uPiYA9rHRC7ZI9Ix-8xh@zte.com.cn>
References: 202611071607376342uPiYA9rHRC7ZI9Ix-8xh@zte.com.cn
Date: Sat, 7 Nov 2026 16:07:43 +0800 (CST)
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
Cc: <tony@atomide.com>, <linux-omap@vger.kernel.org>, <tharvey@gateworks.com>,
        <support.opensource@diasemi.com>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDEvNV0gbWZkOiB0cHM2NTIxOTogRml4IG91dC1vZi1ib3VuZHMgYWNjZXNzIGluIHRwczY1MjE0IElSUSBtYXA=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A787efV022675
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:07:48 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDC54.000/4jM7vS41QJz5BNS0

From: Shao Mingyin <shao.mingyin@zte.com.cn>

The tps65214_sub_irq_offsets[] array has only seven entries (bits 0-5
and 7; INT_SOURCE bit 6 is reserved) while the corresponding IRQ chip
advertises num_main_status_bits = 8.  regmap-irq's read_irq_data()
indexes sub_reg_offsets with the main-status bit number, so whenever
bit 7 of INT_SOURCE is set (the power-button interrupt) it reads past
the end of the seven-element array and uses garbage offset/num_regs
values to compute status_buf indices, which can also lead to an
out-of-bounds status_buf access.

Add an empty placeholder entry for the reserved bit 6 so that the array
lines up with the bit numbering and bit 7 hits the power-button entry.

Fixes: 7947219ab1a2 ("mfd: tps65219: Add support for TI TPS65214 PMIC")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index f8c08dd86618..4f4bfc49542c 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -268,6 +268,7 @@ static const struct regmap_irq_sub_irq_map tps65214_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit3_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit4_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit5_offsets),
+	{ .num_regs = 0 },	/* INT_SOURCE bit 6 is reserved */
 	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit7_offsets),
 };
