Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416620;
	b=KUZULC/BnjUKCGSdfGnbeEXCm5e/TjGRJWVrXjHZE540glfkimFTEVXR0Wr3py17Nw11
	 +4+QAnUFH6zGd04jLn08+uL2yj0vW+C9EDpz44ulhH4dgukgsEWk8ymVZJlCQkE5IvFb2
	 CVtJlho1kh+FyzG+4lJc4qVb3T/ASwYZ2+t9wkXnWU8eNEJdAsIUMPJT+n18G1N6btjxh
	 +IDrs6nL53LXG7FhdLYCKZVlRbl/wjE2fFmg1ksGIGZ7JAoFdMmQH59QsXsxi2kAcqqj0
	 CC0pMyTwOMha6RhsreK4toHHDDvFyiN+3CILW7aNJ72wASUiZOBTzjkfwvSAL3h7Nzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=scvdcFSlRwzYeABCN533qaNgvp5Uj+PY8Eu5ThokkwyY9zmKBlOzEicjIzyDO1YVV8EX
	 XFejnVz0WCvOWYOeVjgqdU757gycUtpmUMHA0PaqIV2c+HwiW7ar6z/6H+FER2wJ6k5VL
	 OlvrpoR20BlOoaHUEkc3RZ+GFfMVgwrLifWdBlkbI75Gpkiwmld8CSyg1s7pCT7ft8Jwu
	 4L8t1DAs6Buv/0yVqq09o9UDTuvvKB4y9SR/KsHqjI8vRREA2/AUAL7lEH5e+eVzp410o
	 7QeN0jkYhOzN4MV58AcLBO/wImezIfZWmdITobIek8DHoG2JsO+Gqu1TWzZr3eD7GAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J6G2X9ux;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QAC/KoHU";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C65606A334
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C65606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J6G2X9ux;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QAC/KoHU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF04053597117
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=J6G2X9uxxQ1DN+YE
	OCV6FF2EsTQYYEwUQIFFUouS3KYf5NxFRUlyY5SVEuNbgAEXqEchIe73k+JCtjYg
	RY/lhweH8o3igtbK73GmSMPTeMG1td7+gABGjFeOMFk7vBRnRZ+jv3Sp/x+MrTuT
	VGf+OMaQ07gKRnEIv8XhxnbyLMY241lY+TUubxtFv5RkkhoXadolNsnVo6IfjC6w
	fyNK1SwO4MlkteT18dpGUn0Pxgiv7BlX2W7sx1ovRWJBOLl3nAjpfHjzUjhOLqBZ
	gJekKLEIs7qSWg/JfGEhqhZ5ZHftUjfk/7wtRChFj+n3EkE2rvLT2l1LvvBs18j+
	oDw5Tw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u8prq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:03:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso2945910a91.3
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 09:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416617; x=1795021417; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=QAC/KoHU4NYYaKUiYil2nDeh0R5uqcypWl7dKkufyo5q5NWSj+fMZ9Ks/ifjCX5z4J
         eUF2oagvmugtsaDWjpQKAnYkGTjrsmjzrCIIjGtfIUoMsHmY9C9bXVvAwVgkbAYg+GYF
         AyntmFS7CII7ri8c9M9aSei80xNlzUVn15+J1bkpTN7NLXIhS+evYeAnR/gHjnw0fpH9
         gvrpARgeCynVFDHylIvHkqsG9ObMPJE1Gny6MF/uGX0qnkMlosM1+gplbi32IEOxScds
         TPKVhzDEj/ag4vgvwfhspbGeB8R9f5YscZN9s5o7oQnnN/rwjEwmo4lqodX147L3uUzB
         WsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416617; x=1795021417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=D8HswEPdMZyH3VFLR++fg1faFMFGN5xDmTxBNJJWCINlZId5vniIKUd0DsZTxtpCl2
         js4yPtOnt4u3NVePY1Hn299q+frccvBPUgsDN27UCtvCdwrSAvrxpDqBVTJev27GB3Y9
         gYDkBfAQjaYMXoay7yXP1gSV8lTAEl2k6cC804PICEe1GMwWkhYENrVBNY9O6JGdLQbp
         a9wlIablr1L3mRuNiA29xp1u2PjD7oNqxuxE1VU7C9QhWfV4rd3bGACgJf87Aqcaq1o6
         r9nqGlD6fWV+6K2qL4+5f4Ege/qEm/oMZuz2fvt4Dihzz/rD7bqqAtUv3h+1JytTejlA
         Wa6g==
