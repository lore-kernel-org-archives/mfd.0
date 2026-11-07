Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039687;
	b=JDVpESaAIeFFEZC8giTLKSDK2BQppl+VhjitG/EvMDRfPAg+Y3Fn9pgglXRDekFNfXiM
	 q0XEb1gI37pmjoflzQix/N9FKdaxw8OwYbKX7wmsC3xJX/oWjhcrjP4tjx+MyEFSeOE2p
	 8GRr3VfUnPueBUGQbufbbiPi5XkqX7SgOG9ZL5QOT6asLq8C0lL3oyKQfGK3MzP9/mkAr
	 ytL3MdmRMAvYTTV+j2xiZIB7i8gAWINlK2dc5xoC4LVF4ZVEGdWl37rM29mxUwaZQE/Cr
	 CcQ4zrvPkeDZlcK1Y6d8O6n2qdbpLFFJBFvAv6mV0Ujf2iFcxlS6nc+Tp/YqCm+5LwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039687;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=Wn3OypTVFQ8KIckSKHmhgectqFgnEYMzQS8CtZVgYp8=;
	b=XnIvHtSbwrnzPMBPYFpWXFBGAmHKTBaHVwIE0Sa5p+tNDPWF7TEqfCePR+pYJh6hr/v/
	 z5ZcxIo8ratmh3I92mkyZKFZF8WKOmdiRrCLKSsZONimp56wguHWasR3vicHre7kEAcyM
	 FVt6vYYlayxves4oEF8r+PJvHezq36Ylyf0MENhDx8yarVVGGcfhglR5Uz3+ZEYgYE5vC
	 xIuwybf2mtTs326uKctwfLNx0njMf7YxSOdvzQ5zUJ0P3q3NuPkpCxbLsGIO88dSOvMGm
	 7ECxd+yn26M4cbPquInS18/CiE4k/BU1BL1RTTz7Ck+X4Q1AHF4r3VA/74aT/F592TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A69606A33B
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 08:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A69606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM8C84T8vz8XrrZ;
	Sat, 07 Nov 2026 16:21:24 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 6A78LJH9003100;
	Sat, 7 Nov 2026 16:21:19 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:21:21 +0800 (CST)
X-Zmail-TransId: 2afa6aeedf810f4-a2c82
X-Mailer: Zmail v1.0
Message-ID: <20261107162121178QffEnlezkInAnSMsrwQzA@zte.com.cn>
In-Reply-To: <202611071621143491uRwluLhxYsUHx2V3qhm_@zte.com.cn>
References: 202611071621143491uRwluLhxYsUHx2V3qhm_@zte.com.cn
Date: Sat, 7 Nov 2026 16:21:21 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIFJFU0VORCAyLzVdIG1mZDogdHdsNjAzMC1pcnE6IERvbid0IHdyaXRlIGdhcmJhZ2UgdG8gaW50ZXJydXB0IG1hc2sgb24gcmVhZCBmYWlsdXJl?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A78LJH9003100
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 07 Nov 2026 16:21:24 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDF84.000/4jM8C84T8vz8XrrZ

From: Shao Mingyin <shao.mingyin@zte.com.cn>

twl6030_interrupt_unmask() and twl6030_interrupt_mask() ignore the return
value of the twl_i2c_read_u8() that fetches the current mask value.  When
the read fails, "unmask_value"/"mask_value" hold uninitialized stack data
which is then masked/unmasked and written back to the INT_MSK_A/B/C
registers, corrupting the interrupt mask configuration of the whole PMIC.

Bail out with the read error before touching the value or writing it back.

Fixes: e8deb28ca8e2 ("mfd: Add support for twl6030 irq framework")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
---
Resend: the first copy of this patch lost its final empty context
line in transit; the diff below is unchanged.
diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
index 0ca00f618d4d..1333c4e9cdd7 100644
--- a/drivers/mfd/twl6030-irq.c
+++ b/drivers/mfd/twl6030-irq.c
@@ -235,10 +235,11 @@ int twl6030_interrupt_unmask(u8 bit_mask, u8 offset)
 
 	ret = twl_i2c_read_u8(TWL_MODULE_PIH, &unmask_value,
 			REG_INT_STS_A + offset);
+	if (ret)
+		return ret;
 	unmask_value &= (~(bit_mask));
-	ret |= twl_i2c_write_u8(TWL_MODULE_PIH, unmask_value,
+	return twl_i2c_write_u8(TWL_MODULE_PIH, unmask_value,
 			REG_INT_STS_A + offset); /* unmask INT_MSK_A/B/C */
-	return ret;
 }
 EXPORT_SYMBOL(twl6030_interrupt_unmask);
 
@@ -249,10 +250,11 @@ int twl6030_interrupt_mask(u8 bit_mask, u8 offset)
 
 	ret = twl_i2c_read_u8(TWL_MODULE_PIH, &mask_value,
 			REG_INT_STS_A + offset);
+	if (ret)
+		return ret;
 	mask_value |= (bit_mask);
-	ret |= twl_i2c_write_u8(TWL_MODULE_PIH, mask_value,
+	return twl_i2c_write_u8(TWL_MODULE_PIH, mask_value,
 			REG_INT_STS_A + offset); /* mask INT_MSK_A/B/C */
-	return ret;
 }
 EXPORT_SYMBOL(twl6030_interrupt_mask);
 
-- 
2.47.0
-- 
2.47.0
