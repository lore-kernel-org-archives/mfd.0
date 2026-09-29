Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE452CCDE
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687443; cv=none; b=TAwfqUf7KQ36qJ0uQzo5X9FcM61XlgcUfyCopEH6qAgKy6S4fUF89Pl1k5UgKdN2agvzJWEnQvUB9Mhp1V3IPTuu0HQ8ldCeJv+vSOseiRUC9ORLofELJHQ0XrCNfCKLF1KrxyTDrbmcxdST7n9p6BIDP9f+D9N/XPWbn/UGOcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687443; c=relaxed/simple;
	bh=c17Pf5rnH1vsI/iUXo1whZ8puXHwRPELdp7vpdeXB+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sCp6XlSxNU+wQHcdvRbcibAI3Dpr7QCMKHKhB/wTGjJpwACHOr8BUeybt8nqIs8lA0d97ZYI1afplU+1MWJmjGaud9Fraz1klI9soENKCgRGmu0emcFRB4hN5cOTBr+cT3rTDgWwtZdxBb/ZcMcZQoYYPEC52w+NPc1YsqYvTeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtxTDD3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EA6fNAVP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtxTDD3v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EA6fNAVP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqg9U4151409
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=; b=JtxTDD3vOv5Eg3EZ
	74SW4nZDTmR5v3LuNgsquWaCmI1NIQdU4qegJMnTIYqCwuHKtDwNh6DLzM3zh+jj
	B0CDbneX5meq/rTsE7Z6iN3aEVcvIhs3F0amJq3q5WGMApysNQ12sOFYLWr5NwTS
	U2W/7nI5dm/pxffyQCViGRVR77JgSJuAP/fjNf8khRa8hBerry/yvlAOnxVTWZcm
	jmDQ1n/ZD87ElOn+f3hQ5gjIFrkO/df0Lc6iC2GRfDmcT2TNUr8gEty4BMzgkd3e
	0eoK7qILGkiAOpO8h3WdbKyTOuX25gVZw5xyBC6VF7Y3ov+2/w639qsYwRRgfKRS
	hmc9mA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnc68g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91430af782dso94189616d6.2
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687439; x=1791292239; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=;
        b=EA6fNAVPfsCfw2MJ5f0qFZRQ4k+u9p5NhSpyQSmLL9Sykfr/KwGrrOE7a2hWMq7v84
         Q5cez2Ag0Izw+JBNXJJ78mLGm8w+888Tz31EAYE63LhGltV9a+wHGQwqjF6gkXPg3ItI
         czlDK2zDABGqRAQCZN1li4f874/DWUSXgrt4lv45jXCNACIIid/jC6ezmv0AKf1C4JY0
         Zu3eW8N4etir1Kqd0kyvj4qhSm+wS9omyojvQeXk52c49Uum038oGlClW3lb7RnIkC5/
         XNITir/EZMOMMFRB3a5+DqOWML7RH9fd/8mTo/1srre8UoqroAMAXfPYIuN4oTAUh6wL
         jgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687439; x=1791292239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=;
        b=TyykztZDyUYKUrHsR+nd0ihaC34pU2GhJILTonZ/m1wuT+CiMvORBFq2UjHs2nR+mY
         ezfE5m5qaUcU+13uyOEiGWn09n3As9XGVDY16FFeKcBMFbhTNVeY+OpG71kyhiKm6kGX
         4R9RWbzY9tDFojKRIbTzFBOBk6ykT4JhDMoLwtQ0sfs8pz43Tg+KGDGrmBy9KyeZUP4E
         o724xquqnv31Pm4IgtcQ/II4h7p+KyVqTJEoz2WuTMFf27J5HtMIsxT4o1eMx3BrcclD
         SB8Gkr12oazY9CiJmwfUXyhsizJtqKM2bVKxcUTBFNVe2vSAH8g7np5Iv11gUrwHyqFE
         15SA==
