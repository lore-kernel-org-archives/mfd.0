Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB6C3E5A23
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 23:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783379298; cv=none; b=UUUJg/+p6+ByWc6EK9KXoh5YHin0v8FyNklQlHU+pa1yOMKhtMbuO+n9tqWmrtoli/8aQMT1KPYB6kfDq1nHbtvymFby+hd072cZPJ/GduZRq1AWAZMILjTvuhLLytNLtiuvRQDOZKGDJOFD0QcqYBB43X+1GsZuDjJq8NROT2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783379298; c=relaxed/simple;
	bh=b2ZnvjmYlxdAut7fgGOR0UlhnXhDVQEmivV9lwo3aig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pOnmLjv7Z44Up+NZtdNxA94DJqhbk+DFaiSeBj5lToEBxj6SRdLMr9AiIV/Rv90WpITuVeY0rCO2j80K7P8cgRr9uF6H33tLg0mn7gPfZVthZLgezq1ZvfaRxbWPCWy0npgTULUZ3fiUYv/CxWt5nEvtnE85K0jnPi+Y1c0xSX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhUMsUvj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhUMsUvj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc97653887so18906705ad.1
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 16:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783379295; x=1783984095; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lfb1RxD9aMb85dYSn2fxKU1JInUShVKDODq6tQ/OzQ=;
        b=LhUMsUvjFQ2CyXm/2B5z0J11u2tn4iScMvfngWS2JYjiBY7TazBbcJ83Jrwec15G6C
         WvN44mY/kli+GtXjszWu3krdXZ+eZZ68YJ488OcIf3YuLHtQVFY5KEbh7t2OaSB3jqIT
         VBYCIit7qloX3XsthFdnjvdx3L8AOMBZG7/WmHUO7ER7+a6vWxBtvg4G9KOPAheSLh/C
         eqFvGviTYv1Oa7UzY8IMAP1SbxUjV0A6ZvCcd4Zsn9onK2dowcKwJffPYE0cORFrZXlD
         Xhj8MO2RMGVwfx7jIZ8WP+ljfAVPVr9IpYYZk5ih7lXakWzqAmoGq2p4hYaInsjyzkkg
         nG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783379295; x=1783984095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3lfb1RxD9aMb85dYSn2fxKU1JInUShVKDODq6tQ/OzQ=;
        b=D9E/rq/1w6auOpM4XxFu13ZOhaMl6WHGVeIOdccB3sLkvG064sCZ9UyJm6jZuUPRB+
         iq1ffFQ/N+FqyC/fKmzOQZwxh90ZkA8oZGgQqFO0doZdDymyoNTk1oaTjDCqt6QoxSb/
         NY/sWr5/6VJhgoly0rFyWr0HHOAxfpfAg0G6KVFOLblDThwmIP/WX9fELUebAFUIUn+v
         BwuomnGlOO3QRgj0WTAWKGirDGmm54/DyOpHeKG/oBH+2tqgnFURnmvsWSMJxQvTsxxc
         U//ZiaItXE+CVc09PQ7cnzuGwX+wMY0p3IERk2RNi4H7yMIETQfovEAIEClfWFKaZ79D
         e4Mg==
X-Gm-Message-State: AOJu0YzE7KuNpQBehdqcBjn5cNlT91B8EEr00l/i88kMy2qgIic9dqIV
	3gAzGPXpAaPMYDl0qBtZaKN7kzajyGoqWD0KxRMDyER9ncKGpZk0IC4x
X-Gm-Gg: AfdE7cnobm2wHkMCPDNDYWnMkmUku7D5rzD8twk3vlnlNprGBgh+kD+6E64xtUNiFuc
	eFWnsqQdEfbDiYlxGtSzwjD5BWJuo9AcaGspvlwNA3pktiqZ/D2zo079CxnvMuGQbmLgY9liRXo
	qTBxINgQzyW7K5rBfz6sfusVaXdMIOKrcKydvc+G6gOdJiZ7SQCKfaK2DNvUnu5FLKZnwGlc/1t
	pKy2q8r+WRPXsehT6/nUGambnv0Ic8XNFp4Azkmp9+SFjaUxV69V4arg+F/3s1T5t/EjG1GbIhi
	pAQxSvlHDLJBQbwnOwyqESGlDYzJa3pyW0FSZ38Oe2ukv+mDFVj38kE2h24FKfL7Uxddyhoh6hQ
	353X4wFFG5aYIvIWpAHJ29yRylvZrgatTXI5hwRYADgNE3o2dV2cdKWc9JwafPtWISMb0Qf5p5m
	ALNGJCiZuJVKc3nPlftAFkJivN6rGLGSqofMS0Y5Qsj66THQn5IuQCt1WD5R3939GNbwpJ3qdIk
	Dnh
X-Received: by 2002:a17:90a:dfcc:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-3875595ae02mr2657273a91.10.1783379294261;
        Mon, 06 Jul 2026 16:08:14 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f598dsm1259148eec.6.2026.07.06.16.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 16:08:13 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 16:08:05 -0700
Subject: [PATCH 2/2] mfd: ucb1x00: convert Assabet gpio-keys to use
 software nodes
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-ucb1x00-assabet-swnode-v1-2-6102eabd31d0@gmail.com>
References: <20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com>
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Convert the legacy gpio-keys platform device on the StrongARM SA-1100
Assabet evaluation board to use software nodes and device properties.
This allows describing the buttons and their GPIO bindings via software
nodes so that platform data support can eventually be removed from the
gpio-keys driver.

