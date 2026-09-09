Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2F3F1059
	for <mfd@lists.linux.dev>; Wed,  9 Sep 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946095; cv=none; b=f+/hUDGHZ4BCQm3EhILlH0iar40I972Hb7Vkmd7VTHmaIGBq0ydScjKhuAJBzAhkJlThInntxzpim+fx+lc+EwHbjwKXu8z7ljAmDHc8sMSz1IxYdjymuo6LKgGUB2PQ3fcby7MAq0hQ+Bh2EnqIBOCF5sJbKLLjy/QoqbN1z34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946095; c=relaxed/simple;
	bh=UUhxKqZWnSTmT/Un2Yj1DpmBpGKjhHwwgtjv+edXRAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wr1MqvDJmEwjcKXf1/NIO+DZ76eW9hXS5myNCiXJxJ9ZMmCVjhrcE/oNXorraSir6yuQJTYXhnEY1WYD4D+bOUKCKSyUrEQ93GXIn0UL71tlq6mDFWpZpPIom43GnrndZKOMIUsYYI0izDn/aHpeH2TuV1XJmaLEACgPZQ7+9Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ii5wHBMw; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ii5wHBMw"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8692be1cda4so115023b3a.1
        for <mfd@lists.linux.dev>; Wed, 09 Sep 2026 02:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946086; x=1789550886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDCh3/bMgci4uGVV65c5lJe37gL3Ra631LoM+SOniZI=;
        b=Ii5wHBMw8cFs4AjoWlF6zUn0HhLeUw+g3J0r6x4UGymRl5dZjaLOVINm4m9zGoOt+R
         ybokoKhHYIA+7lq63fPuh0JP1okNGALm57AYotmgXXE7g3uYIGBmiqSQMdNHWWztv3S/
         ximohYeXA7zpDUzKcm05nx+mOsrOt26/A5iDEkPToz8bS9HBml2Mp8iCQKj2zUwdFt6d
         SJMtv/fryD8vmsCmDCz+nPzUtyfOqWPBWP064q3JGRCLs1zCGPuyJ0gYjstfqMAZX6ZB
         slTmILCd659wXoh6MpJZjXk98VEjp+kzvstNU8He1y6EE/sLg2D8sFxYEUyJGWIdgjxj
         ltPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946086; x=1789550886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDCh3/bMgci4uGVV65c5lJe37gL3Ra631LoM+SOniZI=;
        b=NMUQ19mvyg3Zb0BobcC/2VNLZmkqVHtr6KhnMIG5EOeO3y+yJdBtrjJqmAHMddNgRx
         WO+B8gRC/haWjU6VWpuS71Y5xKEQQiLfTaPg3vqAbVzTNJO5tPCWJ+1CBLcw3VEGiQs6
         tsn7bvc95e8UTKdYYwq/2OpSJhPKNdJ2uG3OwaDylzCmWkVemMdGtY88T8lfL8NTXcJp
         SYtZynnGhPVpmHosx7loTgjyDsHA+995JAejHN3zTbiaYGufOslmUSDTHk9mTD05Ebp8
         Rmz7/ghG1o9GBQABtlAwte7r6WkojUzUhM4zsE37qHM79ux53DD0yW1be5BIjEBXNNO0
         jYYQ==
X-Gm-Message-State: AFuF++mX1bcS3l8vhK0PlA6VQkEwgMa4cp1mwCpFX1F/HNpegYAtXDn6
	vgwUEJzqGaHprpf84q/EKu8SOMmCwBL80s/afkxEVRvMGSelRTEAY0dk
