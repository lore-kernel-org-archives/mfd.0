Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547680;
	b=pJ8fYHudT9TF2ZkAFVcRWIYe9QK2bOQ5tXrecfec+EXaB0LSjvKAkD72RDrFQXeRLk1c
	 1e/m2y1VVUYVUnimTq5dqi8+YCHpTmw0eah63aVCZzq/a4lnlyJw9NDdG/AjafpysstbW
	 FOoWqji8GU7iYcjjCdS/hUULbvKLN1Ap5KRZYADNJF+ynmCobGS0qNyo5N6cORPCESJpw
	 0qABMVbkkd9jj2zvENLhEqQkdtCe8/Tqgu5xRucY82LqKGR8qGlU/DNZfHbNA+Lf0NLPv
	 urOkwV/SkOdt+q5S9etH9Sj02WPkZfIAvPVOsaPTOSvxykQb5CJaKDtZqx0psI2V8Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
	b=1RSRRsWVE5K/IVTmlxGJx77B8PiGJpxDSpV0xJL6B9WzATldH34RMazDTzj3B6dkQkE7
	 yLYY+PGxt0XCN57HkXHglgELug9oEgCJsmRzOqokOv0aqzRdcjNcWEWU4/XE7+GMqipIk
	 ix+CJ/lpywq68VIVy3A3boYmFnC9Uf5Trva6Cn9j2GtC8ZWkz9WWb3jLz+KUJukZOBwz7
	 eFKzoAyFkKfuB8YFJxnfulhnKX691qb29Aptkfn78IhdsMLY0N4n51gplN815zKrvcPO8
	 CUlp1Tsmi+uhP94/7KpklsM/LxwZoETJHel41ZbUJrK14QB2Nj/b7F3VftCg/XfH98A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIZvrAED;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AA1606A327
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 15:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3AA1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIZvrAED
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1338621a91.0
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 07:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547679; x=1794152479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=aIZvrAEDuzVnbt21BEXo0zBmmGAAl/Ju3BoywtDU5t3/JJd1ZfMIZ5iuj6Oyt+6qLM
         D3T+3GrxyoAMo/khn4vbTF1Ful8dkXAgSl/DXE0U743s15rshxAtMcyufZHlD4rWljQ9
         aOaUkgnkfiuFD4y0+lJYhp/SRV8hOS/Iga8hhaNVm2Qgh5lqhTtPcWM2pY/WrU0ju3O9
         VSHzViP/TDKBXctqOmQ37sXtBYO7Sch30Oq5cnqze5CxhEzUjkUjdgkLTh752t9Kzell
         tLkPbRMjlXkKTLSK56JlP0gHIU1ZqL4gNTvTDFumXnleBl6hcje/wxlaWxgGZZLcBAdu
         RMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547679; x=1794152479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=LO5n858a3aMvkTTsU/eFiTcCT0hlJhZi9aoLE+2wzbbFIuXqdhJVInhzWIsnUg54bW
         0VY4XdUSQ5IvWCt3NIwFvDD/MtohZI03ZsystBbyHA6DwKliKXtL5DUGKnx3XCrcbJFE
         9qms410N+PPeON2Fs3D1IqRwZq7XX5cuPbo5oUMqg/273OUIPWr6Xx3M09ADb8PYuDEJ
         4sxVUP8+pXpBViL3EW/KeD4ZNXRR0pzx+lP1xRHr+IPO510+gR56yiqxZkkwjyKc0WJ+
         Xd+PAGyoJhSXCqxb2wtbEPnKkBaouwLunK4a7ZijwFr0yHjvSkeiM9Qi9qSZOmDI53LW
         HiNw==
X-Forwarded-Encrypted: i=1; AKwUvBysKyPmN/rTj/L84sJ1Ke4oBS1ZzAjpaZZ4M5YAcsOMbCEBLcpIQYE1Ys0++Vz1IvOBHWU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9OvL85mEpnjRqQtb/NVFBWudXZJ6gel0N4nyYdP9LBP1hw8fYa
	Wte5u6ujtZ4LM9rR9sxeknLjEC1mvFCZLsBcHGooaa4A4K15YH0WT6ur
X-Gm-Gg: AYBFou2MXbiCm1CVgvSrn7YSlro9jVlxnMlBEMkaKl5RcPd8YjmgaKlyYtDe6WSqJGd
	a4mNQ5knYDhFATCkS6IuAd99Q+M3X4J5AK0sHxwBmF816Cw8yq5pCCfy7eb3JyMK5nALJVGVthB
	+5S0PgssFSmE5C9+qwXecJCbRkDZBoNPM4Z/5vmnUtoYEvhdLn8A/Pk1JiwcAyapiHdnWOPFLF+
	k4fN81rQ+3NbEdJL0sRlV/HKgBZYUJ5mMqKaY+pgBbOnd/nMl0S6G0ospH4uSa9P9Kx2d5a8utf
	Oebospm8UuVR/dUDmGxp7hvWESVTmSj0OMKTIRVF12gQwvNrokJ/pKf+SUTgNu5tHwf4fbE+KLR
	fvMXyknrpDbp4NtBGoxqigo3sKsskniThSt1dSnSNgUBnwJurps5JErCle79VNt9TXkYh4GlCLK
	lGW9T0qUX5yaH+IJczBu19pwk4fSJTRCQ6Dz90R1zcVbVRWdUTZh5hsT8XNYP53mV+/N6aSSDpP
	bYGIATy1AA4fnbf+KH7Mb+izyqfyoBnC+EHxmOzM5fB1COa9qb0I00zEWoHJVPXjldsD2Qof+CC
	GTACA9aUmTjIJJClzavWPHqt7LyasOfFDui51IFwRQ==
