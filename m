Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF19447F775
	for <mfd@lists.linux.dev>; Mon,  5 Oct 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203110; cv=none; b=uluv6Ki73HTLRJAc4e+1bM9PKS/oUFU/fltq6gOvNQCaisELldF7Zeods0qzAyHdrVbP/HMMSY3GIpN9s61bJTtdIk9bNDycgwXNosereGGe1ePaTJ4Yrd8WlrhI5CZnwvBoQ+R67Zcq/VfoP64YDZgAxeJOoAFmv6SrTdjGMkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203110; c=relaxed/simple;
	bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WD4ncTxu2HUJ4MG313v0a6Qf6KNxH6ihGlObwrZRjBKH/ZvA9fZcYHhmWXL/cNbKa16SG0JjoTQylB6CATWSiSDOUZ5B1/6XdjfJ3YiFEVf8aC5knLVlfVHj1KJ3UUqd60kCS/YZFbJspV/W2bMU4wFgKZl4aOho5ZnoPItHOWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiRB14a3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JpsngAnu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiRB14a3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JpsngAnu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFP8m1892646
	for <mfd@lists.linux.dev>; Mon, 5 Oct 2026 12:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=; b=PiRB14a3PGf9JcOi
	9FPOldIvC9lLWKnNXd3SAeCQK+wpLAhVQGIyCn66gyOI+Pl+tnJ+fRorBfv66hE6
	/OTOHnNpS7chmGa7FjhslPYgH3L6m0Y6LICrREAxPFG8sktVrG/gYhfM2Gb3mM9Y
	AIAPkTnY9dpptulCnN98hDS/4nTkwzeh4PO83fT4+E2r/Z7tLMRxe1QGVrsI1/sv
	4UTICS3OUhuUMnx0+Xu3u7UBtvwxx9ClADfADA+tdeqfR4VkC7xhIFwSNsktx6uH
	B+TkB/mL+HhplIl6On5ZO7XFlR8Omx0ciCdvrop4SXZ9R+iofFmY3VkTFgIcqo9d
	PV74Rg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssudt82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 12:25:07 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6def28236a1so2262044eaf.2
        for <mfd@lists.linux.dev>; Mon, 05 Oct 2026 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203107; x=1791807907; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=JpsngAnuB17I4scGS84oEi/Jt3Ay2Ulq+nLDlDl/f3fBowklWgfPP97sZgaU1r74+6
         Yl8yoLHDY0bZ60QxkG9rHcbbcRUV5GNNZ1LN+/lxj892rs0hzBFABlbVtE4Ctxg4nn5C
         CLO5FK91TB5hIY9CZ6RVKSVk7TJ5ss0wHM9XVGhtBkr0rCvrvKyFG+SDxwHDPZSmzitA
         Yp2UOI0u19VUJ4fi6JQxJ9M4XKxD6IChlB7dyJuQpZ9U8xyyHN/RlyWh3B69NOrqs+s6
         YXwURZQEiQx1LFeHb8nkH8kBzxEDRF36rKZhtbqtFzNF42gaWR0/o9pJ1GuVvS3v9yUh
         wF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203107; x=1791807907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=K4z3YYcupYXHM9vfSI4nx72phMPU2uZmMSuCSyiutqgT23bNbALAmRGbciiBVDuRex
         mBiKVT83XFFbTGZweqEF1BpQAdmScxD/+AM4HNG/nOsxHiB1qEzaS49vf7KBrxZJ/yUS
         nhkjzYXUFRfeKT/5QHVZJoAUHl3PQJI5v7lpRRPxEJShdrDKj/vPLFPwesDFlusTfGrx
         O0YvZtG/R4G08twG3UxOPzklQoRTMpjEgIEBvN039vGZSFnk2DYO7moFUy9cuN+VKO3t
         UMSeNN1yKwe5gapd8uh21uctEcaES2cojAt2bUgAMjCIJelS6Q/0K5WxN5wQ7jOOsenY
         E3aA==
