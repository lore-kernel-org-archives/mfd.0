Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467315;
	b=E+6DnOMul0Cq5HcpYE1wP4PmVo8i7g2JB+/FhGBtMecMCC9k2GUAMFUs/7sRNRq8EY7Z
	 /i9sTyjmU8QfTBm27CpN1FtKcP7dxVG3aZUIKoButoqEBgAbDn9+IryiABJjTqS2+Cnvg
	 U3+TCxICCNggQ9/I30dk6NvTvxzVTByY4AszkyVbKZECdrKRefaFmcvECi497GnMwPuUV
	 Sg6ZceJDQAV2gTSJHLwo3juILChTYtK8ZmNkzp+PRFJZ47o6rhtvexYUetwYfOtDvmNCt
	 rcPHLH4QgO+9MSidihJR6LKIluVf+bW37GNs0G7wkAQegLA8boTyGLJo/zA0BQmV9bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467315;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
	b=oiQB+LJO3+Q/iTlvQt7fk1+LCIhrzXCIuPOsOrtr3kAJptKCuFn60g1oSkIoz+6Y0Ppf
	 4U/CrTjmhc9ETckG5Dnl22HpnPRxlwUs5OxSOH17OAnGAn5CEqbV1yPefh5zX3RRP+RSH
	 twcMEPxkdamAZa0mDt0nHtBP6Bpp6qWRuD9ZTeEnrlBRsV29P9IYfmdFuX9LBXL8DCH6I
	 rbytgJsS50gyHq90EcVSUgpApwUyQCH2CdveopWRX9fne3CFS0KxdXQKX3f/y+a/aHeGa
	 gm+Cp4MFRy0YqWWD9bvqMCso/3UvdmRCVOhlV6tE1ASlLnKRJr8o/h6dRBAMyn9SxkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXiNt9oM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U9qntrD6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA423606A330
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA423606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXiNt9oM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U9qntrD6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJumFY3963245
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=; b=QXiNt9oMEj0pLkFN
	L0LOpDZDLGuObJIIrJ81O2FypGASQAIhqE81QVk8MT4wMNfn1PxLkL2Ag45cxaww
	tTTA3gNkYE5icDZJELAyeK+pzfjnqVr1E3OoCcv2oj3drHg4vCKGSitTWenLP5qK
	eL+6yUKW5pMwr7kpL5IY7fXPDf8LXw0B2vqnTLi4guQ+XzDncp7kW40xq4lNrm4+
	UwM5Zqji16ndZS7cg1BJqwPZXPHUK64mnz9bpYLaDRGYJBY2mEuCCrCm7fXIW1Ou
	DzH8Qj39TtoWGvEMY1KXz+0BKGKXUtOdybtW+64XoWgVe+etecormu5eYCZoeuVd
	UW9DsA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7u31n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a65fca25so2354440eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467313; x=1796072113; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
        b=U9qntrD6vw42FKePwHi4qHqLtTFEVLmU8I5cL2t11ZM9pJl1pt9VZIRW0orRJLBA3P
         WlBhdGm7Ykq/ZKUvN4kuFuuCqtjPRMic51tNanpxnCOYslIHS9qwJidtxNLKBfYUBv3S
         VxM1naHYOeS+qF+zAMZQCHcEBcXI0N8+iIP7ksOhAnNOi7APzQu2Fs2IlbNSThs3Dxgd
         nMI1kpPFnNWKKhK1nb7iKz8N9ZyEIbXPUcIcFOwelF2of/fBh7DvCf/odrAnwR4PgSSz
         7wFctWdvo74j4WnTdngQmhoViKZxnZzXomZJ/jtTQZaWA7nzbUMUwAbVht8QJ4yxeNYw
         U2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467313; x=1796072113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
        b=bIupZaHUSJnsK2Lwz37qibHkDqHklL9fTWpRsyrxNgkwV9Mx1WaEFDJuWT8pA6l/6J
         XOxOlmc0tYZVSlvfT35qCmaBpZ4K7AapVsLdhRsWcZm6k1a8rK9h3rDc4iyMXre5MQlL
         QHbE2HHs8OV7PU2ZJd8p1i6gFqxqF/rVdtaRaQwnMNq8cqK9+2YUHRcfZ10rS5YWCF0Y
         0xfjIAdJWCTFgZzLdyvmqWhDu2RQ4Drrsj+LNR5gORGE8pcQarFYv0/O3UZy55okBDLr
         uytH+yb9I7IAZ4uqte1qlRJCFfyIEwvUAT62rNpHY+Efiwhk3mP2OxtgtjKpdEp5Jr/j
         XobA==
X-Forwarded-Encrypted: i=1; AL+hErHmEvA8To78Vmmfagk6L516bsJ2NP3Dfqg0JChII1Blup8y9If49yc16PUqhuxjZxXKGhE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8rKI++VsFtfmX3zMoYWOIFSFzfaRG0sL3k+IpCSTSPD6z3556v
	0GL3ta+LQNbqqB7BWOZ5eRdK0erYtWb3MNZBV5PKt2rW7nOV37gdWiOYkt/y+j1lGls3Bm8pJx0
	PsoTBUz0xWCIKdE9DCrP1nuLYdi4U9jIoJkfxFhAOQbfCSZX014ZuB98=
