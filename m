Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C32511213
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687396; cv=none; b=QFzNQZKRb0gmh6gTGtzrgAFc7iwwvxrGxhwgUPFTqKEIHYpSbOfnfy+9P45edxXyylch1ZCPXFUfom1bcwf80rlIkSN3k4e0JwLV6f4UgvZDRww1+Gi2bxXG2zhhFlDQuYFGKeoozjyG04Powldeul6lFHuJvctCkHN84s41yLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687396; c=relaxed/simple;
	bh=QtwkwkBwsfNNVXMJ5dPU7sRgJ2TeiVGKWE1LN95tqNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZ2Op5kIESYsn1+UovTE5sAuZGUoI/dk0SEh0dAHDRLmoHwYBG6UsGkZMMBkm6mEfdhpqUdgAsdiB+S8fmNsiO2AozFvSWDtmVhy20KOIso5/vHyuRPHui9SFde6ZTWq22DICEde5iyBg++lU29M3EVuzdZSjC6TFOSaH0A/mDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEw85bs+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsQ3A8u+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEw85bs+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsQ3A8u+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlOl611728
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=; b=BEw85bs+KG1Isalh
	t1d1/n4SD8gCQy8hnkey3OEa1vYD+IfG2QYsWFwgumwmPhirXRDztPLxrApn1wn0
	3i4Ns+TPxOa7uWELw77QMKbg0KsXU1xlZoF54YPLm/mvTi5PVDsrvNWEzTu5hrgI
	rrPOWJdH0Wq8bOxYBwdnlk8QX1YeOIWV36Rmus4lWV8YCcAbfzPv736o6hkmvXAZ
	Kd1uF7WLUGCPWw+PirbL8qPv3TQ9OBVwmrIATDjuqsLVKdcN4R16u1wsLzkTeVOT
	TXW7cFDoEiKgIHMRtzhAbuYbQklTjYkTZJivVZ/hnInJba6F1S6n7qjr9jHduonv
	G52Eww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u6m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:09:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91452ce83b9so47575406d6.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687392; x=1791292192; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=;
        b=HsQ3A8u+wZDt4Gu4p6i4wffHOvybS9L9xSvgdBlFxxHbYDVWqNAD9iToVdx8sHlqAa
         nfcXQ4/iONFojyRZ7IdzDon52KqLLVsR+gykobMSFZu3xqaRmNqISlzDmaFyhBLXH4m3
         PLxEuETds+9ylHczcwWx0lGkJ+9Lbx4mP+SwxeohN1F+uhnjkGbxFT5dAZzK5Z+hsess
         +/ikzdKMwul92jZC9+uKCsDDsMC8D45W4UCYHXkkdII3hxFJwlPI+1NDa5/iFisGyNqc
         /EDtUtj6cdrRJW2uPzbRSNfkw0pUatJHBy9uu9+Ava/y/lCVABgPPWjOzPELUWnCZIDU
         TxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687392; x=1791292192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuGEM2pweJMV+k6YOtJGAYgYjV7cNiBoon0S32aRSo8=;
        b=gli4iHvqvcyGXhpiYOeQv6JiJnsQeqCcOgJJ7AsGw14LQ4Fm3KZKOzx8QchxGCTiSq
         UJ4TZ0OA8lFatK88fEzQ0ukkfzo3rImIsRr/YPsnSf3Exo9I98Yf2qLP0wbH4T7jAxA4
         1eHYXAXZaINhV2PFkgMuEZPe1ojpREtZNf1+w2zblnpq1CQn5IJAaFl9Q5klt/GBQDLh
         GEmRo1mTcOpt7xbzhCXb/6qmQOuTLuVvgNMl/ZhgdEdJYw2zdU8m5Bi9LTIuslT1uALt
         KXnY411S6jGHQLlKOsji4eSEL7EqtVsD4TA4y+irQb3X9+fBow2167Wz3kGabwzCeon8
         uSkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdynkBCm/aI9tTkSCVB4zAn9uXBsbTYhyMuLXzLsMwFxX0NYN/p6YY/n38vJAnDCUmaKE=@lists.linux.dev
X-Gm-Message-State: AFuF++mf+UEQ3moUegkzyR+oQKis7SK5DJ8+SI6EwPg+qgVITJHSh7WY
	A6hv5HVEgCBI/irxa0nQ0zGLevwQbInu2V9DiQ0m8RAFSZrsIr5ZUU/CHfM4wJ4pq0pY7A/RBqe
	J+HulkwOT6tWev9d3GxmBb6RYxdLWTBrk4VCOBmBdS8HKN/n8eAlKVVQ=
