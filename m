Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6CF47A896
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974015; cv=none; b=qB04RTg5X4w/ecWqCl/qKrVUOpOMew8xOGhMSpzDuZjM+hgRayOf6s0MnFDklS/E4N5hxRmfXyZOlnMeK1gNqgJYRQK4rREPJvani9kqv4JrQM/vg2bKLgPrF+VhBWt7JY6RiTHX67ZY0aG2AUzU2pCLGZiwBXOJKYl3WWXFOjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974015; c=relaxed/simple;
	bh=U/H8rooG0aANY17cGDSuKEZnrkgTspSZCjUK/K7PaQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JcIJqDGRaUA3K6GLAMOmNybORNcXit7FzxbX0LN6LSH/lu58Zh4Ov6GqygGSKAc48Jl3dV6RD0TeK/RKn1JFZLKmfkNHYmzPiU7nTQQvPLzeRy3998I3vJtj69LapU8osq6ao8Vp9dRzP0jG/5M7tBRw0+2Dszz9adP4fXC6a4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiS503+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hC5Bw7gv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiS503+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hC5Bw7gv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8HYVV3017842
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5eYgoQqncUBjHrzgn+QSiE9BnE3XSc+swowkAiV5zE=; b=CiS503+8nJ/svC39
	BXtGytw1r8z4xsR/3tQg3PAvPaKN7ZZ/CrZopQCDeeLUcLgv7F7GHp7zOzqyZ3PA
	uUZlP5pAYnNrrJNqBsdB80xBNAysXjH3lKUPdwPe8uYt5nsynX2OE3xw33Ru4ck5
	XgLLpGAB0c6e2bpDUgwQMhNeU7M0cP3GArWdv4YDqkIO2t3HaLaXP3H9kNR5Gkjg
	+T3gFUIp/Ql620xIh4BmoMpzATvh5OuUN4zdmOjao0rTyH9kCJHHUd9XjRzGKgm9
	gbkH7QmfHmz+EpLzhihYvkyq3H3HaJ0lTvxafkYy1fBtRPvIC/pvELiC7IRwr1kI
	H3f5Cw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b3uf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1a439db36so662977a12.2
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 03:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974012; x=1792578812; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5eYgoQqncUBjHrzgn+QSiE9BnE3XSc+swowkAiV5zE=;
        b=hC5Bw7gv31VeT1F/01+GZDbR+YmrV7yn2t7W5lWkhp9t7dcOpGodlZg6LdN/YjZpLc
         nMgjXWByhWLfsNRYYb9ge6mhrZXV6kwF6cKbvZNm5ZDlbYEbvZJUiJXoMOC51s9l0UdQ
         prW84QhEz3oRx102gNUG5SOAExoZJAy4esE1JVvdsgW7JEW4lJSSWmN8mxhbKPO3E613
         omygjqFkzMGUxiT62xc1CNahFGlo4q++h07qczoYYRX0AGEAWghaOkl6xUB8rJX3A6LL
         SNacoCsFQ3p5Rc4D9qbHk6POmdNcCLF/7ofX8+/Yxe+xqcS8nybjDtIhZDj/qBl/ZGgY
         9Qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974012; x=1792578812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5eYgoQqncUBjHrzgn+QSiE9BnE3XSc+swowkAiV5zE=;
        b=dDjdbA7Ds1DbbIefJ3vkVtNC7qzJXTJyWqZFE9GZWLqs7W/3WKjdMopl2bpSKQcVKU
         J94nF27GYLbi8IsjSh7VdbJVHMtmM5dXBv3yNyL4PZhBRi2i5cIuL18uCCqzh/MBUhB9
         64gkkFhhaNdp4QciYLVJBbkBwnP+yRBXs8U+rooFnLsUMpul7rgx0ToBQUzVKq0I/owz
         ET6S56YpeepiqWNf6j2idOKYN3OkXqirSV5RGIpZNbIMgaSUyOzozBKgWA08/8MAuJ+O
         baiS1Z5beL7e4vIIS55Axw+Zez1SAPbiE0xxZJJEiEAEY3G6Hsr+5aiNKJfXUvsNgKHN
         RnIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ5J065zptzN69cZTK7rpiA5UQWjrWurfv3+2pcoP24yUCckmqMl0aN4uGMG6MLcJ+mqw=@lists.linux.dev
