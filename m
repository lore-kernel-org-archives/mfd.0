Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD03C46EF72
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658643; cv=none; b=dPo+K6UuL0aMrruT8zD2yP5SO5neTVvNDwYwstSyDQFATExFbNOyEJuqSWAvajCWQT+VTQ+2y3jR/w2qQTpvgS96PKU2lnbd2g5Cm83gbbVpKxGlwhBHDDLhCUeUJCX/N1Yax3/VxMVQ/39d2yIVAbdUuRJWZ7r5BHd6f1yBx8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658643; c=relaxed/simple;
	bh=v3vp24bsln6ohl0FxV+SSTC/bupGUPgiy+YetmR7ZuU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbW0IN++g/rgiHtlcGBZJvJoBG3kovEejcaW/tVH5zX6LoO1dL9rkhtyVkcWAUhc7bEXxgiBEkmeA0cHR8DXvyKz0r6tsxLu4T2CBEdyuxSiPBwKKWbiEAil+zSHhPH0FKTS+k9exLwBMMP3w19QI6AM8N53L8UiV9xO3w3p0hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phe8+BOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOQTRZrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phe8+BOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOQTRZrh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2bct2160291
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=; b=Phe8+BOH2X3l7jOg
	TT6BmeUa9CbCSp7+oLM02ZHlpZPdA+H6OkVcafE7Rkuh3/pVjC1/bLFclMA0UX0Q
	zoJXRKqLsloVYy6SnUtqMMnOLGZ+zAa+a0sKWv2e0G/tPEo3DbeYduSvmWkG/OgJ
	n9UWOCujdm52fCp2RHxjsRtPj/EppthXr2o6KB8hWAsa0SQZdWQofR/yRQIE/4Ge
	67Qm9vd/lKGaPF3I+3ovY2JodRoLhzM+18LVap/iOAEjdvS33SLCI5alsPQxufBU
	nJ4vSWigYsiS6Mxkjd6G7/qyoiw1oVZ1+gVQUz8Egrh3YrMLiP2IDlsaH66cBxh6
	6JlWmg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41jvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so1745296a12.3
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658640; x=1785263440; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=;
        b=OOQTRZrhEDxo98MMw7a/OAN/bU8yKf0sKaiwjfLwp5kd2tA6JJSta10SqzekJllbRa
         9dF/D89cxjFEs9/5KIuqpZK5Ld6HKZDfE3sytEUuEPdttRnpig9VA07DHoD7TX8Y3d6l
         hCC7GMZFgV5//xF/bWJIxfXY2LaKNNOHj7W/Lb6IOqWrXoWRFU1zYFnX2V/xgu7o6rOR
         o+YB6+T8IF2wZ+gYIdgpwHldbA0ddtq/AxZl7KJUjVj29SuE7R868r0UOEb4XW5C0QJ5
         hXkdJCCm47tDuiHDC0C3GkYfCRiKnDe1g3PA6JO1heq1yh+F8bzcVdsJqbRUZIYnzErn
         NiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658640; x=1785263440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nA86p3kGXpdPwthuGLO3Ise+X/G1xciDS9aUO1CRZc=;
        b=TX/lY0kmk5c9QXZImFJXU4zdpgYw69MIs5cghEgfgssHVEv/cJw/aGEse+3ZMyicZP
         uIxTmiUCW7iYBvZH6ipN5gEUBbOmDvfatgxMYgSwLRT3kZwENr6fiMBIqlkDdexyHfXz
         D4t0GHK3jrknJN+mNUcUmDJGyGdVlpHJ4Cne140gPRpvsflNjKjyIj3JfdVSFPs4TWUT
         08YR7lFI4aDNW2A9AMS++lKVd75T7zJS2le84FuBTrWhAU/G6S7irxoe+/O2J0M7w9qm
         GGVUrSXNhiKjcw7yYLPhakFFcP5IUL68spH8YhfT8oDVZVavNtnq06VUuCWXli/jDSeX
         H+jg==
