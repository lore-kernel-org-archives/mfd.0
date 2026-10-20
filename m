Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505023;
	b=17LrRiiFSjSqLOVzEwt+gqSJ9yb8EJWQEgKEKW56PJ9ac3zI6q4gvVI9tOilnlgD7wnE
	 prTjaSYAfdMvTOWRak/DQd27E+GmzGODJ0ubpHCln+pJ9/ixblCd75UcbMFvwh7W/xkd6
	 F7V6ktggtUyenjLW0P9pjXyibKuQDIVoM/yHVA/6KkRTjvWO+ZFX538gbjyiOKaYRWNct
	 dsvknSAIyRw04koGTEr7gzEZSe7/uV2EFgvJSKFou7DUPB++2gBuO7IjEIpSpqIf0xcPS
	 d5V7+Oi5+wQj1jXTSBBPDdYYN6FsPKKUaDdDGefXx7KhGXdKA5BWc6RnyIXyH4IPgMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
	b=gbtXyQK7KbcJfRhttw9vZvg+w1H2teLaHk/YEcrdo8tyngijqkB3A0MAN6a45c9dhLle
	 U0aISdfeFX+Sn1WDCopyQw/Z6hZaCmLMhkHYJ7pOFpO7HYMDFm+pBxm0EkoikoIv9Nd7W
	 GbK7IVAZLZq4XZ5osjZFbHmvPYJUyTC1dBbw1qQ9nzH7hfm1MRHSls0HN1mNmHyFoJDu1
	 GbgtmY6z0cvrB+IaCrKBPfgBuHh3kKco6H5wezJnHYLpcckmENLAOBoUEQuXG1r9jSvBP
	 n1ZoQ9ppvtvy5n7VHhsFTfsNoh0DkJTnzxz/QRK0Egrpem7tjUEUwlEJV4kC9vVFtbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ER0dcqfe;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0654606A32E
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 14:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0654606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ER0dcqfe
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e7e742a2c7so4806785ad.0
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 07:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505022; x=1793109822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=ER0dcqfeWrDoaeKcTXxnTAAPGLWqGG4cJJ/YUl8TCc/aVLYSVwl+m/lFw7tbigSLjw
         zhd+LP1IiZm9y2HBgcYksNWWbfrV2F+VqinG3VBTUihblU4P2fsnp6Bldg/1lmQ9OKck
         JrvsONuiAgg0tCMSOraXsIvMcLZFJCVns9A5+yhonjoW0sCiRiE4OPtlj/9Hh72DSE9z
         3+59+Muq/8UOuHean6UGHRbbWn3GxhFNTQsjHNu7m0x9QVv3Wx//oYEA8UowFcA8YzQX
         l9EdbbfwNbIpYZv4V/sIoCqNESwH1vR5wulDhGfSyM91WpUXor6ieNuh4u5ptKd660A5
         0E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505022; x=1793109822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HzO4m0Q8yZV5RgPhRhakwzaTu65IYUbFA7iVxGbsJX0=;
        b=DHlUsCr/O2oARRyC6yAUAgw5bMKdmWQf/r4h+LSwUsWOytWv5ZRmY6oULazwohGCyz
         ByQCbZgeWGku7i53xF68LMrZXDFir+Ngna8CBHsucs/bA+8gmg6lCcvenaNI/kL++ZyL
         n4Nd++QhNa7iQYF9LhPOS7ibZvH4w2nMBifR/kbBfOyNhGo3acK2U8oQK6i6CbVIE9DY
         nGSbrHD+UW3pU5N9UaUTbWz85YPk3WLxNFyvxwlr6OqGzypTaiamiCSB5YiymHXcJrGr
         kLr++gh2sH/9nRTvsWQpzQrsapUXvshmRTEHoXS9vTXx40TzrHAGd48xi8PK4ROXjjHS
         4how==
X-Forwarded-Encrypted: i=1; AKwUvBysSNiCs1ZmQPYc6hf0syrfbygW/QZmUWkpBGVeu/fzn2r8CTPFkDpi2VktSHgThvnVrLY=@lists.linux.dev
X-Gm-Message-State: AFq9FYIHYDsRx3OOAgPUZJnxmtJ3ZivTOLm5dQlFP1EK2VeIi1gGlJre
	eKkNtCky35B2pHDbYGwtzGRxmmF+w/jQe1CqAy1wzXg5ef5o0Epfigoh
X-Gm-Gg: AYBFou0x11ikAB9XrfefkBPqQYAmPvJCG3TFiFrgPloXaCza1mottVkLD+mTsGj879M
	O4dbxy1JRRxoNZH3Pka12vlzQEfhvxSQ+nZ/SSlHfAryeNtxQ+BMk8jgw0ecemwIgsVcgfWgktk
	tqUv/rhYCrahQRDJy0zOGrCz5kyyGoQ2wdnc47Uzx8SPAIN8z0cFRue3VuP1XAPfWvUpCmWT/xz
	EP7Cb+1+qejy7jW4XusWNNjfuCeIIG0J4dBWfcjofopc4rN4/LRHqpgMAMAaY6gc75RyLP969gp
	dJpFEinlXfJ45R8vWbLOiGl9jCBOKgLVRgYRkgwD1iEabRHcWimNON7hm6OELFrE+/o88wkZvUi
	r7xmDHS7UcReD+INrrkyouh172C3WOhJxDPGcPTe18EYuqAtthA6pV3BFCPQIFda2620cRuAHVg
	0RKQN8W9a42z1CmPvzRZvQkr0gxK0dsw9trB/Fu+Afznx7OmX3pNdoVYbHihxrobE5EVFeKby/g
	yLLQaYcQfU=
X-Received: by 2002:a17:902:ecce:b0:2df:34c0:72fe with SMTP id d9443c01a7336-2ea1dd670d2mr14819585ad.35.1792505021811;
        Tue, 20 Oct 2026 07:03:41 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:41 -0700 (PDT)
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
Subject: [PATCH v4 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Tue, 20 Oct 2026 22:01:14 +0800
Message-ID: <20261020140127.720-4-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261020140127.720-1-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
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

