Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809668;
	b=FjeMEkVhd0rOyX1MJEsbtizaI2GeTeKg2c4utM2PDR9hjs6gfzUB/EAFMAQx9hVLJnuP
	 uxqWLl8guBUpr9zU3tNsQIjV/TfBPEp/78q9EEVsCtUOEOWZXmBIIjvOczdUv1RHDDG37
	 eXS0c7wKHDJ3yjE4ofsNFCmMgalwzk8f39fB1FGHLyFGq+X8oZr5EAetHQjPw2uNBNw/f
	 qM8o9S4cDCS1hrIb+ZZu62zqoSMge4mDhfYTkneBJYAFwaPGm3ytwlEq5leY1ASU7qlvN
	 DVsUQL+QP+cJIWYFBKKr7bOTPl/sCUYlgLvwLIVXIVglCD4D+R85oSUtGSIJdjWTI9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
	b=3f9C6pGCr0dTWqorvnWnKeJvUVmf3V9g0wd4QJW2XRS9CYzmAzNRFpyXQ5mtvrMSrJDi
	 G4mIzuJLg6ksMQvlsR+sPr7Sk/bmgk6725s4e1zIludcee2CN5Bvo/hFuwkrXBdZqiLJm
	 /d7NunBWdqB6go2fEQS9eZ8Ii2iFlMTbsVsfuukofd9umzpXkyUA3NNI6F8RU2PRy8gKg
	 7IK/9P3+f5p72n6U35hEyZyArKythHwGTe6L9knNSVmK1yYDTycy4fwBnwC5nuPBPNbbQ
	 rNWGqSHS64b+GiWiUbS9ufOIeY442PUplFmgY2iNweFrnpoB1uubq31uSay0+ruMfjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OgapWimU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=je52GgvK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617C0606A32A
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 617C0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OgapWimU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=je52GgvK
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Mlih2233705
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=; b=OgapWimUbgAKCYOI
	WMidKLEaimc7JqkRnrHN8neEilUXsYErFV0nuF55SY3raQbm8YqCkbIwvzpmOPGL
	YeSpx90uP6ihjjzADHLdSSPBfy3ldRT9vV+HKRuoJ7o2dhW2byeaok6l85xZHIwf
	Aa1VwgbE6tL3A/LF+96YC8S1Cw5FcolooIk2HW4knwT6VknxAAqlXG3uLOqnmefc
	+B0wnwMcU+8Xb0wfel8PY+b77mYWeloO8bo8k1hIPqQhmIG9hVZhAVxx9Ts7WIuB
	n3Haohw8v+lix+RCedVjJS0/0POmrrD1XOC/qxhQAuGoK5izrpCcGaqSI3Rt/E8b
	M3WaLA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8vydu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:14:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so2772970a91.1
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 22:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809665; x=1795414465; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
        b=je52GgvK0/TzUaZB92NyuGfQLTGqIy6xqqywh5BAedgl1Gicz/tEbXusfZtHEuXRwZ
         IDZT0d2c7Wpqv7E30wRAEq7VeQ8O9XQWhFzZs37yBU+RW8hr3jDf7RlZYvlJgOPQFx6I
         Nvta/ZJuw4FfJrLm5mAw+qhM+J7J16DRV2+DXk5WPvdoZc9U+mkpIMrpU0gW2oJMbMNG
         SWuv0gbXXDlLNXaPGUiyuHek5F3UI+RG3KQNLWkaNznC2RtCMQydLPaZ/ml7bSQk21qf
         BCMHrrtwboMNAcI1iPJAd2VyKoirxEN0mR2j19Rqcxic19KmOo95gWGoDf58PONpfp3O
         4QaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809665; x=1795414465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
        b=Yvyx0PJII31ciZYkNxEe2ZKG3CSA1VfddkI5F0LP+pI41pnXKh8rrlgirKveFJf6QP
         APmeQgG3PJpmkqgwD6d4qDkWo7tX0OhjtEvIig74TnP/WliM50Vdp5o/9VlA4uVAQtLl
         Nq9Li8MbootWAtpHjL3dUYJzLfXga/hyRJ7DU51z4/sVkMvFz4KNfmMzNQA7d1ybWVp4
         RjYyHc0fFPRRylAFwVcJA+VfNRKmELNWdVdz6gXxUn1uqOc3g+zh7xs3+ge6f0NKhE3j
         +kmy75NgEQhsh3lrkPONsSwwUH2lpL+3kVQmWmtqYjofb9qi8e+RSY9OLJ53VzRTsdM2
         REZg==
