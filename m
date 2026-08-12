Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB340314F
	for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 21:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570266; cv=none; b=JHK6iaEZtgNHMbxWp1VtBEV//A2tCNcQGOkxJx0vjtpuJQYrpkKULw9xvcyap169SAMArZzY6YY3Y8VbgdH58KqT+abVm2MIlsyEYE7UopaT0LC6fWWNF2U1uaI+UD5tTN39qgR6tIXYGWjJYG60fpDAt2xKY+UYs3UlOpSacvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570266; c=relaxed/simple;
	bh=wXqZSdqvIcJKWS3NHh7hSZzb0Fy4RHTv7j5v15ANLnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uh0CPqI+IiHi04Flm2bT7HVdhED00xt/nTOJD2v6CrBkaiCi3TRKS/J7PXlHcsjXYrMh5RGWE93ujdjpBtzCE4K5sRXugXnOvgzZoGLhcszcMkaWfWQ5pd8H2rF5+G31b+6KsEnLCrSP9PPLyirMWt3NJOcjf+s4L3gGO3FNLtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fIWDJCgt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fIWDJCgt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so1794665e9.1
        for <mfd@lists.linux.dev>; Wed, 12 Aug 2026 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786570263; x=1787175063; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nLCXRdYBbzsqqU+KjFO/DdbrpddiifvGaDhMVqXEjUY=;
        b=fIWDJCgt44Giv+gc6qkh7NICXl8i1jiqvqWbaZ8mkU0W7oDr5t/4yIaxejNIy/Tify
         UTDXWFW9Ymjh2Rgmg4dIswPwto6u6p08haVZmRCxZWr0a/dO38bP1WlAPXvVeVYEimOg
         QG4d+mX+nC5VCC+m9WMV0Lad5PAPnSKAtr81/catFLCIyJvAFiX0MmGXlnTQfcPpwCLN
         nXEGGURUakKnomX+lUJcG/VLhsX6vjmoRXpOi8P5KNjzaULbCZGW+O3Xfr2aHtFo5cL5
         haFCMdqa4B4FRa5S+3/qQ2mZ0UIuONbFZI5juYk8MxppfhseLg6a4Tgl177ZxGBcP9RY
         s55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570263; x=1787175063;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLCXRdYBbzsqqU+KjFO/DdbrpddiifvGaDhMVqXEjUY=;
        b=rUMwW3/fFs1CMh0Y5bSWlcCBq5Kkg/ezcBCiq0dDtq1Nvd9h3aSJACH3yPqBC6VCNu
         ljn2Jse0XsEMveuVHroZFSCNk/DDP4IAPuqZibFE7BBN0Uf9uZC+s3QNc2Gi8TbnomvV
         h+sGwXCrTCc3MBzbtYwMK+JDqaBvZZwLt+gNcT61Rz/jAvZKSnRNLLP5gu+x/dKMkj/S
         GxhNEdvkg8OxqmI6khJtLnt6chlbRvvx/SNwg+FVMua1wzeEzGW2vu9b1lkantMUfhT1
         Tg81JFeciUjdisgseT74gKkwdxQNFb/00Q2O0LEsaUbKFXOkjcakB5zIVyxLvIDUKOnM
         fE5A==
X-Forwarded-Encrypted: i=1; AHgh+RrYBKIRLclMdSo/fYjdnuDI7gF0SjotebFkZa3+Vp89P1cEf6tkUKFu4k85t4ilJwCtaCQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMhWWBGQCweQ1VGVPz3o1VOo1D1Qamunmpme1OR/JMsEgWoAQU
	dZSGZOl+rHNGRnF6Wy8F5OBt0+4Gqj4C6usZT5OrGoRxMpx83Y8CXVGPMNBiW70sEF8=
X-Gm-Gg: AR+sD13hM43e8rQh+/Fp+ACE4X2r1d16Spjrnpp5sI0vtUDilE9CyWYiLhRsJP0CJr6
	VCfQMhyWlW+iaO4O8irtvggoU4DES8Dd9kornqUAGJw//ws6c7C6efGi8ZZi76lvYhwbkTuC16Y
	sn8DhwqxDTNVRem2L8xxSMHmf4SZiXlywhGy+dxuHMFb9nsgA3l9siuZ/ha9Dib4W4tLX6bMppU
	q2XnFnhV8qE++dM8e53/ins5Nnh2FxgcOAvaogh/BdxoMShsnzNXLOSN3ZOdxv5hVyv6XkXSQjk
	Gcqkmoc6kn4q0RTIZzJ7rszAoH5fGL7bNvpAL7fEhpN/TU6S7HRJZM7DB14RXJJfknuDnUTx6wu
	Ndhc3MMXYLRbtOhMWdOuJo4eC01G7Cdlt8MYKwLyTMmNz+q1id/yieBkwpYWohNZ5+Khkb85Eto
	h0NcyXCH/OM4O6Q3lhBJ2GKT5xnViiXODh4GRVm7enMX/OmH568ymIlc1PkZg=
