Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690836;
	b=oNfqyG+4tbbSzEuPR4TqVzc+GSDC5seCko77QKaERzsbZuY0VOpOgafLMzia+BPJG5uy
	 epFR86NpIguhABq1SsaD+2S6kVcuWmxwceg/T5ai386iN1bJTQh1hCVIlf6PtQPDKWHGN
	 obSuHK77xXzPF2PC/llubuQb/nypLfHCROmUm5s0Xrm4jHDcVl4DOr0xSesRMITwGR4UH
	 ggl3w8BQtBxFlOlvmrkPvW2cW/e6BZELn1Qf6Hu1f/4ChhPVPLcl5Uez9+W+c/zwUKsTb
	 5OepWQoRwmaFHg0tldJApOIzFM6SP2BAzwYLWeKLBuyZH7yeCLrgOO8NA03CSMHcyEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=;
	b=dsFUQtkTvt/6VX0ykUN2SXnL2sJW9KFD0z2af2dEpuen7bzuORjHCJ5R7nNOt+ik0Op6
	 tBCaB9lrsxhwx0lXgfTpWp9lN1ZI8rBq+lw0xQSS8alZa+wkzmu4qstsRNbr1xoDuIObz
	 4ThBoKXtl2f+QJ7V+iF7/WQ5xx9rrd9pKnO/AMcptWw2B4gCpftLJLpRt7UCx8tsAL7re
	 nSElIe8hqShRImshrPPpR0JvMBLrzQMvSJ5aHG01SIWZrREYUmq6xdS84D66l4K0t3IS0
	 Ug5EFDYDFqsYpSC9mWQkXorGfCN8Sp6uhkSnPGq66GhIs7al6/OiyWAsmK65FNGB6Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwy80TtI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RUljlobU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7308F606A326
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 11:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7308F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwy80TtI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RUljlobU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXgEt2631206
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 11:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=; b=fwy80TtIGhc4VeSu
	s/5RoI7VGxBPpvJuw6RovybbXd3p3ME60tnoxYEsaIxn/OHJAdLfGe2tw0Tj3XS0
	PlbpSUwi+MXk38SwMQbT+17UXkmRCTsICtEMU5NZzfi9vv3kBGe/yodulrdEog0Z
	m3hI2YCX+kE+7vTA8wPfPE587YfRxJy1u5qQ0zS+39gvqKjolCxE2SvnmScFwIv2
	XKEToN3cFc7dRGVw/HyRhSbEnmlFQBSAiFcAzukFOx/9ezqYzABsAIgxIIXnvMGW
	HvLSN6iEwt4mBn9zpePHYwwLCt5ueE2AC9ck4lqY19xc3rmaIZyugtx7T63HAjGl
	zE1qvw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahv44p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 11:00:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2edd25534afso57770485ad.2
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 03:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795690835; x=1796295635; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=;
        b=RUljlobU81e71osM0cua7EEsQkexu6O77QbzZPmv0mFV5RlMN28F0Fd3Yzn1XTu/Mx
         VSEh9TZ0B7EgFAXh7Jpao5qNp16Lkzl+L/SBIw/Y6l+N3zI+iRQiYwTJeQD2RzFcoSQi
         QOgBERJlEGf9wL9sSz08ax/78/brXOgq2FfCEAeGRwq5p6VXTCsbwr3pftCgIW4XN6B5
         u7gCC1wM4hDfjPqRqaaZzP60OpyB1ONio80epv7Y5ESiYpSQHqBqQCNO+kXG8fqHjUvU
         umf6Wu4+0zipA0NunxROaihZy2Em6ZwZMM74gA3kCN+WnL/wjMTZIBdo/HtRzCDXNihK
         zllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690835; x=1796295635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAkpBnZvBiH/A2z/IDAE1d3gkLalf0A6Y5L46N6u7zA=;
        b=G/SJjXywwVVEasmE3DnMjyELsZfvoQf6mtFgIUdEfqPv4CIZqcVquBtxLZedAoPXWs
         LNlcsbja0w/GBWKOH1TRAi/hM76ALyzXn2K1fyNuTJTNilJKet6kYkwJ258aXdSJVF21
         JVKewZ2+8irc3FNpvHZsfbH3XSP+3E9prSEH6skEkmADqvoHUDYnoA7gDAYsA8Bp8Tjc
         S2Nbolb4qV0EgLNich3qD61CsyvSP990+mk2XLH4NgCyF21sAxBIzWgkAdwoLK6UZipd
         ic1JPg5akM1BYXBI/y49IU4doD9/vGr9Y1zh4LYPhmmt4J+mtBo3sm0zeG9LROKPHvUd
         C9HQ==
