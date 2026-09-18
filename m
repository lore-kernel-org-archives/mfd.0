Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5A351AEE7
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749831; cv=none; b=AqQkD2foZ309c/L/F6jTQSCzqcmm8OE34i8Rg+lF346J+JoOxdE6sFQnTEGyDvakec/dgsFwSpxAkIKUJ58+4GZ/0qnPZBzLSSrDPsrqZiFymRDb3iMQhSZraX7pbh6Lofhwd3BvrlouV5y/Xznq0hXXg45U7pVREivfMof+xYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749831; c=relaxed/simple;
	bh=aXo4nLRnRLoLMYw3W6P3fJvPdkMKxar86Dnx8ey7+7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2/0O6tm9wyrAw2RiAxH0el+DBjiJTgJM7XsGbSMhMMQZHLZRcwzbBWLm3mWLjXz3hHa9tWyLtS2q4ML8T2z5ZO8ffo9x5qhHM1w4/WEpHosHdEkCKHHre3PXJbwgRcKCg1BfaEGwh5PjY4CXyqmYeJiOpyQMIPjn5Ur+oxEgWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+N952zu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U0iXf1x+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+N952zu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0iXf1x+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOTCk3645835
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIHahjiiBk8/yOltYOeToaHzSBC1txOpGGiKL4wwOL0=; b=m+N952zuNg/6wQzQ
	Wo6FA5nRGUAnXwhAUwWz9D3QhIr/g7pjNeH9G26mFTZZUM/1KqWoEDjPCmEYX2Cs
	4LgTGvTSxs/xFQmWmo4IALzKxF3EIC4iBvsrKUYlG57UY34216mZNjYlidaK02A5
	2Y7e8hSxC3B7CAfxz3AYOfBpL1gYJLABhSEiRZXgn41mWE6K93HvVS5zOcKkO7Ox
	7z0evpDzwI18FzaA/KkG0eVrx67ViIbz7gW3+U80I3BvYUXI+Ryc2wcomfdXywih
	KUUgylGLmymcad3AsHdTD++PBeCbt9jeN4oErWuYqLaoS9jo+QmcH4TN8TWhv5AE
	fVPeqg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dhk5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d94f086fedso13727525ad.1
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749828; x=1790354628; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIHahjiiBk8/yOltYOeToaHzSBC1txOpGGiKL4wwOL0=;
        b=U0iXf1x+6mlUfEcFsyPdwX9HPzg+2fZ5fbABjI01Ar91DVwHiErhoZFKcQL0e7EcYJ
         fNig+BvuWWfHiJz48FFa+D0OYcvGta1xTgK5aS6x9/mKdo+eeNJ3rDzi6EFNF8gExX8L
         H39Ud2UA5Wtdpex1uAAmNZ3OpjwPexKzzGJQElaHxBboerBtfnbVjvkkzvNdoOQ7BCEz
         Wo4QzSFyfHbD08poIkSPKu5saLi1Fadz7ir7LfBnfoUbRnXIfBxhOgMQfMYwMc1yjZV3
         QtC/2r5nK3S94HqaczsVDayONKWCW39hwDQfA5Ib44SQgH0AAzD0ipa+0bCzDFsc2kVE
         2FNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749828; x=1790354628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIHahjiiBk8/yOltYOeToaHzSBC1txOpGGiKL4wwOL0=;
        b=JsIbnRLQizDUc1ptjRFMIOHI3ZhkDVdNu8u+W4+84JiYA7Xppd8hA6gPbYNnHr+Gsc
         9AlIOaTRkH/ZunWH82kekXZrrPQD03K0iQ0X2iTOhxI2C8PDVgc0/ExwT82T+QjZA31M
         a1LQQbv8swkmfYaNolI7nOF1eg3oBQu1nrTvczGYzhfgUYHdTXbHJ/zBQUVGGUqJU7z7
         GLMmAdMUipO1oaeR/kX3FhL7MIO3umZj7KmGcc8B+/o71PtLY78LCHQCxkBtfzNxnJ+W
         l7HCH9JJbsEgvJYpKIVJ8Her9tF4f5FZ/LC+lV9QJDT1ldcU4vYPC7/uieSY4maZChVT
         3koQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkJcJk8k9uXQmnyEI7BnAIU9+k0Jf9ASzHyyxYnVcyQtTQtAi8/o1Vz7y3lktcTfzSgDo=@lists.linux.dev
