Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8088F418363
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436874; cv=none; b=La7adoBqSRE366dTlfSZGtlLN8Ti/d+PZnecskuOlyLpEaZXb19MTY0s1c2jpUI1pPnYYBPkiDTo8MUCQdMI9s3RslpVarcPHNwA6VJCDLULdx7hSv6pRrphSxw9mT/t2O7G0vfvmJXrl4OIoM1bPi6S41sgSCk6i9Nu7lgq01I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436874; c=relaxed/simple;
	bh=0NFMkiI9cGUJGQu0nU9aq2ncgiF85JLhExyubCYkRTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Accv1k5aKCTJxDb9Z3UPeiRKW9XVtKkeMxB5MC1hmS3HJqXFNYfF3tKuwlxhQHk5WBYeIX8H8ZThwV9BftrRnJ4v02St99WISayyLsgUhbgoqUPSY4gzH8c75Dm7t2JHICu/L7q9W1ygpQA+qp7fY3JzSCb6g7WA4pPk5slINHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rR9bvoBG; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rR9bvoBG"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so102607b6e.0
        for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 01:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436870; x=1787041670; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cY5JFkhr2MFK4a7Q8KfriRWA+QTcA2VyYLDaWVkulWM=;
        b=rR9bvoBG41oWniem9ZhKHR/+AWVEVud/FSjzUx7Tv8i6MyFJ42FbwxntKm/KZ0RKLs
         +x1WQWaX6AbC0E9v5S03SGWvofqkfF2pxmlTFLRXxloQBDudAwJWMBl0Q900tJWk+jEe
         yMkRhfw16OaX5s3yQMGYVizIuwlE2OeLkMz1TnkAcMQJuJHRDt0OXoJUo04ZjXXyoNsJ
         yVM2HHkx3P4EwNQalX3pdN9PlctpQ5FbaISp7rXPTyqYYlmzkspblxsr49DZio6aeXVu
         GJ5D1UN8Vvm75x0yjNEzCD2tUoiEiIxG3JNbfWnQHKoqjlu+cz2DAJnYBpFRjv14GZP4
         aKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436870; x=1787041670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cY5JFkhr2MFK4a7Q8KfriRWA+QTcA2VyYLDaWVkulWM=;
        b=DImFijAM0E+ZiQYlENN2pHFU2hTF8FGURTVOFohpvHo82FRCTIRz55L1/aiFbZOUDy
         j4NKsyYSKUDMoX8WfDDDgk9wrIdeuIKdhkxa4aTZaXCi8GHxOgrbH9EcmIaofVFCBbeT
         h7Ot5Jy5WjlhLuz82xDh585HSwGj++jbxtUzMBT8x7MNgEaw8Nh63bKMTdwMCmYoDQ3r
         68jr8Vfk7si+ABRfSOIXibXJMfe8NWcvy4HwUGMkD4wrOU2LUWaXvoWv5aO7RbG2iQeB
         1BVsZoAw4yyB5Fxp5vc79m2QooonPcfhWnxsmnWIZXSjj3PMB7RAcg1D1JgO2P0YNBuL
         BanQ==
X-Gm-Message-State: AOJu0YxUNC6duOO3uf9AsGDprPIF0Rp7tOAoY88xfzj4WYsOp48B05uZ
	KuyK6Q8wfsc4/dxLqTh8Y3/uBiksmq0mrEuPi/Gf1pAropj3VVrrHqczSUnVfH1C
