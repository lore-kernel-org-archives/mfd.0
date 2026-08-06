Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180073AA9F8
	for <mfd@lists.linux.dev>; Thu,  6 Aug 2026 01:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979475; cv=none; b=ercECAN/mjH9bcrjainxgP2Hq8FXoO1s7SHRwQxI4awY8v3esv4B4ZdUXgkOQNp4Qg2+MOiQ2CVFdo0t1Qw20L72qDamL7ahE5AkFpbbEtls45GpTPcCfXkLo5EWujr4aQ7cdo4XgomZpQ6VAxrMdRLSOkvxscH8IBiHMz5T+f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979475; c=relaxed/simple;
	bh=AB+ChzbSG0qbbMuxHlKyL5j0yxNAkhSFwmVXgKWbYJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S68o6Is4D0c9Q20behwFtJOk/5X3GhmJf6DtZEUIDqAxhQihkRt4Ar7K99U083i0qTf+gvrILSUHixXbknj96wMuOpdgf964k8pMDt3Mg/05/BcXd29xm3vOknWdPvvxvRP+2k/kccm46W+qxrMG7XH1T8r/47u6MFmLL3GOTSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNWLDQYH; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNWLDQYH"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a483a552efso722068b6e.1
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 18:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979472; x=1786584272; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTvV+jnBddYo2hXyHAzQHFHbxK0ktMP8zQ5j/EwHS9w=;
        b=aNWLDQYH6WvEGazxKzyD3p8jP83qM+39IWmTnbI/CgN5bNAMYEPlLoPXQ1PE3Y0gsK
         FPf0E+A+SK3xmUv9f/WcqRxsjjvWrvNvMeeKnp0MWaflT09e+QUAfD+Upt8bACH3ZWpB
         IuZAvIdA14Dh+Kp7O1IAiBddJfjlCDBt2lhfK6FvqdJ5QF2cROlLPYLy4rT8e3y9kUMz
         CTA7MCHjScRcl7eyS8Bonbr5JErBVYepgBXp/1hnLAa2rsBFwVvNrC0j8ZW62+p9jSRk
         +yrwHZd0hGtiOT5GOy/KQYFcsl1iVMZSeEmOnSmWDcyWLHGucryHFDpCB2MOymTwqbTy
         4Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979472; x=1786584272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTvV+jnBddYo2hXyHAzQHFHbxK0ktMP8zQ5j/EwHS9w=;
        b=MwYGDO2zI4R0lw7WTnsG015cHEKEEtth7EBn2OYLqCBiqyHMUXuublwHLN8mMQCYZe
         RUJpVqW1v8HnZ7vGRouj8HwYgvYte7uBPgj1pXALLz0SRiiVWIhf/U3c0LrD6+d3UTOn
         zZUL+HvUsXo9taPMB+mvT1ufCZqTyQFfFk3iWP0p8GiyD17Yn2lm71f7z/8+S7bm85vt
         9u6Cwavu3OiMQNQ+dKglCMu+CBD5l13f0rakR40j2rCxs9hZfi98Ghb9/u/WTS9DlCCs
         UAKxvI1eQIy1kKmh5sRmIwiehmt6Zdh05oYlx4xoz6HKvXKHEfAC63NANGciMw/ptOak
         eU3A==
X-Gm-Message-State: AOJu0Yy4Nkuo6jtVbB4YdXzP3BqABAA9wBE0P3PK68mG404ytH9GrdeI
	UJuUBZmCT3fUv3I9TqteY+vDL4OJSJznDxTmSPvos55usuHXfCsxArZC
X-Gm-Gg: AR+sD115TBX4cVx72aqN6nswaTvyJ1k1y/0PMchT/TYB9xkxkdvIYw9SF3baR4EDAdk
	hEHuvBb2tGec6ymBNjpcBAoKS2yG7AvY7t9yTYBFSrGrf/innBzkrHQqfWXIzBmFTFYlujM1WUU
	FjcY96B1JZMFUoeUpJOq60MvpSdQ+5+6zmQVLme9uuNlNoi9LJfIca1xLb4jukC6fetbNxkfMyR
	VYKEBdxVc/Dsor5x4IT/hv0mZ0gD7M50ZnTYT/ir++k3okzlXQjkP4tTbgrhhs47ai7mSi9FMb2
	zbIh4Oyd8tjWVwVSOHBTIzyol2oaI2MT57JDBkQ813EZivG8QxmHvF7t6PEhryEZycZNqgPP9EW
	CDnn5O46tnzS6fjHE6/ZpmsJx/nyt2rEOqciHlPdKd7RD6zKV9jriH2+pkWKnIUFiYJkK1ADEtA
	7b6JKUkD2PEeFahXR9W7kWJ3Q31eRZVy1xxeZ5dylULgnNFS9c9qhfmQrJfEtg5KDx9ZM6X5Z8g
	mqG5aOLXmJg74Vq0kH4BecxeogWE6fLLOQ6wXl87kKRB3PiDcvhsjhXcUzsDulqM/GhYaOdTO6e
	i6tHZxa+Bmt8FFdKX52V4yvr9w9d+hCqzrIKSzHkeLKLL12/LBB1rU9DAXO1hwfG4A9RdlcGHx9
	Hf1fxkM4lF9OG/th0
