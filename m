Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795202;
	b=E3zmADhgXP7gQ9LQ3cpKWwaF3E3yweQjEZdTMXhKceR5exGVJoaAkNM9MRqfhOgnaz8y
	 CDLj+NO+fjgDuURgmseDz5QsigGECUmvjMSNaau71iJB2BE9+WPDfB3gCBY0aqppj98z1
	 CU/+2wmR8cJjPuWGMDGT7Io7oxT/gZ3wezFuFb3QFfvIo3hry4Z0VVsMnh6F98z4jYJvQ
	 O+50pRt1JFHOgOs7w9IrsNNvoHbLQ8q0sWJO0gIkFHADu0Lg3hhcs3cRnm9eHexzebHQQ
	 UFwy0fPJJTH1nf0BSB0sIGwKjX5xx6siwm46JPY2dygrFlgA8Um4O3xfcEI9Ofxuqwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Dgj4UbbyEsyRyIW26kcdyCzSX0/3ndCVzhgrPch3x2A=;
	b=neRvek76V9E8tTZTFKqSbs0Sn3DG2KSrqTBy7B6G+ADsCVrdmf+4qR5i3vVVrXkhV2Jg
	 O1pHep1Z4yR2CJQY04g/j8E6TbaQwA1TvY0LHgpzv9Tl9z5HP9EbgfA9y1ZOtteIcH8Tq
	 s/vM9OWFmrisY1kvaVKLH1Trx0Ci3Vp7gVmjW1zGl/hS1H0g7Sd/9pA+aH4vuGDx4q8Fz
	 F1ucGMtFwReofMPVAmM+rbZzn2PteKPyasv5hCq9ijMXLwCSWMDG3q+QcVKl5UsiF9PDN
	 LUqxQtPt9CwRFnx0u2ojlAvleU9XYbpOyLopX0B2K3jXr7+ur6Dsxfhwx4cNc5ysz5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=am7TT8aT;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5359E606A33F
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5359E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=am7TT8aT
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so3995885e9.3
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795201; x=1794400001; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dgj4UbbyEsyRyIW26kcdyCzSX0/3ndCVzhgrPch3x2A=;
        b=am7TT8aTdQxJK0aflxxVBT21DPGk0N78/xnKd6AbSRghcBRVSLYuiQKbrPNqIpbNeX
         7wdZHRZDfhF1OIBeThyIj8BNsFmhWYUOzT4QU7gqTP1uMAa09FRT3Mb6QJz92ZEx2wzz
         b1ciLlob58HVJrqYKVytpUMWg407kGbPNB3KvqasXNfFUefQip65PFJRj9pGQmaXXNzH
         l1c89CyVKN06mCMEQMpcFIS5ZllKBypdzven8esU1Ll6n+XpGYWfWsBAlt8Zmvhn/Sah
         i7UOXOw0qaHvJZGc02s4QbuoInOBj/tCGCRgrDzB1hKvruaGAPLXujJblTkUBuyLBTUP
         SHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795201; x=1794400001;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dgj4UbbyEsyRyIW26kcdyCzSX0/3ndCVzhgrPch3x2A=;
        b=x4i5xzC9EbqKprHjyg/GVRon74OYNCHSc6XErUU8vkKFmmONbgurhMvScB7xE6VOX9
         3UEQIc7zsGjNV18s2f5DPCW9zIL9vLAEHfjoQji5W9k32lzOlXS/TaVsaL4jxo1seZpv
         jyZ/GJMPt0tRQkSxVR+d3u5XvMEWmgVz8RI6dm4CaP+1GXucHnfCarQFFoAMQaBOm4bB
         4v7cg5Lzz4pB1oOQwMwW56gYE2YDqElO1EpmSLtTc9owMJLPTO0fdnHnG7mHl3d6BfaS
         +orSGhHFPGvKErMZVh4vMqmyCgGNdDovrc5SJz/vJDBaGvYCNHoSRrsz2cW0cNXqjf/C
         hBkA==
X-Forwarded-Encrypted: i=1; AKwUvByOUfBVZbhcr4uKfK4prbyJr0L7FnhLmJ5Y9p9RdVQKN+Nhmyd8Mr2x9TjDQXCsTgHV+Rg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8SUd2VNyd/OPRvlFFdHSfNbatFTqCJ+hken4yAj1h22xi8xsFP
	3wWT0y31dZyHKl2zN2GMWJtwbZ8d6WLAqAhNKSQ0q49sVguPFKSYXYk3
