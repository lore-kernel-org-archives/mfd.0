Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416639;
	b=D2aoTrL3d2MYrWKi9CSYGukqpPKMF8sp+d2N+GP6bJGP+Zmk7H0Lcv7rBEEwdCgBnHht
	 v/HvP89j+NdaJwk6x9Qn9igY3X05qzW/w26CI6iTuatEImo7NmjmMBXtLrhF68dcXKJZ6
	 f6HxL49rCi/+zyioX6+pZy3sQAI+A/g1tbyLBWo0tLepiPKm/T7Djk6DpJVIDTw04FinA
	 acINpUzWtdC71v0gzXzRr4g0C+tXlru0J6iwgRZqd6obsLc087ltOlTWTQAYtacKWCZnu
	 lY6h2dPJKWCSnNKb7kZWqd7uBJ/CxV/FD5oeU71uVe7JbRAFY5B6LE+PayBzk8fnGQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
	b=HUnU9laVXSbu02eUjW1gmTfjHoaBcG0Rv8gQW/F/teeqr5cdcD16RZ3/N19yBdxIdYQ9
	 EhWKzg9frfdEHaSaw+j8rXYAKdhnpdFzoEKvMjKk1wFXeMQx2Oj9Tksnt3VKf657nOeM2
	 SQIo8azaV2+YhASjch60UGs1qZCW4XBpjB74c4vFBmanCzXIpzuksjX+cEGhnnOYGgWSv
	 T/zEoe+1j6j+noaxhmAiD6UQftrtqaeC1wBqlzZ7ko0pKUhR0cPsVomYjTCaLSoq4pr3C
	 oIhaymvudgmqVZxT/uw2IZgQo59lMVkobA+YL/qroZQqoB5M3VBBjZNwwDRSKz4R7BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPZWpA47;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHF0QxJw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DE3606A326
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02DE3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPZWpA47;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHF0QxJw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0VUr2594034
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=; b=KPZWpA47NsnsKB7M
	BuFAPswPdt3wKsOnqRbCHz13jsxlFVR8ZlgWmVchtXGpQaPmWrOCFiGW05+lTzmp
	bkpO46GY9vES14qKi6r0uaNJepLRii7lkqVfeOe+ngkFNfSpX9aOkq5lHfPJHZrR
	LYN9PDMqAadhfsPJHh9SNViLDWL7r6hxUwon4cVK0tLfk3dTae6Gaz7o6L+J/pwL
	AP84Ip2VXpDjwBQXI6nY1Xr65To8Fmer+Y21MRsFIfKRrCy9OuFb4NPa2znA/3Ib
	7bU877ZvtH1ilDSrEJxnAHil2yj3Hf+kOu6a24q0HnTNGYkdKMkhGgQzlSOk0LVK
	Wf2Ucg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksma8tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:03:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd652c0385bso2260454a12.2
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 09:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416638; x=1795021438; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=hHF0QxJwZuJ7C8hrPeJ3xx8z68PZtTmGcZQWdhMrRYCGFEVJnC/ENFFMQpDniqbCl2
         bS7kVYGK9xFP7WJZpNTggslw+T0qI8ZUtokqHVgiBTlGPXBbFcs/Z+I3q0dmN8ytKzkc
         /n8Mk/rFUtahamWo1WDeKRLZ3nn6+Q+LV7PVn0KsoHBZFZBVk+08VxWDhwSiIoP4+gU3
         nrwsNuxIIuRt5M4Tvb5V0vCqTKDM7WhMG8si8U0NgGjHg70+lecA/5tNWZfnFC9eOzE4
         cNSKM+GohIOblBEDxHNBRkAEHr3HRzs7yCb2Ni2W0EB/CRFV3rMdfuH5TowH0hvika1f
         yJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416638; x=1795021438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=KXyU9JfK6P93VRj7W71VXMuwDHhG13ZcUzp4EBYZpMLaUSvJ7hm5UBd8LS3ceixR4E
         yOuRbAqXFDq9bGEOD6OBiDN2YJlq5uukiVsVsxVkKgTNf10qHcrnfw9wZuEOebEJ4RPM
         AImFC8rlfcETYP5C4jbDqQKhp4tbwJljRc5hoco54+M57F7nNhxNNJbAX3v4f0c5V8fj
         Z/QfdDo5g/NU8Us0fdoVM5vxTMthIqxhAQ8VtcpE9nBTJIqLQus9rVyRo3fiaeysoq6G
         ldLCJcHFVT+p2Z1D1AGGGWFICRKkLBvW8ALQ28oE7SCzo82azJdwL3/1Nhu++VUTgSrZ
         2gUA==
