Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733325;
	b=NoDTv6BiWdp16cplw8i4m2ZlZHDKafKrFDrbX1BwFReGZvvUAHujF6xTjVoJbIF78nVX
	 aBGMgHJ4d3FJSqBfyn2NM2aCD3gF5DUIfmwxRuX1MyZYXUnyFqQJ+uKRM3+M+n65t8wuj
	 51gj7AJcvzadYTPa8OvHGBvG84kEynIPizyhFlD1v0HiHYvTnfZ7AsVt/toPrFAnPSKl+
	 N0kdxlpbDpW+E7wbW7MkvjR71k8WQk2DQsrTyMB4DyECS4/MEKOI1eid7xthPeiCY3pat
	 yYrtUipo556Y1e1F6tdp0m1a5WYNXh2rdv2FuXA3ieGJJ0cNrXSSiPYzgz+4zWFBgRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JIGdSfePgzD0dfXi1attDBqrNHcTYvQa9hsulRJWW/U=;
	b=SFo/zkLqKM4II9oRYQBDkch3d+bXzaz8qxu7oEmcP6DEwqbahNmX7Cr94EPNYxED+w3m
	 8uwlvaB7i0dv5aKJ3h8F2DAzwCBDC6gCD/hszWWhDCOmCmuXAG4aGbhN/+TAvGGL+BB0P
	 mzTDrysVpWZwltEE3FAOqibNrYAgqCl6c9CR+bC3PV8dzZ1Ax++4kQMZT5rf1bp/LKcdE
	 CFG6UPot4owtQTrMrkazkXjNPoHLpYa1EMPu7R7Dm5OouGxIvtZHfFspuZ4+jeJePYbJa
	 KcMVxLLMp4XZjSsVmseoOqhqIrYyUuEJiZPhjdPQJ2A5sg5egty2FiJBhGLZrwuAOMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1unG1g0;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D4606A32C
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C0D4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1unG1g0
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cdc606b47so441919566b.0
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733323; x=1795338123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JIGdSfePgzD0dfXi1attDBqrNHcTYvQa9hsulRJWW/U=;
        b=B1unG1g0+7VsFy76a+UFH1RtbD4aG+Bv6aM79Hk6kM1cEb2YPd1Ae2J1OrNMD6534d
         x8ETsZJ/xESOiLRhAqzWqWCw058gZHGwikl1QRdLDPjMNfrwE2XC8en+8OZv8XHnRnAL
         IYB6w+ZLlMK/YVsaRgDolRUI+Yg5VZ9uS6rz2lL/qD0Tr5ztOCfnNkUR4bJBbIn+MqF8
         uclmvQpQUTTOaZWzhwOjG9zqihkY7l+/0khmBJgSoZDeQUBhlWFQYq0B53mMQmsu9Njr
         bbZ12tS6vTfxISk+8Mw0WambZ0G5ivgauB2iiER6oA6UrNLrC/Fb4qmvKP+HEDZLCpoK
         WD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733323; x=1795338123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIGdSfePgzD0dfXi1attDBqrNHcTYvQa9hsulRJWW/U=;
        b=FVPS0Djo4dAVawEIP/8k3TiFbh9yTvBh88xn8yssHxvG0pVbcgfvxRsbiAFyAsAtF2
         yHdcO+7ncEd0UB0JDuk2Ni7IWEh8l+w9Ys69OTFmbCAUTdHVrc4nFLEtvFxrRxkK2Ugh
         /MkGqqc0v+l+6SY5AJMThARhdTeRazi6E+jqry8TY2tyI69WxZ0fT9gLD56rFA8HRZoE
         7DfzoBiThfUafkeKqtQIL584TZdbx1V329uAf/eEIO0ox3tMiYYERE+5kWLUsuOFJkd6
         ZO767YsA/QYGiAo7n4t0yOMNY5QC5gNmqbPDJ0uuw6bCQKWIGQ0d5am+uQktwmRJnA7w
         l4Lg==
X-Forwarded-Encrypted: i=1; AL+hErGmRO3uMwAjmeKSRZnIMgw2gLMa5NFJ8RT0ZshJkt7phHcDm7MLxrK9/2nF6lNzZDNjAbg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/lOcigCrpOid0KkCtIqSmnFiwf/uIA3NxJFmoGWTgzs2afKb9g
	9lDWnVKRhhXUZ8i5DAZT8Zg22dDwwbMdd1Y5aAxoWG2uz2Oj5s5bmGYn
X-Gm-Gg: AYBFou2cmDqDFc7QnpVnKOOaNK+vw0OSWjbTot7/8nETZk+DvzAtWP9fILzPmoaxC1C
	7cao1vGnITR5BI1W9MTdzYfHmAWIS/Lvh+fx+E9D6tFDML6jIKsXcAu/JUetCO+2OpvRg1jOZyz
	9JZXyxjmnUBzjoysjicSnQChm2ae2ru05gY0MO5iTp0NMSvfCqZ+AnSpcPEBrrccFqSvGUYRv4v
	piRIg5bL5beBU3bz1yfL7ikbG5i51EChfzZw6pC8+CuIvsCl70tdRscBUZOMI1U+gvpz5L/5XVZ
	hgyo7mGOzx8Q818MbzrhWAnAErj2QH+epz7P0m82JsdY55mf5eVdRZ4R7wuq/OPw3lzQzG6q++b
	wng9iH532qdHnUTiefN+L/cn3E9Xpo7tSeqfCS0Z5MsiJAHSbBi5AKAIVIwBb8zXlinQ4//9qCe
	B4tBDPEXS7aMdpJebkTa2IOyfH0vEAOc7QVjDJ4txZ+esaWTOL8B9Ll3tVMD8/q6xA/vPokWLh4
	2HU1ytwqhhzaDJiq+4FQXxhnGe+iQ0N5faOcRzh0FwGocr7HkNqTvesVNXi1MVVIA3SqiDGee+u
	t00EtD+d7+oLM6k9GoZOpC3Rkipe9pjaxd3MAM2yZ2QDKnl/zpu2w6H6qbmn4sSV/Z5W5++2TYs
	artngu14t/Q==
X-Received: by 2002:a17:907:3e8b:b0:c29:f5d8:9c78 with SMTP id a640c23a62f3a-c50964101demr575842866b.39.1794733322499;
        Sun, 15 Nov 2026 01:02:02 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:02:01 -0800 (PST)
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
Subject: [PATCH v5 4/5] mfd: max8907: Convert to use device managed poweroff handler
Date: Sun, 15 Nov 2026 11:01:46 +0200
Message-ID: <20261115090147.95337-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
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

There are no in-kernel users of maxim,system-power-controller property and
all new users will use generic system-power-controller so check for the
legacy property can be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index f6d7a4ce9712f..8412dab2133e3 100644
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
 
 	max8907 = devm_kzalloc_obj(dev, struct max8907);
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

