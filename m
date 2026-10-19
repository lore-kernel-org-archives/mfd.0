Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E04C8C54
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404272; cv=none; b=QEpON8TDJXBOBWAr0etSl3Qv3rX7aAJZPDs8iA+qMZlgQoOzo2i2yDjk1ZveO7H6kXlyTt9nR1NUcMu2s2eU56EFdfWaMaaLF1mnnLUs7hOcG3+WvJXHwD4PQfqTCcxthASCnAVClst+WDvOtQNpU4yer5Vi6zIhuFai5xJRK70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404272; c=relaxed/simple;
	bh=USRFVQeS8cDd6ECY1XOmG4yXbLnmHO0XQocSe4wqUMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UweOHlaikTE2bxQHrPBW9mlOMuQGvHg1HJQ6u4ittjLAUZSXtmZuFG9q7181QIrzv5+l+T9JyWKedeneVcG7cRYZldFnOqsa0J7209xmaQb/gtTL0+RVeUUqCuKXP0k6YKYEvlXP9zfqYLzFEMMRdLDvb8kyIC1zgD9DT7KjWCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FoD5dvw/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoD5dvw/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so579964f8f.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404267; x=1793009067; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxaZr3mzp46llJixKla1m55tHI0toVt6qt2rAqY5z3g=;
        b=FoD5dvw/OmO50D71ASkJb99bVlgfSdtWqHnHPYqHRnp3fs+Ozlso/QMjCIpRzj+e/x
         BgmVX+nt7jGrhwA2f4X5TR+pFAEAQd3CU1C7YgpdSUy4WGC8icu5RdAFZuBr9ZQsSjZO
         XRBYMU3qP7+KqabPeG4Q+XFdo4a5HSXwc7uuIDgkHRTQwUIjjO36r0kSWiGYIu2z9d7i
         l0wZ1Hm7cEGh4zEggepqzlXx8l0644EIyHvZKCoEwivx/0mG/ZSEf+AqaLviQKaQiewV
         xitF9gzdRiK/ypgkiV2C4FH0lFFWR89KFigPnlBK7iKIoOS84EKTbI+juQkOw6rEqHFt
         yERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404267; x=1793009067;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxaZr3mzp46llJixKla1m55tHI0toVt6qt2rAqY5z3g=;
        b=JYKwqMBtq8p1ewXbNwlYOlFO4Emt+FO4Sle86EqUkRErdJFJGmOObtMO1i8KC/lZSf
         uMKQZ/piuzHL4LkobttOr5Ye3jclEA+QuYkdQKCE45iymLOhfC+wG/ypouPWSYE2P7JC
         1jh1w+g2YM8MqI/TvigbxT7vWLXtIW8JvgSRy/oYWZXyat5hH7digMOhuweR5CQ95A15
         Q75OXuxpUUZfViz7to6jJhlKiC3fDjZqYGyNYiA/NuDgCOTiBbHIMsoZWj1bLHaYsH9S
         2Tij5VHaW5/Oulat/wOVClyE8NbKiYZnlL5K4qT8tftQgfn6+aDgb8zSdc/0o1ubMwiZ
         YLpg==
X-Forwarded-Encrypted: i=1; AKwUvByZ9Oq2JiRhVn5f+EnuwCu1LcF5LCwbamyO3ByTlOAEcAqEmzLwlavk8/l9O7zFxJ3/pEs=@lists.linux.dev
X-Gm-Message-State: AFq9FYIHXlp3dGu2skyetSaLlkCBKBbpvtSMT5ZS+d+OM/PQd8AP8I83
	zxcmo0qll3yHAm77adEVdPHZsCmzA6GAfgrY/IietPRlvJO4Su+ovqNC
X-Gm-Gg: AYBFou2n9JcPTpp0i/6XvbVDVezOorZJ/wmoMtH/OYdwrb2M37BO11v507HrY0nJ56I
	mzdnpIdjupK1cbGB1m8fkPkAuoKCchpR6N8bWfD4p/or6FObn/D5pjlYw7a1pOFo18+Xpi955KF
	wIRIYyK3ZJi7dzMptl1IQruLmTis5OGzTumnyBwn3AxSwa7A0ASmY2ySkZW2aTtJm2Pf+oBwvml
	Z/MeeXVQtrxdQsOgk8uHhFAsXL5C8yZJ2rbwLjwch+W/9BeuDU8gbH7/J31EA6LvDTPOL1VBSQS
	fEuEPEgRO0+rWaYNvA+a2mKLGSioMvcqzR6jq+J0wks/mYyqfAPxYkrb5tTrdE+cNZtBI7fJMVe
	LgrkUL5337gBoQHHJj1L+gvA9MXrKzotsnQGfM/OlqBak3xDgMOdkndfL4BQWhQEdLgoPqmOCkG
	Bw6fL6nAJU+XS/5Mvrrsyo3ypgMoJ0txglzA1JfOz9ge803gTGJVqki9SPFTBPuNLiYM8C/A6HE
	R/GRdWCjpEbnbj5sfE=