X-Gm-Gg: AYBFou1Q4R+T9M3pDd8NQ+lTT41elLjkKqE+ZMuDGwTctHX3+dKiyKTpgV7vO4OJnhU
	L9dT2dNl2VN+g+N9ZKwMqeFNbZrU5vblEpdaC/k0ThdaNbwwL49Lwh84IB6wkgrBYrcHzciMYtF
	D1iJu7N4sWI+kiwN58/0KrARnRMXe5hyWdjFfz0b0FJ/Atghg/vTk8uKFpb1hy0/vWpxf+q2Azp
	HdPFyzUkYhqwtXOd+d7Xhc1/AaQORyM+TLxHtZIM+lLv1H91fejBvG3dRnugST9VM5t9MZcB9Gi
	J8sSD7yqKb5H4F/zeLrGOHWpimMzpmySJWtniEmcTJKlMgGAftijJL8iwZm5AYupsIu9dfR8n/k
	XE+9uzG0AP/V0HUt0qPYaF3x2Ik0kgXLWZmjCwoNb/RO+RwVDovkNkyqR8I1mmTEOLCZ9c+FMOS
	8JbcUokwyJ+p8+mWUyiV6l3ah/dtMtGC0fRb2R5Wla1SnB6vSHPUWXaBK3iKuapqeo0DiaQSRoB
	p2pD7d0AhXO
X-Received: by 2002:a05:6a00:4388:b0:857:7317:cff2 with SMTP id d2e1a72fcca58-8616a266f1bmr50402873b3a.19.1788946086204;
        Wed, 09 Sep 2026 02:28:06 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm484904b3a.22.2026.09.09.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:28:05 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] mfd: rk8xx: release the power hold GPIOs before powering off
Date: Wed,  9 Sep 2026 17:27:27 +0800
Message-ID: <20260909092728.1859-3-yaozhonguwl@gmail.com>
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

rk808_power_off() writes the PMIC's shutdown bit directly. On boards with
"power hold" lines driven by the SoC, a shutdown performed this way does
not stick: the rails drop and immediately come back up, so the board
restarts instead of staying off. U-Boot reports the result as a power-on
reset.

Take those lines as an optional GPIO array, hold them asserted while the
system runs and release them - waiting power-hold-delay-ms - before
writing the shutdown bit. Device trees without the property retain the
existing behaviour.

Releasing every described line matters: on a Firefly-RK3399 the board
stays off when both lines described for it are released, whereas releasing
GPIO1_D0 while GPIO1_B5 is left asserted makes it come back up.

Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 drivers/mfd/rk8xx-core.c  | 29 +++++++++++++++++++++++++++++
 include/linux/mfd/rk808.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6ab..fd1efbb 100644
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
@@ -703,6 +705,24 @@ static int rk808_power_off(struct sys_off_data *data)
 	default:
 		return NOTIFY_DONE;
 	}
+
+	/*
+	 * Some boards route "power hold" lines from the SoC into the board's
+	 * power circuitry. They have to be held asserted while the system is
+	 * running and released before the PMIC shutdown request is written:
+	 * with any of them left asserted, the rails drop and then come back
+	 * up. Releasing them here rather than from a separate handler keeps
+	 * the ordering against the I2C write explicit.
+	 */
+	if (rk808->power_hold_gpios) {
+		unsigned int i;
+
+		for (i = 0; i < rk808->power_hold_gpios->ndescs; i++)
+			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[i], 0);
+
+		msleep(rk808->power_hold_delay_ms);
+	}
+
 	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
 	if (ret)
 		dev_err(rk808->dev, "Failed to shutdown device!\n");
@@ -874,6 +894,15 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 
 	if (device_property_read_bool(dev, "system-power-controller") ||
 	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
+		rk808->power_hold_gpios = devm_gpiod_get_array_optional(dev,
+							"power-hold", GPIOD_OUT_HIGH);
+		if (IS_ERR(rk808->power_hold_gpios))
+			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
+					     "failed to get power hold GPIOs\n");
+
+		device_property_read_u32(dev, "power-hold-delay-ms",
+					 &rk808->power_hold_delay_ms);
+
 		ret = devm_register_sys_off_handler(dev,
 				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904..eda111e 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1459,6 +1459,8 @@ enum {
 	RK818_ID = 0x8180,
 };
 
+struct gpio_descs;
+
 struct rk808 {
 	struct device			*dev;
 	struct regmap_irq_chip_data	*irq_data;
@@ -1466,6 +1468,8 @@ struct rk808 {
 	long				variant;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct gpio_descs		*power_hold_gpios;
+	u32				power_hold_delay_ms;
 };
 
 void rk8xx_shutdown(struct device *dev);
-- 
2.55.0.windows.3

