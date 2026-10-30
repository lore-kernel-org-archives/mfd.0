Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341308;
	b=WWz9MJs4iFmgSuP8WqLBEKOpNnxNLQmL37ucVT/sT6+biG3yrkgOukqAub986LDfK/sa
	 xYkDNl6rEEKnQcQtGb6Klify348qrj1kudaNygZLHxeFoc6pnUMc8rMxXmr8wR0CXQykq
	 y0pQb8DPPYGn5UlLfmyXYjSQg2JXV5T1cqYFGW8A0XIGEd08tLW7x21nBM8rn8q8u9yVa
	 UN8ytXt4O/VQh1J6IFqGD5OK+r4q+T1d/gbq87y6sV57OUMjXea9/QjCl5TYvGK6PYpW2
	 yyu44+gMyKwZSHV8fJPfx74DqaZg5jNH9q3WqxNLK3cYt4dB015Hr8QANqshm6NLlmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=;
	b=UFeK+xop/W/1iAmuOTZqScagBXeMoRB3thU3QtFvML3RCucVRUPQN9OskdE/znBOj/wD
	 GRlZs9MEs6i2IuMg4QMplBrW7Oi45V6hrk/W37bzxYxFfM3h/uFB9VXwge31ybNndLYTg
	 aeIJXwZaDBeOhOzGd5Zr824sa+ejouu46AuiRTgfIJZ90u8JopaVACoAuPpay6r7AMN9W
	 rQ+AR30JCHtABynK3Blwj44NzyUjEnt5GaQslVYv5wkZzWTtZifN1A5p8YXyAfhZoSXvT
	 DvwkD877/82wa11ZPnsDoGaEL8pkxkH7rv10sjjzQtV0XoaxT3L1P0OMbygJrfopKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W2NoFq08;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDolV6kv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E71606A32D
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E71606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W2NoFq08;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDolV6kv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F0301738517
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=; b=W2NoFq08rtxUAvsN
	5I70HKm/x8rBFeUgUoO6R5JtceBmk3TfRYbXgXlL7SNHqrUPfWEyBA+ObvtTBXTI
	mqOYae3KVpPmxd7UpWts/qlpC4ptQIsiRf6AdOwKGXmewnu+cyOFWacu1alLPcTe
	VDLKbUopda99U3hoLHpY7kRMkHxXPhtwlgCdW9+MaKg9BjaKbY6cl/jscf4lX82z
	yvc4DfjTkhh0lqHVj5B6f2nT+C9FvOTGfp/8C+D/nDHzwfz0Q/tFEbRcYr0yiA3E
	M1wrBiy685yF1Z1IfTdrCkqmnicEmFlFzhV5pEKo7l9tRNoLTkycNWGQFYtskitJ
	Hp4cKw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhgum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05b68f851so1465628b3a.1
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 23:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341306; x=1793946106; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=;
        b=NDolV6kvyMgCbUxXLnqTdfVEeVNMd2PbOnbPDBX2d/vaZVfBGCFDXg45LWyaF44mHi
         hF+78L0h7ePazrleK9ZHGcQVuOK8QPh1nVUrHpW7Z+o/TMssQFw7KE1lIkGPlshD9Z6l
         mf6SwMEJEse2z0townupTFOCfUMTiSYHvVriOQbI/eQ99nNKz889GzyzmICIwXnGvj+I
         2We6ULhWME05thAnHoVa0MThmb74PrHoVR/Y/MlUhwBT8DjPK1n7Bwec/ZBL0q39gfpZ
         X6bIakn7re4yZODfBbAbsFGyLtjoSPEJCg219E7WLQJs3p/HubBDL6pOCP4r1Q38Q5qV
         jNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341306; x=1793946106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=;
        b=tgEVh7FTHbEFsy7Iw0bI6h/TcZMJrOc+yO75cG9661uWALZYtPek58eEHeY/Z58d0B
         HwycMkeJ9oAioeiTrRgLjXBAw9n6ftgctHvKzigYnL5t7Mak9pzjuvssWbs20jsa1pV5
         w6iJgGN8j/kdZye2vP72IqWzp+xqQx3x4mKdWc8sAKCPapU88D56+v0ZL3ch+4Ck4a3r
         ydIWYVqIkAb6gnbotc5wIhvpxUkzZATBT2uC899fE5TbwI0nlkCQL5K+06EoPETT4MHr
         L1Ow/TekOQ3Gp1zr5ckzSA60BTu2wbe9ZzGlHulSokhaIG2NL8ygZF97N3aIRO18iJWu
         7Wxw==
X-Forwarded-Encrypted: i=1; AKwUvBwdKlUpUBgSMR7iniuZtQlexYYBowQO4q5ggpETpAX3afTFz2z7YAwLgow1/hNyliUIjn0=@lists.linux.dev
X-Gm-Message-State: AFq9FYKw8RLB1KtppU3c1n9eblE/qPq2ICPDD23KAG8BxPts3AlERsr8
	Vtx4KfjQNgGw77y2xfiJxowQYI7IYzOBHHPRxecrS/+d7mO9oDAdytQigbVg06UKFiAX2vmCZZL
	CuRONWWGGLxK2uCR+Ev7NwdZW3iVR6TD8EFTIYRKXP2qFSnXv/XvYv3c=