X-Forwarded-Encrypted: i=1; AL+hErHOi7wVjzrZoa4WHiRNx4SIBebJ2jOLhlmySlllt3zQ2j2p5324iYxWZ6vKeP0og6Qb3VA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+JIclg/hUgXcHE551qLmKpBO+Na6iyh+Q1LHv7jvPZ6OmZtYr5
	quHAsXFRNKsbd5Qyzss7V7MFwWg4HAE4L+KEUNJS9FVcDoKsJ/EnGejgueXHVTgzYknPe/RZroD
	Q+uoO12Lyqv9DRBwPMHbaWxYKA/ZVc6nKNaYp1lBDdq1rwF1PXhnFMzk=
X-Gm-Gg: AYBFou3KneylV9hS8MENAKTUGGYrUNYdj1yLjNU3Cam+h2FG4UQ7/pgDBPhuNAp+kjR
	n0sk17LUgofuYWxKkUD++7BbK06SVJTKj1DWVuBPU/NKn15Haw5Fp7oxH8K9s5FmDOSvFgDaEuy
	zxNc8Ga+kDWSNveIsL2vKbIrMPpsAJIJ5of7X+Pfj9WhqaktQKVPbLyXqbFDaQ3A98wGPTuX3YZ
	vaKofB+Yi+PR+klyr0N8BWR7zbvBSiLlcyX76FO58MZqRHhtFtLhUS7gq16/vn/ODlt1g45F0XG
	dYd2gjsOd7bai7FvAJxuI+JfPG5SvtIzV+q7NGeiElWTfdNchotRguhWvN1iCn/SUgGIWW5csmY
	WnXloLSob7Hd/5JmlP+QFh18Ioxo9q6cw67y/RaiVg1orpKtninCRb4Fy8g8frIczKbU=
X-Received: by 2002:a17:90b:3a10:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b182f660f8mr2802000a91.14.1794416617391;
        Wed, 11 Nov 2026 09:03:37 -0800 (PST)
X-Received: by 2002:a17:90b:3a10:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b182f660f8mr2801955a91.14.1794416616847;
        Wed, 11 Nov 2026 09:03:36 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:36 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:50 +0530
Subject: [PATCH v4 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
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
Message-Id: <20261111-pm8010_i2c_support-v4-1-4549cab1c8e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=GJMpxKOfgFElqWzV39z9l90CfE2fgS1uPuTsu08Ouz0/kKKFZ0SnNfwqRAepdTnxxOTzUgNhl
 Z7C8R8Gy0LnCYcd/H7yQfZFQdQldQigDjm5WQr1ZU25GqXRG/PlQ1S6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX09oGW1HfbtOb
 L1PNofNJA8jOzEWM+W0acZSbszz/bAMGckUlbUlzRhoVXMONvSWwqkz4JriMJ2JvM1mP7J/W2nX
 RPDBdTFd64T1552N21cDYHfyfIa51mM=
X-Proofpoint-GUID: xmWdn-MdYBGIBhWoleV-aWJo1pgb9fj5
X-Proofpoint-ORIG-GUID: xmWdn-MdYBGIBhWoleV-aWJo1pgb9fj5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX5Lxtz60I5lNZ
 Z/2TrfiDCcCTrLaZNoRWTkG2bbU13hcMu3wQit9NGxxhuP5JyCpeP+tJX+IdTXqm54MrN0hq9gM
 BH1FaexDTWROJ+hhLQUS3qMMKFWfZAsbFUxaZ7XsbqDmXok+LsvOtMTL3QifgUTcQwPp4mjkWBO
 CZpHhLHhecKXrAcynflZJF754nfNajFZr4ZX4ZKaE0g9w9VktwQmUAE2w50oKihmq1nnBLOtw1W
 KdsGaySZfCXj54pyfAevs4SJIR3oic66/PVlB2kDx0HU1zi80Dsx1YRdLDVHcDCZ8oGoBYZEzlF
 T6loh3sBUA+v4NnVth0pb1QjFm8OY589MlduRBV7v/ndwTrKAxZhySpDWkZwLPMZLxj1Qb0iIou
 cuEyuRAactqTNGQINgH9C9Pg4YDlyf6eS2YI0NJBe+dXvQeCb3QUPyh5cEFJx9y/qmlUAFNiV+4
 OuS9Ts82idBWWPd4+5w==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af49fea cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110067

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

