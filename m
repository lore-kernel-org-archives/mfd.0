Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8831637417B
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 09:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750399; cv=none; b=CQZ+YTb1Sw+wiDRIJOVTueYZahOsAZd4MQmB3PU/syCzTwx3x/PbVll2UYKvj/6LVaiLNYnw03rOuK6lPqXib2BTsV1jKx/OLUFiSCZYOOmykPUKj7EwAEzshPNInDYZb/D+9SPbLEhA1qlMlIU/aff1hiy3BaG79A5Bo+ts/Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750399; c=relaxed/simple;
	bh=O4Tzed7m01NrjoUwSpC2HzBAZQmMIMSt/VK8SDx89II=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJbDPcLAVSB2yF3D5QHDf3ysvQzCsd0AgNfyTqGJYDNt3ZS8ZqA2GaeIFDNy6F+028Ro0ydtDZOt6T4BAHDJyLTJ9cUSQrQb6+ZWTF5/Cvc0z7+/yuT+dmL05pP3C7zZuYoa7fTxWu86jwHvh6A3bza8P1STLzfN0yWvoYZfBS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7izVduf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdVIE2tM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7izVduf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdVIE2tM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bQDA3957180
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 09:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ezThn65VJDM09Kdd3e/bqDNQx15D8XtlMr6yKq720FY=; b=M7izVdufe4+P8sb5
	LAcVwgnRudqXPYT2ajswUCwjO3LYTD+vzy3GVnFxt5ff8wmQDxA8q+foKI2liHWq
	p+F1m5WiMNS6WkzHO+GXj1KKHchgpQjqMJ0qYmfjvL91jpGju7uOEt4kNWP4pyjW
	i+RCKJUHKTMkq8w6QrX1gFj6X/6e/QDOm2DQPFCcCZFJ7LArZLz9QaWRojvsnxrd
	KA+qlGH6nCZQ2dWVbkihKQbcrJhli+WK6oEhf67u6xHrQzTxLhFX6gXb2bgyLzBH
	C4L5pGlbbRUCnoJjmCTj9kuERSyTnPOJzhD8zZrlXrUMQ+PTyiJZvryq/gWXlxkM
	4J2BDw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvngufc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:46:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso5928370a91.1
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750395; x=1786355195; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezThn65VJDM09Kdd3e/bqDNQx15D8XtlMr6yKq720FY=;
        b=OdVIE2tM+HX8D8fZ2VEwS2vyYjY92bnz9HYqkv3K+roMHs/v8F5DoSQiooXGqF04z0
         edg0x9Bn9D8iUfvPbsc35K1EVMyfJ5RtgSyUKuUddX3aXVfblrHQGuKa/fzf43WHjstr
         Rug/FiEgS8A2AlYccs6mmO2GifwEjn+BB7A9PR8qpGm/KRMHB9DcAtj7haUFiX9pmSlM
         +jvTColDP61cy6Fa4TlZLLgymPJQBgS5OP30w9ddQQDacyZQojw+KBjvtPbN9Na5vBRc
         16aMg+R8pLOcSuHbAweg6QgEKNw1n9jkWoeFRjKlT93kp9696W47RuIVHNR7Pjjh7Qto
         TxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750395; x=1786355195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezThn65VJDM09Kdd3e/bqDNQx15D8XtlMr6yKq720FY=;
        b=GygFYsf2gX/foQVf9du1eg1veKNOih3b5UhBoMSS8aRZvFIMwhx6QgqyhA8kKGGG2q
         GwYty2j6eH53Xh37Nd198UIPUIub3xO2P9bMTyw8GYOYIuOQbJ+OgzEsyLYs0hxOFfCg
         FAxahTHQzxC2IKrhTf9P7RkngGCMEmhocc5dju+zsuApS3UPrkteh+0t6qmHpWcyKK8b
         tQQKZIg+eXybcWi7mDTdA0mfqlm7bIOMpV8Wt5uKPfviFzlQ1Z0OipTjOnVufDPA75+K
         AtlSwL7PhsyJ56HizRyBwxTLwwuIM1rACiuyzBgOXkXSHjNg6TuYvZKQrNFFb3Th6gAZ
         wFMw==
