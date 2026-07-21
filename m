Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829E1470448
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658659; cv=none; b=rnTSRN2pkXCFSQ1bwMSmlpXMpR6dRKzkXNjln5/TMP7zil1/1jnEcfmFoVUUfzitrtgP6HMMKpOwUDeXBEpUlqq50DpEO8f/R9d+/QludHRbC7oslZN1sZfYm4pZmSU2Ie3+q1BAz3dYb8XjC+HnEf5qYGDYpSWJ0W3iFt/m2pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658659; c=relaxed/simple;
	bh=7mS7lsEAHqFL7+IZtJeoFPHZbb0Bx/qkjaqa79ydQ1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QfgQ9PwIIEWhLPXMvzuD0AKOC55fAqbD+UbwfsZwggpbXc0ggKLVdgpB7H4dh9Yp3tRQkrInvsMIVNorMuqbVC70BZdOXfoKOqbzbZHbdg1gZ0gAFJWC6VE492HvwVgbS4lnXxw1GYOp4MLP6xBGZViqNpsC9N2eEBiNhMpZeF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XibZ5Ilf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9Zp0wGD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XibZ5Ilf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9Zp0wGD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2dvI2280224
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWGNaK/DcWcKX/rPec68iOYxUG/FFNenWvTctE5gMGI=; b=XibZ5Ilf7EbsLcok
	0RLsYgWFwopUkXEGVi1uPEEiqPJSDsLkAUwH3NT5miq+y6KWOZj64Znwp5bsmWuY
	0D32ZSsarCq/9m+VxMoyGbsfGI7dmoedbbZ6AA/8689vBNLkJoBx+atc2Eaqa7sM
	lg38S1Ma9ledBrlJv0YsZEKTo9FsWvB5vqBM17oBzHnfLg64YtJ1m0ClF60jcSzc
	0kWOjBhX+UtHZpI1TeVqtZ4tGjr45GteqV+CduEslEbWF0vtKczRSsz1Ip4EPa55
	S80yZaNIlELpvBHrEFDeHRiVf8gVXryYgHkPVy3t3fyb5Q/JrRzeAmX/D4s9/vVG
	iJzFnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6paadrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:30:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso7556415a12.3
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 11:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658655; x=1785263455; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWGNaK/DcWcKX/rPec68iOYxUG/FFNenWvTctE5gMGI=;
        b=Z9Zp0wGDRMrkbwUmRAV11VbjUaemmyZT3fzwJpa/JkEjVERZpfBWdNylIjHDV6qPke
         teDCitSjYpaNG9R52jjmN3qPm2aVI0DU1Sk3UlmuXG1pYUIfRjTE3uEjajtPrYfEXN0j
         8b8GD7uVZZJbDtj/VovqbJY1l443c4wQBKraxTb58C3pcVrKyJrJh94Rk96ZFq3tAf36
         0/V3zagdBCF6RluKkvb9XxbW4pSCL2n3xXAaY2zBSdo2iZUqaIGr+5MUauEjuDOZAlqf
         hLUdfwR/95foavo/6dnrAv/572c7YaZcwnqYsSoAYKm+abJk9425xvnuuReEjB7veE8C
         pTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658655; x=1785263455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWGNaK/DcWcKX/rPec68iOYxUG/FFNenWvTctE5gMGI=;
        b=AN/Bgg1Hd5BENGoincmrS5TdBLUhpprsR5vo1UwzU6Pnz5x6Bw0uyNjIyBg0NstlVK
         HotdXJD3F5jdtFe3FLQnN8K2FlhkXFpffe0UNtwPsPwAJoaHqYMm25u/ow6IOWEjMmPL
         RN316UsE1XMEo2hAH0ygKzGdGZSu48hA4Aua8W4yEW+YA74/tWDledA2sZcz7syU6szG
         4GmplLS65Tzv0lvb6SJr6pc3zLk9GN29L7swrWSGI4YQfj+iko8SuhkeC+SezUDX0mtm
         AGs26wh83GxU+f/YcdnSQdbGsKZQpErh9DcQKf/v89bZP2Sr8pRkLNRAp3fXYyVCnmZG
         q4bg==
