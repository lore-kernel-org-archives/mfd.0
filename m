Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733899;
	b=P8XzK5yUWXOT+vtSnEZs8uzkZCAfgsHliV3141dCwsHLyFeFyrUbpv9TgfeDwvpWXRYU
	 3xIpMDsNjbJqEDaMOB6FvP04pECGlCO5XV5CSCUEt5SWfZjPl9LXGKJb4XekcfXCDt2HT
	 cB95s6W/4trTuNbrOnGYTEWBLAJRYIIqeI/YzpoUPbF0OA+7i+JFgkeo/pMv4B64vE9L5
	 tOSe3PKvxadOgptwngQlU/vCyPuhiNQCnhRKxuHXK7WkH1xp4YYoX6waTWXussXW2yFls
	 AKwXNWepaCyBjZcKluvNYaE7NkCbuioiNyMtwD38GHDC/wnzqTMWtngIT/pLBOSISWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WyMaoHtuEWoWCmY1vWOmpMj4la6Mpw4MJRQkO0gisb4=;
	b=q/F+UHfA+k2Q9bF+sN/Yq03vMi0L14c8M6xjR/upwRZy80vZNASayp59Y+sGvB1aNa64
	 O8XKR7YIA/USffzVsAsYXpQzQ0qXValK5PvTnod3FoTrRXDYU7j9CR1ZD2ignmeQ0jGWm
	 wZwzOiJ8DEoP0YLEhiIrwi7w1kwAX5+ZdxBvmPpOL3m5/o1Y6Ye4sEh1YmBRpiBZww7i9
	 cUWM8JOAHhvNggy+pIJ5kI9Lu4GQT7AKOI55i/WXLDYSmwLILiyo7/m5IKE55bo90Y8HU
	 hWqZEVc1jOdweJIc22qm9eWD4fh59onl8Kct4XhDnjSzq4/Krmdqhwy6Vk9vTyVoSTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQYN9glN;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090A3606A335
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 090A3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQYN9glN
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4697404c2bso344914266b.2
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733896; x=1795338696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyMaoHtuEWoWCmY1vWOmpMj4la6Mpw4MJRQkO0gisb4=;
        b=hQYN9glNfQgxQLqOQfrzVIQ7L0VvslznGbKRpOl0ceMa9dX2odyoX0C+Yzoiw8LQt1
         cv/f23tVeBDPbH0wS87xU3ZG2XJAhEvLukFzrXnS5Fh9IavbLm8b7vYnjnt1Zo8oLbZ6
         QKyuRbEy9ayls4HRFGEYmTwTrQOGKw9NPvrdtJV5LgD6dFPsTuWVT+TBbemkMBT3Rmm4
         YweG0jqG8idpWhZOVeLKkgepGfAjeXlkV0tppwNVQcwZvaJ9khRXXavBosobIgOkGkAR
         VHu2SSo6DxvI9so9AQgFrJzPdiEBmiIK0Fh9Jhbccv5e4nxQI6LcyCrNYkkciyRFlrnD
         webA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733896; x=1795338696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyMaoHtuEWoWCmY1vWOmpMj4la6Mpw4MJRQkO0gisb4=;
        b=dcHtYP2PEN3N9RnwA/vkCJ3mIS6ZXN0ziUMvvoQp4ptSQN/9ZfeXibr2GRuY2npBxz
         NJKwLBahYiq0/wAwXXzINJIYAFuAQ3gGCMB9k9vcOkrQEpwdz7Xb72T9ZZT6W0+gVLv9
         y762sgc6hTQDmlJ67OjvHto8fjWKKwGreXjwemTIK8U6HX36q38adRlQJVxEmpRKlNWd
         EoDhTvRkQA4UtAMjRqmx+84HFcsil90f9iljAddLkxOpiz8iIHao5RvsdhE2q5R9A0jL
         zBRJ0eMVlCsQWboB1qg8oI5rEXVlCCjiJGoXFtS5Du378tTjQdaCEEgCbSwPqNOidaQh
         Ry6g==
X-Forwarded-Encrypted: i=1; AL+hErEZrjVNQXBKvaItuYARgfbKsRajn/x7qYbxyD3p37N3MVgmbJlBsZxiwumkAIJ8nG1dwnA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8004FtV2sQOzPnrWvywewy2VLL64l8s0MR5gwrKkOmOVAx6+Dv
	Vyf07NGFPeBUYW7rydrBQcCx/ZIrv40baXfGx5rsURQbudEOZFCD1TWQ
