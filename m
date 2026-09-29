Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3951A14F
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687408; cv=none; b=bM/a+XYdlXg9en2067VQoYDLe4eWpJF2v1u18oKYWn7HEYMfLqYdMO+qX4+IdszX2b9w74WjWuKZigJEGBHIB41FEn0cQ1k4k7ZvIowJAl3TOPe9CBm7vrDjof915nROQpqni8zmOZD6gAOwqhC71GCxEnQclZyYpspdbRXsWmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687408; c=relaxed/simple;
	bh=9HxEUtXiFoTX4SHdOnc/9dLz9j48pEMhLZUBvtdAKbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgBXIekNwvEoGQ/su7uqY55yjxPA6bLhb23qDME99Myoa1mCK7MdOFaITip1AM7V3WznPUG+w9+OvpwTgHDxSpV6xTrC593+hvHtaBwboYVd2SVEX0+nCDi68518nrqMAa1C0P3McRRK1WLzD0FODSXV3xt/w5yNOMbwox66kPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZWIUxrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnmSgfxx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZWIUxrM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnmSgfxx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqhEK1577527
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=; b=IZWIUxrM4xnsa87O
	QrFMCZONDSsjLZCzOUiyFY+vcgcvBoWOHtYZJwynmVXJdFQV0LssWfz9OLcP/Vys
	8ewrm4a1tQy6rnWUYij2VovS0tEISAoApWmkCoNoKeeSXsZK5p921bHmdmvLNxFj
	Q3tmvueZJmAXBCUDla/nc6VkX8zuY63RsbDf+/+ne+zGJ22NFu641TXF8f9z6n8/
	wleZZeFZo/levRVu5VDHL8/KRwu+k3oAgn8y+SN8knO/A7r66pafymopgxsP032N
	tf2h50TPkESvQ2Xm/dszbf1hNus8W+82h5DzVU8F5eItZb6epvr7VPa7SfwuGRc3
	nK0XZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4s4gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 13:10:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91454ecbd2fso72331366d6.1
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687405; x=1791292205; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=;
        b=DnmSgfxxeE129jp9k+4uraKSIA7zLU/kntVCS0yu4pD74ceQypSeVR6XohKidJk4+8
         MQbkbPuH8ffNUgUwkOD0mzPp3HqpPhOVcX++IxiFKyXsYa6CxSnvfk5m9A8L44jgMIQv
         BvuAG2FoibmR2ACc4pPyyfYyrA4smAwHKZb4yCVycq2SHJKblwUR1GqIGu65g+ntbYKb
         ZNImW/NHaI9TnY1Qqwh3YF/RtkIkGcP2rUA9QL/45aivU4YkRB5rmyr0rReQ8k0DwNaf
         yzX0cOhEcvyfsS4Ej4wS4E6bNHgVfds/P4fbvM+L+Gz7Hmm3aSBQvCSKuzyO8pFHiaaV
         s0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687405; x=1791292205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QN6s1/Bps0mw1e5rLu6Bfb3VEeJotKzT6mLwiXsGK4o=;
        b=mueJoeTTBTqO7lMSfFsDlE8aFMsqr8gvqimEr91Hc36jJtWKglNhs+gi8NhnYQQCjt
         oBv3uad3IpXLuXaGk7UVuPdF993nN+6f5kmNrMLB9P6+U62WFa4IQ9Upz45jfXXSKst+
         lBYJxzmTJH5JcYUzodQVrz8ihyuZBtkm1GMAUpDUs3tbrprT1ngr1EbePumlgWWO5kUH
         Ijhb+xiBHs/sGELXKwcE3yLQstWoiTBVOsy4r0BCrPf82JaCY2hquvfcWA63n+/LIASq
         2d5CzhmLKr5iReyfMwyG8NQAjAgoLT38axYHZCIE1VkooknwoNgciLu7kdtR9/2wLuyJ
         ELPA==
