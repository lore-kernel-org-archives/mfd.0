Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4834E175A9D
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398055; cv=none; b=Ks8uIU/K+QlUHFx4D4mvsxRrcvSOIHXDn9RRGa44+yzEUJhTmYhdvESyLIFzG9BC+i7Jxov7257HFzIC1uod6un35v4Y2sqIcbV5PHxULGxtismsNa6eEXbq+yzYbL3bBIpIj+lL57eSiqzsutIveDfFB9CAY3SBx8mQWR2dhxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398055; c=relaxed/simple;
	bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYTCQClNfE3O5qI0PXl24DRvtdQBlyS2iDfVOcu7pff/lrHAeQloNQ+1LqnyOx1l2UcFC86NNWkJFly7QBeW6hVmIMVbRi6ScPXhsqSly3TRPfQ8X0TpQkTpGH1R5PHu7mUVFqMB3YHhb+b+bnZyWzYJTBhawzKhze1B4+CZCEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/cew2hH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dk9SsGr/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/cew2hH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dk9SsGr/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0bqD3588221
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=; b=P/cew2hHZQT7dWMP
	dOgrhAfwUUqvNmkCA61QHC65RV6hkeEWLtXjiK10IczKYcqiVrxE1fQ/eN8P5k5b
	XCuTKUUb+qdOBOjbq5Rq9FckjgM8HQ4fapdpZW5haLnLuhOVFVCHD3pUfwztoax+
	OFSSn0tuK5dnngeoCKoj/oK06I/TdacobsbGxubKDSarCSDv1jGJcSizQWZu84bO
	auQT7FsR9NAhILViOX7aAvsHF1Q30+jUjTASqp3jwQUSTPWrt3Kv3gvkX3ppMS3i
	lqiAUoiHK9p7CPRd3weaNxFQGD1a9ATE+BWezwvVJu7RrU2Mq3NphWA76GXh5ePf
	Amv9aQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg977d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 15:00:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6df0a1e18so66920275ad.1
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398051; x=1790002851; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=Dk9SsGr/qbzkg2FLzmEv5WimufIWiGYbkVDQV8fGO3Funpd5XEzEbTqTAvQ6ZyoFib
         yoBagunERZkJGXZ/S6eSihYY6jayGlim390C0TyI6il9chfba9bqIutA8iqll5NGlcfl
         KlVFaqd2hgjRs1DgXZVXfXFuYPYPRTdBZuoC6QoNcb8vji/WsP0EdWRP9nzUSjKPEs4R
         tz4IFAc8c2hdewXLJJHV4Nxp2s9grecaRh+TRa8gZBiTE/38p0Li9LfRXKwG/JNajkBC
         p9pw6wEVCEnpUY/41i3WGcUBiB4ggxyj4b/v0paKM4pf/PbcUTLVFKCCPB0bsRleJmun
         J+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398051; x=1790002851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=lJCD4pNeHrQ2S5m/LGcpDcb6j7jB7Pz1b/GPHAuRksmtcPzti47hivKAkpvV1QBnSV
         QTvcAhmqIlb0cl810vi9O+MCzOyPsRzqKpN63pu6U2KHGNJPbVdXQWBKwjd/phXS47pO
         cU1di5xNAn9NhL+9eB0JQSRbP4nXZ5gin+BnDQaIQ0CSWbqwm2hNu15EkXwkmSZBDFch
         sglqz1vWRwSzId/LSSAp9BY6IPPnpcJL3ycT4NNx2UgAFbbxC9nDNPFdzY/0odCh21KR
         MtODcre9bWfwG5JjZwRuLY7zW2nWAmts6KnrAwplgFa5ezs/j5v7SfsFrNu9F9OikMPG
         Gi5w==
X-Forwarded-Encrypted: i=1; AKwUvBy7vz3eujLZcR5LIPybTi2+J21uRjdZTn/K8F9o/9QdprTAfvXYs3VI7d6blpWyUexJgu8=@lists.linux.dev
X-Gm-Message-State: AFuF++m5zY47gWaao5igLd/xSEWQKJ8nCXiBw7gx4umLG00vKwGymi/S
	iPiuipy5NIcWqQYsB77gL3c0qC9TSjUGT1L09cuQAWQ2ag2QGMBxOeVVqPvRsviDUR9EJX5eP9D
	NXyYcfEU9C8BBCwxVFpmX3AI6WiwT+3pHZ19erm5GGbNhWm4Z2XQ4Y6A=
