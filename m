Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C6528426
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687449; cv=none; b=VHoBVr2DUIT1VocFLHWC0pevj1WJgcXk/ViKI0jYbOMsz0Ftne0EE4ceDzLCTcw8HNybtBwcyElcWT/WjDHX6tCLhqOpEYSv7uUeV2Hr1wnOqNghwFSzAThhr0geov5wueNbU5mDjSfFDQkeLSpedYhwMIGo9nyB6E7w+qG5pFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687449; c=relaxed/simple;
	bh=rlQM2xDP6AVNaE3KnI4qJlUs4e7i+us9u/51Sh7/Pls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tilq+UtYLsTGBpmh90mCzjXlSdJCxofyIhqlFcpeK5AqDZV4gEEu1fhk/JlVB4inm2osPiGtEPill7iZfl14Vo/zcwzYZgVT2n4WYaa9P2Ev7K6G6rmfujRNu/QfvIiZ/FezCKBIfkXa2xzHTBneDkLLH3fEDgSpIL8urykC3qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej7eO5rt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCjreZdB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej7eO5rt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCjreZdB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqjZw1477271
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=; b=Ej7eO5rthK1xRofA
	5Je50gHyY7bpNpcacJ2DM4MSH0rel84o8N9vFcPXYIGe+WqC8hwQ4R4VOqpP4LAl
	3Xi+yyyEVJq3Iyu4Az4RN13+O/WEA8YWqXZFCw6G5kER7UqSy77prgfYJzZ3/j4A
	qeUFGvUsRl1b5XkkmOIYoHwF+HmZ5TloBkDG/6SQ+PxjyD1hjpDOs8NUT5znw8mb
	8euDFQ+6fBe3Gz97iOJJji90joN59ClINGIydwY7Uy+cvWWMzyA+NidxTRz38B/j
	SIAVft143cWzHOBERwwQWtOBKrnUQ9PzW6seS44xd35r7PifbMb4kPaKOfv9UBea
	O+4knw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03m69p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91457ba4f48so21772706d6.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687446; x=1791292246; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=;
        b=aCjreZdBXl4EKSNz7kPlP9bX8x4fYOqpdRe7f2U/FMufoCzVMptpU5bPwup7a+fMfP
         /b/I75yet7AEmDDNxC2LB+zp9kjwKui7ZpUURwFuKHbL3FXvf8jOvQG7SsoRmA4uVUUh
         OsGjBERyWFiXeArtMKOJcEYvCtqX+gYjn5/QJXemoIlAhJSfGUSJDdJilBRA79GcOvrj
         SubD1qt5HaODr8ip08msvZu4kYzkULQDH+SlYMeJj+qPbYEkWvB8gWSQeu/Dx1GevYww
         tTnCiFFCuY55uWypAUU2Nksrn3qoJAP9Hxz62A8GLn3n8RtE/4rucrrWMLxkNuf+KKcj
         VzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687446; x=1791292246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1b8t4hv7WpwL5+Ofk4EWyJpeOc+vV9QjAf3AhgmHPKI=;
        b=yyJ/nydVp/eEchDwSCXIX3pfRjxkEMpKOJXjAtfTv+moQcjoeWSLfu1E2mDClIubI/
         kmwDCdW3C8vRnxgiNKUlO2wdDeVb6yq+lqCbhj7BiSGic6tpGijoxqRbIWhMDAQRHc0t
         frCxC0X/ow/OFn1DxMRKYCQoNHE+AKG3TBcB54S7ZRJ2gSfdDZqTeYt8hkke60aV+6i1
         vpK/pKgelfz9dPs8RDyuQQtfPjj2ic36LMF0ucSkLbqg9BpYF61mHFpmNxw1DOevdgWn
         eGRKLt+6UZCf3kmwuv1MAWwdOjf+28LWBla19UpKeSov5fS5mHqVBQH5uk15jnuIVcKI
         +6Xg==
