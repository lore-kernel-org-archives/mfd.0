Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809655;
	b=Q5p9QjxOXYSp4X0/ZIx4I9SFoYu3Z36nWk4RD2FB8D3aSM7u5/hrw5aMdhpfgPZH3wR5
	 C8jIfF9bqQqlHzTz1ZiL2faHU8nNWB5ToQcEejrFO85FLqGaOd/U2SmIwv3w2TJV1uUqY
	 ZOxpQMK57u2UBat0lxGiQJ+wVqbfMSdwww9JI5KxNZXvKDtKNW8LjvHAP8CD7Lr1SnCFF
	 SLpZD1VPGz1exYvTy/5e4X7uSceoMQtsulnoV211AsYQjYKRq/hMTRPwvajuV9J8tm51u
	 QSGPs7VATSlV5imF+tQpB2JgBfd1SYUQhfoIquqQkU//wO9lFHrLi1oXP6sp9RbNi+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
	b=FigZqKbxg5UE8lkae0QdaFdFCQzLjAQXaPMbtgb6fjQbCx9Lwr7M9W/Dp9xnr6jkUEGA
	 MyWO8zbHj4K3PmjkKmk1LrIdvQnQ1TNzPymTwkl/tQTszt0LZ38bYMKIv9XaLLHp9+FA4
	 z+yxioYegqb9pToXXM/orJqgou8ASeOFwerdcX9KEeey1Rasq/xBMCpU1LjPx5bFdouz0
	 X5k0gHNL03OKWhUiDQlvet6CHWCtkwktJbq2J6YZ/L7XvacXSy9M3TbgTuIGrkfG48gLY
	 rXgmeCnVbOs1WSEDAMfzfI4CHu9ukT5gs7o5y67HDhQZlAABRnSfMocN4KR7zMRMjbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9GTQgJ5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5qQa9oz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19C606A323
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB19C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9GTQgJ5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B5qQa9oz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LjX3592452
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=; b=I9GTQgJ5fThr88HA
	6edxzgJIp0tO7DvV/Lt9ZHxPh3vHNmbtGosDzAawp/UL4EGAuBVrVeuEYjHSrIh0
	QfqYliwbQbFuykggLCrfqt5Y7vUDUXBtMF41+BxvvYYe6RL9C17PG+oHzx1gh7Mb
	VEheSvNSqzD/i5pzSKHuALZxVUPQFRFT1yYy3Gw9K4Rkeptem8ckdsFfF4jxKWSH
	ak1gefkkCZS39jdNn/XuOi/jpVZ0hxW6/0/fvRX68w7PMcY8ooCIxITDxvLYTphr
	bzSvWkBRogcqEXNnX+4dDxKUFwoBUyu2vIe+DYuIb/eEHLvVYumFe9vBIxnSuoDE
	ZQ5+kA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjw4mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so2772894a91.1
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 22:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809653; x=1795414453; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
        b=B5qQa9ozeT0oDuKfHmTyHEc2Q+lAJMzwLr54D0EdwVa3F/zQMCheLixFS1zRBsSgDy
         AwLFvyR4gm009gyaIj3znIdYt6G6Dt29Ahz6yzW5b0KDIXw5lu4gxIPXap0npeYIk/dM
         q9ri5K+DpzYIJ+ZzGTvuH6Ra6aqpFJwq8Ha2hRI6kuHcnEuGx162HFeC7Z2zuCfgk0S/
         Zuu0jZCCJeLtHcOMJgChnCk9Y8MiwfuiUWEPs2ptWh0cFAnmikzpDMqff504NqK2lzue
         BvowCRIqcEfKllh6ytSgIwT1PhRau75n9d5g/2+qb+J+tNUyF5V2TQjRr0ptVcOPBKmt
         tSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809653; x=1795414453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
        b=jSFl81b0vnKwm/9CHuHnJSZzAkdrPJpt5S/pdKShWe879DfZ8MBTbwSYGD4Bz/oY8Z
         Gj1V9lJ9xCah25lcwOs6mbF+CnztfLSFurhsiJZ2R38AYQG2Fdg677j3V89/7znaH1xV
         EKjB9zLZUtiBaoF+9xinavI24ySAvyidZNl495mSez8ZGvjxq+0WXPPiULTzOz1MEC5z
         vPuJPNOrIL3MYBKDXSlCCoSCQ32ArKS+vrWlKR1Nx/yURyItrbMDkR2/PB04nTrh2Pc0
         ERuHveYn2UN1pNohb7o685/ucH8kSseweMIThOYPuV+sU640sGZajJDQwXJaNEy1zXdJ
         8XTg==
