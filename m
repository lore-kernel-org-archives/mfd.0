Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11EE377AA0
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750410; cv=none; b=SrQ3H8ueNgDbtUKn7XSpqMrGZEAMoAbb88zOsuXZdqKLHs45S9cmfV7ip5ZWiyz/rL+Km7nuUgstXbB6jVFg1Xw78mNmmO8Yfx8+hQo3P6gYSF/hGko9PqsyHmgTUdOuam99lBpqJPLkLO4IzVGjPogNm534UG8IAcAq9lkXHWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750410; c=relaxed/simple;
	bh=OJwAm/Vozmf+aVTmHqCY4oum1OVPcZBckomX6WcElq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRCIu7s3UdmjBstD58j71Mopk3+HG9h0VK2wmUIVuPZpjTXCPqGdvJFP10yCOTycIoGcCd21YThS2uuKhzv3jf9YkoEA0Gucp4edDDUazNH+PsG9hLPPwWNhnF3uKDoA5fJT8gU01J0WsrKy6RVPI2vlSzgsV+3DQrKrRtfjaIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrS8cyTe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMfNLEjk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrS8cyTe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMfNLEjk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736F3Fh005862
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 09:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/+3/8QxNTkVS2/4tc3nfViSHcapFtRLbeTLF1zxXN4=; b=QrS8cyTeGtmmLJpw
	VZ7FRl0hxHBX+kaoNrTzcTE6OBufJsUH5AVMNCJExi2+0kpen8ylUY+VcIoc+IYU
	hX/uh5ma9MggKifQCrcpyP185ySGaVIGtz0XxmvecLbD0Bh5/LMftrGyYGZuwQH7
	4g0uC+4PsN5AA7+jRVVnxkLxL0gENilXwGaaf/8UqVBTc2pAiYxzfmN5El4LS/Mb
	hsa4A73b/GE6bRunzA75dSlcr0iZSdheaykODVXs0+mrTQHuUaQiM6NSbyb5ut+5
	fDEd+YgXjAaINpxdoVef/ZbfOHO5Y+4PmZU3RLWF08D5ai+FBR0/G5CFaxWSTVbU
	QcW1zA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj78w1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:46:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso5928655a91.1
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750406; x=1786355206; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/+3/8QxNTkVS2/4tc3nfViSHcapFtRLbeTLF1zxXN4=;
        b=XMfNLEjkJdqgapMuo45V0yzmdf9bOzvqWQUjldQFll0fIppAGmlJhfhsUXaGrbuHY9
         uF4cZ7QPjw2rvr15999xp1oqvb2tdO36xWYoxU6EjeoEePZI8sO73RCAdQwvRZhNAqm9
         u3LJlWYyH24lU0QiacERNBHFYgXIgU3F1gCJ2pshH3gkRTfe3WUKZE9LoMm54OAQRuVe
         XlRoMM82GV0V7ICXkGyyB7GZ1RUaWL+jCC8MFVVKTcosYN5JsXEujNgEv2VQnDenuwSa
         uiS4Wlc+Kt/q6kXMzUAV/Jxdci0TWGaC6OUOSQAYoL5276I895F3m7wY0dWCYti/dBX6
         wu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750406; x=1786355206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/+3/8QxNTkVS2/4tc3nfViSHcapFtRLbeTLF1zxXN4=;
        b=Fwq35VGvK5Gk0rBzkzvcwF7xxDscnzEl4qPySgwL2KSQYNZk4XOB8LErgyo8i1rpVg
         ReJOTuOooDCrksN8RVrB77tfBRA258c3AAD7oNDA4LP5yJXKAFAKaJFNJbEXEWql7i6e
         A114SkmsFmX8jNKraK3zujlxLZKN4d/coxc9O2HOJUlvaLysYwGD0F1DLQuCWeWq/P8/
         chTCrmtA7+JA7WnyQ/+TwzkYzRgWnQ/QMYnCGv0SZtHDh3RqJXEYALHpuwwQcTEmk6m5
         DaIBt3LJ99G7Ge4stof3QlhJ9XoloZT8p2MGEuQ9zFlvUr+BlAjGj60X+Cem7uDwJQ5+
         9NkA==
