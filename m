Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505016;
	b=0ECi6zzpuThgL+YeA+yokrxSFbGiOsoCQqUktREQUK7Rysju0WO18TagD/i41hZVxWWf
	 kse/XOZ8z7B//89Prto6JGAXzzujGYfjGy3fruc5AMeH6T8LfJo2pNi6YFdJOUI3qppCx
	 FVGMOudCD2+PITQql1MCGT/4r2D7YlbEHAAlWYIf38hVFMghcMqA8+QaYsn4wGlRdjiyb
	 HLUK85rPRT0c6Dk7vFT8FhwFXc7TJMmXWn+yiDD0BD/4jj+z6z1jk+LiMLDwfCs00odnP
	 WjEoZVwJXEj+2cbRpS68Watal9Q/I4Jjasf4pgt58NjN2dSmGOLpecK2ZsPs05UEH1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
	b=xuXDw2SSgh4aozZPMPwbKAmAWDg4HK0mJ4O81Mzm5uNYb6f//EICLvWFfzlCddyzmNLx
	 7630HByfBkQUw0N0he8XZG+beegsYZ9hcSkcmzKcPc7YstdGClXovHQOXe/gRuR1elyrY
	 MiTv00bdoEeGAke4GnfSyUj/9FWZqFjc2tcRYR4xwYnPWtZi5+NSTGzR888BfQQ7xPxVz
	 iM0aWLHEhgrpyZb4W4FDJLbYPTd0D/JHQW6OhzGLJf0CuzbkveTgrDYiQ5JoevSuenESq
	 6F/CzeEhumvjbcIf5A5CQ8rG6uo6Hom5L47Pw+B+aiPtFoNqGNCtpj3KNBmstcNZ8Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ppSG26Yx;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BC5606A31F
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 14:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BC5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ppSG26Yx
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9ae391a05so4843855ad.1
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505016; x=1793109816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=ppSG26YxsfVlUQmqCPY04H5TVoAyRCr9mrs0pIxu/jFRftTc3g3/8sIbaOkWIW2lrW
         PiQgFM+pkXbAEdu7ehKeYfA2iGu8EBL46aAlYK5ityoDz9QD6730qCE+T4Wf0zO2W1oy
         tPvsfsZ6AZJaICiKT3y3B3kukrLOEHb375X/WR1RMjc0nDBYC1zij2VLEpHz2O5SoALx
         Ww5gyPvMrV95SILb6zmLISaDLOT4GAqK6bnNsM51rWwdJxljh5dkMgCdyGvO/aJMVemr
         GnYcqZCi34mEAuO516OR5S7sDSMJ8/B9rWc9pPT+TUDq4PYgLyVIf+brBzNUFmyEzdCV
         jk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505016; x=1793109816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=B20FXCcWvty5cn4EkNItBgBbkDfnKQY35uwrcjTU9rx/x+iavJ/UHT7h5va5oyhj2F
         2fI6R3E445g6OR2V/CP0SQSA/0EaDHaPxccJ0gnqNwSZMlAjnY2wsvv68Xb1Nk75cUfg
         Q3aReVh/CGI1XENmRWoKwG1hM+SiAba1lUcDtq99IRQcRM+M8Odng3hnDdLnx/j4u1w+
         0cmENBbUT5M43dfqLBvYu9MU2Gv+8eN1QGefN+yf8GakKaWW7BsMnQPUkNPnQ/52yQjt
         psTdRRNVfuwI39XnTBThXaiS5uUdd5qOMKh1GfwRlA8yBPMcKJC2Q2loX1GmqrW/8ooH
         +aVw==
X-Forwarded-Encrypted: i=1; AKwUvBwZAyCXbdYWJF3mtOmX5LigInNRt1AXjSoTCa84LuPn9mbljDcKOZkWOZhgIKiVyqQxRb0=@lists.linux.dev
X-Gm-Message-State: AFq9FYIr1jj+OsZophoKfZ1rJI81r+pmNNMXG3pzD6b/W9bs9vO4P2qT
	s5Hhm6xe7WRT1JqbbaOAUMFgOkxlPrhRuLBVyJ8yWbT3z54teyBZ1YWf
X-Gm-Gg: AYBFou0hkkCMJrAgTko0fLa9XEHp9X0o81O8DCId4h451abYeD7c+qP5T8dfzLi/Dnd
	jrkPtRUNaqWBt/ryPYPUaE9csWMQLW6ynDNkRD2+JUxirkuwu+9eLjTyz4QlfWlDuxch3xiAJ+L
	RlSZjyyvUXP6AV5A3Q2jcVAv8Ac7K9ThK+YdqSHjV0s2FihAbsKuNPUZPcRn6dEHIMwhhb/xaf/
	oGLXPOJvjCQzSg9s/hZZ0LExila1RNHVSrfcnIY+KT6E0QyS1wtR0vBlW9+sDqFGUVJN4DRI6kc
	l2fIgvwxiIEDH2F8+e3XaZIS2PKP1v5dg5p+7yI/D81W5DcF1ap/znekd4Rr7OCmVRnNfhZYxSS
	s+1NwIc27jV1NbklhTqDjL2j5jyO5X+xJI/k5MJur/KfgBGYRAx5cNgCACPz3OJyePlvAVi/L8Q
	ijMmcstDYiiz4cBcS4Dsd5rjNXEDHYu9qiKY/JF7hNb1DoOCb0ItbmuJ4YwoY/ZY2kdJekxoaTo
	HYY2snLhak=
X-Received: by 2002:a17:902:dacb:b0:2ea:1e40:624 with SMTP id d9443c01a7336-2ea1e400e03mr14007165ad.17.1792505015392;
        Tue, 20 Oct 2026 07:03:35 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1502971csm12434865ad.51.2026.10.20.07.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:03:35 -0700 (PDT)
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
Subject: [PATCH v4 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Tue, 20 Oct 2026 22:01:13 +0800
Message-ID: <20261020140127.720-3-yaozhonguwl@gmail.com>
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

