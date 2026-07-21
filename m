Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA49471424
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658663; cv=none; b=tjmfWtEvYOSGGcwrDSGr+fyIxPcGES9HKLXwk5KirMG426YK3SXU8WPwbGv2XycqQEpiimAup1nt1/0Iq0NQfH0ZZxgMcrn5R2LojkTUPf9vpZ2DqG6JySHTaxAUvnb+nl/kFFGYqVFSOZjV4/sN2yOlHEunBEinv8nXphnes6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658663; c=relaxed/simple;
	bh=OS3nTF5uZPVKUD9c+8gRRWe/CCVuPxrxct2FrXKjb9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIgPqKQsZUEcNMP6D2grEo3oHcwBaKozUrlVQ5a0jC8Kkmlw6kZzY4O4m/aCuW1Lgh4rIUmtje4gW03V4cY6NWZmK3FNEFXS5uSefQXpGeErCi5y6MlhRGcYVtUM7JFR1yRTQU5anB7iwwJdXSmYtARzI2lC4v8yH46hZGs4aXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ5o0lDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EoAmbl6m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ5o0lDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EoAmbl6m"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2kJ12160916
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=; b=DZ5o0lDAvSWuNUkh
	PNCUO1RO94zIyy611KI7rOr06WRghGJxZ+R3VsU6W5X5qQ3olj+lNGn+++dkkVpn
	PNJkCarywted9j7EdzYURCYH08KVsow/saidjFgit47zV2CoTW1163TbCj+8uNAW
	ekDQ5goCN3TzyD4FU3Z1ZSC7Dmtc/hFJjktTKRa4bGUDQV2JNKOarLQ3G/B0TvwB
	sPHHk9Wa7ds9pIobB8NkNR6bqwTClIbw11oNidtP/CHzKtXKG+uffv8LWVBuJ65F
	CMlxhfTgLwRF5jr1iB9fmF92oyJzP6J0YdU38aM5ogNAXNKYkRsPLVQwJjYBzdLa
	/YWFHg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41jxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:31:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so17778970a12.3
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 11:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658660; x=1785263460; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=;
        b=EoAmbl6mYXgAXWB+SjYIw1hWT+LAWdO3pYOyAF1kmwNgMOEVeNRhph05y8qNm0GMXV
         qiDofBF6pID68KtocbFiernYoXwtPxDvQdX8Mko7Xp0hJOyeBxwMp+yUmeCkBF+hJee4
         a8FbKk3XaOWn0f8ozd9/FVayuxwIgIZTvtfr/ApSDmA9NCGdnxgRJUS1f+vhS6uDLI5x
         JyHsrt8mCOUV74E2+yhQLcxpjwH0A0h4O+coxRgNpoEYUczOqKwkoB95CiOyy9P7irNr
         KjEiAk4IGg7vGbDZ9AH0h1gA1oupjLFaOQ7aMNAa+dFf4r5GPpwoJHAP1V9zJE5qL1Zb
         jdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658660; x=1785263460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5wNs4m6LnJpHyT+aiEgGGlPGkyjXvFa+jnHRCQHPbg=;
        b=Yj4IAM8TqAEe0oGBnUnbnU4+ZeOVOSzRuG8VcrIovpc74Zdmn4qeB0ef727QIoIBXf
         3B/NUGs4XQyEaizqRbFz1rEVCGtTLGtiLfuxnh1oM/isA93HCIhsXpnTRuuBeJaYM5FS
         jqaXN22xak/qfY6N8s5OJNPaHcEsSbh+KsNAyMmPur6ZKl0Bw/8Kc05XPQHWJHJLfLUc
         S40QBbNu+Xe3KT/jV3HCssVomfjYg349PNhat9oA9V17BSk1Z3U0HAE8A1k63Il8yKf0
         Xy3g+a/UxVGz75OCGLbI95v/Xc2ugQlFk/pOXRCWPGFzt/gcNOr7TONgM8fijc6XBxIv
         JhUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGJA0fBvvZ9pD/zRJg8kydHpK6+wxeljVGxvCQya/9Gu9/uekT/99Q0ZhohTDips6S3r4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6uuWYwwPMLCmdDd9KHPWJ1pxs9CqSVdy7jPlJ7JiFPPWjU9gr
	C4TousPqwyXdJ4TNI/s+W80zxi7ZmNXXAjxatiTBPQK2ieKzJyAu8woTLEuDoc73N2+c74hzHyX
	wTkwK4rPIMWjeDeg42LnlxMwiWPA3FIJGkm1pPKne/KovHyuUA2S790qi9/4cAws=
