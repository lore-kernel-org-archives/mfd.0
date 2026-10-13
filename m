Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA45208A0
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 17:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912941; cv=none; b=K5ySNQrPtX2AzO/1w56sth/E+3ueXtiNzTjGmNLTriDNuWcdNp+1esnWdeaIFldk4dqs9cmBNV9nZe2p6PNcibr4seG/49pWnhi5wfduZxns8R5R2kfWuiyeWoNTkooiuoxEH5wnzGHMyTts5rRGM36/qDFPScQdvDPZZTVwCBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912941; c=relaxed/simple;
	bh=fFoLexyRcNrB1eC7OtB3A58o+/m/Yq4r5cnWC8fsmyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cw+/s0shGA4DYxnCSkC3K/qYqoi3vbxkzzQ1xOUZefpMFdVkq/PB6MKbyb0BeoQdkv/yYnq58kfM2rC/efVAjUrMJ29b67oPN5K2Y8zqb0fZWYoAzY9YQtuk78u8D+BrrSsr8fkYQYaDdVZ8daQlaBroBYMLnLc5K4arGGPM5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DW+j6zD8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DW+j6zD8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso1274685e9.2
        for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 10:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912934; x=1792517734; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uDvZfdNd9v0/whisVO87Oe7GES9qepkpHXg/ZppMAZY=;
        b=DW+j6zD8oKXF6GwkXV0j6qCspv27bnC+xkdn9sLSGLz0QCpitX/RsCxLA83tCOmAHF
         PVr1j6QqM780kGokQrcqw2UDI0eVFj4yjgpKJGeJ8foShY8Bi70eDotT4zn07+GJf1XL
         bPrUJ1sAuMR7UlVfL25QZPNAhDx6WWwsq2pIomCY8ACu3vHALm03lXsFVdDlqyY5BJbe
         rO5zZxTdgVXm88+ML9ITtD0vOGdPCMs+WQHTaxIgPHQ7BSG+IJVAwOXJSAByvpVeUM1X
         awfPZHnaDQ5u+cT9kA4BrHG+FVlcEl5bDwkxWaFJn5BSC3IJ0PsS8bOzqWCR+GyyXYNC
         cb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912934; x=1792517734;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDvZfdNd9v0/whisVO87Oe7GES9qepkpHXg/ZppMAZY=;
        b=kaQL6s83njvIquh1DVXv8WuPDHg+n+GF7EPq2mpdwO5jHICq/Ndox9zsPe64C5ZjBa
         21G9eWakRc7/wVYq0RXeNiVMfbTq6BvgZXa3OKmp7BALFhWVOlk2bNX18fKwYpQyxVYj
         auMGbdff09TUutw/f/0ZPPRzXzDoVDTNXrXE7NQHCK0tT7O0+Ua9BMyD3ixNaInLwf7J
         YoOQ2gTeu5mrrMlwjyRBrLVT9bemMRKjPLKRIOaq1B2VBEOwtshGHP5dQT+K6WYkK+Ql
         noWQ7eIZ/qQPhPtRGBPJlSulMVJMGTJwaIJPOCOPLpvzyV0C7LlkwZ5qzgvecMaDohgE
         vHrA==
X-Forwarded-Encrypted: i=1; AKwUvBzOgJ+5c1upKetVU88dL3JXSYAIgXlwkQ/3lrOsNnkCoa6YXoOgrs1jCAiH9y77jM5Nfew=@lists.linux.dev
X-Gm-Message-State: AFq9FYLL+LZ03DTCkB7DkL3aIG47OL+gQX9vrSgNjre1rIgc+DauqktK
	r6UeHB+f+vyX6FrHvmV/aIURU/NTF7+Swq7zk+78z8KxPdF6zNyY2Y4C
X-Gm-Gg: AYBFou2jBH+k/J/gtbHyOGN+EKmQChpTi3fbfzYKWloVdKhRbD9FP16e5b8KLza1Ow6
	RCuaRzuhBcOUpYG4IlUx4IPVF0jJ7AEeZkYO37D1jIeZqY9WvMpuZSYDkToe6paAVRuoeM0KXzM
	tI6WTiPsdT91oq+cVqGM0Frk/gjg4SYonlGDXkxYdd6HmwjH63cF42I2SdcxGt3IaNfL08mTnsv
	jaqpu7ZKjEr5TiXwP3OqmO4PUcinM2FZt4GfxlP+2yZs+S4s0Fv/d+T1QcLbrCSqFKFCSsBztnp
	J3ODHtwspyYFcnAAvsaWltAw5tD8xe5+vn0BvoonVCVPOsNp7rhMOTSTAJzJS0aDjgv4QBMiHxE
	R/hOM7U158sqHQ4sDg5R39ocmH855KDMrOAN55HT+LXbwBHJfYsTkqVQZQWfyS7ImzRy8tIQCya
	vdN9akZDZkaxrtvphG9o1K7VJhz9ktFkgbSFjBWqile0tcrGCwgozLOWxxNPaWyzYCvUUVrDZzf
	PLdZmFgPqaoKYra954=