X-Forwarded-Encrypted: i=1; AHgh+RrLwByDe3rMZfXKnkYWtUmzF+gkz9zz7x5kvNxPR1XCWna3mdvmIcqz3KhKVMQPSq/q0us=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4zMI/40Ep7N4VJofi6aOUhTOoM8xK8xb5A1uHUTFQuCTqJjCW
	utjoJniW3eYSEemGPxj+RSbnPZ460GoVn+RoUge0aWgzJs+0Hy3fWuDUlM4Z2s31T823wr7GfWp
	7yV5IyBYIvxlF0/3icdmRMHGhJjvBmEYeiIkjn0JRciBq0LQZ/Sa1q2s=
X-Gm-Gg: AR+sD13qAXvUOp3dwZTYOtOnHpKfsc3Fkok915vM2fqt7Xz2efqnUbxeGbalXFkind/
	D08BlaC6IqCjm3u90aVNj7G1kLiFWvOEfi0wTZoSfoCeGYqTYvdAL5RBZ+axIihkmdJGml3a4Vo
	k7CP2IYM+is1K0oQ3HYA9m+LwO24H2ZeNEW7GpvuZw6g9ARbvmGnZWWFMii/kG71NjjGSZkNOb9
	cw0wRBRoyflYesyNIeyTAyc9UXsXT+5LjONjw3n/Kc/dI5JAZJh0M8NJQJMyX4BRCgWqkp6yr0r
	1H9ijjTg8ky+W+11bHrILmImZ7NiscYHeYcfgupRLBfQ7greDbNnhGv/PyxE+Ro48CwVlvvzMYP
	0M2w+pvLYchcpsVHm2cXpyzy7E7suk/Pbt70=
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr21842247637.53.1784658655205;
        Tue, 21 Jul 2026 11:30:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr21842196637.53.1784658654677;
        Tue, 21 Jul 2026 11:30:54 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:54 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:12 +0530
Subject: [PATCH v2 07/10] arm64: dts: qcom: pm8550: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-7-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1062;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=7mS7lsEAHqFL7+IZtJeoFPHZbb0Bx/qkjaqa79ydQ1o=;
 b=dMndhaEFYas0/kwSaCAKkN09WtXxauLKLYvg+8oE/BPW1hbU2rRwetEt5qn0UWLN844wlk0YB
 nf+QTtBzMtODxTlIzv4T6He1xQuynZ3RtiPiWnQE9NeJHC6v54gDFZS
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: UoruRKo7_6QFX1RnjnPiRwzi9toy8Sqh
X-Proofpoint-ORIG-GUID: UoruRKo7_6QFX1RnjnPiRwzi9toy8Sqh
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fbae0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX6H283CWXBe3t
 UgqwaSX0pZ6Yc/7txKSy5w1PGp2s0YlWulUB/S72P37die8gMOOaDx5nZ9v4Sf5kR0lFNXB6L4J
 1iwOUsZKIp4T7mcVrRBjSlOnUr7y6zK9tyEDncJYJUrStNTMoaUDqzry9aFJ+2rtqcBMWshOzAZ
 HichhI5sHX1jowuy74ONAH7B13JLEj/LFLiz9wmSyrPhQlD6ZdvGD4AJZadssRaTwX73uZeJx9E
 eoMOReWKQ7mR8rqMYFBPDvj4YEtbt8iGBfr7EGNFl7Isfg1C/pL6Ii0vLGZYSnoCbFGbRH5m0MJ
 sXP5fNk7gjhNfrSOozgMOVZXknUcRCxIKOeuEJfejlxwemulk57lbhvx0mXV+H1XrSaR5JsmsbH
 FpeCyXZ+VuzWPqRnyz+HVmVTiNPUYFetD4BfTrKbrt1w0n8aE8ea0wKeIIxWOFwKRmF3Mp2Jp7K
 Fs+30ZoeM7LKOod2tOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXwLyMS+aWQFfM
 sKLK3JL9CmN7befd9AuctPE1tTPRkplx/nbIY8cvCgZ888Z+eDraC6UBLOOjdFcpHWMP34asB7H
 Fs9UtKjFMbY3gaZNh6jvAMMNOquv2V8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..fde76da37bac 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,15 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

