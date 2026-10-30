Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341273;
	b=gNAx/m6Hsm0r8/tOMW857EUptdRru+g7Unxjei6ciGMSS8K1XUKEYF7L0fI/MQW8ziMI
	 Plaxb7J/2NkS9KtGeu8QgXrbdmr9NJeMSvxJHRoJi62xTDesaInE33NJOW70gsrci9f3A
	 AYlO9rCt9EgUNSSnLMizeIo19DCOK6pomQGTF9cK0a3hjO9gB74iQt8hTaZUhhJ0MOT3a
	 LHkNuCq2RtFQWJr3ti9jXqKNygC5K4zJmOSZaRRKO1PWo/LbsD7paUruhNkNAifr0RWHT
	 PF+7VVjMY4ktBiecHZ1vbKcc6bEMA9alJgbIQmoYhJP/5o/rAT6uOit7ucL7Rtb4srA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=tLRnk3UsfXH4q22y3h+CqssIywEcxHlYeNQUEmducW6wkLuV/tDBQ2mg2uqqXAJ20K3L
	 98pXr0s7+p1tpfDdPnN6fjJdCum7NaSi/R/xyEVQCCHXk44V/bTDHM3oUjTrUnwksAiij
	 ZWczj5hcX9fe5qiwlb+3lbi/nMJFjciPoJ5+UqWI42TiX2FDb8M0RS7RCnh/u3runEFyL
	 pmZ8IJh/FynZagx64D8UHXtaLTVWbjteLE3Bzv3wYzq4jrQ6KCQo3Y0GaAwq8O30kUN/g
	 7j/nzDvx/Y1l+Uv0rAftbMyIyQi1U0kweGWN6NgqdL21hk1F//AOq1TgmbRfoSo+T3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3H46kX0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJX8Sv35;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2363E606A31C
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2363E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H3H46kX0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJX8Sv35
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5EwMN3312193
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=H3H46kX025o/8Kik
	Xy7yiyuTpz5wG0IzznxcSF7+VdlWJKXEDJZm/j9eQ4Z0H/d+WMDQeGW7WoFxRTNx
	Q1ssTF7U3PCPTqh0dCPHKXyzAIxhQa3YNfFu/P9il/b5KqF48+9TGGUzMkOi/IyP
	IzpriTfzJdJ6e5h6MlzNUwFLdTf+xoXIJeYLQfEo4nzyDcNV45KMYLGCLwUK1Lc0
	xlrGqsF5n4fYZjYql6o5JnyGuFs4ED1cVXdLCwAlaGXBZF0v7E0H+XhbbNL9P4DK
	ZI788tuSb4vUFSEjpRUCetJFuh1nf+3GRhViKJ5hmtcEAcIf/NrcXHfTx6oY3ulC
	9yPT1A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rhjsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:21:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c768885b4so403608b3a.0
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341272; x=1793946072; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=gJX8Sv35PAp/82MGPaCdwhbeEydAZYmlXYYunVFih151USRIbn58t1/+BPCy8kJ6kB
         UdA/NODYf7DyAMBbkVxv48zQpo6ooulvFAlUjPmTOP/PmpgwnpzkLpEbPwjjVSdNTfj1
         jip2UuPZ/IqZx/qCJMr9HFuumGcS98y/VtR1/ZCK/7XybCDIHblCN3kAqEEPwcQA/sYw
         riCjjTmC7q33x3Ik+Wf0m9PZJZ0aTvhhgmxEz7Cv12ZrIKRgRqat1r4CasriZfn5wfoK
         HHWqHo41bqtt6hZ5dNtdd3lp/KgT1a25Nl+JXmzdR8eruxZ+R7K6w8Lndy9C+3XqzVPP
         Raaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341272; x=1793946072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=NKpEQochcMQOpP8iIQonAtdbpPVEFXnGiqds3SJD4eMZod0NV2IVWqg9MwJrkTPKct
         tk3JES5ye3YtGjAnWkR9YAmzzFVTZsY8JcEdeHEAQz7fwZdIrZshlJ+sNGrKnO+V/KKU
         ydVndv9TJfIPbZG3U7XBbTQIHRs4iMFiTBqJIcvVSEocARldrrbBNVANSUoR9tAVqfFx
         MWMB8qnveb0CygMMANI2A6eH7XEBqdFR8AzoFrrNkFZO6pzRSRDVRhV9K1nGEBG+C0jn
         IhKai2kVORr/NYBjju2FEsv9MDjTtGKuxvYHmBHaqlYW3ojvQi5/W3scl+R2K5ZopWxE
         pLDg==
