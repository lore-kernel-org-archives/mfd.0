Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5604450B8D0
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749843; cv=none; b=XS7xQvMmfmtBO+3iaD9xm2Xt9NxpS3xUUfSGblJsapVKCzJtAp//dSvJQpkMzdNo9jkcdpz1WeuIM0qjzkPH/pDgILgJIFRZqdUvj8xEEDe+MCoIVMbDpE6mTYLgB1qxvOvxoPfJYY/2c8BHe44F5oAVgE6+Aoef/wXHkWZ8s44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749843; c=relaxed/simple;
	bh=6TuCysntbWLZmZYplZzvcQ89wL4jyvz1jjtnZ5NVDWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cb/P3sEIAAtS2e1+Opq7Fw0Cf+sgOpIELrGY1iB0F+hZEjm/n6clujqrNBjghBek3RMY73PqZx60iuCO1t4xlTpx66uwo2TC4ey8dTDCXCZU1cq2tdkdCBxPaz3XMINUDbTj9vrXs07l1LSq57J6395rTWAVEVUtSSdg8/ZO2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUQVLWrx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyXcfQok; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUQVLWrx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyXcfQok"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOReR215498
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rHc3jmH9501s499HUccFgDkBbylj+aDs/1Ow3J+YeoQ=; b=eUQVLWrxH/vxOiFR
	Utcpiy7vgRH4cynfrDTBcPDzOXok4CPTr5yj1lpzrcCESdMkAN3Who1uCr8EYoei
	WSaMep20zluJ8nD7fQNMn6iAeLst5eW2ViQ49su7k7MohuSMwuI8/+DVevVJJwlZ
	W2uyvAC/6pGIm0kBqEhtBMOE8K/Fpr5pp59ZPSxcMpMt0FR2lqPVwnUiTTr+JYjb
	a3jMIS2xygtan5eF1qWojJDf//zLGNp67cxZ97LgvGgBdxPbYF2gAHS+zywwsG/O
	8ilMBdqnvog5FKNj/fuL8y8nBmCH8cLX+Ks1qzxm9b6lXX9dxdYh+2HgAKS2GQ5I
	paZ0rw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdv6ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:44:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so22695865ad.1
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789749840; x=1790354640; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHc3jmH9501s499HUccFgDkBbylj+aDs/1Ow3J+YeoQ=;
        b=RyXcfQok7AljZDyxw32NmIIAut4M62BulhL/MTNAANXqIuZ2/LwH2hDuTFVitz0JN2
         fqGVhqaft2TV39OKG6IGcM7xHBU71Q6o5bpCPDzERhLb0gmeec8tbNcsXo7uR9nwccWd
         EXPOXo56p2ow3H6ZOZdkc1wwe1jnMb/zhGSjghmWL8Swov094mF0gtdnej5mAQmjMONN
         snZGDjjSVgLVWJrHKcZh+qzdyrH9B44OUa2/47hE8jWonfz9MDU48NN82llI7zVywkqc
         2DN/RPtZAko9mqGknagcA7n5U0jy+jVB8T97rKVXiteiaXm4BrUoNA/agV0leub/a5JN
         WzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749840; x=1790354640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHc3jmH9501s499HUccFgDkBbylj+aDs/1Ow3J+YeoQ=;
        b=ao/vCISxpOvt1vRHm36jg8lA+k0PmV2pHs9JBrAFN05LTTln4KchlwcvX94epjYn/Q
         i6fgw+iPmRbNea0NfdQsrGjhnbJf0vcSmMblFpZMK7/G3kM5gadAhGKjKndHW7ZAXxRs
         eF5LKY/pcOfNxAyPKwpULg22CMA5uwmZdTuMBkJKJZVs4B00Ln2DaQaS1jW68/tyZbbH
         UTkjYSBwlv68PTaT7pZtAZ6FpOi6DCXARhPL7KeZjEpvTnI8J3m30WIfzQZdGGgXUX9W
         NzgmQWbpakRakAQDMQG1iCQGXM+VtCPllsf/wy1GSe1smtPP4rsN9aiS/dBkU4qn9IQV
         SxWw==
X-Forwarded-Encrypted: i=1; AKwUvBxrVAot929s/FFqb3FbMVIgVL3VHt7FOICpN63uZoO3ux/Twhq+vVJABtFN/2+6gkyYOG0=@lists.linux.dev
X-Gm-Message-State: AFuF++m8818Fj5GMhPdCZcQcM4RRr17OPIwEq0FyLu40k/72bY7bPFV8
	2cxmIEb5CfsGabxpVlKI2DSBsb4vlEtp5s5tsn/FF1x3tl2wA8eDUPyDCW3ySIml5zEWzu7tFiv
	O9u/GhrDDA856m3BuTjXhuEEIxD0HRJyBGG5plxUWWbccypNKmMV4dGk=