X-Forwarded-Encrypted: i=1; AL+hErGDrMcjp7yVcTVVjr9JCb+HbBY+dpSUpS2Hww1dpVPz9jjNl/xxbMLtUonpcWYZUkWRojw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+NFiRhlIPcljvKmUxFLPFb37QDwITYI3favDmsUVWmBSZ+H43b
	Wz+HzqTGjMsnVgFvjusS1/VlaGBGT2sUyMSkmtd74punQFwi8MZI4YIjBMT8w8MAgwyp/WztqxC
	BcAWRnRWnQYN3Wu3kzzRQ9BwVvwZ50FnFvcM3Tqg07D5z1aLDF9I+cBE=
X-Gm-Gg: AZFdTZfLDbPnIOU0+0T3XZDvUy+bRjVNM6/O2Meqe5yEXa0a8fBeYvIQ0jiQWtV5fyM
	oK11rRNtPIfSzdSJOfRA0REh1SEbfVf0lm3RVLGxvukfXsKfS82bDcsDC3rm6j0fr5349r+12SR
	CRa+7lWf6szpIw6LdA1vL9qZKqlJ6T83Ol2JHEhpUNHPTZCI/SUSjUUa6rLLrdX7tK/jIxFm+Qg
	BOzD7D05tDJiw526QdvYuE1gBbmH2EOCfrIQIlkxuVxVzahNEAbr1GrkurDyJVVEUexUO2RjkjH
	vYSSOTd5j1fpxomFL0HpqyMXN7Pl1RMnT41n0JjoqQyxQ/hpj7IDP30t84eyrgHanpkc9IKlcVH
	lEUIRV0okYoO99PcoGsZNPjhzYNy1jFyOKvSbW/K5HYj/LGXfyP4xrDa6ZmYx1QagxLVH
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr8719342a91.49.1794809664949;
        Sun, 15 Nov 2026 22:14:24 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr8719319a91.49.1794809664441;
        Sun, 15 Nov 2026 22:14:24 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:24 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:25 +0530
Subject: [PATCH v5 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
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
Message-Id: <20261116-pm8010_i2c_support-v5-7-5626ba17c0fb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=4405;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=EfuTwFmhnLDuS09J9v0oeKJL4sbTdb1eqdg7aPMRmLk=;
 b=OEJXp9gJIgC0dnPTSo3KyclUz9p2h480OeYiZshte1kpbiYf+tHX/glu5qKYRAIABK0GiZcBP
 WGDp/gNihrDAfDgxpNyKDcjxIIlak3AKNxRmt5uAkk0JYEXPkzOMNGX
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6afa9f42 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lbcZtXRpr0qBkvjFNboA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX2/K8W4D8zOyx
 EBPhrF3Zh45gWvAlEjiIUU25ywhsLV9MFbxr0PulIWB0v6MNDmbvOU/9JkOnH6WDFycKyXH1ZZB
 GdrSwKmBxZnuUfoOtbOKQ0bHP62oq6c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX5UCx7AmA12hA
 CSyitT5Brx7Qul8beYTXrEsYaz9ivNf8Zg1NFwLEP/2MZsI1MyPQmm6ZVTXfklDNvhMbAOIS83F
 BY19zPegL7/acTrfBMZQnAm5JfPo8ERhOoCW9FZUgx6HzAs8I5vDKp5+8oDx1ofBM6ljMZLpFEw
 LYY2oBqtFR2r1oWEKFO0dtkEdnHXp3AFtClRmss3WTQ2/h5sKwnv/3HRMmyD7QA5uyXojvmY96y
 9A6LRAu7GSWCU/IE3V0izObTXPluHza9oDNP3AVe9+S4sb/B8KaNVy7WvgrklEMXF0y2qc0nJYl
 kCGcvU9e0MdhV3xPyAa2h39uLnI6hxdDxEZU2WUwuZUbIvlzKiTYxCG8K3udPNCml7l5PsIUBsg
 ENSVpc0QEqQuZne1yKwPVgDEcrOhXQBrwOA9mNm7FFbt2LRiQE7WYnRIbCVqzhGFUf2dcBgCQ7Z
 cE0gVS6kdroae/NwVKg==
X-Proofpoint-ORIG-GUID: ARwYQZ9EqaoS_2eyb42o_5XrijfM41z7
X-Proofpoint-GUID: ARwYQZ9EqaoS_2eyb42o_5XrijfM41z7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is often wired up with the interrupt pin tied to ground. Only
register the IRQ infrastructure if we have a parent irq.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
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