X-Forwarded-Encrypted: i=1; AKwUvByrHWHHQZFV5x0GNBEQTt2RgsEcrC4PBMvKNIhPwE/4repvF3K5xMxk6EIGAdljCti6t1w=@lists.linux.dev
X-Gm-Message-State: AFuF++k5Nvk/jlKV0lFtHNQ78HsdsK0DdKj1U/efcR7YlBf55qASikAX
	2wAd99pAyTL5nT0nIVsRFT4/FMZEtTwiGqTfFQs7BV/EkECX6L3RD5Wb5fjuCtblBDoul7KagTC
	WpAr0NjI7LEZBWwn5Cz6V0G+OBuLWk4qbSfLfbIGrd4GE1IpGEutt89U=
X-Gm-Gg: AYBFou0cwJOvwHNo2U/gYywPhbMhV0uhyS9LOtIQYnZzQVkQN8YYlWwTivxcywzryhK
	ErsfguBUucylcp1+XUZEjppG33XfgmJMq4dJpx1VPC9qWuHYB9i9Xsvqfm2fq2HU11OsOHkvCH3
	Sq52eVVF9s6nScE0mIxOnEsTUdFoUhoKM1aqdfcMs6Le0TBX7jsmX8F97E/cFNsZgAoxyjnoexA
	jB9J4bSuqXtuuSBt5TSLNPVc9OqDhTwmH/1QWD6LBJbRT+LUrkWNdftfx6aacfTN/SS3+10LDoQ
	y5phpELCgWMc7JSoJWmrsm/EWOA1iKKzTAxccGKBe970oYhHBz9NGKglDjQ7qzl/KxP8nGowOU6
	OUiGhoHv8/8B+N/V/7ZcKhTat8jipf6jStQ4=
X-Received: by 2002:a05:6214:250e:b0:912:16da:b387 with SMTP id 6a1803df08f44-917864940cfmr44608876d6.18.1790687445644;
        Tue, 29 Sep 2026 06:10:45 -0700 (PDT)
X-Received: by 2002:a05:6214:250e:b0:912:16da:b387 with SMTP id 6a1803df08f44-917864940cfmr44608336d6.18.1790687445128;
        Tue, 29 Sep 2026 06:10:45 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:40 +0530
Subject: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1136;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=rlQM2xDP6AVNaE3KnI4qJlUs4e7i+us9u/51Sh7/Pls=;
 b=Ij/auBEVeIbBbuG7Iw2UVKBhfAem37HjgrfVKieJ6/q+RgiiLD7FfUKtfdiI/wqiodchKqSNh
 JVj8QaKLRHZCW7XZzz1C4BCkqCyWhCwhZxiXw+uyGZZKYdY++bZduOA
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXwO6LjteQ6xWa
 ofwue7cLvcxWynkfDrCzkAXwBf514SnnqJoBvLWSn4om4cIzes5mdsyVxhstfvhb/Qz1Fl2xqeI
 o+a7G1q0vMkb9EXthJMm0j0RieScdTU=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbb8d7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX1vAWbrX974vr
 NLSVgGSR5JfMNoA8bmqO5ikbAjk+yhQFsMSp1cZZEIiihyxHH0Vq+D/d/PVIu+2z0YKGszIo3AD
 D89BhfM+Y8w9uOx86xEY4s5LMhXmKF65oUU/Tym2kEKjB5YiTZo/VJ+cXCqa7/i7ULzH+bUqtNP
 JllkM6o3tjUA+V8lE/kPY7RoGHJ5epsRB2T5IEvjeMnxlGag9chaiKyRPhR2x+d16Y0eeZJA7t+
 p2Y2AQSyMBUj+5It2A6bvtN/QY6lhVA3HW6Rk9u2Vj1t9qdjR3wlaEXXziKE5/Vgaf9GvqeFihs
 1f6q0s+bOzimnHYvFLLUZs2m+P1wJBxy6HClE0qCd1r9L3NUifbmi8G8b9FTivN8EOphBCjLLtk
 dkb/tcEl0onqHFGKdCO2Q4QUTjyL7mmvEyyvg62VQhsZHVT7EYxaf14Cm0LIIlR3MF65DLWMHwR
 CGb5vun+m3IrkJRigbQ==
X-Proofpoint-GUID: 8TRdUiAJ1SRuaXyWx3cTraFQBdBya64Z
X-Proofpoint-ORIG-GUID: 8TRdUiAJ1SRuaXyWx3cTraFQBdBya64Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

