Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797674;
	b=a6MEBmZ8SciOsZJVD3IE7sPE1r8O/dU0RK0fK/ZTQURNX6E3OjNKKvtVaDi1/bSjA+Lz
	 +xkpWcemBp2K6tVEzfKh3bJl266OR97YjOFHvol11vYgcFA47cXaDG23fWF0QKdESuXhJ
	 g38HLkTQn+zSBgQeZqEXWD4H1GlUDSeGLjHnigCG67qAGL5zSzVqKuBNPs6FxgAy8EKI8
	 wP9Mnqax4coVr2BhToh7LvxHKAIVgzF2c81sXdUILx/3KSSmZm8SjaQfPZ7GCxBtAIShX
	 NXFzP119xwjzS3h34OwmJdDm56J4ARwKjbPXWyPT/wss4O6cUhgxrl6JKvdSgfeQYmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YYIF8RkppipMffW3zldT0xJTZtUWxbFsBpGgswJx78w=;
	b=MMV9fTNlixOt/3X3xEEGYDDqxLfvbYWhkrL8m0kyXaRV9jKU0sh4UMtgyW+dpXR30yes
	 Q+XTH40nfTDHnLB1s9QNW2Jb3z58QRLkTdXQW8h7B9Bms577yoejZyp34P7bxEmcFw2Yh
	 cw9h+SIk0xs64gOdTJtOFUwbOPRcM2+mExI0ZL9iMCJLfNLfC8MLhgprCca8CscFnMdQm
	 7loWFdje0gy7DGMqIdPohy2AV894yj7O8yUZoeQMnSOVipLRfGDvWAbUNOpXlsaaUdKji
	 /HypDhv7U0ZkA7D+i4oXFvF+1Jh12A5ZKb18s/xI/KM2NlCDwzTjHkajQ+efdWatqKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEf4+ygB;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDC9606A6B9
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECDC9606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eEf4+ygB
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1602424466b.1
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 08:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797668; x=1796402468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYIF8RkppipMffW3zldT0xJTZtUWxbFsBpGgswJx78w=;
        b=eEf4+ygBrQODsNUAtVd5cxUT/EFX/hRKPic5z/5g7k2zpNDDiTvIofrlwOHlbJbDIu
         N8sVbRSSfl2VduoYOxE854yLy4OR8KEEaEqKZ+Dt93JTIDQnhHlJ2JhiJICGVOAdNzSE
         IMpCYVg8sVhh/2Bu8e46PPr+qZqmHpg/thKffXvTZWL5LwVJ9Ni0UCv7LUS8Kjg7JKh/
         SFb0ThhUnFDi63nrH9PEuvh+S1zifPaAte4H2eyd3Y93mxFh/xAZ9t/zM6AJop/S6Gqw
         Se4RzbHz+7svRm/WpIrhvWxyZD1Iw+kyur3Qkj0S2b/WAJGICNL4D7iKp1d612pAeY+x
         d4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797668; x=1796402468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYIF8RkppipMffW3zldT0xJTZtUWxbFsBpGgswJx78w=;
        b=ITN1AXbyUcHRuPTQ+6pyC/UxvtqgXvt5D4/eHwFcZ97t3P7BWraTUimKZ7PBO3QtC3
         1GF85k1nUjVbPyKoDVi+mbYl/dTP2n9YxAaGMsyvyMnqJJCYtp4N3HPaLI53Doxiq5nm
         KOp2fiCh0W0TS3DKkRyEZFMENt0GjE8rpj55Bq0CH5S+6MZnJO/ER6hrhExXuU5nKJiE
         kmI0ow3FTyyEpdhSB8oMVk6nALPLg3pvpdKiEcN5uaNZg3NbvCKN19DJImS3tFykH7Qg
         7QGfc26UgFUbvECWfT0ayjv+cVRb9J4a8u1Qtu200fA9pxMEuRXKxfur6FYGJTzf6xkx
         fCnw==
X-Forwarded-Encrypted: i=1; AL+hErEmO+uxvcviiFVWFKQnNu1FDLRuLWlSwZggOpwdmeaXzUmPnKwmdooJIy6MZmAEdXwL8Rg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+IPoBVScq6IDCHHQPOdGaqISYm1i9zs6YsWbxL476bn4HiX5Ve
	H5rVq8KP9TUXc7mNh+jJ/saX0M5uDY0RCei8r/m31VZo+DxxhNiDjaWw
