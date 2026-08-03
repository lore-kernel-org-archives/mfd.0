Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D87370AC0
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750378; cv=none; b=KKtjypRBrMH8C+/DVUbBPfLU1AUZVgCr3Ug8nPnpw3QVlPMmWF5h9V7b0h4g9NGcu8WPjMUdu7nupEJ3iZ+9YuH9CwEFmJxdLeMwrJTu92WWj5OgBV/2Rvaap+zqAWrmt/zwjhT89xW8R90qBe6+MRyZtGjOhgakgf9uY+bN2+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750378; c=relaxed/simple;
	bh=7gXNlR1o8pvBTeUND9fIjf5bCHj2X+kzGUngmo2YPFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jk+EGUiRiboKa5FvVPgagLc7lhcyViq1K+LDr3WacBIVd0EH1Fb7Xn6j1t+OMLJDZ9vJ7YjzOrOZvVRwjZ0hSKepG8E691R3Gv17Ss91893bX/bAPGjmXI5O5DMFTZIBYy6bQIgWSsNn+OJnfQVkqu04hVnq2rc2ayPXnNtv8h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuBW1BhE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HENcuTp8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuBW1BhE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HENcuTp8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736T1cG4014138
	for <mfd@lists.linux.dev>; Mon, 3 Aug 2026 09:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcMzfR8AuBhxlCwjCxGKeA1DUODDCoEWqiB6TsALmRc=; b=FuBW1BhEuWRozKGx
	JeO8DS8E2PuCuK6pGbqY/68JvA05vuF/Gh92L4CYelvStm7lUseeFK/3u6XMwXt8
	fy1zqlSQIeB8toqYATO3T6IIgLuhIopR9eHiobuBCdbmUaea+A/m+yEGsI0Ncr+6
	FLyVj/dHyhfWC0yNNfXlSfn3wr+JzQjMXPvv1U/SW2Rl5C9Tg5m4NuYbYRELjQCy
	61MfCBQqS2OAgUDPbymd6oc+Vs7MnnxxGXiEc2P1WrZOJFn7v07K+n418w5lF7Rg
	lSiIQJht3F7Hur6PZYKk2ZAXWPlpJZfOYS35zFcy2d0CMoVfrk2YLU5Har/rbPcI
	LCVeIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt8v93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:46:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso5927571a91.1
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750375; x=1786355175; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcMzfR8AuBhxlCwjCxGKeA1DUODDCoEWqiB6TsALmRc=;
        b=HENcuTp8od9y5T8kcLph1QidljDNGUMdNFNoFXo1yQ5HoR0zUi87C2Wb5TugsURA3w
         qYfeksDBfGBv0FAQd87BCZTWfpugkUSq5/cA1mGLH/oLphZFYA2mQAxzyLTJI0tPm5V9
         CiybaXJym7xSWkQXf08FV/VI6ChM/GTtkI4D2SkRx1SZ9xQA3xm6JwPa5NHhTXoAnOR8
         rLojfbC2NB46emTzcDSBc14RAjIseTe5mqvFXhgRJVSLflEFCFDHbqgnPhQRWHbIfoB8
         GthEgcV+HXDtllyRuoVXgU3xEkXbU2AboB24W7ptVZfe7e3l1YMO2uUzrutavj1MssTK
         oGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750375; x=1786355175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcMzfR8AuBhxlCwjCxGKeA1DUODDCoEWqiB6TsALmRc=;
        b=Fjo65KzPTd7H2Yn6HuqxcorGwTkzljajbBYAQSW/nCLkA2iiRvZZ1B96lznIRy1rj3
         EwfmgTzjlGVtm88XZFouPsh6Ta6/1fCCacbe6mNZaxipOylRjOSAjMz7AF9BaTMo8Qo/
         hhWldutueA1EOCBj6t4wDIclgpmiHURN2e7OaaAuDmFQBrrzkXzcmIcfcLv1Tybgjb9H
         Y3NTm0+Wogxz3H1bAoFHMTiUFk8TPnCA0pINVX8pOZoVu/TK9zIg+kJiY/f3fMgTmX0M
         qUGd21Zk/FAQjs21Ce9vIJvS6j0vMloxsrCumX4w3N7tQ3OTazzJH8RIdk1Y0IgSyo18
         xPsA==
