Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131812;
	b=O2aUYeNW3hnhotaT2BhhTfO5eWdvyVYrVi1JUxvnfFP3KEMBtaMj60g3KQEYYX8cFs/o
	 +BZ4KpKvev45IPTeelJS2XEiHlR1dX2DkDlPg92LCKHS2PXhnPThPmGv4OtoVQjj/5hga
	 Qp7rOcNKXVq7BdyYDuBX7tNUBIRb3erWRIguD88xxFgBHAXCYZpByEYg+6Xdd21RCfbV8
	 iQA2phJjYY8Dlza+Uma04xQWsx4+ll4D4ELxdpIwch65JFcotjhTfZPFgMI2oR6r0vJto
	 +g0leGvMogw8iAdg3wxFYJpZEuueeBQGg/RB8sxamnbF3FhkpfPlf6ZLLW+zjgZcDcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=URr3/lyOGoyQO3+MAz+3RgykXD/Bjv2w1PU33cmWhm4=;
	b=lnvbs/1sZQ7r3v6ohccf/xIjB6G2jC2MDm7YZM/IjKzmBjKomsEZKcRuxbmR9UmSFutd
	 MfavX7dNZnSFwJxLgN26ZIMk1Mr0/S1lCuW1HUnSALpBz1Bl2uZuzmZfkpg6XFvqKPpp1
	 9LVSoOJYuF5jzBt694LUFPq86RP9p19OKgGY+kspE2sdhwv7JGZNn7SQEteRTp6QJmso0
	 0XI1FYLR77+2zmoGEDfQuoL2BDgfDM5BN3r3ZeiupGAnhzfjPIuRNMSV+R/5unAMjoidZ
	 4rsB8hkRaFZcHaatURBBBK3EfiW6HnHrSDWGfRHXPeyBaL2TDf2tCTeiIAkJZeTmSYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrFFh8zC;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B58E606A33F
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 09:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B58E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mrFFh8zC
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c434376dbebso10023866b.1
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 01:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131810; x=1794736610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URr3/lyOGoyQO3+MAz+3RgykXD/Bjv2w1PU33cmWhm4=;
        b=mrFFh8zCAaaLAl/C0UGOSilG4eplsQlgSsuRK3hmumGO6kR5WadUAM7qRpgqxvTOjd
         mouLi0Zjbvc01R3aF2XkBHX6eeBxouCn6sgmT9Vs+nvyZawx+k58bBIp852cWnE9UF7e
         uPUtIOOeBq1AozuBfL2rpHY1v9MT2cpMV8GBgLjjlfznA2RhdCQH5qkv/iN/Dohz5Gcc
         D/ftdJEr1uPkEL+Hu3oHalsyrpsGNYmv5uC6F6c9fM/zq3dFt2Hfuaf1crVkLjI4MiME
         4zlF3ya1hm+HokDLTTFf4KlKFzZH1Gx463/R1a2kk+fVi2vIdWDzGBweO/kKNnuZoFhJ
         kMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131810; x=1794736610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=URr3/lyOGoyQO3+MAz+3RgykXD/Bjv2w1PU33cmWhm4=;
        b=O5NmpErO/rdqQHj6pnT7xifqHBQol4Znjg064X4mwWL1TVb/VoHBXJuekHVXC0GVkF
         OGdGHnb9gG5NNzsi7jp6hR+PN1Et6FSUYc4H0U7hFNVsQ9cM3HySSzpEXHKNaL5CYJfP
         zVvGZDCu1uUYAXaNgWX2SvxguwGwKhq6i5c+Gwj7WRz+sTSCbeYuZ/3hu0Gd3NSBeAOg
         tqfyfIATSJsEjLbPd/2k1t67mVa69QzehCL5K4lnvymc6GShoVdIoAMgY8o8uva7T4X6
         hV/1IsbMqZDv294eH2AaZpxQ8izQaYiDepB7tby2Tk2EcExSo69Cc0seriu9UEfY7QzS
         +VAw==
X-Forwarded-Encrypted: i=1; AL+hErGHknFh5GargtBycXtwMWp3z9R07bVNSRr8NnkxVBHki7JCohj/jWHS4/laP/b8U2zn02o=@lists.linux.dev
X-Gm-Message-State: APuU4Z/hYUi0GyPf/AdJhpnEmitqzCWjWu946qh74VLFJA103pOQ2AV6
	L9ztKMieryaB2xO4NDajyTCBSml8p8qBfwMFKE30Dqml3y1YYSrJbdPN