X-Gm-Gg: AR+sD10UtNTJI2uuuynoGk6s93N9X0z+jrBDJ5cDoCOQjJXfYxFC3PO3zrXZKBcqIh+
	4QFCnpN29Vw21e0Twsf25Aq0okQnAocTx2vmT4FjYRf/yl/vvjreL9Lj9xILqh1q6/nS6/niEvD
	rV2iyTKSugKyKeZx15EpFElEeg07idIC/tnIGeqyMbCEQsB9ZoQzLjTa/9oQHWZjQyjUcQRU/eM
	bHjuSC9tbAsEld6gYqAPLzufSFHDcWHYO8V4rVsTn07gJKz2rhrxkIQrRMOxtxUKuH9rvEZ+ecR
	eFTavxBYNTiGMfcJynEt+JkXc8cetJkcH0hfL7L+ckG8COr2kqCNWXoYr+czKkXssdzNNgIqx9+
	4b8NfU95JgAtIgessUV9U3i0q4uRaL5S+WeQ=
X-Received: by 2002:a05:6a20:c70b:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c3ad600b4dmr20941784637.10.1784658660259;
        Tue, 21 Jul 2026 11:31:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:c70b:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c3ad600b4dmr20941746637.10.1784658659751;
        Tue, 21 Jul 2026 11:30:59 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:59 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:13 +0530
Subject: [PATCH v2 08/10] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-8-febe2805e17b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1138;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=OS3nTF5uZPVKUD9c+8gRRWe/CCVuPxrxct2FrXKjb9g=;
 b=fxSUs7sskz28RP5L7ovnF1zUOcd5APy+e4zGoyJcuIWsZqb4bRibuaRo31EJ7gt0YoCzYusAw
 7VtTFeMuA1kCuDp3Or9fRBCcp2Q7duZI6wIaZz0EOIiXm4QFjmXZnr5
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fbae5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: YLJJk6tooqJJPT5Z7DlChxfiRiCBJQOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfXwg4ROLtvrC0/
 u7jKB2ahhefNtkZRn1/+me+Foj2TIVvL0COH7CZGFMXt1JlEHwceLGN8qsoVO6DDw86JfV1aHqt
 BepZGRHfWHnnA1RIvOLDvI07DWX4+F++4tWWCSrKJRVto26ONHse+t8mFWd57J26+Vmcvjl1XV3
 xpL9HsajsmO0iSOi0I6H0GtVBkt3oSjNtrDlDiRNY+R2z2lO2j3Yb9JLMRoI3P5JvpohRkB4WFn
 0E39fxe4t8jY+amc4acL4ZzC5AoPZ43KJc3BJYiIET0TtJ2C3kZJtR575pZxnLb2LO7jgZI3rgW
 axfqguhZPIKwNIJMAeOB9+qlAUdROpnmM4SaOvSQt4xW361TjyvEi4iAtpDMJkZnzfQA7+igJkT
 d1Dd92LjA+2zShI3t0WoKn4SIEtQVUlJRw60SU8/E/2IkjP2r2ossUJs39YoI2E591R8tM1eBqj
 ykEKZOjOtKzVrPrCt3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX1UxvfJdQvffC
 NZ1P43c1LHgaKwp7LLamemv/deqgrpYpbhXIJnuCyJkOZClwsDasjD9+nlCXFt0VQLZjd+lo2nN
 INk8q4Rdu4XmrqtksH/BE7237v9SzsY=
X-Proofpoint-GUID: YLJJk6tooqJJPT5Z7DlChxfiRiCBJQOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..67b77272b0cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,15 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

