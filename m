Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D060E375AB5
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 05:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400501; cv=none; b=HFMKYGsHMVnlbZKPawfr2LW1849RDTnORPqlTyFvMsinU/FYnjVIvUc7R2eNUj3MM9E4d8kR0tbKINN6gWFAdCurj/0pBKPFss8pwQf/18/2ZeDvsrnBtjRa1JB8w59V8f653T7Ro3qlm5robTjCHTq+bD5hH7ylP5vwICWpCWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400501; c=relaxed/simple;
	bh=JVJd1uA7kJmMtg7gnJSHrQxlXBH2Ik2vXHS+xlCXQAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yq9JsDk8E1HLIrlFgeqzCUimoEP6ndQk97rpFsPTnnLFS2uKjt1HZ67Uy9bT1PQ3TTQ12uT/oEXJhY+aSdxdZleCA3F2AmqBBIa1h0JJuwlZKkFkmno+NIboTclg68G2cYQsjEJMJivedNliqt++gXl49UDIX2DNCtLriKliaa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6PBnjX/; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6PBnjX/"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8fee9f63d5so2078459a12.0
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 22:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783400499; x=1784005299; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9U8qQri4IbqMdCs9ERAQ6nVfQzBb8+m2oX7EAtJTHN4=;
        b=f6PBnjX/oeQYqaUUprHmqd8PTgR6tC/wUN07/A/RtfkzeEnDpQRmi/6X712WxbZXme
         wVksqRryJkZI5nA7AdToh2LCtcpmXDJUsFEhlp+wd8x3T7Vu+jY4C4Q0avCFVC+IWZhz
         Y+GZVixoOTPRITlbBDkkOOCGMok0BoF/m6M5u9+P7KIHv2ugMEqgpjTo9Rbiey2niMOM
         S6cUJpS4FxCI7QQOYQO1V/7G0Ko7HgI0zxJbILljRwLWFc/fHucjhj21ByXuH6Jm5e0D
         MrmP4MLu0h/oAz8vblw/nGtdA2B4IIcmpwD1j38spFTSXrL2MbkuRx71Q01297dWf7dd
         wD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400499; x=1784005299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9U8qQri4IbqMdCs9ERAQ6nVfQzBb8+m2oX7EAtJTHN4=;
        b=egifuED/F7eX6sOy77jrPTfxn6CXqWY6sBuRFoGOei5jUwop75ahi/Egyu1jCC05iI
         kGo1dFeUjR8z6clvwnr2VcDzep6s6d7DKuVrmHbZFrGyM34hp/FhipBgQaJvvlr8Nt0/
         98teq9CazkgbzHaqJ147Rn4jxcfYylUMGVUDLS76wleSh8+oKF1hSYF/IOWBOE9dnb66
         EBGXqSef4WA9aeaDad536Xw1hoVzdd60a4ysnrO4B+vUWJT36FImQTZXXUj/z5br26vA
         PhyQKDRQm0/WHDrXR6t3ZuxqKJKSR6I46DoM3xmMtPqhHVnbrJq+8a5v5EbNIYc+yGIq
         X0lg==
X-Gm-Message-State: AOJu0YyqcSAywUByQS7tmTZvn31Rex1D5VxP3O+P7BMHYGqQwWIXT+gQ
	NbX/MtCRTwyiHfk5jFen2Uc/PeZCwALaPFxREjOEK4q1u+4AE5ZEWi0I
X-Gm-Gg: AfdE7cn1TrSUdZD+enSS77MZukTzIuvJLknjCqHiNRsPeCcDdHGx7C8o6zKgF3Z7dsw
	SBu1uKGeN/ISdIOmUbb0Y5WGsH49wqOC5knorab1aykxkSDZbULm2aHJEb4g1NkCr5onQvWaK23
	Sc5F/Dj9ezoMeSGzXkr3KUB6I+kAouHA5XAVqj13BHGCKSIndgSAorCq46zUybjiUXKFPcFKJ48
	OUSrfz+19f9c87jeGQk1ZD4YFa9g7KUE0/QizDQYxS0wpXbsVsmOvFQKB3tiqKgtXjQmsaqU53A
	qIHUTycuq7PWoSAxHvuZ8eOnXAIBqKB2wJ78RiW1XBU/0/aQIz9QOCDaAjp9vEITt/UUUIMrovg
	dw8KnqxH48oBWdHCI5t9Rmlq/kQJGCIL0IaJs4APkZPLl3IVf2dwb7QMQ67Hf/bKKmGn4c1fNLg
	wk7CbbX5FCHKmg3hXTSOiXMTC3GhEkiB1ITgoy7qXXT6kzn2o9FCxFhUViD8N8sfTdXKagC7bx7
	WUx
X-Received: by 2002:a05:6a20:728a:b0:3aa:f9cb:d438 with SMTP id adf61e73a8af0-3c08ed57871mr4366586637.21.1783400499138;
        Mon, 06 Jul 2026 22:01:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm3906462c88.0.2026.07.06.22.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:01:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 22:01:31 -0700
Subject: [PATCH v2 2/2] mfd: ucb1x00: Convert Assabet gpio-keys to use
 software nodes
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-ucb1x00-assabet-swnode-v2-2-e6271ea3d3dc@gmail.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
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
 drivers/mfd/ucb1x00-assabet.c | 124 +++++++++++++++++++++++++++++++++---------
 1 file changed, 98 insertions(+), 26 deletions(-)

diff --git a/drivers/mfd/ucb1x00-assabet.c b/drivers/mfd/ucb1x00-assabet.c
index 6a389737c615..ee49ac779d1a 100644
--- a/drivers/mfd/ucb1x00-assabet.c
+++ b/drivers/mfd/ucb1x00-assabet.c
@@ -6,15 +6,18 @@
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
+#include <linux/slab.h>
 #include <linux/mfd/ucb1x00.h>
 
 #define UCB1X00_ATTR(name,input)\