X-Gm-Gg: AYBFou1kWIC8Hd510BSX2dhPEpZ4Nd8t/f9wJajE8+C3Hge5AIiPTY+bebkzAeFK+TW
	EGGir1P3QosRsJDiKkEA6lraIXH2sNqqBaPXwWh8/jVP9uW6uDKO4r2Vndn2b8zLXRdCekI4B7p
	TbqoVvOCuBL116+b/tV6nemLqYbT0XoZUw0h2Z2Gli8xqfapZFTQKUMVfodwDo/cpdyQ6qpmNWm
	X2Zdmn93BEnWbpKBIuqiHAng5oyz3tO6500QGfXIkWv77K8Xyze+uoJE0nLXg7JBY6V59F88OyP
	HLeiiLEmvzrEENeS77FehxAK0yiWG1ZyUiuCGJCmwLZ8cMeHODdyceNtKwZ6KppVEM0NVPXmX04
	958Hu16Pj2e/iwa/yYiRLtuuYG/iqWkfeVi16
X-Received: by 2002:a17:902:ecc9:b0:2db:539c:b7c7 with SMTP id d9443c01a7336-2dd6c75a41emr62769615ad.20.1789398051326;
        Mon, 14 Sep 2026 08:00:51 -0700 (PDT)
X-Received: by 2002:a17:902:ecc9:b0:2db:539c:b7c7 with SMTP id d9443c01a7336-2dd6c75a41emr62768505ad.20.1789398050872;
        Mon, 14 Sep 2026 08:00:50 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:49 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:12 +0530
Subject: [PATCH v25 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-8-4aaf5c09b5c2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
 b=fNw+c8n6DonkQZy6Ryg4I7jQGU3AwDIZpv1saXTAQP0uoDA44F09SQVdEZYzRHbUuA5FolYsW
 532efuuiRUfByHxOdaaphUQmNsImBGJ54C2AfORsbVFpdPXiRM8pMD9
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa80c24 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: mOOQWyjylDUJxXa5I5EbfWPb5NRi3VEp
X-Proofpoint-ORIG-GUID: mOOQWyjylDUJxXa5I5EbfWPb5NRi3VEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX/3FLDEInY5A7
 ygNkZuMPNNf84cqRv69KzTrivF98S3k2fEqv2JOponSE20LEpR9jUpnmolqh0owXYDMEwyNHa8b
 cynAn8yVSNTgE4MmMi2ihef8SO6VKw+9KNFbKdD1FvM/MAswd1e3uFql0d0AUtqGdj42l363F3H
 PbG6Ih8fQm9Lr2zcZ3nqvahctZ9N9WcIAqrB/ihUjJl0hLe8KZ6scDnuxoqR/cXrn66YUokBRGs
 Y5RhLTNLJaOvfcZ0B++t0l8qERij/0/mVTN8mHGqTu0+CpLSPF46QQLaxEOGt/Ar+S038xNXbD5
 p92VcY84feWxtEv/9vFFw6Fs74OjIoEOMPMyygC55hbnKGRYwE6Psz3Z7fv4ZlJjmDxjS4ARrMH
 qv4G2poCsRZAQVtQC1y8YEe5meFwZnqTBuwZbKGIQBBAbmst4kcuqtsg2Bv6TndRE6v/syzMoYn
 c8fuSIU9C58NFCuMjWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX0tl8iDotkzuD
 W7L5VdUgzF0Iif2qvcMQ7Q4jVDn8p604wnWVt2auiXubj+7qtoIejIsWOrXzt04d3BzKZrO69HI
 hJKqIksdp8MjacisOzxkCoHZQp3vW3w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..87d01acc7b5a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -911,6 +911,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..0adf9f02c8cf 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..f0633b81a04d 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -550,7 +550,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

