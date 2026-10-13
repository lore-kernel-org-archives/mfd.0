Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F5F48A2C5
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 17:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912938; cv=none; b=ESqvpYzLAUrTySDnEazvdnQchmW5HVCZ+zgpezYWFR73EG4YzDP3na442nLs2/RXn7PlMotqypsL/cSZP4n/AhCL7i9xjJ2iG2KOor/vIONG4Gi65YfTfXqySA3HLHdpxEz5Yn/bZKTk3p7wHAZ60DfI81xnIoy75Ok0wYQEaos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912938; c=relaxed/simple;
	bh=sBlpORBLhADLoRvtEq0ceBXTyPuLyORp6xnNaDPqPk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkDKbYBzcZtzLiBikxN2gJW86VGcdyoxnAFMlZcUNOZdNDrArcm1Se0F9GVAbPNzTWrKZ52YvzYFYojNcEP5n46OhHgriRXULVMUMxmvbHfH4sTR4V8Dm20bxgeu29qDL1a+IO10VlQEyFRLha0yobyxVidoRKdz2AbX1cmyIE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p2jVL8Eg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2jVL8Eg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so19627335e9.0
        for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 10:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912933; x=1792517733; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/0jblMav6cx8x8bVe8ODswatr5gDfj27tzI6t6LAVeo=;
        b=p2jVL8Eg2oVzy6S9qxYzdthgNWUTFTqoKCm5p/qnbUT8YY2mpj85wz/Wr70+0Jd8dT
         5PU4FepKE0ptzmPuN1GQyo1guoFVyQkXX+qJZV8HX1RChoMueGvV46vBwyaefRXSj9Dt
         ZHTNcLVoBCegh3St/ICHTX9DorzHFmkLKVZNee6gdP51t/kPB61ZjjI6nBS5vK2jZ7T7
         LJ5u/CyJSorhyiCvbIGx5+CPqW86qbAspvAraF2EpjxeXbqcvdH3xu4J2Yiik+/VKn6Z
         Prvw/wmD1wq2vdk6OEL3BPKmiMfkDh/LiywFf1O1XjlE92F6X3OQzjywDLuwSbKqdaPz
         glhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912933; x=1792517733;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0jblMav6cx8x8bVe8ODswatr5gDfj27tzI6t6LAVeo=;
        b=abQ6YdLqYohi9fX3mEyJJ9SxSD6UbDVIGtHhbYm2UniUfwgYsKHoXkRgQMJQjAe0u4
         7Ae9/WKt/KsC0l39mMZc0PcMYX1ut35VsZ5PaBrpHAozQX8AAi9YNFCZKXFgjY40iW9X
         f2VqpZ2mAbNlfZ/stswIZZKNfEox37ntfP2y8ag9aCnjVI0Mn2qPqkR0Rsb/9o9HQcMU
         I9tOd/Ej44t+c7KsvdW07aBc//Ub0qjXuBKSK4W1+pC5Vz7ccb5cr7C6KFIMtgWrXOM9
         n0Cr/cpvhsWMSml2hIFMW/82v6V6wrQGETWhlOGwBnb5wRD9VDTf5QnHQY2rHbmetO8d
         Qv8g==
X-Forwarded-Encrypted: i=1; AKwUvBw6ibZBaGkCBF4b+t2WGUzQnsRwiDAyATnEfPZW8dwE8GTTCIA/2gW0k0zIDUEgT4AAGCg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJqwAdmMzFJ0fClFqUmHJl6KZK+5Gl2mdz+ASdAWtb4LPrcpeEj
	8X9B3Aj24rbrvKBv4m72QwXhgQkajfmaT3IceoJ3QOsdLMSCY+6nsIgj
