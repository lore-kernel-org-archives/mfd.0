Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC725412264
	for <mfd@lists.linux.dev>; Sat, 19 Sep 2026 12:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821007; cv=none; b=XRYxvf6U2mGDHacXvW12QdfIMPke/rNhGXxoKmhb9KM2N5++xLfn7WupEGWPCsKtHfPYKob7WiSdTM89pShVzAp37x39jgoHn7TRUb3Q8wQhJ1Bku3zXxlgo6kZG60r3+Qe5kJOQDDPkAzDwWUPJjgpll94l8vm4X/d5rEpAZ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821007; c=relaxed/simple;
	bh=w1bKyQWKw8iEtesnaXqouFCOrAm6kxtFiyY3O7rUloY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBRaQatRk1P56o6CwjMIfNiBUFMgKL0rH7nKxsk4IXkBxOWGE/SSBMgrMhqdp4PSfxptOp93HIljaFytqvAQIyXbizMZqGXhNUd0yMcb3fuD79KVDGzLAuMeSAphYaG2M/vgbopIRrTEdNzcniWPJxsnoO31+oVooRhhub1TZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hvq36+J9; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hvq36+J9"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f7so11239445ad.1
        for <mfd@lists.linux.dev>; Sat, 19 Sep 2026 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789821001; x=1790425801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=Hvq36+J9Xm+r2uFNXQGMvkIqTquZpLNnjPvWnm11FffpVbToh4mQ6RV8MGnKigXja7
         gdKYunUyi6DV2OnZb1BfmrpLP5SUVIrYWTZvl9tWIlshkYh9qn0BXWRIyM0H7HiKUBCh
         62fZmAxgkgtWrOqW1s8cagbee4jKrlOSt42yFjEkT08cZh/pUJjgXZH4sjJeRMGZOzRk
         qj4WjzKXfkU4lyu1FfUU7w1BiPEdbWT6aZdOdQOfCfsYEkjQEOHD6+Nz0C08UphX17cv
         vdA2QAZHeGH008BvZ0KdLKC2KNDrvizL+kamL0HprrRYn7v59OGRm8+0u0T6yOzadeg1
         1b8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789821001; x=1790425801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=ciGkvp6K+MzAJrEIizsrrbeQbP3bKvlME7jTFbZd3wYNXqejWjnpx1ZStIdRWujpyF
         QO/4gKuBXJzHyuBwBwxkVTW4x6UhROsJ3iiOb2ePorC0aCSoFCUU9/1z2poEru3U/gB+
         TPX60WVuE1doSigkoRFMpPuXhzQSZSgGjvUMhJ/VwT6ToLDprqEmVMTZj8Dtt3iio1lS
         jJVdwyM1CJBHzSHk/PIfcZJWN1fBxrh/Sq/ogE8CpQDSAWwJMeBNfse17P2WUuiC8A3p
         huGI+8h9ahcrF454WMAAaZ4fCOmBlpiXMTNPLCPoOAy/gFChC3PEWWfWabLqL/c2ld3l
         sMCQ==
X-Gm-Message-State: AFuF++nkO94uLEPS5bYED7lrrjh9qJ2B1Q3+rUvfzcqe2/dYbdGXKVCy
	ZMKlfCYmK0KnXUNxcC0H2wbLhXtlwpVgdLh0eiTtzxKJiavN0ubHhd3l
X-Gm-Gg: AYBFou13Gi8zLaAfNn7KkQ9Ui+COxHW8OvnuZykGcc6DHzYYPdECFk4fqsq/zwBf0PP
	1yox8Jk6dML60ToNexgH4ZAhY8O8m9A/gCT5243BxycEPCK4/cAkMNSvPcwZmvv6OijuMu/TUMx
	CPLnjZbziTr4F4X9RqTXlK6dZXYAEeflUkwdnWl3xbk4OfWaFK3MTyVZwcwup6oM4qtysI78/vT
	X7Z2GOgbEOwGXLfnnhiDV4y2tvJmiDyZGPZ9tkWBK3QMEsGvt4vocuUYOrHT050zZkiJzlZ79Hu
	27P0t9qNEtCIfU27JUeusRc4nr5zSTux8HCyzkI0ZKlGwF/vyrAChw0ZGpeE0oGr4el1IUlE+yI
	eqUZWI07BlmpnqiUAP8AXNDwK85eDnJSBsWajw/8EJ3Zwl839SMZfuOKITe2DFHBq0e2ZIB+rtm
	C1DCBOq/VDn8UQT91Pljdb8ah6niU41N49R4nyU1NswV537JsIf3u/vK1oQPoJ0dgdrLM8+Pw6/
	YwVTiO/axA=
X-Received: by 2002:a17:902:e946:b0:2dd:c0ff:e72a with SMTP id d9443c01a7336-2ddc0ffe9a0mr29054485ad.60.1789821001018;
        Sat, 19 Sep 2026 05:30:01 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm9552155ad.66.2026.09.19.05.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:30:00 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v2 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Sat, 19 Sep 2026 20:29:30 +0800
Message-ID: <20260919122930.1418-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260909092728.1859-1-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
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

Firefly's BSP drives GPIO1_D0 and GPIO1_B5 low during shutdown, before
writing the RK808's shutdown bit. Mainline does not describe GPIO1_D0 at
all, and describes GPIO1_B5 as the backlight enable GPIO - the vendor's
own backlight node has no enable GPIO. Nothing therefore releases either
line at power-off, and while the backlight owns GPIO1_B5 it can hold it
asserted, which is enough to make the board come back up on its own.

Describe both lines in the PMIC node and drop the backlight enable-gpios,
with the settle time the vendor uses.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..75b75fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -27,7 +27,6 @@ chosen {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		enable-gpios = <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pwms = <&pwm0 0 25000 0>;
 		brightness-levels = <
 			  0   1   2   3   4   5   6   7
@@ -327,6 +326,9 @@ rk808: pmic@1b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int_l>;
 		system-power-controller;
+		power-hold-gpios = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>,
+				   <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
+		power-hold-delay-ms = <200>;
 		wakeup-source;
 
 		vcc1-supply = <&vcc_sys>;
-- 
2.55.0.windows.3

