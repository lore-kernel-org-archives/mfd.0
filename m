Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771AB331A63
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974003; cv=none; b=XQaxiBbIzf3M3ELCdnMjX8Lt8stO2NImlPEce6GQeDtXHIsX0j7N8nVrQGn+EVrvfqt9M+mPSfgaH7n9b9s4FfHJziXkZ38EuIJgvsAjlUgyjFenPyIW7z3Ip7wUsYZhZRyyHh0Wswyfz5ZurJ2f4MAKKrTT+YyoZuas9MokTSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974003; c=relaxed/simple;
	bh=E1utwtM+9xfu0wAoL5Jq4kOxv3d1O4mZd1NbXefGSFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnCEUhcrbqDQ/nLQcKClEnYor53mP0TcrLPV6r3MytWY/t1LSOCZR82dfoweVclVJFiRHnZRcz3jsOQCxy7999U8OT3ebABmGeq2lcVo0y/a+SmxzodKzXMi4c6H2VyNLJ2KwG5UtkXfHdDl+35wxiIxE8Dlo6cpdosELWQH3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkaYTqjI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHCvfrGC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkaYTqjI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHCvfrGC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9SxwF2222087
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtr2Vz505wIMdoHQaprWux0Mkt+8M6LC83n2xZdQ1mY=; b=SkaYTqjIl6Om7vOQ
	NLzCNbn41+EewaNfS5dhpQpG+3TFm7+Ta7BdZyQwOpZBAomnBAOPphEL8qDZqd/n
	/ws3qVBBtQA6Eer+DTZ8TKAQrCkl7vF349bXv92hBb1vXmvr9ta/1gEyx9mJenq6
	Y6/6xXZWV9rG9IYYRDclgUGPa97rHKrRAl9DSKAohrnqjCDVI4/aEBOpL610bLt5
	OfE7QCC2n4AJS0MHL55IwyN+XHGxMAhoI3hcx5Th7ulZf4luCGy9s1yUoPoxb/HK
	ZDgF/n6GAWchhB/jiOrXsjlGomAKd0q/6Uq1SYWBeZATnTCJCnlFPAsmvYAJAc2n
	mTgYtA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsb5j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:33:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so1022017a12.1
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 03:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974000; x=1792578800; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtr2Vz505wIMdoHQaprWux0Mkt+8M6LC83n2xZdQ1mY=;
        b=AHCvfrGCTp+/6EJlP+7cThUDQOR3uczEt+Cil0auo4TZZndDjK/b0/CjQ1380WbWI4
         Tb+ETwgK/ExO13QDFq9cXwVoZSHfsAfx4jmDr+Owb9RhxXxZj+NJPhmMdrnTqnUF5T7D
         Xjco2A5UNXMfe/r4SyaozUHTdpIorYrBoTt5BO5DOYZIN7RkXgOLpnJnwWwzVZzVI/Dn
         xWgIgT9gBtSogj5yAufXnz/VYJ5oUYsu4dBAWzxPslgjyGErreJaoGHKaX1xr4i7da2i
         wbnCn/R9Vw+8w5KDVa8/OpNRjWgHH4Ay2LCmKY21wiFP22+NwpJkICcXMH+3Z88+exGr
         bDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974000; x=1792578800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtr2Vz505wIMdoHQaprWux0Mkt+8M6LC83n2xZdQ1mY=;
        b=CM0oTu9YHdx0zJYeVmwpp4dGL03xQx2i1LaV47Xwc0ZBCLwB2XinAMEDsS9OtD05nE
         AvEypRxNe7fwhYLbvrbfQe0omuw+tz0iYrJvDsBjFN82+bf5mICBN4pjx1NLNOJYAAkc
         cn7vAME08JxjeGynklDOoBaUl1Nl/LrBlAnyeeAayyR/HW4NguVjGw0REhPJ14WhFZxy
         UOKHJmYBjiILn79n72YKrBDSzWeNnWvRaLLk2QVLL7qGYbFRikTWGuRu5P7EQXH8o9RX
         6fI4BewO3mVQpVbu57in9aHjGPL5Wv1dVLGyblRUzUmLP/NVul7/+qdgEoi79hxXenDm
         gJjA==
