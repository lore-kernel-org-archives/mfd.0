Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC4743B4AA
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768861; cv=none; b=Rdjf55nbXB6qhroLqiIOCohaYNdgz1iNuiGG45vV9kTexpnL7/mSk2jVfpPrQs9aknD80Yci/j/25bZCQJpXUHnv5bMx8MGnrJgPkYEi74z2LsPtq2ecCbx93Sp+NgS+xpMwmd152eKRPtFk9HDWJZEJu9ObgrwYiR5Dvg4XkFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768861; c=relaxed/simple;
	bh=9YSmccNbUMCCBO0gPcnFhs0JL6BQ7ZKinOfjmTBUCww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVInEVlBCpMZlpr0oWeD44kCF2zKms4GsXZec6f4xGqZRmsb+Xuq0AsTGMy3VsAn3cWQejt6KMMuYQGRGFlp3U1G9cw+wNHfi9ubD3hnYTQUon2392OpfQ7k+/of/LqhhVpT5GhorKZ4s31TPEKH2/QcKFk+PQzGA6QCT2f3oRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPdRNTV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjlXJLo1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPdRNTV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjlXJLo1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68787SCF3411490
	for <mfd@lists.linux.dev>; Mon, 7 Sep 2026 08:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCLU3kxIzq8/MCTjl1p5xKWJJRKm1j+qJos/WCdQA8g=; b=lPdRNTV+dWlRj+5N
	PGrIJWBpuEKNamXlcieEIhfWBV3zGwuviEhN0QhTZY515MD8Fkbgdgz94dh5zDzL
	cRVJQrVWPKFtV/9ns9YnUropcpZ62zTNF7eyb4YglxEgErJ8xJSD5gEOPG/1Dkzn
	CZsQ0m6jfsF4sqpC854WExdy/AhkFipPF43se0zxUfZsgJ2mFGJI+n2rTJ0Z7Qko
	ud7NSNOeWluQftmVPXlB+N8SX8/4PQ2lh0NNRECUWhDX4jigcwDRbY7HzUU5vMkB
	zu5L1h4cjbwzOL2rdbGP5Wc35jUDtXLOaWUgaLGXu05lA+q2U1rVpzKDzIhn+Qtg
	xQLAEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyg0sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 08:14:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so7049076a91.3
        for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 01:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768857; x=1789373657; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCLU3kxIzq8/MCTjl1p5xKWJJRKm1j+qJos/WCdQA8g=;
        b=gjlXJLo1Q5BBonmVSKN3XyKBIvcMS+qL4L/yCnMgduc+Vif5dRfJwpgD32X5ONfbDB
         p1dAQqfZBZZsKQ2058sflR70oN8TmXa2R1zeYxULEpDzWaMXFRsYPep7WzaYlOilj0rw
         mxPryDHzyfwbQUON/vzhoYQD3rTfBfQPZqxUwx36aLnIUmasACo1zW9Zr6qSCLSJNuvz
         14ZINfymHgNslGkpAfd1D9tVYK9DwzRv6T7+cvMueTismBbQ7sX1aGbuPwdwloziDA1n
         n0QOJYHqFrmT9QS2nfVazGNXcZOv/C2N4OjHpKTCfaiKoHDuCDl9jJPs9jNtBX0NKarT
         MU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768857; x=1789373657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCLU3kxIzq8/MCTjl1p5xKWJJRKm1j+qJos/WCdQA8g=;
        b=n53DlG5ZkZ4aSaEI5fQYk5IDRym+4d63ybNkf9eNjkQNt0R4ZeXGk+cBIvpWiuBe5I
         K60sd1uO7LhfyUIWZX15TIrg6ib/5V5V+OhecqPSgI6MPvZMdyMR6+pG+NhWgkGz/mQ8
         0ESvYtieTPmUc9LcR349c8HKCGSJTcWiA0voengCabrU44eCdl/mM75qOv2rkjxCOCxV
         Pj7vYi6fjg6txf1uRqlFdKUM4F4PPnh0fp/SXU5bxSdk7eCXZHBJOZIwDTRzxptezIwz
         WShN1dhtTH+Rfl8MTvuCnXyeqGU/KJdTwmqLv4WfI6hbHN/XyAXLv8BZwgq/8RNgoZVi
         HQnA==
X-Forwarded-Encrypted: i=1; AKwUvBwbnBkHW3epLikxFDr9veXzdHM27FHh/5QxE/zdtXxKe0GHki3egtrMtjrAgPeaacYXk4o=@lists.linux.dev
X-Gm-Message-State: AFuF++lfiDpK/II/z0eoSEGL+y3Ctt8FkQXF1g6JDc7Bn1cXmjMDJiHw
	FCnp9FkB0MbwSSpF/uBY2A+3J/yQgJlfE/n3igsibLk817DUVK/7/KJlh0dnVsVLR1TMD1D94Ba
	r8KsrtTvXKTXzU1eaggTStvDfLXfu31PA00v4QjGtSn6YWGNWWO/CMm0=