X-Forwarded-Encrypted: i=1; AL+hErHCjI4G2YHOLl0dYbaVWFTCY7VIvr1kXO3gDvW+kj0O/DKiMWSAlaWul1mpiwq99g49Ix0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+QA9du8Hl6VwKWCWN5ENR2w8R5j2DJeHKCoNfoqEQP1th8Ja7a
	KM76+2+9eta+yGGkIfNkjnGAtFZjR5i8yuaP0SGprCo1ov/+CfZZ0kV/S3Ti+d8F0PzvU9F8KLW
	1s9cNQqZ4YdSKeIfEWXb/fXB8erpMiYYmI/kg/vCdSTf4tl22gAPpXVU=
X-Gm-Gg: AZFdTZfwz4JgqGpqtM4fOmVP3rJGkbgl3+uXOwV13ZlUgd7Ej8/MSXCk0cEmURwYvWE
	noBOL1p/vOPJynlfhcxWF1zHhkwNSgp66TQ4dCyRWS5VWzzLWwYYkMzPN1JAUlUFfgQoOIRSRR5
	yFT0C9fDYGFPhWlJssZDeyqSNxVuhLH+tp4pCJuYW/fmLWe6l28Xvvd2LTN9zD7d68hRHvLmNF3
	o/SzhOa0n8gScSXnD+F8MAxeWF9kYmam0L/hAcUuUUl3WkqwtlZS7JJVD5SYbdCmiFTwv+K5x1Z
	TCQdnHjKCBhqk5eR7aD/FEQYxegatUH0+1u6BukSV6Zu/O0b//ZJPWSCom7x6w1/WMgBMXq0gBk
	eBebwbJ9kpDkMOkjk0A73Yf/WxLfc7goW+s3yPFnIp7TFhZmOgP5LMDcgbPXfvT6ADZls
X-Received: by 2002:a17:90b:53c4:b0:3ac:b867:81df with SMTP id 98e67ed59e1d1-3b1b0b531cemr9902971a91.39.1794809653040;
        Sun, 15 Nov 2026 22:14:13 -0800 (PST)
X-Received: by 2002:a17:90b:53c4:b0:3ac:b867:81df with SMTP id 98e67ed59e1d1-3b1b0b531cemr9902943a91.39.1794809652577;
        Sun, 15 Nov 2026 22:14:12 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:12 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:23 +0530
Subject: [PATCH v5 5/7] mfd: qcom-pm8008: Add PM8010 support
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
Message-Id: <20261116-pm8010_i2c_support-v5-5-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
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
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=5611;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=166k5Fjo+XzrjC/k6aDFuh8Bh5vkTImFiY/av/N3V9E=;
 b=1u5ObNX3LHlif7sq5a6AC9HdPT6fGRodYuUuTAqE8G/1N8A/n7FuhEhGds6Mu67bbmfbHKY4w
 1g9+IBnULP2BfwKS9M2fG/VvWRdkQTa911zMsK5SEfZ2/g0/E52cLjv
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX7rJOidZR7CXw
 SWaMfihhoWEBVFHvVNZTMEe+6pg26rHVQcPbyWBsNixLUWa7LgOWwDOHdBH7/M/neIlW8gUqilz
 KwJCpreKiCP7CBupkErJ0P+YQ2To5gOhRaxcMJNFy2Wvd/l/CNYLjS97YRbI1S1hWTkdqpQl0um
 CW6GaCw181H4DmDeqQykFiKqVrNjx/9reWOqOSeuiwLoDGT/p6tVehVu9mMka3PyLsZgsAQ2kYl
 JEgxVOU0PSSCCyXsxLzRMOB9vkeSyfbyq/z36j9XVKnYa8A2MZySHBze5CS+D3WdARadlsLe98g
 thHBDttr0SyvWpJzTRyfG1H4pZ7HuDoxERZLEBgwDQUagmu+v1KrZNNwjWTA6e53BWSbMuPoQ/s
 1MRD0otEcDs6FgmEJSa0vYbY4wo31MVI2ymoovRHmqLemQ69HaAchHa+SFTOFWISe5PvCznbNxh
 cFFqvpV1oa6075vqJWA==