X-Forwarded-Encrypted: i=1; AL+hErEtCgll9HO8JZHTT7+bPsKbQSZtO7VCqcdQZwK/Xsklg8UDzhVsCf05eRAjDp0gPDBzgi0=@lists.linux.dev
X-Gm-Message-State: APuU4Z88qCuoEuMX/5Fsu+Ui6LlAqA4H1vFV6bkKv+TLwjvxXYxGn3R7
	9OhX8NPmtRVEXwNE9zhQ91tPbxeHodPhcsAG53HlaKS4UMpphYJERXWLJlqXhTEMLndQlQKe9+9
	RWj2xeE8pjYbXPxhnzsxynvpSIi+XMTcyBOmC0SvSPyAYL/iQ3iDIhZY=
X-Gm-Gg: AYBFou1Qdz4xB4x2/PdRc/gsss28UdYy2HvzSYd7GmAv7Y3bPupX1GHovL7MTlOzze3
	p+cCgD3ri3V1HIfUk5zcraTh+NvZ7ylX6eyhFU/dqZpvvlkJlWM0vQnfYvGPMg5lZO+ro81M46b
	zgfub4s1Nn8rmDE1v8CnsIxnFl4r6td9PcxZFeC7/qo4Wi5B/9VoW21QJoJROI1LAWdeq1p7pfY
	ykFivavoPdPygxmWl/dTUle9LtsrK9LfwCItF9NP82BrzIvqm1f4PoDxerAK7kCiOwzRXcL+swq
	IYDbtoY3rjNsULD38qTVBnC716k6CcyfL6VvBu6vzZw9DiU0UxLXc5ZLyzC/sb6QRl0zfyYVkD2
	1zQxQJjJF2fxoPDswQjD1MIN2/I9PLUEX5RxSH/mY+KkrLm/MyTkWQEE0P1Vp2VgUKxI=
X-Received: by 2002:a17:90b:57ec:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b182f267f4mr3087849a91.26.1794416637488;
        Wed, 11 Nov 2026 09:03:57 -0800 (PST)
X-Received: by 2002:a17:90b:57ec:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b182f267f4mr3087809a91.26.1794416636929;
        Wed, 11 Nov 2026 09:03:56 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:55 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:53 +0530
Subject: [PATCH v4 4/7] mfd: qcom-pm8008: Drop GPIO support
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
Message-Id: <20261111-pm8010_i2c_support-v4-4-4549cab1c8e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=2884;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=+08zcnHr6A7yFclGJxbZHZCi6ixkui2rq8+7R3gOZmU=;
 b=xzvPfdQghclKk0q/pB7QkkPMalyellw/TxY0YjbTIMhwDnvrlZZuKyilv06UzkgTWlHqKNRuY
 SUPnvNock5rAB53CkN+/pRAaCUxIY26LdK098CCexFzYwUq7UwqvUif
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: CHoUN0hhepFXzgDuKYM2Pys36xsQAaqq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX4YZ/6WGnR9xg
 2cacRPM7zTY1inEcg9aTta3+CeUwnDmWZ5WWHwW9odzcpLKkxzBu0f58sUJ6UT6ktR9KMvdZlhA
 7Q0zh7/eO1XdcH1aObRRgh/mPIS6kLtWimddlLy97k5PCfzMGPZESX7/E8itvkMIW5ca0VCX4U8
 cIEm+ul8JAkAuLWrzYF0Qg437RzlU2NPmQBFOEQjVoQsM0s81YaBcADzH5qnVPUE/r4aj2lGSSp
 jYpAqoOpNemP54Nqd7X1mPrZcQfuHAdUyHA2npn48oaHvxvtsZqyTKbIA8AhjupGpYSmItp1DhK
 kx6aLeN2UVNFMLxMBazWEQpH5PjIKuEiYWJ5ddijUcaCDConT+0QPjRAniIUp6Wi+FA9bK8ksYa
 +OndFoFy5ud7DxEsdJMjOCGMZoGu7TJvopSG8BKZ71Cpest+giao6NfRDapXRLJVQBb557P5Q31
 YUC8TPUfUupGa+lUTrA==
X-Proofpoint-ORIG-GUID: CHoUN0hhepFXzgDuKYM2Pys36xsQAaqq
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af49ffe cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX971bWWcFrKdY
 ehmj0Gx+y4gZBsW6PfD5v3UNC3/mtzpXNcqytt5lzvtncpORWkbImQE9DUBawouvIzXQWcW+oBq
 Ws5NJuyDUYbV2QkEx5pMljzcRG8BUbs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

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

