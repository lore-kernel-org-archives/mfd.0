Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809650;
	b=miKYQnIjOYqWG8K9frX3cNer5oTtO5VZfrWCn7rFzFcRW+qgEFAbdVQngw+3f+lduSkb
	 H5JO+37i0a5GL4jITucEito8hhggVjzaINTe67BFk2WSjHL6ZpwC+7Mbtg7FwuwUrHkSc
	 Gv94enjoaiKdCazAIFs5Kd567bvoERYTDO6R8wG0Un4zGKGFDZecFHi1wJ41bKjtQl/Fx
	 o7XHx/02KaozEwR+Im1b2lMNmL/xBFEGZDCil82RKguTxqoc5RksNyrxB+tkOTbaiba+q
	 SSsa8TG/I2/QkmrgVozmNziavwiuUyDjO4eCwNUQgmtWbiX6CkNks+FLAVl7hHAxRoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
	b=zEvOgEL6M7aROc6SsiMLs5VWcJKYIKqCBzBNhSzFOIjJTRYrID4F5FhREzsCUueTOcF3
	 fqvSBslj7NPi2GKzRWU03XxlkqrfO6w17ea9/O+ErtL4egyLY7BHoenkqdSV0j6S5NEYS
	 +jx8Xyu+rMgH3CoJ3/A7F69NYtc5eW3kInTHgqBaIslrDNU+svDyiAyVN8mWoRlbfsuuP
	 jU0m3pA8wppuctaC11dJYW5YyawR5fk7dQPdIJV/RwmgmxioOwEa2gwrNlQqye74D57FC
	 Adp3pjUs9fo///b3FGbMgi44OEvs8bq0O1cUosJDalS3Js2/PWy0KiVdniiJ/DXICKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwCY0rfq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxgjfzBn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB57606A323
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB57606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwCY0rfq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxgjfzBn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LZs21321001
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=; b=NwCY0rfqi2Hq/opV
	fYU5/b+WxjM2res+3+q9Bwb+sZ0jFaJtTDIeU9Gzx2KAcJplQczzAqe0OmOjBtPs
	rGeklI7M8PT7P29hkSDxwwJPBspU/wcc987pRPBjo85hqBElL2azRjnGgVJyBL56
	qEqToHOAQiCW1FiT7+hdabQRcLeHOIj/8sHyG/ia787nDiiT7/tdsor0TTgFekta
	FCGA21Cy5StJN/0mvJTwmM3aNO26pE8CBNFDnGbwbTaPffmkTY4Laqw74eDXYdx0
	q3qlTijMamD/FJEVbnkJ6S+HCRt7Nt+yq+nkog8ObEu+ci3Hw7NYnHZauHmN9LnL
	Uhq22A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhman0tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so4976791a91.1
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 22:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809647; x=1795414447; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=KxgjfzBnB6NZtQTOpeWIjM1pXIdxUlU29tXgtQpx9Nxt7NpG2hnE+Y5BIqmRU3qYO0
         kr1cDbVbq1+U9D4o8d9D4W9MdhPeE1fspRObR6OlwhaAGa1K1LuXowcj1/3qWoWEu4MA
         gLm5umsQxDe22Di9g3S/TnqoAO/1Ot9US2oKFClydnunefcBZMElxCDipZAp6Oq/xM/4
         j7kMi84+eKHmjmtg21wz1xRExafkBpY3GhNQK0wNmjzk3lcoci6H4HbgCCoEMcOkkaoZ
         S+ubaMkPq+IR7CeU3no012XRP9C2QcVJr19HPAUCQ0gywrm8vxV4dpivjWRXMSzS19sn
         5w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809647; x=1795414447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=LbFr8xtW6+OZsukMkoK5tb6RjaT2cP/3miSRc0YUaDYA1ZaVJgWrS9V6fcb0BjWOCV
         D/S71rERW1yVMwDjYzc/BHYxVqbnY5rcmgjD/fDnbOak+VSJvRTcj8gH+lWn5dC8iyYX
         3ajpWN9mT6FAhSvmd3BEgeXgiOqNYM4A03OZev1C8/3cuSuG1s4UhjidlVeap2lAndML
         2jhGs79ZZzmaI4Cp2NjEiR3354l4x9Bzye7dpj1gtGLbM6ACwaKQXQgJOt0a3GjkXb3S
         5A5FQsdUWXKCm1A0tQODdjD5nMbLNo2aOnHPV7ceyM11dCaoZKqqL6P5Hhltw2p8MvZf
         sE5Q==
X-Forwarded-Encrypted: i=1; AL+hErENr+EEpeTq6Vk0PwxkTB0XgE9qSGAirckV14gzrSTj6CbkNhFm7ivWnsCB1i2GQIIGGLU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/F+6dSpq0+MLGIO7qmTmrP1+lbbKB0eSmvadHZbJeGw3oTjbu0
	Lmpgr0IJjTu2/w/pW2PVfyDH7QPWU1gpBo1xll4efN+bSRdc5VuR9sxD7Kcxq+vT9kld2DosOr/
	qWo9J4EhaI+rClxv3AmHAznfkEK+MfIXSrgF2VMlKZDx/Gs8e1LaCA3s=