X-Gm-Gg: AR+sD11j++qlPjXX6lSb30GW+V/ZOUeCaBSfDOFxtGWYqjd7T9sUEVQu5PX6UBft48x
	PmM27E3MMRBWlyeAKkAVrswnnB5DuzojYhzACopcn0LFu7vMAKq++kJNfomZwZhqbrL9t3+dqsN
	w/CZcrqpORxFvlbSqL2ye09s4mqz3ZSVTlSlvsGwcMTVTiDGGQnRXClsXWHSv5KInzySWbig9X0
	YWzeTzi1HP7nLuNWXnh3J9sS+gyayNkH78S9gCb84sB4fgeY1GsjPHmfA2SQ4WpiJBnqEUJlXzU
	0KeQuzWVa6jZKoTKYxga56fuxphXZzho8YHr4lqssxLsomrKM1GNgCMRZnFXwSlDgFcqHKLA3dm
	rGN1zbKfhUPcxc67635fa8flv3ds1JvQu3OuEel0rR7lVfqZWY7YjnF++hz/7jAVLZkPHKK0k1X
	Rva8HNBCo3a3F/l0+tQGRPUuNrCCaq0GVntEJGg2/PiqL0903xAFoPpAzg1l+EmwaT6CCMT+WSi
	DdigbwcpVHVC0HjQnvk5C9QU/Tyqfic4g8yTbv6rAmhqCI9by65TdEyA4VvTiSV5wteifJalyuP
	fW+ZaPdv07GKuX3yvIfis8uGbFXnvelHTuCJ8VyYjo1HgA2GiMnnDFdBMeV7Ug2UBYK9ABbapTp
	OGV/BpmNWP8tZYjTi
X-Received: by 2002:a05:6808:4f47:b0:495:f67c:d96a with SMTP id 5614622812f47-4b1fd77a01cmr907432b6e.12.1786436870348;
        Tue, 11 Aug 2026 01:27:50 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1fff55fdcsm318095b6e.6.2026.08.11.01.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:27:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 02:27:25 -0600
Subject: [PATCH v6 3/3] mfd: ac200: Add X-Powers AC200 support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-ac200-mfd-v6-3-c5b1292c8498@gmail.com>
References: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
In-Reply-To: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The X-Powers AC200 is a mixed-signal companion IC with a paged register
map accessed over I2C.

Enable the shared input clock and prevent its rate from changing. Match
the vendor driver's 40 ms wait before the first register access,
initialize the paged regmap, report the chip and package revision, and
apply common reset.

The Ethernet PHY link endpoint is independently enumerated on its MDIO
bus, so publish the regmap through managed syscon registration for lookup
through its AC200 firmware reference rather than creating an artificial
MFD platform child. The managed entry is withdrawn before the regmap is
released, while the function driver separately manages the PHY analog
supply.

Cache only the common page selector. Individual functions can reset
independently and invalidate their other registers without regmap's
knowledge, so leave all functional registers volatile.

Reset the chip during managed teardown and system shutdown. Consumers
can use device links to ensure that they unbind before the shared AC200
resources are released.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mfd/Kconfig  |  12 ++++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/ac200.c  | 170 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 183 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e4fd4572472f..f8354a0f6b5c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -205,6 +205,18 @@ config MFD_AC100
 	  This driver include only the core APIs. You have to select individual
 	  components like codecs or RTC under the corresponding menus.
 
+config MFD_AC200
+	tristate "X-Powers AC200"
+	depends on I2C
+	depends on OF
+	select MFD_SYSCON
+	select REGMAP_I2C
+	help
+	  Support for the X-Powers AC200 mixed-signal companion IC. The AC200
+	  contains audio, video, RTC and Fast Ethernet PHY functions and is
+	  co-packaged with some Allwinner H6 and H616 SoCs. This driver provides
+	  the shared register access used by the individual function drivers.
+
 config MFD_AXP20X
 	tristate
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 72d3944b0ad8..f8101d2a9ce9 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_MFD_DA9052_SPI)	+= da9052-spi.o
 obj-$(CONFIG_MFD_DA9052_I2C)	+= da9052-i2c.o
 
 obj-$(CONFIG_MFD_AC100)		+= ac100.o
+obj-$(CONFIG_MFD_AC200)		+= ac200.o
 obj-$(CONFIG_MFD_AXP20X)	+= axp20x.o
 obj-$(CONFIG_MFD_AXP20X_I2C)	+= axp20x-i2c.o
 obj-$(CONFIG_MFD_AXP20X_RSB)	+= axp20x-rsb.o
diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
new file mode 100644
index 000000000000..25066bb36ac7
--- /dev/null
+++ b/drivers/mfd/ac200.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MFD core driver for the X-Powers AC200
+ *
+ * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ *
+ * Based on the AC100 driver:
+ * Copyright (C) 2016 Chen-Yu Tsai
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define AC200_SYS_VERSION_REG			0x0000
+#define AC200_SYS_VERSION_PACKAGE_MASK		GENMASK(15, 14)
+#define AC200_SYS_VERSION_CHIP_MASK		GENMASK(11, 0)
+
+#define AC200_SYS_CONTROL_REG			0x0002
+#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT	BIT(0)
+
+/* Interface register accessible from every register page. */
+#define AC200_TWI_REG_ADDR_H	0x00fe
+#define AC200_MAX_REG		0xa1f2
+
+struct ac200 {
+	struct regmap *regmap;
+};
+
+static const struct regmap_range_cfg ac200_range_cfg[] = {
+	{
+		.range_max = AC200_MAX_REG,
+		.selector_reg = AC200_TWI_REG_ADDR_H,
+		.selector_mask = 0xff,
+		.window_len = 256,
+	},
+};
+
+/*
+ * Each AC200 sub-block can reset independently, invalidating its register
+ * contents without regmap's knowledge. Cache only the common page selector;
+ * this avoids a selector read-modify-write for every access on the same page
+ * without ever returning stale functional-register values.
+ */
+static bool ac200_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg != AC200_TWI_REG_ADDR_H;
+}
+
+static const struct regmap_config ac200_regmap_config = {
+	.name = "ac200",
+	.reg_bits = 8,
+	.reg_stride = 2,
+	.val_bits = 16,
+	.ranges = ac200_range_cfg,
+	.num_ranges = ARRAY_SIZE(ac200_range_cfg),
+	.max_register = AC200_MAX_REG,
+	.volatile_reg = ac200_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static void ac200_disable(void *data)
+{
+	struct ac200 *ddata = data;
+
+	regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
+}
+
+static int ac200_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	unsigned int version;
+	struct ac200 *ddata;
+	struct clk *clk;
+	int ret;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable input clock\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to lock clock rate\n");
+
+	ddata->regmap = devm_regmap_init_i2c(client, &ac200_regmap_config);
+	if (IS_ERR(ddata->regmap))
+		return dev_err_probe(dev, PTR_ERR(ddata->regmap),
+				     "failed to initialize regmap\n");
+
+	i2c_set_clientdata(client, ddata);
+
+	/*
+	 * No minimum delay is documented. Match the vendor driver's 40 ms delay
+	 * before its first AC200 register access after enabling the input clock.
+	 */
+	msleep(40);
+
+	ret = regmap_read(ddata->regmap, AC200_SYS_VERSION_REG, &version);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read chip version\n");
+
+	dev_info(dev, "AC200 revision %#lx in package %lu\n",
+		 FIELD_GET(AC200_SYS_VERSION_CHIP_MASK, version),
+		 FIELD_GET(AC200_SYS_VERSION_PACKAGE_MASK, version));
+
+	/* Reset the chip after dependent function drivers have unbound. */
+	ret = devm_add_action_or_reset(dev, ac200_disable, ddata);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG,
+			   AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
+	if (ret)
+		return ret;
+
+	ret = devm_of_syscon_register_regmap(dev, dev->of_node,
+					     ddata->regmap);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register regmap\n");
+
+	return 0;
+}
+
+static void ac200_shutdown(struct i2c_client *client)
+{
+	ac200_disable(i2c_get_clientdata(client));
+}
+
+static const struct of_device_id ac200_of_match[] = {
+	{ .compatible = "x-powers,ac200" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ac200_of_match);
+
+static const struct i2c_device_id ac200_i2c_ids[] = {
+	{ .name = "ac200" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ac200_i2c_ids);
+
+static struct i2c_driver ac200_driver = {
+	.driver = {
+		.name = "ac200",
+		.of_match_table = ac200_of_match,
+	},
+	.probe = ac200_probe,
+	.shutdown = ac200_shutdown,
+	.id_table = ac200_i2c_ids,
+};
+module_i2c_driver(ac200_driver);
+
+MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
+MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0