X-Forwarded-Encrypted: i=1; AHgh+RrWkgZ2t2xhpMpRUeUWHLELAMLs7cjXZlBm873c4Y2N1GLjQEsmKQerli3hEGcaWP0KLOw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVoSreREo+yZQXCMpm42NSOgkMNOm0mnM3nL7PJZoRjQ9LkKfT
	/mE8g0lnXiRfSiKmcaQN1r1ORSOzkhbRRYqTinRlrqm8bdfGa/qJNAeOmJBSFz09zgM5PeG8CIe
	fMvJ5lNLzoplSOBhLFzKQioGHCUITo4WjuqVAiOjS2KXTKqauMS+VrLM=
X-Gm-Gg: AR+sD12lqINTzcfS9yemCmUmRwqUGvYDFJgr0PBbKpnffU106gKlbE8icDXEX+SgOVY
	yLqsiReH19l/BZHL4es+IVivwQ7mq6wvTf4jj1Vmlr/WABjjgd/CM6WwI2QAt4+9EWcfjwU6O9Y
	STDjgr09qrPOeYQwv+MtKNwMzlTMDM/v8qGVbCQk63+2OyKubYjTyhUZrBG45pEnEHmyWnovDAE
	tRF/jSil1C4QrerZwCgCrxHelNrwZB81P0olKfXHwJT/yQkOIJ+b5cFBsbGFg+xOrYhLhbag4CH
	HHzWOEPKHiZddead3kKDYhHzV5WJTToqppX1kpNUcVF4qYJ+rfW/NsFP/FphS/Cj+CIVOYEp+sI
	avpCxD1OzIqS+nx40Gfsqn5YC7tCODDOdHoc=
X-Received: by 2002:a05:6a20:9397:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c3ad8ecd61mr20837352637.35.1784658640057;
        Tue, 21 Jul 2026 11:30:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3c3ad8ecd61mr20837323637.35.1784658639536;
        Tue, 21 Jul 2026 11:30:39 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:39 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:09 +0530
Subject: [PATCH v2 04/10] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-4-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1064;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=v3vp24bsln6ohl0FxV+SSTC/bupGUPgiy+YetmR7ZuU=;
 b=NrpsTYx1Q0WH+Ik9RJxlvn86/zmXcPWHNzIYKoYjFmKeIy6/0aZbPda37lvLmqpqR3w4t4cnn
 JaDqQP9nat+BWdIaMxanSP10o7Nh//w1pzk27Efl4mBNDu3dcLeApBZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fbad0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: -fqbyl051ig5lsJ-zWPslFs4d89uomgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXyYrEgAoS9JXg
 eggqxuLbrCac25KQSGpToXcvz63Bb6J64rlhqFbqMQxHt1aKxgBAdfT4kfWamilZZUY+J6FJdpi
 Y1OdKTG5M/i6eMDi5WnKITBpDd0wypGaaAFUc/Bqr67NujQaJSbizuh2gdIKSHAgLHlvypr5q4c
 E3Zwq7MtIi7VTgG5NAXllS23cgLwq/9dHAEVX8cBe1XxwWSUS6VZov3pSvQjRjP7+Waym9jkE6r
 hPGrclXYpSXJrjE1nuesVLGFstGzcFVtbNl6CUYHGNKyGALoWZLqFlaSOcPaQ56XLf1dILzRr5Q
 drJ7r0DulT/N5LDccMa0Uh7K54igz5Rj0auEg4+6kiJVjLb3c17Dfk4xD7zudIPkVMicq+mHIvn
 LfB/tdivh6xiiAbW9t/cpvWjc/W+CKvwmh7vPNup0+rpdesVNy8X8ddX6J42NoIBOYJRRKT4UeI
 jP4Z5bEXTxJ8sWwXEeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX8eJZALwNuT3G
 D+iWqOdcbj9yCmzUiUOPpd+KRJ6bhKWrmEXKQvm2ctJxnLxs/YcFKrfVji3fLmw+13m4q+ltflH
 EZ6IeX3OR096v3Gh9bzjoKrGvXWkEek=
X-Proofpoint-GUID: -fqbyl051ig5lsJ-zWPslFs4d89uomgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 6a31a0adf8be..dbc4257c64ce 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -515,6 +515,15 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

