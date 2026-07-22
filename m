Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3111A3C1091
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717101; cv=none; b=uPHM8Cd3WoG4vWSH3pM96bzdzQuXESHvJYRCkLxVbo4hkKJq94lfWiwSjsGDW817T71UhIZ1qRMOh0+no3Cx5GNiqgLE56SWoUDBOVsGpTsJzPcwcmF1j2f0XiWdGy90Addeg08tzVRZcfQN38a2rgxt7HvQTf0NTt3I94pwJb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717101; c=relaxed/simple;
	bh=we1L1lQ5lcQSoRayGEALtC+WkaOOAukyLvGKMNh/VIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbmkXEqiVpgVTbNyKQUvh9wTuywv9z9gPkLJitPVIHULnS8GHyM7mbD9oUUWDqBiJVH7Oe5vOOh8DIVPrgNSuwlJ2d7HXNE6CyMt0m0EBHcuVvytT+9LRx9uuvmIAQXZinY5J1M4bbOAlHhDEhLzfRm159mmpfCEZZw29tKH2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pojz5FDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWtTMQkW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pojz5FDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWtTMQkW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x1Kc523800
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 10:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GAAgAP0V7LjmvDcg7cU4QtLN1FT+eQx8NoMPuNIkpro=; b=pojz5FDAs1WmH/Zz
	4eurqxyoIhAan8Z/MhvynjLMSxvi9LDSn7SmcvhBLzwKdkPJcU7cWsYXoRRknodT
	eePyk/b3ZXY62uuKtMXQt2CjiKfNQiQsQ5kGHuBGW8UG8if20VkyXFLauNKhEx+l
	AjPq80rdF0hCvA6yt4z73pUrLukFvEPLzJBKLxKcu9D50cyDYxnr+qe8fN2w9E3k
	uiyGppf8cRFl5J1WTe3pwBd//dNYZ0rGuyxHbLq9y64TSsfs+o1LUNIRdapo4mi0
	k7LBXoIjXiendtEBCZs1wK95NPVrmhQ/JgdZb8sScBbOqnFMwIQMma4JC+4CshSb
	seCGRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt105j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 10:44:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf6acd760cso40672635ad.3
        for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 03:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717098; x=1785321898; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAAgAP0V7LjmvDcg7cU4QtLN1FT+eQx8NoMPuNIkpro=;
        b=OWtTMQkWYuUKcbBlPZhtI8zM+oICRGBVvVSDGWiQRLQ58Shs0Odm3QCseMNe6nhrcB
         +Y8mDOsiqClUFIDckQlKcQyMML2fqV6OFgY64DKv05r/NwyN74R90nCbXW+3LORJJBdG
         5oFgo2o5zZBcDAyI8RAxrfFgSDhxbYuAAu/PbEJjRf9i902lW/fIEdIKuPTLD2pL7Dyn
         JMelowej/nsHFaKRyMqWcB9f3Cg+BFVkGXvQqSxWJ4M1pVBPHilG9cRxKrieG4VdqcSX
         o2C6NsKPSONysaqOdlBJU6QgymZjXSEItAoDLbJdNvKOfUKdi+i40hHQQ4zyEU21hm6a
         x93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717098; x=1785321898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAAgAP0V7LjmvDcg7cU4QtLN1FT+eQx8NoMPuNIkpro=;
        b=TmedUsLv/+vTd47HQw5TosXJvVXML3GHRDoNi3zUljXKdujq2Tb3ey6JCLPWs5UYxW
         NO4bY89EYpkQENBXkJw0BYArB7ExtBZJOU1GyK7/iIddGkWeSya7k2oxrwBogQrpjRKk
         Vm4AqyKDH+feZROWWef446CdOdiibssOxMmrzVsoY+8vMn7qd4Hat1RuFpvDE8CovPTN
         jxHeTiGZ9hf1l9WHEdpYkheGXTByy6omKn4bLTWIUX0KOgWbpWF0FnAIcaPRTdOqaNmh
         NU+2tIAJGl9fYqVNibgPXrFLE/F0IjWHXmECeUADls2ad+0oZ4zvtQll0nGhtAM8rROd
         JdXw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3bs3GLjw/OnzMK4OtOUTblHLDXAB5oRtrgQC3p6HEhZc6oXouL0XSvdZ89lX7FysX9t8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo/F7z8kacK2/ZmIUISB3VTXnWdFaV9yB/PFqHWZDgdt05YT/b
	azIbohmcNmlpCTQ1Lc+Z8Js7dpOHyuGz9ZUqsOAYHZT0QBFAiM4Xp7+kdvnIit8VoXLo4NeI6Vk
	4hZcCV6J8o9L2Y3wTF2qeuKwtUItOm3LmgOYmP+1xRMGEc9CcWghFCUk=
X-Gm-Gg: AR+sD13j/YFl49hHj2VWBxS8SojvbkuphGk5tWH0SHligc4MaakNcrpmppsgCKNqraB
	YhfLuIHjf8n/8+93R9I0r9ZdxFJ1raqmscYfB0hSxNX7KQvN57oY1pN9o7zXWiSQ2zN5JOVxg1a
	2z93st1CqJ5vdkaplYIuDs83jtvnXeTw5j7S83qMkQK0YID3XdJ0IMODG6trT7fWsmykBna+/zn
	UpM7xhVZWX88qfKsB152PzNKs/x5NeQzuVGaIxI0YaHhgXmPGqiSnF5azR3Q8nBuKA9hyahTCxq
	lOnazVAIFebeSa1nO0natWcJo9YHpi1N5vxpNSDdeLhhp1/eilQRKHjWBgxL7pU4+zu3SHZvYEj
	7qzwM+urpfsASRDkrk56txnPMjUTXPhdt