X-Gm-Gg: AYBFou2le50dWg3AJd4TQzuP9yuuHQMlp9E/ye9stPMcCCrSZqWSaOHb9PozkwXADkS
	dpJnWRwgRemD1fllVRFncHDymJjXflcxQzUjYL9zaoW6EYc0mvSuhJaOSG9farT50sEHbDhrrxx
	G5uOxNisQsA2GvP2QZhe4ZLa5/ROGLeBPnCDZSZhSGS5AOnhspAMUE+xoie0QNPYeFS54yG8nNb
	NUu9HIONDYaz44EzjWg+JHRBXBmXKUYG4nch0y6SAHAzu1hBPMTS47FUNmOPeVP210Q2E2yi4Le
	Wj/BzDEHF8toGvB/INX1GvS+3dvr6UbxiCkG1P2qjC6GacJ9dEwTG5OyeqfZk1BCNzUrrDpWpkK
	miEhWWDRX77c+NzTGKg==
X-Received: by 2002:a17:902:dac5:b0:2dd:c100:2519 with SMTP id d9443c01a7336-2ddc10025bamr2589725ad.34.1789749839445;
        Fri, 18 Sep 2026 09:43:59 -0700 (PDT)
X-Received: by 2002:a17:902:dac5:b0:2dd:c100:2519 with SMTP id d9443c01a7336-2ddc10025bamr2589465ad.34.1789749838928;
        Fri, 18 Sep 2026 09:43:58 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb754e390sm11161895ad.32.2026.09.18.09.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:43:58 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 22:12:50 +0530
Subject: [PATCH 6/6] mfd: qcom-pm8008: Tolerate missing interrupt
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789749799; l=2909;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=5Yca1qyIZcBlbgpfZoFyilYL65XMLuzCTJFN98C2W+o=;
 b=ncxS/vdpTtWyvH8/mj8iVyzXI2Z9etz9JDpGrrZHRLP/dovy3yLv2nHa5TftnMc/wu1QPxDr6
 w0hbGIf+EW7B89ULsIJ88ywvTydtMgoGfduBqYLZIJFrgnQURGdMAXU
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX9IjL/wFsyott
 saqvaHMga+P1uwHIP9VnISiqxB9E2/UXn3i2qYXzq2oEoux1P3X5mLnapi241w8XQgAHm2lI+PQ
 1oPiCFXbuy70hZ/Vfy0HBcNPWtdvfEWcM8PvY2XKMveSZ4aRS5i1LIZm5Actoa3CW5p1u3cuSD/
 DThG6aFimEImPVhcovg+zI0V3M6oLCqQaSvfkxcEis3JzKPzxZBQjrxj2QcQbkRDsHLYpG2GfsB
 9dqFUDcCZP/qD706dDVXmbOdFxAanmUOMtR1BPK4K5DLunrBydjkCDF+Yr9PhiesmJjsRlIPTXh
 BghFrO09yA7iZ5hGIJy0c6WrlB88S+v2oThArEXy4ijhdip8dvQvkEt9ApYaDlYk6sb+JYa1F6M
 lYP+r0TqD1nKKD9g2jjsMWgi60zGS8pwV/z0u/wMCEwRKBRqiU1EeNPrWn58wGSYWuLL4UgaIlL
 I6h0W9DDJACLNUtxyjg==
X-Proofpoint-ORIG-GUID: osLn53Fze7chDOISsISkcV4IL3wIFj44
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIzOCBTYWx0ZWRfX6oM1G121aQlc
 XrXjw3OOMvME6hYj8zOzqQKjTDfcsMRyAHZ/HFtUg+hxOgrmrMoxtlmW3O+HflWGIP3BJ1j7rsY
 vRIbxBajin59tX1pjHob/owUEgnerHg=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aad6a50 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mZ3i9vGqhTwK5z6FwQYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: osLn53Fze7chDOISsISkcV4IL3wIFj44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180238

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is often wired up with the interrupt pin tied to ground. Only
register the IRQ infrastructure if we have a parent irq.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index ed656f0d6df2..77e4f6c04ac7 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -233,7 +233,7 @@ static void devm_irq_domain_fwnode_release(void *data)
 
 static int pm8008_probe(struct i2c_client *client)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct regmap_irq_chip_data *irq_data = NULL;
 	const struct pm8008_match_data *data;
 	struct device *dev = &client->dev;
 	struct regmap *regmap, *regmap2;
@@ -277,33 +277,36 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
+	if (client->irq) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+		if (!name)
+			return -ENOMEM;
 
-	name = strreplace(name, '/', ':');
+		name = strreplace(name, '/', ':');
 
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
+		fwnode = irq_domain_alloc_named_fwnode(name);
+		if (!fwnode)
+			return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
+		ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+		if (ret)
+			return ret;
 
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, data->irq_chip_desc, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
-	}
+		ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
+						      IRQF_SHARED, 0, data->irq_chip_desc,
+						      &irq_data);
+		if (ret) {
+			dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+			return ret;
+		}
 
-	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
+		/* Needed by GPIO driver. */
+		dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
+	}
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, data->mfd_cells,
-				data->num_mfd_cells, NULL, 0,
-				regmap_irq_get_domain(irq_data));
+				    data->num_mfd_cells, NULL, 0,
+				    regmap_irq_get_domain(irq_data));
 }
 
 static const struct pm8008_match_data pm8008_data = {

-- 
2.43.0