X-Gm-Gg: AYBFou1U8grXUoRwR8dQAUMnz210rNuZa5jO6+U6tfTd4Dr2OX6pyaG6SqlqIX1Rh6W
	m2zdPukmIAaISbEeGYbs830YHK93Q9awZVt+3s8klTYatqrcm3yyg4/w5P9+3trVrXf/rLsrQth
	AhcDTnJP7oB+jrgaMwsJFzgLCmiTA+e8TH07EtCO4YVtkrV+HeHzJa0XLe24CRYufbvr4NIaaEX
	LfOD9CksvmHLan/Brif6hWSHl2r8UxTLBtEfYKEniLLiLd3zZyq5ew4Vt57qGn2mUPmN36W52W3
	RbGcZ7sZEEaaswNvzYYKJpKezbLW2BnKqvDSJ/801JBH8fcZZlqF5hILWaocCxi7F/xNshfhgEm
	2d8oNTybM3bVG+nChzewp5u9kssfxDYr+Sig2XFB1s49r8IJgHXHYQuBU/2bh5N8E1NA=
X-Received: by 2002:a05:6a00:3393:b0:8a0:6ff0:d29d with SMTP id d2e1a72fcca58-8a832a94a9fmr3120802b3a.36.1793341306263;
        Thu, 29 Oct 2026 23:21:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:3393:b0:8a0:6ff0:d29d with SMTP id d2e1a72fcca58-8a832a94a9fmr3120778b3a.36.1793341305803;
        Thu, 29 Oct 2026 23:21:45 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:45 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:55 +0530
Subject: [PATCH v3 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-pm8010_i2c_support-v3-7-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
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
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=4324;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=iOss1N4oaDpxnlCURLVb53pk4cSN1jSfF2112q90j4o=;
 b=4J8fIBakoKfjwuQ2kZOD5bffzCS2igeg2i4LUGF+Zk6GGL/8N26O+9Sz42Pvw/X4WRD2osDuE
 BQj4oNauGlUAIaNTGOxcMf2bbwxBrFnO5GUxOgwNYJyy49OOwh0JwB7
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX8hiP3p+GaojW
 3GgEP48AeGCGFn0ydhxvVyHtoWsIy3QM6RJHBK0tK1hPKpBE7qTInUKAcuM+H/iFHnkAV3FBasv
 kKl2wG9LfROJGowwMpg/r2BZDJtoV7ksUb9bWgG7KZYiT5P4Zh+hnca72gsqBD4Mgix4we5e+4t
 Kjcv4UnRKLYmFXHlc8iazYl7gldL9nV4rF7cjzgjAT2JdOIwFSZsC9DXD/KVxAP6KhYRRnVlovf
 qU64CwA0cHvwme+GKBTq0J3PfDziwTiHDFNocZv6Ye2EohudfCzX6PBV1AZPNOXWmxdsRcywOO0
 f8h1IMZdTP4hQWTOad/B9B8AK9Wuwgy83ReI0PFLes4Kkvu49or+VQmpBzhcB6PcKn7uOYs+aHG
 QwgnfTwy4jjJV18C6/1oXqqSnAuf5Bqrz9HzOTTvyfbHgPbX5sswc30sB/6KxTXF4EJQEAKNUJ8
 Pbaj+jG6CvMoz1cOwJQ==
X-Proofpoint-GUID: 51Nl2qf7tUkr3kBkOyP_x4ioM9FlscD9
X-Proofpoint-ORIG-GUID: 51Nl2qf7tUkr3kBkOyP_x4ioM9FlscD9
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4377b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lbcZtXRpr0qBkvjFNboA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX3bFydB5uhfWX
 fC32KXpLvGUgWMutZt5Le7I9KEfK4ZhqcqLr7xD5JmOPX+DzR5Rfxv3kS4AM6Et5Z838MShnMsr
 CHLX4HZQJ5MB0vhPxK96PlKz4RtP/PM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is often wired up with the interrupt pin tied to ground. Only
register the IRQ infrastructure if we have a parent irq.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 39fae8d48e46..9ebbecb90b0f 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8008_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8008-regulator"),
+};
+
+static const struct mfd_cell pm8010_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -215,20 +223,51 @@ static void devm_irq_domain_fwnode_release(void *data)
 	irq_domain_free_fwnode(fwnode);
 }
 
+static int pm8008_irq_config(struct device *dev, int irq, struct regmap *regmap,
+			     const struct regmap_irq_chip *irq_chip_desc,
+			     struct regmap_irq_chip_data **irq_data)
+{
+	struct fwnode_handle *fwnode;
+	char *name;
+	int ret;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+	if (!name)
+		return -ENOMEM;
+
+	name = strreplace(name, '/', ':');
+
+	fwnode = irq_domain_alloc_named_fwnode(name);
+	if (!fwnode)
+		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+	if (ret)
+		return ret;
+
+	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, irq,
+					      IRQF_SHARED, 0, irq_chip_desc,
+					      irq_data);
+	if (ret) {
+		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int pm8008_probe(struct i2c_client *client)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct regmap_irq_chip_data *irq_data = NULL;
 	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
 	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
-	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
 	unsigned long pmic_type;
 	const void *match_data;
 	int num_mfd_cells;
-	char *name;
 	int ret;
 
 	match_data = of_device_get_match_data(dev);
@@ -255,6 +294,19 @@ static int pm8008_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	if (!client->irq) {
+		switch (pmic_type) {
+		case TYPE_PM8008:
+			mfd_cells = pm8008_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8008_no_irq_cells);
+			break;
+		case TYPE_PM8010:
+			mfd_cells = pm8010_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8010_no_irq_cells);
+			break;
+		}
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -285,25 +337,11 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
-
-	name = strreplace(name, '/', ':');
-
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
-
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
-
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
+	if (client->irq) {
+		ret = pm8008_irq_config(dev, client->irq, regmap, irq_chip_desc,
+					&irq_data);
+		if (ret)
+			return ret;
 	}
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,

-- 
2.43.0

