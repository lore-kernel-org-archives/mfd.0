Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908519;
	b=d//25p1vaOk19hapESuMF/rNLAK5R8zkA+iESqgSDX+WjjYpfOGhpC+TeoS69Kfv4nIR
	 ohvcll8dHwSscAttNiZea2OI43A+W99bs/NIUKgyxrYlnv09mokUmO2bB2Ee/aP0Ayjm0
	 +d8xmPp9QDraqlzr1iKLCiA+TWBBauHirl5YtryomiuCnQQOW5h9HsahS4QblfsPOIEQ3
	 H4e2Idpx4Nkb4I1STxi1IBXy0O1KnVE90dE9e2FdTxNhn0iyN/xYEINeB+xAWevAlDy5l
	 CjU60WM4L7NFdTupNbmoG4T3lxQZBumvvE1wycuek65UDJyqGzxiT7cElSMEOHuTDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
	b=ZRxt4HRg/IkdFnO5FIey9CmHQEXp3KHNCX9HVyY+vAY9b/5SaJWQAZvA2hwn2fE1s7am
	 FSw3DkxoBP4w/t3wWrZb0vUUiZ1iTjdBBUENL2+xvsQaAx9tAw3iVyuICQ46Q7y/fE+Q2
	 wF6m/GJyd2AX3ZzL8lUL1E2aQVF+5jZb2ZkYe2QHEqc83hvUajkgFbZORc+zBSJAzckPM
	 qhS9S2qFajFuawvL2se41JwISlFXnB5Z6K5m/cwWZ9Polt6ZWWmP/8BEnt4mmM8febLai
	 AMrG06jE4vUD+oC1dXnguVMDHLLlhuKlbuGAdKkWR/QDo+kkTqDSLcvkMM1TLYa1MEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgK3fgBx;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA4606A6CF
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 19:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACA4606A6CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgK3fgBx
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so16991685e9.2
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 11:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908517; x=1794513317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
        b=pgK3fgBxne00uO7SlYyi52r6PNmtHtBeRF1ltGHZ/f6R8dn6Bmeyw13jRcDFqvCBie
         12oahnfVFQz6AD7iYuE7Y8V4rrFR/vI87MaQgimTZSS2fPKM58X3O7iROXGRun9J+ery
         aP1jXZ1YZIuUYApVuovvleuiob7Bwn4/UPlqyYYGA8JYuWzsVtfgSmmcLfck/nTVDQfP
         0risAI6M9s7MPfEgV8aECpV6delnVRs2cS10RMuLbqbUypL+bw7cJ436ktwh7SDuPx0i
         MvO3gjdk9omYb2CLgpevkZJAZdE4lyB+FxK38eBFCPns/wO0X7wU77LY45RagMasgn1N
         9jDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908517; x=1794513317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kSakqCvIRYmZp4Kah4XkFCmivNJpbW+r8furabcNvo4=;
        b=jVUnWUOPXs1UhhHJL4L0SQaQIS3mfdT8yo2nMKIkcvkyerkGkMVUCNs+HsNG5y/DAp
         GXOoRmwACHFjatbfJSu+L5vnA9WnYMNSbObmYO4ywKLwZnUbFiEVmEM0gVlKUxuvUTSB
         4vG161dnVUCD0yRw8+O1nCAANyxm3v6zhxLFc+W15r0xK0zW78gzECt7urEPu3nFpHMS
         YbkTQwnEkS7jr4wdfTxAghQAZBhNUH5Uc9ADiIus99/eoG4IV+TW0Z5vEb4l64OKplFe
         VmOdqGvBm7N/VqgA3n2goZ6H3qeq6pBL4kwGW44BPbC3cOJbYw0sH1T5gTpJT1uPSUuj
         SuSA==
X-Forwarded-Encrypted: i=1; AKwUvByAW0j90RhSTD7YrYrBkFJ78d39lT/ugPZ8MejGNmlEb1ml222iVoYw4nao3FU1yQXpPZc=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Pnv6S0cqW1qk+QezJ4Bm/+LuRN5xGREzyyM8UTxWDbBQ4lBUW
	l9KGkBlIlNtZz/7PCDIgTD3A5+nUre162jPjtl/JlROYGZmexY6SuWLw