X-Received: by 2002:a17:90b:4c08:b0:3a8:de1:db07 with SMTP id 98e67ed59e1d1-3ae8957d253mr6930512a91.5.1793547679213;
        Sun, 01 Nov 2026 07:41:19 -0800 (PST)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm10776958a91.10.2026.11.01.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:41:18 -0800 (PST)
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
Subject: [PATCH v6 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Sun,  1 Nov 2026 23:40:51 +0800
Message-ID: <20261101154053.3874-3-yaozhonguwl@gmail.com>
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

rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
lines driven by the SoC gate the PMIC's power-off path, a shutdown
performed this way does not stick: the rails drop and immediately come
back up, so the board restarts instead of staying off. U-Boot reports the
result as a power-on reset.

Take those lines as an optional GPIO array, hold them asserted while the
system runs and release them - waiting power-hold-delay-ms - before
writing the shutdown bit. Device trees without the property retain the
existing behaviour.

The array is claimed before any child device is registered, so that a
-EPROBE_DEFER from the GPIO provider does not tear down the regulators,
RTC and clocks that devm_mfd_add_devices() has already registered.

On a Firefly-RK3399 the shutdown stuck when such a line went from high to
low before the shutdown bit was written, and did not when the line was
never driven.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 49 +++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/rk808.h |  3 +++
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6ab..137ab20 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -11,6 +11,8 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/rk808.h>
 #include <linux/mfd/core.h>
@@ -703,6 +705,22 @@ static int rk808_power_off(struct sys_off_data *data)
 	default:
 		return NOTIFY_DONE;
 	}
+
+	/*
+	 * Some boards route "power hold" lines from the SoC into the board's
+	 * power circuitry. They have to be held asserted while the system is
+	 * running and released before the PMIC shutdown request is written,
+	 * otherwise the rails can drop and come back up instead of staying
+	 * off. Releasing them here rather than from a separate handler keeps
+	 * the ordering against the I2C write explicit.
+	 */
+	if (rk808->power_hold_gpios) {
+		for (unsigned int line = 0; line < rk808->power_hold_gpios->ndescs; line++)
+			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[line], 0);
+
+		msleep(rk808->power_hold_delay_ms);
+	}
+
 	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
 	if (ret)
 		dev_err(rk808->dev, "Failed to shutdown device!\n");
@@ -766,6 +784,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	struct rk808 *rk808;
 	const struct rk808_reg_data *pre_init_reg;
 	const struct mfd_cell *cells;
+	bool system_power_controller;
 	int dual_support = 0;
 	int nr_pre_init_regs;
 	u32 rst_fun = 0;
@@ -851,6 +870,33 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (!irq)
 		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
 
+	system_power_controller =
+		device_property_read_bool(dev, "system-power-controller") ||
+		device_property_read_bool(dev, "rockchip,system-power-controller");
+
+	/*
+	 * Claim the optional power hold GPIOs before any child device is
+	 * registered. A -EPROBE_DEFER from the GPIO provider at this point
+	 * costs nothing, whereas deferring after devm_mfd_add_devices()
+	 * would tear the freshly registered children down again on every
+	 * retry.
+	 */
+	if (system_power_controller) {
+		rk808->power_hold_gpios = devm_gpiod_get_array_optional(dev, "power-hold",
+									GPIOD_OUT_HIGH);
+		if (IS_ERR(rk808->power_hold_gpios))
+			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
+					     "Failed to get power hold GPIOs\n");
+
+		/*
+		 * The settle time is optional. rk808 is zero initialised and
+		 * the binding documents 0 as the default, so an absent property
+		 * means the shutdown request follows the release with no wait.
+		 */
+		device_property_read_u32(dev, "power-hold-delay-ms",
+					 &rk808->power_hold_delay_ms);
+	}
+
 	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
 				       IRQF_ONESHOT | dual_support, -1,
 				       rk808->regmap_irq_chip, &rk808->irq_data);
@@ -872,8 +918,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add MFD devices\n");
 
-	if (device_property_read_bool(dev, "system-power-controller") ||
-	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+	if (system_power_controller) {
 		ret = devm_register_sys_off_handler(dev,
 				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904..e56d595 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -15,6 +15,7 @@
 #ifndef __LINUX_REGULATOR_RK808_H
 #define __LINUX_REGULATOR_RK808_H
 
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/regmap.h>
 
@@ -1466,6 +1467,8 @@ struct rk808 {
 	long				variant;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct gpio_descs		*power_hold_gpios;
+	u32				power_hold_delay_ms;
 };
 
 void rk8xx_shutdown(struct device *dev);
-- 
2.55.0.windows.3

