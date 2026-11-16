Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809630;
	b=0/Q/cXCDoIHMbXgUkUFBeqwiqSnOeYTVS1YeL4f8ScLNDLq6xxp/5AO4U+qSJpXvHGjp
	 3GclmAVY7M/mOxSPFOy7I4yck1r2XZKzT46/ZguOlr6Hg3R/4BbA6PifwV6L8ff8BCVpy
	 Kt8dWUxqX1rIVVM3bysyL2UHMX8uRKgAxBdWn+36ip4rr06MejBHvlU/4Hhy8oRLEhRVO
	 vtKcKnP0L8CddqxpUAhpUewZ+Q36B/FFbqYy3VIRLEozUlEhHeY1+L+BUB/ZbYPXnKiHy
	 BRpmhCOQv7ncxyg82epLvMjqvmRYgs33PelMqKc0Lok71kgVbOF2c3W9tfci28nA3gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=gjaoe28tE4U9f6QXRm0+o5jajhKetZ7I980XRyhgrmKCu1ztotzazFpxrt2spy3WFZjb
	 JppwTcbolCnOeK1aRAfSMDYbQ/jb2G0kaqRY53Yu9JCXO4BxUeuWNYlj/uAAbvleaw9kz
	 itasmr8Zvrz6OwRUc8Qtg1uG76qsXSDXFeein6qlfUPJxQdF2sNdXUxfoxy4vacz9xrz9
	 Tek0oTT1eOWGoPtA5g5TeACiLxKAdjW6LS+uhtx4F5KElsHCtTwi13wV0vVe/wDmyNB0f
	 CC0BfnmPI754WRlCLE7n8OCCkwVxlmGuYSwjThyCpFGF0pN5w575i3g7e8rjgUc0Y5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzqCNZY+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RzaV8l2h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C18F606A337
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C18F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzqCNZY+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RzaV8l2h
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5M3xp3177646
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=gzqCNZY+70YgH5UL
	APxg9Ni92XafCbPxwKXlw02fsH+5579YKYJH+Yy+l+NbD6943WlA5xYwMqHA0nOa
	J88yWLSY21PgSMU+CmIuVGr075SBh6HIe1S9hEGVCh2nDgNFOMYKNq3Lcq8Q8Xee
	DyliXAGqdYo0qrtN0GTr1wg+TnIowlcM1pXo5FDrsnUrxVMhw41sZnXwOZ71r6pq
	pE659skkP6mceH7TLfuHZLEoRFbxMQ+o/M7Eo0FLUArPURrdFWQuAZfpM0XTTr1S
	c4i6aMops/CHwF5eJkuciNhyNb2aOwUOE1XAMv2lqzl0Rhp16PNT/NSk9P0Wedru
	9BgiMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcd113-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:13:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso1765946a91.2
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 22:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809629; x=1795414429; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=RzaV8l2hPfypKsdd2xi/75fIRfV3dtKVrrg8rRHDhQE6EeakBDu6hQ+aWj9EMmR0Ld
         hfpP7TWAAWDRmph4EvU9C3M0rqQWT0iyjZ3uGXrKfQExf+Ppsy0zRLtgZCmUEWQG9CZP
         Agx+OdiZynQISHoayi+y7VyPoN4LTcledddNkCJnKhGAcofCMmazTGcQp5US8djMwGB+
         xtA4i1F9ld0R4yfjWgQwU4M+tvHgxn+HqRw75P3Hs4xhmGEEBvf4I2Y3AfdUBXK5JWom
         BdH33E+djtkSN9h5gf+/yB/+Qyep5Ury8hCwKh4i23+9GqKcgwfIKsLlb0OYDyUtDlWI
         UTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809629; x=1795414429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=rUujjwmiZEbOZBi5D7dYo/XsAEReQZaYPOLbqFB/ZeT9in2M1I6iUwedbDeNyZpscK
         SPL0ifSCq6phCIZspTUpeDPv5rWM2tKMpd1zOlRpwkmQZ7lzhVHu1PgSbZVCaoy/H7tg
         SaATy3gUR6vo6Cr8sj2nBKeOXh5UqP9hYhM1zPqMs8FsdxugfdKa7PxUuOXWbeXOHacr
         RX9bjT0HindN8g+QH0kvVMM+CCv1Tn9Srovt9y6qP3iAn0Wn7rpcY95GXkmpGs0t7VFD
         0XRT5NU83hw+Mg2fezE3v8C5KCcd5UlD6/PD5LDP28VVPxXrApCZaQoQBaa/Q1R6qjoL
         6KzQ==