X-Gm-Gg: AYBFou2gdJQVHUD9xl8LyCaTEfVtnMKaCt1/C752OIb9+v+p9idbalO1rvQGTJ91U6P
	2r4ZvXNbWR3THqYnHNWfweAWNbHcs17PjfIZAgXnPNmjOgrv2fttMdZgE/ApaJimV1SQ4jPh2hh
	1yZ08u7cDWyshudSPwvQStoLeiyRwaMlXy1g+5wv7UdGFd73oBnEHA/LwB21vyGh5+H9egQ0iA/
	XcRhOSsbeVd0igTaRxVVDYs5X2zoEJiIy1WyD3fK3XF4/2qcFzOfrA7s6PK+K2IOYAOqisnHqvD
	yIbN+WjC5QzkpmHi2Uyo9hRz6HMWTY0sNIHZzjLg0YVTDC+wUOKxDrIAlXsX0vu/A48/No/sn31
	Die3aBcOyOZQ/Mvhf2MVd5fxd2voYg1LBrRcYBppYCX958F/x0OoqJrwRvH64bpudDXWZ+PWzPd
	hyEGc1XPwp58MwmBx7+Mq3139M6QoM2uXUulkIybO7qhGM6wXe5CBe1Ie04qufpeNYT7mCPbnNZ
	dNsHTXH+v/8RU74RUvo3LH8UXoO4bFxBNnCj0T40QMg3uYFkfzgqQb+r2KpFSEUBdqE91Y6Bc5j
	byex+YmWeZGYR++rEdeUwxzll4POvlQyuNgF5Yr3LCws5Nb1WE92xuPGHcvLq5DpXZB1egYr4tl
	Wj0tpwse6jg==
X-Received: by 2002:a17:907:a88b:b0:c46:9745:ac13 with SMTP id a640c23a62f3a-c4d52816b83mr220993866b.32.1794131810412;
        Sun, 08 Nov 2026 01:56:50 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 3/4] iio: adc: Add support for MAX8907 ADC cell
Date: Sun,  8 Nov 2026 11:56:33 +0200
Message-ID: <20261108095634.100517-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108095634.100517-1-clamor95@gmail.com>
References: <20261108095634.100517-1-clamor95@gmail.com>
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

The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channels
with information about different parts of the power system, including the
battery, charger/plug, jack and thermal readings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/adc/Kconfig       |  10 ++
 drivers/iio/adc/Makefile      |   1 +
 drivers/iio/adc/max8907-adc.c | 195 ++++++++++++++++++++++++++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index a802d8ee4dd9c..25b094575a5d3 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1166,6 +1166,16 @@ config MAX77541_ADC
 	  To compile this driver as a module, choose M here:
 	  the module will be called max77541-adc.
 
+config MAX8907_ADC
+	tristate "Maxim MAX8907 ADC driver"
+	depends on MFD_MAX8907
+	help
+	  Say yes here to build support for 8 channel 12-bit ADC
+	  interface found in the Maxim MAX8907 PMIC.
+
+	  To compile this driver as a module, choose M here:
+	  the module will be called max8907-adc.
+
 config MAX9611
 	tristate "Maxim max9611/max9612 ADC driver"
 	depends on I2C
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index 9e82c21dbd374..12247d8e0aa29 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_MAX14001) += max14001.o
 obj-$(CONFIG_MAX34408) += max34408.o
 obj-$(CONFIG_MAX40080) += max40080.o
 obj-$(CONFIG_MAX77541_ADC) += max77541-adc.o
+obj-$(CONFIG_MAX8907_ADC) += max8907-adc.o
 obj-$(CONFIG_MAX9611) += max9611.o
 obj-$(CONFIG_MCP320X) += mcp320x.o
 obj-$(CONFIG_MCP3422) += mcp3422.o
