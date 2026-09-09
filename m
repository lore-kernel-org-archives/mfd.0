Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3CD3F105B
	for <mfd@lists.linux.dev>; Wed,  9 Sep 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946098; cv=none; b=rGbKpcrSHQrjJ7BC6TyX7vJf1qbkQ/nzgce9Mi3rddveElBcgYBXz9p8rIPDu3dxT5RbV4ZjizXHt0Ns1Ztu/4HSL/YmVmwXs0dHnBE35iTXFa2sGJCW0InvnH0KayMry96Sv5eEOHcxPGgJDxgBVtPiYyGLq5CXNwv4JV66zT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946098; c=relaxed/simple;
	bh=w1bKyQWKw8iEtesnaXqouFCOrAm6kxtFiyY3O7rUloY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkvdz6Fv9LLnIAFwGewFUDhOeEYw0T61GpVKyeLJSh0troYMejqBTfWnBMgZa/W8Pq/QbmPnhUvPJANR2pHm45xBI5ZKiX1ud91fCFrCbG7eiGUQ93foowdWllN+x42GzyWnQEOPXeLcBU3GeSexFm7rlwA0a37PMdyq6XjH988=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpFJcNJT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpFJcNJT"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-855d2bfae95so6488511b3a.1
        for <mfd@lists.linux.dev>; Wed, 09 Sep 2026 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946091; x=1789550891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=RpFJcNJTG7DYy0GLuANFOtP1paLuwi8s67Nv1QLnJk7yG1NS7ceJmx8D4BUpo6WuPs
         WuIxaUcAT6RPCZOE845AkQRfLsAFF6oe9B5HekyVGPT00b1AsIu2QQ8M3UTbVFPko1c4
         P8HE02dAlC4ZjyWrx5/jt5F3CNiOTyripvAeTG86GhuxbJmqwJ65QOIiGdQGvyL8jGEi
         TeNnNER9HGV1YsmolRkj+SPPsinOmnbhr499Nd2ZXDtagt/NesuD3+k+qa1Y3En5/Xb4
         iT6/XL9gS19f81EE9m75/yzy/NjC6oMI5iN1NPdF/J+GC7NIUO5pHTH9Oki5n3zMqnux
         lAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946091; x=1789550891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lj2u/Zjo691deIvNQnGk0TPSNETy/c4N8X1lSk8Bcfw=;
        b=YFkoQntEhpo7JekvhWr6gSTCEdAEPJyYy4s/kdlRPgaKDxmhXfzqXnCuHOPi2bQMIZ
         QvuttAvwo2WMpoyIHn+OsQ7rr73NN5c3mJ9RQlaF/vAcpL0Wu9R2sSD2YxvTzRwQTM5b
         JFq9pQEo5g/Hj6qOhlcseQks/5TZqrCXDBFUGc9JYEZGqm/GCGGJ1F/ArwQcc0okvogx
         bO8D+H971QT/DcB5M6Qzt/5Gj1w5xn539BqhNhIjbewTYxvNRdwOKPnqH/0PkBHlJsbT
         9m7yH0tHB7QeiTPXBO9/xUIvx4txbs+0f8QpcyjCA5EhwI2ImOCF+/UIAdgNdXIo9wKG
         cFeQ==
X-Gm-Message-State: AFuF++k1qY+EDYN+m9dZ6M6acOPDXOjCJldPCvtStHIROZcSZ0e0QO46
	+gPiAdBx4qAi+xSQ6ankY4sLdy0miGNQ8U/G++R1J867nLx11LX2ad4BkZgqUCPCrtb6yg==
X-Gm-Gg: AYBFou0QzSTOEuQw1oMWSkwQkDKamiALWZ2Qs8T9PE4io2KgK4TQ0zJXvQP+8IWlA/P
	vQn97Fyb7J0k9X920lYtxc1UtApWx+PQmqg4D57nEDN9IOny3KGuk9r6pS5tYRaS8geVme08BEZ
	ADjXbB1fdxYmDEr+pcdGOs+iBeKt9x1WTgNY2q9A9qOhJAKO1nqkQb3ADwO+nw9UnwPXJwyjBAb
	6U5mXR08OtNIuQuTGIsfp2J6GOU6/Jjv1VTvvi8DnYLsTHfLrO23SSEfnczhQWNJjMfvu9miw+m
	N5IaUAa2+/8bnpj6zqofYrM9woN/k7/c2GD6N6G22jI2Kuv667rbdNNlB0QG/wIq9iodsXjYg/K
	JZMEXboTB+GNzrj2DwaT9GcfqZUzB8AwM6V9S2aCe+ZjrjcXCmUuwqdf8cMdn9XKmr2ozSPpTPW
	z5NUEk3yMHGkDWzGQobJ3xqEPejg8WGC2Czh/mI1GsozqlvGn8iJyy7cCIcFK5oyeSjaqwWv5bz
	zn88CyyRwTr
X-Received: by 2002:a05:6a00:2d0d:b0:857:73c3:4468 with SMTP id d2e1a72fcca58-85ffeadd911mr33200033b3a.23.1788946091221;
        Wed, 09 Sep 2026 02:28:11 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:10 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] arm64: dts: rockchip: fix power-off on Firefly-RK3399
Date: Wed,  9 Sep 2026 17:27:28 +0800
Message-ID: <20260909092728.1859-4-yaozhonguwl@gmail.com>
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