X-Forwarded-Encrypted: i=1; AHgh+RrOK0LdPhwU9lWo6aVrN0ZGBs26DssSSovtIxb8LD3KrR3UI6Ey8J65m9IoLfCvBFuYh8o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8aOZd+ZJY3O6mEruofIXlXLI12ryo+eKwln2eNYKY2VvcZGAI
	5Udcqm+qplMmXVHRVZskysJzvDppF+DB6E8iAuX42c6I1rxKJSnQRez0HKGqNw9/Ydmb9tOrUgo
	sjxNK1RuIqxUSia0uSsBzHQi0qNaVgv/M/45rhlp1GQVRqC1iYuMH08g=
X-Gm-Gg: AR+sD12VsE6+j9cSILzxo0Ge/QniqUEGI9E+6x8+iavR0cCV2mW4ZjMvSbv7Z5Fw4+n
	acqxP9ZBSSSesZR8GxUXoLgapB2N95e66pcScKQgxZ4lfmYVBJ+/UWVyKCmZKG9BmmWJ+Fcsf/3
	eX6/6+F2vfuK4Qt/+xKHAI91nrt30fhRDc/28Ds/N31Y2QxGLOvv+XjKDtNmvNbYREhGolivBF4
	e0gof2bkOenDO9SRs1i5jDOcSTTP5netWmjqNhjt1NBRT6Lze8HSrxvGSP0B77KwY5ZMOkZipOe
	X2UBo7SDeTXmO+uqDVh1LHRi7y80mYRfdxEzPv+BoDsQSRdUKLjtggk1+dnOPfQYnW0eQ/WwOdB
	TWi3Vu2i3WKSGBQez4F7QI1lBCxevNos8UMiM
X-Received: by 2002:a17:90b:57cb:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38fbc4431dcmr9095195a91.14.1785750395461;
        Mon, 03 Aug 2026 02:46:35 -0700 (PDT)
X-Received: by 2002:a17:90b:57cb:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38fbc4431dcmr9095152a91.14.1785750395034;
        Mon, 03 Aug 2026 02:46:35 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:34 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:42 +0530
Subject: [PATCH v24 11/12] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-11-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=O4Tzed7m01NrjoUwSpC2HzBAZQmMIMSt/VK8SDx89II=;
 b=jIK9eRQowAumFQnJU8rgPJj3lU1UNl6daKuWFCJ3dV5jgI1ReAHdNEUECvVtm84xI7oCNMRfr
 Z24jbNqM8OnCRYo8+wOhwXz1fw6dU/k2BIKAA/ZnbfCF1H8PV6qp1J9
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a70637c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: m9GG4zR2NzdpqGGC251fG9MlpFF6DxTQ
X-Proofpoint-ORIG-GUID: m9GG4zR2NzdpqGGC251fG9MlpFF6DxTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX2wgumG4hOilV
 WFG8bLQpkXaZ9MvLO+IIBKxJ7cK0ci2PNzgMRxYmyzqaNAgNwPFD9upTsO/OSkqq9XJBXiFgMEn
 1qehhZAee8Jt5dRyLYxWPZg5ZSp7elpZsFpT6IsAYto5QaMX1rRGN2Z+PcBLn37+UuXVDM1Oevc
 ZRhLVfqt6ai5UlohzEZBGYZmwBCHwooZqJ7dabh+77gC5V/A/8F7tUGzRe0jLn8fkM7mSTFq1nO
 dIA6KSVW5KjxpS3DEpYSrVKYQ2ArMAd6jkxsFDMewF7JPittQJ//ERvjFUdaxa3LNYFHR+UkFD5
 SZ3r7db43B/aBZUqEdJUtzejtBBr2AEtHIu3MjNoSlHI1GY7ZYlFqjvPesLCgdWIoSBQY6212Tm
 ELUwAUnOu+4ema0S4eWUFetVTPfDxSo2Mhr2gtKkhbTrw54K01eBms9zK9OnpKauNriCCRb72Rx
 nTO13EnUtXWdMAN4aCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX7k9guwTM6wx4
 lJ3LaPLNOOzLUj8TweTBSXDP+c2tPiOBcB3YzK83QE2GAgt+Fs8DXALQ3lxYw9R1uF5nIMDqQP0
 Fs/xp8bKVtVdlgeM6P8DJkEMeeyRuDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030087

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..df668dbf2bc6 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 2c0af0326147..81cdc4ccf8c9 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -654,7 +654,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..aa95584b000d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
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

-- 
2.34.1