X-Forwarded-Encrypted: i=1; AKwUvBxz3X8Sf259wCD/pRDZ56V0oh0VxGJIRPuuAPLQA0lBrERgrR6sOpxLo1dG3pXs5XC+esE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLbigg6B4qtk0u/QXT7S3U0WhRJwj7SI1bSRReKN4camD94/CXO
	2uXpHMh42Xzq/eJIYQeIdCg4lVpbYLTBAIOuGOMiE6JGeqInOQy1Jcqh+uLNDx+YbrDXOTqu5Oj
	3c61BBK6tqSg4rWBPIYZjwSoelA3n7dPA6yKAkkVa7VhlSzB8+IKs0SuqgKVAn/s=
X-Gm-Gg: AYBFou1LAM6zciNJnlRRRKR48oLu1Rnpq7JeF4GAYIpEiZzP/I1vEZ3XYRpiZp0qJI/
	NoNxU55TDCJncqzMkgtJlpNGt0x8mKjIC8LUjkT2vDcgKCHdp6wscBgUsXGsrkulEtIPR4F4X/g
	v9BfKtE+jBpRDYlMreINKEiqlDL6PmYUwmZr9ejWlugaD856Rog/aiCPHE1xzsaDGZ5m7otr1Vp
	t8X5CvPwb5rS4VEkNRK8xW8FMt+AYnWMNShNyLfEZdggwDG7D0PJeeOixhoSyvqxp+PfQVO713Y
	9bhpI4d7DpUnJeSSiWQ2rTzKuRjUvKE/wT60Qnk4H9CRW4NjQ1RtBFqtiypA6Tvcw0k+pYL12Yt
	1UZWwsxe7JEwQlcvmYepsW5HA5bKM+kiUL756vOFsvEeTOkJZMEC03ciD8zAHQ6v1n/M=
X-Received: by 2002:a05:6a00:181b:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8a9beb67de4mr1153261b3a.30.1793341271869;
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8a9beb67de4mr1153243b3a.30.1793341271451;
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:11 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:49 +0530
Subject: [PATCH v3 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
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
Message-Id: <20261030-pm8010_i2c_support-v3-1-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
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
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=mXOJR5NrzpA3/ALgI/vb3johzXuTH1aNfzirkBmWNV2Ur3MUeIOd0lkchHZs3pkIo2CRjYtwK
 uedTJ5um0QiDmPuJAOYi0VxrRZfDaR20B7vFCvjD3AHkklpe5qFLYmX
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: -m7DiGY89V3lvo6-XYxidHsXHYE1YrdV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX++x4vtmhLSMt
 0QIuSTqA3aLfY/uhpw3NxWc7TTnt4yShes0j2r0Vx/JGbWgHlGImo9N1WBVMcNQjo8nbJ5OyK/6
 AaQBurAaaBMJWZihRAZTaI+FZUyr4U0=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae43758 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX+EkFWJl+zPcV
 UgP1B2Z4fD06xAQ/0l2Ujx5Q9Zy0KhYiWwCavwZFT78LPD40KxDPnEKUJcMhrogaV+utP1mMivT
 hTSF6db50dZBx6BYBBimBsG3W8u0kl3RHLR2IBfFkYHQfiKmI0h+ylEka/UhnyGkZ0ADokXC7K/
 ZIg/D7c8bTbjdC8Ezk07fvkPCY3WxzuiyEpxhJDJp9sKz6peJJEwLf9Xifjuw0M2QlX4ITDI7fD
 0PTFhY/dme/3aT/0TfmXFhEEkWNgQcBzYVBej8y7jyQgsQ1Q32FKU8bsDoLMiHrj7+GyNT8fXrt
 yOp4i0aDwm8cpsTn7/3/ds/j/luZV6XBsRR0IdYq9MrO0YCUA5T3Xor2TALdazhmdmA4+BN4VyV
 pZB2CHWX8bUbj+sckVz4o0QdaJx4no0Ys48WF1b0nhQgcunQ9j/t6a5lOSMuJrC9/adviZ9WX5p
 RTYwLjG7A5rsGS3oZNg==
X-Proofpoint-GUID: -m7DiGY89V3lvo6-XYxidHsXHYE1YrdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

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

