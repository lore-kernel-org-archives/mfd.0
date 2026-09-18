Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E5551AED5
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749821; cv=none; b=OoRJC93isZxDO9Y4INoWtucht+qiYIClzjBL7+cZQJD87l//ZNZzcApxTQmEgEE+iJdFFbBt9uccp3oZDZOTBrOIK80TOIf+niU0kDRT76YQdPfqQRmmCoE6G+0eCJ4Wb3ScaAJrCv7VPpo6p1pV2xUZvLyk7evv+lOtV7JASb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749821; c=relaxed/simple;
	bh=r6nh29wAJjYRiIKQlxHgzstJ3bAGP6KKtdHK4vRjd9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LBlGonqIuez0ctWV8oUFQFNXIs5khjEyUGPaOSBeXWtpvQSOGkYntFsyOoCIBT1+n4Ex/d5UEN3/s2IwKqgGGsXJlIumO178CZud717ND1n4lZWS3sXktQcasSmnWtCs8+aC0ncCwxOkQDuoUbsFeyD1faqDnc7jdVyjknAwqdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0uu2389; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Js9xpYd2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0uu2389";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Js9xpYd2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDORRg3645814
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RQ79TN/uH+2fVWlY3xaojEDQlE7cV4PHqrghx52HYqE=; b=D0uu2389zLS8kNDC
	5jswC41EwO7vCB5LzzTXF3jkPJe3aALVAUtJ50MH16/3YtVtrray5n3J74JfZv0t
	nAFn+IeVad/V50iIijU2bH2gLGXC8LcvaHI3sDXHeaDJmPmO94WGkXvjRzEfYxVw
	7RIENvGrLvZlxX5wBocPbNTgt53pjvbpIe1yCi5L0E0TN3/7FLJkkvnaUGdWhiXl
	qYmwiuiPSPdZn6q4LBpY6+AgBqhnLTDuYA+Sgf/vPP/7qud2l5RZ/kA+7DF2PjLo
	RSe60Y6g5TS68QhaeMSGHf0MOZKRBY6VGF5VjjAr5tWumse0Ks/Gs42rkJ/9/THZ
	B4qOBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dhk4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:43:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db87f759c5so19319545ad.1
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749817; x=1790354617; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ79TN/uH+2fVWlY3xaojEDQlE7cV4PHqrghx52HYqE=;
        b=Js9xpYd2RPcmmpOktZ0u/tPeP7yVhFKTho/mtp9qLp3VcJ8W3I9MLKAp6WEbFRe+33
         B3za/AuxNVY/8SZz4kXLI0Lv8b7JVSCy9ncuv7pvJFJswPoDFnxVDBZFRKnsp+Qd82/1
         cHDrVHB3qwyn5tIuTdhjKEySvS2raNiVfwwlPkfHwtWpjlCV6TFpOQ4a9HXq5OaftXeh
         x4m7t+ZJlE2PYI9d+3UoWhl4etQvP0OUhPCPUuvsTYvHHj71zEMGTpJ0saFSqhaDWpgT
         X/zg+LzDvOxXe6T5G0PXvPxK5WnapdzeXfhbN2JKOdsxqzMLLZrJ2FO52tFlxgr2KeyT
         j5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749817; x=1790354617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQ79TN/uH+2fVWlY3xaojEDQlE7cV4PHqrghx52HYqE=;
        b=SUClBqJDcxMLoyFpxkoTgDAdB5JORH6X0vUgOkGajANqhkZYTfJqI6L8e+SjZwOdth
         CXrDZKWswjYrjx1BOczlXvrPr4CoAih8TW/eZKs8bezRwGhVc6X6MfXd4RpNmexfQckQ
         X2l6SezszIweCe6DMQAzG7/PXGKj2ecADOrDiDXomaYQUQh3EMR3HBNvaCSbr3PZ0jAe
         w+gpv738U/pPcrRMnTqNDvvE84NZMLjJXaNnttKu3mIQ7E05bDvx73a01SbYbQtkWIjL
         IBaw/UCz/FVd+HZ7KASgerHxDkjnyAk9h9VsrbHzx3gdn7CfrEiEFwCsSEJGmUO5t/D/
         WOMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhtCPBCHVEguTv2+l01Mr7qZRVxpe+/I4mho0m+ZVSR4EHEZxhOrhoJylFETvVFVUo5GE=@lists.linux.dev
X-Gm-Message-State: AFuF++kQ5YoAI1l8R+q+sfMPdHb+W9fqTRfkJJSPN1tPj5AFK9WSAKMC
	owdJnC7USz2e6ADRzywv9B2qXp/OSOHFX80jejZDU0LE0fHNiFmD272ZQ3V5m8CELOPP+HluEUN
	ysczJom4AblpJ/FdzZY1rWQdcZzVUjcA6YVRGwF5Ec9EI4JFXnWOC8B4=
