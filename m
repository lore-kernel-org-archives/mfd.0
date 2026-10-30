Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341285;
	b=Srmc1Bvya0gkLDGIaYEybedba4+YirQ2phBmoRAY6MVKYPaOGftqzcpdVNivhQxhPRZX
	 bY4uNBgFGHoF2BRppXmkUvrItONLgu//DM2Ikm9lB79KnaDxLPDCKFEEh1JGRkUG+3BJP
	 xQRH8viJ45Dv7zYZR3VHqoV3ybv55E9kR4/zFnbIS5FkPUKju3ejyfIg3YIf8u6DxdCrl
	 isAjBzb9MZNxaO1/iUGbRNpbjHlgye+vWboWinacc2LxeeyOXRLR9fIg3eFr5OvRcNiEJ
	 t03jFlF8lAEeuCr0qcu72Wcgxew7FzQgV2YEVp2ADLIlmGfrFM8Jx8e1ZNZlGHYUURg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FsXK1O0HJYviQ0L+PescLIZvVO2QJTar+nEOAo7BaRs=;
	b=EHGk8KAT1ZZxFbUQdL83ZSPd9hvaFSzF39yUOpk8Fync2oWyYXycvp3MZ9/Wuunvn4e+
	 M98Cp4XwCnP2E+N0lsS+RZgPYpRg0q/OVzryyh/6zhPW6FxQy3DhsGFtyaajq0d4Dm2CY
	 EGr4USP98d0xYLUs5LnAu6kDJqA2WNoZxjnMW8SNtXXSjw+bmL8HeMGO1S1k4dcHRYDxv
	 bOkcpIJQoI2tpRsPNMEHQbYi7OXLXNjx4BjAiFcntdQXnTwxyFl7yMprIrkn+yiPfK6yq
	 upuMaD5J0Xc4U4LPD9/nnfpTX9dkSrFa4smaesBAyNhW9FzPzO1g9p2oODld8G66H1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a0ggboqO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M+hZGt/u";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC44606A31F
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC44606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a0ggboqO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M+hZGt/u
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F7dE725407
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FsXK1O0HJYviQ0L+PescLIZvVO2QJTar+nEOAo7BaRs=; b=a0ggboqOmG+psuGi
	VA57s0V6rnM/0Wsg2IUq5MCaJACkI48OXk0ygJKRwd+GgdQw5ydPhoyjF4z2DiwM
	N2mAVmR3mR34b2ndN/v9ygZVA6Yn9QPhPmhqcBUbLs6+xVUjBiLsAGQGYmKPPKRM
	onmdkePp5nIBqoZe5ejToW+K4i98kw2ELw25iWbrFnq82Rl/xBaKvInShdL1RIFR
	9HLB5JJdh3ZYEeS+aNIjFOk5FHKGgz6xAm1H3U/pQz9Z0oPDDj0mMaDHB/LlHHA9
	Q1sBWVcUR94jkvFb8R/xyRlYRnFK9uRCQQ/6/YtngR72eVKk3HGqEwu/XZWgbUpZ
	+p5QuQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phg69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so417240b3a.2
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 23:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341283; x=1793946083; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsXK1O0HJYviQ0L+PescLIZvVO2QJTar+nEOAo7BaRs=;
        b=M+hZGt/uBSGpVzb2JTxH+sa5jy+NHt60RF5CkDfT9dsal+FcdNaV9NKYhsY6jle8Jm
         IWy3ul2h4Vvd2ivLful9YNAxnMDn7qL070b/CfDLv5vvJNK2bHnyFmBbhr5Dr2AlVGj/
         5uj0TvDrLqBIlF3p0Vt5DLXQKsTWJ6RBrjRpRgMlHM7yBM9onguHUec/c6PdrxlrqIdt
         Td9pI2Rf1dMwyj/RjoWr/fW0mbbCwTmi1Y4uzUUroQ3bbWe8/+GesZGDQiwXy3Ja0/ZU
         bQvFptMNRBZ705nzIPkkutBbBAHBx6C0IMfl0i2tSfbHXV44ySE4uhKJJPr7zH7k4FDk
         YYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341283; x=1793946083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsXK1O0HJYviQ0L+PescLIZvVO2QJTar+nEOAo7BaRs=;
        b=0OIkHfKKFJ97BCUr1D9wya+NrvcEmd+MdVhDveLZYmMu9iUgozPHaniAjlVyPoFPKK
         sZBaVqgzyTdjDC8xqoPYTmz6MBL/mOMuxF5TKG4nb6RbtGyURolOcJCNPs9uoX6mb8pl
         Qfyx7ybGQxO4Fklfi1/6/Dj2Myr18c5bvEJXjWWTOUPzpeVnKXnTpfE3lXdJBNoMMLPn
         7/aN9sryOHM/moqeg0NUOe4zqzTsCcOh0p/ArmW7dsGgJcTDdETvg3obXInJ3CziZ7Xp
         jn2Cg0ekmuI8ZhUVzOESon3D2En5ht9l3hubbWdaocZ1QbutFnU8Ft9JrORItOPzwM4g
         BMwg==