X-Forwarded-Encrypted: i=1; AL+hErGlStxRzVRR6HrijL3vgULM/ZaE+z4V3Rav/OhDD8eKMUj6jJYHRBMJoPjQRaU7voBLfLg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/gjJOFI8lZxbntDKY3Z4JJTl7pwfucLACIL6nai85hFKNLRiCf
	wUD9PZB3q/2j4BQqdP2li0qm2E+qJdhnYbgEM+raJD/R1Z/gJsM19yJgOHIfga6qZ1UUYEipkTJ
	ZKPMKYNwvKn3Vtcd32FFBxF8zYlZ4csvTNKlUsOqEUOLPB9J7Jji/auE=
X-Gm-Gg: AZFdTZfLHcybsZ7dO2XYsIx4wEtbjgY0KfENRnj9GJqepYxFexpj1QGnow37/DA1ici
	4OoJBvfByk4oN8n3AELzbI8nSWLMwOjT/YVo9uwB75gL92t9Whm/JmHj9aj+U9e5rs4eoM5TnYW
	CHqcfXC8hsTUWp9ZPntwKKZc41XvTeQI2jcHo+/4AdqaHoUVVsJchpzYm3+1d2RnGLdRR9gSo7R
	FH9Cgu1p0tfduLjsc2HjyYhQSLeFcGdDY+QJP//D1b0QfYCiRlyA4jmGss8ZBYJFq0K5b2tQMJo
	JKG7itGzIefYsLVkF9jkNPwhQLOAtMi0NvbMbrGtss3iU4DpU0hgJ2ayTRt6pwAmG7RcVlXXhHB
	IlYselJ6fIEW31UgqDMkOryR32X70WNVoWhzerJ0oRUDU9B8xkn7wlAuhVLF5fD9jWHKC
X-Received: by 2002:a17:90a:c110:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3b1b0ccda1emr7899431a91.65.1794809629019;
        Sun, 15 Nov 2026 22:13:49 -0800 (PST)
X-Received: by 2002:a17:90a:c110:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3b1b0ccda1emr7899415a91.65.1794809628569;
        Sun, 15 Nov 2026 22:13:48 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:13:48 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:19 +0530
Subject: [PATCH v5 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
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
Message-Id: <20261116-pm8010_i2c_support-v5-1-5626ba17c0fb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=7xM5Y8xIR4/FK1WeNmeNY9E1yBIcjZe0Km8gqzVoExW414OwNCCbM3w/seI2PWz4BGHC/D2vW
 D/VN9SqmI87Bu6db953jrVnPy8unrYsdxuZuQmB2YKNoPH80l6DHfaE
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXwz0GGiD0y6xV
 JdYcDTGpxY+v3Ixky5hQNnkoNziT3LoI37KZ+3FpmfVUkNcPgmXKvkFW1oZiS8Y5cWsxOraIm+t
 /B1l3cWqli3jGULxzhvfZqqOeL28oRo=
X-Proofpoint-ORIG-GUID: GlCIYZOJxOYyzro4Ca7k3KzzM2KHZN-G
X-Proofpoint-GUID: GlCIYZOJxOYyzro4Ca7k3KzzM2KHZN-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX3RW9Pa3P5vOJ
 /pWARrNmDRZw0Ri47UuUsEIlJRbcPdPpGWWH6x8gwVjZiP0giFdZ9keEdy89nRoXUXXG4Vbwzid
 6Yc2ZzTA/yq1pdEMOoU9c+mXBN5horDLAKgONcqVZQkMl4eVpZZQ9xgJ8WhoMdgB1WFRZfAINor
 r8FCP6WR910uONH+fhztgerV+H1ApjeMqZA3NC8uBn5eD9f294KVNfyiVNGo2uri2LMrBRkJw/G
 mdi6kly5/BaTuHBzTxg1MvYSLWCiLA7u1xZd+bNjlBKi0U8JewH7wT936Xz48GHlCPlDJWz3qsH
 xS1btna7ToHgQotARrtfjzErJyllsoELuppFi0nImaUJ0MH7YkKhsUqrQQ59AdepHIYV+pMQP/S
 5p9BVeGsf2Mhmi5n2xGVZZxqLRBZQ9ru3ZRbZgrZyLV5ob5rZVzWEpnmWRROu84Wb+NMuBvb9SF
 E5Ifqh7QUS82+cDmivg==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afa9f1d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

