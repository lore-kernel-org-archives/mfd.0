Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C5046EC7C
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658638; cv=none; b=SLhI3Ay1She5tkpFWXlDStLVRGtqm8LsNimwnLvsQU+kEHVETglrQa2Hwhm3H7qtoXVbUYk+MUzEX0yjh4PnMot8ztm5eGOHPqck72PXVrPEMmUKY3IJOl88OUQboZOvHDuNm1uY4e6pcLUQqh+QxEasabqwSauQ/DMTUthyefI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658638; c=relaxed/simple;
	bh=1Pqkbn5hqyaopJdPtLk1GZ1hiRSynhXLrLidzGpt6kA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrVq0BaedwZCVMAw0h0ERMUhP2BXWJPMvWIEj2DdIurbEQcHv86hX1QlXmmdTduJm4loCAbDHEP5R4B/ipJ9QhfhFVu30EV2EfD64HEGaR536wxm4yUP/QsZX7NHwcN1nLv5RLNbmIHk23zLT3nhtZV1XXEr3/A1FEDQnqArrNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrxigoRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPP61QCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrxigoRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPP61QCe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRJSr2446009
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEidTGfd350NiX6LoG1ghdp8DPr/Yhbw72CSSnvfE+k=; b=mrxigoRUd0QEc7eY
	LecMBY7uqL3YyHm5Vh6n0Xx0ubg0glPl9ChemIeT5G558r7Je/jk30nYm8EHrAe4
	KqplHgp0NNG4pjLk6ahsXtNH4A2/8bEy/EFopVKLABgpJ5PycIavLuyIMf5qywrm
	EV/kNWTzedceZH7XL9OZb8VadDu4BIxAVetijYH5MEazFyRwpeDoZ5eNlkwEqdYC
	ZBHO1PA4Kkc6hOysSNR+7UMnb0n7OzeHlars+dwU0LaYhhJXupBIG5m/7DDj9ikb
	qQUKfDz6J+U4PmIT2NDstelXXrOtoCuRo7C22+9/bl3TfgJNWA+2spHCufMp81NK
	3LAcxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d09nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c856470fe9fso6837117a12.2
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 11:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658635; x=1785263435; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEidTGfd350NiX6LoG1ghdp8DPr/Yhbw72CSSnvfE+k=;
        b=JPP61QCeIlvmfJty1hIZQp44yY2QPeAiFepiWlKKZytm98XBLVJyOgnuQOkd/c8PeD
         vydIRqUdyJwCTVn4Jut5C++7eGTsg79x2WeKbe483dXZEEduENxoVZvFGR6DcdLhbC2O
         032tv1rzBhV16V1IFvDrt3lfLjw3+0kLB6G8P1HKYBZPOJCm2H3BZqyqILCiYDUkV3hc
         0hTRL11DKSYPQld6KK4v5VqY1HHVSzQobWI2WscukaQnAWV8v9mwIzm0kHV3wu8SsRjd
         vPHHF1RczOXJXu5zpkZ2zWr7z42oVIfVgSbJKa2UrDEf5wAT74J2AB3WYED8aPgBvBjy
         PSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658635; x=1785263435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEidTGfd350NiX6LoG1ghdp8DPr/Yhbw72CSSnvfE+k=;
        b=MoDYzBPylxdu3BXp7Rpow2bs5vI1Ix2/EEZH1ph+A81RJJQRCI8R4lp0qQlcrJrYO6
         75oqqStX153XEpVe8WOICx+1XIqRpuCgF0j4wTs0qew/S0gJtjboWoTznlsU7aChvLg4
         rDsDG1r7VFHEUnbks26Xr6ebrQ00S7WrTZp3KjiyRhgtO52BD341hQuv6SSEL2zIL+eC
         IX8WCWUVu1tj3mAp4Z4VcmKSXVhZ4/7qHqyEXwMretlNG3jmuVlB/nugJtwK441IrGdR
         x7ZxpP2lzD/dDlqKwPWqPv6GZ47RSEOlDdj73SM/WrMoOyAxYuL/RTsvPsdaBIv1KhgP
         AbgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rplm+D0GOXX54nK5PwOKfXnG1KQ1RtNp3U1qhh0Hbx7mmxLKfQmtw2+P0t1wtGseXhtdbY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3oUylrBEks76I4lcrKkK1+Cu01/mNZCx3+OXA2lSg6QxTKxOZ
	eN8KcpAJ66d+7xZM/3f8esGmwHRAx/hKNJ9wgArWmwK0sV1SV+eJRAkndPezTl6XdoeXag+PxcL
	mP6thuxjXPgXqTavPzmwKb9NdaX2ypsyFxG4E5EA2p3V+AvL/XO3dJdw=
