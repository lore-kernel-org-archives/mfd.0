Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840BE3019C3
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049529; cv=none; b=Uu6qIKedXL/njxVXHjOJIIvhbgUWa8gJOjiE5G/YT4bBK4HhO2gOJGELEDcIOEErrmkdNxm1o8HWGKYVvbP/px7DAIc5wXO9o3bVJ4pfTaiu3tY2OT4H1zHKVf9JuHgKWI0Ngtml3NmmtxJhWJ05yXLMa+VIdjeA6W8g5LICb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049529; c=relaxed/simple;
	bh=kOJzOHPbdhQsKmeQIeYy6G9x3fc90kQ54JK6p6ylG7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSxOwkfRDv2pb46st7JKYPU7B4cbsc9QpvPQ8cJrhr7agxhqKCoxGK/2Q4QH10ZVMCWCCtB/zZUMno2VOnylcEgq6Fxe3D6tVPxirTFh9MYVhL+fDnDhSr9qKGXnzzxIly0pA3OD2AdLVFOYvZ6koT2iB1omN31kOaoLvFBWvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXL8B9bQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPXO7g3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXL8B9bQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPXO7g3q"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG72011004296
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+8csztsVkxJLpwMf2eNf9DbwNaVLmwQIwSKFspXvgQ=; b=WXL8B9bQguMMatZ+
	nel8WLMgwkBiRf3tcfMMV+UESDdCx5LT+vWbGloU8cdejgUeuMEhrh1Lt4D0MMM4
	NATCKzvQg1jF/QrEc40SHxo4Fe3f3JzmpO7qDCLrTF1cszT8nxfSZlpTAnxQU3gC
	sYyWItlzVkBMfKIslCrG+gLoxgyUT/vUT7lXrrFDvPGdG830NX19H6RqMfTAcz8Y
	uDMGDoES+Nkzi10QkICUDcJk1Dg+EgKvWz9fLO13F/W7qX0W1LmZGB43XLyD9GO6
	BTf4R2DJWDPZLEMRoBaL2ebUpGwnN5uJ3fQJJlCzqib+givFxciMOxvSY14sTaxD
	FK1AFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr13mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 17:18:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso1488315b3a.0
        for <mfd@lists.linux.dev>; Tue, 14 Jul 2026 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049525; x=1784654325; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+8csztsVkxJLpwMf2eNf9DbwNaVLmwQIwSKFspXvgQ=;
        b=GPXO7g3qVBH9eScTtQRFxIiqeLz7oLO4yddRZEmiAlz9+cEASyllY7F4nSGJSdqvBd
         r9ylotMheMMLaCXdilDAbWVTdK2cH8Xuip7pp9KPJB7Y/6OgRMh+ybDiDZxGG7FMDpQ9
         NFSJje8zmNyMNo8BtDIFTd4JYPdk0ZiHB7f0Bq9ONWmUdfVcorsMWDuFApQ8mvZCE6hA
         Rt4qpsL2IJ5skQqlzh6ancrJf9VYgF6pksee76FalRKZbwgdVF6CfAlc2dQilHU2XD66
         65BgjZxds+Z8efa/rTDTcAuMWHV4QyYimaXCzO0ubh40QF82/nXzTvQMVSpEXL0X3GL5
         iunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049525; x=1784654325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+8csztsVkxJLpwMf2eNf9DbwNaVLmwQIwSKFspXvgQ=;
        b=k+KihDqovD3pXOmP2sBEu1sAz0FPsrh7gbYvFnx+pc0+EI8m6fJpt/FVUNNVhO73+H
         R35x8ngFvq5xhX0QzbSv6ApfnzpCaPFMJSgsXnnt2nrEHwxcc7boxg9bM6fVij82ZRi+
         XYqMnUEJ7uVQ1hJrLmPs/y1QXzke0G8casnX4L4Vrq3d+uatplpb99bYm2dtFOeuGcEz
         gPYSROBF7IQgbK4n8UxXl/s7u6n/u1fywvkEmQ4FXdE0KrPBTxO9kG9MNyLa38yTMzmR
         cf8RGH1Ja/a1CBBcGJsuiVDiDht/YTiuddP2iUfVo96r1lId89NHJ0VfnhVP7U9nVE57
         E7bA==