X-Forwarded-Encrypted: i=1; AHgh+RryVxEPqiU3YKsKWJhIqBMG1plyxaDiN6G+azcTIQx/rPKd4rXstgVA95M0fjJPwwp9JqI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBZjUhTpp39VAoeHkGRQdno/r9cPSTDsFpDsT/SLfEjYocQ5Fi
	+REornhZPirz0rAF9DXOaV3e1FRaioornRB/0F9oFf8RkhhV2P3uFnYS1z1DIuY9Zm7iLZrmsJn
	zjsLqGviY+qoHdou/ZNFl2DNltJLjiWaKpiy8D0NvZ6S1+1acvovivdY=
X-Gm-Gg: AR+sD10zdtGjd6HuIwdMCSRxyJnY/R7XkRezEncwbp2ZGPkLUfc7UM0NN0Q0m0mghB4
	j0n3k6W+V5F2wvyvW9/gPrsLaciKgtdlnC4Ld7AHM4mrEj/vmgeu760k/Wts5VYzzKAs5hsWYZf
	0k6wIZPFJAk+u/Tdi79EWsxt8rXM1/qdKsNK4dncsMWR0NNHjQRDCmrqzTW80A7VeLRVx1TETzo
	Ig4y68oLgDdFffKanGJ/3RTOUOWgIlMEoX7PU3GorPjmwDnXuIjj1yH9zYXrbR9zUiDSM09vXbG
	VCKUm+okhNLROMLsXlSd0hmsuQfiLrSw9MjG+TTns0pncCkX/XmdG7aYbljj0cp7aJoQAP34Kzk
	POb3cNaNlj/DDlOE5rDTF2fKYcKyXEKEzOhMQ
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7728799a91.11.1785750405831;
        Mon, 03 Aug 2026 02:46:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2750:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-38fbc42c3a1mr7728767a91.11.1785750405386;
        Mon, 03 Aug 2026 02:46:45 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:43 +0530
Subject: [PATCH v24 12/12] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-12-889281373870@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=1558;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OJwAm/Vozmf+aVTmHqCY4oum1OVPcZBckomX6WcElq8=;
 b=JT9H0YmF5yLeWr/AEcg8+MJ7UyCAiqsbYnspRpD92XUQxxYXUDNXtMj4+2agXuu437sW8T4nT
 RMamNuCOjdDAy6VL5p10AWng8umeH3A/HICOVzaWNLeNSbuCV0twLTi
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: rsmqNlUuldyPbiFshS0-5vy88Q0Ny0HO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfXxfSGxQF/ob92
 HfER/3zzmK+qvrroLSeR4Zd5s36mOJUdvP7e1OTFk3yeYtlFcd3T7qFx+VJvOTovC1KHh/Dxp9C
 uESH8gidns4lUCnLamPZ2K/BeQG5IeMukvAGEVbH5vc/xap7CDJzqAjEqOu6Z2ihYmjcDJjkhXP
 6RaDFdiGZBJMqKRD2b8ykxfQ+J01A7WrPGK9MREhWXJbWYrye47bPJkWAfVDTvCahOtZa5dustt
 CRLmQbhSIVuzfdA+JDUqLJ/Om7g3I6WGwu+w/zmNePzMbIdZCeXmkyxncWbO5ZxRqSyaIAMfXq6
 y79bpOSgrGqeUoErtkGc+Ko6Vq10kdj5ZKYUCn86kNTvqerm7EZtZGd/JyxznRAID00H+VUoyIh
 KhP3l9bgSGmgrinAoHcC0hBRvkPKjUXZtWYmutLb6UeS1+w7TB0Smj2h71qaJ9/m3T2Dg7hlX4+
 HyMfFKZDzm8jDMR1t+Q==
X-Proofpoint-GUID: rsmqNlUuldyPbiFshS0-5vy88Q0Ny0HO
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a706386 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bjH5yOvFM8yfI_BY5k4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfXwvjLBU4xdwfm
 pKAss2lLcd0nfxCVGKkLV2mVCtvSROuRnX5k6wrf1oVXB/H5itb44IdGqe+Etbvhkq2e5CWkOaT
 A+BubQpePug/laOQVHxvdDjpHx1bjOg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030087

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
index 07ba5733ca92..113f10775991 100644
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