@@ -34,50 +37,119 @@ UCB1X00_ATTR(vbatt, UCB_ADC_INP_AD1);
 UCB1X00_ATTR(vcharger, UCB_ADC_INP_AD0);
 UCB1X00_ATTR(batt_temp, UCB_ADC_INP_AD2);
 
+static const struct property_entry ucb1x00_gpio_keys_props[] = {
+	PROPERTY_ENTRY_STRING("label", "ucb1x00"),
+	PROPERTY_ENTRY_U32("poll-interval", 50),
+	{ }
+};
+
+#define UCB1X00_BTN_PROPS(_idx)						\
+struct property_entry ucb1x00_btn##_idx##_props[] = {			\
+	PROPERTY_ENTRY_U32("linux,code", BTN_0 + (_idx)),		\
+	PROPERTY_ENTRY_GPIO("gpios", &ucb1x00_gpiochip_node,		\
+			    _idx, GPIO_ACTIVE_HIGH),			\
+	PROPERTY_ENTRY_STRING("label", "btn" #_idx),			\
+	PROPERTY_ENTRY_BOOL("linux,can-disable"),			\
+	{ }								\
+}
+
+static const UCB1X00_BTN_PROPS(0);
+static const UCB1X00_BTN_PROPS(1);
+static const UCB1X00_BTN_PROPS(2);
+static const UCB1X00_BTN_PROPS(3);
+static const UCB1X00_BTN_PROPS(4);
+static const UCB1X00_BTN_PROPS(5);
+
+static const struct property_entry * const ucb1x00_btn_props[] = {
+	ucb1x00_btn0_props,
+	ucb1x00_btn1_props,
+	ucb1x00_btn2_props,
+	ucb1x00_btn3_props,
+	ucb1x00_btn4_props,
+	ucb1x00_btn5_props,
+};
+
+struct ucb1x00_assabet_priv {
+	struct platform_device *pdev;
+	struct fwnode_handle *keys_node;
+	struct fwnode_handle *button_nodes[ARRAY_SIZE(ucb1x00_btn_props)];
+};
+
+static void ucb1x00_assabet_remove_nodes(struct ucb1x00_assabet_priv *priv, int n)
+{
+	while (--n >= 0)
+		fwnode_remove_software_node(priv->button_nodes[n]);
+
+	fwnode_remove_software_node(priv->keys_node);
+}
+
 static int ucb1x00_assabet_add(struct ucb1x00_dev *dev)
 {
 	struct ucb1x00 *ucb = dev->ucb;
-	struct platform_device *pdev;
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
+	struct platform_device_info pdevinfo = {
+		.name = "gpio-keys",
+		.id = PLATFORM_DEVID_NONE,
+		.parent = &ucb->dev,
+	};
+	int ret;
+	int i;
+
+	struct ucb1x00_assabet_priv *priv;
+
+	priv = kzalloc_obj(*priv, GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->keys_node = fwnode_create_software_node(ucb1x00_gpio_keys_props, NULL);
+	if (IS_ERR(priv->keys_node)) {
+		ret = PTR_ERR(priv->keys_node);
+		goto err_free_priv;
 	}
 
-	keys.buttons = buttons;
-	keys.nbuttons = ARRAY_SIZE(buttons);
-	keys.poll_interval = 50;
-	keys.name = "ucb1x00";
+	for (i = 0; i < ARRAY_SIZE(ucb1x00_btn_props); i++) {
+		priv->button_nodes[i] = fwnode_create_software_node(ucb1x00_btn_props[i],
+								    priv->keys_node);
+		if (IS_ERR(priv->button_nodes[i])) {
+			ret = PTR_ERR(priv->button_nodes[i]);
+			goto err_free_buttons;
+		}
+	}
+
+	pdevinfo.fwnode = priv->keys_node;
 
-	pdev = platform_device_register_data(&ucb->dev, "gpio-keys", -1,
-		&keys, sizeof(keys));
+	priv->pdev = platform_device_register_full(&pdevinfo);
+	ret = PTR_ERR_OR_ZERO(priv->pdev);
+	if (ret)
+		goto err_free_buttons;
 
 	device_create_file(&ucb->dev, &dev_attr_vbatt);
 	device_create_file(&ucb->dev, &dev_attr_vcharger);
 	device_create_file(&ucb->dev, &dev_attr_batt_temp);
 
-	dev->priv = pdev;
+	dev->priv = priv;
 	return 0;
+
+err_free_buttons:
+	ucb1x00_assabet_remove_nodes(priv, i);
+err_free_priv:
+	kfree(priv);
+	return ret;
 }
 
 static void ucb1x00_assabet_remove(struct ucb1x00_dev *dev)
 {
-	struct platform_device *pdev = dev->priv;
+	struct ucb1x00_assabet_priv *priv = dev->priv;
 
-	if (!IS_ERR(pdev))
-		platform_device_unregister(pdev);
+	if (!IS_ERR(priv->pdev))
+		platform_device_unregister(priv->pdev);
+
+	ucb1x00_assabet_remove_nodes(priv, ARRAY_SIZE(priv->button_nodes));
 
 	device_remove_file(&dev->ucb->dev, &dev_attr_batt_temp);
 	device_remove_file(&dev->ucb->dev, &dev_attr_vcharger);
 	device_remove_file(&dev->ucb->dev, &dev_attr_vbatt);
+
+	kfree(priv);
 }
 
 static struct ucb1x00_driver ucb1x00_assabet_driver = {

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