X-Gm-Gg: AYBFou3A3kw6l6TXlAnRPiM9fEIOzk8z7I9qcKnYxS0beTVDalKmi086MccTup93sdd
	9LPLTwBDwId1x2Ck7Y3K7r4sHEqqyPsbL2bP6Jc5mnI7YmsvFIQcQZKrWqTqSDwkveNsNu0FAZp
	uprkzSCjZ1+5vjQBOEOdg24WzU1Rvu5q/W1K+vWSS9ShTkR7StF36l8+H+I3K+x2w4dm9R9hBa2
	f4Yltg5FpbnMwtPwcdS8WIycysRaHVvDVpHJ5l7hBpBTHMER+BFozVXxHBFpQkKk2babe1OuLpg
	32vWjF0UJd0rP6VmprjdVlWi34JGxnv17q5p/SGAzmHuRA061QPimRhwt6znMl04qW09qOaaH7V
	/0b+ck808DIzGMK2cbA59rQQNTq3ZAs5YR2X1b+S5LMAnioUH+SXBkwi/d83xJJ64DPHwtZ8XsQ
	8YSwxYE9zkZHE4/nFms/ukOPi6OKr69K65FQ4n/r+Tzbshoq2Fnb13zZRhq5VUzR9OWctvDJpL5
	tTADO1Fx0/dHH6N8TY=
X-Received: by 2002:a05:600c:3554:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-4a18e4a01a1mr277309485e9.6.1791912932491;
        Tue, 13 Oct 2026 10:35:32 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ca51465sm284127195e9.4.2026.10.13.10.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:35:31 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v11 2/7] mfd: Add driver for ASUS Transformer embedded controller
Date: Tue, 13 Oct 2026 20:34:58 +0300
Message-ID: <20261013173504.451391-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013173504.451391-1-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
and TF600T, P1801-T and TF701T pad. This is a glue driver handling
detection and common operations for EC's functions.

Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/Kconfig                     |  16 +
 drivers/mfd/Makefile                    |   1 +
 drivers/mfd/asus-transformer-ec.c       | 562 ++++++++++++++++++++++++
 include/linux/mfd/asus-transformer-ec.h |  94 ++++
 4 files changed, 673 insertions(+)
 create mode 100644 drivers/mfd/asus-transformer-ec.c
 create mode 100644 include/linux/mfd/asus-transformer-ec.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 0a2778052519f..590f33f19ff62 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -137,6 +137,22 @@ config MFD_AAT2870_CORE
 	  additional drivers must be enabled in order to use the
 	  functionality of the device.
 
+config MFD_ASUS_TRANSFORMER_EC
+	tristate "ASUS Transformer's embedded controller"
+	select MFD_CORE
+	depends on I2C && OF
+	help
+	  Select this to enable support for the Embedded Controller (EC)
+	  found in Tegra based ASUS Transformer series tablets and mobile
+	  docks.
+
+	  This driver handles the core I2C communication with the EC and
+	  provides support for its sub-devices, including battery management,
+	  charger detection, LEDs and keyboard dock functions support.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called asus-transformer-ec.
+
 config MFD_AT91_USART
 	tristate "AT91 USART Driver"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 72d3944b0ad8e..873af6376992c 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
 obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
 obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
 obj-$(CONFIG_MFD_SM501)		+= sm501.o