X-Forwarded-Encrypted: i=1; AL+hErEWLiHYK+rseni0vZ6A8/oNaXfktDiNx6u+Y6KcOHaTKNlRX5JBB12+C6dr2IKBnxZriaY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9bzId/YkXwj1WM03nKih6vIhqbBTet5T06nCTjX6z5/7+GAtk0
	4GL+M18iqV8U/rIB9ph6qveWpc+gLuUOymsQFjuG/gp+GYAcZrPStdS3+/E7OZjpqeJEPUiezNm
	se6MTgVgQOOEj5WP2c7mshZi41W/PLifkEaO7pbdu1wlLPTKKFEtxRjA=
X-Gm-Gg: AZFdTZdVDC2oYSTq3rwvJXhPXMH1ncsQSpG7gK8uH+ZDGSdgQqBce3EwxTroMee//by
	obFnWKOkZ1dyxug8vac2svmpdjUJWBblackJk7QYg3JQ+2JfEEHsYrddfSaQPiPeMm7/72EfC7n
	cUCNvNBBVgd6/pB8sY6i7Xf+6sUuHDUpyJGje4+xdug6xRGpOsWR8Ed1UNHKxjvjoT083/bgCxo
	fzJ+mc2+n8IIJmtbf+LrXZgMQsqX0AaKNaeqKJ2slvH+g7Zs5sJlcnLsrmZEYWbxDIMgalB1OG0
	7SCrfJXMT9YAFR2hinZuoQZeC+3EkntfOiUF9C56BpGXIKlpnIZmalcUz7E4bgoBHP0dvb+SpYo
	4SK3NBtzDI+rBevQCb9ZPBC7S2yq/r6Hbc8ew4RCufr6538PINxGHFBKietliTE/X/+XXCyCpd0
	k=
X-Received: by 2002:a17:903:2c50:b0:2e9:64b9:a330 with SMTP id d9443c01a7336-2f03f17d2ccmr205396025ad.11.1795690834590;
        Thu, 26 Nov 2026 03:00:34 -0800 (PST)
X-Received: by 2002:a17:903:2c50:b0:2e9:64b9:a330 with SMTP id d9443c01a7336-2f03f17d2ccmr205395245ad.11.1795690833868;
        Thu, 26 Nov 2026 03:00:33 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm101400615ad.17.2026.11.26.03.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:00:33 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:30:17 +0530