X-Forwarded-Encrypted: i=1; AHgh+RrJEHq7P9GGjejk0pUXGJ71fmLzERUtKduYoxNLIpcyvgLv/xf15L5uV8yiBKFShQcyHoo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFbwq41pnOoNaJgEZQ6b/mH8OZtsj7o/m/t17tTgiVGdGHHAL2
	ghLStj1B5qHld2xWXubtvlbUNwJv2VI87TQQ9FHHvKsTgTRsrgoTFTXnZ3eVR1xXJ1RenMWmp2A
	OeMJyo1b++bBw7QxPVXp2xZUp4xzPYzxO7FjHOoWu7tYHY+S3xClG/UA=
X-Gm-Gg: AfdE7cnAfPnNUkQTheIYK0HE5e2hSD7tJjGp2W8GIJJMnCIR+omhArjTvEM4bHCxNnE
	XraA76Y1skpKvKMZXMNc8nuo8Rh+xDdT83V7S8zmDZj/JmlVxpUNxf9GmMyFKUnyqd52rz29j+H
	Phnd8IbQc6EAHBJFE1e8ioaodWEDwW0pxIONyIKn9zVls5+wWivq2AaDKb/G1p8RzDml3Y16amF
	LJl2f8tTVfAT68m0vnrg1JkYciMV6d/JZ6O1b2jNpNVS/lR7YdOQwFqSjhVXlz/yEuvbQXp+cpB
	yCm/DoWzlpyI3/njUWeFCSv+q45hAhuJyvy+RfPwEIDzvfsScWYkwFCdBca3VfWAehcvmV45Jpi
	KgCBbUpkeP93jtNZ4vIBPyKKSP9Dfixicow3GNvWnVAqhDs0=
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-848897d2bc7mr12967996b3a.36.1784049525195;
        Tue, 14 Jul 2026 10:18:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-848897d2bc7mr12967962b3a.36.1784049524575;
        Tue, 14 Jul 2026 10:18:44 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:18:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:40 +0530
Subject: [PATCH v23 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-12-e7453c548c21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=kOJzOHPbdhQsKmeQIeYy6G9x3fc90kQ54JK6p6ylG7k=;
 b=ESGx5r3AQTBnDLh7oNOdrBzmCSNSjUnfykfNHJyYl+Z9qNPaSE/ou7JEMTQ65oKELFQeNIKrf
 gNtsrQ7u/c0DYCpwV0Jha+KGoHoHt0fDHHSiGc934ncbOOknuX05b9L
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX5t1fYZCkhWy5
 mDB1kM/Xfvoq3Doecpfpikwoys8vYEuBfIQsuBTEPIG11SRVJwPDpMILE63bkx8qEQalG87Tse3
 lVh9hbonV0Us8Tl1S6tEdqMe7lpLA4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX2yc8C391iYCd
 VjERgcC5FBs4oAxdd0lBg0jy3HXoLHUciwRdvA4T99FzzUOoTXduYXAjDARG1sLeJ0OHLto0uqe
 +rG1IpRydtgbXZ6khOqF5FdISdovXoaKk5E97MVbHN8B9h0gGfQRnpBVwiTYlUxbPJhR36ROjdA
 8I70iNCaUxTLFJ0UKmYkS9G0nnSo0VT3qipCf/0Zv6pCmiomob1O1yXIX9ISid2svSFTiFGSnvl
 e7azn5+cBpLLRQSEKfG1jkzHTsihM0mHuTRaf3VJAhQa29g8WlcCdFNi5Js9bHXE+Ie2D39aV1o
 LUYSD1gbsrDimfU54+zi2VLEwd8h8GUop7qURZa1mnKYiZ5xclL6HcLmNwkpfSFotA+cG3f3kBk
 5bLKXRB9wQZwSui+3Lt+xFkQh6pSqo7me0w35Qe87OK7TS//jzOIDQYBp4CmNpmJkR+ZtxY839p
 f21cyShtHRKEGeyK1Ag==
X-Proofpoint-ORIG-GUID: leNNpKIBGHn-ZZBnmcpf045QyWopqKn_
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a566f76 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: leNNpKIBGHn-ZZBnmcpf045QyWopqKn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178

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
index 64fc0d592282..824ec3838c75 100644
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
index e9a8553a8d82..3ab5ae3124ed 100644
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

