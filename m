Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E68346E75
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049539; cv=none; b=MwXmsYuIamQqJWzxN6UChZE7iMVjqFL1KW+8V5GV2XbOLIYeW/JdRZXehyzMHkoGh3Ol4xB6b/1X05e8qXaw2fQybXoD5I6RqZAvwtNm2MZ2JgoCN5qIIp66tO29LRhm6QUJ01184hXpVw44aIBJlAKvjkXSNzgkuoFG9msZwXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049539; c=relaxed/simple;
	bh=/qLMtF4YYOHcd2N1W678IQPXyBmX86FCA/XfWBXjocw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suzR1UQhuODdU3ZpmG+XKfUU9FfGJiLX8gxIWCF/kJvptDc2bvVLbsJvA/+lRvjUOS4Yw2zU51miPFKtuyYvNp6IUi4qHqDW9fJuqBAUn9XUmiRyu6hboiEGy7akculSJ0bR4MI7PTZ+Q4qwq26/0wJaXiEoG7abm5wL1273hNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0qCDEZ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoLtdtsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0qCDEZ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoLtdtsf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6lUh1096989
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=; b=G0qCDEZ17DRS3o0E
	11ggJ5j39opLgDxXNK/d/wONKxa0fVnp1j9mZQfJ5c51xMnCvqSw+AjQ/xNUsThs
	5KAB7Hc+Lv2RM8XL5wMX1Ojr14IumaPWXwjjM/thnV186H5c+BEnH9Rf6wpe/f9f
	Kgwl7uwHWicwx2y3C1mf+uCPeo7zX7Aig/AfPDNNg21mJCe4OpgOp5jnlQcRKgsA
	1Senm7UsHKP73EwEWGE/ApfeigX/PZY9w0UekDDkNY1tqyApbxNJ3uMlFAqx6/wx
	RQCeM9HFe8/pZuIDQao7b16GfptJPaP2zchdS2djMOIDbzhBlw1EluvDwEd2bJzT
	RvMu9w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqs3yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84885a4fcabso1613260b3a.3
        for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049535; x=1784654335; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=;
        b=YoLtdtsfFmJ9jgXArJuXs/i3ihd0+hGExAFPzgHlrDmKgOAYQHUyHtUOYwPrbLANFI
         ELbRiObeivJp7z+kPKjecBSHFeMhzcQBi8yUbOGVwLS0C09/aRPRSPdgrUgTMhDB7NvK
         tiLtSWGgSV3vPiw2svfMDmJRbXZ9SzIjP7lVoa8/etL4V1+SUOjS5kxYdYThG2Et/mSB
         lv55nlg52iUMcP1ewiJpxLTxF+AALj4jhn65epyTmYNh9pqQ+pTGHTya2v7FeIAPsQhP
         q0WyvcRcqIkcOmQzeOhyEVg1mF3G2S25h772zl7WHHF6QD1QE6PKSGuwVbUIFtUSvMGI
         uFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049535; x=1784654335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlWwBUz8oIiLyO7bjGs1oO3T6bcXCkYkZ3ytXjL7maA=;
        b=PzVJG9nSV9uMYS3wbRqhy7vdWOEe6SFa5pzSya0mF36p6EPMmYcZBmNBJj3AHUSOh6
         0+pPlU5z0U7TwrEaxeHuhdZ0PT0mcyBRYZ3Y9lb8yCAVKcNN1068Nyv4nwbkfUBJRsMM
         3uV7vwvEJ/cfTOQ5Veei0cRSZVVawGxrBsK+ZrcjVrmH2qAsbAYsA2coY/XUt9NO7uD5
         LDDeA3cjoD+91/VPHWuO9luEUSMnKhMRCLvNXGzq/+Y8Ge94JIKipaOhqstA0S/wR9T0
         UjvHWndZk9MDBhh4CQSggNwj//EUQDG6ev3l5MZbC+uS3mWLHSkP5E36vj9LKjk+8Ygl
         lA1g==