X-Forwarded-Encrypted: i=1; AKwUvBzowhFVBFZbRsti5CCxhXNxm+Zi4cT26mz9emgCQrTK9Xn5wplXGe7g+ycCCfKr2PHmzD8=@lists.linux.dev
X-Gm-Message-State: AFq9FYKJOlbkMm2NcmmB45xNeZ9joVL957HqnHoKK+jpasShzOLfY7IJ
	47iQ+qopngtHIT1+waUFC2KjaMzCEPshA9P73vgsfsOB9SwslU+INDtoCj9/pqBqyqcO948HK/M
	BOwa+B+j29O5J5p7ANH3daTsQ9Groee5mzNEnev46TJ2EOc2zk7FoxWxvh1vkpOA=
X-Gm-Gg: AYBFou3L9AsUgrbkdIC95Y6xYsMTl7uiZE9nhkGKG4eSOzc+V38JbvPDDEiKLHriRtr
	umS4pMs3TutOmB0Qrud8uN4k7y5G4GlcsCSueD12O6oTwEnVeXsy1O6zBYf+MZIzmboJ2rjWE0N
	VGIewStWTncvAfxpdEcgSGFh+2VqUfsTs4wcNaEK1luDurV0Bi5THSl9muEHmmChz2SXqRNRkPg
	Lo0VErAEsAb5OvH6on+m0i5lM69Aek2t+oFKqphvQxFYKFQRctFKxc9h18MHoucER3pqtD4zga8
	FXDTUNRAuCTaFchUR2hBixXp1prmGg2k8nShXGkBau/5+Vgh2o2TRYyySEpn5sAacKO4H5745mi
	GR9Klo3uUHGHjmzguHk8=
X-Received: by 2002:a05:6a20:258a:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e16be9393fmr15128410637.43.1791973999822;
        Wed, 14 Oct 2026 03:33:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:258a:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e16be9393fmr15128388637.43.1791973999368;
        Wed, 14 Oct 2026 03:33:19 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:18 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:01:58 +0530
Subject: [PATCH v2 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-1-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=1096;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=CUxmQUD/PG7wnt1bvBU26lSkBk6rZQggZHbUKFVLQ/o=;
 b=fqdRgIjmzsA9rrqONBMMoHbp1KjDDuQya/5/10u/pKDYBqm1/sZ3UpKNUEXOlN51eWuhCox16
 fEESa7MokZfD3GzocXTchjBs9wmm4OosNHk+Rx3+lmNwsNO/pHuXN0S
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX42FGbqcgi+nJ
 5pZpMN2N4Q5xYYlJwU2HSKkUMjwp1Nt43wcxt5ktiJfQN6cdrxz93epcGpRF1BvHL+hFLrmZM3/
 97HmhiMNC7bo34OC0zHle0XQ/gWx/QoJMZDoIGzWt1ukG5zdxI70pjczDqCAD6/FPSeg9G9jlfY
 GZ9lVqEb+VW454zK481JgCkoMXajwdQoAZykh9uwfPO3Jc6PHvYOOIp1ht0DYYGLzX0hk/xWMsP
 qFlslq7TsLc9cK1+e5LRgDVPYeeFSsu+ex1V61Hf95slJOz4Pjit3nHNn/Ocm2QxIpuhhdL1Ez8
 GoQDey7ZqWIvNu4sHh7zNB/1/XzGwi+AnfqO0UXCLNVsQSTgjhsWAH2qdp9JtQlFsnPuJrgsuz3
 0x4O7Ub9feqpe0da2epQ9CLU60TL0MJMcbK9T/DBeduyraYfJ3YqdCJPlzoKOtwPurxIcf0slvD
 0tiNEBbScM+pz11ph1A==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf5a70 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fs3tcOIB28yc_fyh2y0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXxbFEEnsQyq89
 AGL0RW1zwHe3mN4ynUcM8ijfy0JR5n72glM/CzRk2Z6MO7OwBqcZ1ZFJkr939sVtiz4glMy8gMt
 vztDihjngmh7gwPsGau/QgsQ39QjPXo=
X-Proofpoint-ORIG-GUID: faFFQGD7opuJSLgNivrJe-ejJYikkblx
X-Proofpoint-GUID: faFFQGD7opuJSLgNivrJe-ejJYikkblx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140041

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