X-Received: by 2002:a05:600c:1546:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-4998220bc5fmr3913175e9.7.1786570263197;
        Wed, 12 Aug 2026 14:31:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:282d:879b:d1fe:f977])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49981b585b3sm17032085e9.10.2026.08.12.14.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:31:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
Date: Wed, 12 Aug 2026 23:30:42 +0200
Message-ID: <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11128; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lCIoI2OR8DW2EqdOmZne0ZKTXbwoT8DKQPeKDXJ7r8I=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqfOJ9eFIGVG0EGpVi6ADrY8YTa6EOsa/iF5TkS
 R5dYdXdWtmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCanzifQAKCRDm/A8cN/La
 hfrpD/9LsBtnP9l07c3Fvr+Wcs/sEGoxAHR6N9kBbm897kZ+QUz8SGQvrkXkIY534nLgfZV1Ph8
 G/T1CL2p8Z7Ky5D+/ObS0UbaYcE5UrAHpMahXbbQr7Sx83Zeni2dDPIESDhVOzTbI/cAIaSsG5A
 wfxf3h0xidviB6WJRDFW92bmhFKBPxIILHUyrl2Su6IYOuZ+6KOM6xffOzK2t7Kha677d04CZ1+
 8jh7EhPiTjWHWc+nbC2YOuS3TT1s9adA4xqzrgPo1kftZh1kmNT2K6yHYPwirGcOTCS07io2jCE
 XmkuVouDLGHynmJmc329/amHXTxjHa7AVSgRljvxJwPwE5TmnWbNFdbhuNr2+PYMztKVIq/OQ/p
 nZvpm53buAfa6mfGJv8p1lFlujPGFqv7+oaUey5kMjslN3BVphRSkKQwwwZbsEujHtXCybt0aJ3
 vX/DgvkfmeW4fL/6XjstvvVF78o86IHjJbZAXVQP+ppLi+cN1beBYYhWlocctnP+DPt5wYXkpXZ
 KUzRNOKXW9w084x8Vlcx6cOWeJSRouih0eFrKbQVqCtsnF5HGRWI2M+1hDpJeSkVYJ3aqbYSOg4
 y7lnvw9cTrnCtR8/vRaS4dm/FuUjjWkaeNvWp/bdY+BW0iFwHSIP9wAafKAA6vTr1q2qdBYmVbY ckUame60TANbSQA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

From: Andre Przywara <andre.przywara@arm.com>

The AXP318W is a PMIC chip produced by X-Powers, it can be connected to
an I2C bus.

It has a large number of regulators: 9(!) DCDC buck converters, and 28
LDOs, also some ADCs, interrupts, and a power key.

Describe the regmap and the MFD bits, along with the registers exposed
via I2C only. This covers the regulators and interrupts for now.
Advertise the device using the new compatible string.