X-Forwarded-Encrypted: i=1; AKwUvByTTFgNkPQ03mc6RkIrXnesvXtCnGgFYHzrcqyx4ts9nTYRjQX8RJiEWHy3UrrKt6YYXYU=@lists.linux.dev
X-Gm-Message-State: AFq9FYIbtZ/s5OGZq0C+jQHcobcGgChkdZ0DJZ/0uz2KWPZHjAlXWcx8
	ZKM3E0o+b6Mbz4ca+Jm65FlYttlUvdP2Jw3t6ocWjuZEjef1OftyERUzvewLTJ/6t7GYESGlLH4
	o3Oh61d1F9LSjG6/+AUkXtciGiE2onTA7XWo+0O2At9obhRUVqhkURSA=
X-Gm-Gg: AYBFou37IlZ4Ailnman5wXgQ6r4PrqH0110JJ5VjuYuSKbinN/1pFUYFMyDA9E8F49z
	V5HyjvVssfvAq74QmGuPCqiWaii+vay41869UQmO6legyHxHulEBZxyUGmW6SMVsGJgddySN4rw
	5b9JvnZewv4JQvmBuf/4fC+k6y6wcsyNBjAgP9pYUzydg69k1ldpxtdBFci2qklUEQKHm7TqmZr
	Hbcz/cFg7mqjB8ycQ2vuGhfWqvlSnH81HcAilA7ekK9T6pYk+tl9IfZSqg15WV7fwgYgXN/G6vs
	ED6d+DiTdcf+T11JgW6kUwOGjW0xq4ppenhXBihPawyDe7lSs56yApQkUUGnd7Pp7ljLss3e4by
	5khlYMwWO/JFx+X3UfXyZF7Wxi+NhKB4T9/KT7fG3UdbOV49N7kKykyrsWXH7YEb1SAI=
X-Received: by 2002:a05:6a00:10d4:b0:89f:28c3:aab0 with SMTP id d2e1a72fcca58-8a9bf61f237mr1085860b3a.40.1793341283225;
        Thu, 29 Oct 2026 23:21:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:10d4:b0:89f:28c3:aab0 with SMTP id d2e1a72fcca58-8a9bf61f237mr1085850b3a.40.1793341282807;
        Thu, 29 Oct 2026 23:21:22 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:22 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:51 +0530
Subject: [PATCH v3 3/7] regulator: pm8008: Add mode voting support for
 PM8010
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
Message-Id: <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=4483;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=tHHgTISLfM+T4SJmOLlmYYBACZZHmxw+90f4UR9hBoo=;
 b=BimwX38dbCkungPzRaMM/QWdjnVXFdBexA4R87ih3fXcdSL5WBUYAzu4zn6SiULshvfBsMmK9
 IHeY4diBFTgCFFGccT3qpZpUDHTPP6rQBZCWAlc1of6fnPiPg38owwh
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX0gfS+T7b99xS
 5j+4KS5qLuw4CS9dgiEmFiBNJ4yv8MhrynTWDQDYIy+qGehz6S01Md3Rr6stdT23N6sTce4RGIS
 +/bvh0neXxLGUg+hpwxBRUkeWiSTS6IJuS+9VEiiJAczUp4ArEnBIFSzf/aEIWKJBC7EiN+sdDn
 nUpo1uVqOGs1gdl7X8nQRxDgbq3743dAIXjyXHFK8jwO1QkglqZOrJkYy40xAOQwfA3Npsio3zJ
 P37UEC/zvbgRJyaSckf9Cz43WXRT6wAHxSQyKJ2zrCxLx+aCpSbAfQwMPGUa1d3hdLfCvC1tKW3
 ZasfRkBW1jTnSTE9sLGT2r4Co54kHgXWFtWoW6t9p3VzciFB4qIVEO20Dm+A1Ors6cRJ+bCj+o5
 oMwohyZeg1UtlFxmmsodpz60Uv7Mf4KLChAJDWjKjofJPG6VB24XYcCzL7A9JmPNWRFOp7CQbCt
 3c9Ifok1sgc1KtPzLUw==
