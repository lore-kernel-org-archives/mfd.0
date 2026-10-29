Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268424;
	b=5ojdLiEuk/qF5W6d7TpKmkuqdpuJiTbAj3tpX2S81bs72n4JDyAq57X1oyeYygu7KHUV
	 UI8uS2X9WI/1IBrU7P+/UyjfuXBz9J1BbXMODaJVWolany2XOqXbRwXtXjoimvcfS26OL
	 OPChZR5+FVnHoWZ9RnTK47opsyfTMGYhOXTiGuTVh3oGtQOsUSE71Fxy7ruwNYTAADprm
	 wLteKei3l1K60dk0RYhKxCqcyaNemhjdHCJkwgiA+EWPIpTGwGClfqsB6nBu01BPic0Ov
	 8PpK6SAxewj7OUFt/sjc86hUCSbEXW6F70+GdSNToktdJay1LwmuwwRURtmMfa5E0Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
	b=lxpqFhIUfbyxC92dMoU4Mw7iPFPCH5KEU2LU8DJ7i7nYZO4MIL6rBPKy2PYlMHDMXyHV
	 u1+zbKuDZ5anMY5wtOpd66WPAtvWNQGODtYsVVXAT44Xoo6lpnYd6L5t9zr2xwQM2quub
	 +uTZKHbSr9P2nizCOUAd5VfFtR7KoMPaw8P7ycnDrbIj/RVvKeoeisySc7CjCkAJL+0eo
	 lK59WCyNrL5pJNG7a920RxEH/WzLySDSiHgVWIuU0pR99GABvwCj3/MYO/fG9emCRIYj1
	 JVAmTtoiVagI0YA9iRsObZC3RES5bZAHwgnrQ+ciMylZ3sT6CrTHO5rYc1hd0vO/KqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c9EmTMl6;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB1F606A320
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 10:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB1F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c9EmTMl6
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so13918585e9.1
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 03:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268412; x=1793873212; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
        b=c9EmTMl6KlWqxld1LOzaSJGL7cDrsYvpAhAU1lQFBN2tjjcvA5Fq+beFQTo0btBYz/
         GhzgPLLdDglmWIMFBD9hSnA22/abMLEmn23OV7Pzgj2yC0mPbxPDt0Gb/ndMUpNkP134
         wjtxVz2FatZmFAYOPAx0asstZN1CEpFASxcw1B97r2aqMSkCeYe9bElD1NPApr7wUtiZ
         zYQdH3qawrHp6+2qINHxnJfkZqIf49Iaps6lCEW0vz/f6KOf3K4NVk7MC8xOEW6gAj1U
         cQlfrwMg9NhHsxKKjaMTYsJCfg8rFQR83T/sIaxBsb60Dzs8VDoJ9us/B+GZrv6AGXbl
         sCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268412; x=1793873212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
        b=eScetaUQUwRAKsuzuHk6f5LL4WnmWJeRGe4NSaWa2grmg5EkylTACs/dTRsK+Bngim
         fRj9mOJwLxr3kA0qf0qYEStH8712Mxly34iKA3g4suDZsnD2Tn8/yrmlG/5v11Jy56su
         O/J5thlVSaphAoWFNCUxhli13Umr7Hg3M6/V03Iz8BYvdwyp6mo7P18EAQOcGwoJLBvF
         qEvCBGU57GpxXKD9iH+64NcuVzYvmpWYpw8fBEj3pSEbG6/4mfcisNJhFaCdHDCQgHMS
         49MZ49mTHDegipHciIrwZw/Kn7aV4VwHCZPyCegE3WYbPMA/ledWbXX6xcnPZZwJVLoS
         wIYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJrxNu1HRpyWXAqLNFbC5KmKtB/Jay+BNQTVMj00zW2hOTNuVYux4hfT68XUuoSzBSiXc=@lists.linux.dev
X-Gm-Message-State: AFq9FYLBWU5NhIWWTrf3OUxMOOqHgnC1ALCQ3fxb3BLu2iYuIo6TuFXb
	EdF0MItjYKlNeTgebrIrpNJH8jXUk49AO06PqWGh61Zt1wCzTEfd3Vrp