Subject: [PATCH v2 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-smblite-charger-for-pm4125-v2-1-20656509518b@oss.qualcomm.com>
References: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
In-Reply-To: <20261126-smblite-charger-for-pm4125-v2-0-20656509518b@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mfd@lists.linux.dev, Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795690821; l=5273;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=AUHf3tX4cjhQLgpG36hMqGc0GVm+wfhye03EyAkWlc0=;
 b=ENRMrEvMGxV35m3XI8+xe//bvjIErvUP53yqd5vdBF8qQggrPqWUlKqu+8gSsymAdOVlKMjby
 qxQCtBCkqdsBoMKf993R8wYV/QluSmaYt8E1qb3SO/jYCH4gZEr6i/5
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-GUID: B9p8JZa-N37DglkKrlefWpi8FFyjlr0_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX+5iMqqUufFCs
 oBRJ9DJSPuCSqIrwDnAPwloU6wHLhV1H5LdUk/+OAhCtUvBZ5aCcEV5CxvuuBSNKBqwmiMHw2Dl
 0MJG04bQaNn2R0uUJ2fU12cJpLPtCWU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfXzWNfnvtOO59Y
 Xrwk+qGTrW3tCmgvzM9RupoQqO4ktoEP8Bw8xatAawDyabUi/jtb5OfoC3LcsdcTt1EG5DNs5ey
 Yu9qD/kevTfKouG2NWMXfwX2fg5Af2Mf4iV0ILbYslilbO7SMk64185nDlhIvbM4xFxthSn9v6q
 91Gfwskk1rO57ooz7XWjsxj7chEugencLqDiCZIAguH+7caK4V4lyMw/eZjEQSfNMi1AAsMk29D
 11pjdp67ddXqAn5JELzMylOUi3mtf5jU+pbTa0zNhG8dbDdsXaEh1zG8CQbndwGb92A3khGfeEb
 wMfKJLRL/bzU656nkAq7XBADlOexJ9hECLYknww+TQz032NjRm/ztOW8Qmy7Q17ZxOLk28ple0o
 a0R+mrp+st8wJz7cOMRXQ7fbW1rJPacHGADzPvlA8OzuNTPZMDSj+hbdsJ4KPCBWga6UaHbII74
 8bJJT2a7P/2RazrjQUg==
X-Proofpoint-ORIG-GUID: B9p8JZa-N37DglkKrlefWpi8FFyjlr0_
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b081153 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=qXe9l9IMIpBVqIDzQAMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042

PM4125 integrates the SMBLite switch-mode battery charger IP, which
differs enough from the SMB2 IP already supported on PMI8998/PM660
(separate SPMI peripheral bases per block, a different interrupt
set, raw ADC-based JEITA thresholds) that it has no existing binding
to reuse. Add one to describe it.

Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   1 +
 .../bindings/power/supply/qcom,pm4125-charger.yaml | 119 +++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 7a889d888383..8c8eec87a765 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -160,6 +160,7 @@ patternProperties:
   "^charger@[0-9a-f]+$":
     type: object
     oneOf:
+      - $ref: /schemas/power/supply/qcom,pm4125-charger.yaml#
       - $ref: /schemas/power/supply/qcom,pm8916-lbc.yaml#
       - $ref: /schemas/power/supply/qcom,pm8941-charger.yaml#
       - $ref: /schemas/power/supply/qcom,pm8941-coincell.yaml#
diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
new file mode 100644
index 000000000000..4c88d836355b
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,pm4125-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM4125 SMBLite Switch-Mode Battery Charger
+
+maintainers:
+  - Raj Aryan <raj.aryan@oss.qualcomm.com>
+  - Rakesh Kota <rakesh.kota@oss.qualcomm.com>
+
+description: |
+  The Qualcomm SMBLite is a switch-mode battery charger IP found on
+  the entry-level Qualcomm PM4125 PMIC. It exposes five separate
+  SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks and
+  supports USB input current limiting, JEITA temperature protection,
+  battery overvoltage detection and a hardware watchdog.
+
+properties:
+  compatible:
+    const: qcom,pm4125-charger
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+
+  interrupt-names:
+    items:
+      - const: usb-plugin
+      - const: bat-ov
+      - const: wdog-bark
+      - const: usbin-icl-change
+
+  io-channels:
+    maxItems: 1
+    description:
+      USB input voltage channel (ADC5_USB_IN_V_16).
+
+  io-channel-names:
+    items:
+      - const: usbin_v
+
+  monitored-battery: true
+
+  qcom,jeita-soft-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: COOL threshold as a raw ADC comparator value.
+        maximum: 0xffff
+      - description: WARM threshold as a raw ADC comparator value.
+        maximum: 0xffff
+    description: |
+      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x5314 0x25e3> for COOL=15°C, WARM=45°C.
+
+  qcom,jeita-hard-thresholds:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: COLD threshold as a raw ADC comparator value.
+        maximum: 0xffff
+      - description: HOT threshold as a raw ADC comparator value.
+        maximum: 0xffff
+    description: |
+      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
+      comparator values written to the BATIF ADC comparator registers.
+      Example: <0x58cd 0x20b8> for COLD=0°C, HOT=60°C.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - io-channels
+  - io-channel-names
+
+dependencies:
+  qcom,jeita-soft-thresholds:
+    - qcom,jeita-hard-thresholds
+  qcom,jeita-hard-thresholds:
+    - qcom,jeita-soft-thresholds
+
+allOf:
+  - $ref: power-supply.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/iio/qcom,spmi-vadc.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        charger@1000 {
+            compatible = "qcom,pm4125-charger";
+            reg = <0x1000>;
+
+            interrupts = <0x0 0x13 0x0 IRQ_TYPE_EDGE_BOTH>,
+                         <0x0 0x12 0x3 IRQ_TYPE_EDGE_BOTH>,
+                         <0x0 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x0 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "usb-plugin",
+                              "bat-ov",
+                              "wdog-bark",
+                              "usbin-icl-change";
+
+            io-channels = <&pm4125_vadc ADC5_USB_IN_V_16>;
+            io-channel-names = "usbin_v";
+
+            qcom,jeita-soft-thresholds = <0x5314 0x25e3>; /* COOL, WARM */
+            qcom,jeita-hard-thresholds = <0x58cd 0x20b8>; /* COLD, HOT  */
+        };
+    };

-- 
2.34.1