X-Gm-Gg: AZFdTZft8vzQdwPkEXiD+dmEsfCHqT80rDhh4oHSgXkhyfoiH+rKEevnzRDFJXWezoD
	3gCaUCaiK179BTC8Mxyg49EMzITNTEl7kHO1Uyr1K1F0uZkXFK2UBhM4sccDJuua3V1oFIqjOzD
	aKLcBXCSprY5MoRpJG8KkxWIzWvzLyQJa6uTOtOuQKxc0/X6HNaX0qISwHh2XEJKEdz7OrK1OjG
	u2nnPrd9n/2jmQx2HkOTwl1poikJ/GlZHpb252hPeTShzXjFj5W5PbMt18LyJlj0zHIAOAjuf91
	TnrXj/gIYj/a9Qq/wGTX2DxPGiTT50UBQU08vbITHDm3sq02AXz/rdniJeeLXQHPAoHPpcVlucF
	P+L7QZ+Rax1H6Y0UdLKLqIa2S+3UxSgumDgw18s7SDYe0hfcgp0xMW2F0zz+/X9fGKPmvMm9nsY
	YvisGfuWmAcGvRDhMQo91qTapW63OAiJqHzqB1H2RsHcfhJ2Mui7d34yjqTmFpzZ2CKoOmaSy5k
	drtDoA2qlYrjvS7AryekyYsQLdsKbBevk/m9Z7sVmKnmzzcoiVADwgPJG8VsecFUmvxsRHa+trL
	0yrNPohl0bsyKUjUQzmyyo4Nr/mgcyGRmiBYWgZF4o7JsMwsHpwMY1j61FHdFMdw1c1VSnNA3fp
	eMw846h4Oyyzx8NMmU2IRRTrnoaz+9syn
X-Received: by 2002:a17:907:6d22:b0:c45:219c:7fec with SMTP id a640c23a62f3a-c51319bc924mr2316260366b.27.1795797668126;
        Fri, 27 Nov 2026 08:41:08 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:07 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 5/6] mfd: max8907: Add ADC client support
Date: Fri, 27 Nov 2026 18:40:43 +0200
Message-ID: <20261127164044.285910-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164044.285910-1-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
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

The Maxim MAX8907 has an 8-channel ADC at a fixed location. Add client
support for it along with its regmap and interrupts.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 74 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max8907.h | 53 ++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index b511c57026188..103294c76b97d 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -113,6 +113,48 @@ static const struct regmap_config max8907_regmap_rtc_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static bool max8907_adc_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX8907_REG_TSC_STA_INT:
+	case MAX8907_REG_AUX1_MSB ... MAX8907_REG_TDIE_LSB:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool max8907_adc_is_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX8907_REG_TSC_STA_INT:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool max8907_adc_is_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX8907_REG_TSC_STA_INT:
+	case MAX8907_REG_AUX1_MSB ... MAX8907_REG_TDIE_LSB:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const struct regmap_config max8907_regmap_adc_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.volatile_reg = max8907_adc_is_volatile_reg,
+	.precious_reg = max8907_adc_is_precious_reg,
+	.writeable_reg = max8907_adc_is_writeable_reg,
+	.max_register = MAX8907_REG_TDIE_MEASURE,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static const struct regmap_irq max8907_chg_irqs[] = {
 	{ .reg_offset = 0, .mask = 1 << 0, },
 	{ .reg_offset = 0, .mask = 1 << 1, },
@@ -175,6 +217,20 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
+static const struct regmap_irq max8907_adc_irqs[] = {
+	{ .reg_offset = 0, .mask = BIT(0), },
+	{ .reg_offset = 0, .mask = BIT(1), },
+};
+
+static const struct regmap_irq_chip max8907_adc_irq_chip = {
+	.name = "max8907 adc",
+	.status_base = MAX8907_REG_TSC_STA_INT,
+	.mask_base = MAX8907_REG_TSC_INT_MASK,
+	.num_regs = 1,
+	.irqs = max8907_adc_irqs,
+	.num_irqs = ARRAY_SIZE(max8907_adc_irqs),
+};
+
 static int max8907_power_off(struct sys_off_data *data)
 {
 	struct max8907 *max8907 = data->cb_data;
@@ -227,6 +283,18 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(dev, PTR_ERR(max8907->regmap_rtc),
 				     "RTC regmap init failed\n");
 
+	max8907->i2c_adc = devm_i2c_new_dummy_device(dev, i2c->adapter, MAX8907_ADC_I2C_ADDR);
+	if (IS_ERR(max8907->i2c_adc))
+		return PTR_ERR(max8907->i2c_adc);
+
+	i2c_set_clientdata(max8907->i2c_adc, max8907);
+
+	max8907->regmap_adc = devm_regmap_init_i2c(max8907->i2c_adc,
+						   &max8907_regmap_adc_config);
+	if (IS_ERR(max8907->regmap_adc))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_adc),
+				     "ADC regmap init failed\n");
+
 	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
 				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_chg_irq_chip,
 				       &max8907->irqc_chg);
