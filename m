Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C057547010F
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658653; cv=none; b=akq1mOSMDzP0Dq4+LrKSFrY5QVD4vwgXOD2lVOukCQzB1S3D0r9tY/T/5dvUDzFny2p8OcqtttF2Mj5pNFzWH6wtj2fZZvkglZvs8jyXOMfmOPmezyXy2999MLW29WRkHZYJNDJ9lnBBpGvvBWPcNYqOewt6Mchcdl6QTCiU0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658653; c=relaxed/simple;
	bh=H94/inAPZ8P/ZuuhEqEPGYgD3pDZYRADPr5JsO3iDc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oADr6UOW1QvtMs/AvndvsFt6RaxA1HRh2ykE+COKfLzoVSgSIvxPiWJuznCE6EnTNuraWsUXuWOeLSQqwpzE6eYjsKjkokgN0BD2sstKSvn9oQUBpct7VkCOCTlzsD6Uhi0pc0hn7OuAIiMH5rWxtE6gUofpVzOsWxmqYx+0th0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJSB+iAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOJ7hblA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJSB+iAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOJ7hblA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2bcu2160291
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wZug5Wj4+u0tw4RxYDnOPHsHnRbpbC3OCpWe5rywdLQ=; b=VJSB+iAGHSkG9vmK
	1imimK6WdHsWX7LF/+clW1LUaLjWK1t+p93ei1eNiGT9S4RH6J+aJ8VjQD5ETg7f
	93n+XGT7kIGNeDeXX7t0Un0M1z2oAZruuuksZB6JkvA9sArDRbAaPfmbpph2/iFt
	xqTU+rTrH9gzfVAYt3rxSHMxtHPkfxjPFEZXrxoGdf0+9EJDMO/ciWg2Hg6uSMEf
	U7gg19xC0cBJ20UyiFoh7n/9oQ1s7pMKCNWJ+XlciUJf9S3/iARAOBeIUMgAmvxJ
	upiu4Dh/AYPG54azbGLnSorgo804X+5+FYm+x2R9KRSGFAeeNRJwzrr+zXjiJcf6
	Zxm4Aw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41jw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so227202155ad.1
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 11:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658650; x=1785263450; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZug5Wj4+u0tw4RxYDnOPHsHnRbpbC3OCpWe5rywdLQ=;
        b=YOJ7hblAzE80bwQSATbJLd1p000u3u9tqTsqxur+KX3gIZc5EfvmQvVmDMXntvb9I0
         fokZH2EygxLnq6mO2J1Xz8tqxLYgcrwCjLTkD9f9xWGwJxhRljnMQbxsWjOq/VYWaePB
         AcZHfkOasU9SC1SB2q0YjkvbwHuJfyDvqu1hI5IIEUW7hmRqJfy3gmErRcTeLBPDjMbz
         jNiQZeIgkO3WK7KPqM+tyAjBS1DQLUx7uhW+fRzPv5wnhz0r8yT7mJiCX8THaDgjHF/4
         T6MMy1H5KLT5SqhZ4rSw7bXJ50OUKVidwvktrvtMCVE/R38UwUlXKPPt1AbM3j5HggM0
         WRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658650; x=1785263450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZug5Wj4+u0tw4RxYDnOPHsHnRbpbC3OCpWe5rywdLQ=;
        b=FBqXkZW5JIyyUjB9eub8BOd5SLGIRfebp/I78x/61xjLG7XTHm3S5WhC2jrNqFomYJ
         hpLLB2E9l/fuGMruPOiqvxQv1qivgwCzthZqnz4DhngN5iwlxcJWbnHjMxV5rYCtAH8Q
         4GLr25bX/+We3W4N+c800nK/ND94RVhrvtT/xg3Xl+zlwGkubRviyZ9fV/gWk5wl2jv4
         T4JPKdyMeRwDCLqthbcBhRjZ+cuxymmV/Ek/H/qPAYX8oK5xsbKDc9EKy+/wLh6u73jt
         F9wLRgUm5oIWdvLaDI5aPc1CNOnPxMM8QGONUU+L/tyZ7L/O6CIFOZS2tuc4+Y90cUkO
         LU0A==
