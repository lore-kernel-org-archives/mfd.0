Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A0B46D565
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658627; cv=none; b=gFdqHdhL+t/Dntok+QzMX1bI0+CL/LByoqdw/dfCueiLjXU2AoCCzbu7O+xLbfIbfgF6TiHUyV/v7PkAdse/7NRadmLZ+ozjhMwVxM++kkV2M97/miWF0+5a7oJq2ud56PNTxCHwGM9t/wLj4GdwzihEMjDPks0U0TJEcsxy9BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658627; c=relaxed/simple;
	bh=b9a5PaQwulyMEAGyhvU2MKGjOkiNZX2HfYvEScduVOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aVhtmzVUmi1pjyQI9LVdVWB5Lsi81zKe370CERqHnWcS/8Yr6vzFM5RejG6+cQ6a4vGTO97bVM3JVRDczUFq3tlCipjc15b9bf60e18uoR1QVEQdDwCn4LJAy9fiDy5Z9vX9M9HKksYuzVgadRVuNyYufLxPqpwOw8KFceLoHGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/S1bGuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7WFxCZF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/S1bGuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7WFxCZF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2VDi2548700
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZcUSVHAQLB4Oa1L/bcj31gQ2efZME1ZB6SptlHBUYCw=; b=G/S1bGucD1G9eFFd
	tiNX8qpo8d0VxDbmgwy212f5p3jw7+nn2/6Z06gFy7JNgNDvVArvDF2VHmta6LFx
	wHEV0u4TWqf05VdLs2CLwqi5J442E8SGXAmHBtQHCX5pu6CTcLTZvHit7MVOBU6G
	YsJKLmD7wHjM4KCVKzr90jh/oZjxNKkGIIC9VdOK/c3nmZ9Xvhg1Sjvh6Gppf4kp
	ALdaDi9wChncqRNLZNtkS+h30VKlhvOc5TWrdbdQgJMRfoquMYMluL9oavU6mbA9
	GHWblzPlYbNSFC6nTYI6C/858NwyQ75e6Gbx7JybKC6bvPKHn1Bc38Fd92krr0xV
	V84NwQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3jd91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso244366165ad.0
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658625; x=1785263425; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZcUSVHAQLB4Oa1L/bcj31gQ2efZME1ZB6SptlHBUYCw=;
        b=S7WFxCZFjHRmlf9KfN5/HpekQA3S62JMCPXZnwotnvABTO17vdY2y5q1VA6Cj2/1Qr
         6VgYkKMf/GbWMWSSkNFpweMNwT9n+ZumbPi3N6E++wYC/WwQuZyL/eVNxaoG1k4r8qek
         Bm41TvACz8v5M8MrWaTwkAJJHrXLbrjDHDHqbEtC9JcIHZbrEWJnyOlfcirUYvDQ48Qa
         3Lqxnsm0L+Z3IJpGUKrKqEC7Gkz2R3xs15UR2IzBnP2Ix4sP/AuZdVJ4VNaHcTxcbD1u
         YPFsPUYulUFg03kAdU3JeFO6iC93VtqlI3GtrOyloEnHPdeV4lu2u5yfcVUcdaOeGTAv
         YCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658625; x=1785263425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcUSVHAQLB4Oa1L/bcj31gQ2efZME1ZB6SptlHBUYCw=;
        b=S9sT+0muH1eZk/HiAjmdt9oyBu0Mzcd8TRVcVumihKRSpxe8ALML1rffPHzgiO5/H6
         m4eb14BSKLpRINbYjKMrVyiw+TPd5qs+ys5fyO37BqlJSBAgpNs2zUnqpO5FfAToBT9d
         frhzVJBKvbqhOs4PtGLTPfStXr8zM33aSfgL6/Ri+1QCZ2ac0eZOt97NkpleHfeZnLxo
         aWLyMHCMmtlJ1iU6FBfPMlHDkUBjrnfyaks6fZJjiFjDmS9tZo5YPxpLQwwwksehPmxs
         p1js6hTUJ/hsd42kCNkpzgZusq6QwVDctuwusOYJQ1QNgRiRSyLfOQIbLRya85Ik0d+f
         /sMA==
X-Forwarded-Encrypted: i=1; AHgh+RrUhlth+f/YNsSC/6f1u276Bg/+Rj6RV7QrFzx3tpdpU8M+ZPHfWXqFBt74y4GJRyQea/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcZkb45wxbQi8dAeXPXHN4POk57PL7Ml1Lnge0P9vzyaJnkJ51
	CbSZjKO7prTnPgNq9MbpZ0vxAK75P53LfKpBGi+w4a5FJctNA4RZi7FYgujx01P+WwZF+3Ygswu
	Gt0k3h6Xu+NYAGvzYlvYbNtT31mFcNp9GqqZ2B6vDFLiDtVADQ4S8BMM=
