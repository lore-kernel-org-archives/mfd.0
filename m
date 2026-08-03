Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC953988E2
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734153; cv=none; b=U7jCQ5dFXMCMBwfjX31NPpTTekf0JsLKpLn90Xn8ivSBvo3DuUT/iCLJ/5fqjzLZmdvGKAR1XrIdU+HNjm/U6OO5D9+rRYV8hTHRcqb9KnS3/Cc62RxpH0LLeW1zRj66eG69tJ4BMXa+66UUV1ZFfAM6oSpeY5Bt6YlTVbBrJxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734153; c=relaxed/simple;
	bh=ZUVZReuwX6u+VOoUVGjsuCMz/MOgQoewZH495TiPLJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mfpqCgBSnQQSidlEAnUYCnS/R5adEugf/IhfJI6ziayecfBDCo81fBtcWVqyyq4+t0pBqSU3F69wbUvbn6bnD64k1DVdaaqC96baV8kGw9yM2r1V6ZC/KpYWrpEhyIkA2PwW4Yftgqsfq0YbcWJQJSZAowwoXSVsrk/Yh04NkL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFx9aMF0; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFx9aMF0"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7ec49608332so1441218a34.3
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734150; x=1786338950; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJn8bgDlexj3pTLFD/TVKu44xwgcekcV50vMMBDdgSo=;
        b=gFx9aMF0nYq70VI3Eq6va0r3+++deg1J7/LelOfJ1cPn5V4PimCNKd8GGumptFLg3j
         cDnKvt9YY6CRWVr8vj4OtkHtFI1ZAj+lgtUejNQ/A6CixDpV1Fhw+QPbssjKwbvhcdst
         BzAbRdGFIK/tLRxzH4MrwEU7Vwb5L1F+z4sWkaGxM6N4omvlkCbl3kAriwABPUPvEm4A
         g+QGcFSZ31wYmjVwviCgt2I4sSfQMeK4QsXTw+irCEXR+eXSOsyGiUKXJwbFNHkarFLC
         PJeZ4MFepQ1f4EXp84K11QMHVrvNiKoQC/U4Mvt4CLx84cAyXCes7uypJeJKIxICDlgj
         6gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734150; x=1786338950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJn8bgDlexj3pTLFD/TVKu44xwgcekcV50vMMBDdgSo=;
        b=sqZcHtsEqWwLnfxcesxD1ULVpqkJhCboHcQSNX1YzcZc/Uvg+jrGyIpvZOQqumpsIq
         PJg/CvV9Q/38DQ+yzlBCpDpQsD9084FtXKqPd1rAxSx4SmC8fc83fRjakQBZyxbGg59T
         D/VLtJI8eNBNs27kBSFUopTNhbLrpx6N5spHhj3aITMbyuPD0TTjimSpDeNTYv1IT7An
         KAjiY7zrGc/R0+2VERhjBSgLsaVDs1ma1auCXWOkeJFcq8GzdMTIYGMaoG+bRKSV92lj
         D5Q6q3ymWrlnflGjBrXafYjtu5NwvURnSZjxTpDJWqvCHwUFFRafyatWp6iDK4ExaktC
         Vwig==
X-Forwarded-Encrypted: i=1; AHgh+RrZC5IHhbiIAg6tczamC42udk0vXUYgJbYe6AX4xgBs9na/E378bdsAXcpPf6toKBJMz+0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIwDLd97iF1T9MEAQ/Rpu2Qd+lMX+pCsXXIL8V2+8+IICE1DA+
	369925P24bSMfiudJxKJJP41bkO8/ly6dxDLui10YxyUhBrHqtv61uQS
X-Gm-Gg: AR+sD12DjbPgqK5rBeWvSLR2z1V96oJngsg7BRvtg2qiGxObLSUEm790wYytDzDFH7Q
	D5aNdmjkCcUJ2oma6PYnc+xhbQrfFommEHmhQpRQbt9D0sRa53giQwLX1ztbmgi9FdYNvqPwh3c
	jL+ZHAnTfNpjVXKunvjpJ1F8j4eGoM32Qywta2QkMQciPLSsGcyQeY376hUA/dG6KfPMruiKAWd
	EfDEg2QxJjLhIE5rCMNv3vzWud4SteEhd1QVy918t33PgKUFYz9xWUNSk7zbfobMWQBRs+kQyyo
	hD4o3634RBfxiW1Z1WJenrrQTyyVdDM/DpAsQw1xPVx9DmhBQ3npWSh6yt8LldU9Fr3shqCUlFF
	B+mFNwH72M01oWo1BP57pwr3QQCJ+WsvckKBdYV76/c4BmDeQl8c4K5wiep4J97fXPy4+Af9O+b
	BcnPsVl1z5VB5nn23bf5mEfZpsk1dK2tsdQI8PtFcsVgq8jgQCQSc94G3/xRGqbql/P9H2+nbfS
	lm8fMv68FhtwMC+kiDgJN5g2kLVRSyrJYXFxdMOHvyOn/a7yrLHikZgXuqO/nlXVGPiUbCx9RB/
	2LMdNyOIuel6C7ROZEUPSfIUGGigzayqdkIhewEnbbLnmRTW9MlVzT3MM+ZX18Qrg/LkrS/Y1fi
	MrtLO0I1u85kfWKon