X-Forwarded-Encrypted: i=1; AHgh+Rrzxv/5Jmib9N62gty2BogADHaMXrxle9B4ztQJzhguQQu5640a/Xkha9gs8oI9Z4rH9B4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj5JhciSGMwjsXVdtc9H4Zf1KcZWXPeQY3ovPVBkHo1gEZjmif
	UxjBBuYHy4R+Xj9WHmuvDmJFtFT79h5HLAz4UufBsDFm/auvJumznw3RyqJlR/ht+sPeZcSrloC
	2A1MFZ8Gdo3laKo6r5R7gPa4QbJWP2iXvEc7AIvgVojY91rmzgZUvCbc=
X-Gm-Gg: AfdE7ckReJjG0xeSNr/hLXvF7krZmDEPiP87/jJ0Mq+8ucDKPX87HrZuJ9I60P+hD/R
	vOBCH6r+NpQ9QN8fBI1ky3EC+sdyE4a+REhtSMta7WyhDwp4kzC2wJpr2p4brRdqR3Fri1Fwi7p
	F0ncr4xA6shbsaKDKoHtfpJfAYabL40K0w6KdobRHfCMAUs6y8R9Nkg3IwlBKIiJmbIkDeGeQFP
	FM/wguLMeC+jLSZDUJhT6UeEth26dcjnqqDJXIv6aPOEbyPzNnWEQtZMtZ0MIB4Dp3G6JVmj4Rw
	rG6tWooaS7Pk4Z0ws59qGNeeiMKp55J47g2LxzQWeVkZA6fTdq98Gw/dadfnvCHxxMFDLvQG+g0
	qsutxczIwqJGzslIxYy+Q+AobeZ7BWb8m1eQ2IkKrqy4gg0U=
X-Received: by 2002:a05:6a00:1741:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-848896eb340mr13731437b3a.52.1784049535199;
        Tue, 14 Jul 2026 10:18:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1741:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-848896eb340mr13731384b3a.52.1784049534635;
        Tue, 14 Jul 2026 10:18:54 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:54 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:41 +0530
Subject: [PATCH v23 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-13-e7453c548c21@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/qLMtF4YYOHcd2N1W678IQPXyBmX86FCA/XfWBXjocw=;
 b=rUE2oOT0yyF7AuITx714xgSvucEBSc9KhTWpFSLaurtFc1XMsG6TrtEbHt/m+uYS94IanfqNZ
 NwgxWKW/LsVC7sB2UWTCKChhYXd85Mq58VSCviNCWEBEwY4SaEZPtkL
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX3OnmbkU2DrOG
 5GuiYL/g+pJHkF+CfvNWcSnxBtd8h4tUFaFPx5IBRBLt3WydHwgkyjrPopXBsQEUr2t9WTLDE/b
 hUe+bj0memrFDIl7MH+nSf+Kd6ZdZGs/KWcIcVPWC+59vaaT2l+0kErwTHhUKU8scM4pwU7iX3A
 bLc4vFN2EV6HTtAzy21fba/UTaj5vM7XEG0uq9pNB/6ICjOtCrqCGvTmzOdnhCvpyQ4AEVnbXnj
 oxhQRyyCGFijSC3hnPhItsRi6yLjepZ7MuXXaHm0p3Ppid1kQj9CTxtTL58MUncHDb5gUqUKKBE
 bluSXTChG+W/eotNZp21gm6xTuTkxVHxFrlkyyRGUifGn43vXxm+kmY/obuk2m2ZXrQGD26TmBc
 /HmkXThie9BgNvj7ZdFLhmYdvxIiYriZVI8B4zDmMi+kP2P5/pU3gAu3wTUDKT6KGU456EcCl3R
 gICnxMloAxmjGKjrvfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX2xIynMXTOS5W
 pB5ci2lmjuM3eA+dvB8IrHpfdKjYLZxM6vi8Qi68xal5cXckmUdIPRBfPm+Vgw3K0YXL3C39rDe
 QwruexeSaMlg4zNhqJnZW9EGro5UlbQ=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a566f80 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1Uztr2x3r6goFtEYBS9e-70MedFZPPLy
X-Proofpoint-ORIG-GUID: 1Uztr2x3r6goFtEYBS9e-70MedFZPPLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

  Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 047b4efb04b9..48d3519f50ff 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -498,6 +498,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qspi {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bdfb70ca9740..6a7ce5a2963a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -581,7 +581,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