X-Forwarded-Encrypted: i=1; AKwUvBwvcVbAW0IORwTFppqcZ0js5kiVFCvCTYO974HjLVAexLnUsqyenQSzki+gcNZlDvnfz6k=@lists.linux.dev
X-Gm-Message-State: AFuF++lLuhTTSB2VQrv75IlV4uMIZgJaAw3HKlcemHaJmnomZ7epM0uI
	ymQUqz+9bcCQeyJQfHUJBV6qt9wG4o056JHfPia1LRm8AZ+j/UMZVIvsWMBcvXDQWDkvNUIfXts
	pZcCm4knfl9BGh9Tm1K+Ku/yVf/50v5eVmrAA7D8JAt0MFTha/et/2t8=
X-Gm-Gg: AYBFou1ZsCLJpQlkofFwnfPoae84QK50khIJbCQ9MkFz7iMC9TQ6az9vhyDGJ7wmBXY
	G1N7JPjtXzKA/54phx2sPfkHP33txNVv/2BMkHKhRh1MsxCJv++r7UNa3BgfqA3D1EpoRdl05HZ
	+perJxrZLkyuWbItBE1sO9M44k1+pBmsPVydbfrxa5nz7Tm3ObljsuH6qP/us3Ln8dy7shSkjos
	NhCPsSTsA1b9tZDOYB80tNf/MEcikuvfWwoRxm8hP5oEdZQ7CFPUom5/9KgkGujr/kwx0E5KZPE
	waIhkOnvnkylSfZHBevoMc9thMIs6fG3+pvMgdxDBIeeYV9p926iJvt4hnFxeZX3R/KvN2WDa5l
	8hdyGTNYQXr536eAPazlt5WC3gbCQYZ04XnY=
X-Received: by 2002:ad4:5948:0:b0:912:517b:40e5 with SMTP id 6a1803df08f44-9142f92ab08mr245699086d6.44.1790687439062;
        Tue, 29 Sep 2026 06:10:39 -0700 (PDT)
X-Received: by 2002:ad4:5948:0:b0:912:517b:40e5 with SMTP id 6a1803df08f44-9142f92ab08mr245697826d6.44.1790687438088;
        Tue, 29 Sep 2026 06:10:38 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:35 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:39 +0530
Subject: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1258;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=c17Pf5rnH1vsI/iUXo1whZ8puXHwRPELdp7vpdeXB+A=;
 b=XhwaVHJnLjC/IgFYYs+mIbCRbw9D2kBck4SXpR/pnx7zD7aUsUa8z6K0ZIgE4nKO1zU4iPrkb
 aoKNmoN1I1pAeBy4TRQFW1W3TlnYAaJmRwB+3n/j4KUP/o49+T2NKst
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: JWi540N_ERfQDAaa-8fB194UtuEYR7Yh
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbb8d0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXwmgI0G9AUrvA
 Ruvzs5+9/mhFhtxH5SwCgBs21oWoPHNKP2Sey5WTkwicGrd+4HyO5dkF3ZU1Ib+qKnDksAf+Ipb
 Kt9+zAIZs4Rj4UHV58SjY9GGvpAhbKidFL0hAq9cCUwSKECRmF7yd722M7SO/S4159L7ZbdOdRX
 jPRTli6zmzSmS5BLK8X35zqo4jo8uq5LeCm6zi0nz9/TkiyHXezobZ6Ipkz4AMagLVA00WxxsO9
 j3jcnxs4hb/x9e3o9Qkb27jEuk8Tex4i6W4QolP9f4xF/dzXMCUjq9X1504j9Og5opNmSt+kIxx
 D+/n4Fh8FBWEIq8ui+U/XuNzQ2sUZ5fwBZHlIeTJusGCfyEaO/p7SnkCq6l088XgF2VRCzE9jUr
 yrV8C3MoN642S8YyoMwV8NDpkR1SXCUkIcrnHeTwoZijCE222kHTOJxJcxIykXHLDpPFrWxGkRj
 d3WWSJRv3OZorFZHMig==
X-Proofpoint-GUID: JWi540N_ERfQDAaa-8fB194UtuEYR7Yh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX0Zp08x5Nk55u
 I98A7Da7ACqMOdADLB1RhZF2Zkos945Tb4Qt3AeRHDtFkh1GxgpRFwjaIJ7xB5fm7WibJKuK4UZ
 3TXX2oM1FajF1SKKgS8rZbQID+HLjYM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..52b5fc1ef9a3 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -41,6 +52,7 @@ pm8350c_pwm: pwm {
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
+
 	};
 };
 

-- 
2.43.0