X-Forwarded-Encrypted: i=1; AHgh+RrqGMststhajr50hFq9Xzq9w40S81oTZAvm/ZDoEiSqudUO/Q1dOUgaxdRWsQejCZ0Voh4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3IVBEb4++QC7RzJj0XKOpLQZF+jyWBjdLb1BQBHUWJkGgYV9l
	ld8Xdv9M6b7Te517J6OqRE73RU+DwgZyHFqItZ1q8a2EBTnL9UeD9cUC5mywPdGRaMVaRHck25c
	na+wiYdjDUWbshc5dCvOi0prPYTrFIh722rZyt56dhS6Hs7K4ScV0Wuw=
X-Gm-Gg: AR+sD10wCK6YPNn7GTtReDP+mS+HGoVcTP55kmUsN+vMBNVLm2BRadp+FrVxjZLgKZw
	642tfWTOpDp4LMiVr/tD4iN8Rn42iBHipx8pcWzrvYKuDrbjNEPYmFrZv1pE12LahDMXrrdDt4l
	4Ks61W543fWLL2SYohZ02Ry0bV19eBWesMor0xdJVSEq2uqQVt1C0B8G7wbWerP1Dc44HxV5kNw
	7QpdU4UagyBWAhLToou4uiGTd536Ui5sRQ54CbihI/J7CWEfadbaz6VAH46b7pH0J9JfZ05EkXB
	n/xUa1hvCt8HiaNPNytxgsOUWjbNqigMjM60wNNWDiX1S5GkZsgznLRlHcDlNI1QkYG5O0+Q/Zv
	C+h8hhh5jZHYWncOveoyxhiuRHRhd82hWnyVQ
X-Received: by 2002:a17:90b:4c44:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38fbc55b78dmr7942268a91.35.1785750375161;
        Mon, 03 Aug 2026 02:46:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38fbc55b78dmr7942240a91.35.1785750374705;
        Mon, 03 Aug 2026 02:46:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:14 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:40 +0530
Subject: [PATCH v24 09/12] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-9-889281373870@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7gXNlR1o8pvBTeUND9fIjf5bCHj2X+kzGUngmo2YPFo=;
 b=QnPk8zoYCiSKzuRa5gqJtn5pFY6pPshnwaLvDzq0DRAMNJnv3wwALCsoc5TnH3xAy/STPH0bO
 /pMa2XbKfqICzDVEPwpxaz5Qk0kjLWwfbu6UWG6z1VoZ7+bCFOEYbhC
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX5eSp6YjR8oNE
 KfY0ymQ4cVzMubWeEwn/jt90Cm6DrQVv6t5ZuAFJeOw42hQ9NJ86Ck5rMYcvXpX5VfhcJKVuSY0
 62GqTjJ0s0Oq1gmOunaw7YI28VFMb02RzwfmtBdGx+E2oO7ztO4aeeQGp5O3UdXMOVFJ6Xv4DEK
 2Jo53IA5u1zHqfvvPzOa0w8JRnFLpEoDpEB+h6pra+kIPoZbj/rkpArDthvKdJH6qVLsBTeL6g3
 5ZkSFVsZa8AWPkTfRCDqL+91m5fqEfmwpvf1sk4wOJ0lTEDKfg/0+buadE0JzjR83ynVNmU+RnI
 Ls+CPlUks2b2pZlht27qU8/TMq+rRrxw5a4tTsBmIHDYoRizKMoNVkxxXQZ58AEIr45FemBSbId
 6mntOaSqmwA+KE3GkD5BOt1AGjdmYvhAJUBPMq3HcBGYG/ETpiYSXLH0Z4ZRBZ/6Ne1s3ANDGCc
 qeg4VJxfu1xlak+5rfg==
X-Proofpoint-GUID: tgTP36lXkFCBw34fD79AAaqIWmcIMKRf
X-Proofpoint-ORIG-GUID: tgTP36lXkFCBw34fD79AAaqIWmcIMKRf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NiBTYWx0ZWRfX62pHwZmFlLUd
 sV6owA84trGOTWGzrWcoSpSKV2PC2AUpprwFy8zz5VZlVaHd5jhl0YJFDKFxuDlD15MywdhWsxZ
 6/qToF7yG0gKmc43B7hcsWevNY1YJwo=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a706368 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030086

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
index f74fa66f1a67..6e3837c2490c 100644
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
index 90f2eebc349f..4ba5246fe3f1 100644
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