X-Gm-Gg: AYBFou1HgFawb4xG/xFt0O29GxIikDokOMo4lkHeL0+aROwmycFHb9CxYy6XYV80jep
	TtFHvi77elsVDMqTan3k4lrJZdVcySruXmD1DZPlS7q5lySlpCft+8uNnxHTAYuxztK5PpAtMYb
	Jknk1ovHT9Vz8oz5lvuh0X4cSzGCN7bCXUHDavhGyRCZYyxFYy1J1FPoddvnLGULLxJ0x0GXKzI
	luSlQAJtcZtN3b5afFReCSCNP4jfvfplNO+qbdXqblu6AMlLEjM/7OJ2c/tzgm89+99nDCkcG5b
	IE9Z/klZYFrzzY6ccp0dSLbWbLRLvFqsou6eACtiUbgvyyX2PrLM/7qdAcPszwNZm19dwMkT2DV
	/BAG4eVoWwY25/QPfRnkxKIo8MK0XNkXxrhserbCo6BnyM+Zibt/qQh2eWA3cPSmLhJsjSWZqEu
	xfCUikN3IqwqYDI8Jyu+wVNkHwNFU04jX2jfCaJOyGOnIqxYTU71QcPUSCBb+DPCXYP7kizcx3F
	uxYX8yMrEzoBpgApzqANy6sezI5Ua3PaqjTl0Gwzi4UXwzogqPlbZS4tNaGPj4+NqNZ/xuhUR3v
	h8tG5DmnkJYO+WhBK2PmS1yc
X-Received: by 2002:a05:600c:871b:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4b6df5e87f8mr2566715e9.26.1793908517156;
        Thu, 05 Nov 2026 11:55:17 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:55:16 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 8/8] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Thu,  5 Nov 2026 20:50:28 +0100
Message-ID: <20261105195206.3440-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add the dtsi to be included by all boards using the MT6392 PMIC,
providing support for regulator, keys, pinctrl and RTC.

Import the new file in the shared device tree for the Pumpkin boards and
declare the regulators that must be enabled at boot for proper operation.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++++++++++++++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |  82 ++++++++++
 2 files changed, 227 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..cc4770d70246
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ * Copyright (c) 2026 Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6392keys: keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392regulators: regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			/* Fixed supply defined in the data sheet */
+			avddldo-supply = <&mt6392_vsys_reg>;
+
+			mt6392_vcore_reg: vcore {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vproc_reg: vproc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vsys_reg: vsys {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_BUCK_MODE_FORCE_PWM>;
+			};
+			mt6392_vaud28_reg: vaud28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vxo22_reg: vxo22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vaud22_reg: vaud22 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vadc18_reg: vadc18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcama_reg: vcama { };
+			mt6392_vcn35_reg: vcn35 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio28_reg: vio28 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vusb_reg: vusb {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmc_reg: vmc {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vmch_reg: vmch {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vemc3v3_reg: vemc3v3 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamaf_reg: vcamaf {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp1_reg: vgp1 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vgp2_reg: vgp2 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vefuse_reg: vefuse {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vm25_reg: vm25 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vdig18_reg: vdig18 { };
+			mt6392_vm_reg: vm {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vio18_reg: vio18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcn18_reg: vcn18 {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamd_reg: vcamd {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vcamio_reg: vcamio {
+				regulator-allowed-modes = <MT6392_REGULATOR_MODE_NORMAL
+							   MT6392_LDO_MODE_LP>;
+			};
+			mt6392_vrtc_reg: vrtc { };
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc", "mediatek,mt6323-rtc";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 805fb82138a8..c6af3def4a29 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -6,6 +6,8 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
+#include "mt6392.dtsi"
+
 / {
 	aliases {
 		serial0 = &uart0;
@@ -160,6 +162,11 @@ &i2c2 {
 	status = "okay";
 };
 
+&pmic {
+	interrupt-parent = <&pio>;
+	interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -251,3 +258,78 @@ pins-eth {
 		};
 	};
 };
+
+&mt6392_vcore_reg {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vproc_reg {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vsys_reg {
+	regulator-min-microvolt = <1400000>;
+	regulator-max-microvolt = <2987500>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vxo22_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vaud22_reg {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <2200000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vaud28_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vadc18_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vio28_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vusb_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vmc_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vmch_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vemc3v3_reg {
+	regulator-boot-on;
+};
+
+&mt6392_vm_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&mt6392_vio18_reg {
+	regulator-always-on;
+	regulator-boot-on;
+};
-- 
2.43.0