X-Received: by 2002:a17:903:1c7:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cf349fb45amr235093265ad.35.1784717098439;
        Wed, 22 Jul 2026 03:44:58 -0700 (PDT)
X-Received: by 2002:a17:903:1c7:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cf349fb45amr235092945ad.35.1784717097973;
        Wed, 22 Jul 2026 03:44:57 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e797asm12382455ad.39.2026.07.22.03.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:44:57 -0700 (PDT)
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:14:41 +0530
Subject: [PATCH v3 1/2] dt-bindings: thermal: Add Qualcomm MBG thermal
 monitor support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-spmi-mbg-driver-v3-1-ef73064f2789@oss.qualcomm.com>
References: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
In-Reply-To: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: VZVXMUk81oto23EIPt0PtTCd2yocKulo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMyBTYWx0ZWRfX82nEjKhdkDuW
 hEcbAyOi3EmRlGiZRgjQRgynZQS+7wlZRyFkRify2WX4P6K7LUBgUAeS3ShXZIY7SqHDC9a1MnB
 RnbiBp+D2IpPRGnmE0djCLMwX9kG8tRPjac5AAkM2sXAB1xI2R2x/WyS1CaxsU/A+Ms/nYNDl4b
 nqheOBDfuOcwvTS8sgZLFE/7ptSCh+wYWLvj8Af6SI5n1DqWh5L9LaaAD6QLPJ+4ewts4WKJRIZ
 xxURvHHDCee1SC1X1tH36hTgzA2QRTcOKFEitrWxgGpn8KJU0qB2BZYsUF185LJ1iaKB46WPDu0
 vAWh4ttH3eZfoeHinom5Pu2y+1LWsnC09rO/mPOXtHBTQci8IcVtr6sUPdabSBGvXUaaxs0SVdm
 clPSXWW5VGjcmAkaanxD2mjI5c2ObnA1pnxdTDY883cFwK0vnAmk0zwoH1QicZZnuFJR7DUZGyJ
 Bpl+Nybk+C8TIqNgnjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMyBTYWx0ZWRfX3B9Yxclxhs8x
 vIUXXP8ta5GUVlN8iZNartg5/ojg4HnV3RaTpY/ikjEPBsSE+JT8fNIZpCm/AaU8cQCvP7u4AY+
 CnTgr2jCprbc8W9qvv1Yp/h1sZ1JjPA=
X-Proofpoint-GUID: VZVXMUk81oto23EIPt0PtTCd2yocKulo
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a609f2b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=E-gG5h9l_blIFwvKag4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220103

From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

Add bindings for the Qualcomm MBG (Master Bandgap) temperature alarm
peripheral found on the PM8775 PMIC. Unlike the existing SPMI temp alarm
peripheral, the MBG peripheral supports both hot and cold threshold
monitoring across two programmable levels (LVL1 and LVL2), with interrupt
status reported via a fault status register over SPMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 .../bindings/thermal/qcom,pm8775-mbg-tm.yaml       | 72 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 809be2756a0c..bd77cb7173e2 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -194,6 +194,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^temperature-sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/thermal/qcom,pm8775-mbg-tm.yaml#
+
   "^typec@[0-9a-f]+$":
     type: object
     $ref: /schemas/usb/qcom,pmic-typec.yaml#
diff --git a/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
new file mode 100644
index 000000000000..2e084d040625
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/qcom,pm8775-mbg-tm.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/qcom,pm8775-mbg-tm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm's SPMI PMIC MBG Thermal Monitoring
+
+maintainers:
+  - Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
+  - Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
+
+description:
+  Qualcomm's MBG(Master Bandgap) temperature alarm monitors the die
+  temperature and generates an interrupt if the PMIC die temperature is
+  over a set of programmable temperature thresholds. It allows monitoring
+  for both hot and cold, LVL1 and LVL2 thresholds, which makes it different
+  from the existing temp alarm peripheral. The interrupt comes over SPMI
+  and the MBG's fault status register gives details to understand whether
+  it is a hot/cold and LVL1/LVL2 violation.
+
+properties:
+  compatible:
+    const: qcom,pm8775-mbg-tm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  io-channels:
+    items:
+      - description: ADC channel, which reports chip die temperature.
+
+  io-channel-names:
+    items:
+      - const: thermal
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - io-channels
+  - io-channel-names
+
+allOf:
+  - $ref: thermal-sensor.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@d700 {
+            compatible = "qcom,pm8775-mbg-tm";
+            reg = <0xd700>;
+            interrupts = <0x1 0xd7 0x0 IRQ_TYPE_EDGE_RISING>;
+            io-channels = <&pm8775_adc 0x3>;
+            io-channel-names = "thermal";
+            #thermal-sensor-cells = <0>;
+        };
+    };
+...

-- 
2.34.1