X-Received: by 2002:a05:600c:c4a1:b0:4a1:efd3:9862 with SMTP id 5b1f17b1804b1-4a1efd399c2mr3544885e9.21.1792404267013;
        Mon, 19 Oct 2026 03:04:27 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm177811485e9.5.2026.10.19.03.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:04:25 -0700 (PDT)
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
Subject: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer dock keyboard and touchpad
Date: Mon, 19 Oct 2026 13:04:02 +0300
Message-ID: <20261019100406.103687-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100406.103687-1-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
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
 drivers/input/serio/Kconfig                   |  15 +
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-transformer-ec-kbc.c | 264 ++++++++++++++++++
 3 files changed, 280 insertions(+)
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
index 0000000000000..fa7f7c3f037db
--- /dev/null
+++ b/drivers/input/serio/asus-transformer-ec-kbc.c
@@ -0,0 +1,264 @@
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
+	bool altgr_delayed;
+	bool altgr_suppressed;
+};
+
+static bool asus_ec_kbc_altgr_active(struct asus_ec_kbc_data *priv)
+{
+	return IS_ENABLED(CONFIG_KEYBOARD_ASUS_TRANSFORMER_EC) &&
+		(priv->ec->ext_keys_enabled || priv->altgr_delayed ||
+		 priv->altgr_suppressed);
+}
+
+static void asus_ec_kbc_reset_altgr(struct asus_ec_kbc_data *priv)
+{
+	if (!IS_ENABLED(CONFIG_KEYBOARD_ASUS_TRANSFORMER_EC))
+		return;
+
+	priv->ec->right_alt_pressed = false;
+	priv->ec->special_combo_triggered = false;
+	priv->altgr_delayed = false;
+	priv->altgr_suppressed = false;
+}
+
+static void asus_ec_kbc_sync_altgr_combo(struct asus_ec_kbc_data *priv)
+{
+	if (priv->ec->special_combo_triggered) {
+		priv->ec->special_combo_triggered = false;
+		if (priv->altgr_delayed) {
+			priv->altgr_delayed = false;
+			priv->altgr_suppressed = true;
+		}
+	}
+}
+
+static void asus_ec_kbc_flush_altgr(struct asus_ec_kbc_data *priv)
+{
+	if (!asus_ec_kbc_altgr_active(priv))
+		return;
+
+	asus_ec_kbc_sync_altgr_combo(priv);
+
+	if (!priv->altgr_delayed)
+		return;
+
+	serio_interrupt(priv->sdev[0], 0xe0, 0);
+	serio_interrupt(priv->sdev[0], 0x11, 0);
+
+	priv->altgr_delayed = false;
+}
+
+static bool asus_ec_kbc_handle_altgr(struct asus_ec_kbc_data *priv, bool is_release)
+{
+	bool suppressed;
+
+	if (!asus_ec_kbc_altgr_active(priv)) {
+		asus_ec_kbc_reset_altgr(priv);
+		return false;
+	}
+
+	asus_ec_kbc_sync_altgr_combo(priv);
+
+	if (!is_release) {
+		if (!priv->ec->right_alt_pressed) {
+			asus_ec_kbc_reset_altgr(priv);
+			priv->ec->right_alt_pressed = true;
+			priv->altgr_delayed = true;
+			return true;
+		}
+
+		return priv->altgr_delayed || priv->altgr_suppressed;
+       }
+
+	suppressed = priv->altgr_suppressed;
+	if (!suppressed)
+		asus_ec_kbc_flush_altgr(priv);
+
+	asus_ec_kbc_reset_altgr(priv);
+	return suppressed;
+}
+
+static int asus_ec_kbc_notify(struct notifier_block *nb,
+			      unsigned long action, void *data_)
+{
+	struct asus_ec_kbc_data *priv = container_of(nb, struct asus_ec_kbc_data, nb);
+	unsigned int port_idx, n;
+	u8 *data = data_;
+
+	if (action & (ASUSEC_SMI_MASK | ASUSEC_SCI_MASK)) {
+		if (action == ASUSEC_SMI_ACTION(HANDSHAKE) ||
+		    action == ASUSEC_SMI_ACTION(RESET))
+			asus_ec_kbc_reset_altgr(priv);
+		return NOTIFY_DONE;
+	} else if (action & ASUSEC_AUX_MASK) {
+		port_idx = 1;
+	} else if (action & priv->ec->keyboard_mask) {
+		port_idx = 0;
+	} else {
+		return NOTIFY_DONE;
+	}
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
+		 * ALTGR:  RIGHT-ALT  [E0 11] -> delayed / suppressed
+		 * SEARCH: RIGHT-META [E0 27] -> LEFT-ALT   [11]
+		 * MENU:   COMPOSE    [E0 2F] -> RIGHT-META [E0 27]
+		 */
+		if ((n == 2 || (n == 3 && data[1] == 0xF0)) && data[0] == 0xE0) {
+			u8 *keycode = &data[n - 1];
+
+			switch (*keycode) {
+			case 0x11:
+				if (asus_ec_kbc_handle_altgr(priv, n == 3))
+					return NOTIFY_OK;
+				break;
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
+
+		/*
+		 * Only flush delayed AltGr on key make events, ignoring
+		 * key break codes and PS/2 command responses (ACK, BAT, etc.).
+		 */
+		if ((n == 2 && data[0] == 0xe0) ||
+		    (n == 1 && data[0] > 0 && data[0] < 0x84) ||
+		    data[0] == 0xe1)
+			asus_ec_kbc_flush_altgr(priv);
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