Define static software nodes for the gpio-keys device and the six button
child nodes at file scope using relative pin indexing on the UCB1x00 GPIO
controller node. In ucb1x00_assabet_add(), register the software node
group and use platform_device_register_full() to register the device.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/ucb1x00-assabet.c | 88 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 66 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/ucb1x00-assabet.c b/drivers/mfd/ucb1x00-assabet.c
index 6a389737c615..c11fe96f767d 100644
--- a/drivers/mfd/ucb1x00-assabet.c
+++ b/drivers/mfd/ucb1x00-assabet.c
@@ -6,15 +6,17 @@
  *
  *  We handle the machine-specific bits of the UCB1x00 driver here.
  */
-#include <linux/module.h>
-#include <linux/init.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/fs.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/init.h>
 #include <linux/input.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/proc_fs.h>
+#include <linux/property.h>
 #include <linux/mfd/ucb1x00.h>
 
 #define UCB1X00_ATTR(name,input)\
@@ -34,31 +36,71 @@ UCB1X00_ATTR(vbatt, UCB_ADC_INP_AD1);
 UCB1X00_ATTR(vcharger, UCB_ADC_INP_AD0);
 UCB1X00_ATTR(batt_temp, UCB_ADC_INP_AD2);
 
+static const struct property_entry ucb1x00_gpio_keys_props[] = {
+	PROPERTY_ENTRY_STRING("label", "ucb1x00"),
+	PROPERTY_ENTRY_U32("poll-interval", 50),
+	{ }
+};
+
+static const struct software_node ucb1x00_gpio_keys_node = {
+	.name = "ucb1x00-gpio-keys",
+	.properties = ucb1x00_gpio_keys_props,
+};
+
+#define UCB1X00_BTN_PROPS(_idx)						\
+static const struct property_entry ucb1x00_btn##_idx##_props[] = {	\
+	PROPERTY_ENTRY_U32("linux,code", BTN_0 + (_idx)),		\
+	PROPERTY_ENTRY_GPIO("gpios", &ucb1x00_gpiochip_node,		\
+			    _idx, GPIO_ACTIVE_HIGH),			\
+	PROPERTY_ENTRY_STRING("label", "btn" #_idx),			\
+	PROPERTY_ENTRY_BOOL("linux,can-disable"),			\
+	{ }								\
+};									\
+static const struct software_node ucb1x00_btn##_idx##_node = {		\
+	.parent = &ucb1x00_gpio_keys_node,				\
+	.properties = ucb1x00_btn##_idx##_props,			\
+}
+
+UCB1X00_BTN_PROPS(0);
+UCB1X00_BTN_PROPS(1);
+UCB1X00_BTN_PROPS(2);
+UCB1X00_BTN_PROPS(3);
+UCB1X00_BTN_PROPS(4);
+UCB1X00_BTN_PROPS(5);
+
+static const struct software_node * const ucb1x00_assabet_swnodes[] = {
+	&ucb1x00_gpio_keys_node,
+	&ucb1x00_btn0_node,
+	&ucb1x00_btn1_node,
+	&ucb1x00_btn2_node,
+	&ucb1x00_btn3_node,
+	&ucb1x00_btn4_node,
+	&ucb1x00_btn5_node,
+	NULL
+};
+
 static int ucb1x00_assabet_add(struct ucb1x00_dev *dev)
 {
 	struct ucb1x00 *ucb = dev->ucb;
+	struct platform_device_info pdevinfo = {
+		.name = "gpio-keys",
+		.id = PLATFORM_DEVID_NONE,
+		.parent = &ucb->dev,
+		.swnode = &ucb1x00_gpio_keys_node,
+	};
 	struct platform_device *pdev;
-	struct gpio_keys_platform_data keys;
-	static struct gpio_keys_button buttons[6];
-	unsigned i;
-
-	memset(buttons, 0, sizeof(buttons));
-	memset(&keys, 0, sizeof(keys));
-
-	for (i = 0; i < ARRAY_SIZE(buttons); i++) {
-		buttons[i].code = BTN_0 + i;
-		buttons[i].gpio = ucb->gpio.base + i;
-		buttons[i].type = EV_KEY;
-		buttons[i].can_disable = true;
-	}
+	int ret;
 
-	keys.buttons = buttons;
-	keys.nbuttons = ARRAY_SIZE(buttons);
-	keys.poll_interval = 50;
-	keys.name = "ucb1x00";
+	ret = software_node_register_node_group(ucb1x00_assabet_swnodes);
+	if (ret)
+		return ret;
 
-	pdev = platform_device_register_data(&ucb->dev, "gpio-keys", -1,
-		&keys, sizeof(keys));
+	pdev = platform_device_register_full(&pdevinfo);
+	ret = PTR_ERR_OR_ZERO(pdev);
+	if (ret) {
+		software_node_unregister_node_group(ucb1x00_assabet_swnodes);
+		return ret;
+	}
 
 	device_create_file(&ucb->dev, &dev_attr_vbatt);
 	device_create_file(&ucb->dev, &dev_attr_vcharger);
@@ -75,6 +117,8 @@ static void ucb1x00_assabet_remove(struct ucb1x00_dev *dev)
 	if (!IS_ERR(pdev))
 		platform_device_unregister(pdev);
 
+	software_node_unregister_node_group(ucb1x00_assabet_swnodes);
+
 	device_remove_file(&dev->ucb->dev, &dev_attr_batt_temp);
 	device_remove_file(&dev->ucb->dev, &dev_attr_vcharger);
 	device_remove_file(&dev->ucb->dev, &dev_attr_vbatt);

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