X-Gm-Message-State: AFq9FYIHuueIKe0xR5Qe1GMxhRifYlQR+6q/YqBElkNT8iZOm+WW+5pn
	NyqFYL/sDTsJ5Yle4FkLffd+JGhuRl1QrU+xrxxdiG5RBdKMFwWvIbyTdaR8xP5jX4qPEtQCPgg
	aHaU6nfzFIwbbtsrhNkQSbu/l2iwYpm07RnNwJFkslMHNNXiedkBFloo=
X-Gm-Gg: AYBFou2Q99voaygbvI5epFAv7z0RjFYfKAQf3L1m57VjAjbsTVnmZ0xm/MrHK2sHmqs
	7RkJpNthrTFF4e+xM7VmIahxVWQRO8FnQY8/9zosArfIK5egcUNUy1MP3FUrvB2eorOxmVVqTla
	CuQp4bnsDD32XHbSFGYz4LXds6o+XKJFG+e6Pby7WiVe69zHUTN6wgt6rNJNeDckRmmY3C1Sc/P
	lNXv5aUfouypKDJWJRlJtt4pQpLFcpTM4SikbLsiNpY3Z/R0KNgABD82OzYuZZ6PWKeVy8maf8j
	DR8KtYxewmKBaC1T9Srhie061xai5IGi1KiKR9qOFaj3/15sbp4G4qDgl4CZA4EdmgSY1BLHCUJ
	z8hBbhL6FRatV+2VOu2Y=
X-Received: by 2002:a05:6a20:734c:b0:3de:b120:bb87 with SMTP id adf61e73a8af0-3e16bb7126cmr13171971637.8.1791974012035;
        Wed, 14 Oct 2026 03:33:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:734c:b0:3de:b120:bb87 with SMTP id adf61e73a8af0-3e16bb7126cmr13171949637.8.1791974011571;
        Wed, 14 Oct 2026 03:33:31 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:31 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:00 +0530
Subject: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=4668;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=nt4RrUUJgtVraKEfN4PaTsUlc8ESaCHG5ZgC2U6FpxE=;
 b=NyQHJnzC4qmpVLrUnkJk+5qjv/LdNXWObo+hRoebzoZaREO2rMgHczHrdsOlAqmZXylVVfowQ
 7fojZT0iHoJBX6zE0keEbWQjRWz5MDDMmOogasfo+nA9ZjfbYslRXjS
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf5a7c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=azaBX0EM9DmJuHldzdsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 38kfLSvf18KlUHUEhZvTLDFWhemZ0ymn
X-Proofpoint-ORIG-GUID: 38kfLSvf18KlUHUEhZvTLDFWhemZ0ymn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX+xi+9d8x6M9I
 nnCnt5emtbm5LR1oq93TDGcRadJm9QmG7hR06MKlKolRa88oWYKmRq4hKaIVDZTnvuW4ypTEbZy
 eYkmNjNCanudf55LH2TSTXTPt7IXHFMBTlWepKUdXgUVP07ZzBX4no4XX1ajz6AVKdWh4BhDiac
 4AaDsCXpMlRvZgh5ZC/C9huu92FXBnCQL9hPu3wLjrXRx6jjtrkQhD+MBLp7Px1GKiuPYMFdnGO
 bIsgYuG6HSDGOGhcxmUqOTxvAE9hQfRHJIDmFbPelpSaFouNny+NTVXwLTfFgDTOqAu7edN7ari
 G6Rq5IaEgDFiCuoCUq8NyNrnSKa+6x3SrnfFlaiCE2PkO7elupOgCv/Ba4lmm1m3NRPtFWzuCJt
 u3OqNwfr0Ql8FIBu7ryYj0bKnaX36h2thb8Azyvi55GZBhI/jTZHAH3+gYMFKmykZCo53+ENlpY
 3xMW9hDuPiP7hxmiZeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX5SLC2y/va//I
 pEmSZ0VcVWkjtPD0tZegrYrLne0sFsG7I3S4MU31qorRTLRPB7/JtmUh6x4AeMy2X7xksl4cYXN
 KT+Owz7xt9GinZrWpHWYAI771ZD6Imw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140041

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Implement set_mode/get_mode support for PM8010 LDOs using the mode
control and status registers to allow clients to vote for LDO modes.
Mode voting is not supported in the PM8008 LDOs.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 75 ++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index b484c0f73eea..ae5370770b2f 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -8,6 +8,7 @@
 #include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/device.h>
