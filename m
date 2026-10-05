Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C07481AB3
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203163; cv=none; b=Y6f8iugq9GZLjWa6MlYsAmidbd+ZlmY4FGKMk7UOFLpHtJVExIrN8OFq/Y8PUw/Ft0ai8C9bWg8herNosYgqn5gf0qBL7omta+af8RMuPJgraDDCH23Wzr+Yuw3vbvh0P8qFqrGmWYZhxBtaGiQvRF7wFNYDqdZhKyIBz0njE/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203163; c=relaxed/simple;
	bh=rsNJE6rdBqS/rQ/BelOoDUkPT/XAtADfvhPMMgL5o4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EUpvVoQKcZebKyLmLbUBqrYyiS95gvs9IVI8I65I/2dtoJm50wRIF1UjlI7lUv9Oky5Z/t9pcJiKIDoDvTnHP7Gv1a+OrpKRz+NVlyP3e22F2I7Ka+a9GDQuyJ/q5fhE4BSMTopHUD6Mrqhj6IFeJe9PBR/ibUALcLELZQfxh3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGaJAfFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjO4laM9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGaJAfFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjO4laM9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFJ8c2897515
	for <mfd@lists.linux.dev>; Mon, 5 Oct 2026 12:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBLuCW8bSwBh3JDmqul2Zcg881XCgLML0pMkjxqHcw0=; b=jGaJAfFfrN7F68ra
	KPQWVWIDxoFLbcaQ3OM8BtAbkmLI19mxUXW20Oxn6guNcCc+oM94Et3WE8iHxvgU
	N0i9KHmOSXReLTir3S+AaPSwxDf40HmeEEOjb/bj1JW6sq+4hjd4pAG6TQSX5mCA
	ZtxSIToRP+AcuIiVRvVBIPdgT+kV0kjs6/gvj+9R2+Rigb4lIv6QU1BP03nmdtl2
	XvVOx4CRTgd/yUV+sJ92SDMEkdJxOWoObE8EUb806+sQuoJ9v3GEoKWKMojWAAh3
	euy0fe3YD1VU13eaGuJ8h8iDBQls0rO/Ao+3Qe/etML6pgaAiU5hUMia6u7/MGqL
	64+pvw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssnrun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 12:26:01 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-809f1af7992so3784073a34.3
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203160; x=1791807960; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBLuCW8bSwBh3JDmqul2Zcg881XCgLML0pMkjxqHcw0=;
        b=CjO4laM9jA31mb/0vA2yWQXFUQvVN+f4oRcaSZQz40po4DYKrpw7s8G6kLocf0dYiX
         NP4sESPDy2DHkx1N3DY465WVrGIr4ZuCg2J0YGE3uyXJix+F5/KZ77CbozUeuBsaUpnP
         pnuptN5G0OBsqzKMZrkKdepzONJGpwM/MEGTHsarPoazrt+GiCi7cRtu8qs3EgvBYDSc
         KIfLGL3KT6fHAsEhTn9of9HjKwZcvFMhMQi+uMUqRp/8tlPa0iujtqCV0AlUITHnrnxQ
         Ri4RLJk51K/BRKGIbex5VAkxlWsj5EJ2yi/sTilAlHXHamV2vro5dNhNFjdUhUwNZ9DG
         iVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203160; x=1791807960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBLuCW8bSwBh3JDmqul2Zcg881XCgLML0pMkjxqHcw0=;
        b=YlXrEQRbJIaQwH/VEXpJPq3H8/hBMgfe3FzqW7lR6QlQP2fy2h65ObwpeJinT0MceB
         TAX4pXSdXxyvwGwp7e8FX28uchYY0m31O1WHBERWMXvMyy6vsvKra08pBXJxHPLNxBd2
         WOZXARwQsw0mkJGwFRO2y5mxP49WDJSilwQdSSvBmUuyHqRv0AEW+1Ss8ro6ljb6p/eR
         yItNiIgpstHYmLXkk/dSv50IgVpbTrTLHWR78BekoAotXYaaMs+ZOlIb53nFRwPbxpwB
         9KEG9vRNUjR/UaP45a+FFDDlS6Y2RWQ5zE1BaXJPfQSjr6jT36sCzAnql2Upgd9o/Pa7
         KP6g==