X-Proofpoint-ORIG-GUID: c4r8z1Z8polj6Iggcz-zRu2R6m761LQj
X-Proofpoint-GUID: c4r8z1Z8polj6Iggcz-zRu2R6m761LQj
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae43763 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=azaBX0EM9DmJuHldzdsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX4wMhumbt72zO
 zH+gs4Vl+YUCnfaWwWHST+4iNtGebbNDupGPspY8l62xHJKVS8DHffUP7xV7XuPGCznA2gVqBXY
 85/nTl9s32IcNRU8VAUgdNjymbGNaLE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Implement set_mode/get_mode support for PM8010 LDOs using the mode
control and status registers to allow clients to vote for LDO modes.
Mode voting is not supported in the PM8008 LDOs.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/regulator/qcom-pm8008-regulator.c | 74 ++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
index b484c0f73eea..3db825e93731 100644
--- a/drivers/regulator/qcom-pm8008-regulator.c
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -24,6 +24,11 @@
 
 #define LDO_VSET_LB_REG			0x40
 
+#define LDO_MODE_CTL1_REG		0x45
+#define MODE_PRIMARY_MASK		GENMASK(2, 0)
+#define LDO_MODE_NPM			7
+#define LDO_MODE_LPM			4
+
 #define LDO_ENABLE_REG			0x46
 #define ENABLE_BIT			BIT(7)
 
@@ -46,6 +51,7 @@ struct pm8008_match_data {
 	const bool has_stepper_ctl_reg;
 	const struct pm8008_regulator_data *regulator_data;
 	const int num_regulators;
+	const struct regulator_ops *ops;
 };
 
 static const struct linear_range pm8008_nldo_ranges[] = {
@@ -134,6 +140,57 @@ static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
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
+	ret = regmap_read(preg->regmap, preg->base + LDO_MODE_CTL1_REG, &val);
+	if (ret < 0)
+		return REGULATOR_MODE_INVALID;
+
+	switch (val & MODE_PRIMARY_MASK) {
+	case LDO_MODE_NPM:
+		return REGULATOR_MODE_NORMAL;
+	case LDO_MODE_LPM:
+		return REGULATOR_MODE_IDLE;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
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
@@ -143,6 +200,17 @@ static const struct regulator_ops pm8008_regulator_ops = {
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
@@ -185,7 +253,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
 		desc->supply_name = data->supply_name;
 		desc->of_match = data->name;
 		desc->regulators_node = of_match_ptr("regulators");
-		desc->ops = &pm8008_regulator_ops;
+		desc->ops = match_data->ops;
+		if (desc->ops == &pm8010_regulator_ops)
+			desc->of_map_mode = pm8010_regulator_of_map_mode;
 		desc->type = REGULATOR_VOLTAGE;
 		desc->owner = THIS_MODULE;
 
@@ -231,12 +301,14 @@ static const struct pm8008_match_data pm8008_data = {
 	.has_stepper_ctl_reg = true,
 	.regulator_data = pm8008_reg_data,
 	.num_regulators = ARRAY_SIZE(pm8008_reg_data),
+	.ops = &pm8008_regulator_ops,
 };
 
 static const struct pm8008_match_data pm8010_data = {
 	.has_stepper_ctl_reg = false,
 	.regulator_data = pm8010_reg_data,
 	.num_regulators = ARRAY_SIZE(pm8010_reg_data),
+	.ops = &pm8010_regulator_ops,
 };
 
 static const struct platform_device_id pm8008_regulator_id_table[] = {

-- 
2.43.0