X-Gm-Gg: AYBFou26eFt3DY0lNc+VWrl4sbu5qln11GrtIKZuCH6GTAbQIdy0PaMBiVSDIvluRYS
	4Q3oFG6fjxuGGUBOtdhSoxl5bgGq4suOY+u/sWv3H8GhPc3cr5s8J+VDUbIrLCxNzAwWhnIPez2
	PMdVu1VoIkWp3lb8pAoLD+7eVGmRorKqSeA0PfYVNe7o8FlU6lzQb82WQ0TdUy2oxBCb+AiaaaE
	ceALUOJYQJtLIjqTdqCeyM3+Qocxs/GHQr2XXoq5Bg+3GyW0nUKjltO3GcXtUEnBBJIRxLzhhKO
	yJvjjMOyMLQ9E6uRD16gqulqadkZ3T+LYK4Skr74H5onDD82XIdIlczOwxsvsfRodjkaslK696W
	KrCyUd0Td4BI5tnhMgw1QbcCbSkkiC8vC/Cc=
X-Received: by 2002:ad4:5f8e:0:b0:914:43b1:d4e8 with SMTP id 6a1803df08f44-914482574ffmr188849226d6.10.1790687391920;
        Tue, 29 Sep 2026 06:09:51 -0700 (PDT)
X-Received: by 2002:ad4:5f8e:0:b0:914:43b1:d4e8 with SMTP id 6a1803df08f44-914482574ffmr188848326d6.10.1790687391047;
        Tue, 29 Sep 2026 06:09:51 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:09:50 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:33 +0530
Subject: [PATCH v3 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-1-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=4232;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=QtwkwkBwsfNNVXMJ5dPU7sRgJ2TeiVGKWE1LN95tqNk=;
 b=brzRaFooGdY1AEfjdIk4VK0wyoloSQQm8UmTUeWJ2N69TZZj0UtvAZagT3QB0Cn7SpHEVTffW
 //bQd+CYFXbBAmm8+3wmJCaRDDWk959jeJ0FBJyRFTte8/ftVC0wJ4C
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX/YrS9Lkxe6+g
 uVwYr0J833IlHTxsuBe/X78Tln2hYcg8XuwSEmA3n7gAcWd/iIgRg8FFUa77XLGBvSFkui4Bu6G
 t5Z4FlTZEiNBCVouJaGy8PqKkr9t18g=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbb8a1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fehuZy28kGTF_x16HkYA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXw9qnBCv138AV
 X6yjKjC9yRvNsEM+izk/Bs3SOTBIklw2vIkkwV4ane5TVAy6GHWyVhq7wFCGGe3l3g3i0RpBMH2
 t8B2fCq8sT8kiqplBW1TSYwQoExlKex8TF1/ihHUrsmnCIbcO7vnK2tRIJQFDCppqIl5/FuQblG
 6h1uaXlkwJQc+1W/aViQzMowzh0tOQ2x0F04Zg8t/f/hV4ws4e0Ij3mGjPK1ABsBCW3VrWK7Zxt
 nO+pM+ACbLKR1VqmF9XSrHwJu2L2bhbHCfVts+RQmy7YOfN566uRh7Ttoka0aGwuCH9ZUlZGCkX
 Tw3LJY9+ocwNnDBffXcLw+RqeWdIH5xoAa6lYgUBxfK8nuKmwCYxG87jGknWTIyiHIsqWSud2Er
 RD4Yq7VpCQhJBN68v2QTlaXQdyVDM4TnM3OK0aIsxFjfNS7bUcUsa4pIFHYaJdXqcdMxkvZCgEv
 lNE3jfc4JSZrArXQFPw==
X-Proofpoint-GUID: Ti9c80uECTmakPhWk2-pCkfh71d7MYkc
X-Proofpoint-ORIG-GUID: Ti9c80uECTmakPhWk2-pCkfh71d7MYkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a devicetree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 69 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..a9e3525cf099
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/qcom,pm7250b-bcl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
+  alarm functionality for battery overcurrent and battery or system under
+  voltage conditions. It monitors battery voltage and current, and
+  can trigger interrupts when configurable thresholds are exceeded.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm7250b-bcl
+      - qcom,pm7550-bcl
+      - qcom,pm7550ba-bcl
+      - qcom,pm8350c-bcl
+      - qcom,pm8550-bcl
+      - qcom,pmh0101-bcl
+      - qcom,pmih0108-bcl
+      - qcom,smb2360-bcl
+      - qcom,smb2370-bcl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: max-min
+      - const: critical
+      - const: emergency
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@1d00 {
+            compatible = "qcom,pm7250b-bcl";
+            reg = <0x1d00>;
+            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "max-min",
+                              "critical",
+                              "emergency";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..48dc437b3889 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -195,6 +195,10 @@ patternProperties:
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
 
+  "^sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/hwmon/qcom,pm7250b-bcl.yaml#
+
   "^temp-alarm@[0-9a-f]+$":
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c02b919d6ae..7cc16f7ccd66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22657,6 +22657,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BCL HARDWARE MONITOR DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
+
 QUALCOMM BLUETOOTH DRIVER
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.43.0