X-Gm-Message-State: AFuF++mwYgW/eG6HpptKaOMGKr0tBEzl1uiD9svzpArzIZzoY/B8zUnc
	F184yZQx4Up74VlCJRtBVn/AUA/K22DxKNWmOnCkHE595fGF+BUJlLTsG80cdV2YY2MIwhm0np4
	62jpL22qV7rtkHfXXfRs2OLN2owkbTFF0WiHZJ8ig+UGW08LMDw9eJLQ=
X-Gm-Gg: AYBFou2NHS+G4KwS9m+vgbf9HVjFrNTx6v1yKWFicLVpW7097s0F/xpq05aHOEV+0Lg
	s85X3bdxTiP8ahDoUIWQsVekpXdzd4M3q+xIbYX+bENsOK5wBtwGvqXa3uHIecxHu/jN1ECTaiY
	BmzYdb8seFye1eU/786THJVE1kKYhmPfYNyBXt5wOGNNEXLOXYA/TfVdjiGREp5cOa9oe0YOR09
	nvvd9lQJRdP6tpdsCJc8k9STM98xfyVkbc/OD3o9PtYoItPa0xKuesYhErtVInCtB2NRHE8+MoS
	AR2j9O3j9cWmR8CMgH8LM3jtHnZ2i+ehY11UjXyyUQza2jPOpWcXAOr4Pht0R59G4o8W8rYVVJ7
	PduaVwly4MrqhQueXtg==
X-Received: by 2002:a17:902:e742:b0:2dd:8639:9931 with SMTP id d9443c01a7336-2ddb1b7a307mr65612725ad.19.1789749827905;
        Fri, 18 Sep 2026 09:43:47 -0700 (PDT)
X-Received: by 2002:a17:902:e742:b0:2dd:8639:9931 with SMTP id d9443c01a7336-2ddb1b7a307mr65612225ad.19.1789749827356;
        Fri, 18 Sep 2026 09:43:47 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:46 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:12:48 +0530
Subject: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=5533;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=0A09G5s8R/qSBgqw1PNTnaJsuW7lGHc5uarbZzTndks=;
 b=rYTNN1AzlPQQHHdnD+JD8oRhZG+MyFMrBj2hCm5Xh6ygbaNGXklG/5iLBEhJaaREvsLdr93B1
 01uHFxvLXKtBwLXi6W6C39bFP3Lsal8qpuHJqJgWpbgmprCbmiI0FWR
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX1ZT7e/AY65Ir
 I627xhLJQA3yg1HcKOYso8O8avd4WuRhKcrzdhUKt59tNbw+CIlQHvQ/Fu657/AGnhqJqb0lnps
 yNs078iHdG0RubBqs95jOAq51gFKIIA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX8wlcXrnpsgUZ
 WZvCDRFSFj6tae41LEgXXmGRQ819UOmZ9n1o1oU8tAdZV0tf/p6vE7DhLEHUJUJhXVbk8Z1LlLd
 oL4qIIjZ36LmvO5fDOsA+G3TiOfhLLZKHdpu4a5RWQ1mMXZH3ZnWbaaCMUiFiohDLpT6/Lh6UoC
 tTgj2aF0lq2REmTl6gEbI7Ioi/wXWnYnZ+XoGPCvtjTzKCOdU/699exf3YHh8LuHebP8rZDtoss
 utsS7DJbnJm5elTfI1DzvY0Nf7KG8z840kXQxHNQuSFJy9k7M0didRqMa7mHgp5tmmUNgZ6wXqU
 DTiQhjTwRgBjnDFL1adVE3krs0ObzWZYz9Zr1TGKedE4JUcIbesCMBsZt95nLBfRHmzB5OOUBQh
 RECbATXz9zN7xPUK1FGATLQ6KxVTeig+bGAOb+Uke9ktP8oDVVK5sQNNKcb0R2zhsI3tyEeXtjw
 dzBfTjZcp24ruUTqGQg==
X-Proofpoint-GUID: vRyxXKO8c4zri9M7mGzs7yYQbTCxgpo3
X-Proofpoint-ORIG-GUID: vRyxXKO8c4zri9M7mGzs7yYQbTCxgpo3
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad6a44 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LamtlsxKl8ZIB2y8LWQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180238

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008. The device is
generally designed to serve the exact same function - power camera
sensors and the associated supporting hardware.

PM8010 supports both I2C and SPMI communications. The latter case is
already handled, since it reuses the same peripherals as other PMICs.
The I2C front-end is more less the same to the one of PM8008.

