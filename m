Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416645;
	b=e2MceM3MXSHX7L4aFHD5gqBPAv5p7KhdoJvQLd4XY9p0Syl2mqjRAXRaz7YaCUmEaGjt
	 0SXvhE9vLvh85P23smevBAw/KRxbB0EVJMnTouYlTip6zPaBvDkS3SZ1LBKLh3/lmuU1B
	 wmA9k0dqEuZGCt47q1THL8DPmimy3cRkaFGGbrOx4pA//99Ixqqb7UPKtP5XC1NZUZYRU
	 1u4+JBs1vZZalTh0bJsVnP5gfSnnHziihQzDpRWyqjyul87bStjpP/ZBgRCW8ktmo/Oyk
	 l73XngeRJ6W76AzfdhMjYoFPDfArC9nxSLM6ErH50X4Xog+3/dKrHfu1THcgIBzS3QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
	b=JLJMczQWHYytqn2fPKF8BY2KbKYi5zfqS0wgTKh5L+Y0Uw8P9d/NFp04yL7GB1aTNW3L
	 /1HAEiOUzgszA4TBcU1u9YtDcZEe+9OS4Dz8XMmseHDIZXAji+hryAVkMymwNpzNf/JxQ
	 oGO5g0b0afKjiOoW/ZNIQVEs0T0ZjCBE+jT4JjiAfGk+1TiWbpIBmHol2vOAwBdYd9RzS
	 BcIpHZatsn1iQiHe7rY+pCWFaC1kXdQlzG2aN/EQm9X26ohiOhGm9xt8WRE3Iz0KlNfst
	 95B3Y5MQm2bt3sNyAP0I9bR8pihRWz0sa9i3quk0k7HtNrzhq1a5e86fxaLAGE/XUdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=li9c1jqP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UjnJxPiN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371F9606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 371F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=li9c1jqP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UjnJxPiN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF18nT2115560
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=; b=li9c1jqPOPtZ7Enb
	1MjmBLRdhsK9hApr18LzO9yyftt57qQyTDr+DDOvcqGpSC0vRdMqfsj4W6EZVHFQ
	zH4a0qh+2B/RTGUfAbFf+dFV43UMAXjo4YNwcA+M2bNB6ibkyhHE3p37WCaoFaci
	OT5h17N222INittuUu5nzC6pJK1JnwAyjUp6M8oWVB9SmYcsN8Dn4loW8Fe0FgTU
	9jZxqwjICqs/vKlRLjR5JAybF5sRVZsJndKBnnrQXBQMlz0SFMWa0n4Q30a/5E8s
	HQcvoXKveiJARO4DdYV7y80UGQMmol1jz4YxMHzzvD9Jdxe34IMeeSCUcqM/fR92
	dxY4mQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawk651-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:04:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so3447539a12.1
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 09:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416644; x=1795021444; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
        b=UjnJxPiNvbrcn93FekU3DNe3LfzEt6su8XlGaXK22ISgX7+VZSAK3miFQiUUR66ae7
         2tsuoI5Zy3i9LBM2Pll1C5emef0x1QLyNaJ6rTq3hXptkNFIrrUYCi5CvXRRK1vMN9Tx
         oRPmMoazl1/eyWLAteIIbgXOkBWfI7Xtluhc9TVtCqxHHR6+g7RbPtkcbOJXLrZyRMeV
         bho4nBaWh66AkYzIPqDYNITwDobn1Bf96JBEceQEWnSI8I01k7+6RTcEFghTdbHuBGtC
         Dg2K/NjpxPgY9ZIbRO61BT3SNH9Fc/ky/YFyN2z3XmktlGTim5zwPzWEifhNs0Pb8eBg
         UNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416644; x=1795021444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
        b=Bequ/IaO3wMfFaPBYkLPir8XVENZN+06Iq7G6brWKdMewIdJl1oeHkcV/QlXinMYbG
         YKw/l/mnLpJsumj8vfNjb3Mgcj3bsBiuFRz9K2czobBiDHcC+KnXIds5TorFuFZTwQs5
         CKsMLiK8fwltFZqQ80KcndzLBV9Yv+4aQ3ce6iQnzVGQVUMdjOJbztysjQ6paLkPJuHZ
         A8y5hwit488Ac4mYg2uCkFqJCD3vavW+bwhXfFBIXtWvFToZ3+jSbY7dpwlmckpCVbJD
         CLrbmwMEBj19k5UaLBO88d1FfoHs6PnbnuN+ZKasS7nRZlRLiu/5z3y2zYq0UMsFtKbm
         GpUg==
