Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090752;
	b=dwibdubn+6EO9rtD1QNdhiRfGXf6WuJNBcl0Ef3m4KXz6rHgDF6+1vgrWYVXX5GswOWd
	 gc1KQ6BpvYxA2F+UizYnTvnD16aE4n76p91X4udcUAV58ziVc+SCPJ9nAmawdnbMMF7C7
	 3UIGQNYlbOPNVzDAXUy8lMQfLV5XG6m+zDGSWRsRY+C6CjNQe7YgWk0sBgZ6d9GCijG4I
	 IdeprtujOivwoIOFHuDyzwwQ/8zsBcWvIcva5lnae1yy5G7IjuwGcFDCFZIWDm6i9nonh
	 +g5mYJHWap/oLb5Y/GNsKdTPW7kSpzQPRTv2ak133265Pb+85uhUaIdlLuSUOkqlxwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
	b=UCUOw6yPuS60H1R2tlAbEaOK1t7epT1uZMBcyEH8vhOJOqkUb230Vn2CmYmSmA9DbWjV
	 QzDrKoJo+2VteWIwJhg/pb3isovE21CZSCOWlDdJM+Q5eVtR7JEEtytO0TUWQEt9b7Sp0
	 92tZzjO7ggymzafKUrsEeM1caRbCrSPnejD3bFXEYPWB9LMSyMhRC+pTuRbe1tvMG+lkt
	 y2QBCfxSO2pkbyt80ro0eaacBsynCUMws4QME+w/X6z1oBtB5UJ6i1aLN8oYytGS8iBLB
	 mCsEUrFFHfDiS749+myiMxTrPMqGSInmqte9l8eH9PQ3YLF0689gbBpnstNIBnIumYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r6Z1PIhy;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9E6606A31B
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 08:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A9E6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r6Z1PIhy
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1899452b3a.0
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090750; x=1793695550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=r6Z1PIhyv3sH3ezmsAjEyQj5xHaBv1FIYnPF4yYjpWo9UAOWGgDMcCf2+of+sjnhGg
         VZXl+KCoMgftBzqY6KepztUEFGm/dT0tW5dKKlmLls7pp9ENNCfdcNRDISQnEmL22rrj
         3ixWOvt7HANxSQdU8fFJVS4GhZWI1C+T5k1Lk6ftsgnVlBCkp5bSDsmTpJ/OTa/KbVgk
         Z4jySXiRjtHaRzaZOmio1t2smeQu1u+EPpoyZ3WPfUoMQxiD+XG6bzcmqIDOl5NqsHcZ
         BQT3cqBO53gDX7a0IaK/GFQUz9Gl59h+3Kilb2L1Tgshnnqsc9cLjyuYdu9xyg55HQQz
         eluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090750; x=1793695550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvmhxSjVHj+d9pk6ymL8DlmUjvcSTE0G8stIvyswo2I=;
        b=JU/uyVhuQOeI549eXPWCfBfZeGN9LZMiLOk5LrxOuK/sZUsBTR752dRf5bycxTphMU
         mfUKSM18aArUeQEA0h7ixuewnIh+vPqeCCWFkJVZ4YyKQC/wvtt69EaWmkLCVnIo3ZI9
         4waSJoGGaivRMQ6eejpYN8Rbt3O85ypN+YxWmU6ck1WWRINXpdCj131E7wS0CbgK5a3A
         8WTmeAeiTgzVyAbubH6naRy3V+OHh7ahUUCHQ5q0KzToNC0jp5OyhIMNLheZIArOyEeu
         DBl840wpYb+WgfN1nYTzlvVWh2q+ILdZmY3/ZAWHXXeoKmbGCYhqo08TdKCdrq4PndDX
         PmZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5i8PzFddbcPc82jJPtrPMbUpUJCHDUQ7Gqp+T1hSakhjq/s2zEKGH97my+zhJjpO4zPg=@lists.linux.dev
X-Gm-Message-State: AFq9FYL3Inz11CAhdok3gD0xaTKBEuvTitWfMnTkGWhbtK8nTB96nws4
	0kySSZNuthTKVBxftLktUhan+MH2AWhTHAmEUBErcHT6msjzmoPl2FXG
X-Gm-Gg: AYBFou0cJATy3mi/SZoQXE2f04yMFK+I+/3N+DsPM4/OvjKYpRsSfdZjMWWcDsmzxyA
	v8P8wfqHTBTk7QaEJqMQezOUarJ1rXn3qx9No8mDCg+DlvJKRkW3oNjrnflBD+ybc4C1vcQvNjY
	K+uP7gJviuxtybeNKdB2TRZaHeXOaLzakVl8NW03wJx7RE+x1X97mnV/9QxAajJ1m7TB9rIzpEn
	fz7iAArSnVzfGjRhbkB5Fud1rrsJnuvAQU47pTs2VtExg/rsZ6AKu80ikWvDTdaBTU6P/1N5aZj
	T96frOtBX5o6yLyB51DjO9HuPLPzatTvoL9STpJHAmR+7ndv5BynBmaI9lBeJu2vQ+pfbZ9lW+C
	5QGIgb5PXSR9bw5Rnl0tWshx3ALoD7nbPGKxgGEBchsp69rfrxZlA0FTDjRWAFGxsT7yO6Ea0u3
	l7m9AWU2oaaXNbQ1gdolF3Q+vcxXOI4u9507Kfu/bSpaiDZJDoVWnlz93044tQPrIEQPYu/+z0t
	aXOph53ItHYsPheO8YeJXTzt9MRdXeqotCAXrs+Kw6XILM1lJvcnhPUgFCpXE12SthI
X-Received: by 2002:a05:6a20:ef03:b0:3e2:11bc:6abe with SMTP id adf61e73a8af0-3e7bfa20295mr5839714637.32.1793090750034;
        Tue, 27 Oct 2026 01:45:50 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm267581a12.10.2026.10.27.01.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:45:49 -0700 (PDT)
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
Subject: [PATCH v5 2/3] mfd: rk8xx: Release the power hold GPIOs before powering off
Date: Tue, 27 Oct 2026 16:45:08 +0800
Message-ID: <20261027084511.1992-3-yaozhonguwl@gmail.com>
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