X-Received: by 2002:a05:600c:190a:b0:4a1:746e:589a with SMTP id 5b1f17b1804b1-4a18e4aea54mr286864835e9.18.1791912934216;
        Tue, 13 Oct 2026 10:35:34 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ca51465sm284127195e9.4.2026.10.13.10.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:35:33 -0700 (PDT)
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
Subject: [PATCH v11 3/7] input: serio: Add driver for ASUS Transformer dock keyboard and touchpad
Date: Tue, 13 Oct 2026 20:34:59 +0300
Message-ID: <20261013173504.451391-4-clamor95@gmail.com>
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

Add input driver for ASUS Transformer dock keyboard and touchpad.

Some keys in ASUS Dock report keycodes that don't make sense according to
their position, this patch modifies the incoming data that is sent to
serio to send proper scancodes.

Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/input/serio/Kconfig                   |  15 ++
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 169 ++++++++++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c

diff --git a/drivers/input/serio/Kconfig b/drivers/input/serio/Kconfig
index 087f0203fff99..58d415ca1d540 100644
--- a/drivers/input/serio/Kconfig
+++ b/drivers/input/serio/Kconfig
@@ -84,6 +84,21 @@ config SERIO_RPCKBD
 	  To compile this driver as a module, choose M here: the
 	  module will be called rpckbd.
 
+config SERIO_ASUS_TRANSFORMER_EC
+	tristate "Asus Transformer's Dock keyboard and touchpad controller"
+	depends on MFD_ASUS_TRANSFORMER_EC
+	help
+	  Say Y here if you want to use the keyboard and/or touchpad on
+	  Asus Transformed's Mobile Dock.
+
+	  For keyboard support you also need atkbd driver.
+
+	  For touchpad support you also need psmouse driver with Elantech
+	  touchpad option enabled.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called asus-transformer-ec-kbc.
+
 config SERIO_AMBAKMI
 	tristate "AMBA KMI keyboard controller"
 	depends on ARM_AMBA
diff --git a/drivers/input/serio/Makefile b/drivers/input/serio/Makefile
index 7f5137dc02e26..bed2a7a92a13d 100644
--- a/drivers/input/serio/Makefile
+++ b/drivers/input/serio/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_SERIO_SERPORT)	+= serport.o
 obj-$(CONFIG_SERIO_RPCKBD)	+= rpckbd.o
 obj-$(CONFIG_SERIO_SA1111)	+= sa1111ps2.o
 obj-$(CONFIG_SERIO_AMBAKMI)	+= ambakmi.o