X-Forwarded-Encrypted: i=1; AL+hErFQVVc0HlPCMoSFD0lSpv6KxjI/Z8ZRbu4ylQzbpuEgpIsd9UaWK91oo9oFYcROo/ju48Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z84/TPgRtNjT8qQQ9k7oO9Q3QLkUKP2679NT54v+P9EGrXlUWfF
	0zKZft38OeyMnzlyizj46Ep4AOvzk6hBSgAl5cue3SeXfdKIDf02/8RUbjjFXA7ZTuuWXzsQaKX
	OgDXRjU/MSFdtWlYPbmaeALq+VwwGTR7Q8rmYMX/N6KEqsokZNgY/s5A=
X-Gm-Gg: AYBFou3Z7fk/7yfE+ZPrNDzIqKKGVjxZ16p6Dqzq+CI4qwZRlSlIaINgCPWD4YSPVbl
	teZQFef8PMjS07dP6cLY97Z1erFL+l0rW7PR88qfBW12DhVOxC1VN75ShcfSBMA/BUn1+f8MwQ7
	88htpvqlDGkIM2/BfUlMGKn0iDEOhKw6+BWDXfTM7OzhfKrVZfnpE1rV7kNqJrWL2eprMXz33A0
	q0+sm4wiW01rkU7VaoHIskORWHJhwiTCs6roXfNAbtDAu+QXD5P+E4gfdITQkrRiJ7zujL197YX
	3nRioSRlBJqrNKHHUMKbuwQ9YCd1b9TQpy0OlYl/Yn1rr0qlty1m65LjbfEKamNi2U2DlEWdgZD
	BGZ/VhfbJgX7beZT5Y/rOA31nudz6sNM39dQ2MevN/MTLyPjruOL702mDWh5thH/GWp8=
X-Received: by 2002:a17:90b:3848:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3b182f235b8mr3273362a91.43.1794416643772;
        Wed, 11 Nov 2026 09:04:03 -0800 (PST)
X-Received: by 2002:a17:90b:3848:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3b182f235b8mr3273327a91.43.1794416643353;
        Wed, 11 Nov 2026 09:04:03 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:02 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:54 +0530
Subject: [PATCH v4 5/7] mfd: qcom-pm8008: Add PM8010 support
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
Message-Id: <20261111-pm8010_i2c_support-v4-5-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=5611;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=166k5Fjo+XzrjC/k6aDFuh8Bh5vkTImFiY/av/N3V9E=;
 b=F7Fv857eeeihZ0NGe86QVV84N4cxJRh65RY1ZmMTJTxRui9Dny7wZU2a2kp8qcu8KNxs82ggQ
 JOdmJkDLCtAA+k6id8+F3hlCewb9hWcCRWqdP5D390Zdd0bA4gsaomV
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX6Uo+uTXAORNL
 8EO0hbCsYeQAbKabtQEeQetq8jXrO21KeRfcQ/cPlercQS3TzLBUSNRZyV5pEMPeEtJPQBvTYde
 F8IdvBTB0Kjz8Bff1LqT2cgN1VMdtKA=
X-Proofpoint-ORIG-GUID: gGRBlDLvtlxlPF3lKu3pxkob43H_iDcF
X-Proofpoint-GUID: gGRBlDLvtlxlPF3lKu3pxkob43H_iDcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX31qurxt06UVF
 Edgxk9g7mu8DY4bDduFNlwfto17k5UeTVxAtFAO9KHL8XvuIAPkU2n6h/7nQ78v/A4B988UfEK7
 kIIEZcw7SH6GAX0/Q1JejtyLC2vBfg3YrZetHxTkbRXRwmmCv9od119YJD9KoXQxD3F+gRWWYza
 EqbHo+Ob8kWYuta7O9SKAUM/GGp0ajo3GAOMpJlPur07JsCqPe3Tl6YZpzIYgplc61RlABle/Ms
 fAsq6ITVAjllvecpZyK/XZgUrgDORinU5LeuB+g3PzPpVR2lFp9guMiUA5CYUQvp1lik7Oq/pyU
 z5JUOG8PEnFoutR7fYQDlvbmyRzz+1XOu7Jni/Gm1kwQd6/u8l1DbrhLBeyGMV3KvYP4ljeENBf
 PWSWmh8oxLyFFWq+OPtVHNWk0JrSHt5aHvDvo4M6EuQrwTwudm5XeHR449z9oRTcID12TgXHuVS
 dwcsxHaIqY8aKCJhOIQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af4a004 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=LamtlsxKl8ZIB2y8LWQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

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

