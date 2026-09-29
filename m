Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD2527584
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687431; cv=none; b=X4VP/cRltpsazq3+ljGaSuO9/R7Rm4WFnof2wyMgpcupKNycVfPR102er8EFX7KebiuK6U7i13LV+F/03vOapsKtB2YyycrXb6DaZdSxYcun3LEWBem1vorDFAY0wb0LnvbU7we6K4lWAf0AmDKJP2kEkWOj+QqDtN9XKpmHcTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687431; c=relaxed/simple;
	bh=mPGy83zCIZIUwpjE30P3ea5r0XwYdy+rZle+WQsh5b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vv01RJhCgpOULGWn05US/FzOKQSk2J3cUKe+hJhTHwTqjAgHVBKio9sskYwXry1qkV4WZtCMWL8TDgXHMzq8/rGIciY/oSaMuekeCknRmeUd4AVYDj+qXsjE9NpZEpJNI5mtWLd2bROW34TNuFiWXoeX1zWWzpqB8l4EjO2ERtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epJy8ZcF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MB5DFBcV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epJy8ZcF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MB5DFBcV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqlQB1577625
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxn0OOB1sRE2utqg39woPRTHt+IMHQbA8JUcm94TNvQ=; b=epJy8ZcFmuZ2lDYn
	oq92ENMFZrSq9ZVYHCeRjQGh+8rr94BXoALOoRt1a0gg1hcwYvO/vWuKaYw5Czw2
	nmac4KElhUWGC7IzYQVg0pYNKwT9/LsvKBMzrmwGPNpbGWRfxpOg4CS6sOwswfD9
	xBhmkWcQKJmwRPAWbuh/dUob6L2gCcN+uQ8f0cEvr2XrbiImioACfl9uERBh3Q4O
	e+VNgEFR39gPP5QaVW3PCs9iZ+kr/FH2tpFNOTh87Nb58q+bFB+11yMP1sbWmd7d
	Vb92ob83pYwAItR+MwlH1lbHxF4yL18lLlZw+zjldtKp7HoULLWnc16weMstTUho
	KkGLtw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4s4jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-914321eb48eso80601716d6.3
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687429; x=1791292229; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxn0OOB1sRE2utqg39woPRTHt+IMHQbA8JUcm94TNvQ=;
        b=MB5DFBcVXPxI5xsmP896mLt9ZlO/bUej2iMgQLrK9/TBblFk9nPyjkFdI7kGaQw7e5
         5Bw1SelgwcLcpP2xK3Nah2nN2R4GG9p70BkT48VFtFo8fczpFCwpIUw3FsjYYBLa3Mva
         a3hj643aySb4EEbUcbflpTrjIs/wbzVq/+fMtyWcYMxzo2o/AvjDkrFVVtwlYVu/behH
         kmjXMQ8s0vmZjL/VVH4kJXIUfUVCbtOH6R6q2+lfQFBlPe3qa1ZqjmsmkWbTQIlPARTp
         Xk+X6hT/Hph2YguRSdf9Mp6jCQAxl1W+n9J6A6SX2XHnqc0ZfPOTi4Ba7sHq/T9ypYe+
         Hg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687429; x=1791292229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jxn0OOB1sRE2utqg39woPRTHt+IMHQbA8JUcm94TNvQ=;
        b=Lz/P76+egtnz7rLmVlqVtwqcWKU1jxkHxUVhsStQz2PWU1Da4ka7/fHNR96oHHRRr/
         SGUrUSVbI28NMNFGndM91Z+InhGKdGPqkT0kG5cfWHuRn4ZEmX2srDPVB9YlR12EaRGE
         ojQEszCrabLlQIVZbXInWCeqj4V1nHyqIpw85+DRGkQRCccsoxy9TPYWBY/XhTaHsnXg
         2ELwnuXSs3g5ihwlZq1dcC637lgMKKusfxrp4dE/TPTgNTyvnpYCjSPJQEqjeBni0cp/
         BAi4LbVfrxsTuRh2lVn9mR29Ft26vf62MnNhisU9oYFujFH3mh/hffgzzNjJ2AasaY7s
         j9EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV6ogaqY6R73B2bV7AzkXygv2ip9tINdCvvpj27aKDd8cCymt8BVKtwFQNIhQifKiPJbg=@lists.linux.dev