X-Gm-Gg: AYBFou28KMUvxq8GxUxogiGzQPY+xP8YBaZK2A+5J2kzoEL/BJ6bEkGz/9VatPzyf+o
	xNaBXjOjpdLuNkI/OSG091zDBL/aIRYJpsbnlSTJLKOy9vs+69JtBDY0O67WVzw+3LbP0kuJOJS
	6AcoOXb/jWtAqJ/SXtZrq9whtQxAyUlUrwAKFTu2uxqFGQ6OK3vaneXU2cffUnoY04J15GDp5ok
	UV3Sf4wUjBdCdfejNvEZAgpETL4r+IqpS1rswDj9sqgLRlIWx8iMKd7415yMtUk3zUY4S2x0n6d
	FMO9oFGmv8ig+InotGYj2XyZUadciQABHKkgL1yyo5VjGc0bZE4jpJhxBw+OlJCNHm/EKTinjFo
	SWtnyopKn2g3wa46Q2IlRrkmliZYKFYA6H95+RZaK+rvgdrASEPZug0detJfzRbfBaijYCQgsiF
	YN5868PMVCV9Z3oRxzVxQ295+RJ1HUp6qsIlHk+tzxP9sZ+Cv6eUYRUysDYY6Kxk8vYmBp1XUlW
	X9ksNScAvL2Fux2QlY0+aywF0ce655eo4OAaqHnq2szxJKIN9RHN+6jFkSNNlRmmOvTNzX1okBQ
	0I2rjPowGGn7vaOrwLZqsclMJfgBklp0pHc8SiXUOVOtJe3+yTXs7777+8xR5QRvR3OwuUO30tT
	G+6jcxAR75g2AeE9caPpEGyZAA/EtMRg=
X-Received: by 2002:a17:906:c14d:b0:c50:5cd7:2901 with SMTP id a640c23a62f3a-c509640bfa8mr557945766b.23.1794733896267;
        Sun, 15 Nov 2026 01:11:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:34 -0800 (PST)
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
Subject: [PATCH v2 3/4] iio: adc: Add support for MAX8907 ADC cell
Date: Sun, 15 Nov 2026 11:11:19 +0200
Message-ID: <20261115091120.108684-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115091120.108684-1-clamor95@gmail.com>
References: <20261115091120.108684-1-clamor95@gmail.com>
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
 drivers/iio/adc/max8907-adc.c | 169 ++++++++++++++++++++++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index f8456c8039883..4d5bd8f93fb8c 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1176,6 +1176,16 @@ config MAX77541_ADC
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
index d7bb4815df61c..8e6755315aa35 100644
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
index 0000000000000..1776032efc913
--- /dev/null
+++ b/drivers/iio/adc/max8907-adc.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/iio/iio.h>
+#include <linux/module.h>
+#include <linux/mfd/max8907.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MAX8907_ADC_SCHED_AUTOSCH_ENABLE	BIT(1)
+#define MAX8907_ADC_SCHED_AUTOSCH_TIME		BIT(0)
+
+#define MAX8907_TO_REG(n)			((n) & 0xff)
+#define MAX8907_TO_MEASURE(n)			(((n) >> 8) & 0xff)
+
+enum {
+	TDIE, THM, ISNS, VMBATT, VBBATT, VCHG, AUX2, AUX1
+};
+
+static const u32 max8907_default_ref[] = {
+	[TDIE] = 4096,
+	[THM] = 4096,
+	[ISNS] = 4096,
+	[VMBATT] = 8192,
+	[VBBATT] = 8192,
+	[VCHG] = 8192,
+	[AUX2] = 2500,
+	[AUX1] 4096,
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
+	__be16 data;
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = regmap_write(*regmap, MAX8907_TO_MEASURE(chan->address), 0);
+		if (ret)
+			return ret;
+
+		ret = regmap_bulk_read(*regmap, MAX8907_TO_REG(chan->address), &data, sizeof(data));
+		if (ret)
+			return ret;
+
+		*val = be16_to_cpu(data) >> 4;
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
+	return regmap_update_bits(regmap, MAX8907_REG_ADC_SCHED,
+				  MAX8907_ADC_SCHED_AUTOSCH_ENABLE |
+				  MAX8907_ADC_SCHED_AUTOSCH_TIME,
+				  MAX8907_ADC_SCHED_AUTOSCH_ENABLE);
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
+	/*
+	 * The ADC does not require a dedicated node; hence, the PMIC is set as
+	 * the iio_dev parent to enable the use of the PMIC node phandle in the
+	 * Device Tree bindings.
+	 */
+	iio_device_set_parent(indio_dev, dev->parent);
+
+	ret = regmap_set_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+			      MAX8907_MASK_INT_REF_EN);
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