X-Gm-Gg: AYBFou1qAw2RtTCzZeUZqG/GsZel+t9DY3SeuuzkAXuBFZGUro4fq+0mQjHagAPEqRS
	+akfimaTdVgCvoXxL+pvvgC9Z16KNv8h6xyPI9mea2s0JEFaDmWR/CrZfq+AOZnzeMKSxMNWCHT
	7ngqDWhDHPjMfFejDWpfCI78y9OnW+nTInSzgoCAG80vS3PzuDDgxNkzNm8KcrTOyurHDJ/GQu8
	DA654eIrduzGdICQ30sbg308w6eeSQTBBx90FVvH7+S78fc7w/1/nDngnDQ8w0Lra6qHiSJblZu
	voDRPy9LRwz7OF+FtFygqA7WjrOuVYJ7/n/X6oWBVEAIJ8nUzgnMigtighJxcFGrYI9E69qh+2A
	SiBaqVwljrijByf+bOmhGoo6vnnjpbSnqm0JG+fi6Zt67eEk2ooq/6eBk6hUToQMj9naw5ODdEJ
	ThzIXOfDEKSyUAmkwEfCqadb4Ees0F91/vT5h2SHYXQQgSYUzGyJvIi/GquQQ1MA8ZO9NdhFa/H
	W0FkOZQZ5Iv/z+DDRnmPiURRZEDoBfYsd0wEjOiAahjN6Om/DlEPcDwbevI+tEh8lDQM1OLgvRV
	2GvSLD3widivF+/h6oQ1Wq9andCMyzyNdD62jqCg6Zw+vV/wMQ==
X-Received: by 2002:a05:600c:470a:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4ac16acfe61mr358083475e9.5.1793795200551;
        Wed, 04 Nov 2026 04:26:40 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43da9825bsm50492415e9.15.2026.11.04.04.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:26:38 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v13 7/7] power: supply: Add charger driver for Asus Transformers
Date: Wed,  4 Nov 2026 14:26:06 +0200
Message-ID: <20261104122606.215629-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104122606.215629-1-clamor95@gmail.com>
References: <20261104122606.215629-1-clamor95@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Add support for charger detection capabilities found in the embedded
controller of ASUS Transformer devices.

Suggested-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Suggested-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 .../supply/asus-transformer-ec-charger.c      | 208 ++++++++++++++++++
 3 files changed, 220 insertions(+)
 create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index 856eb81c97ae9..16d0a38b41b7e 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -508,6 +508,17 @@ config CHARGER_88PM860X
 	help
 	  Say Y here to enable charger for Marvell 88PM860x chip.
 
+config CHARGER_ASUS_TRANSFORMER_EC
+	tristate "Asus Transformer's charger driver"
+	depends on MFD_ASUS_TRANSFORMER_EC
+	help
+	  Say Y here to enable support AC plug detection on Asus Transformer
+	  Dock.
+
+	  This sub-driver supports charger detection mechanism found in Asus
+	  Transformer tablets and mobile docks and controlled by special
+	  embedded controller.
+
 config CHARGER_PF1550
 	tristate "NXP PF1550 battery charger driver"
 	depends on MFD_PF1550
diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
index bec4a6263048c..cd3640f4b7480 100644
--- a/drivers/power/supply/Makefile
+++ b/drivers/power/supply/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_CHARGER_RT9471)	+= rt9471.o
 obj-$(CONFIG_CHARGER_RT9756)	+= rt9756.o
 obj-$(CONFIG_BATTERY_TWL4030_MADC)	+= twl4030_madc_battery.o
 obj-$(CONFIG_CHARGER_88PM860X)	+= 88pm860x_charger.o
+obj-$(CONFIG_CHARGER_ASUS_TRANSFORMER_EC)	+= asus-transformer-ec-charger.o
 obj-$(CONFIG_CHARGER_PF1550)	+= pf1550-charger.o
 obj-$(CONFIG_BATTERY_RX51)	+= rx51_battery.o
 obj-$(CONFIG_AB8500_BM)		+= ab8500_bmdata.o ab8500_charger.o ab8500_fg.o ab8500_btemp.o ab8500_chargalg.o