diff --git a/drivers/iio/adc/max8907-adc.c b/drivers/iio/adc/max8907-adc.c
new file mode 100644
index 0000000000000..d1acb5bc95c15
--- /dev/null
+++ b/drivers/iio/adc/max8907-adc.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/iio/iio.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mfd/max8907.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+/* MAX8907_ADC_RES_CNFG1 */
+#define RES_AUX1			BIT(7)
+#define RES_AUX2			BIT(6)
+#define RES_VCHG			BIT(5)
+#define RES_VBBATT			BIT(4)
+#define RES_VMBATT			BIT(3)
+#define RES_ISNS			BIT(2)
+#define RES_THM				BIT(1)
+#define RES_TDIE			BIT(0)
+
+/* MAX8907_ADC_AVG_CNFG1 */
+#define AVG_AUX1_EN			BIT(7)
+#define AVG_AUX2_EN			BIT(6)
+#define AVG_VCHG_EN			BIT(5)
+#define AVG_VBBATT_EN			BIT(4)
+#define AVG_VMBATT_EN			BIT(3)
+#define AVG_ISNS_EN			BIT(2)
+#define AVG_THM_EN			BIT(1)
+#define AVG_TDIE_EN			BIT(0)
+
+/* MAX8907_ADC_ACQ_CNFG1 */
+#define T_ACQ_AUX1			BIT(7)
+#define T_ACQ_AUX2			BIT(5)
+#define T_ACQ_VCHG			BIT(3)
+#define T_ACQ_VBBATT			BIT(1)
+
+/* MAX8907_ADC_ACQ_CNFG2 */
+#define T_ACQ_VMBATT			BIT(6)
+#define T_ACQ_ISNS			BIT(4)
+#define T_ACQ_THM			BIT(2)
+#define T_ACQ_TDIE			BIT(0)
+
+/* MAX8907_ADC_SCHED */
+#define AUTOSCH_ENABLE			BIT(1)
+#define AUTOSCH_TIME			BIT(0)
+
+#define TO_REG(n)			((n) & 0xff)
+#define TO_MEASURE(n)			(((n) >> 8) & 0xff)
+
+enum {
+	TDIE, THM, ISNS, VMBATT, VBBATT, VCHG, AUX2, AUX1
+};
+
+static const u32 max8907_default_ref[] = {
+	4096, 4096, 4096, 8192, 8192, 8192, 2500, 4096
+};
+
+#define MAX8907_CHAN(_type, _idname, _datasheet_name) {		\
+	.type = (_type),					\
+	.address = MAX8907_REG_##_idname##_MSB |		\
+		   MAX8907_REG_##_idname##_MEASURE << 8,	\
+	.indexed = 1,						\
+	.channel = (_idname),					\
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |		\
+			      BIT(IIO_CHAN_INFO_SCALE),		\
+	.scan_index = (_idname),				\
+	.scan_type = {						\
+		.format = IIO_SCAN_FORMAT_UNSIGNED_INT,		\
+		.realbits = 12,					\
+		.storagebits = 16,				\
+		.endianness = IIO_CPU,				\
+	},							\
+	.datasheet_name = (_datasheet_name),			\
+}
+
+static const struct iio_chan_spec max8907_adc_channels[] = {
+	MAX8907_CHAN(IIO_VOLTAGE, TDIE,   "tdiode"),
+	MAX8907_CHAN(IIO_VOLTAGE, THM,    "thermistor"),
+	MAX8907_CHAN(IIO_CURRENT, ISNS,   "isense"),
+	MAX8907_CHAN(IIO_VOLTAGE, VMBATT, "vmbatt"),
+	MAX8907_CHAN(IIO_VOLTAGE, VBBATT, "vbbatt"),
+	MAX8907_CHAN(IIO_VOLTAGE, VCHG,   "vcharge"),
+	MAX8907_CHAN(IIO_VOLTAGE, AUX2,   "aux2"),
+	MAX8907_CHAN(IIO_VOLTAGE, AUX1,   "aux1"),
+};
+
+static int max8907_adc_read(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan,
+			    int *val, int *val2, long mask)
+{
+	struct regmap **regmap = iio_priv(indio_dev);
+	unsigned char data[2] = { 0, 0 };
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = regmap_write(*regmap, TO_MEASURE(chan->address), 0);
+		if (ret)
+			return ret;
+
+		ret = regmap_bulk_read(*regmap, TO_REG(chan->address), data, 2);
+		if (ret)
+			return ret;
+
+		*val = ((data[0] << 8) | data[1]) >> 4;
+
+		return IIO_VAL_INT;
+
+	case IIO_CHAN_INFO_SCALE:
+		*val = max8907_default_ref[chan->channel];
+		*val2 = chan->scan_type.realbits;
+
+		return IIO_VAL_FRACTIONAL_LOG2;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info max8907_adc_info = {
+	.read_raw = &max8907_adc_read,
+};
+
+static int max8907_adc_init(struct regmap *regmap)
+{
+	u32 value;
+	int ret;
+
+	/* Enable internal voltage reference. Exact purpose of bits is not known. */
+	ret = regmap_update_bits(regmap, MAX8907_REG_TSC_CNFG1, GENMASK(1, 0), BIT(1));
+	if (ret)
+		return ret;
+
+	/* Check for internal reference IRQ */
+	ret = regmap_read_poll_timeout(regmap, MAX8907_REG_TSC_STA_INT, value,
+				       !(value & MAX8907_MASK_NREF_OK), 0, 1000);
+	if (ret)
+		return ret;
+
+	/* Enable ADC scheduler with 1 second interval */
+	ret = regmap_update_bits(regmap, MAX8907_REG_ADC_SCHED,
+				 AUTOSCH_ENABLE | AUTOSCH_TIME, AUTOSCH_TIME);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int max8907_adc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct iio_dev *indio_dev;
+	struct regmap **regmap;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*regmap));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	regmap = iio_priv(indio_dev);
+
+	*regmap = max8907->regmap_adc;
+
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = max8907_adc_channels;
+	indio_dev->num_channels = ARRAY_SIZE(max8907_adc_channels);
+	indio_dev->name = dev_name(dev);
+	indio_dev->info = &max8907_adc_info;
+
+	iio_device_set_parent(indio_dev, dev->parent);
+
+	/* Enable ADCREF */
+	ret = regmap_set_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+			      MAX8907_MASK_RST_CFG_INT_REF_EN);
+	if (ret)
+		return ret;
+
+	ret = max8907_adc_init(max8907->regmap_adc);
+	if (ret)
+		return ret;
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static struct platform_driver max8907_adc_driver = {
+	.driver.name = "max8907-adc",
+	.probe = max8907_adc_probe,
+};
+module_platform_driver(max8907_adc_driver);
+
+MODULE_ALIAS("platform:max8907-adc");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 ADC driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

