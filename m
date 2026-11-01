Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547685;
	b=BtVu94KcFSJ6XDWMvLDfLDjwA6q1KIeLR3WIoCRCc6f42aE6wbnoTn21GA6F1e89X9M0
	 0GgI55vOOft3Pu8RsjgFgWukUTsjDOXWrLsJ3m4GLULuA+QvIFeoKo+g9afhjH6bKhsEF
	 o/vDgJtFqofCXEdd/3dVL0EeYUQ7QIdJrtZK+fcP1z7/pv0f6FHRUc4HBEogmIVmppxyu
	 VASOPUVaRAYa5cmlz+TYt3sUQdRYDK+U9MNDHQ5EwjqlVqu28H5tsUdpzvwy4QLySlxMm
	 3xb00FgwtbiRFPWM/kEXtEubeR3h3ofHzsyXUbrcOQC5tNC4MjSGwIherrpFhdMunqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
	b=H++ed/U3J4YwqrIKcOo9q3aWMtNePlQaX/GSeKzx+GnPF9JjRHwCgJ0RGtJsXkVUEsOj
	 yP7ebB42yORMb2CIrQtCQTbK+MUmwVaGDkDE3J7CbyD7kB58nJvgdoLGlvCiQMIJgdn1z
	 EePgQZHlqDo4GDxGiv2MRhWxnbY38QhMTrWVcKqd0HPCfBT/bvILiuyUuyIZvDpA0Ib8t
	 YNlx8UV245yutcCAblZOuh7q7sPhTgiSX043zgOR//CKBBnYPqyHni46khoYLwmi5ei/7
	 Sk2mb0wGEdzIA88pztuQor9PtW7v3RgBXu9xYbi2wJZIJXDat259srS0p/Obm/obGww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0MF1F73;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E7F606A324
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 15:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E7F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l0MF1F73
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1759824a91.3
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547684; x=1794152484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=l0MF1F73XjxlgrH5FbolVJ2Bd+JSGdB3ABCOa4gTllGPcWoh3jkmsG9p0vPFzMXfs7
         ArsR2BurP0adfKRCzlR4pvmPeKaNy8WcLrtTlLAoNBQVU6TyhHymNObS4s/Xla8NYesI
         TiN7ACyYCZ1MpM7ilopsX1I5WNz6tEvfcpK0lAaEq0P4wRWahJdppqp0S/5fbETcLpdg
         mrBigPCQjWhsmnuX16r7x2RC9nYTbSqvgs4S8qkevyJxiybu2zXsNhOuSktnzF97iMkC
         kzmN3lqP/NLea1nilnGnJOHTW30eAiIYT2HNXvX5DbAywAXUMDxqLdugmT/jmTw0weOB
         mjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547684; x=1794152484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=xUpfXptHZXK2XICImyvXIIvEg4SdnGblxgeBxXqQV5WidkQmNNxuGNkWPFfptTguXs
         x+rz0GjdUnanZnfW3qhWNBd1yPBkn1GUtXA2sTpqIMRzKGRxSTS7HJCUIXcx1kRnxyT8
         Y0UWNXpEaPW1/RFSvKgzKEy13GudbiJ5uKDbOns/28qT/1PXTqTMigvkhBjCgFuFw3Ob
         OBDj1T2QTvV0+MfDZEyP5KpyQ4NuuZORnbDjJVZ9B1zQG/p/2V/nIqJB+HH3/IRmqOnx
         u9+Am0U0x4/rtGQPbvBzPoEzvcDYAf7G6Eb1ru3mgYpeWtJLBabjPOVhO+VXnkWema56
         zRig==
X-Forwarded-Encrypted: i=1; AKwUvBxL+dYpeKYTSK1ZyQzct/vU8l4/Bd2LddcWdBupbstUigKaAu7I3wLlWVo4J4ph9/3ByOE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+dl3s2k1hJATsiVvVIKn4cBEEOpbjeYF4urGlOG/uov6W1r70u
	OVc4Q0ebQD67uDGmWjHFGevTosOWMVBOI41ud74+V6ztRAVa9VWzGWPo
X-Gm-Gg: AYBFou0dZ+Zq01NsgMD93kO/mkrDbtBrARBd2bXPx3ia0WYOhHZVN1YKVE4QqGUcght
	N+Fy11L+Qyx91a7pIPgMBJn8pHqds1qd1sV7afHRWzDmtKz83bedzoGIhn/wOLsxE6xv3J9SiQF
	fjJvYB1uVwMQ5nPLdRP9NnjTdky5QfXNhNDB2L1Uf7U0v+3jSybVY0lMtp65rENyfSENQx0iriB
	ecsDKI3E8fbeYdeHOsAujgrMn/sk2TF7rKFhasjs+/BkSHZXkdWMR8svJxsKR13aLNG3rGshn/O
	O4k9OQ3JUon0BZPAZxtuJuxhzZ6/Ce25njU9lq49cvDw2xYXMq934mleT1CNlqc+LWV1g2MxwKl
	xXLxuZN3NfJReXvBDxR48Je0FbIBcK3uRPZKPpCgHaw5DX922e13lWuLiaxZjXSGJJ1CfzS6EFj
	aBHQJPhMbHeM7LCD35yKD8KCBc3hi/ZHj5/TfVT+EiwQywWnitCfnVJ7q9n49FrAWjMypX24v/X
	BsGuLidguZUuSBx39DROr8U5STyqocBAgEZXesudSdC604CSIYXIFIVNiAKyiXJl9PNCOaIpB0u
	LarqFxDJtVgSZvj4ujQM3ZWeJ8rS3KBlMy20Vd2pCw==
X-Received: by 2002:a17:90b:3c8c:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3ae8983126bmr7130051a91.49.1793547684390;
        Sun, 01 Nov 2026 07:41:24 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:24 -0800 (PST)
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
	Yaozhong Li <yaozhonguwl@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Sun,  1 Nov 2026 23:40:52 +0800
Message-ID: <20261101154053.3874-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261101154053.3874-1-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
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

