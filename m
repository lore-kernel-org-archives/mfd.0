Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7007A485CEC
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398048; cv=none; b=HWNFeYvztt/8xQsxHj+jXwCmZVTYncX3LTZqGg7xbm/L6I0a8VEAAATGBlHRFk6UXWHX4nAjKFjQptzBYbrrQ0N5DxKpDQZbWWel2JwZ9IMuNa7r+TQ1wYvoV7Cv2DEY7BCsN9iaYWH9idTVhuZ4B0szLgbi4uU1cMePZorl5C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398048; c=relaxed/simple;
	bh=qOFvn7wgKOMIlixvdMXPEO8Y8u2ONv9k+Pz20i023QE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=afSbq4TQ2swbMlIau2DgRRy39KH5vzE3jsNP2Lm78VlNQOkauDNxUvH3uyj/re7mBT65FC+3Y9zaDAPfar7W4riWGx4Oof7WT7zReYDPLaVitEpcKAzQVOID1MG5Yx//acWkJ4jEjxdf4krU+TXj4gIUyJrXlkAzuVaKYTnvAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOk7EHTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KCpsPr+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOk7EHTb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KCpsPr+V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0SbV510932
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=; b=jOk7EHTbuz8pS8cH
	2Gb+jU3y1nBmkLekUDDyGZ/92x7TIofuECsKyDafT5bYNu0czoCcznXOSW5+1Z/a
	X/h5ePTTxWNH7ljipeU9G5D9PLnYNgZAIBLgJyzYH/L6MiBAzyq98oYxEqG1xMO7
	lmjkiwVkz+jKPjPmXBgm0rzsIlectJST8omgNd26cVJoCb5UXY8gCoASQ1k2Oljd
	rRoE8fCgiF4fAAG7LpaQQc5sXk3cGtoNDOkfHSHPf4rjw925n5Vb8VLtaRUnn7OL
	aAmZ/ZSzhgtmEtx9hKoSpg5SI6kMt7EpbBWRAS5T5AfINeBGcJTPRnXXEOvAkUtU
	TcLQcw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtgkmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:00:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc92350888so56840175ad.3
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398043; x=1790002843; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=;
        b=KCpsPr+VO2JGz0zf0GgxVGAPShbZEGkuUNzoo4rP45Sym0k/qczR9qFsl/HwKXaxSF
         9nmuRzxd3FYBWcIA3QHXjZw11sK498QWiBMwTmU0mdrZVHv9lf5qrYGDcLQ6TLbE7pKq
         7rQiA/GHQx2vDoDc/gmS4CZknUW4v5ABM33L27CJ25sdYQnonTIpHaXQju72Lt5xYMb/
         TiC5IS1MagO0qavmhILZaFdBp7hEtfUobPnkBmTWiOK81qf8lAZwS+0b4B4vIvZCsQqk
         nHek1V9a/DjPOikDMond06YiBDA/1r4dRn8Zrcvqn3z9nr1TeFXPaiB96/zS8OXYHApM
         NFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398043; x=1790002843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMDoaAwlzNUTRWkFfx6sI7/AXu3O1IHa2Ua1CeFXUbY=;
        b=JAfN1TJeJ1qmn7Xut2SomB/GMx5DSF/SRQEhRQ/KUoBNCoynNrv3MtjFfcTRbTOobH
         2nxdc5zYEQUAHoq/APJa5WElkVRu6Cd5ySwsV75Kq9hFGR/AR0ArE3IP856DTc8kQ14r
         dKsf6Ug+cw+GtmgykVplP2FfLFvETlpM7fohMQ1Ged67bODCY08M+puyj7+VJLReSJCj
         wdQof+yBCkQ6tBxyzK4v5LeFb3GX0w/XHEAv9HRVzyMiurq9cs97Ta4wx4j0knxL5mJA
         VeiVNFxyqnGr6mlIpzP29AUOgTtHtVpjlxJFFSpzOkxXckZKf862sP39j92iLioC28PL
         RcMw==