@@ -245,6 +313,12 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add rtc irq chip\n");
 
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_adc, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_adc_irq_chip,
+				       &max8907->irqc_adc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add adc irq chip\n");
+
 	ret = devm_mfd_add_devices(dev, -1, max8907_cells, ARRAY_SIZE(max8907_cells),
 				   NULL, 0, NULL);
 	if (ret)
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 9865ae52877fd..ac4532d172331 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -153,6 +153,51 @@
 #define MAX8907_REG_MPL_CNTL		0x1E
 
 /* ADC and Touch Screen Controller register map */
+#define MAX8907_REG_TSC_STA_INT		0x00
+#define MAX8907_REG_TSC_INT_MASK	0x01
+#define MAX8907_REG_TSC_CNFG1		0x02
+#define MAX8907_REG_TSC_CNFG2		0x03
+#define MAX8907_REG_TSC_CNFG3		0x04
+#define MAX8907_REG_ADC_RES_CNFG1	0x06
+#define MAX8907_REG_ADC_AVG_CNFG1	0x07
+#define MAX8907_REG_ADC_ACQ_CNFG1	0x08
+#define MAX8907_REG_ADC_ACQ_CNFG2	0x09
+#define MAX8907_REG_ADC_SCHED		0x10
+#define MAX8907_REG_X_MSB		0x50
+#define MAX8907_REG_X_LSB		0x51
+#define MAX8907_REG_Y_MSB		0x52
+#define MAX8907_REG_Y_LSB		0x53
+#define MAX8907_REG_Z1_MSB		0x54
+#define MAX8907_REG_Z1_LSB		0x55
+#define MAX8907_REG_Z2_MSB		0x56
+#define MAX8907_REG_Z2_LSB		0x57
+#define MAX8907_REG_AUX1_MSB		0x60
+#define MAX8907_REG_AUX1_LSB		0x61
+#define MAX8907_REG_AUX2_MSB		0x62
+#define MAX8907_REG_AUX2_LSB		0x63
+#define MAX8907_REG_VCHG_MSB		0x64
+#define MAX8907_REG_VCHG_LSB		0x65
+#define MAX8907_REG_VBBATT_MSB		0x66
+#define MAX8907_REG_VBBATT_LSB		0x67
+#define MAX8907_REG_VMBATT_MSB		0x68
+#define MAX8907_REG_VMBATT_LSB		0x69
+#define MAX8907_REG_ISNS_MSB		0x6A
+#define MAX8907_REG_ISNS_LSB		0x6B
+#define MAX8907_REG_THM_MSB		0x6C
+#define MAX8907_REG_THM_LSB		0x6D
+#define MAX8907_REG_TDIE_MSB		0x6E
+#define MAX8907_REG_TDIE_LSB		0x6F
+
+#define MAX8907_REG_AUX1_MEASURE	0xC0
+#define MAX8907_REG_AUX2_MEASURE	0xC8
+#define MAX8907_REG_VCHG_MEASURE	0xD0
+#define MAX8907_REG_VBBATT_MEASURE	0xD8
+#define MAX8907_REG_VMBATT_MEASURE	0xE0
+#define MAX8907_REG_ISNS_MEASURE	0xE8
+#define MAX8907_REG_THM_MEASURE		0xF0
+#define MAX8907_REG_TDIE_MEASURE	0xF8
+
+/* Regulator stride */
 #define MAX8907_CTL			0
 #define MAX8907_SEQCNT			1
 #define MAX8907_VOUT			2
@@ -166,6 +211,8 @@
 #define MAX8907_MASK_OUT5V_EN		0x01
 #define MAX8907_MASK_SOFT_RESET		0x20
 #define MAX8907_MASK_POWER_OFF		0x40
+#define MAX8907_MASK_INT_REF_EN		0x01
+#define MAX8907_MASK_NREF_OK		0x10
 
 /* Regulator IDs */
 #define MAX8907_MBATT	0
@@ -226,6 +273,9 @@ enum {
 
 	MAX8907_IRQ_RTC_ALARM1 = 0,
 	MAX8907_IRQ_RTC_ALARM0,
+
+	MAX8907_IRQ_TSC_STICK = 0,
+	MAX8907_IRQ_TSC_NSTICK,
 };
 
 struct regmap_irq_chips_data;
@@ -235,11 +285,14 @@ struct max8907 {
 	struct mutex			irq_lock;
 	struct i2c_client		*i2c_gen;
 	struct i2c_client		*i2c_rtc;
+	struct i2c_client		*i2c_adc;
 	struct regmap			*regmap_gen;
 	struct regmap			*regmap_rtc;
+	struct regmap			*regmap_adc;
 	struct regmap_irq_chip_data	*irqc_chg;
 	struct regmap_irq_chip_data	*irqc_on_off;
 	struct regmap_irq_chip_data	*irqc_rtc;
+	struct regmap_irq_chip_data	*irqc_adc;
 };
 
 #endif
-- 
2.53.0

