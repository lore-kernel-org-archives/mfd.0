Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864497;
	b=wdNvgfNxxj6vMMfWJVN4fQ+0X/BjVokq97md+A5dLcKmQlOq2DvUHmoSkwmScxRTKpsK
	 VavhluFCiA2HK5JJxQBmkSBTpMu8K7HmZwDI0M943N3zWK9a6FmTfneDq5iZQ8057ywi3
	 6wOGm5XnMvOTaZxaSkIqGWxkXXBCTxeh8JOGoSFruCskL90sk0ZeumH5LIHaFUUaqjrr1
	 YYnJy4MqIi4YH/6eetLnI3szOwgSLDObe8AY56iVkYjJQBis2w3e8JFf9a6R50ERXql9y
	 +X3QO0pvUXcRbWHgDTeY9PqTPCqXu3NKMRIqH+Ry3FvkOqrIHnQzbQPjgS0ltRxmdTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=iTZHOJPC+4Yb22OVu5mKo/4xoJU1hTDHyydQLaMYB/g=;
	b=RKTYUV9SnAxm0+yTb8F7ubcufOTkRMu54WSWrD00K9zx8Bm/nkIAjZgRmvGpN5LcSMiZ
	 hyr8UpwsSFlGDNaLEHlPXO4ABsGZRo/8OZbeOP5wZTZaMhAfs8qaQyrZd4vtAdXM0Z6Vr
	 MowXLdDhoFc/zr9WCDtlAvWQzqrT0PashOdo25Wbgqh2rKT1+z/nhNLPD4+mRpHTmQOc9
	 z4jdZ3eLNHAtXogaINEuVN7N9GrfMbswgrcRuSzKjEgIwScx1hodSpCrRT4ND0spXUiRX
	 e7a7YeW6dYaoIFaMK3RDaFej0A7/XCdJ1QDR1LO2NrPfhaT/1KSheajA9X8dx28v1bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k14yRrWM;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC4A606A882
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 21:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC4A606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k14yRrWM
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb606491faso13532465e9.3
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 13:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864496; x=1795469296; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTZHOJPC+4Yb22OVu5mKo/4xoJU1hTDHyydQLaMYB/g=;
        b=k14yRrWMEmDM4vPZ+LQh/auBkekCdGE+uGscHU+oRhTq9qFgxb4gG5DKRafhAhY7f0
         fgOel+MB+VoEHU35tWzf7EddiSEgLAGiu147DI7Spp0VddZbMqZPfheVlQqZOqDXtnCz
         Uxq5YqGR2J8C+vym+bmUfk6ZBLfRdTeWehgjn4JjN3CEvh6cpXb5NkKflWEvr8lz+GQq
         IMxGPJqRtlPb/RF8HDEbXoQNm8fJm6U+w5rMG9Mxrf3hSV919KWoLB+6y3OA0Z8tE7a6
         NtMtGmYWC183v3WGvfORygFkrwOGm6hO0MYd9SpkY3e8TbuDoPtFZp5aR+B9RtV6y+qi
         aMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864496; x=1795469296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTZHOJPC+4Yb22OVu5mKo/4xoJU1hTDHyydQLaMYB/g=;
        b=ylUTvF7SZkX93KJXi/C0pzoJCWRiQXJE0USiWfXq0YeJHkdFKLeDMuwnlJ+wpgMrrm
         sDKoAdOOHvxzg4Gy714J0h+wBUWTCfKntQ0qQA2q5hgaDY2adjs1Q7O51iFpeFpSHh0b
         P6RGMwGc5qz65jJT3jN61rgnUgqf36AzkSUdw8kMpvFNhA6quK09Csd9ZD997hDzG/Pc
         v1xIJcJg2T/Mh7FT1ciPBNhft25UMDTjWBUgHbHpOJTJcMt2EuIrqQ6snCL0EFMrnf87
         Lty5OzSif0/4OhuywzS1Lerz1OEuM3ydYRHnVN63ZJexIhbwBmwTC0dlZS6uTVwDwCev
         M4aA==
X-Forwarded-Encrypted: i=1; AL+hErF0Mntsm4bdsC4hGuIu92IJ6Hzsezoig+pX/ZbAcMSX0THrlCjXi7EewzCQ4GG2PJHaLUE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9C/MUfr+lmKuWDGseAyh/Bvbh6AKb99g/KpKYTFSm/Sj+LopVA
	6dnN1iQcRmH23EEOAR3i1/iD2V7Pj1mAIPRgx+eRI8g5akGIKSbsYzwe
X-Gm-Gg: AZFdTZdfXdP3rGl13f2mGyhi6ZgtpITsqhfdCMf1gOBVv5pao8gPs+B9VIWT0YW5DSm
	s47EwFFuMDms7+x/dQe8lB1uPCZzzeEnGhGCeMk6407gRWRnkB8wcb5fhVcYN4HlY3mguWUrDIP
	weI79uf5XNvKLARZZayvbp6Y8itMWEsAQBoWCip3l2CCLzIaGkIpZH1fwsRMmk9H5kgxMfeXKAj
	arOMVsuJgUuIxsA5WUVcaGetflpvvZn7lYFjMY5Wjen+oPNhC/ks0YHSV1Z2uY9LP+3pKPVF3YX
	K9at0di9OCvLLu6MPdnCWgnOa0Oqu/yFYIlA7zaWqDQW12Nbkz5IsHuM2DPdIbRG911dcQ64SUF
	rJwsHcAhlrzxrLPa3O6qQ8Z8iI4AGGumToAu5h8XRVuvssEIE2V6T/biIGT0j7jQnBE7iMdhxRi
	YUkiDEY4BJvmVkOwlSdKqVQpVgmCyuX1dW+weCAJhiKLmQwPpvn/oBa5RVpVD9j2lEkJyEKb9Q9
	OnDEzv5QgywOahxam14U1ZgWMISpcuuPnEUcXf+HMileYP9lkjso9okKlI4l8HBv03Mu0ftSdIQ
	HHYhBM3IEgFGxkprStUj5WW/1K/lyX1ge79Joe3/
