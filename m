Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC42C29992A
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049510; cv=none; b=BlJlZr82LAYvtgbMqv0UnyHywe7OSQ0LGp329Cnr7cqdWwpPk+RcztrKouzwdxs87QCavMAvxhx9Osb3QD1S3MxleHLKy/gEhO5tEHYiNj+YN6kl4AlwBMp+HKmaPbAXrBBPuvvaCkerLTboY1RpRDYAKRIE5yHZuYpRoyi7Qlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049510; c=relaxed/simple;
	bh=PUOB/WUFiDir0kcvDNojilOCna+Is8nt41EZNien9Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyoXtKlxXa+5GLB8trcgXl6Dqo6gEVdhYj5nHmC/uhNRcCIoFrOmmEAswHe6ecXLBt+vRoctBFHUHnPXJdw4j8VbW2Hct3WFfoz854mupA9h1p15dVUI+QKvt0qokgBSW/pqLpq2zBSyjanLRpFgTjP0vCVSWDs0kp4UuxM+6o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pj+DyRlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRO5ziva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pj+DyRlc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRO5ziva"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EHAebe1177001
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=; b=pj+DyRlcHZB4KDEq
	Nyo+dST9tBKMJxKuyLZw/7K/s+E12bczgmD6bODwSreG4Wpw6AYDFsh2+Td6Mp6P
	hZitrFRK/qLghv7wFT84ICnhwGMiAA63ohKh/UT5d9NUyp4HcKDSP+QboM9XTXCn
	zZ+NBRYMTwwvXETcg7d4GLFQn/TcF2vpAIGiM10kMbydWocyBVolvscpk9JxqOuY
	S7kZehoVzaYWPY9+U9kMWfRBBDxKbOV/GuD1oMbcfJ4UIC3vZREWVhnDVKEoxrgm
	vqjYIoJjWqtLRrF/UjWvrw08745qbHrfaDNkEjn3QUbVJmxv2umFvFm0qIiA+PXB
	RFEy/g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kr10h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848474825ffso1890814b3a.0
        for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049506; x=1784654306; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=;
        b=QRO5zivaqrzz9AOyhUi4qZR6DaUCwhdb1x6wxIBGX4NnkIOF28K5BZjonv04q3OdV0
         g9hfmrQ7cTODyrVHF4MSwQ3xFOC4tQw8w54FLe8p0Jq3ciwri68gqVak4INQRlNIiW2J
         BOpA3S6XHrdCwiWYTu+Gx/y+Q7Q/9Fw6ir6veJDchPCgeJ/OoZPHyH3jxr2qtpb11/pu
         7UHQH+guJwq3W9T2kvbBNLCC3QM9/3D8j0oJgSQaqzC0cQZR0s5tb/Gz2jCW0v6hue9f
         56C0c3mHfyOaAQTBNsp9dMce/eK4/L/TRPuqTWWRszS28q5EYGltLLQgQ3ypFQMHO2e9
         w6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049506; x=1784654306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gG7R/01sqhJDRepizNPrgnwNsv/MIBa9LUQwgiZjRW8=;
        b=OJ9Rgq0IzovQ3fL3WxAQfeglOTvK/BlpgzQW9WhIEHQrNVqMGjEWYfOH8ErPKAbDMB
         rOGiR+KJbCi7/N43NEYytTW0HTZqhJZbAmxchqmJQcSm54Fg09KrL5j/rzSA6eLV8Zi4
         XmzSGWCSCDY4PEcxrt07uXMtCxZtQNI6d6Ath2zkHzTQLrF5HUx8GNdqFCy0YK/clw2E
         qahcIQNyuAm0YnJsJEiyteWR1gGJ6RhZNttT8p/8JM5ABgXW36oXzW7v0BmpCNJyUu9w
         uHJFWmABdP18WnxqhAuQdMUd7gp2V9BYb+kVAwH5OPl5BQfck/NdKr53hUabc0CM4zHA
         WAWw==