+obj-$(CONFIG_SERIO_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec-kbc.o
 obj-$(CONFIG_SERIO_Q40KBD)	+= q40kbd.o
 obj-$(CONFIG_SERIO_GSCPS2)	+= gscps2.o
 obj-$(CONFIG_HP_SDC)		+= hp_sdc.o
diff --git a/drivers/input/serio/asus-transformer-ec-kbc.c b/drivers/input/serio/asus-transformer-ec-kbc.c
new file mode 100644
index 0000000000000..62ffaf4d43715
--- /dev/null
+++ b/drivers/input/serio/asus-transformer-ec-kbc.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/i8042.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/serio.h>
+
+struct asus_ec_kbc_data {
+	struct notifier_block nb;
+	struct asusec_core *ec;
+	struct i2c_client *parent;
+	struct serio *sdev[2];
+};
+
+static int asus_ec_kbc_notify(struct notifier_block *nb,
+			      unsigned long action, void *data_)
+{
+	struct asus_ec_kbc_data *priv = container_of(nb, struct asus_ec_kbc_data, nb);
+	unsigned int port_idx, n;
+	u8 *data = data_;
+
+	if (action & (ASUSEC_SMI_MASK | ASUSEC_SCI_MASK))
+		return NOTIFY_DONE;
+	else if (action & ASUSEC_AUX_MASK)
+		port_idx = 1;
+	else if (action & priv->ec->keyboard_mask)
+		port_idx = 0;
+	else
+		return NOTIFY_DONE;
+
+	/*
+	 * The data[0] is the number of bytes following the count byte: one
+	 * status byte plus the payload. The SL101 EC, for example, reports
+	 * keyboard reset as 03 09 fa aa (status 09, ACK fa, BAT aa). Skip the
+	 * count and status bytes and forward every payload byte to serio.
+	 */
+	if (data[0] < 2 || data[0] > ASUSEC_ENTRY_SIZE)
+		return NOTIFY_BAD;
+
+	n = data[0] - 1;
+	data += 2;
+
+	if (port_idx == 0) {
+		/*
+		 * Remap keyboard key codes to match AT layout:
+		 * SEARCH: RIGHT-META [E0 27] -> LEFT-ALT   [11]
+		 * MENU:   COMPOSE    [E0 2F] -> RIGHT-META [E0 27]
+		 */
+		if ((n == 2 || (n == 3 && data[1] == 0xF0)) && data[0] == 0xE0) {
+			u8 *keycode = &data[n - 1];
+
+			switch (*keycode) {
+			case 0x27:
+				*keycode = 0x11;
+				++data;
+				--n;
+				break;
+			case 0x2F:
+				*keycode = 0x27;
+				break;
+			}
+		}
+	}
+
+	while (n--)
+		serio_interrupt(priv->sdev[port_idx], *data++, 0);
+
+	return NOTIFY_OK;
+}
+
+static int asus_ec_serio_write(struct serio *port, unsigned char data)
+{
+	struct asus_ec_kbc_data *priv = port->port_data;
+
+	return i2c_smbus_write_word_data(priv->parent, ASUSEC_WRITE_BUF,
+					 (data << 8) | port->id.extra);
+}
+
+static void asus_ec_serio_remove(void *data)
+{
+	serio_unregister_port(data);
+}
+
+static int asus_ec_register_serio(struct platform_device *pdev, int idx,
+				  const char *name, int cmd)
+{
+	struct asus_ec_kbc_data *priv = platform_get_drvdata(pdev);
+	struct i2c_client *parent = priv->parent;
+	struct serio *port = kzalloc_obj(*port);
+
+	if (!port)
+		return -ENOMEM;
+
+	priv->sdev[idx] = port;
+	port->dev.parent = &pdev->dev;
+	port->id.type = SERIO_8042;
+	port->id.extra = cmd & 0xFF;
+	port->write = asus_ec_serio_write;
+	port->port_data = (void *)priv;
+	snprintf(port->name, sizeof(port->name), "%s %s",
+		 priv->ec->model, name);
+	snprintf(port->phys, sizeof(port->phys), "i2c-%u-%04x/serio%d",
+		 i2c_adapter_id(parent->adapter), parent->addr, idx);
+
+	serio_register_port(port);
+
+	return devm_add_action_or_reset(&pdev->dev, asus_ec_serio_remove, port);
+}
+
+static void asus_ec_notifier_chain_unregister(void *data)
+{
+	struct asus_ec_kbc_data *priv = data;
+	struct asusec_core *ec = priv->ec;
+
+	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);
+}
+
+static int asus_ec_kbc_probe(struct platform_device *pdev)
+{
+	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
+	struct asus_ec_kbc_data *priv;
+	int error;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->ec = ec;
+	priv->parent = to_i2c_client(pdev->dev.parent);
+
+	error = asus_ec_register_serio(pdev, 0, "Keyboard", 0);
+	if (error)
+		return error;
+
+	error = asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_AUX_SEND);
+	if (error)
+		return error;
+
+	priv->nb.notifier_call = asus_ec_kbc_notify;
+
+	error = blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
+	if (error)
+		return dev_err_probe(&pdev->dev, error,
+				     "failed to register blocking notifier chain");
+
+	error = devm_add_action_or_reset(&pdev->dev,
+					 asus_ec_notifier_chain_unregister,
+					 priv);
+	if (error)
+		return error;
+
+	return 0;
+}
+
+static struct platform_driver asus_ec_kbc_driver = {
+	.driver.name = "asus-transformer-ec-kbc",
+	.probe = asus_ec_kbc_probe,
+};
+module_platform_driver(asus_ec_kbc_driver);
+
+MODULE_ALIAS("platform:asus-transformer-ec-kbc");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_DESCRIPTION("ASUS Transformer's Dock keyboard and touchpad driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