X-Forwarded-Encrypted: i=1; AKwUvBwcPrtu0l1tRJnvmBXXC0iLmdNId8JUZ6yVVTaVt/cWgyeueyEk73HPftb/pdCGkgM3JRQ=@lists.linux.dev
X-Gm-Message-State: AFuF++npfUX0UnsBmnliSEBT+kMyHUVXAU1GYM4gPqFCb+S/3Bal9f2b
	zkygETBo+jWfVHGzWaVmSuSZHsupSOmrXwo/SDK5lSVyL3f3Quud90MlFVGi4483ZnEkIWbdOfZ
	fNVDaFJXYkTT5Hcw9/PX2ijTvfDpPOaXgBFe4mceLTkwLXOZ7Hc2dVvM=
X-Gm-Gg: AYBFou0zaGlRAyRbfMd3PeyD9C1S4WqkH61UZ+A94ChfWVUVfhwSyqjadG0vrrMKEcd
	6u/dA5Slwfag5jdWwTV1tGYfOacsShILPhv5uhSkQtIKVIvjBnH8tEEz+yVBUv3LKgGwqqMs8A+
	ajBJjBGGAEosnzp5CVTyf6f6EndDIB+0xgl9neiCAWIQn94S1bNUNDzz2tneIURebPTUSgkYstK
	0j84GU7cIsmxAJkwBR2QsD0hLdgiDdIUebpm0jlgEWvvDfdkTNhX97VauNyXt4G4ZuZHMj/nypf
	Aipdw4S3uDEqH4ADaplocPPx3WlK/w0mnePiLbQQTzFqm2pGUQoGQ7pDxjDyGsbI7kplWfU7Now
	auS5eaGR1f3HRe4Y1PSB9qvax+Rkopt1aqA==
X-Received: by 2002:a05:6830:926:b0:812:3a52:16f with SMTP id 46e09a7af769-8227f99b0acmr10283554a34.3.1791203160247;
        Mon, 05 Oct 2026 05:26:00 -0700 (PDT)
X-Received: by 2002:a05:6830:926:b0:812:3a52:16f with SMTP id 46e09a7af769-8227f99b0acmr10283503a34.3.1791203158986;
        Mon, 05 Oct 2026 05:25:58 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:58 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:12 +0530
Subject: [PATCH v4 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1209;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=rsNJE6rdBqS/rQ/BelOoDUkPT/XAtADfvhPMMgL5o4U=;
 b=Z9ExX4EPJmHYRM6OMQlJF1Qw37mBoGoH8gb7spV/BNq+wtv18xJTFrRFw3gSxi/Y1NyHgidqC
 8FydNoUpspIDcgC3Evp+u8MTKYBxkJ834tGf4d61aZdw7CMqwejh4Ib
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX+nvMADcE52ne
 UgVQFJClQdwJdzhojlBHIlK5oKPR244QtXsR3MPxxbSX3Nfrvc4p8yX7PQXzGGoTlVrKr3X0iS5
 MCMRv4RhdcbVb5dSiGSdGfs5YEuvp3s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/GdR6CATx397
 /OSBtUkkMwugVWyRDyZnfuVJG9bEP+hDz1bhGEotO90xU0G+HqFcznVigKHn9UUl5yQJo5UoBgG
 +b7E446aNV+9pG1vceve5XCxl5N8KpqVMrWbBdkb/8I+f6msgZ1NkziKqZ2apKx3aM350S8hC/Y
 kYVFKolNAymPo1PBnGJQCNWXIq7zTTRJhy2RyfR/izvUH0/1VM2b2p5Ux2v83aFaYbpz7kW8e+F
 0KPaGUGlLQ8uJhQwTmJtt1L732aA8U9sFBvqtdCgnXE+ogGLv9Yfj7cAKMJJC2Y6C0GjOLaV67L
 CjU3u6bAU+KR8wLo9HsnyXQMHm5pW+xOYlawdpLUB/USaJrcH2zG7E/dRVShzrC6kZjq7kFX30J
 n7iBCAkHnCnjI/kCCoqXUKWTUuV/Bdu81JazYVYnveodVds2XSmxjc+QHhPgEWi8ULcSUxfNU0g
 vsbGsX3hJq72F70Taxg==
X-Proofpoint-GUID: pNFFAog4PgK1HVPDYe8pGJFva8M3tgse
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac39759 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: pNFFAog4PgK1HVPDYe8pGJFva8M3tgse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