X-Received: by 2002:a05:6830:82eb:b0:7eb:c933:eff7 with SMTP id 46e09a7af769-7f196f0d0e1mr13285248a34.9.1785734150243;
        Sun, 02 Aug 2026 22:15:50 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:28 -0600
Subject: [PATCH 18/21] arm64: dts: allwinner: orangepi-zero2w: enable
 Ethernet expansion
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-18-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The optional Orange Pi Zero 2W expansion board exposes H618 EMAC1 through
a 100 Mbit Ethernet jack.

Add a reusable H616-family description of the AC200/AC300 EPHY wiring
alongside its first board user. The forced-ID link PHY selects the
populated control path and AC300 tuning range from the logical SID
configuration field. Keep the AC200 I2C controller and AC300 MDIO control
node at status fail-needs-probe so only the selected path claims its pins.

Enable EMAC1 and its PWM clock provider through the common include,
provide the board's 3.3 V rail to either companion variant, and make EMAC1
the board Ethernet alias.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi | 61 ++++++++++++++++++++++
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  | 13 +++++
 2 files changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi
new file mode 100644
index 000000000000..26521429957a
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common X-Powers AC200/AC300 Ethernet PHY support for H616-family SoCs
+ *
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ */
+
+&emac1 {
+	phy-handle = <&acx00_ephy>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pa_pins>;
+	status = "fail-needs-probe";
+
+	ac200: mixed-signal@10 {
+		compatible = "x-powers,ac200";
+		reg = <0x10>;
+		clocks = <&pwm 5>;
+		nvmem-cells = <&ac200_bandgap>;
+		nvmem-cell-names = "bandgap";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm5_pin>;
+
+		ac200_ephy_ctl: ethernet-phy-control {
+			compatible = "x-powers,ac200-ephy-ctl";
+			nvmem-cells = <&ephy_calibration>;
+			nvmem-cell-names = "calibration";
+			phy-mode = "rmii";
+		};
+	};
+};
+
+&mdio1 {
+	ac300_ephy_ctl: ethernet-phy-control@10 {
+		compatible = "x-powers,ac300-ephy-ctl";
+		reg = <0x10>;
+		clocks = <&pwm 5>;
+		nvmem-cells = <&ephy_calibration>;
+		nvmem-cell-names = "calibration";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm5_pin>;
+		phy-mode = "rmii";
+		status = "fail-needs-probe";
+	};
+
+	acx00_ephy: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0044.1400";
+		reg = <0>;
+		nvmem-cells = <&ephy_config>;
+		nvmem-cell-names = "configuration";
+		x-powers,ac200-control = <&ac200_ephy_ctl>;
+		x-powers,ac300-control = <&ac300_ephy_ctl>;
+	};
+};
+
+&pwm {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index b340bbcb710d..e833ee267c83 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sun50i-h616.dtsi"
+#include "sun50i-h616-acx00-ephy.dtsi"
 #include "sun50i-h616-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -17,6 +18,7 @@ / {
 	compatible = "xunlong,orangepi-zero2w", "allwinner,sun50i-h618";
 
 	aliases {
+		ethernet0 = &emac1;
 		serial0 = &uart0;
 	};
 
@@ -54,6 +56,17 @@ reg_vcc3v3: vcc3v3 {
 	};
 };
 
+&ac200 {
+	ac-ldoin-supply = <&reg_vcc3v3>;
+	ephy-vcc-supply = <&reg_vcc3v3>;
+	rtc-vcc-supply = <&reg_vcc3v3>;
+	tv-vcc-supply = <&reg_vcc3v3>;
+};
+
+&ac300_ephy_ctl {
+	vcc1-supply = <&reg_vcc3v3>;
+};
+
 &codec {
 	allwinner,audio-routing = "Line Out", "LINEOUT";
 	status = "okay";

-- 
2.53.0

