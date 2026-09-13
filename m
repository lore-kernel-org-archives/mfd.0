Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD902E0914
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 01:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789263385; cv=none; b=WDtV8WoN6BsOnxfxIC8xtQ4fJvC9I37LI6xI5utPOMCq9Okre7ocp+/WXJcvJoJG6ZzJ+Yp2XkNhSSaTZoIZPOBTX1HxEv2Qbmr+Vl2CyrEUzHoaSo9VLS29MprNXLqQR6BuNTFdcQo0N/doLVq0kC990V5xbm5YwZQ2JAn5qq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789263385; c=relaxed/simple;
	bh=CLG4pIWs+GXLzx1JxRiZwDT88JUUqtuw+0n8R3rJCVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQP6eTZr9KWZxdmheyydJ++8yjJY6Y9bA3F6NWzRiKn45o6cjKqbXHdeT0mM+KkRVk0c/NoNAzD8+wr1R1FbMkf+E7iV6oKti3WkRxnzBdFtZwajNTia0qIGLVVjyy3ehnTFZc8tYyaDW/uSKAsGM+r84OBRDHOurNhImKtcw4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+YrlXLu; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+YrlXLu"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-530fa1d2b31so1152071cf.2
        for <mfd@lists.linux.dev>; Sat, 12 Sep 2026 18:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789263382; x=1789868182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eeDB9+yiOFXebPXFTGKBEDrl8/FEvZCQ3DggE9oyvos=;
        b=T+YrlXLuiVpzOmfi4rvUJonLYJQyUxQt3SfwoWUlDDjmE1GPn/Wm96L8T1LDzq6fH/
         qnEJYHNSL7DJGlzwYtbzKA4X6kRJqivDuuWzPsUKJB5t4cULLZo/0EG2ffVbsLlQsbTG
         9Y741U3I/r+PhLtj2PdHWj4q6vF7hX+PsYZuaGrGzr7nCG/IXmUTYQ/VZFlnRolXPwdt
         09ktzt2Mwi4ljTMne/IeoHUgcija/M9R5uEHRfM2QTm/8ETE7wbsimzJ6XMOJz9UwiZN
         tXo3oT3e/Z+NkfhY29uhpBvK6yVetUM/j/l6ULmxCDRIiF+tMfFfZSiAlWYxm3HuLo4t
         h7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789263382; x=1789868182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eeDB9+yiOFXebPXFTGKBEDrl8/FEvZCQ3DggE9oyvos=;
        b=tTG5+vSP7VGUiDSKJWs40+Hir5h5hK8g2aJOaMVsg1qbeINe2HJ8mOUaN4/ozqP6NV
         xIA3qLE6PHhS/C0NmyLjEnpRo9lTmuG1yQc/XgLEObCRRnLUI+2Zo0B4xNKn3Ibmu2fC
         K9JLK9PlodKC3smMjUJvvQawebwlC+LZaw8IP+9dKRgr7f97+JURu5F0CHm9qRBoD6Yc
         KVWuU8dZalOyxi95TC9lf+TDGgJLRPanzkcODhY6ARt70/HvVQH0XwjoCbmAxVVyMbcO
         8qQCdje+D7I58lr53RZoJdYLPTIK8sLynrFWnbCMdYj+ZltCz08ZX7Amk+ge2eAuZKOW
         06dQ==
X-Gm-Message-State: AFuF++n8jI3d0p8vAHF60ff7umxQLCJr1ZLjeEWAOMKbXSBpGiMb4Mac
	bo01MbrQhP7Tnnroce14UlAMZFK1PU6qMzfEPfBf/+ombQ9ONiSmP6c=
X-Gm-Gg: AYBFou2U1Fq+v5w388lTdWCsjnGXbY3l4oiT74J7pLZZol/BKE4epJUs4Q+6cTmKotl
	feLYh/T4+yragUDn0pRPTFXKYw240YFpPKUSrOIFLTey6Es7Js1E5jmQFwVhxyUOSi5IpXgXK6u
	FNm0TTW9p/Ng45qS2ePc6j7fcm7lS5FgUPtC2IhAqUKR2dLYgwJID1egsGmperou8sAySpPbe3z
	78uMYKMIaCugNdx++SOXj0fCsZDIPgRJiPGROg7d9vPbH+ePKxit0+Dav9FAwhUJnCceb3EWvvu
	BR1sZayZZ3KP8Sf5b639GC2u7/Vn5ZRyiujpJ0bJHPzVDqYyUvT+WMwOMnBk9QUZbF0yTcv/eBL
	stOMv1IpMj6z3fP1xVWS/JX44KjO0stzBsLnVA0777bQHAy+h5FPX4fJAHlxHwUHrtXDld7G6o5
	eQ19v+OmmJrPcKP3jInQcuF3MuolWtDDXQ9v28kSXMEnyevUZNMK0ugaIiLbTzKLI+N8K/uN1Ub
	7QUuTRL/XrS5wkU2gXUeLoUIdRRLgZzifl5mvoAPXXMv+RCnzxxNpTpbHIPfsqHtMEXj8jnXBIo
	icoLuE8kWVKRrWewSiij6GPAo4A7RINBzw==
X-Received: by 2002:ac8:7f4b:0:b0:530:e89b:519a with SMTP id d75a77b69052e-530e89b5841mr73249931cf.22.1789263382215;
        Sat, 12 Sep 2026 18:36:22 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530f6823ba5sm13156941cf.28.2026.09.12.18.36.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 18:36:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mfd: intel_soc_pmic_crc: balance IRQ wake enable
Date: Sat, 12 Sep 2026 21:36:15 -0400
Message-ID: <20260913013615.22615-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
after registering its regmap IRQ chip.  When that succeeds, a later
mfd_add_devices() failure or driver removal leaves the wake enable
unbalanced.

Register a managed action only after enable_irq_wake() succeeds.  Since
the action is registered after the managed regmap IRQ chip, reverse devres
order disables IRQ wake before tearing down the IRQ chip.  Keep warning and
continuing when enable_irq_wake() itself fails.

This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
variants using the INT33FD ACPI ID.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 516523846006 ("mfd: intel_soc_pmic: Core driver")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/mfd/intel_soc_pmic_crc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334..963dde430 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -164,6 +164,13 @@ static const struct crystal_cove_config crystal_cove_config_cht_crc = {
 	.irq_chip = &crystal_cove_irq_chip,
 };
 
+static void crystal_cove_disable_irq_wake(void *data)
+{
+	struct intel_soc_pmic *pmic = data;
+
+	disable_irq_wake(pmic->irq);
+}
+
 static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 {
 	const struct crystal_cove_config *config;
@@ -195,8 +202,14 @@ static int crystal_cove_i2c_probe(struct i2c_client *i2c)
 		return ret;
 
 	ret = enable_irq_wake(pmic->irq);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
+	} else {
+		ret = devm_add_action_or_reset(dev,
+					       crystal_cove_disable_irq_wake, pmic);
+		if (ret)
+			return ret;
+	}
 
 	/* Add lookup table for crc-pwm */
 	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
-- 
2.47.1