X-Gm-Gg: AZFdTZcFWgCxCwxYrgo6pg86UuNJFtgDVSk6f9Hnq2Z8igPTovxscDh6QC89FGF8OBY
	74sNWO4vQFKOjb94F7ZOaraGPWUsmv6BAWkZMd6VKqqxCFbBwryGxRPOcUZaIcnrI5VBk3Eh0J4
	LoJlCQ860lM+9HPyyeeLK+N+rbdaBfPsNtq+5p2xH2JIWNtBmT+Kpz9UMhTVLLXapj7osb7tSf3
	EJoQvXJPppQAqghWmoWLdNj0szWNNly5mkk/0q3HC+UKALTTK4YSs/d0HeRAzrBZTBQvTJHGslS
	RW2cLaPcbC3Vuh8iKP1zP7gI5qFCIdlrxy0Tx1C/VoupiXZDHtGrssLrlE1KluEkXyjG33hAS4U
	CnfwbIaGJFL6szvzvvEMVtQwMTYH5ggKeWOQ3jCg4x2xufvo4wPoh9rLd9dveAFfeeccZjaY9tF
	Ht865Rskdi
X-Received: by 2002:a05:7301:7107:b0:386:b494:8642 with SMTP id 5a478bee46e88-386b494879amr3280342eec.13.1795467312444;
        Mon, 23 Nov 2026 12:55:12 -0800 (PST)
X-Received: by 2002:a05:7301:7107:b0:386:b494:8642 with SMTP id 5a478bee46e88-386b494879amr3280297eec.13.1795467311875;
        Mon, 23 Nov 2026 12:55:11 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:11 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:41 +0530
Subject: [PATCH v5 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-1-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=4396;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Gu1GpC+38HITi2Er9kUG2koMItBv0WwtKRBZ8DxvpQ4=;
 b=Spbejpz/DzxBNIumdqXhcY1cns0HOwt8l9EmATBgk7HpDuClz1ZxfP6Z0Wp2ogKQtV1Mpm8qu
 bWYnfeY2/GYANhoiYy9eR9GYJ4/X6rJA8hCPhbhF11cKueaKOJapzMA
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04a831 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fehuZy28kGTF_x16HkYA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXwPwx+srDdv0L
 cnuh75tN/Ja8L4IYx8ve1XoucnwkAAlFHWrrmrIgS7j/b9eX/KAb4v2bsAK4FFGJiMswklJjS5z
 3fz8NFEpuUZ4SEBvcXronw2LPccaG2cKIJH3YorNAqHh2+XM/UbsvcI3/0doarEEDPcQn5zG1uM
 UQnTSkuE8pW0700+ZP+rii3MORKp/lqRNLRHmx1/eOBHKUbF+RfZKDTwnzF9WoAOlANAXNK+oOE
 sdEjr29Nt1v1OlpHhlgDG7KKNbIy8rsb5c/lgIzS4ttU2Kzsf2P2H3upLXE44ICHMZsrQzMen/p
 CIbzmSPQjECtn/4hSMMWpOjepgje213nBZ2h2YbMNusC3BOU1pEz98Q/6w2iuvzUrhFd10gxn8l
 6rw+0y5QBugP5+gLjyvLXYwZ7aG6CSm7FNbVrQDFjCw9oH18f6eDuyiaHopgLnZ3mR3Z9oDfoEo
 7EjfjJDUWNrUclyxojw==
X-Proofpoint-GUID: 8DIxq8q40HaJOxWaKmzI-14yknB1ev3l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXz5zRvu55Aav8
 IkiKro1e7CLUZo5Bt64/SGl6SEvYhumRyaKvSIeivCIKJKFAav41zR8hilgtMCLkdX9dpy1t067
 53MGk5uyTZFKTrQNSbYWDrMspnUbAvA=
X-Proofpoint-ORIG-GUID: 8DIxq8q40HaJOxWaKmzI-14yknB1ev3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a devicetree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 72 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..2bbeb35f207a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,72 @@
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
+    oneOf:
+      - enum:
+          - qcom,pm7250b-bcl
+          - qcom,pm7550ba-bcl
+          - qcom,pm8350c-bcl
+          - qcom,pm8550-bcl
+          - qcom,pmh0101-bcl
+          - qcom,pmih0108-bcl
+          - qcom,smb2360-bcl
+          - qcom,smb2370-bcl
+      - items:
+          - const: qcom,pm7550-bcl
+          - const: qcom,pm8550-bcl
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
index 7a889d888383..2c3b60437982 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -197,6 +197,10 @@ patternProperties:
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
index 9cd098f0d91f..36a470c859a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23080,6 +23080,13 @@ S:	Maintained
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