X-Gm-Gg: AR+sD12ju6i/o9MJ9yLQDAisPEd/Z8CiYJjI5SJJHNIfCGif8vYz4cZ0tSPRUcQ6iTl
	knm9KJOAZqBgayRZTyeZcltvjWjOgYj1cspx9vzAfFoCGzkfebqEwT2nX+/Sp4luAn7zklqtaV3
	9SpwMBnP4mSwRQYvP/FVNcOtCNsqpxG0o/t1F/goWq5nHxo0Q4sUSOF+r4jtdOulNOwUdUSXsmr
	plVvVUEqAPXf02mDGVa6gQGXPvhf361vbcECk9rbIgjfcp441G2g7qNDJ8O8v1SX78QCxUK3Ayk
	iWQcBEQWSuPSwLIROe7pZVkZrS//eeUb5/b4potZ5M5JLcU/hYKfpSE5c/OzGzD278rC6FruKfc
	nCzOba2iXvg3BNazl7S+ogfvDPo1RqvRTUOs=
X-Received: by 2002:a05:6a21:1519:b0:3c3:a168:edc3 with SMTP id adf61e73a8af0-3c3ad9717dfmr18425055637.38.1784658635054;
        Tue, 21 Jul 2026 11:30:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:1519:b0:3c3:a168:edc3 with SMTP id adf61e73a8af0-3c3ad9717dfmr18425002637.38.1784658634346;
        Tue, 21 Jul 2026 11:30:34 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:34 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:08 +0530
Subject: [PATCH v2 03/10] arm64: dts: qcom: pm7250b: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-3-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658613; l=1061;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=1Pqkbn5hqyaopJdPtLk1GZ1hiRSynhXLrLidzGpt6kA=;
 b=r+mqADAgAa8soyrr+zhORuKC+Ata4LvpjcvZnshc5slhLBFPR6j6Bfx+Ks4Zt4cc2Ik/QP2Gd
 MSioR7R54YzDtYEYJmrUjAwlYfg8mQ3u3HkB/cF1Yx4JRaRgyURrnlS
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: qeWE7qo0TpLSaDtLcalWS156dYUrCrZ1
X-Proofpoint-ORIG-GUID: qeWE7qo0TpLSaDtLcalWS156dYUrCrZ1
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5fbacb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX6l1pY/fESIHj
 5eJgWn2J9XGizVh/TUFY/qAJ6WPv2dRB7usuNxfpKNoPeFj/VQDnjzhb1IM/Wc6PYL4qugxteY6
 zjsZt+TXSyN4yaMj5Z8A5AnFI1BHa5pDHxq+FvPkQkxrJxkZQ8xqywcjVUbcQfXrbpFNjHAia/G
 5ZYPGpTPKnpH+U7Z89ooQHQMrpe6Au6x8tfEI25go9zJBV48LiLhVPhEhHY1ofmKCLr0OJkOKNR
 fgV35blHI1xd/NZaWL+mxLLF4d34oe79SPmjndTLRS7Dn/g3ublwuQvTJWwSJ1xeYYoU1rYl2vQ
 RApiL6B7Bw9dQHSdAYTulyoq6Wl3hqHLeGCeTRvIwL16yG3rTHE5/SVQV65j+LojnC9LT8q0gmg
 zDK5JA2m/Yh9n/jKNLNL6gGBescUUTKEC8ywB2+dFcILMZ+GVz1320Wh7/D5vjEUNH72cIgrgrt
 Yzbk2Yzrf5xV5cRK+sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX9nGGZ3pfG7KO
 pJ3fgSSrCbCW82FTi1kVrCdj4hZYe85T2bsJWYanQtQw+03ppxPv0aCrvkWzLvEyIP2ZLN5USXO
 HXPQ1Qdaw3Q1Eu0lz/7AgTLRW3kXTPA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..1d358aeda9b2 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -89,6 +89,15 @@ pm7250b_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		sensor@1d00 {
+			compatible = "qcom,pm7250b-bcl";
+			reg = <0x1d00>;
+			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.43.0