X-Gm-Gg: AYBFou1JqHnRiPN5xWXFyQ4WMrDigq3XRCMghW7hwWkhSxVAonC5WC5D1OHdG9zyzZ2
	AQFlmM0nSw3x6oYQ8aWdh9+UgyQrhdhSqBXOw9iXiEzKklxAlp4PmStfM5TT/hBx2UGCk2Dmi3j
	NEq37wrltcOC48XikRhM1Vtn6xjiH7tTnaElMU73POyyckbROWAAF4HyPJ7wbnpVIywGIoSfgI4
	bZI5j7yp0nhIafTvvdpp/WsqR3QMf/mVp8mK9safcGEOOwYsQon7PjLlW2l4kWbykjWLKmH/Sgr
	TIHi2qaEwstYsS3GKlzoglL+3jCxq55H+yQHQn7xPcYN7RVB5XR+3UyRuy6WWdZIjoYdNMKiM1c
	f2iFq7UjBUPfXWVKt9iyN0k2wwrw/Jw4=
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr34120676a91.21.1788768857239;
        Mon, 07 Sep 2026 01:14:17 -0700 (PDT)
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr34120623a91.21.1788768856764;
        Mon, 07 Sep 2026 01:14:16 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:16 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:39 +0530
Subject: [PATCH v2 3/6] dt-bindings: mfd: pm8008: Add PM8010 I2C support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-3-75f7982dc983@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=1891;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=AoJ46bykjinzi5CHRfxJnkzB4gRLtxmI2zMTEfoIMCg=;
 b=L9u/5sqhOByy8TAubk9xjK7ku91RoQuKj7maUFkahZ+hPZWBHmj6uxWnCX4BR8irYpKvnI2tW
 7np6GjGCQ73ADe2IFtIdJHFBzQAKZKAxGYoUhcH5OYwQF8f3Sesrax6
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: PZmFb1t_kQL92d5Qq6uB9LcUMsMQo75m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX0JzgM+S5ePSP
 2qoN5n+Ui2wHJoLZ1NZmk1vEv2tF2Fonp6Uxk40YZXTdKpKNNUI9fK6hh+Fqy/HqLUi6wmj9zRA
 UOg0Q+cFZioQRMIgVjkzzP22xwf0dJPWsGbcyYp8v43+Encant8no+MrhQRwm2RRCYPGZV18TSv
 UVY5L/Sq4HnOmaDDl1kqZT/w4LZsWz74DxtxcpELj3aAd0tsOOB8S3ASa/9yl1V0Px96OIBCfyj
 ZY/+TTm7Y1E+08BmGQfk8I3gIIMqpcJ/SNr3hsdiuRIbypvQwgcWNO5m8T6rZq1yi4D2pnoWSu3
 iIKjvRDcBQwEwObZMD+vg26DqQbj5ZrQTVT02F6Gf4gW3hErhJM0ZVHBhoGbPX0xTI3K1qmtck+
 uZ9lmCEsE7d1DSgQAPK1x6YdZ6wor+PyGb4knDzX4Ff0S2lDwg132iegnzPUTAWqtiPyELi5Z/J
 mro0QWLmRY34jExGQQw==
X-Proofpoint-GUID: PZmFb1t_kQL92d5Qq6uB9LcUMsMQo75m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfXxsf2QhtYwRyB
 Ke7TeR3d0sROD3hak7pFA6iufHiBEpglFfIDRv7z17rLir6UvknY3hin6LCVSu36Yeum7NAPhOt
 LyTd+9U8CO9MqzetZ/Jub5OKtEsxO2U=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e725a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5mci5dHc59FVrb-tom8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Some designs integrate the PM8008/PM8010 with the interrupt pin left
unconnected, deliberately. That compromises some functionality, but
the core function of programming the voltage regulators remains
available, so make interrupts (and the interrupt-controller
properties that depend on it) optional.

PM8010 can communicate over either SPMI or I2C, depending on whether
GPIO1 is pulled high or low. Since qcom,pm8010 is already used by the
SPMI PMIC bindings, whose properties are tailored to SPMI, add a
separate qcom,pm8010-i2c compatible for the I2C case.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1dc571af668c37655017cefe82e139..2f439ff9805d253bdd815bc85ac206ed1be964b6 100644
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
@@ -88,18 +90,14 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
   - vdd-l6-supply
   - vdd-l7-supply
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
-  - "#thermal-sensor-cells"
+
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
 
 additionalProperties: false
 

-- 
2.34.1