X-Forwarded-Encrypted: i=1; AKwUvBxvUK+ACng2Vnsv8d5d57fo6lo9lPOrv8i9K6dA0I5ZvF1msbQW8UdJeQQGlLcX2du00yc=@lists.linux.dev
X-Gm-Message-State: AFuF++kwxVysyVS6EmH6WJnMYMr1jreEY3SV4b+jgrwP2CobMByosVW9
	4pYkbiqoch2Udtvyi15a4/9p6PAdfbj3L6EqxOWeHg+WaxmTcqd/99g3j7JYASW6M2CicjUkk1d
	L/yQS/2V4fby5JGxpJQmEdnJOQKrBYfbeiv9CVQ3LZbCuQpgMS1vlhPg=
X-Gm-Gg: AYBFou0FX8URRjDsa0Tgg3w42R71EsriS3jjhRuZHMAWdL61do+FW3003UsJiB9TzLf
	cT+5YfqVZgaN44GFZsgABxgYo0HseTbGWkQ9nZ1eH50Whil8bttOfQRtP34w14WEzcVv4Avm2Rj
	YSK1W0Cbe09G36TH037JTR7Hn5VxgtXUYr+7yOJIVPLwsubzdXpgrhvDbUjcivRBHauRgI89gQQ
	6h6qEX8IcRKe3lYMKFbVhO5KQNBUIouicz1rGwZZl+ZaEIeSMeb2Tbb6hT2ZRRACrdnyNB86EzV
	WdIefRxbInqR+Wa1AmZmoSXgYuc1TlVvbn5bFpeBCPwi6XzosmsdXHcG8E+/o9sYkQGeF24WyHg
	2s7AljF531cjjPgem29pRXN88GKDG0Jd//X0=
X-Received: by 2002:a05:6214:ccf:b0:913:fa79:99c3 with SMTP id 6a1803df08f44-9142f94d216mr261680836d6.43.1790687405368;
        Tue, 29 Sep 2026 06:10:05 -0700 (PDT)
X-Received: by 2002:a05:6214:ccf:b0:913:fa79:99c3 with SMTP id 6a1803df08f44-9142f94d216mr261679986d6.43.1790687404649;
        Tue, 29 Sep 2026 06:10:04 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:04 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:35 +0530
Subject: [PATCH v3 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1673;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9HxEUtXiFoTX4SHdOnc/9dLz9j48pEMhLZUBvtdAKbw=;
 b=/vuXxbLlqSAzDejgYnMcuPPH1hXmQ8UXDiYuQ2CgBfgDbCNwjv/dPe+PwPtxF6/U4BN9UwvpI
 WZq/rzboEA1D4vTxchbBlzEkQESYRNsqN/UWKIjeLl29hbOAGNnBncN
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXzksEzU81Bcce
 zIgyP3BpVo9wkft7upT02oBN2ib7+8L3rnseEegFiBwgZdc1lRR7oG1txakgAYtMVvvckyZVp9q
 uV2kLHjedKdeU+5w52O/zZSxxhZBxuY=
X-Proofpoint-GUID: 77xLoe7qtAZUDTpWYkxEVhJILliTcl_D
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbb8ae cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 77xLoe7qtAZUDTpWYkxEVhJILliTcl_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX3qYEVyIKtR2p
 BNhqLrqOqKKsKSlV2i1NFIMKY9zcC5Ud5EKlY2h1JKjjg0nZcIJpH6FXoWj5gPe7RJ6YZxlRVbU
 srF0RTnAvDlfhCgMO5SeeAp8ZVOOvbs66usunomdsDlez9lBhVK6CEmhs2rGaYeBCq9J2S879mp
 5L50xwLX/z6OV7bflH9mnfAiEcS1G7gAny+2q+IgE9N1dHpBa107jAZMCMz9O3GFN7r0W+V8q6x
 L7YKwU+R5GnhDjlqFbauVeA8h5QOgbbxcaSCz08o1Dc0GzBjFUYGGEU+OhxFpjJr/1hjgf2XyEB
 DX52yqyVxXXbulaSoCrCgTSuvVaz6+qmQCDAiQQwGoXKfiSg4uFCYYs0i7dl/QWr4eDxXjOR8Z4
 mJB1kJH5m9QVTLrGdkrxOo/M9tHDkEpqQ5qidH41QuEWE7peWfE0O6oCQh/36X+EXlvc7lT2uMw
 hX5LOQe59BFFPhTXRKw==
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
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

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