+obj-$(CONFIG_MFD_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
 obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
 obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
diff --git a/drivers/mfd/asus-transformer-ec.c b/drivers/mfd/asus-transformer-ec.c
new file mode 100644
index 0000000000000..37dcd1b77465d
--- /dev/null
+++ b/drivers/mfd/asus-transformer-ec.c
@@ -0,0 +1,562 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/array_size.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#define ASUSEC_ACCESS_TIMEOUT		300
+#define ASUSEC_DOCKRAM_OFFSET		2
+#define ASUSEC_ECREQ_DELAY		50
+#define ASUSEC_ECREQ_TIMEOUT		200
+#define ASUSEC_RESET			0
+#define ASUSEC_RETRY_MAX		3
+#define ASUSEC_RSP_BUFFER_SIZE		(ASUSEC_ENTRIES / ASUSEC_ENTRY_SIZE)
+#define ASUSEC_SL101_ENTRY_SIZE		8
+
+enum asusec_variant {
+	ASUSEC_SL101_DOCK = 1,
+	ASUSEC_TF101_DOCK,
+	ASUSEC_TF201_PAD,
+	ASUSEC_TF600T_PAD,
+	ASUSEC_MAX
+};
+
+enum asusec_mode {
+	ASUSEC_MODE_NONE,
+	ASUSEC_MODE_NORMAL,
+	ASUSEC_MODE_FACTORY,
+	ASUSEC_MODE_MAX
+};
+
+/**
+ * struct asus_ec_chip_info
+ *
+ * @name: prefix associated with the EC
+ * @variant: id of programming model of EC
+ * @mode: state of Factory Mode bit in EC control register
+ * @read_size: size of block to read
+ * @keyboard_mask: mask of keyboard packets
+ */
+struct asus_ec_chip_info {
+	const char *name;
+	enum asusec_variant variant;
+	enum asusec_mode fmode;
+	u8 read_size;
+	u8 keyboard_mask;
+};
+
+/**
+ * struct asus_ec_data
+ *
+ * @ec: public part shared with all cells (must be first)
+ * @ecreq_lock: prevents simultaneous access to EC
+ * @ecreq_gpio: EC request GPIO
+ * @client: pointer to EC's i2c_client
+ * @info: pointer to EC's version description
+ * @ec_buf: buffer for EC read
+ * @logging_disabled: flag disabling logging on reset events
+ */
+struct asus_ec_data {
+	struct asusec_core ec;
+	struct mutex ecreq_lock;
+	struct gpio_desc *ecreq_gpio;
+	struct i2c_client *client;
+	const struct asus_ec_chip_info *info;
+	u8 ec_buf[ASUSEC_ENTRY_BUFSIZE];
+};
+
+/**
+ * struct dockram_ec_data
+ *
+ * @ctl_lock: prevent simultaneous access to Dockram
+ * @ctl_buf: buffer for Dockram read
+ */
+struct dockram_ec_data {
+	struct mutex ctl_lock;
+	u8 ctl_buf[ASUSEC_ENTRY_BUFSIZE];
+};
+
+/**
+ * asus_dockram_access_ctl - Read from or write to the DockRAM control register.
+ * @client: Handle to the DockRAM device.
+ * @out: Pointer to a variable where the register value will be stored.
+ * @mask: Bitmask of bits to be cleared.
+ * @xor: Bitmask of bits to be set (via XOR).
+ *
+ * This performs a control register read if @out is provided and both @mask
+ * and @xor are zero. Otherwise, it performs a control register update if
+ * @mask and @xor are provided.
+ *
+ * Returns a negative errno code else zero on success.
+ */
+int asus_dockram_access_ctl(struct i2c_client *client, u64 *out, u64 mask,
+			    u64 xor)
+{
+	struct dockram_ec_data *ddata = i2c_get_clientdata(client);
+	u8 *buf = ddata->ctl_buf;
+	u64 val;
+	int ret = 0;
+
+	guard(mutex)(&ddata->ctl_lock);
+
+	memset(buf, 0, ASUSEC_ENTRY_BUFSIZE);
+	ret = i2c_smbus_read_i2c_block_data(client, ASUSEC_DOCKRAM_CONTROL,
+					    ASUSEC_ENTRY_SIZE, buf);
+	if (ret < ASUSEC_ENTRY_SIZE) {
+		dev_err(&client->dev, "failed to access control buffer: %d\n",
+			ret);
+		return ret < 0 ? ret : -EIO;
+	}
+
+	if (buf[0] != ASUSEC_CTL_SIZE) {
+		dev_err(&client->dev, "buffer size exceeds %d: %d\n",
+			ASUSEC_CTL_SIZE, buf[0]);
+		return -EPROTO;
+	}
+
+	val = get_unaligned_le64(buf + 1);
+
+	if (out)
+		*out = val;
+
+	if (mask || xor) {
+		put_unaligned_le64((val & ~mask) ^ xor, buf + 1);
+		ret = i2c_smbus_write_i2c_block_data(client,
+						     ASUSEC_DOCKRAM_CONTROL,
+						     ASUSEC_ENTRY_SIZE, buf);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asus_dockram_access_ctl);
+
+static int asus_ec_signal_request(struct asus_ec_data *ddata)
+{
+	guard(mutex)(&ddata->ecreq_lock);
+
+	gpiod_set_value_cansleep(ddata->ecreq_gpio, 1);
+	msleep(ASUSEC_ECREQ_DELAY);
+
+	gpiod_set_value_cansleep(ddata->ecreq_gpio, 0);
+	msleep(ASUSEC_ECREQ_TIMEOUT);
+
+	return 0;
+}
+
+static int asus_ec_log_info(struct asus_ec_data *ddata, unsigned int reg,
+			    const char *name)
+{
+	struct device *dev = &ddata->client->dev;
+	u8 buf[ASUSEC_ENTRY_BUFSIZE];
+	int ret;
+
+	memset(buf, 0, ASUSEC_ENTRY_BUFSIZE);
+	ret = i2c_smbus_read_i2c_block_data(ddata->ec.dockram, reg,
+					    ASUSEC_ENTRY_SIZE, buf);
+	if (ret < ASUSEC_ENTRY_SIZE)
+		return ret < 0 ? ret : -EIO;
+
+	if (buf[0] > ASUSEC_ENTRY_SIZE) {
+		dev_err(dev, "bad data len; buffer: %*ph; ret: %d\n",
+			ASUSEC_ENTRY_BUFSIZE, buf, ret);
+		return -EPROTO;
+	}
+
+	dev_info(dev, "%-14s: %.*s\n", name, buf[0], buf + 1);
+
+	if (!ddata->ec.model) {
+		ddata->ec.model = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
+						 buf[0], buf + 1);
+		if (!ddata->ec.model)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int asus_ec_detect(struct asus_ec_data *ddata)
+{
+	int ret;
+
+	ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_MODEL, "Model");
+	if (ret)
+		return ret;
+
+	ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_FW, "FW version");
+	if (ret)
+		return ret;
+
+	ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_CFGFMT, "Config format");
+	if (ret)
+		return ret;
+
+	ret = asus_ec_log_info(ddata, ASUSEC_DOCKRAM_INFO_HW, "HW version");
+	if (ret)
+		return ret;
+
+	ddata->ec.name = ddata->info->name;
+	ddata->ec.keyboard_mask = ddata->info->keyboard_mask;
+
+	return 0;
+}
+
+static int asus_ec_reset(struct asus_ec_data *ddata)
+{
+	int retry, ret;
+
+	guard(mutex)(&ddata->ecreq_lock);
+
+	for (retry = 0; retry < ASUSEC_RETRY_MAX; retry++) {
+		ret = i2c_smbus_write_word_data(ddata->client, ASUSEC_WRITE_BUF,
+						ASUSEC_RESET);
+		if (!ret)
+			return 0;
+
+		msleep(ASUSEC_ACCESS_TIMEOUT);
+	}
+
+	return ret;
+}
+
+static void asus_ec_clear_buffer(struct asus_ec_data *ddata)
+{
+	int ret, retry = ASUSEC_RSP_BUFFER_SIZE;
+
+	/*
+	 * Read the buffer till we get valid data by checking ASUSEC_OBF_MASK
+	 * of the status byte or till we reach end of the 256 byte buffer.
+	 */
+	while (retry--) {
+		ret = i2c_smbus_read_i2c_block_data(ddata->client, ASUSEC_READ_BUF,
+						    ddata->info->read_size,
+						    ddata->ec_buf);
+		if (ret < ddata->info->read_size)
+			continue;
+
+		if (ddata->ec_buf[ASUSEC_IRQ_STATUS] & ASUSEC_OBF_MASK)
+			continue;
+
+		break;
+	}
+}
+
+static int asus_ec_susb_on_status(struct asus_ec_data *ddata)
+{
+	u64 flag;
+	int ret;
+
+	ret = asus_dockram_access_ctl(ddata->ec.dockram, &flag, 0, 0);
+	if (ret)
+		return ret;
+
+	flag &= ASUSEC_CTL_SUSB_MODE;
+	dev_info(&ddata->client->dev, "EC FW behaviour: %s\n",
+		 flag ? "susb on when receive ec_req" :
+		 "susb on when system wakeup");
+
+	return 0;
+}
+
+static int asus_ec_set_factory_mode(struct asus_ec_data *ddata,
+				    enum asusec_mode fmode)
+{
+	dev_info(&ddata->client->dev, "Entering %s mode.\n",
+		 fmode == ASUSEC_MODE_FACTORY ? "factory" : "normal");
+
+	return asus_dockram_access_ctl(ddata->ec.dockram, NULL,
+				       ASUSEC_CTL_FACTORY_MODE,
+				       fmode == ASUSEC_MODE_FACTORY ?
+				       ASUSEC_CTL_FACTORY_MODE : 0);
+}
+
+static int asus_ec_init(struct asus_ec_data *ddata)
+{
+	int ret;
+
+	ret = asus_ec_reset(ddata);
+	if (ret)
+		goto err_exit;
+
+	asus_ec_clear_buffer(ddata);
+
+	/* Check and inform about EC firmware behavior */
+	ret = asus_ec_susb_on_status(ddata);
+	if (ret)
+		goto err_exit;
+
+	/* Some EC require factory mode to be set normal on each request */
+	if (ddata->info->fmode)
+		ret = asus_ec_set_factory_mode(ddata, ddata->info->fmode);
+
+err_exit:
+	if (ret)
+		dev_err(&ddata->client->dev, "failed to access EC: %d\n", ret);
+
+	return ret;
+}
+
+static void asus_ec_handle_smi(struct asus_ec_data *ddata, unsigned int code)
+{
+	switch (code) {
+	case ASUSEC_SMI_HANDSHAKE:
+	case ASUSEC_SMI_RESET:
+		asus_ec_init(ddata);
+		break;
+	}
+}
+
+static irqreturn_t asus_ec_interrupt(int irq, void *dev_id)
+{
+	struct asus_ec_data *ddata = dev_id;
+	unsigned long notify_action;
+	int ret;
+
+	ret = i2c_smbus_read_i2c_block_data(ddata->client, ASUSEC_READ_BUF,
+					    ddata->info->read_size, ddata->ec_buf);
+	if (ret < ddata->info->read_size)
+		return IRQ_NONE;
+
+	/* Check status byte with ASUSEC_OBF_MASK if data is valid */
+	ret = ddata->ec_buf[ASUSEC_IRQ_STATUS] & ASUSEC_OBF_MASK;
+	if (!ret)
+		return IRQ_NONE;
+
+	notify_action = ddata->ec_buf[ASUSEC_IRQ_STATUS];
+	if (notify_action & ASUSEC_SMI_MASK) {
+		unsigned int code = ddata->ec_buf[ASUSEC_SMI_CODE];
+
+		asus_ec_handle_smi(ddata, code);
+
+		notify_action |= code << 8;
+	}
+
+	blocking_notifier_call_chain(&ddata->ec.notify_list,
+				     notify_action, ddata->ec_buf);
+
+	return IRQ_HANDLED;
+}
+
+static void asus_ec_release_dockram_dev(void *client)
+{
+	i2c_unregister_device(client);
+}
+
+static struct i2c_client *devm_asus_dockram_get(struct device *dev)
+{
+	struct i2c_client *parent = to_i2c_client(dev);
+	struct i2c_client *dockram;
+	struct dockram_ec_data *ddata;
+	int ret;
+
+	dockram = i2c_new_ancillary_device(parent, "dockram",
+					   parent->addr + ASUSEC_DOCKRAM_OFFSET);
+	if (IS_ERR(dockram))
+		return dockram;
+
+	ret = devm_add_action_or_reset(dev, asus_ec_release_dockram_dev,
+				       dockram);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ddata = devm_kzalloc(&dockram->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return ERR_PTR(-ENOMEM);
+
+	i2c_set_clientdata(dockram, ddata);
+	mutex_init(&ddata->ctl_lock);
+
+	return dockram;
+}
+
+static const struct mfd_cell asus_ec_sl101_dock_mfd_devices[] = {
+	MFD_CELL_NAME("asus-transformer-ec-kbc"),
+};
+
+static const struct mfd_cell asus_ec_tf101_dock_mfd_devices[] = {
+	MFD_CELL_BASIC("asus-transformer-ec-battery", NULL, NULL, 0, 1),
+	MFD_CELL_BASIC("asus-transformer-ec-charger", NULL, NULL, 0, 1),
+	MFD_CELL_BASIC("asus-transformer-ec-led", NULL, NULL, 0, 1),
+	MFD_CELL_NAME("asus-transformer-ec-kbc"),
+	MFD_CELL_NAME("asus-transformer-ec-keys"),
+};
+
+static const struct mfd_cell asus_ec_tf201_pad_mfd_devices[] = {
+	MFD_CELL_NAME("asus-transformer-ec-battery"),
+	MFD_CELL_NAME("asus-transformer-ec-led"),
+};
+
+static const struct mfd_cell asus_ec_tf600t_pad_mfd_devices[] = {
+	MFD_CELL_NAME("asus-transformer-ec-battery"),
+	MFD_CELL_NAME("asus-transformer-ec-charger"),
+	MFD_CELL_NAME("asus-transformer-ec-led"),
+};
+
+static int asus_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct asus_ec_data *ddata;
+	const struct mfd_cell *cells;
+	unsigned int num_cells;
+	unsigned long irqflags;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_I2C_BLOCK))
+		return dev_err_probe(dev, -ENXIO,
+			"I2C bus is missing required SMBus block mode support\n");
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->info = device_get_match_data(dev);
+	if (!ddata->info)
+		return -ENODEV;
+
+	switch (ddata->info->variant) {
+	case ASUSEC_SL101_DOCK:
+		cells = asus_ec_sl101_dock_mfd_devices;
+		num_cells = ARRAY_SIZE(asus_ec_sl101_dock_mfd_devices);
+		break;
+	case ASUSEC_TF101_DOCK:
+		cells = asus_ec_tf101_dock_mfd_devices;
+		num_cells = ARRAY_SIZE(asus_ec_tf101_dock_mfd_devices);
+		break;
+	case ASUSEC_TF201_PAD:
+		cells = asus_ec_tf201_pad_mfd_devices;
+		num_cells = ARRAY_SIZE(asus_ec_tf201_pad_mfd_devices);
+		break;
+	case ASUSEC_TF600T_PAD:
+		cells = asus_ec_tf600t_pad_mfd_devices;
+		num_cells = ARRAY_SIZE(asus_ec_tf600t_pad_mfd_devices);
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "unknown device variant %d\n",
+				     ddata->info->variant);
+	}
+
+	i2c_set_clientdata(client, ddata);
+	ddata->client = client;
+
+	ddata->ec.dockram = devm_asus_dockram_get(dev);
+	if (IS_ERR(ddata->ec.dockram))
+		return dev_err_probe(dev, PTR_ERR(ddata->ec.dockram),
+				     "failed to get dockram\n");
+
+	ddata->ecreq_gpio = devm_gpiod_get(dev, "request", GPIOD_OUT_LOW);
+	if (IS_ERR(ddata->ecreq_gpio))
+		return dev_err_probe(dev, PTR_ERR(ddata->ecreq_gpio),
+				     "failed to get EC request GPIO\n");
+
+	BLOCKING_INIT_NOTIFIER_HEAD(&ddata->ec.notify_list);
+	mutex_init(&ddata->ecreq_lock);
+
+	asus_ec_signal_request(ddata);
+
+	ret = asus_ec_detect(ddata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to detect EC version\n");
+
+	ret = asus_ec_init(ddata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init EC\n");
+
+	/*
+	 * Systems using device tree should set up interrupt via DTS,
+	 * the rest will use the default low interrupt.
+	 */
+	irqflags = dev->of_node ? 0 : IRQF_TRIGGER_LOW;
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					&asus_ec_interrupt,
+					IRQF_ONESHOT | irqflags,
+					client->name, ddata);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register IRQ\n");
+
+	/* Parent I2C controller uses DMA, ASUS EC and child devices do not */
+	client->dev.coherent_dma_mask = 0;
+	client->dev.dma_mask = &client->dev.coherent_dma_mask;
+
+	return devm_mfd_add_devices(dev, 0, cells, num_cells, NULL, 0, NULL);
+}
+
+static const struct asus_ec_chip_info asus_ec_sl101_dock_data = {
+	.name = "dock",
+	.variant = ASUSEC_SL101_DOCK,
+	.fmode = ASUSEC_MODE_NONE,
+	.read_size = ASUSEC_SL101_ENTRY_SIZE,
+	.keyboard_mask = ASUSEC_OBF_MASK,
+};
+
+static const struct asus_ec_chip_info asus_ec_tf101_dock_data = {
+	.name = "dock",
+	.variant = ASUSEC_TF101_DOCK,
+	.fmode = ASUSEC_MODE_NONE,
+	.read_size = ASUSEC_ENTRY_SIZE,
+	.keyboard_mask = ASUSEC_KBC_MASK | ASUSEC_KEY_MASK,
+};
+
+static const struct asus_ec_chip_info asus_ec_tf201_pad_data = {
+	.name = "pad",
+	.variant = ASUSEC_TF201_PAD,
+	.fmode = ASUSEC_MODE_NORMAL,
+	.read_size = ASUSEC_ENTRY_SIZE,
+	.keyboard_mask = ASUSEC_KBC_MASK | ASUSEC_KEY_MASK,
+};
+
+static const struct asus_ec_chip_info asus_ec_tf600t_pad_data = {
+	.name = "pad",
+	.variant = ASUSEC_TF600T_PAD,
+	.fmode = ASUSEC_MODE_NORMAL,
+	.read_size = ASUSEC_ENTRY_SIZE,
+	.keyboard_mask = ASUSEC_KBC_MASK | ASUSEC_KEY_MASK,
+};
+
+static const struct of_device_id asus_ec_match[] = {
+	{
+		.compatible = "asus,sl101-ec-dock",
+		.data = &asus_ec_sl101_dock_data,
+	}, {
+		.compatible = "asus,tf101-ec-dock",
+		.data = &asus_ec_tf101_dock_data,
+	}, {
+		.compatible = "asus,tf201-ec-pad",
+		.data = &asus_ec_tf201_pad_data,
+	}, {
+		.compatible = "asus,tf600t-ec-pad",
+		.data = &asus_ec_tf600t_pad_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, asus_ec_match);
+
+static struct i2c_driver asus_ec_driver = {
+	.driver	= {
+		.name = "asus-transformer-ec",
+		.of_match_table = asus_ec_match,
+	},
+	.probe = asus_ec_probe,
+};
+module_i2c_driver(asus_ec_driver);
+
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("ASUS Transformer's EC driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/asus-transformer-ec.h b/include/linux/mfd/asus-transformer-ec.h
new file mode 100644
index 0000000000000..d09d3b70171ef
--- /dev/null
+++ b/include/linux/mfd/asus-transformer-ec.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __MFD_ASUS_TRANSFORMER_EC_H
+#define __MFD_ASUS_TRANSFORMER_EC_H
+
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+
+#define ASUSEC_ENTRIES			0x100
+#define ASUSEC_ENTRY_SIZE		32
+#define ASUSEC_ENTRY_BUFSIZE		(ASUSEC_ENTRY_SIZE + 1)
+
+struct i2c_client;
+
+/**
+ * struct asusec_core - public part shared with all cells
+ *
+ * @model: firmware version running on the EC
+ * @name: prefix associated with the EC
+ * @dockram: pointer to Dockram's i2c_client
+ * @notify_list: notify list used by cells
+ * @keyboard_mask: mask of keyboard packets
+ */
+struct asusec_core {
+	const char *model;
+	const char *name;
+	struct i2c_client *dockram;
+	struct blocking_notifier_head notify_list;
+	u8 keyboard_mask;
+};
+
+/* interrupt sources */
+#define ASUSEC_IRQ_STATUS		1
+#define ASUSEC_OBF_MASK			BIT(0)
+#define ASUSEC_KEY_MASK			BIT(2)
+#define ASUSEC_KBC_MASK			BIT(3)
+#define ASUSEC_AUX_MASK			BIT(5)
+#define ASUSEC_SCI_MASK			BIT(6)
+#define ASUSEC_SMI_MASK			BIT(7)
+
+/* SMI notification codes */
+#define ASUSEC_SMI_CODE			2
+#define ASUSEC_SMI_POWER_NOTIFY		0x31	/* USB cable plug event */
+#define ASUSEC_SMI_HANDSHAKE		0x50	/* response to ec_req edge */
+#define ASUSEC_SMI_WAKE			0x53
+#define ASUSEC_SMI_RESET		0x5f
+#define ASUSEC_SMI_ADAPTER_EVENT	0x60	/* charger to dock plug event */
+#define ASUSEC_SMI_BACKLIGHT_ON		0x63
+#define ASUSEC_SMI_AUDIO_DOCK_IN	0x70
+
+#define ASUSEC_SMI_ACTION(code)		(ASUSEC_SMI_MASK | ASUSEC_OBF_MASK | \
+					(ASUSEC_SMI_##code << 8))
+
+/* control register [0x0a] layout */
+#define ASUSEC_CTL_SIZE			8
+
+/*
+ * EC reports power from 40-pin connector in the LSB of the control
+ * register.  The following values have been observed (xor 0x02):
+ *
+ * PAD-ec no-plug  0x40 / PAD-ec DOCK     0x20 / DOCK-ec no-plug 0x40
+ * PAD-ec AC       0x25 / PAD-ec DOCK+AC  0x24 / DOCK-ec AC      0x25
+ * PAD-ec USB      0x45 / PAD-ec DOCK+USB 0x24 / DOCK-ec USB     0x41
+ */
+
+#define ASUSEC_CTL_DIRECT_POWER_SOURCE	BIT_ULL(0)
+#define ASUSEC_STAT_CHARGING		BIT_ULL(2)
+#define ASUSEC_CTL_FULL_POWER_SOURCE	BIT_ULL(5)
+#define ASUSEC_CTL_SUSB_MODE		BIT_ULL(9)
+#define ASUSEC_CMD_SUSPEND_S3		BIT_ULL(33)
+#define ASUSEC_CTL_TEST_DISCHARGE	BIT_ULL(35)
+#define ASUSEC_CMD_SUSPEND_INHIBIT	BIT_ULL(37)
+#define ASUSEC_CTL_FACTORY_MODE		BIT_ULL(38)
+#define ASUSEC_CTL_KEEP_AWAKE		BIT_ULL(39)
+#define ASUSEC_CTL_USB_CHARGE		BIT_ULL(40)
+#define ASUSEC_CTL_LED_BLINK		BIT_ULL(40)
+#define ASUSEC_CTL_LED_AMBER		BIT_ULL(41)
+#define ASUSEC_CTL_LED_GREEN		BIT_ULL(42)
+#define ASUSEC_CMD_SWITCH_HDMI		BIT_ULL(56)
+#define ASUSEC_CMD_WIN_SHUTDOWN		BIT_ULL(62)
+
+#define ASUSEC_DOCKRAM_INFO_MODEL	0x01
+#define ASUSEC_DOCKRAM_INFO_FW		0x02
+#define ASUSEC_DOCKRAM_INFO_CFGFMT	0x03
+#define ASUSEC_DOCKRAM_INFO_HW		0x04
+#define ASUSEC_DOCKRAM_CONTROL		0x0a
+#define ASUSEC_DOCKRAM_BATT_CTL		0x14
+
+#define ASUSEC_WRITE_BUF		0x64
+#define ASUSEC_READ_BUF			0x6a
+
+int asus_dockram_access_ctl(struct i2c_client *client,
+			    u64 *out, u64 mask, u64 xor);
+
+#endif /* __MFD_ASUS_TRANSFORMER_EC_H */
-- 
2.53.0