X-Forwarded-Encrypted: i=1; AKwUvBxDCLJKZu8i08YeWY6abvWYtb0qPw0ShIK/SPRgLm9nHUlBGiOzs3DwinpPJKI63sLFdtA=@lists.linux.dev
X-Gm-Message-State: AFuF++kyZTw/8cALDWvLvQKgiJ/bhPMNPPRpXYA0r2IXv3LN2BktvZdH
	4f4X0SDKid6vIL9NUWR1m5BnW/ThIooOdij+FAxLKXKnvV5mTVzcDmw376dTDldG/MlvQvvYIn0
	w06xpjOKAZmQrSIlIso30pxrCRnNECyAQAVnD/oMmSCLicf59irGW7lE=
X-Gm-Gg: AYBFou0wG3SeNoLFzPoLFso3xBvwl9LMUxrnQjHp/RaNfaJLToIBB2eRytp0Fy6u1Tz
	V2zBMQO/ygQDFNogWD7bfscEGx3RvUt0ULKiTzyXgeT4aHB6LSX0OM6UQkTYsaOAsj6ewjQZzYm
	JZ4w2B0t9P1jp4oJMQR80+4GT85xvRg/5ctdduXaZoOvxmR0KANqziOovQEbkVTryPIYOM/qx7F
	F63fqMtpO9fffyGOuZi1+C7plLC4RzKzLuoUznsqRzA+BUCJSVJrodD1IiDTeKj7qHA30gASG5q
	7GL1gTcOdGYwRq0taHi7ItvP9Rqk7tQXCOBWQpK7O2roEwm0SFD5J0fFLxs6lQosxEAflSuUlkF
	knZhM/fFRsSIPitoSDokHoUCSsXSrhoB040pl
X-Received: by 2002:a17:902:c40d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd6c6fc4f3mr55284915ad.17.1789398041876;
        Mon, 14 Sep 2026 08:00:41 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2db:5c0a:f184 with SMTP id d9443c01a7336-2dd6c6fc4f3mr55278505ad.17.1789398038902;
        Mon, 14 Sep 2026 08:00:38 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:37 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:11 +0530
Subject: [PATCH v25 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-7-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=qOFvn7wgKOMIlixvdMXPEO8Y8u2ONv9k+Pz20i023QE=;
 b=txsEWykMpTLSUOW6FXQVTJLBQQ1Nc4sqO3I+bYIXwGfuhPQ6gT4S9k1E4GUbqfnAs8R/0URP4
 /HrN6czalP9ApLSw6uR4PpjIRu9AyPfqqX0KmqYStyBUvqXmpeSjBoz
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa80c1c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfXyyEGwo/0taEJ
 fqKqHocwdjpgHnuFimB8VkslBX+nZYSgjdW0o3K+AtuoQ0mHTb9Qj6qFU4KqN5Fkwded7Q0WNpb
 6SsXCuvBLv/UzO9x+1ECbAzD8VETlDl7E5ZLtfen3U8OM3DRewWdjVa5Cq891sbelotvfRiSVvz
 SiHIMA5Xn3c4d7l4bwyv7Uugc/u/v/FVS07bG9XUKGLO1HP/Y1NQLUTd16lPtMhwOtojks9SiCp
 fCLqBZwB2Nu9n5XpvWGKaJ3m4finWcnDGhfyStJ4wI9brUJxEQ2oapMk5sabxd5QvIgg6FAFP5W
 E0Eoa+B3jEJTVOOnJzZ/22cI6pVGjb+rC97JlTBHuH7ZGb1/qXQU8+UqB4MAsyic5oX2enBTPX9
 9ESyM8HrPSoawpTax6SSVfGgl5euW2BYc0QXu6GTnoaarO3QVjMA1ol8ujyIYgsCGaqQzdfiD9p
 WaKb+v9Ok+qDLS4DJ/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX4g83m3psZklX
 iwF9RepjYL72nf4WF/NyqfsJxGoYhK9NbE6FhhNhEJtofe6QdRUBrLzjne3QL6wnPqyWoWfKjni
 98auXvtXBzxMHwbpe/pHf3fkCT9p4oc=
X-Proofpoint-ORIG-GUID: ksyC6hTqMKAoRMkKjFv-cSHjE3sECPGK
X-Proofpoint-GUID: ksyC6hTqMKAoRMkKjFv-cSHjE3sECPGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215

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
index 347815e5983e..307fc45af37a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -867,7 +867,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 58cce89a0c1c..c9c1b0c48550 100644
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
index 3bb5fca8e2b1..a107abee10c3 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1097,6 +1097,13 @@ &pon_resin {
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