diff --git a/drivers/power/supply/asus-transformer-ec-charger.c b/drivers/power/supply/asus-transformer-ec-charger.c
new file mode 100644
index 0000000000000..c7a6bd2ba533f
--- /dev/null
+++ b/drivers/power/supply/asus-transformer-ec-charger.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/err.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/power_supply.h>
+#include <linux/property.h>
+
+struct asus_ec_charger_data {
+	struct notifier_block nb;
+	struct asusec_core *ec;
+	struct power_supply *psy;
+	struct power_supply_desc psy_desc;
+};
+
+static enum power_supply_property asus_ec_charger_properties[] = {
+	POWER_SUPPLY_PROP_USB_TYPE,
+	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_MODEL_NAME,
+};
+
+static int asus_ec_charger_get_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					union power_supply_propval *val)
+{
+	struct asus_ec_charger_data *priv = power_supply_get_drvdata(psy);
+	enum power_supply_usb_type psu;
+	int ret;
+	u64 ctl;
+
+	/* Check if model name is requested first since it needs no hw access */
+	if (psp == POWER_SUPPLY_PROP_MODEL_NAME) {
+		val->strval = priv->ec->model;
+		return 0;
+	}
+
+	ret = asus_dockram_access_ctl(priv->ec->dockram, &ctl, 0, 0);
+	if (ret)
+		return ret;
+
+	switch (ctl & (ASUSEC_CTL_FULL_POWER_SOURCE | ASUSEC_CTL_DIRECT_POWER_SOURCE)) {
+	case ASUSEC_CTL_FULL_POWER_SOURCE:
+		psu = POWER_SUPPLY_USB_TYPE_CDP;	/* DOCK */
+		break;
+	case ASUSEC_CTL_DIRECT_POWER_SOURCE:
+		psu = POWER_SUPPLY_USB_TYPE_SDP;	/* USB */
+		break;
+	case 0:
+		psu = POWER_SUPPLY_USB_TYPE_UNKNOWN;	/* no power source connected */
+		break;
+	default:
+		psu = POWER_SUPPLY_USB_TYPE_ACA;	/* power adapter */
+		break;
+	}
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_ONLINE:
+		val->intval = psu != POWER_SUPPLY_USB_TYPE_UNKNOWN;
+		return 0;
+
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		val->intval = psu;
+		return 0;
+
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		if (ctl & ASUSEC_CTL_TEST_DISCHARGE)
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE;
+		else if (ctl & ASUSEC_CTL_USB_CHARGE)
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+		else
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int asus_ec_charger_set_property(struct power_supply *psy,
+					enum power_supply_property psp,
+					const union power_supply_propval *val)
+{
+	struct asus_ec_charger_data *priv = power_supply_get_drvdata(psy);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		switch ((enum power_supply_charge_behaviour)val->intval) {
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
+			return asus_dockram_access_ctl(priv->ec->dockram, NULL,
+				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE,
+				ASUSEC_CTL_USB_CHARGE);
+
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
+			return asus_dockram_access_ctl(priv->ec->dockram, NULL,
+				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE, 0);
+
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
+			return asus_dockram_access_ctl(priv->ec->dockram, NULL,
+				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE,
+				ASUSEC_CTL_TEST_DISCHARGE);
+		default:
+			return -EINVAL;
+		}
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int asus_ec_charger_property_is_writeable(struct power_supply *psy,
+						 enum power_supply_property psp)
+{
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct power_supply_desc asus_ec_charger_desc = {
+	.name = "asus-ec-charger",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.charge_behaviours = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) |
+			     BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE) |
+			     BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE),
+	.usb_types = BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN) |
+		     BIT(POWER_SUPPLY_USB_TYPE_SDP) |
+		     BIT(POWER_SUPPLY_USB_TYPE_CDP) |
+		     BIT(POWER_SUPPLY_USB_TYPE_ACA),
+	.properties = asus_ec_charger_properties,
+	.num_properties = ARRAY_SIZE(asus_ec_charger_properties),
+	.get_property = asus_ec_charger_get_property,
+	.set_property = asus_ec_charger_set_property,
+	.property_is_writeable = asus_ec_charger_property_is_writeable,
+	.no_thermal = true,
+};
+
+static int asus_ec_charger_notify(struct notifier_block *nb,
+				  unsigned long action, void *data)
+{
+	struct asus_ec_charger_data *priv =
+		container_of(nb, struct asus_ec_charger_data, nb);
+
+	switch (action) {
+	case ASUSEC_SMI_ACTION(POWER_NOTIFY):
+	case ASUSEC_SMI_ACTION(ADAPTER_EVENT):
+		power_supply_changed(priv->psy);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int asus_ec_charger_probe(struct platform_device *pdev)
+{
+	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
+	struct asus_ec_charger_data *priv;
+	struct device *dev = &pdev->dev;
+	struct power_supply_config cfg = { };
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	priv->ec = ec;
+
+	cfg.fwnode = dev_fwnode(dev->parent);
+	cfg.drv_data = priv;
+
+	memcpy(&priv->psy_desc, &asus_ec_charger_desc, sizeof(priv->psy_desc));
+	priv->psy_desc.name = devm_kasprintf(dev, GFP_KERNEL, "%s-charger",
+					     priv->ec->name);
+	if (!priv->psy_desc.name)
+		return -ENOMEM;
+
+	priv->psy = devm_power_supply_register(dev, &priv->psy_desc, &cfg);
+	if (IS_ERR(priv->psy))
+		return dev_err_probe(dev, PTR_ERR(priv->psy),
+				     "Failed to register power supply\n");
+
+	priv->nb.notifier_call = asus_ec_charger_notify;
+
+	return blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
+}
+
+static void asus_ec_charger_remove(struct platform_device *pdev)
+{
+	struct asus_ec_charger_data *priv = platform_get_drvdata(pdev);
+	struct asusec_core *ec = priv->ec;
+
+	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);
+}
+
+static struct platform_driver asus_ec_charger_driver = {
+	.driver.name = "asus-transformer-ec-charger",
+	.probe = asus_ec_charger_probe,
+	.remove = asus_ec_charger_remove,
+};
+module_platform_driver(asus_ec_charger_driver);
+
+MODULE_ALIAS("platform:asus-transformer-ec-charger");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_DESCRIPTION("ASUS Transformer Pad battery charger driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

