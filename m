Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101616;
	b=J3gYJZ9ImSElFajI8mFeDFSZ/oOdqM8cPq2VBsoDrqDvdEoTnLflBYmz4kyKomswc11Z
	 LR8Lc3nn5H2pR47J4NzVaN2+D3HWoSZ2IKy6zJiMagjLorSZva4m1/7UDy4UwCeN2VPdZ
	 JiqC2xIU6BQ3a8NufRiwchKc5FmDvHamxeLWCmN/p1A3JbFWalz/Z9z0ycS3R4rutFPDz
	 zU9WXVjiLQgg9wvKirPQwMIlGRqEJqB2rXFDnMb8L5QfRUbSg5/2M/ecdaZxTGq3C2jOO
	 UF3hXUQpQkx7ngrmX0ru4DcAjYQGDZpdGu5/ciJWnhu0te7ErYqh9u+SV2JhtpUvIUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aN3CXt/x9gfOlsvyXuijagfc4O1+FI+oPryE5Ah2IBY=;
	b=UlS/yqZJa8swVDpXX6E5ygN79F0fpfdqMrW3fYoR3G1y5bIknytaf0zvrAt0Wm1rKHax
	 mc3b8vEBZHX8GGV8vs9+FE0wxPkigbnZiULLak0hYsG5YIYoVB0vDpB06aRmk5bD8uaB0
	 YpgVGgyXkvVKGAVRziFTWX+N2H2PaGwpyPKqAyE08o+GULTBuYcQSlKu68q71NEiBpOQI
	 MnhoMyqkMhiyF2qB+TwgtbNEEW9w2v6YK3yAquxhf1AyneLAU0VrhpYSusV/lxiyPyqZi
	 n3iqN+Nl7bssKodJJIqmKKZZtp+s1jjfp6Ri2BAMmuJKgA3UEyB4h77A8ylUk5ZybFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mrkG4OuM;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F733606A9CB
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F733606A9CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mrkG4OuM
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c413dea9ca6so643474666b.2
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 04:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101614; x=1793706414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aN3CXt/x9gfOlsvyXuijagfc4O1+FI+oPryE5Ah2IBY=;
        b=mrkG4OuMnqNmamtzp20/gZ0m/TIDihDUR7IirjO4Zuu8WAm/uPsLPovI9brMoxIYcW
         /HvmoIDE8z1cPwU9A+OgiHdX7pyWySF/KfrxO4/R7aEJXQIZuO808NzyjKNPc3sQ/6IZ
         2jzf+W0zVtHuG+tIvZdOQXMRa92rWCk7QXHhZ7CkHgAMKgdP4fj/qSSXeZKmwXG5jTYE
         CGvw4QH5APuANsPBAvZEXDcS9p9HoCQptX+5fhr9uOO2Qt+Q3ZhHsbdpiuJ95dzUPORA
         SqOEkQ/m+4LeizyOD45zju+SQhhDX7KT+ACQpnRFm+6B14OuVHKYiyTvtdmjiXmDxcup
         0vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101614; x=1793706414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aN3CXt/x9gfOlsvyXuijagfc4O1+FI+oPryE5Ah2IBY=;
        b=sJ5+dJd35z95w/EapTKLQ90ppXhvRRUP7ssJPAksXjgaKGg8q5sodcRkIVCvRgGU3e
         nFnnJvBW3DPkZmIYAvM4atxoPCmf7vtrYCz3aSoHXtBIhiHARz9G3CX75vOKRNLNY/Lp
         RwLmC5AyxzCsDDYNCEbw0dZSw3//5NGgG26w5ylrvojDGCmKCtUGs/x0l/k0iMUQVRyU
         NQS2w945rcqlo8fpyTP8OxdB//v+7IzWMwPDl6CpW4rdBguHs/eRQ6fd2mUILfQu9u4l
         HOvh/9E8MfgpFKG3RF6sX3jlFG7GR4wLrTVAAHFJeiB19PZh8igi5m5tvnrXmK9Ov4j1
         UaqA==
X-Forwarded-Encrypted: i=1; AKwUvBwpxwca45ZdZTJa8WqW3FL3LwiUwmXUERIlkJpodU/QY03G8IzrbkLDshAoMCTwtnnZ+wM=@lists.linux.dev
X-Gm-Message-State: AFq9FYJhK5DJWchVqpPbiCxTczHZumYdmd+QH5OjimdOPn01yUI2Zchv
	xmHWdUpCc15P8ot9VirPci0RmpQWrm23R3r8z+kX2Wk038rPzXSX4EkD
X-Gm-Gg: AYBFou14V/QO3WH3ooWZgPQH3y9My9cdBHAfqAmExNO4i5CR0H+4nYIrXdLHC6Gw/c6
	IDAS+Rfm5kRAXev1sN0EhZCo8FtLEnuMgklTfhNYcOLR5pUj/+/ZKTFMJIV9mXiPVuwmpEn1IRX
	nbFdrVa78NGpuX8ugwHUlYpBrth549PUO+fhG5lEUv4ej1/iCPvmbC/4vlUKsBnoiDmP/u4Sc7y
	7qM8d2zoTtQ+QNZtjZfbSxCJ/z05iAGXXKV+T0splLRHKX5LnjoNibOBLvdQMDuTjWltF2MUCDi
	QxfQhOMgMa7H1wf4sOUYN1bc2OtuByKU5WOBg837x9YXt6NA5o832A8mZJ7X4ZQWRnVRcex8R3b
	nXRwnv3U1mOKpDA9GT1IBcFCIGuXuVrmk6RH88RMtliph3Mj24qfH4n8Z8ECynwMI8yq76jswXw
	BcYPR67b1e4jsgANODqOo06CwKYV+fHj4EVnO9sZlPtJ7pTyEI5JWY+7Rz2Zdm2k89jCNSACDPf
	tzn8GxE2960+oJxrfUk20g3XJXIK0qS73lEKJLdDIti31puv1ZQYMysBf2piYY5VtXNzyrMj1Jg
X-Received: by 2002:a17:907:9624:b0:c46:a5bb:5740 with SMTP id a640c23a62f3a-c46bdacd582mr1075309766b.5.1793101614258;
        Tue, 27 Oct 2026 04:46:54 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v4 4/4] mfd: max8907: Convert to use device managed poweroff handler
Date: Tue, 27 Oct 2026 13:46:34 +0200
Message-ID: <20261027114634.79706-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027114634.79706-1-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
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

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_power_off_handler() helper.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 2a38e00a10c3b..e282dd82ece69 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,11 +174,17 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	if (ret)
+		dev_err(max8907->dev, "failed to power off the device!\n");
+
+	return NOTIFY_DONE;
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
@@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
 	if (!max8907)
@@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0