Plumb in the necessary changes to support it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 67 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..ed656f0d6df2 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -34,6 +34,7 @@ enum {
 	PM8008_GPIO1,
 	PM8008_GPIO2,
 	PM8008_NUM_PERIPHS,
+	PM8010_NUM_PERIPHS = 2,
 };
 
 #define PM8008_PERIPH_0_BASE	0x900
@@ -55,6 +56,10 @@ enum {
 #define PM8008_IRQ_GPIO1	6
 #define PM8008_IRQ_GPIO2	7
 
+#define PM8010_IRQ_MISC_MBG_FAULT	0
+/* 1-3 are unused */
+#define PM8010_IRQ_MISC_LDO_OCP		4
+
 enum {
 	SET_TYPE_INDEX,
 	POLARITY_HI_INDEX,
@@ -88,6 +93,12 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
+static const struct regmap_irq pm8010_irqs[] = {
+	_IRQ(PM8010_IRQ_MISC_MBG_FAULT, PM8008_MISC, BIT(0), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8010_IRQ_MISC_LDO_OCP, PM8008_MISC, BIT(4), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_TEMP_ALARM, PM8008_TEMP_ALARM, BIT(0), IRQ_TYPE_SENSE_MASK),
+};
+
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
@@ -158,6 +169,25 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 	.get_irq_reg		= pm8008_get_irq_reg,
 };
 
+static const struct regmap_irq_chip pm8010_irq_chip = {
+	.name			= "pm8010",
+	.main_status		= I2C_INTR_STATUS_BASE,
+	.num_main_regs		= 1,
+	.irqs			= pm8010_irqs,
+	.num_irqs		= ARRAY_SIZE(pm8010_irqs),
+	.num_regs		= PM8010_NUM_PERIPHS,
+	.status_base		= INT_LATCHED_STS_OFFSET,
+	.mask_base		= INT_EN_CLR_OFFSET,
+	.unmask_base		= INT_EN_SET_OFFSET,
+	.mask_unmask_non_inverted = true,
+	.ack_base		= INT_LATCHED_CLR_OFFSET,
+	.config_base		= pm8008_config_regs,
+	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
+	.num_config_regs	= PM8010_NUM_PERIPHS,
+	.set_type_config	= pm8008_set_type_config,
+	.get_irq_reg		= pm8008_get_irq_reg,
+};
+
 static const struct regmap_config qcom_mfd_regmap_cfg = {
 	.name		= "primary",
 	.reg_bits	= 16,
@@ -183,6 +213,17 @@ static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-gpio"),
 };
 
+static const struct mfd_cell pm8010_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
+};
+
+struct pm8008_match_data {
+	const struct regmap_irq_chip *irq_chip_desc;
+	const struct mfd_cell *mfd_cells;
+	int num_mfd_cells;
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -193,6 +234,7 @@ static void devm_irq_domain_fwnode_release(void *data)
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	const struct pm8008_match_data *data;
 	struct device *dev = &client->dev;
 	struct regmap *regmap, *regmap2;
 	struct fwnode_handle *fwnode;
@@ -201,6 +243,10 @@ static int pm8008_probe(struct i2c_client *client)
 	char *name;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -246,7 +292,7 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 
 	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
+				IRQF_SHARED, 0, data->irq_chip_desc, &irq_data);
 	if (ret) {
 		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
 		return ret;
@@ -255,13 +301,26 @@ static int pm8008_probe(struct i2c_client *client)
 	/* Needed by GPIO driver. */
 	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
-				ARRAY_SIZE(pm8008_cells), NULL, 0,
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, data->mfd_cells,
+				data->num_mfd_cells, NULL, 0,
 				regmap_irq_get_domain(irq_data));
 }
 
+static const struct pm8008_match_data pm8008_data = {
+	.irq_chip_desc = &pm8008_irq_chip,
+	.mfd_cells = pm8008_cells,
+	.num_mfd_cells = ARRAY_SIZE(pm8008_cells),
+};
+
+static const struct pm8008_match_data pm8010_data = {
+	.irq_chip_desc = &pm8010_irq_chip,
+	.mfd_cells = pm8010_cells,
+	.num_mfd_cells = ARRAY_SIZE(pm8010_cells),
+};
+
 static const struct of_device_id pm8008_match[] = {
-	{ .compatible = "qcom,pm8008", },
+	{ .compatible = "qcom,pm8008", .data = &pm8008_data },
+	{ .compatible = "qcom,pm8010-i2c", .data = &pm8010_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8008_match);

-- 
2.43.0

