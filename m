Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090757;
	b=wxz6oonnb0RjDH/qv0ASwWlOTbuoj310UqOITyIiv0XFa6GOWn9AqEQ4eHUJwfrbHSji
	 mImllmGPH2E1nVxsTgf4hzTj9n2fKaAjjNCaq69YtDl/ByIw0q/IRVNqu1F6UphunPyQr
	 inSTWFPRg07o5GMfetRTiQ6W2fNwOSgjccm1tPGLJ2IGw4lNM3izETWvH1ij0m0LM2DWG
	 fOmceo1xfP9rPeuk0+Cb0ndTEvsRrNABv4Hmd4RIfjQ8l/vVqzhTIEK5TRrSZs/0qgay2
	 kpdOAXnXztLdMv12+AL1i5J6VbVu0DbGuTPhwg5Rfg91chFZk4ZttH2urEa30tlkTXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
	b=pO7o51zSImyWz1aLjQsGHCvLyD2BZk1UuGXAB6VuRMnsjFhbytQ0YsoDO6PwktyuhYlE
	 qG8SCm8Ie14xWgRHpn7Up4OYTVTRlcrGJWZGCoxN7fFLbKzdPsGADaKRgmr6NzWaW0yFC
	 CZX56o8UxRs9a+h7rlw6Kq2wL6abqZeo+dZDcWeRsoxMbrcyzE5DYPDe7c0EcZ67F7FUQ
	 3KTUFcdixSYT2WrfU5vv8vbJuMMat6gNbNSPBOhm+7Yc6MaaSB0LQKn+8AcqGnETJXVdi
	 QUmzTF0NJkz/IgGiCloOVbssy1NUQcl0zINFv62vqSkF8suefs2kw4nqSj4zdwAOT4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p4cDRCc4;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C6D606A31A
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 08:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C6D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p4cDRCc4
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso1344719b3a.2
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090756; x=1793695556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=p4cDRCc4Pq+9UWyT3v3q0nADdchhjNTP4cyxZCoexQAcPZXrN5mwpV5mk7AVrM/flb
         h+/LeAeleNQvZXHYqDNZ2rQTQSFZrdgkp1NbfLrwncwifLQGsAetbiY60/Ev1GX0fOTi
         kM2oV+1Nza6+Y4xROj1UBnZwgdO/CVSvtoEPuP1XKIJy3bi5wdvGkdZ4N/2HdJn3hxph
         VadV7nRpKscy43F+S4ezOh9gQSSVbTEzddQrY0Hg21nfzmJrgxeeCi8Ya6R5lF/p/4Tv
         VfxhecweKX4XNqGliNmDmeI6Iy0NTOgTQyfKrzBeiPJyNpM2DuG1WPmolEAigdFqxRlZ
         YHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090756; x=1793695556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=vbrQgVFrqJkOXiwuJxI2WXaFlroRHlg13PGkU7pf7dN/uHIG0+CIx+KbSm87KrGQK9
         QSOa7TiB9oqrAXevRnP92+gymNFHZ5OPZjPhdOHAoZjyPT/LydD2Z0d14oLHDVOXcVW/
         RfNnt1+0L47K3vFRtA8kAVcf1FOWDT9TO1ybzQIoG/3XSZxVi9k16T8jeE/fSkddxwpl
         S5D2wurblD4Ngj6xJ2OZqTEfap/kS0/WmiFR6V9zYJUZ/CVNJ2HxCZSX8ye2ITKtjXfE
         ywlXznDEV9wpKVNJr0pCXeRIFryvPidM8Vv1Y9Ntbh2+CZMS6aJTPcbrIIQEoaQ0Ro2S
         Xffg==
X-Forwarded-Encrypted: i=1; AKwUvBy5WUY6jh4wB/N74esMWU+baey9oWsHB/F58XDa8U7VFPnixFETyqHpnH3nbDO4HpCuaIY=@lists.linux.dev
X-Gm-Message-State: AFq9FYJhZ5Vbl+e4QFCEK6lLVFQzs9rwYpbzpN94OncqohcHZcDHXG27
	5D41PkVasL+0i0W6BF7aEjAADGgtVtAwSHnPkjcF8UJmjMI3AoGOLrkm
X-Gm-Gg: AYBFou1MFxru0IuI2axlH7cMce9hLh+DnzWkMWvIvslDk4k+m9G6A6lvbRKIWq2Rvbu
	6Ao+PoY5sS2Pix6MbsmPRPS+TXoQgYcjQQfxwqkDjaOkAMBw7vc//tconSRH01VlXqddTe+oVRb
	gFf20m46Om6XjfrdqdUmeZ421FcmC+6dEtCYOOFfSZ2AmtsHPkktuPoJjjtoLEHO/ZruPNEJuOX
	//fz7R3QxAXcEy2JVCfDw3EFA4GKMWEJ1nHOwOkuI2583VVHOHuulZ0cwjZv0qLzMn+I41NLm51
	8Nc6ridXuWtl2x90ASYQPZ+WyOKWQ8yaz5cPIdaq5BzI2Jg2ggwBMrSKVHwPY/PoZUoPJONf0uI
	uYvUnWnTo9YndTmmrd+aw3p+gYiLe+7D/8YD7D08MapxHKF38Uy1wkj+y//ub6gU4PraRzZw232
	ovid6RDa6QzElPHxS0c2gGERTNUJIOv5HLuGme7k84qMEZbmlbE36XZ2DMUOwtCPld2+ioInx+G
	7jdgy791zcAZ+vHgrGQKA4CqhCmjQp+C+hjjsO2y9XinsenRYGHGPCT2YqhijxvQVCicsTXbvwY
	NC6fcx+ZY1mADmUP98aQKPZDwPP26no+3RLogDUver8=
X-Received: by 2002:a05:6a21:4591:b0:3e2:8c70:6d13 with SMTP id adf61e73a8af0-3e7cd51a7a5mr7982940637.71.1793090755759;
        Tue, 27 Oct 2026 01:45:55 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:55 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v5 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 27 Oct 2026 16:45:09 +0800
Message-ID: <20261027084511.1992-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261027084511.1992-1-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
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

poweroff on this board drops the rails and immediately brings them back
up, so it reboots instead of staying off and U-Boot reports a power-on
reset.

Firefly's BSP drives GPIO1_D0 high while the system runs and low during
shutdown, before writing the RK808's shutdown bit. Mainline does not
describe GPIO1_D0 at all, so nothing drives it and the shutdown does not
stick. Describe it in the PMIC node, with the settle time the vendor
uses.

The BSP releases GPIO1_B5 in the same sequence, and in testing the board
came back up when that pin was still high as the shutdown bit was
written. Mainline describes GPIO1_B5 as the backlight enable GPIO.
pwm-backlight drives its enable GPIO low whenever it turns the backlight
off, including from its shutdown callback in device_shutdown(), which
runs before the PMIC's power-off prepare handler. When pwm-backlight is
not bound, nothing claims the pin; on this board it is then an input
reading low, which also lets the shutdown stick, although that is not
guaranteed on every board. The pin is therefore left to the backlight.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..210e4cb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -327,6 +327,8 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3