X-Forwarded-Encrypted: i=1; AHgh+Rpmtejw5zDNaiHXo+M+XPqeWQTn88KdoQYeBT/OQXmqD4kU20QbASaAG63iBjV2H4NO8cU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbpf80BfMU5B7HYxNr8C1XEDVXtUzfMkY/xMpqhdyD5Mp/yOW2
	f1x1lFPryDsf2ItIegHkfXsk+3pvBcYA1Zh+K6mhuMAdj6HDzRnABwzfW/ON6ANHkFRXwsovsY8
	nt5UqfQz+pu5m0tVuFdyebuuPNSzlaiJPx66BQt7Qs19Ll2k3mNpz5CQ=
X-Gm-Gg: AR+sD10CJ0G50sbWk7hKCBE+nK8Ri1JfdepOIV5zySfQEcEPKravXe+yuakv+LHYh6W
	3zBigcatOaqpk9y3gs8IiDW/OSsJPGsXfsbGLpGWErctcF6HKebkwe3uWfwwSfIxfUuRvDCfXyJ
	LWrnoL5DgueT25B81V96WcIxTos7zwpIdt/GTUQMOtjnJgzQF3egsfLpBk/KI4dSb+wcOHjNuHh
	IJ9aAvO4rLNMTped5AXWzodtBoGHgbqNnKaBdMKwO0xLBSleSqjoIjJWL9a0EECbeLI1aAHTuXg
	m2WQ/wa+aABHIGbuNhz4m4m4ECQkay9JmTQYx1HqQHguJ+n6fXf1B4hIu4mSuUnGQrvQG7Wytce
	M0AJjOnmpKeaE2Y9lJ7NFw/yyaSTkw3qAzMY=
X-Received: by 2002:a17:903:1252:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2cf34868711mr212180125ad.18.1784658650329;
        Tue, 21 Jul 2026 11:30:50 -0700 (PDT)
X-Received: by 2002:a17:903:1252:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2cf34868711mr212179415ad.18.1784658649640;
        Tue, 21 Jul 2026 11:30:49 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:49 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:11 +0530
Subject: [PATCH v2 06/10] arm64: dts: qcom: pmh0101: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-6-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1072;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=H94/inAPZ8P/ZuuhEqEPGYgD3pDZYRADPr5JsO3iDc4=;
 b=6CRUu+qU6LL/Z1uOzr8L6TbO2BvoSl0Le4V4+HtUCc58Yg5RGVKZgCiTfqsH4+bnrJ5Zqpfca
 KzoMwVPsr41D9RA+lzp9Wmjl6eD1bGDGpj65GNJJmX900eIsxtD8PYo
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fbadb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: iNhKuQAWP8xS6gT4TsUeUxwFCvPtl-vx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX2JA9hi66fjYc
 E4b/2f317A7Zp0cLwEg0czmRsJQqfNVmEF3pDl7+2bKE89zA/iOJkp3+FLPeRj5VqAYpYwdGSm9
 dwRE09a/m0m2qZ4KIvR9+llqoJ4VeSVCAzQ1aqSSEvrlh2ifOT8XZQtZJzO0iVni7kowTc9UdsX
 /Xe/As17OnqsiVI4bAoALjENqlCvoxwdmmdrPDUHC3TFc3fZS9YDmClI5Tl6Yz9MLoQq3Iv4MoT
 nSkEE8a9c+pLZ24LAYMi3Jh8bqF6jwLHZBNrvfNnkp/dFVQCPndojiuA6Lo0/LCiOOw6bftN8e0
 qCrj7KpjsJUwfC+WGtwQaxrIiqTHvy8azC694Tv1aRWHfnER2T8G6hw/5pkYDyuRRozBZGdPEUL
 GsE6ah8CnofVcG8a/BFvqNrOlhmlqAwV439ov7vGD2dk/YykSkjnJZWSy9HgA0hnfybDuNrY0ys
 LLnQphfPZi3dotOCjtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX+IdBsFGT2ypL
 4af63vyhCR5b25ts238qxeFmLmaFwpZwlK4tw1hsWZycQhF3oxgaU7IfsMoJme0RPoMp/5Augin
 BsoON7HsGR4vS7VMZbuIgV6X0trGn5U=
X-Proofpoint-GUID: iNhKuQAWP8xS6gT4TsUeUxwFCvPtl-vx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..fd632b592d2e 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,15 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