X-Gm-Gg: AZFdTZdv2rsMzBW1ZEij8JRTFFpKPDbOEZ7zKWbWX9cVwFO9GZlU70vRD0XZt5HTt1G
	PWIK61fWZ2ZQ9f6WRmOr+Vi5kfXhrlZsEy27BwkRd6TSVsMmMMmXAkZfp1MlcM/aAKt86o0/wP1
	//41sMVHYHe1jLh5WSF3y9j02QcSy3UVtXsnC9+IUc3kgmioKrBXR8V4Chv9C4rDMDMlgGs0VTy
	QqY+IduoeGztDO/M8tPliOKvqYW1j151aXqTl5OSn7nPw7K7xDhMg+dnDoYKmy8QijuZkU/dKxt
	A/opORnJ5cm0vswo+ihxDV1YzTTAaSbwmS347/islx24JVWoV7d9kZPsJ/knmY7UV4flhR58SnG
	2BqII4pJd1YtGRJgpH+Dh5TGF1MImYlmbrpLJV/CPc9RkBZk36hbl4Uq+/dFq83CJRbwD
X-Received: by 2002:a17:90b:5687:b0:3ac:bc3d:6fe5 with SMTP id 98e67ed59e1d1-3b1b089e26fmr9640080a91.7.1794809647067;
        Sun, 15 Nov 2026 22:14:07 -0800 (PST)
X-Received: by 2002:a17:90b:5687:b0:3ac:bc3d:6fe5 with SMTP id 98e67ed59e1d1-3b1b089e26fmr9640062a91.7.1794809646534;
        Sun, 15 Nov 2026 22:14:06 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:06 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:22 +0530
Subject: [PATCH v5 4/7] mfd: qcom-pm8008: Drop GPIO support
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
Message-Id: <20261116-pm8010_i2c_support-v5-4-5626ba17c0fb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=2884;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=+08zcnHr6A7yFclGJxbZHZCi6ixkui2rq8+7R3gOZmU=;
 b=/vsSAQbip/tHDFPtpttUpBSJJspjd6Xf4OE2fd5cc9VsOGTkmiBe8MQdQR5VzGi0SGfEAzwht
 /OQ47TlLAY1C//XHPSWVFkv2MduIcndSB7RQUM+FX5ARsyzO9jDt6Cf
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: d-BXp4xR95esgN36VcC_vEK2ziNo6PV8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX1tgNfLmFvQ0c
 f3BN6AA9KOHAGLTsw4wi7JW4qToL1hgGVypWouPuiBCl5arwZO2FDRmzkpgPei7hCp8plDiv/2r
 eIt1c4ETgeqrNo5OvQPpC/llKfZ/V6JQNG+m+KCvrFZwuoY3iiR310IYVbNCIESHgQZKtsirF/P
 78gwVTeUyn6u+TodF7lS8Q2X+UTjyDvgLnvXVDtKAph18Ujz9mvQnQL6mZ0TUKO/iANP9zC4L8Z
 S4qDXyiWNcgEbF4ZVljjV3BFEP927ixWikkVCJ7EQ25z2mIZX+cqwg+KvD6Y4w6NNDjKTPNyRdb
 g7dVZTObYoDps+2xjlnw3nEPgxr+ZkVOiFQpsSU296Y2HQ31vOl84g1gWiIHeRokRaO6wRxLwv3
 UVCDkfa8IgQ3m5EoimMnEbH35A73SkRMcqTVc6OADMkCW2tk4luzmmo/l5IZ54cxdH5DIOdqiJn
 I6jDsbvjLCrOIJYtuRw==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afa9f30 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: d-BXp4xR95esgN36VcC_vEK2ziNo6PV8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX2hbHyHEgBADW
 zmtqJ35UGzmQg7kSsixqRzQfrXB6RIVvAKmmS2uZG7eAgsKIfAknkXx0AGhxIGDqoO1KR9KJxeo
 jalIdGtOn3bH7QsT4Qsacccq1njV6v4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..2d6c01cf54f3 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -31,19 +31,13 @@
 enum {
 	PM8008_MISC,
 	PM8008_TEMP_ALARM,
-	PM8008_GPIO1,
-	PM8008_GPIO2,
 	PM8008_NUM_PERIPHS,
 };
 
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
-#define PM8008_PERIPH_2_BASE	0xc000
-#define PM8008_PERIPH_3_BASE	0xc100
 
 #define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
-#define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
-#define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
 /* PM8008 IRQ numbers */
 #define PM8008_IRQ_MISC_UVLO	0
@@ -52,8 +46,6 @@ enum {
 #define PM8008_IRQ_MISC_OTST3	3
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
-#define PM8008_IRQ_GPIO1	6
-#define PM8008_IRQ_GPIO2	7
 
 enum {
 	SET_TYPE_INDEX,
@@ -84,15 +76,11 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
-	PM8008_PERIPH_2_BASE,
-	PM8008_PERIPH_3_BASE,
 };
 
 static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
@@ -180,7 +168,6 @@ static const struct resource pm8008_temp_res[] = {
 static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-regulator"),
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
-	MFD_CELL_NAME("pm8008-gpio"),
 };
 
 static void devm_irq_domain_fwnode_release(void *data)
@@ -252,9 +239,6 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
-
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
 				ARRAY_SIZE(pm8008_cells), NULL, 0,
 				regmap_irq_get_domain(irq_data));

-- 
2.43.0