We use just "318" for the internal identifiers, for easier typing and
less churn, but use "318W" for anything externally visible. If something
else other than the "AXP318W" shows up, that's an easy change then.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   |  2 ++
 drivers/mfd/axp20x.c       | 81 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/axp20x.h | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index a76bec5604c4..64c212b76e5e 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -66,6 +66,7 @@ static const struct of_device_id axp20x_i2c_of_match[] = {
 	{ .compatible = "x-powers,axp221", .data = (void *)AXP221_ID },
 	{ .compatible = "x-powers,axp223", .data = (void *)AXP223_ID },
 	{ .compatible = "x-powers,axp313a", .data = (void *)AXP313A_ID },
+	{ .compatible = "x-powers,axp318w", .data = (void *)AXP318_ID },
 	{ .compatible = "x-powers,axp323", .data = (void *)AXP323_ID },
 	{ .compatible = "x-powers,axp717", .data = (void *)AXP717_ID },
 	{ .compatible = "x-powers,axp803", .data = (void *)AXP803_ID },
@@ -84,6 +85,7 @@ static const struct i2c_device_id axp20x_i2c_id[] = {
 	{ .name = "axp221",	.driver_data = AXP221_ID },
 	{ .name = "axp223",	.driver_data = AXP223_ID },
 	{ .name = "axp313a",	.driver_data = AXP313A_ID },
+	{ .name = "axp318w",	.driver_data = AXP318_ID },
 	{ .name = "axp323",	.driver_data = AXP323_ID },
 	{ .name = "axp717",	.driver_data = AXP717_ID },
 	{ .name = "axp803",	.driver_data = AXP803_ID },
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 84839d4aa1ca..ea00c0cdce58 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -42,6 +42,7 @@ static const char * const axp20x_model_names[] = {
 	[AXP223_ID] = "AXP223",
 	[AXP288_ID] = "AXP288",
 	[AXP313A_ID] = "AXP313a",
+	[AXP318_ID] = "AXP318W",
 	[AXP323_ID] = "AXP323",
 	[AXP717_ID] = "AXP717",
 	[AXP803_ID] = "AXP803",
@@ -218,6 +219,31 @@ static const struct regmap_access_table axp313a_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(axp313a_volatile_ranges),
 };
 
+static const struct regmap_range axp318_writeable_ranges[] = {
+	regmap_reg_range(AXP318_DCDC_OUTPUT_CONTROL1, AXP318_IRQ_STATE4),
+	regmap_reg_range(AXP318_SHUTDOWN_SRC_CTRL1, AXP318_TEMP_ADC_H_EN),
+	regmap_reg_range(AXP318_DIE_TEMP_ADC_H_EN, AXP318_DIE_TEMP_ADC_H_EN),
+	regmap_reg_range(AXP318_GPADC_H_EN, AXP318_GPADC_H_EN),
+	regmap_reg_range(AXP318_GPIO_CTRL, AXP318_WDOG_CTRL),
+};
+
+static const struct regmap_range axp318_volatile_ranges[] = {
+	regmap_reg_range(AXP318_IRQ_EN1, AXP318_IRQ_STATE4),
+	regmap_reg_range(AXP318_POWER_REASON, AXP318_SHUTDOWN_SOURCE),
+	regmap_reg_range(AXP318_TEMP_ADC_H_EN, AXP318_GPADC_L),
+	regmap_reg_range(AXP318_GPIO_INPUT, AXP318_GPIO_INPUT),
+};
+
+static const struct regmap_access_table axp318_writeable_table = {
+	.yes_ranges = axp318_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(axp318_writeable_ranges),
+};
+
+static const struct regmap_access_table axp318_volatile_table = {
+	.yes_ranges = axp318_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(axp318_volatile_ranges),
+};
+
 static const struct regmap_range axp717_writeable_ranges[] = {
 	regmap_reg_range(AXP717_PMU_FAULT, AXP717_MODULE_EN_CONTROL_1),
 	regmap_reg_range(AXP717_MIN_SYS_V_CONTROL, AXP717_BOOST_CONTROL),
@@ -447,6 +473,15 @@ static const struct regmap_config axp313a_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static const struct regmap_config axp318_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.wr_table = &axp318_writeable_table,
+	.volatile_table = &axp318_volatile_table,
+	.max_register = AXP318_WDOG_CTRL,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static const struct regmap_config axp323_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -663,6 +698,28 @@ static const struct regmap_irq axp313a_regmap_irqs[] = {
 	INIT_REGMAP_IRQ(AXP313A, DIE_TEMP_HIGH,		0, 0),
 };
 
+static const struct regmap_irq axp318_regmap_irqs[] = {
+	INIT_REGMAP_IRQ(AXP318, DCDC8_V_LOW,		0, 7),
+	INIT_REGMAP_IRQ(AXP318, DCDC7_V_LOW,		0, 6),
+	INIT_REGMAP_IRQ(AXP318, DCDC6_V_LOW,		0, 5),
+	INIT_REGMAP_IRQ(AXP318, DCDC5_V_LOW,		0, 4),
+	INIT_REGMAP_IRQ(AXP318, DCDC4_V_LOW,		0, 3),
+	INIT_REGMAP_IRQ(AXP318, DCDC3_V_LOW,		0, 2),
+	INIT_REGMAP_IRQ(AXP318, DCDC2_V_LOW,		0, 1),
+	INIT_REGMAP_IRQ(AXP318, DCDC1_V_LOW,		0, 0),
+	INIT_REGMAP_IRQ(AXP318, PEK_RIS_EDGE,		1, 6),
+	INIT_REGMAP_IRQ(AXP318, PEK_FAL_EDGE,		1, 5),
+	INIT_REGMAP_IRQ(AXP318, PEK_LONG,		1, 4),
+	INIT_REGMAP_IRQ(AXP318, PEK_SHORT,		1, 3),
+	INIT_REGMAP_IRQ(AXP318, DIE_TEMP_HIGH_LV2,	1, 2),
+	INIT_REGMAP_IRQ(AXP318, DIE_TEMP_HIGH_LV1,	1, 1),
+	INIT_REGMAP_IRQ(AXP318, DCDC9_V_LOW,		1, 0),
+	INIT_REGMAP_IRQ(AXP318, GPIO3_INPUT,		2, 6),
+	INIT_REGMAP_IRQ(AXP318, GPIO2_INPUT,		2, 5),
+	INIT_REGMAP_IRQ(AXP318, GPIO1_INPUT,		2, 4),
+	INIT_REGMAP_IRQ(AXP318, WDOG_EXPIRE,		3, 0),
+};
+
 static const struct regmap_irq axp717_regmap_irqs[] = {
 	INIT_REGMAP_IRQ(AXP717, SOC_DROP_LVL2,		0, 7),
 	INIT_REGMAP_IRQ(AXP717, SOC_DROP_LVL1,		0, 6),
@@ -884,6 +941,17 @@ static const struct regmap_irq_chip axp313a_regmap_irq_chip = {
 	.num_regs		= 1,
 };
 
+static const struct regmap_irq_chip axp318_regmap_irq_chip = {
+	.name			= "axp318w_irq_chip",
+	.status_base		= AXP318_IRQ_STATE1,
+	.ack_base		= AXP318_IRQ_STATE1,
+	.unmask_base		= AXP318_IRQ_EN1,
+	.init_ack_masked	= true,
+	.irqs			= axp318_regmap_irqs,
+	.num_irqs		= ARRAY_SIZE(axp318_regmap_irqs),
+	.num_regs		= 4,
+};
+
 static const struct regmap_irq_chip axp717_regmap_irq_chip = {
 	.name			= "axp717_irq_chip",
 	.status_base		= AXP717_IRQ0_STATE,
@@ -1061,6 +1129,10 @@ static const struct mfd_cell axp313a_cells[] = {
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
+static const struct mfd_cell axp318_cells[] = {
+	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
+};
+
 static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
@@ -1248,6 +1320,9 @@ static int axp20x_power_off(struct sys_off_data *data)
 	case AXP313A_ID:
 		shutdown_reg = AXP313A_SHUTDOWN_CTRL;
 		break;
+	case AXP318_ID:
+		shutdown_reg = AXP318_SHUTDOWN_CTRL;
+		break;
 	default:
 		shutdown_reg = AXP20X_OFF_CTRL;
 		break;
@@ -1312,6 +1387,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 		axp20x->regmap_cfg = &axp313a_regmap_config;
 		axp20x->regmap_irq_chip = &axp313a_regmap_irq_chip;
 		break;
+	case AXP318_ID:
+		axp20x->nr_cells = ARRAY_SIZE(axp318_cells);
+		axp20x->cells = axp318_cells;
+		axp20x->regmap_cfg = &axp318_regmap_config;
+		axp20x->regmap_irq_chip = &axp318_regmap_irq_chip;
+		break;
 	case AXP323_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
 		axp20x->cells = axp313a_cells;
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 1badb4868d17..0191467de4ec 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -19,6 +19,7 @@ enum axp20x_variants {
 	AXP223_ID,
 	AXP288_ID,
 	AXP313A_ID,
+	AXP318_ID,
 	AXP323_ID,
 	AXP717_ID,
 	AXP803_ID,
@@ -116,6 +117,71 @@ enum axp20x_variants {
 #define AXP313A_IRQ_STATE		0x21
 #define AXP323_DCDC_MODE_CTRL2		0x22
 
+#define AXP318_DCDC_OUTPUT_CONTROL1	0x10
+#define AXP318_DCDC_OUTPUT_CONTROL2	0x11
+#define AXP318_DCDC1_CONTROL		0x12
+#define AXP318_DCDC2_CONTROL		0x13
+#define AXP318_DCDC3_CONTROL		0x14
+#define AXP318_DCDC4_CONTROL		0x15
+#define AXP318_DCDC5_CONTROL		0x16
+#define AXP318_DCDC6_CONTROL		0x17
+#define AXP318_DCDC7_CONTROL		0x18
+#define AXP318_DCDC8_CONTROL		0x19
+#define AXP318_DCDC9_CONTROL		0x1a
+#define AXP318_LDO_OUTPUT_CONTROL1	0x20
+#define AXP318_LDO_OUTPUT_CONTROL2	0x21
+#define AXP318_LDO_OUTPUT_CONTROL3	0x22
+#define AXP318_LDO_OUTPUT_CONTROL4	0x23
+#define AXP318_ALDO1_CONTROL		0x24
+#define AXP318_ALDO2_CONTROL		0x25
+#define AXP318_ALDO3_CONTROL		0x26
+#define AXP318_ALDO4_CONTROL		0x27
+#define AXP318_ALDO5_CONTROL		0x28
+#define AXP318_ALDO6_CONTROL		0x29
+#define AXP318_BLDO1_CONTROL		0x2a
+#define AXP318_BLDO2_CONTROL		0x2b
+#define AXP318_BLDO3_CONTROL		0x2c
+#define AXP318_BLDO4_CONTROL		0x2d
+#define AXP318_BLDO5_CONTROL		0x2e
+#define AXP318_CLDO1_CONTROL		0x2f
+#define AXP318_CLDO2_CONTROL		0x30
+#define AXP318_CLDO3_CONTROL		0x31
+#define AXP318_CLDO4_CONTROL		0x32
+#define AXP318_CLDO5_CONTROL		0x33
+#define AXP318_DLDO1_CONTROL		0x34
+#define AXP318_DLDO2_CONTROL		0x35
+#define AXP318_DLDO3_CONTROL		0x36
+#define AXP318_DLDO4_CONTROL		0x37
+#define AXP318_DLDO5_CONTROL		0x38
+#define AXP318_DLDO6_CONTROL		0x39
+#define AXP318_ELDO1_CONTROL		0x3a
+#define AXP318_ELDO2_CONTROL		0x3b
+#define AXP318_ELDO3_CONTROL		0x3c
+#define AXP318_ELDO4_CONTROL		0x3d
+#define AXP318_ELDO5_CONTROL		0x3e
+#define AXP318_ELDO6_CONTROL		0x3f
+#define AXP318_IRQ_EN1			0x40
+#define AXP318_IRQ_EN2			0x41
+#define AXP318_IRQ_EN3			0x42
+#define AXP318_IRQ_EN4			0x43
+#define AXP318_IRQ_STATE1		0x48
+#define AXP318_IRQ_STATE2		0x49
+#define AXP318_IRQ_STATE3		0x4a
+#define AXP318_IRQ_STATE4		0x4b
+#define AXP318_POWER_REASON		0x50
+#define AXP318_SHUTDOWN_SOURCE		0x51
+#define AXP318_SHUTDOWN_SRC_CTRL1	0x52
+#define AXP318_SHUTDOWN_SRC_CTRL2	0x53
+#define AXP318_SHUTDOWN_CTRL		0x55
+#define AXP318_TEMP_ADC_H_EN		0x65
+#define AXP318_TEMP_ADC_L		0x66
+#define AXP318_DIE_TEMP_ADC_H_EN	0x67
+#define AXP318_GPADC_H_EN		0x69
+#define AXP318_GPADC_L			0x6a
+#define AXP318_GPIO_CTRL		0x70
+#define AXP318_GPIO_INPUT		0x71
+#define AXP318_WDOG_CTRL		0x77
+
 #define AXP717_ON_INDICATE		0x00
 #define AXP717_PMU_STATUS_2		0x01
 #define AXP717_BC_DETECT		0x05
@@ -819,6 +885,28 @@ enum axp313a_irqs {
 	AXP313A_IRQ_PEK_RIS_EDGE,
 };
 
+enum axp318_irqs {
+	AXP318_IRQ_DCDC1_V_LOW,
+	AXP318_IRQ_DCDC2_V_LOW,
+	AXP318_IRQ_DCDC3_V_LOW,
+	AXP318_IRQ_DCDC4_V_LOW,
+	AXP318_IRQ_DCDC5_V_LOW,
+	AXP318_IRQ_DCDC6_V_LOW,
+	AXP318_IRQ_DCDC7_V_LOW,
+	AXP318_IRQ_DCDC8_V_LOW,
+	AXP318_IRQ_DCDC9_V_LOW,
+	AXP318_IRQ_DIE_TEMP_HIGH_LV1,
+	AXP318_IRQ_DIE_TEMP_HIGH_LV2,
+	AXP318_IRQ_PEK_SHORT,
+	AXP318_IRQ_PEK_LONG,
+	AXP318_IRQ_PEK_FAL_EDGE,
+	AXP318_IRQ_PEK_RIS_EDGE,
+	AXP318_IRQ_GPIO1_INPUT = 20,
+	AXP318_IRQ_GPIO2_INPUT,
+	AXP318_IRQ_GPIO3_INPUT,
+	AXP318_IRQ_WDOG_EXPIRE = 24,
+};
+
 enum axp717_irqs {
 	AXP717_IRQ_VBUS_FAULT,
 	AXP717_IRQ_VBUS_OVER_V,

-- 
2.47.3