X-Received: by 2002:a05:6000:46d0:b0:494:6f49:246d with SMTP id ffacd0b85a97d-49c723fc541mr17987138f8f.24.1794864495960;
        Mon, 16 Nov 2026 13:28:15 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:28:15 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:32 +0000
Subject: [PATCH v2 16/16] arm64: dts: qcom: Add Samsung Galaxy XR
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
Message-Id: <20261116-halliday-dts-v2-16-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=6344;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=1ceRxoHtuoc37RBkrjEp5dIGC9ilXDeWVydgwcwUuNs=;
 b=ffL4jQ4y6R1yL8AMBK2e+HI53Lg1Nn5IBjzJW9syTcRdWo2Ml24H9ePG9R1xigjtFMJOUcNmk
 mlLeN2+jgNuDn7jvJmHv6gui9wN+LTGBvQbJEu7n/TIp/SNNvyo+oqd
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the device tree for the Samsung Galaxy XR headset, which is based on
the Qualcomm Halliday SoC (SXR2250P).

Supported so far: the PMICs and their regulators, the power and volume
down keys, USB in high-speed peripheral mode and UFS storage.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/halliday-samsung-xrvst2.dts      | 218 +++++++++++++++++++++
 2 files changed, 219 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 9553e3aaeccb..b6f739b625d7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -24,6 +24,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-sip-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= halliday-samsung-xrvst2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830.dtb
 
 hamoa-advantech-som-db5830-el2-dtbs	:= hamoa-advantech-som-db5830.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts b/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts
new file mode 100644
index 000000000000..6fcc1aaafd59
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Stanislav Aleksandrov <lightofmysoul@gmail.com>
+ */
+
+/dts-v1/;
+
+#define PMK8550VE_SID 5
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "halliday.dtsi"
+#include "pm7550.dtsi"
+#include "pm8550ve.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmk8550.dtsi"
+
+/delete-node/ &adsp_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &video_mem;
+
+/ {
+	model = "Samsung Galaxy XR";
+	compatible = "samsung,xrvst2", "qcom,halliday";
+	chassis-type = "headset";
+
+	reserved-memory {
+		video_mem: video-region@87c00000 {
+			reg = <0x0 0x87c00000 0x0 0x700000>;
+			no-map;
+		};
+
+		adsp_mem: adsp-region@88300000 {
+			reg = <0x0 0x88300000 0x0 0x3400000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp-region@8b700000 {
+			reg = <0x0 0x8b700000 0x0 0xf00000>;
+			no-map;
+		};
+
+		sec_xbl_ramdump_mem: sec-xbl-ramdump-region@a7d00000 {
+			reg = <0x0 0xa7d00000 0x0 0x300000>;
+			no-map;
+		};
+
+		uh_heap_mem: uh-heap-region@b0200000 {
+			reg = <0x0 0xb0200000 0x0 0x40000>;
+			no-map;
+		};
+
+		uh_guest_mem: uh-guest-region@b1000000 {
+			reg = <0x0 0xb1000000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		splash_mem: splash-region@bfc00000 {
+			reg = <0x0 0xbfc00000 0x0 0x7e90000>;
+			no-map;
+		};
+
+		sec_debug_pool_mem: sec-debug-pool-region@800100000 {
+			reg = <0x8 0x00100000 0x0 0xff000>;
+			no-map;
+		};
+
+		sec_debug_log_mem: sec-debug-log-region@8001ff000 {
+			reg = <0x8 0x001ff000 0x0 0x901000>;
+			no-map;
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vreg_l1b_0p912: ldo1 {
+			regulator-name = "vreg_l1b_0p912";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b_1p2: ldo3 {
+			regulator-name = "vreg_l3b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_2p504: ldo13 {
+			regulator-name = "vreg_l13b_2p504";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_3p072: ldo15 {
+			regulator-name = "vreg_l15b_3p072";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l2c_1p2: ldo2 {
+			regulator-name = "vreg_l2c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vreg_l1d_0p88: ldo1 {
+			regulator-name = "vreg_l1d_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vreg_l2f_0p88: ldo2 {
+			regulator-name = "vreg_l2f_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gcc {
+	vdda-refgen-0p9-supply = <&vreg_l2f_0p88>;
+	vdda-refgen-1p2-supply = <&vreg_l2c_1p2>;
+};
+
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 224 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l13b_2p504>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l3b_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l2f_0p88>;
+	vdda-pll-supply = <&vreg_l2c_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+	qcom,select-utmi-as-pipe-clk;
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l1d_0p88>;
+	vdda18-supply = <&vreg_l10b_1p8>;
+	vdda33-supply = <&vreg_l15b_3p072>;
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <76800000>;
+};

-- 
2.55.0