X-Gm-Gg: AYBFou2+CCj9R00UfUdAw2kdDMYYmdl1pTr/1uzOSim4JO1II7muMaYkp0qBdOntl9O
	5SQ1qwIfpY8lXz/9yVwCaVQRtWxxIMD//SbdiHgczuWvcxSqNXAxVSeWXanVsgyeNUWIkGKMwDA
	lX1dVI6AJsTH0BsshYiu/pgiuSwA53xMJ5St1SmX3I7Y6kRKbHfOGCycunkt4t1Hj5hpFAAdZZE
	/qbnCblgqiREeYojh/vg9V9/5GUtrdfOa2xvkoiA1CvOH3gGRJyNQV2NONJabjFRyyuhB5vP//b
	KwGg/4Ooak+KNDEtjRqdfcmNig3EkqE2ZNEQeyEzECocuh29oHSrK45/v9kO55NiOnzahq2AnAg
	C2jISIwsLLCuPcmDVqw==
X-Received: by 2002:a17:902:7296:b0:2dd:c100:b2c5 with SMTP id d9443c01a7336-2ddc100b325mr1991755ad.48.1789749817322;
        Fri, 18 Sep 2026 09:43:37 -0700 (PDT)
X-Received: by 2002:a17:902:7296:b0:2dd:c100:b2c5 with SMTP id d9443c01a7336-2ddc100b325mr1991285ad.48.1789749816706;
        Fri, 18 Sep 2026 09:43:36 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:35 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:12:46 +0530
Subject: [PATCH 2/6] regulator: pm8008: Add PM8010 support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-pm8010_i2c_support-v1-2-de33d78fad9d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=7817;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=9RwsW1Pk6eeMfH8zWmwNuWxanj2MRgu2Kiq84v5Od2U=;
 b=xnvb9bwS2ml7URYhsuLgjyAQ4Gfy6td9BGoXKoTBpgfWTWsxsa4kT1iPyZCm9lv/Z1vtz3dfr
 dhs2wOmK61aBI3Q2P5VybgCS4fz/1tSpNbsrpV8SxnPJfAL4FMUpoF7
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfXwizi97NeWkWh
 rqI4MYtwV/T5pZx47cD3ZsaeYlWn7uZwJCOIstbgjUalLof4OtM0IDxG8u5jqVPDxl6Tx/HihN7
 K0ujhOYNt03SHZLNmXRfC5aeAGSRmvQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX69KNDI+NdDFT
 ySW+HgVGCwCU6/0SIH+2sbtEZvjM9RGhvqcJWRNbYoOfdu+lX3iU9O0j7ZfoN/tUuEdDmXKn00v
 TcVLXFiMQvou5gujdzHffhUwEw/9nLEmeCTYOfNsO0ZvRGoqT4sV9zNkvULoYqnDEpwy++bb7oG
 6Bv+gWS8kIYHu0z+tWsiPugbFvsYSHF3VGE4O2AF6x65zzA/3FEuhwRotokGKDWRJxjM+pVYUgm
 pSh/uSDmkkzTDOgyTYrgCzqICSa6VGtX7n6vdUiuDmHym1ggrecMUKsTFFOKQi1LPC2pO2R7PWj
 2T2tJwlW+YxrzfOtOt4qGvAw1xrkubwWaI3SEah4ds7oDxswsXgK673tvZiaEUsD4bH1kWK51Hg
 dr+utfI4wP8d+AyOoKZjhzmOyfyXVPHVBvyaZvfVfzXvFbzXivy4gQNymWdEAqI8Yiy33RkbPJH
 bQOfBvJ9fX7eJnOdypQ==
X-Proofpoint-GUID: g0ZGKMyhx_7L4v20lr4qownn_H2aIkVi
X-Proofpoint-ORIG-GUID: g0ZGKMyhx_7L4v20lr4qownn_H2aIkVi
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad6a3a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CF1g25cjMhU89PGl3DsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180238

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008.

Like PM8008, PM8010 also has 7 LDOs under it which are used to power
camera sensors. The PM8010 LDO are of different types from the PM8008
ones and have different voltage dropout values. PM8010 LDOs do not have
a voltage step rate configuration register.

Add the necessary changes to support PM8010 LDOs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 109 +++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index 9c9b8be2e15a..b484c0f73eea 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -39,24 +39,59 @@ struct pm8008_regulator_data {
 	unsigned int			base;
 	int				min_dropout_uV;
 	const struct linear_range	*voltage_range;
+	int				n_linear_ranges;
 };
 
-static const struct linear_range nldo_ranges[] = {
+struct pm8008_match_data {
+	const bool has_stepper_ctl_reg;
+	const struct pm8008_regulator_data *regulator_data;
+	const int num_regulators;
+};
+
+static const struct linear_range pm8008_nldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(528000, 0, 122, 8000),
 };
 