X-Forwarded-Encrypted: i=1; AHgh+RqXHuiOICZH0KhSQLFT8uG5MZlc5Kc6DQENMUlBXHBT9Y5bueSBw680tHa3vtNF1Yfo6Rw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0bqmPpGuksVPBaSC3DMVW+We5BFja+Q0LYd8pkV+rlFGxlw9+
	VjqEEYyWgfIDxmg8NGpJA8Shp16On2DUnw6pgCHKST1N64x/xeQfiMqWdgEJPeRKmLYoE0NPN/w
	zDCdMn9w84o2Itw7RHSMjaRz7m63zf28fIelz54p3E9v4OcI52i4Ipeg=
X-Gm-Gg: AfdE7cnA6hxXzc2kO0t4BJxIqoXXoy2EMj0Qe0XQW9wX1L0kjUTzA5TXb8kr/4vjPoG
	gjuCTPK3QmpLinic+MQKuRZ/86obEl2c81l7fcmAY15q94CUH3Ex7DJrK6amA83xrY3r/ury4So
	HW4BcRIw17HmxoGcgWLbMw25Ezg/SwpIurcPGuxidWzoRto5t8OI5YS2bSX37vZwriIaJ6TCIw8
	n42l/drYGiZfAKRR55ay6m5KTWAw7r+R0Xkxlw96FykUEAOjXCv1zAtytzTHzMPxNep3JSEgZnP
	Qy6QL0/nchigJ7bmqGvoTJ5g/8PeM6W7rpTMgitDZUVK2qnjSAd6NtfcYEW4RuI7oBm+BaCA9IW
	qYEwHvaFBSJJJBhOOcK0axRl/YYZ3AbuPbEKWrg1JYyR6uvc=
X-Received: by 2002:a05:6a00:1a87:b0:848:57f3:8f92 with SMTP id d2e1a72fcca58-8488abc3652mr12495370b3a.17.1784049505552;
        Tue, 14 Jul 2026 10:18:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a87:b0:848:57f3:8f92 with SMTP id d2e1a72fcca58-8488abc3652mr12495342b3a.17.1784049505079;
        Tue, 14 Jul 2026 10:18:25 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:38 +0530
Subject: [PATCH v23 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-10-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=PUOB/WUFiDir0kcvDNojilOCna+Is8nt41EZNien9Ag=;
 b=KWNkfXMmKYthJN1uiFBbtCUXReE0eGK3H1pxspQgqexOI1PPkEewBDCDbvLzZhUdhh0OCxaDh
 BwcB08aHB/3DrxL54W/bnlwFFGWJlmFNQDZ+h9ABzFiYnUXo+kw1SS0
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a566f62 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: HHls1Mdkj3EEw1xBe72-_rIL0y0Pf7bR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OSBTYWx0ZWRfX17SBtloa/Gai
 awh4mh00x78/M/00rLyrxrQFHzz04tCm+JN0yqK0Ieu2hpRUaw3/2lUQmSoP65ExPPW2BQuMH0D
 gbDvhMYddpdn12QSYEjuNrcuvgHLRA8=
X-Proofpoint-GUID: HHls1Mdkj3EEw1xBe72-_rIL0y0Pf7bR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OSBTYWx0ZWRfX6Z/L6aNGSzCP
 yt3eZZOmpxxgqqSa2i11VJo4ozqNiTwkoSGtp7Wp47xvBolsxL+RNxZhRPthXa0Z9bWgMtr/P/1
 9UM4PsgHglxlQK+lKNx/xq4YRODOvXw1z7z8y7zaCDz5D58gbB9oU4te0dGDUNbmliy+9QNiDXO
 o3BeYuoau79FYzWUnS6DBbiCuDI0+8ZRkWvlT9f2mBKK+9ovBDeQ1BKbg/AT+NcYUdHhTIFBj7F
 2h6138h4wb2r1qfOGiMiSlqmRCidqFo+pHlYfljCs7h4P7JGFVCqsDE3GwWTcrHu9bgvifbnYJN
 sCH9dGG79jJGFrier0/a42wkiFvy4MSISDKPz3wTZMmUo/L5tS9lX7W9OMHREjhDK7KrdSc3j3c
 A6lGD6C1BXdx4K+/3xIn9KGhlNumzXjbsfgaQSDEUeHeU/jRvBBj7WwjkI67dknmATj3COxSyfd
 B7Io87vog+AxwbXvMmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140179

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 7e73348fe0d0..82713f49ba63 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -866,7 +866,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..b7a0b5347639 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e9a932c90d14..0dd67cae41ff 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1105,6 +1105,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1