+#include <linux/i2c.h>
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -24,9 +25,19 @@
 
 #define LDO_VSET_LB_REG			0x40
 
+#define LDO_MODE_CTL1_REG		0x45
+#define MODE_PRIMARY_MASK		GENMASK(2, 0)
+#define LDO_MODE_NPM			7
+#define LDO_MODE_LPM			4
+
 #define LDO_ENABLE_REG			0x46
 #define ENABLE_BIT			BIT(7)
 
+#define LDO_STATUS1_REG			0x08
+#define MODE_STATE_MASK			GENMASK(1, 0)
+#define MODE_STATE_NPM			3
+#define MODE_STATE_LPM			2
+
 struct pm8008_regulator {
 	struct regmap		*regmap;
 	struct regulator_desc	desc;
@@ -134,6 +145,51 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
 	return regulator_map_voltage_linear_range(rdev, uV, INT_MAX);
 }
 
+static int pm8010_regulator_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int val;
+
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+		val = LDO_MODE_NPM;
+		break;
+	case REGULATOR_MODE_IDLE:
+		val = LDO_MODE_LPM;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(preg->regmap, preg->base + LDO_MODE_CTL1_REG,
+				   MODE_PRIMARY_MASK, val);
+}
+
+static unsigned int pm8010_regulator_get_mode(struct regulator_dev *rdev)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(preg->regmap, preg->base + LDO_STATUS1_REG, &val);
+	if (ret < 0)
+		return REGULATOR_MODE_INVALID;
+
+	return (val & MODE_STATE_MASK) == MODE_STATE_NPM ?
+		REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE;
+}
+
+static unsigned int pm8010_regulator_of_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
+	case REGULATOR_MODE_IDLE:
+		return mode;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
 static const struct regulator_ops pm8008_regulator_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
@@ -143,6 +199,17 @@ static const struct regulator_ops pm8008_regulator_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 };
 
+static const struct regulator_ops pm8010_regulator_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
+	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_mode		= pm8010_regulator_set_mode,
+	.get_mode		= pm8010_regulator_get_mode,
+};
+
 static int pm8008_regulator_probe(struct platform_device *pdev)
 {
 	const struct pm8008_match_data *match_data;
@@ -155,6 +222,7 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	struct regmap *regmap;
 	unsigned int val;
+	bool is_pm8010;
 	int ret, i;
 
 	id = platform_get_device_id(pdev);
@@ -169,6 +237,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -EINVAL;
 
+	is_pm8010 = of_device_is_compatible(dev->parent->of_node,
+					    "qcom,pm8010-i2c");
+
 	for (i = 0; i < match_data->num_regulators; i++) {
 		data = &match_data->regulator_data[i];
 
@@ -185,7 +256,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->supply_name = data->supply_name;
 		desc->of_match = data->name;
 		desc->regulators_node = of_match_ptr("regulators");
-		desc->ops = &pm8008_regulator_ops;
+		desc->ops = is_pm8010 ? &pm8010_regulator_ops : &pm8008_regulator_ops;
+		if (is_pm8010)
+			desc->of_map_mode = pm8010_regulator_of_map_mode;
 		desc->type = REGULATOR_VOLTAGE;
 		desc->owner = THIS_MODULE;
 

-- 
2.43.0

