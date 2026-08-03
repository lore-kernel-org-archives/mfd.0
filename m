Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027E83A75A8
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734156; cv=none; b=dfSTpL+rxDQ4E31Z/eANneDGkiVDXSbzJO7H4IRM/u3LUKMMZIumtIGwdTHneeVtVhqopr8xteXotLorbTDUAIV72XyD9po88m4z0hzi7n2p9g4TI036nm/TfbkL4wP8qvr25m9DMiIC3wi5mheRMq5rvKyevLdVwQZFPfHs15o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734156; c=relaxed/simple;
	bh=gC2dTirWRvmFzKHVs4SyB39x7wyh/gb+c26PdnYQrvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=brJsJ0eQaRBtNGFEalNPYADEsBtDBgydvM0NMW3RYACeOFbkvSySuis4c34oSP835My/BGJ4WPzpfW6QVwJevWJDu3MGmHUMz2MxUEU8DSK5gJuLCD/HeAKLKFyazq7DcpQCKuPS0uGtVvqD3CrqzyC6/6LCZTKJuhzGYf6kbi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNwVs8AL; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNwVs8AL"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6b554044fso2627379a34.0
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734153; x=1786338953; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CvTLJea6zWTpGRaWOgZzRKuhjdqcAVM/Zr8VD5aTmI=;
        b=RNwVs8AL1R8eaFTmYHqUyOSZePPd345MyOTaJJ9iF4YcvbUR52fpVFgUqy8J71MStf
         00uo6HZqLpcxt1DtwaG4FbvngYJHIrMDpYuSvFk3Ce/0Ay3mpqkr2jqP2vc7JDNM3gxx
         ZksOVdWZ7Xqx9CbGDxzrxUyle7coyfjCt73iGZDz+/ZpTa89vOgH3wBT2p/wocNYfmwt
         NS/R65KzQ/dwtLTN/NjdBGyHHGYMuTaIFUf/5it26sOLrcRYsWRNbSAJSCFnbyffzeUQ
         Ekua+S3vLw8VXHz6tmzzlfjv76atTfalxtuHPyNspJuaetwhoKaHCnt+brGm/fiyAnus
         seQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734153; x=1786338953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CvTLJea6zWTpGRaWOgZzRKuhjdqcAVM/Zr8VD5aTmI=;
        b=h0o2akx5Oe6PVqgw68oiOj9lI91a44rgW6nPMDDnBF2eY7LSuqMxQY/+J0C/W8qACJ
         6CjbQULCaKD7g06Ha7OtMcBrTjSMfzMg6TaGC+i9zXgeFnqvhvjKEaLF5TFtwc9iothW
         32A8nzwFBuzK0zPKOZdgtuRCGWh1VYcJr0vm2SaTD92KvwvzPESm7wh3Rl2tbDYhfEwE
         Y2DautCVht1HsL1j+tn9KKYg0Rmfioh2Cd21qX3zTIK6Tj4uApskXn9NUYVJr/e8+OP6
         iTsTl9wLFZR595cwt4MEqWXBFGxOcH+XR8PLViUcuyOgUH5qB+8JDl99o+NRouWBKJhF
         hYGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rob59XseUPZGt+0T0m4TblmfgkmWsHFTiEhtp6G2RR7BhIYjjW2ai+tHz2R6g9GIJTAND0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEm+9H3hDD5k1ox7RkIYQfBkOBIpi4N9YqsHcQ1lw1JwJBcbKa
	AxkZOT1mdI1m+gaG8ABaUMeb4k2ojOALue36wvblKS5SKLt8o/5Noqsf
X-Gm-Gg: AR+sD11KVjGQ+UyRDLK2KVjHYhwQsHmuVdHY3JE+wNT7ebN8TX2G1RbC1O7LBOB4ybf
	cCPW9vh7ZPDQmVMKdZPVFUSKuaiGAbBau6xtcTHpSPSRjmsogXV35yk+A/MHaaCFc/icVK3bPAy
	RwRWMBRGrO/5rew71JK/uUPTDTGWD+mNQ/3wYsCtps719SQfJBeNrSfIn4/IFnBSTc+6x9gfOk3
	5HGcsgBEujLqTgl/qoEPbElIbeGsqXjTpP5SOKM3ZHCOAABJuHaBd2gs6DRp2+LJ1WqYke3Ga1D
	w0tcQQCr84byGJ7yIj9KnBLi28O4kfQ/F/kMqO2PwMKfupyix1x5WMoeID3g4K7wgxoUBBONi10
	D8RIO3QmBkWriB4tkWvKpx2vguVTR/yl5nwKb4VgXQ6ZjLDVeS0F9z5n55KE+Z24/sVGGagJC1s
	IUh+SobX//QsgPvgqbgVqzroi9Vl1iC8wQnhvq1Mc31hWEbdCvU6yINSKwT3kOwwj8QH3Nfug3j
	+Y63ly8H2VFw53YTUlwA9cDDxLgWMA8DPlnyz+mmeY4WkeNewlWxQCWvJptUFhvbEewLUUm8S9M
	dYJ0PAy9EY58U9u5o15Ss4Zla1smSHZhotD9C+n9OqXQF0nNdUwgrR7m3UU42Pysx82SQtN2H+o
	CfzTryKGa9F3URaAk
X-Received: by 2002:a05:6830:398d:b0:7dc:e090:68a with SMTP id 46e09a7af769-7f1969181f7mr14873339a34.0.1785734152850;
        Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:30 -0600
Subject: [PATCH 20/21] arm64: dts: allwinner: h6: tanix: enable AC200 EPHY
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-20-0a53cd9e21cc@gmail.com>
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

Enable the AC200 control path and RMII Ethernet link on the Tanix TX6
family, and provide the board's 3.3 V rail to the AC200 function supplies.

Route the PHY interrupt through the AC200 interrupt controller and mark
it as a wakeup source for link interrupts and magic-packet wake.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..6cd75961e3cc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -7,9 +7,11 @@
 #include "sun50i-h6-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/x-powers,ac200.h>
 
 / {
 	aliases {
+		ethernet0 = &emac;
 		serial0 = &uart0;
 	};
 
@@ -84,6 +86,22 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200 {
+	ac-ldoin-supply = <&reg_vcc3v3>;
+	ephy-vcc-supply = <&reg_vcc3v3>;
+	rtc-vcc-supply = <&reg_vcc3v3>;
+	tv-vcc-supply = <&reg_vcc3v3>;
+	status = "okay";
+};
+
+&ac200_ephy_ctl {
+	status = "okay";
+};
+
+&ac200_pwm_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpu_gpu>;
 };
@@ -104,6 +122,14 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ext_rmii_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&ac200_ephy>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_vdd_cpu_gpu>;
 	status = "okay";
@@ -119,6 +145,21 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+};
+
+&mdio {
+	ac200_ephy: ethernet-phy@1 {
+		compatible = "ethernet-phy-id0044.1400";
+		reg = <1>;
+		interrupts-extended = <&ac200 AC200_IRQ_EPHY>;
+		wakeup-source;
+		x-powers,ac200-control = <&ac200_ephy_ctl>;
+		x-powers,xmii-rx-clock-inverted;
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -162,6 +203,10 @@ &pio {
 	vcc-pg-supply = <&reg_vcc1v8>;
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_ir {
 	status = "okay";
 };

-- 
2.53.0

