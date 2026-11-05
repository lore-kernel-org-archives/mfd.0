Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877101;
	b=Sk9UiFMGZpWLquUGGXOjfwoTKeB1JtByy+DLjJ+f1oo8IpYufPnqCzTahRbtfcWyVIud
	 Lm75PlNCHUNVT1qNoN8lYgR9D1Gte/SGdTlXj6tjaWY8TPm+jsTnyD3yvcxQGAZ7Agl9O
	 0Tqp804JftPBQRywp/JOWz5P9z3UsyikPZw0Xkyy018SQY2R+/MYy8vqm71aTygtyynvE
	 PHGHNHFwN7enYq28uQu+lvQ4C+7IdId9tUXzeyqqZhV2iT+AsGSgt0r2fgo1ZgUfp5GeV
	 W20PWT/W/AUAfnUMAUXIpmhK1JbDZqzkiqZE0Dm9CF692qnkqVeEtUx/yZHBOv+sE2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
	b=Mf0OV90/4GcFCA0rtbygbwtYnUmC3tKLhdpamXNibHGT6irvAYPIwJIoWExBvTfOVIBG
	 lwz0XFXFTnsLp/rH27QGeHjMhg6zy87aSge9wBqw2ZLm+Jfx2sDFcY2sOg26U4ZyMOpay
	 uv9Lg5T+7eZZntB+Xjay5Aw2TjwqC4WUx5eR02VDSHPw/5upCX3LZrfiqKE08VzRJrVLI
	 FgAx8h2Nl+ry/fBn30gFnFReFeVSiYM/ZD2b6ivo3/3U0q2SClScGm7BEhFVYXAuLZTIA
	 c7MfYIcIiRPC42+49Dv1sl/FKHjphPh3KaIXFaUc7Dj45HqZyl6/AGuCEt5rtsCYUMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c4HjtbJv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PYrVBZvz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAFD606D80A
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 11:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECAFD606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c4HjtbJv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PYrVBZvz
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3LD73193493
	for <mfd@lists.linux.dev>; Thu, 5 Nov 2026 11:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=; b=c4HjtbJvOEEajdTx
	j2WA4SDowGWC0tmbw/I97/O7NmwNUj14QTcUFv/LZBssN1do5KwauiuQbjbdjBzs
	tt0N6NVuDFTSHm6hgbSLA/uWRIAw35D8fWU67fRZ18ln3tVfYJExboI6uSBYL+VK
	nBJ/WYkuNOFtVtkUJFF7KUkgaaIX2SYVNuR5R110kEi052bBewkLQVGWa6j5hvlJ
	pL/f5ZOWZMuSNhZzxk/hKR6aPqwlLZZI6IZ9gNX70svbVFtwQnuMo9CAow3HY8bQ
	R4XHrT5VuMg5kMBFOcC6Nl4D+rj6pWPhlI4McBMbyWPn9B018Nz4CYL259B2DUlD
	Nt+weA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdr11w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 11:11:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e49a1d3b1so440767285a.2
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877099; x=1794481899; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
        b=PYrVBZvzpLuwHdqZwNNAnXgJkI+hAZ8a79pMjEtFx+owXabOCzBNXqrgDkIVL0vNOC
         7ZWjkiMojC87cYRrqxBX5G5u/ZAfPYaMfl5Ui0PWWVhaBiLdCA3r8iKKWZStF63o3e38
         sZUcRWS8eRfmCOfkTPmfk/kSJ3EvUyHqy+Oq5SCXRnCKKk9tRVcxGLtotvoscqT9AArl
         TTe9qA97vC1AsYWeBVdO81yrMyUDSM4QJm/xKr+6KsRtc3h1OOB6r/9I/evO+1cYYDlM
         rLGUwn6edo0j2wxD91H0Y9DRAYLc22kiuvDeZnd/Y5AJ4pfLd/2ttC7jDhgkYsw+55Lc
         6mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877099; x=1794481899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
        b=D1KGXl+FKo29KKX9LO3am7ANCIeiggd8IHQr0Kgo+k+ffh8+qOwUU6io9/bsAcJP0Q
         d7GnrST6rNfA5zbhpgNdIqEQaPr6tfLXXW9XRVe10wQYDBvLhIyyyLYsgGqJ0bGQvPx1
         fmVhgg+lRfNmPNnx6HzvvrdcZTfhEFqfYociZbPQsdYq0ECW92nx+YrvGxOYCDY47lPH
         gdcOKzoxek4g7javi71dTHsXwjafcukn7PPshUfSAB8BVcBAwPQlnvCV/PG+qO3Il2oP
         9cUlAfTZgaO39eAXq2LCoGi6/gWi8QShuPHkCrhd56mqY7J4OCacCE6gyaADUOqUHV+Y
         3ajA==
X-Gm-Message-State: APuU4Z90i8Mozds7Tkv1ClRx5Fhq6vCPiYpV3nMVb4UvfFmghXvtzVHN
	TxvgYOPxzzY75n8+YQd6MJYdv6lRAijmiDTBrgVPaclim+NMm4mXtakykXFTbIbVJ9Z3PqSbmGF
	GEf3D1cmMoRgqLEAdOrj8YuyBtg5bpJqPrFdvb/aftMlAyNDFHeVh7Pp8dHRawML7ZA==
