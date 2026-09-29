Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BDE525A81
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687415; cv=none; b=cgMDADcppJ9SVjKA6r0J9Aw5wiRtuKCoNnWD8/D5SSqILg7dKALIfXmnVPrKeW67A15vhidkHIY2tloBCeu+FdEyWHJ9x7UGCzrySE3g0xI34tcv0bUE7k3jtgJnTWL8gY8aTY+LJ2YanhaZoYayHb9Q9PR3a/GuUAFsy1LimAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687415; c=relaxed/simple;
	bh=HUjdAdMyX4HianRlVJjD9t9AGOnfEbovarS2zVv7VO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOBNqkCimguReJDDkg3wt1ILoat15gonL3KDziNcKS1JAP9d68LSzmuZyV8KHUJDpsfPsORgHbxa2KTBO6CIkwtMbpsl9MU4b5zV8Pc2+jAOiubgLo0e2kss488J96VECQz8VpW2xnjr/JBSgEwqEcFbPQHZyk29pxrPFKKt4q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0EUNj1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEr1Z9P9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0EUNj1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEr1Z9P9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqdtq3936711
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZ+609EzwT7gePHndxnlvqJGJ7nUcvojVdbl7Yru7DU=; b=A0EUNj1cJzFa+RDo
	IpRdKRRR8Oxs6cLZRyaFeMAOtHA00I35yPF+e0zQN0qIGhRtFYpRtklfS9Tp7sY0
	mJ1WxpZW/IrKlhyPFL55PT7nP4+OgQIk+fIiVWOn1IZDSr9Xl3J/knMY7LhILNyN
	nXwMOFbcI3HdWy86jE2v9jyKgB9bIcNRhazZeXRMkNidOnB3js8UhhDsf5URsM60
	dKIWbChW9XSBQntw0H4Ayt7x3ZXJC1Xn6tXWgYHjzvMAtP0ydQx6JEPX44AydqDY
	Q6EC6Mt0ebg817qmunLakhvsRVnomrYP1XuzVK07gF8Mujf55ID4a2MVim2jOqkH
	BmRtdg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1gmj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53333acddb5so77081861cf.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687412; x=1791292212; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZ+609EzwT7gePHndxnlvqJGJ7nUcvojVdbl7Yru7DU=;
        b=LEr1Z9P950fAFX+OF/VFhJCXxDl5oz3LxUeGcDay4pkjHTVvJDniTiQHMJYmbj1d6B
         jJlyrUvCKN5pVyJsV7ubi7Pn/RYDkBa+NeqoIFJvsyCyVH7iJ7Gp2FSjOJ2H7gy4sGKM
         Me8YDaUqng8sYHPyXpEtNsIKMa3TfuM54GCBvtI5/8sduFMqAeA+iQOW40AIBHy2zwGW
         UP6jnuKZ/yIkKCAqEGpu0AOKVyNshpk0PrJZ54LoLFAllUu8GU2Fdp5TrB2bvVqRTMba
         psw2tB6yCwPc/0tZkbZTLUfl7RDalTiFEDv7mDbSe78xjXjMHplT+O8B6IDCUYTcm8RJ
         VOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687412; x=1791292212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZ+609EzwT7gePHndxnlvqJGJ7nUcvojVdbl7Yru7DU=;
        b=jkxjeibjB7/hT/V+ra8eg4DuP2hjzcdzMy0hcCjm3uMXxJzly539WWEzVxxB/ek5YW
         6ww7dhkcORPAooP4A7HjoqSjsgCLwD38q+SlZafioZwRUq8OAK/lxdZzo1egg+ZtAF75
         XBSCso6VjgqMU9CNHLG2RZmd4cIO2P2ATTWO1q6AxRuSvV3r+tbxAN8JSfakxTzTGjek
         K9p3MEKyZn+plXwn0u78J5j9MGwF/CR4xwchJRF3fp5XK5xQEpyUf/KtOr5yjDix1o57
         b0DSB1IjWDKL/IPZovKZpNgrcq76n+oAXm87qp1vlX84vevmIQTgFHynFe4yAx4B04to
         kX8A==
