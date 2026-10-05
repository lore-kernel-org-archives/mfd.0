Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE53647FAEB
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203129; cv=none; b=QTiuJ/lUT0XRT6+Bkwj8AxwYeiHeJ7gEPP4CQEi/1CqumkViZz9ZqkTAWdYGsmuhZqMrlelwJKCSkxFeov9/01F9MqXlCsDqQnFXhHTERI1iwwikgNdlCQCVVUgg46sA+1yoUqhPZb+j7SoQJVjmpXnpc5YeLToheq0Cn8u8O1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203129; c=relaxed/simple;
	bh=l2UFpeIb/ZppRxdD8O+VfdTDOJW3TTKOPFZvJP5Dwe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fqlb+Mgrs7Dnqk/zdwoC6rRpsgu27mK+d9RPYBnFWAGVuyngfJryd9VGtc7pDEUg7p9GmFLlS+E3CzPzkjNEy0HE42Mi5H8blBzcD5H328VNOI77QKNOT9ScAvvmDRbsbX52bUz+RhmVbImds1Xs0FfG0Z5KkMqFU7UI5umROA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGSxfRrL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSWqpINA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGSxfRrL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSWqpINA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFb0q1726948
	for <mfd@lists.linux.dev>; Mon, 5 Oct 2026 12:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YJzYAgsj56oFX/JcQeAS05e2XVfPMZWJGYGTeNHh/zk=; b=jGSxfRrLph0fRsLe
	m1KhMAO2peKTZEgDuPj6ykjOPLDafOPpLyvA+coiD1f8AftApRHXXonjRw9ueIjL
	UhB3xXGmNUJRbEStHO0fgWydmKr+1ouqxTtYmJvMoqallM5x3wF87B2dZbyOr/OA
	6YhMXNYUSW2pC4/9kus4iV5Zxv/6tnfTOXEyYURbNnik2AG8CXU39L3XiMbcCLPP
	jpV7EDJaK1CfjVlE2kj5tNfcGJxi67lcJEXday14uZIrj1Bm4QIFOLKLddVqEwZn
	HwEWRIWvAaPNZsSZy1KE2PbyafxIEpaPPZkFfGYuwWRBHiZcceAsWOi+jwSM8SCe
	u0rFQQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xhs20j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 12:25:26 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-822ef82e86eso2818488a34.1
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 05:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203126; x=1791807926; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJzYAgsj56oFX/JcQeAS05e2XVfPMZWJGYGTeNHh/zk=;
        b=GSWqpINA75zP2lr3bs58SM80SChCWnmlSNIWH+Mnj18dwUPj2aVKzeI/d9ZV/bXaCd
         3eJ4yFV96WtPsRBOr0z3uRg2f3h1WMfwtV5aVKaKmXgge7xhb9zXP7+9i89EpawoZZI1
         9EIW7QzxW0tI6yV9FSV/LsBbuVuqyAeHym0DwM49O18uh2E1z/LfCusmrCstcy0r+V0T
         /DAMW7sIP9lDvyqpGQfdB677BrIKhWaAJINF1CaQ1edCnqVWn0hrzQaUWLhNomtymaTt
         w/dYgSmLhaLweoUE+xFaq55GoLIg30VbRVHs3im593/gPKyorkEAz3VLaAacg0CWpGPC
         WziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203126; x=1791807926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJzYAgsj56oFX/JcQeAS05e2XVfPMZWJGYGTeNHh/zk=;
        b=pknwKFrGAexDIm7bachTbK0S0xk/XkII8QRsVF2o87twQ1zBGrGw1lll3d6pCGHX8n
         5+yZZ0iclb7Tjer0M/70BuFFrn+quVoKlNR+gpeTWaA0TtwcBy0sxeyJ0rQOeO73qEtY
         IXLP+Z0T92pBMkWOr0C2wNNeOyyIJ1kh3QJe2SsJ4OIKt2NnWM8ZYvJ1uJyj88TTytPS
         AA6ltbArSlhRzIdJos3WykiMSMP2hC2bhOwWxhrxUjXuxX7Vvj6ytALhFDM9+BjDWWNU
         vZLTr3CGhUVeXbuMkUB8thmHZjk6MzAkhgyWpn7mxr34awXQk/cTBm0YZxnS1VTCUm79
         jaxg==
