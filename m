Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699179;
	b=Zcf3b9E4GyFk5dGURR5/Jf1QFPVCaxJdtLc2mkVdIj/P53eRpigeFjlG8zswxo07sRuw
	 /Kuva7zX2vtlFazWuZ5UbvmVR2hiJyvTREPA5jvnqm9uqNG8B98V18fVU5pbFoWKcM4M2
	 MubRlGy1zQt+jlITeBEL8cN9lMMOkC3ni7heYb9kFR0XXO3KtvMcURuYJF7hyowek/RhI
	 ofSj4CXzolnAe8YPy2qV6IlisdhPZj73Jj36koBM0tm6vFRsPRfmf8awMqGBiVm3xFNAz
	 XvTO8Bw0JV1b7+a1kljfdu6PHd7bh9eyq8OyF/76WjgouTGngRV2B6sRkLvA2YpX46w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699179;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=iPLD0jyLLDXscwsU39MJP+tXiWc4BE5SrvrcgADe+wc=;
	b=1+vJ6vFJW/csOt07/SNOSUM4jt2rYrkSFZyfrGKJfg1mz1gouotN++C1+qMGKg859vS8
	 uZ7gBiVFeLMpN66LlxC1crHSDdfaXxdOqJgcyznZ+ickf84dobbI5XnA0lZbzjIY+w+kM
	 VDm5agKhlaplNDzWdBcgkduYjzAAmyOfSMl2hhPvdIoU+n0+wp/nOUOmKHLz89AHiCNjX
	 59K8rYNaKuhzTrNaINNq1y+Sjvg0jWepIC53COuLZhhG6Byy7KJyryiL65i32A7HkslbS
	 1MeRxpa4iztg6FeX2kIh+bIPV94/tZ9HD7Nc7glLob4XhKyRkD1znYArPvbnlo2KXMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76558606EEB4
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 09:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76558606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAC3wJForelqNE87AA--.2243S2;
	Tue, 03 Nov 2026 17:46:16 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: cgbc: release the platform device if driver registration fails
Date: Tue,  3 Nov 2026 09:46:25 +0000
Message-Id: <20261103094625.1289569-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:rQCowAC3wJForelqNE87AA--.2243S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFyDGF1UKFWkuFWUZFyfCrg_yoWkZFb_Wa
	40vr9rZr18GFs2gF12yF1xZryIvFnYgrs3JF1xtFWagrW3XF1xXw15Zr43C3WUCr4rZF98
	JrWDCFyS9343CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j
	6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VU1
	YsjUUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEAA2rpnOFPEgAAst

cgbc_init() registers the "cgbc" platform device before registering
the platform driver.  If platform_driver_register() fails, module
initialisation fails and cgbc_exit() is never called, so the platform
device stays registered and its memory and resources are leaked.

Unregister the platform device before returning the error.

Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mfd/cgbc-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 2becaf797646..e9c754c97bdf 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -411,7 +411,11 @@ static int __init cgbc_init(void)
 	if (IS_ERR(cgbc_pdev))
 		return PTR_ERR(cgbc_pdev);
 
-	return platform_driver_register(&cgbc_driver);
+	ret = platform_driver_register(&cgbc_driver);
+	if (ret)
+		platform_device_unregister(cgbc_pdev);
+
+	return ret;
 }
 
 static void __exit cgbc_exit(void)
-- 
2.34.1