X-Forwarded-Encrypted: i=1; AKwUvBxx2YesM6VwKKWiVz4hnrXCVBACbrtp254MG38QPrZwXXHkwsINeifl227OuWHpMcJ187w=@lists.linux.dev
X-Gm-Message-State: AFuF++mlvgNzOfOwXRP4ddg/ELs9aixZ12uPHn6AcqRrPAgy3eM+s0qA
	H6FEuQrFVk67z7ozU3mp8Wf8daahtP4dGWfaO6xFRZXz76iymvMtx1BWXad3wsOhVbj3ToU433Z
	Ofl1n/kikGWt+NosZjp8upLZ0fqmZz2goUr+rbHVilx7On1f1pkLi9N0=
X-Gm-Gg: AYBFou1BE4ySjG86k1jaSghzXXGiUmtwAbDg29ldqxpAZSr/1A2Hf92rphchGnMTSl3
	vm67Ui/6jtWuMzANMjsOCWx/Ck/7Ap3inuexAEaTHbHI5hSPmvq0+8CFw0jA+qrBC2VcBLLAuL3
	h7BSxARvMLr/rVBY8G8vZkwwDx2uBw/16APDxZoTsezj/F30qEItfHp7CurtlkZA8X4/HZRQRIW
	lK9ydk5SLHvc9yAmrc6FKxfKAbGaimpI6IxFyNCMy+CDK45MdqCaNZWZt23dJvQ5NfuRd4G0UvM
	FDqu0FmoWyuyxHKNatw+UWs39jYijb/3X+Zv8Lq7QHfn1esHQmaMdzEv6NE+fnmvxt+btemaN80
	ArTRaPj4MKseHFFXRn65qCDMLPBIEmA2eQqU=
X-Received: by 2002:a05:622a:e444:20b0:533:240e:4e0 with SMTP id d75a77b69052e-533240e06c7mr147826871cf.55.1790687412099;
        Tue, 29 Sep 2026 06:10:12 -0700 (PDT)
X-Received: by 2002:a05:622a:e444:20b0:533:240e:4e0 with SMTP id d75a77b69052e-533240e06c7mr147826071cf.55.1790687411438;
        Tue, 29 Sep 2026 06:10:11 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:11 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:36 +0530
Subject: [PATCH v3 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1143;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=HUjdAdMyX4HianRlVJjD9t9AGOnfEbovarS2zVv7VO8=;
 b=QlLfdI7YXA1+K4D2l6LRWs5qFqG4cOCEg/DSNuV42QJEPHppAncaje0H9D2uQje3ob1+q0FUv
 EaBYCO0bhHHBNQk5IXUHjpdz5sTFR0fxjvdK4Neg90kMKthi4vY353F
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXyHiuDJwsoUyk
 3hVswp52TT5t8aUiz1vl63Pyt3C9DYaktRVGjUiqBRlPiqpocHykkjfQI+/67W+J34s3Tsgr6ZH
 k/TA7z7ub2mB65k/eilAMlJcd1+L2Ew=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX44msowgpXdQg
 v9AUxJ7tBnbF0QevkwQYYw/4ShGRsf9KuFdHNmgjkAuSJCNbDgDPClZHefSH4rjGUotoa+mZbou
 GY47+bu/D939Tj/0oXpOhd7NgkD0p6pCihivF19tVAm92FhWPhH5LxAWbGQCNUjkfLGR4qx6tCn
 e+3YR2I+QgprhJNDNy+OzopP0bs3aZZnU2rspgXdqmhEyLCCEXFVelshDQFjBDEuKTWQu63qwfi
 MtktHxJba43OvutcDrzEB4H9+wrUJQ/eyerZVvF9hs3bxqiW7N0ke8Q7zF/ytmm9B2WUvNBp0rh
 PMnG2gckx6pUH2cBIKELw06AqgErAgonNS/+Rn7XWIp1Vu1cVyc35g/u2UP1Fe3BSD1mpp9Pjph
 KmGPwHiqVTIM344UgRQmvl+KunJz/T0hdK4nzPKTrrTb3vxEgH3PiBk/vMxyVy6Cda6Z7Na6Dr/
 3JrX2Pt9kH6d56ayeFg==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbb8b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: uM4OcAl3zguCe4O2qErBUKK_AtgREXZk
X-Proofpoint-GUID: uM4OcAl3zguCe4O2qErBUKK_AtgREXZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..76d0481914e4 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -89,6 +89,17 @@ pm7250b_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		sensor@1d00 {
+			compatible = "qcom,pm7250b-bcl";
+			reg = <0x1d00>;
+			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.43.0

