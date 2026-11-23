Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467327;
	b=HZtCYRHyRJPEB16BV4/O1MY5V7Tq8T7ANALoaMr/0EQ7fGNEe6TN9Opk7sUuftJv4leU
	 uPTG3T00trkABvk6DXiJTrEdyue9i76+8fu/WdTKJCG9SuhFSbDaZhqZDuFLYvPfSD5A1
	 mEisPb6mbOjaDoswzgUGbTxaLRsAJdob3yeJnmcmUkNTLswEyRdyzVzUL0ImuAOUK+SRu
	 AfRuQSBXHKURL8wat70DWgjhYPWSGUoo/HPWh08X+WtmpGFGov+wAKpfdrXrlDU02E5t5
	 7kcj1CefmxKGsTKX4dhLMJMMy/U7JuAUfDcN3MX54Wksad6jqFYeWLAWafWOurhAVuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467327;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
	b=dJSi894t+0nq1adeZ8q80yzE3+zU9P5eKuO562ZhrP5/RNi69wYvfqhAZMIopLlvUzDX
	 Ku1Ea3z+a4jO2sBF3dCE4let8UAE0LR69zVfybH1muK8E0HbiqiyvOsmdGOmS+un5mg0R
	 XS4myAgoHG1z17FaZa/pMoMxWQ4HZvZaZ0Eb6+jzh1tYw09aKfH42UEdvDfyP06qFn3wp
	 GfiCcYTTPiIH+1ZJyiuCeO+cBPMTi5w7qsXnf+/+rhWdh+RZrkD+SEAybcDpIT5MDvVUY
	 FFW5Nc/5vIQGjciDItdWVVoZJNukE3NoS3LwhKmbSPuTSXITE62bJ5qQvEmPqPWdJoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOleX6Sj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C39606A683
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C39606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOleX6Sj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuarl2973607
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=; b=D1so8nQFSfGWQh3d
	5muophMEI54gtgWnBFN4WI+jf2diOcOOh3E6uOPfZNiGNxwnI/0W0xMEqE/ELUTG
	GCDyzEkm3r0/+3nJdr0w85whv2A2PnRZrFZ71Imryfo27Qm562lS7LDh+mtr0L2b
	BYg5DctVFIU8Lvn3+T+NO2E3CiSLRcVxgwXsKLoObx2RJtxvyxUXcXXh+zDeEo9g
	N6dvyiF02lhyBis2vCBIAWddgX2OcHf++/SL2sc8YZ/Sqn/usSKSsWgsgmM6kOgn
	PjIYIoGxttyTL7vFfoqLmD6uJSAfEphAojM7Os2th1YRyYVhARjRqHWlBn/56J2V
	Nqcz4g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy03f8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 20:55:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so3754723eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467325; x=1796072125; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=JOleX6SjrA4uQ4UIZY8YUOb8KOfDrcwiw+nvV/FoHq9n97DKP79EvLyraAE11RO37S
         63C5tuqjK+kIx/aWZS68mDYTBvnlmQHR2I0RQOkY2xq/wkirOjNd7ZKPXBfnv8O6ZZSx
         XaKHmvvUf2K7yf+l3t15tCTYUrdGedJLUc8VbhXag/bJNTU6JENqIjgV1rDhlRHtsOa5
         vWmhnoiqlsGI2Wno+6FjrCABITg189btl7ZKACQUoPIMIwWJ6PuGV1MEGs8/YwzvBJ75
         OKNRRXIO72+zvsUF39dsAlvyV6Fll5nnjnzftXZJSGzMRCXz/9guQyFijNi7Pky2dx6f
         KBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467325; x=1796072125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=mSRqvRw2zSRYUXW6qDiexOKWWjYPM3WZRmLmQacTnFT+SUbyJPxBiiJHFhiYTisbW5
         KwgvsCXBHQeCkHcOLVmCdQqwaxz5rUtNMA8Bwdg3bXermGHKthn5yywrWWlN1eodUhxe
         6N1/Pk2/Y0tzsMjZzMZIph6WUh+LEEjMtcq4jkGFwIUBqZZ8pL+GOjjVqc1ThZDhftyA
         iK3Au73n3YYPgcXrUFcxKLlLADUUKYaghetnxb0dBlORPahuRBNs0oSxUsCflDdMn2KQ
         ZbKBTXpv9loq6Pj6aMXOzNkV7IJKslY2y2nClACJ5iwhXUHo62UHO8maBwdDYxqfda30
         z6tA==