X-Forwarded-Encrypted: i=1; AKwUvBxdMplTk71tg7Q7x4P1zrXZPj5cDtDze2txL+C4mnnrT//8mRyAvKCLmUpn5NK1Srjyxpo=@lists.linux.dev
X-Gm-Message-State: AFuF++nT5I1FzfzzBWcc9nQTdA81q3QDSiFqFlO6TIEAc1SWory97+x1
	If670L3i9xOs57L0YpV9pDvt3f72snBH4hV6VezXARGV0ou6BFZAepL3isL0py2Nr/8kMNANAyr
	yZpS/Wfzy5tnplumc99I0dOZl7F1+VsltWwTOqiRKGoiAYcWIG6cFY3o=
X-Gm-Gg: AYBFou3QoFdv2oXjBVFKFMHvK7HGB9e/7mM+SpGfp7t0d9e/ODRB+uzJ2FhwyMn9Uc/
	M5+vOUl3QLEBM/AVCli16rOCOMKVZsTXkvt4yc5tjKejG5QKR5/yoRVhLUhZtQDoia5RT+6a5e+
	1M0vdML6atiaWm47DXllL06Ty+2e4cQQGGKlTDMpUbYJh3tyxg6A0VBsQcjJcin5qmPv4Xz4GUq
	fKN6DLKa97PDLijwqn0Yp1v+CUa1tqzlcZ2OQpOoLLsyQoFmnCgIfFI1h3EGmPa7ogo3PAz7x9e
	zap4Ab+X7PieCiY4Jk/GHpaNOjHZpHC5qN3RNuk59hyO3wOtsWAjTre3Z1+0ilI49A2qexM4xvT
	GKOuyLaQi4LYFFth/pI2IADC+tiWCLOI2WQ==
X-Received: by 2002:a9d:6167:0:b0:822:b35a:a2d3 with SMTP id 46e09a7af769-822b35aa750mr9186670a34.9.1791203126176;
        Mon, 05 Oct 2026 05:25:26 -0700 (PDT)
X-Received: by 2002:a9d:6167:0:b0:822:b35a:a2d3 with SMTP id 46e09a7af769-822b35aa750mr9186640a34.9.1791203125674;
        Mon, 05 Oct 2026 05:25:25 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:25 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:07 +0530
Subject: [PATCH v4 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-6-50b9a8c730b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1240;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=l2UFpeIb/ZppRxdD8O+VfdTDOJW3TTKOPFZvJP5Dwe8=;
 b=jYgdPcZHCJob0qX45GklNH7KCVf8mAgOLlclTbZSsCEWFfsIr7/bylCbVJY6XrI13QDYa1bnM
 Y+atm3wKaERAprzxhkEEEl+wkU9dYQC4m4jKx9Owy225aAS/NO/ihuQ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: cVa5jRXrXIvErhwlvaGUn8aMXSNx0pea
X-Proofpoint-GUID: cVa5jRXrXIvErhwlvaGUn8aMXSNx0pea
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX5F60ZLB/KXxI
 YhP6erlcMX/cqteTARrr71Wv1HueOypARk0MSvgCxKCDjFtF5gesbS1fPGsAHmOZUZw6ReJHJxv
 7OLS+heodacALV6SwIQSZBhSWDGrkk0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX0OcuoS1KfKi1
 IIIzTtKjHVeyGtF210Utib30WwXI3WN3lifqQGPMBiMr3ZZ/pmDa0PVm9JZQ9q5lRP1ErGf72cd
 ftxLNVKNqxpdbA3YhULYMeyBknwfoYb0v8jbdxSHhVapdHSVJFulH0pKUPObksJnHhkV7ZULE6m
 eeFt8XKdBMf7O1EJsmQCVYr+061ukvx1UQNe6swyaxv0IlIcSRf+AkP9BLAaWPxOjP3RXxBY5t0
 Bu1cQiN+wTSVBBjm5sgJA13s5zYXVyFf7CKz4VJ2399PpZIMTSZFVzt7QNJ7GGD0BsP6z2SVc85
 2iAtm/KIJ2FwryymHz4AL9WHDuNRbZrbGLDbNE+JTBWtLDuofXfDdwQjfxOJYrjnhyPENKr40ng
 D/d5y+T4mH9l+qmLQvPdCX1qw6Xegob+cUnUI+4bjnCum0nVgNxeTru/76PbDZ+CEiKnoUy3mD0
 CPgITd66luzY6ZqNzRA==
X-Authority-Analysis: v=2.4 cv=Q6tHcI2a c=1 sm=1 tr=0 ts=6ac39736 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JVADKE0FdtAJhbIBjnoA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550ba-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

