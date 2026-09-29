Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567B852E05C
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690840; cv=none; b=eWBoVANB0CbunZt5j1TQAhgFYZr9S1A7ed24UnNN11Qq4uVFZ2gER1SMusoGP//h5hB1kFnsJ8nCY0stWKSdPpp2vxf7p7Wfj7mrRoynhCMFsPDid/RZ5JkfCL7uenU61LfuZDNVgbcb/bUn/u/VAm3bwtmwcSWKDRXN8TVxYpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690840; c=relaxed/simple;
	bh=yNJm9rA62v9MpM3ToST3iGXEFOROWx+UkzYwEQFVslk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKmWD5c+dhT/GlQQEcWDJ/kG9ww7jUskRHlBOwBVjnKlhi7BJHafQ64LwZnYHE3POtY/4SIM/0UGmwQ44/OP+mvQVFtawHnCeOTkU2xdo554uYc8YSIToySYZpxXUy8u+T7swqvWhQE2lOZwrQ24fMjvyffBdh7DB0spKp22KKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H54wbeTB; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H54wbeTB"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so397345a12.0
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690839; x=1791295639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqA+LDAW+n6bzSeEWtxAoQmofqsPeInfCOUXCovBFDk=;
        b=H54wbeTB9FxiHlZ01/NFtW9BexLWSvAW61BaNVJYclLdVp/d8TPfOax1DOwAL/TGLa
         64etseaJmCWaNFaXhKmRBr9kH7oNAT/LQZviy1IDxCel6+gV9aVvgg92Eja1V5AAELBf
         HCMMwkBVD5w5psefKMJy6nmFpsGmyjW4wny8rrhCLcoMp02qb4hy/JZehnUtlwdCCout
         bGpup7g+QKnhzqQyXZ7EVJP4Ruu6zALqutyHgoSfBbMhQImk6QgY1jajLBnXT6yWrxp/
         yDQyrdZ5FTfj562zeQYuA5fWpgxlSI0vc++ic5GVrnUOqrTfL3AKeisWi6bTmaTMg0i2
         woRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690839; x=1791295639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SqA+LDAW+n6bzSeEWtxAoQmofqsPeInfCOUXCovBFDk=;
        b=y1ly1+Y/gJX//zL5t6TMEYLMaw8stzD1bM3GbxnCdX1KmyMD90uK/W52Iz2kHAsjdP
         /VPWjsjHoZSiGsJq3UijxsBr/WZCXOooNDdHTH1ie1vge9aH9wfIJcS+ypkljO79x4po
         DSp4k01gm4p1ku6xtJGzR+yf8VdZolPV5XiuxEpvRGnohgtLL6PY3SwN2UWB45xS4swA
         1QuiIiulKPWfm5EfWhRHML7F47OhLc3Y49TB3yPNDPTOqYIDZ4VV9tgObgJEMt1W8WYL
         zel977xSgy8M4tGKxswATr7WnXovfGlOvgRMVe5cEFTADmMOp+ZW8uunoljoWoHBZjqI
         9Dqg==
X-Forwarded-Encrypted: i=1; AKwUvBwhHvegUhUUethqRzuE5PedWv0/um9R85rSgCGOs4GeY+IVLkyiOm08eu3Fx4hc/DwgFxY=@lists.linux.dev
X-Gm-Message-State: AFuF++kLIZrG64CckIVDambOcaJsqoGAgfPC6+PkjvV/dSsnga54A5Lr
	Gdx02tsBWw6xU522x59O12Uug+cRbeESN/GCqDFdzN9ka+50GWP9NOne
X-Gm-Gg: AYBFou1gXZnP85K7SVVGoUm5Aax9kav3DuEqhgRPgm/KOttvia1knkMyvaBmlUr3Eg2
	3q+rtKrwULeUnNfU37dQ+bLSwv2dp0TmeJF3blwc4QHl8FK2i93qxm8hHr6W6SCsgb9e/rDWjtl
	GIu8W3wEsGxNp6ge9rBF/RYC9JGAkjUZ0FrLZvUHSCFrQkIfgcsWWLl4ypdL7LoPTc9JSqYZ+hG
	vGZ0xafaOZA1lH7oYBMsbA7SuNqGQWW49tHz+DoYLZcX/fWkRGhDm4ZOfyCoQfvQXVQaRMu6RXR
	7/33Kg5DgImqoGBqCgub+pYA6JpfC5WLYO60nc49a67MSKyU6JBKOkPuSJXD4rBCGXAuelENfOK
	QKueZ6QHiL/Qc8Tuc3W/c3BXRO7S2yRP0E+nbD8SmDIZbBPBIllJwisw9V22QXc9Qx60ZCyamTq
	gpPGaHVqF/VUcZdtV/iZUuIwRo+Vxv72zwcIb8/AeF2MxLlZBDtH+Bx7naaKweeKcNdyuIzMwGq
	OLRG/JbxWY=
X-Received: by 2002:a05:6a21:150d:b0:3de:6172:e340 with SMTP id adf61e73a8af0-3de7cf3ea13mr1897125637.38.1790690838628;
        Tue, 29 Sep 2026 07:07:18 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm3526989a12.29.2026.09.29.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:07:18 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v3 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 29 Sep 2026 22:06:48 +0800
Message-ID: <20260929140649.55-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929140649.55-1-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
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
runs before the PMIC's power-off prepare handler. That pin is therefore
left to the backlight.

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