X-Gm-Message-State: AFuF++li3SA+KEgITRELb2bPKYV5mucssUw6XFEl9rFjtA7vyHI8EqEs
	mTZvAABrP1E5MaX4XMhsSh2eQwTe3hBDj0wSEjsXt3drtR0gHKwHY6AGfIO2T7jNHsZ8GJ1jpKM
	l6b/4cryB/3m5/dsvQI8KHS577ThxGTDbY/MEyEQJUaIjlhx78avhmaY=
X-Gm-Gg: AYBFou2F89nguW1Z92ZJfv80iXZRWidjyhRr29A5uhF3Vj5t9uJXBYeFAPWgDoz8o8S
	wXZ9hJCvLiaxCoSmMvKOS92L3sTaaGqEhEg9SyztwqdurWwzCZRFQE8Cx0116KK+pvzVz0YnVGc
	VD2hDQ5PQxu5W2nbNjxmoQxjBXwgUm6oYEd+RytwEcWpGKMgn4bN/lMUgQNZnz7i/ak4SRhUECO
	PYQ8+fYXS9TMG1vonnIKDc1UoXHu9tf2uLpl2AmAd6hCudTlwoV0zzCfNcA2Ixif4L9dIQvUSp2
	eKX100A2z6l3j1xEwgTmYhxK9CA+rfyA4/pFTGmw9h5DjBOdugl1aa+XhZno9eMj3scOYwf65rW
	qhOl1D8EX+4hw515n1gzsULMr/uO2jcj7NQM=
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11843756d6.3.1790687428378;
        Tue, 29 Sep 2026 06:10:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11842516d6.3.1790687427497;
        Tue, 29 Sep 2026 06:10:27 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:24 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:38 +0530
Subject: [PATCH v3 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-6-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1187;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=mPGy83zCIZIUwpjE30P3ea5r0XwYdy+rZle+WQsh5b8=;
 b=u4MO1IQw9Ihk61kLbucFLPF/d2RDFy+rHq3SsRATGzkMgdOmAfo6LUaCZpDyQt6vVXBvcU23a
 ulIb7QRcZzaAj834Dguk9ENMjChXGtyuuTYlP18ySUbvBBn8SLS9wN5
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX7ESITEqa7FTk
 6eQJtHusL0FiLV6xclFrnsw08GHSyIGF4pNk9y7tp9/VdcwOsOWDJnjsovF1In/dV9tDkrjWHVY
 1vVqB4ymFPu6c9wdEDj9o3K+Kyu7xzg=
X-Proofpoint-GUID: wI0Rxf4zuYIf3g0uuI9z2PHoyvtLOBII
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbb8c5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JVADKE0FdtAJhbIBjnoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: wI0Rxf4zuYIf3g0uuI9z2PHoyvtLOBII
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX/3TpmhrDstN8
 01uFDJW+/aNVv8CoHNHglStNcNMhDAZHS7sJJ1SDtO+Q8+kzPhl3K1/wmfmgwVXSgbShrHnyzFL
 sL4H/nnIOhXGu35J8T3bwF2SfFTJ8i/G9ewjO3zIKzybjgPWhiMoWUJWOAcyMDc68cb5ibFhiug
 vVE13j7qsNdODGiCXYoWNIaTLdRkKY6H4wMJe9i4tcoyE484HHfaXxDibXZQdxk9oedTwkkhW8l
 PpmMD//Maemwc5Ir1aTCeHTW9h14ERlhw88fjmprpcMC8BMwKEjJ3e7S5OqVko1aQQbugaJb3ZC
 rMyxav9YhmZilgw+/mNIt5g6ioi35z47gX7uRYXFifidGIcrbsKUxjIRU+qLdRacpP3wRYuKQ/6
 pfdzJEeiQN6lcbnuiQGTKTVjIJ7ka8sHfK9oQSdJojKsQq8ULg6VtAarCXwHh5GoGHcFmCWmzsd
 avnNOED5WlHoKfWKfzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550ba-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
index 18692893ca41..f0c252a386ee 100644
--- a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -50,6 +50,17 @@ pm7550ba_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550ba-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550ba_gpios: gpio@8800 {
 			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