X-Gm-Gg: AYBFou11ib5mjgVNk9yiIpAcnRoC1l2Tg7iVOGL6AvUnEMYN7bvJk39qfeKvjOXmC3F
	OqfOpNIbUTXJmRIMqDvuuMQWN1E28Mm+YYHvPGAMbBWzpWl6Ay+E3cYXsOFGKSPU26KO4MwvN7H
	CkbEL+lqcOpe7cxMCIiCL0TM1A4BWK8OeY44gzdtpUhkVSBQQ4HEFPlVQaPVupA01UuqC3RR5cy
	m5o/3mWc+Rlfp6/mWy1BU1ANIWpmo8amQIX0lGuXBD9HzkxNmd1wYNwgoR/ieJnMwoeZm4D11No
	Jqr2DpOP6F0PImKuQ6BTUvCpUA3a9kDUK4WkPkWLxukXblNwDGh3KjpwYqugSmJyNEnNxlDwjTT
	BbqxPgr12q6Lf4k2cEaxh0ZAyd7uzzQmtohpo1aUESJZJ3aMVfbMfe2NKueQj8CT+UBVkvyZjms
	In8iznwmPF1uw2SzV9caogGa/pwWbdMEi2l6CWxGGb
X-Received: by 2002:a05:620a:26a0:b0:93f:52c5:a31 with SMTP id af79cd13be357-94421802977mr2976180485a.73.1793877098836;
        Thu, 05 Nov 2026 03:11:38 -0800 (PST)
X-Received: by 2002:a05:620a:26a0:b0:93f:52c5:a31 with SMTP id af79cd13be357-94421802977mr2976178185a.73.1793877098432;
        Thu, 05 Nov 2026 03:11:38 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:36 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 19:11:00 +0800
Subject: [PATCH RFC 2/3] dt-bindings: i2c: qcom-cci: Document Nord
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
Message-Id: <20261105-ccu-v1-2-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
In-Reply-To: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=3045;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=53/2ZtfsHA+VIBh3y1Kn8crIdUlYDr0140lytwfQVqw=;
 b=0INrlV/BUDtGc6MZEvf3Y6H6D08QeqmW9s8YpX4zWjftwYH8/6aUejLX4mik+ApWDQN+1qeCG
 8eEHyRqGfCdDF+EInZXIuiu3D//4jO4D0QF5ioDwyBtK8BoITnltOfa
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec646c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nHM2AM3XuFFpsIOFzc0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HyUk3mKc-l66ya8AyoRgkz_-n2xf-nw0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfXxh7mI7LVn7Ss
 4+jAhS39U924rgxAPu59BkfWF19iLc2DBfvxcF30XV61Db281AlnRUrLkWIY5L47LJLLiTlpyg9
 j/csGrR50fnlPTdwaFMkcVJxhvo8PC8=
X-Proofpoint-GUID: HyUk3mKc-l66ya8AyoRgkz_-n2xf-nw0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX7Z7Ej6Nv770c
 3p/6ga+s84GpIv+uxeimHV1zR+HoI90a9GPg2Cn3ArQdGA9JM/EI3aTavvm22ypZfl2MSFi5ISG
 +EDStQkQ+GIvNeoKDJQ+Mukn1Qv+3E9ehtTpv1qwwt8sHQl1eRQD7S26f+bfGZ/pGwLpIQNZ52G
 m9W5UAv0BwONNGq61YlPrVve00P+35P5MVLaocPRsEogvKzQIg30XL/wvsgZOCfMeE0cCRRk8Wd
 CF0wYTxIhA2Kiv2ok+YV20FOWlrTFPNk1T2KeCusTnZV2f9EEDy83ROjmCU1WO20W2hRifuu9Iz
 r0CjIXfV54onu2pGpJOc/5gLn+BVn1PqUxPsGJRf+KDYJXATbLwWJeC2J9Ag8lgbMl3F4JoFRlN
 jlb/YGx2eG/wvV1dMC6fleh7g0QLJK3U/AZwv/JKeES2xajrSFQYc3/OXkzhvi8ka9YHakRITWG
 O/7W4MYaFb/rD/oN6fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043

Add the Nord CCI compatible. The CCI is based on the CCI v2 core, but
is wrapped by a CCU. After reset, the I2C ports are routed to the CCU
and the CCU output mux must select the CCI before any transfer can
take place.

Add the qcom,ccu-mux-sel property to describe the syscon register and
bits controlling the CCU output mux.

In addition to its core clock, the CCI requires the CCU AHB clock and
the camera subsystem top AHB and fast AHB clocks. The top AHB clock is
required to access the CCI registers and the CCU output mux.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..5a25ebe0e61f686b86306a1dc94911e302d9b440 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
+              - qcom,nord-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
               - qcom,sa8775p-cci
@@ -70,6 +71,20 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,ccu-mux-sel:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      On SoCs where the CCI sits in a CCU wrapper, the CCI I2C ports are
+      routed to the CCU after reset and the CCU output mux has to select the
+      CCI before any transfer.
+    items:
+      - items:
+          - description: phandle to the Titan CAM_TOP syscon
+          - description: byte offset of the CCU output mux register in the
+              syscon
+          - description: mask of the mux bits of this CCI, set to 1 to route
+              the I2C ports to this CCI
+
 patternProperties:
   "^i2c-bus@[01]$":
     $ref: /schemas/i2c/i2c-controller.yaml#
@@ -131,6 +146,32 @@ allOf:
             - const: cci_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-cci
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Camera subsystem top AHB clock, needed by the CCI
+                register interface and to access the CCU output mux
+            - description: CCI core clock
+            - description: AHB clock of the CCU wrapper the CCI sits in
+            - description: Camera subsystem top fast AHB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: cci
+            - const: ccu_ahb
+            - const: fast_ahb
+      required:
+        - qcom,ccu-mux-sel
+    else:
+      properties:
+        qcom,ccu-mux-sel: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1