X-Gm-Gg: AYBFou0HLKsHj0G/G67DuQZceOl5+w4lLwzYsDxgZWsDh3TWnfwzoYaRgQQ7SuGrX+a
	waJYZiPGemR9BaPeyUq98+nQCXetks/01aC+vEnWkXubaghhHRcTMsWf2bHXxcbNEfzW3pEAYO3
	BX4Nsk/0qYERdfKbKWg0i0ubx99EIPIUfwU185rnThFK/2F88geLCHa+3q+8pDIgS5IpwUvUcFX
	DR/IDclGc8hbplIQfZ0Gn8zoAUDQbp7t0ctO270w9kZCvv1MHsHxHTLhR6cT/Fc1Ry0MHD/0zYq
	3mpd3wCG6b7tzsU5Rhy4KVziZQOXuGptIT8Ls5dqeAQymZ1yo/yWizOlGWM1gLU94+bstyF6UVt
	XUQhXWGitKcMDk6JpQKdNv+SZqoaihlxFw+rMqQlkmqTAjrSEJ7ARqKr64wcX2lI9Gb6uyRT4rK
	YLlfE0rN65gaI0lNKLOOQoHtJJ+DZYGqN95e5Tii+1PHlrjv1fQMm2IQhVOTBrSoEHwUgUghJpB
	sBz/qfCDXS2kXwOrgiYjRO5/4q+9OMPj8B6F5PIJ4L4sTxHfyBkdYB+3Mcz8V5dBS6J9S34YJO/
	2JPW3i5rOqhdGwqUSgT5eR7UD3jYpKCdqsBN1tgU8hJLJIM5vCWiApHG+oyC/hQ/Io/OvgwuIhw
	na+BJESin
X-Received: by 2002:a05:600c:4ec7:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a9660b5041mr117976975e9.8.1793268412452;
        Thu, 29 Oct 2026 03:06:52 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:26 +0100
Subject: [PATCH 4/4] arm64: dts: rockchip: put the PMIC into sleep mode in
 suspend on RK3588 Tiger
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
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-4-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=1641;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=SDfGdhdTbDViPNWR7gWVkSFVjA2d78IFMYAVeDi6pgc=;
 b=+lV6mFqZezu/+F0xruZF+cG3BHg9hNr6TFfbzH6ls2C4+aEQv2qB9TmeiX4sbnF59e3EHmvUT
 spRbBmKPD3LBiX00XMbFZ9MHPNkvGrR2KGQSbwdMr2iUT+IH87yeXEr
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

The RK806's PWRCTRL1 pin is connected to the SoC's pmic_sleep1 output,
which the firmware (TF-A) asserts when the SoC enters suspend-to-ram.
It is configured for no function, though, so the PMIC ignores it: all
regulators stay on in suspend and the regulator-state-mem settings have
no effect.

Configure the pin for the sleep function instead, like other RK806
boards do.

Measured on RK3588 Tiger on Haikou, suspend-to-ram with the logic
domain powered off by the firmware, module supply current (5 V):

  PMIC pin with no function: 0.218 A (1.09 W)
  PMIC pin with sleep function: 0.086 A (0.43 W)
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 161c89c62bcda..592a2d11b36b9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -471,7 +471,7 @@ pmic@0 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_slp>,
 			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
 		spi-max-frequency = <1000000>;
 		system-power-controller;
@@ -492,9 +492,9 @@ pmic@0 {
 		vcca-supply = <&vcc5v0_sys>;
 		rockchip,reset-mode = <RK806_RESTART>;
 
-		rk806_dvs1_null: dvs1-null-pins {
+		rk806_dvs1_slp: dvs1-slp-pins {
 			pins = "gpio_pwrctrl1";
-			function = "pin_fun0";
+			function = "pin_fun1";
 		};
 
 		rk806_dvs2_null: dvs2-null-pins {

-- 
2.47.3