X-Forwarded-Encrypted: i=1; AL+hErECc4NWPCa7Kg+NVqzaQSaMIqE/YKACjt4Q8sPunFpj1yhpDsc5Mpb1DZM5Etr0Z8WJ8Vc=@lists.linux.dev
X-Gm-Message-State: APuU4Z94+pBZ3dSPvJZu0msASZWw3Ia2XyfYIt+9ZN41AOJKGUd77Wtk
	NEW+Dgn+XYJDlst4mBmoP0NHVM0M1hvQ63y9xiXlkK0yGFbCj1zRfezwGBVVu/P2J5zOtRV87jI
	bc33+KR4MsdwRZM6xJQ8YfNnLPvr3Ri/J0H8CsWPeVvH80wFhxRja91E=
X-Gm-Gg: AZFdTZfAiRSJHNQrrcE8u77StELW3/j1JnNdVJI/23y9bUNs08GvT4JzQ1NySuv8HFX
	DCFCnT5qhVCfmRtQkyjIzFcklftwejof70pwoJKFNk16bqAMFNSkBwqgWjeTejYM4kpRx8gktsV
	oE6Ww/L1pJa7JNBLE5RMabvP7iv/5dnDVEAxz6jXlxIG7rzi9IXR/AhzyVuo9tLKRDR6VDQEHO0
	fC/3WSC04/wP1Sb/8ugQ0kG1s6ArO2PZioxPla/0LVg//8C99RRWctxPzji/B23azvZxKem4CKM
	wcvl3TPYrBs0n1WNBmv6LuRd5xXaprhdWlnCUAxyBVV84CWjZQAfH78ec+q0j2XP+/Ytr6p1yUX
	OealD3Vr5pnrJLsm6SZLWxiI0fJAiuVXWX2IzYtOR4lSd3qsetAv6Lj30sNCAz+CtMx98Onv9h6
	Wn8ZO+cVri
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905421eec.28.1795467324799;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905387eec.28.1795467324257;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:23 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:43 +0530
Subject: [PATCH v5 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-qcom-bcl-hwmon-v5-3-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1726;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
 b=JUF+Qvr1MfhBjQofxRFWz8itf9IQztM3tWFITF/Ndgd743dfOYnitwBPWbZGE0CaK4sM7mgmL
 BxKmzmW7mDgCmk6pKpOjoazilMJLtWkZCPzxl3zdJKpzLxtemj9S+hx
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX5WMJVXtc9euv
 OLjlS0MfvbmHmcoUowKxRbguAozpVtVngtXAdLip0BQ6imUOzC+KE8IuM1O0oVOuS/Slr96hdxV
 k7aiY9oL3OThmzBNyR0cEquISuatg8TBRk+LjO57fzRU5cCwrkNWPPqaUqUXmWHfWYgiaoOVe9w
 UoFyPue4J9Qcgr+R/Wkp1B8BI7D/HKgtuCP07/sBAK3yvcD7inmppWbeyPFcSg8Nf2y2ITMiFhz
 8s60VOG3oCqlJCWzbvEQM/iWj42G7wSqPsQn+OM6O6on27rRJsewsVS4Rbec3X5SehDS/eJpc9S
 XTy9/RA6Ezw1CAxDA68C6Qgxhf1QKrovdOLHXdMunok8qOB4VsMZkDGwq4PdIEyhEG3MS3dSdHv
 s9lFkK4DAwJJI63Z1Hr70UJacx8ucqwkfjW6mLefnBH9C3Ojvc3ZCCpqt0D+2tVPzG32u+jOfF+
 BdJe1/LlLFKDq0JprdA==
X-Proofpoint-ORIG-GUID: K3Q0kSAQUX7lQ04UXpBtRT1yIl6GyxKD
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04a83d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: K3Q0kSAQUX7lQ04UXpBtRT1yIl6GyxKD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX5qvefiKqx2iL
 fJNRyGgSNmPt28xPi+E5nVztgBLwFbdmvq66SCBeZ5Zp9acTY0cQ53+KqvQfZ+NmQl6NHyOIG4q
 KC0Gipz8jx3KpNDiGU2tT0w26BMOeC0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

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