X-Proofpoint-ORIG-GUID: L_PQtVmcoBmWXIRAZXS4zz5aRo5XLcrX
X-Proofpoint-GUID: L_PQtVmcoBmWXIRAZXS4zz5aRo5XLcrX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXz8WwsqJz14dc
 nxTRQS//Qyj6GXL70omyJz7YSw0RvgeaxVAD5Zds/empsZHB9Kc4Cc6IrvjWoVEQupX5zaHt5h6
 4jcIKsqVnpuHzXlOhcfjOR+9mNvmXAc=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afa9f36 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=LamtlsxKl8ZIB2y8LWQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

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
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 76 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 2d6c01cf54f3..39fae8d48e46 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -34,6 +34,11 @@ enum {
 	PM8008_NUM_PERIPHS,
 };
 
+enum pm8008_chip_type {
+	TYPE_PM8008 = 1,
+	TYPE_PM8010,
+};
+
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
 
@@ -47,6 +52,9 @@ enum {
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
 
+#define PM8010_IRQ_MISC_MBG_FAULT	0
+#define PM8010_IRQ_MISC_LDO_OCP		4
+
 enum {
 	SET_TYPE_INDEX,
 	POLARITY_HI_INDEX,
@@ -78,6 +86,12 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
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
@@ -146,6 +160,25 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 	.get_irq_reg		= pm8008_get_irq_reg,
 };
 
+static const struct regmap_irq_chip pm8010_irq_chip = {
+	.name			= "pm8010",
+	.main_status		= I2C_INTR_STATUS_BASE,
+	.num_main_regs		= 1,
+	.irqs			= pm8010_irqs,
+	.num_irqs		= ARRAY_SIZE(pm8010_irqs),
+	.num_regs		= PM8008_NUM_PERIPHS,
+	.status_base		= INT_LATCHED_STS_OFFSET,
+	.mask_base		= INT_EN_CLR_OFFSET,
+	.unmask_base		= INT_EN_SET_OFFSET,
+	.mask_unmask_non_inverted = true,
+	.ack_base		= INT_LATCHED_CLR_OFFSET,
+	.config_base		= pm8008_config_regs,
+	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
+	.num_config_regs	= PM8008_NUM_PERIPHS,
+	.set_type_config	= pm8008_set_type_config,
+	.get_irq_reg		= pm8008_get_irq_reg,
+};
+
 static const struct regmap_config qcom_mfd_regmap_cfg = {
 	.name		= "primary",
 	.reg_bits	= 16,
@@ -170,6 +203,11 @@ static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8010_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -180,14 +218,43 @@ static void devm_irq_domain_fwnode_release(void *data)
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
+	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
 	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
+	unsigned long pmic_type;
+	const void *match_data;
+	int num_mfd_cells;
 	char *name;
 	int ret;
 
+	match_data = of_device_get_match_data(dev);
+	if (!match_data) {
+		dev_err(dev, "Failed to get driver match data\n");
+		return -EINVAL;
+	}
+
+	pmic_type = (unsigned long)match_data;
+
+	switch (pmic_type) {
+	case TYPE_PM8008:
+		irq_chip_desc = &pm8008_irq_chip;
+		mfd_cells = pm8008_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
+		break;
+	case TYPE_PM8010:
+		irq_chip_desc = &pm8010_irq_chip;
+		mfd_cells = pm8010_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
+		break;
+	default:
+		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
+		return -EINVAL;
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -233,19 +300,20 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 
 	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
+				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
 	if (ret) {
 		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
 		return ret;
 	}
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
-				ARRAY_SIZE(pm8008_cells), NULL, 0,
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
+				num_mfd_cells, NULL, 0,
 				regmap_irq_get_domain(irq_data));
 }
 
 static const struct of_device_id pm8008_match[] = {
-	{ .compatible = "qcom,pm8008", },
+	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
+	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8008_match);

-- 
2.43.0

