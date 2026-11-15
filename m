Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733896;
	b=pwrMtQyi5H+V5V5Pi/P2lrv5zrpN3XQHzdr+RvtF/NE+EngnnoUomTe+a1x0Nc69RV0U
	 mXVkW46SOEMA6cREfFFlh9/RAbO2xuy+aAzhhgOdYz+aghtiH0NGQHT+Bjm2bRazjpazt
	 beETU9pFC15869GbmuSHODT/rXi2TBej917tA2MVUc1Sp0TrsNpJ9x9qxeLke0JguSXcD
	 oUSp5GrClF/t36Uj40iO2ZJKRKpqL6yQkFDkAVkeUZQWbtYS9bBt2VHq1WdSj+IW4NH8U
	 zkQu7bck857hYvgJVgaBJ9zVCTk7K8FsIEndFYI9DEEPz36LfzehQniR/9XPKaZfaRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RY4e8RQI4e8c796FFazTJw15iVbsWFNMY5rFPzIKTlI=;
	b=syamefW7xw1xyLp2PZcRBe1+t/a62L0BLKtgEdoR/J5nADV55+uC2YMYz5IhrzAHQM4z
	 7HhycWtqdi0X3gvU0tQUKBbxT4jL090Cobcwk1jUPp24rEsUDWwH5Q/oQLQwtraQiUy6N
	 ahr4hUadYSPBW1zF9ozKnOW+C6m3FSO2qVb8R1vySAJuQQjfP/rRst2y/NfUMPsKjzPxN
	 dM2rCWu/kcFoRH0tmFUiHnEwdk04+HWNVbOTci/f+dbStJXYu0HKpx14xIgCOsDWdo8Y6
	 Fg+x9LA3ELnVMBfpFCFcPD6RopaRc16ngxoYhgKsLcQEqYUWe814EJS+HKiQx9aD18Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xUXq7IsM;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBDE606A334
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECBDE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xUXq7IsM
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d427836e9so329872666b.1
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733894; x=1795338694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RY4e8RQI4e8c796FFazTJw15iVbsWFNMY5rFPzIKTlI=;
        b=xUXq7IsM2UwHlzRD/v87ASm/BtjV7RQWkZmXZOn+ZiUuPWu416PaPcQ3Xs4Tk+diEc
         i8aSym4itiFpOsUg/SxuvUBwQ+Zow2YXp4DG6pedqnqXtpt6cMCnTux7zXDwie9I4JMV
         mUW/eP+QbE7AQAh2cR/PN7M61BnVhS/M0ifgc+aLwyCekFSB2X2K+awKBY6RZEM3J3N3
         MPhMFdRqVXBfHyVb5XDxzjKrLXD9INPi8qoJ3d2ZrS2QUem+g1Du68nkdCakfVGBfFEL
         iFs9F6Uxkrpm4H5PZNmguKIHRVf4vtAB5YbD2VRJVWCmEcmeKo2zJrc+ySxXOEGGPfQv
         +gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733894; x=1795338694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RY4e8RQI4e8c796FFazTJw15iVbsWFNMY5rFPzIKTlI=;
        b=AZooBJ25zNqLezHtOFLASLgIalv+uQQjMyCEvHHCdqRMwMoT1/6YuLCKCa89im2dhs
         A9iHRNv7Wx2L+mZxHn5Q03A5DuLaeL6OZs/0xd1eTB1YX7zc0Ve/gB//Ax5f43ZOqecj
         eVZH26jnvPjcYsuqk70JyALrwOs8+XjjMmCvCzUJySEBG8JbVXYzEoEAurVrIcaHNJaG
         tIJH21metcLq66Lp1Lt+o+ScRxzG/n9pXLAEeiCyzKA/5Ifm71hQvSHhi8ENlkAKZF+p
         veijp8EFkNpJdySSqSzJ4p7YUwUF9uEfw+W4S5zkIorfXQq3BOAtfkhgDzTY9UTvHnQL
         IcYA==
X-Forwarded-Encrypted: i=1; AL+hErFo4Eosi2RZckNaM1Kg7hyOeDhaqG446gt/KY5zW6Rihw5PsEWPA9JM3E72iQQ5+euR8qI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9HH+pWORWELlsqQ58OIFGjGUPK05KdLS0gpMgqtRfuepVFYJfo
	EVrNStM2bNU1OKs1maR4Xm7aGQdcMW1vGw15YZVFTDFgN2UKyDABvcWK
X-Gm-Gg: AYBFou2ErXDuaTuLPOdtDhqehRE+JF3oZQUixcorZ49gg+lJs0GIn3TrDg6//amIOPV
	dJZzlMhAkep5IKNLs0SW2eL+oY79supeQzGzvlv9aHCqQgxSYTLSy7A+Q51b8uYVTpHU7CFBJDO
	Tf0/7mCDwnJ6gTnvOmvQUNr1WoT5skD7pr8izklgnJ2FkZVvIfgd+oKwfEF4RSyH/t8KxGNruPp
	XXO06/PwmXetgCDbvPRrN7T3L1XsJfJtFz4fOHxy+z0PWmdpcbEJju1b1ksJNBUWpwx4dtABzuH
	PgojsE+XE3ND7SWIiAngJfVJ1VtmHqy6UHzqi3jVS4dSMEBtNWwyASgokvGJLO4jkP+4iwelw0S
	n6qqExIrpd0IT2o4cnc31yGedLqx0VqcDx6Ni2bPStpmluQopF1Fo73Tbi1SB4OTGYOidzFfkwH
	g9PxQ5oLE7e+v3cyIOCglSNftSQEosKb+XLiKQ198VeO7vSPoixlO87t2ZMJFKl5E9gqPbhDHHo
	DETH1RKMI1D5zmD7QAE2rBn6Qa1paTALg3YQRnziH1TRU8MNY0p1oDqXJYuNlx05CM0EFOsGZ7Y
	BSHIdyH6rR0oUSYdCl7/zhtuWR8i+gyjT7XNGQjo2UjOJWlkGxNVpmQnBYqEFVGutwN75BBUdtf
	+QF4IYkv2bD76XdYQmR+ef3zyuqSBTvQ=
X-Received: by 2002:a17:907:3e9e:b0:c41:5e31:5184 with SMTP id a640c23a62f3a-c5096344e23mr565201766b.13.1794733894179;
        Sun, 15 Nov 2026 01:11:34 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 2/4] mfd: max8907: Add ADC client support
Date: Sun, 15 Nov 2026 11:11:18 +0200
Message-ID: <20261115091120.108684-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115091120.108684-1-clamor95@gmail.com>
References: <20261115091120.108684-1-clamor95@gmail.com>
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

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 74 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max8907.h | 53 ++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index f492ade8e4cf1..2aaea750d1690 100644
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
@@ -233,6 +289,18 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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
@@ -251,6 +319,12 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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