X-Gm-Gg: AR+sD10ZmliLMzHxiDSBfNu6vWusIHq77oPi//RoVwHi6+p2HAA3xTyJXiBTRMGOJNK
	2NrXcCrX9n3cbhh9mMOQp6WKbDySbtQEGs6dW98VOyHGbSUEBNpllKe5Tv228+fTPx6f1ocEQq/
	GoY7zEcJgvOS6b9c3Tl50aV7Bev7G6GJet0RbYFnHlDZ5pBEsbNFJkomEt/jurRFcgAECXXaNSM
	CTrf2wNtjRRkp33/Ug7K0TJgApnqZrSvVnNP0j+wQSICTDng+S6IyIkGxU/WAi3w/t5oAWTcAL9
	z5tm+lGcOb7ePZvEmZJA2CQKO30AU74Ziuj33LyYZABIoYQXuottBHNzGwFiunl4nFaToJNgzQP
	9aUFZRAaKCoj6AzG2vAimeEVAKpl96EfgL+c=
X-Received: by 2002:a05:6a21:7d06:b0:3c0:b3f7:e5c9 with SMTP id adf61e73a8af0-3c3ad8b2ee6mr21172120637.36.1784658624676;
        Tue, 21 Jul 2026 11:30:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d06:b0:3c0:b3f7:e5c9 with SMTP id adf61e73a8af0-3c3ad8b2ee6mr21172078637.36.1784658623979;
        Tue, 21 Jul 2026 11:30:23 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:23 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:06 +0530
Subject: [PATCH v2 01/10] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-1-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658613; l=4042;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=b9a5PaQwulyMEAGyhvU2MKGjOkiNZX2HfYvEScduVOc=;
 b=QiQ0MLK5GUhNM2tIBS1ztLjCQ5D7VflfHlSxdo6Ptyg7kwhU4B/3wF22jwBQWDnV4Xogoe3TF
 EIAlnYKZD4nAI1U+VYOL6mXNnnywMwvKwWyUfuG+nEZeAwfw/eGQwdh
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXy1gLWMNaQkw9
 yV/Q1BgzW7MLEvr7nLB3foTC7idyWHfcgySXi3yP1PiUuNE+uQmc9BhHZOnY91Y8NaqX6T+/iRe
 /taVGQR7qcwc/5PC6qtngz0Hru7zJ6tJMRGYqq5affek6gVQnzmD2McVxUQTDGJOLgEfioMA3DK
 Kg81HdExEiEBq2Swd2wv3+YIaxpjjKUetuhmPhdTJM0pDD90+iqvX3ZwWsxFZG6URnMRPqOR1HT
 hjKc6l24ewzVy9Ii3RpyiaOqhiY3uPvXW3D2jcptI4yPXj0iRk53vNqIk0k7MgY4fAFMigTyTZS
 fSqZ7USvuAlTilM50f2W9A8X3Z8jI/8kHgXAqqD8rSgYOLUmbrs1vyheIAmFgqF7ai8mhBxodmR
 U+oAZoAjsfRB6mZFCbNxuvrCLQ8PGIP++RGCbEmP0z2AtmRytL5XBRzt1C2jleS+GDwSZag2XXF
 9kSBjLEN6TCn6fZItmg==
X-Proofpoint-ORIG-GUID: 9UUecbJvp1KUloSA1_GIuqaBZJnXBSob
X-Proofpoint-GUID: 9UUecbJvp1KUloSA1_GIuqaBZJnXBSob
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXz9A+cThaKwrh
 ozfDRnEtSXUE6Kj/ex7xowbUWH8w76+Lt0f039uO0R7m/xSNGuILvkg0zyVnxFmdOCY7eb/ieal
 ntFE5YhBQvr3lHX5GDoznmSPRZn5zcw=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5fbac1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=mxz9luGGJ82e2KvUXckA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1011
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a DeviceTree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 64 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..3c069e94a34e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,64 @@
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
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: max-min
+      - const: critical
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
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "max-min",
+                              "critical";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 809be2756a0c..3caee21a02ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -190,6 +190,10 @@ patternProperties:
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
index 16b73f5825d6..1b178d3a91ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22176,6 +22176,13 @@ S:	Maintained
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