X-Forwarded-Encrypted: i=1; AKwUvBxHovcvM4Y99rzchn0S6H1jTL+jt82VjSCNtWjUb/AXd0+f+O+hvDnrKT5dYszVvHlCaF4=@lists.linux.dev
X-Gm-Message-State: AFuF++lJWdosff8VvLC1beuL9gdpxMaRmJs+nRp/QIfKT0CUEbNxeqVu
	AIaBun2geWgMaZx5YbxHBnmV/WzyCW2L3A0blqsCi1zrQZP2qGU8HyvkNiNFm0RcrO7TsGrclq7
	Q6joTbtgkFWh00/oAmqxkv9NoAoG0JEBKBlWsU8HhRU1N4zn/nYZ11FE=
X-Gm-Gg: AYBFou1w9iX6jX5MLYgSY7QOCghb3sbKY5xvOe6gwhqda4Ylv7G35fAqGpXUHZCc1Ug
	TApWhRBkWTtS25TCVzuOykq5SecdMoevLc48YICC+fVOPEKMQbXa+KtXVebHsc+fF/O/oy1iaXF
	9zU8i0zo0u0okwWd2EHn/fSCfc+SFkO8GAC2fBcGXXPlwBVgf77foilxTWG2HBo/2Y2cO0zyuWB
	iOos8vPyKfWNCxFWcYJhZxqkFmsgbT6mKGaHPpMmiLGqyYcdHZU554j7mLoe07aXwe9sPQR5hp3
	7gPCDmQkMXSMvMvp8LB4tselVD53K4bovqzBOiMUcCHdM4CKcxlqBc/LBp/uUf1qp2QcnEPuOeU
	jSfBfd9+VteX/1bHAq4w6IvxSTR0Jh1ssqQ==
X-Received: by 2002:a05:6820:1904:b0:6be:4eb3:e1c7 with SMTP id 006d021491bc7-6e09d7af035mr6275828eaf.14.1791203106968;
        Mon, 05 Oct 2026 05:25:06 -0700 (PDT)
X-Received: by 2002:a05:6820:1904:b0:6be:4eb3:e1c7 with SMTP id 006d021491bc7-6e09d7af035mr6275797eaf.14.1791203106433;
        Mon, 05 Oct 2026 05:25:06 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:06 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:04 +0530
Subject: [PATCH v4 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1726;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
 b=2P/b1Rzcshx2aT+h+pH72m9MAJi/41ALYT0f3yobAUvA5rTyfFGdJQeawAkimB2qNIH16umAi
 b6P8W2By7nhBUmEZ1zl3H3rKJi8yT51eg8YhfQEBqNhJng1+ooOPu7Y
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXxAATqb/snvVj
 vI+68QbqaU1YeyAPyI6elMCqsX2nS0z34d3QzzBChPiK9Od8SXBK7M784pgB9IsE1l2U9czJUKS
 eVMhNCqMmfdI7TWZjykgwtOUFujhf+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXx/cK6y6DH7Ce
 JrbJm/Hs1/iWzSumD+EZOWcKc83hGxuOkWWgrj6Hbvr2B1KOjoS7Wa+AHF+WdZwG9evD1XHhx3W
 hJEVvYNLMI38vF93k3ZqkeallBbOC43zGC52V8jBQF3XGDpxg7bed3KXmaansBOBs3a1Mlrpk9C
 rSrTqlCwbv5pMfXr0Fao4riiVvc9tU+cWG1W3g6oiwgQgswuOquX2I6k7WFOZElTPKePy12jyIO
 Y2KcJ/PnKmfMFcg29AW8NBVvRdkLJx1VGQ86s+orXYBJVxxkHoHbSx3Rw2Np7FWvECmFWvOZUdO
 U7lbTJ3TYeFz9zm1m3PRDq08Vw22cHNEiX531K3LGhWyx0oSTD5b2tOYJTEbFR4qMWKfQZVn1qx
 UMbXSEwOmAWid1lBmzqWckYopztTTx+njaH9xIVoz9CtglyFp+iW7azH6N01DlARbrjz/M+XrS5
 Z+F63R4jiJpyHa0RuCw==
X-Proofpoint-GUID: r_R65dbYbslW3gR5KoTOgpRrg_YH9JC3
X-Proofpoint-ORIG-GUID: r_R65dbYbslW3gR5KoTOgpRrg_YH9JC3
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac39723 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
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
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