X-Received: by 2002:a05:6808:4fd3:b0:496:2b3:ae71 with SMTP id 5614622812f47-4afadef488fmr7444913b6e.18.1785979471871;
        Wed, 05 Aug 2026 18:24:31 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae75db20sm3274755b6e.14.2026.08.05.18.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 18:24:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 05 Aug 2026 19:24:19 -0600
Subject: [PATCH net-next v3 2/4] mfd: add X-Powers AC200 support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-submit-acx00-of-dynamic-v1-v3-2-32c3210a6f25@gmail.com>
References: <20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com>
In-Reply-To: <20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2

The X-Powers AC200 is a mixed-signal companion IC with a paged register
map accessed over I2C.

Enable the package supplies and input clock, prevent the clock rate from
changing, and apply the vendor settling delays around common reset.
Initialize the paged regmap and report the chip and package revision.
The regmap is available to function drivers which reference the AC200,
including the Ethernet PHY package driver.

Cache only the common page selector. Individual functions can reset
independently and invalidate their other registers without regmap's
knowledge, so leave all functional registers volatile.

Reset the chip during managed teardown and system shutdown. Consumers
can use device links to ensure that they unbind before the shared AC200
resources are released.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mfd/Kconfig  |  11 +++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/ac200.c  | 184 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782..499269c85812 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -205,6 +205,17 @@ config MFD_AC100
 	  This driver include only the core APIs. You have to select individual
 	  components like codecs or RTC under the corresponding menus.
 
+config MFD_AC200
+	tristate "X-Powers AC200"
+	depends on I2C
+	depends on OF
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
index dd4bb7e77c33..890e76a9ad00 100644
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
index 000000000000..e8346a3faad5
--- /dev/null
+++ b/drivers/mfd/ac200.c
@@ -0,0 +1,184 @@
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
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
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
+static const char * const ac200_supplies[] = {
+	"ac-ldoin",
+	"ephy-vcc",
+	"rtc-vcc",
+	"tv-vcc",
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
+static int ac200_disable(struct ac200 *ac200)
+{
+	return regmap_write(ac200->regmap, AC200_SYS_CONTROL_REG, 0);
+}
+
+static void ac200_disable_action(void *data)
+{
+	ac200_disable(data);
+}
+
+static int ac200_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ac200 *ac200;
+	struct clk *clk;
+	unsigned int version;
+	int ret;
+
+	ac200 = devm_kzalloc(dev, sizeof(*ac200), GFP_KERNEL);
+	if (!ac200)
+		return -ENOMEM;
+
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(ac200_supplies),
+					     ac200_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable supplies\n");
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
+	ac200->regmap = devm_regmap_init_i2c(client, &ac200_regmap_config);
+	if (IS_ERR(ac200->regmap))
+		return dev_err_probe(dev, PTR_ERR(ac200->regmap),
+				     "failed to initialize regmap\n");
+
+	i2c_set_clientdata(client, ac200);
+
+	/*
+	 * No minimum delay is documented. Match the vendor driver's 40 ms delay
+	 * before its first AC200 register access after enabling the input clock.
+	 */
+	msleep(40);
+
+	ret = regmap_read(ac200->regmap, AC200_SYS_VERSION_REG, &version);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read chip version\n");
+
+	dev_info(dev, "AC200 revision %#lx in package %lu\n",
+		 FIELD_GET(AC200_SYS_VERSION_CHIP_MASK, version),
+		 FIELD_GET(AC200_SYS_VERSION_PACKAGE_MASK, version));
+
+	/* Reset the chip after dependent function drivers have unbound. */
+	ret = devm_add_action_or_reset(dev, ac200_disable_action, ac200);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ac200->regmap, AC200_SYS_CONTROL_REG, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ac200->regmap, AC200_SYS_CONTROL_REG,
+			   AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
+	if (ret)
+		return ret;
+
+	/* Match the settling interval used by the vendor initialization. */
+	usleep_range(1000, 2000);
+
+	return 0;
+}
+
+static void ac200_shutdown(struct i2c_client *client)
+{
+	struct ac200 *ac200 = i2c_get_clientdata(client);
+
+	ac200_disable(ac200);
+}
+
+static const struct of_device_id ac200_of_match[] = {
+	{ .compatible = "x-powers,ac200" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ac200_of_match);
+
+static const struct i2c_device_id ac200_i2c_ids[] = {
+	{ "ac200" },
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