-static const struct linear_range pldo_ranges[] = {
+static const struct linear_range pm8008_pldo_ranges[] = {
 	REGULATOR_LINEAR_RANGE(1504000, 0, 237, 8000),
 };
 
+static const struct linear_range pm8010_nldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(528000, 0, 127, 8000),
+};
+
+static const struct linear_range pm8010_pldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+};
+
+static const struct linear_range pm8010_pldo_lv_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
+	REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
+	REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
+	REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
+};
+
+#define PM8008_REGULATOR(_name, _supply, _base, _dropout, _range)	\
+	{ _name, _supply, _base, _dropout, _range, ARRAY_SIZE(_range) }
+
 static const struct pm8008_regulator_data pm8008_reg_data[] = {
-	{ "ldo1", "vdd-l1-l2", 0x4000, 225000, nldo_ranges, },
-	{ "ldo2", "vdd-l1-l2", 0x4100, 225000, nldo_ranges, },
-	{ "ldo3", "vdd-l3-l4", 0x4200, 300000, pldo_ranges, },
-	{ "ldo4", "vdd-l3-l4", 0x4300, 300000, pldo_ranges, },
-	{ "ldo5", "vdd-l5",    0x4400, 200000, pldo_ranges, },
-	{ "ldo6", "vdd-l6",    0x4500, 200000, pldo_ranges, },
-	{ "ldo7", "vdd-l7",    0x4600, 200000, pldo_ranges, },
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 225000, pm8008_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 300000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 200000, pm8008_pldo_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_ranges),
+};
+
+static const struct pm8008_regulator_data pm8010_reg_data[] = {
+	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_ranges),
+	PM8008_REGULATOR("ldo3", "vdd-l3-l4", 0x4200, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo4", "vdd-l3-l4", 0x4300, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo5", "vdd-l5",    0x4400, 296000, pm8010_pldo_ranges),
+	PM8008_REGULATOR("ldo6", "vdd-l6",    0x4500, 80000, pm8010_pldo_lv_ranges),
+	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 296000, pm8010_pldo_ranges),
 };
 
 static int pm8008_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
@@ -100,7 +135,7 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 }
 
 static const struct regulator_ops pm8008_regulator_ops = {
-	.list_voltage		= regulator_list_voltage_linear,
+	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
 	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
 	.enable			= regulator_enable_regmap,
@@ -110,8 +145,10 @@ static const struct regulator_ops pm8008_regulator_ops = {
 
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
+	const struct pm8008_match_data *match_data;
 	const struct pm8008_regulator_data *data;
 	struct regulator_config config = {};
+	const struct platform_device_id *id;
 	struct device *dev = &pdev->dev;
 	struct pm8008_regulator *preg;
 	struct regulator_desc *desc;
@@ -120,12 +157,20 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	unsigned int val;
 	int ret, i;
 
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(dev, -ENODEV, "Missing platform device id\n");
+
+	match_data = (const struct pm8008_match_data *)id->driver_data;
+	if (!match_data)
+		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
+
 	regmap = dev_get_regmap(dev->parent, "secondary");
 	if (!regmap)
 		return -EINVAL;
 
-	for (i = 0; i < ARRAY_SIZE(pm8008_reg_data); i++) {
-		data = &pm8008_reg_data[i];
+	for (i = 0; i < match_data->num_regulators; i++) {
+		data = &match_data->regulator_data[i];
 
 		preg = devm_kzalloc(dev, sizeof(*preg), GFP_KERNEL);
 		if (!preg)
@@ -145,18 +190,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->owner = THIS_MODULE;
 
 		desc->linear_ranges = data->voltage_range;
-		desc->n_linear_ranges = 1;
-		desc->uV_step = desc->linear_ranges[0].step;
-		desc->min_uV = desc->linear_ranges[0].min;
-		desc->n_voltages = linear_range_values_in_range(&desc->linear_ranges[0]);
-
-		ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
-		if (ret < 0) {
-			dev_err(dev, "failed to read step rate: %d\n", ret);
-			return ret;
+		desc->n_linear_ranges = data->n_linear_ranges;
+		desc->n_voltages = linear_range_values_in_range_array(desc->linear_ranges,
+								      desc->n_linear_ranges);
+
+		if (match_data->has_stepper_ctl_reg) {
+			ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
+			if (ret < 0) {
+				dev_err(dev, "failed to read step rate: %d\n", ret);
+				return ret;
+			}
+			val &= STEP_RATE_MASK;
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
+		} else {
+			desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE;
 		}
-		val &= STEP_RATE_MASK;
-		desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
 
 		desc->min_dropout_uV = data->min_dropout_uV;
 
@@ -179,8 +227,21 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct pm8008_match_data pm8008_data = {
+	.has_stepper_ctl_reg = true,
+	.regulator_data = pm8008_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8008_reg_data),
+};
+
+static const struct pm8008_match_data pm8010_data = {
+	.has_stepper_ctl_reg = false,
+	.regulator_data = pm8010_reg_data,
+	.num_regulators = ARRAY_SIZE(pm8010_reg_data),
+};
+
 static const struct platform_device_id pm8008_regulator_id_table[] = {
-	{ .name = "pm8008-regulator" },
+	{ .name = "pm8008-regulator", .driver_data = (kernel_ulong_t)&pm8008_data },
+	{ .name = "pm8010-regulator", .driver_data = (kernel_ulong_t)&pm8010_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm8008_regulator_id_table);

-- 
2.43.0

