Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806602;
	b=lEh1DIwIEzXexp+TC/H6ovdpudTsxdDXO+yaIVsbA4Stqy5RZ4gEkY28UeUQT8hDZNfI
	 8leEn1J55KFldrRVCPV7gD7FCySeWePQdrMLjhzRRtTCwUq9UndjlgouiszFBchui38iH
	 Z6LczQRpzsV7stRfLvgF826e9/b3ERVnnEv7/xbwMgLQLT/Nv1lLiD40mPSYRUk23wcrx
	 uragV06wTndUovGCJwVUsryW2tDYtutMtO1iaXirDJBf3l1vGQJ8wcaCCBJAgbkSnrGfN
	 kEtwE3KnUayeFmuoJcZPxmoVYpQ3biFCemHxZLixpe+rJhuZ/CLIoodY6ksm4uahvBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dXu+gupJbDF26JL/eklQw0L6HJEJA1Tcvg7uSiLYsuo=;
	b=nVh6uSurR0FyhiArnOsvYal1tFu9VoaBNpknCY19CAZzZwwRdqFslg0g5+UZwH6SkjUy
	 em9BSf3KAex5X5xyvMf02go/0ms7r2DavjZ5GpmMoRb4OZ4vRKbsZmRCDNJsnj/ynnKiE
	 WB5K3t4lFypoNDJ8SO06OarB3GxA4DrwvoUEdN4QtZSi3KPFfzGeZ7HhHVVxKFTQiSVp0
	 58iI1G62dK6bPZw0a/x9g1PgB0PuJAx64HzWrVBrHh5OiDWspgiHFcxb7eNSltDK85tCK
	 aZnodCsbUe4FFwnLZVa14O94b/DoJMGlWM3Fp7e2CkkfFCvocJY2PoOg54pg1ZCid7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aKX2T2wV;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B43606A6B5
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B43606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aKX2T2wV
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50933bdf4bso1589015366b.1
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 11:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806600; x=1796411400; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXu+gupJbDF26JL/eklQw0L6HJEJA1Tcvg7uSiLYsuo=;
        b=aKX2T2wVnc1qYu/blfXTPxiXZ3u3YcbvN9ZaMKQUUp9AlDG++uO43o6l0moGQ44m6V
         9O6WZQHhzlKYjUgEP7v6WW8swUOWJk1DubHFPHqxUk9thUs+ywOzfahfTcRoAq5jLjgX
         lp8BQAm+Ph2jd+wNdpxV8FTtCrmPmZGtkS2apCGWZ7XnAJEBfdqaPBB4K58lADg/+VXV
         VSqJbK/624s058xQ9PbSyz7pYqszRysuv2Z1T5KRjEAZk3KmEo+xEbXjvH4QHGmAWo+s
         xbIU+eCCyKvVi/OPvtB0jz3htQ0QrvgCw1GHJyO+n3qle/5KBJFzhyXu74sWbTm3FpAm
         /eDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806600; x=1796411400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXu+gupJbDF26JL/eklQw0L6HJEJA1Tcvg7uSiLYsuo=;
        b=AHTm6eaVy9E2/g37QQ/rbV8VSyMcnhj9MXvy6uDQ6U6bSMz93odOaIAxEEw3XpQuMh
         r6mgqVqW6JWcv+EnC8y+0iyiRzZMoZ4JW5SuBVMVCYLkD1T6O8fNehVLb6p2veLt1U9f
         t1/lQ6oEEYNTJeieAp7vbP2rTY7GgRdg0weaqD7WKuvkIUNc7mPsrqlPkA0dTw2r8PlQ
         L8hR8INbm1ceRuKn4oQPFt76MxOKprG+l9IhiaQoS2nxQFJ3uuo//zQ616eCfyordjY2
         kTlEW5VuY+HuCW6zNiGi6VD/WWlNhrQF5eFSjPeHpgGm8Q7+BAAlguUOdspZY4V9+evv
         Iihg==
X-Forwarded-Encrypted: i=1; AL+hErH3MzYRdzZBSj8jg53CX88Jr3y6eoK8bEzbFPbvBcYRwS+Vi6nQWdzfnJom//ZdW9X4mT4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/M8ORoxKKY9aUeyGsPRWHvW5bPrBLv/WBuyhHGkUiEu5UrlTSl
	b/jTD6BW5bF1ojdj71dpNg0xNTr82JhtOe+azoj4Q96v5Ld33nz93/x9B9BrpsMIbas=
X-Gm-Gg: AZFdTZcF2a1N+CZxqa621l11XIFccRAvCHGNBPd8hASjJf4lpIWiEzeHCr2z7i+bWRP
	tzuJi4MaDplJio1zD5JYKdv/OpzbJIPC8Ci9z+2Y4W/f8qFBydEwXmvAiRfA+/tmdrd7FT4RfS6
	uzJFuhaXIdpQclCiYwM5QGygXz/D4PdktAMdnaoBQ5mrsm8D52S0iulSMD2KpUQ77j2MbyUAQkK
	FrV6D8t0liHPoNGJLW3SfMeUeDgNUFtcF0R3I3ZoXIK5VIJBRjLoeSJbhTFeuR0GT4/pyVCfY3W
	vSQBKVldhHUNbnuUHBp1Tsm1SYv8eTicGkHQkaKE11ZC/RItJsyZYNApBCKDfemZFvKmmXbk7As
	JsDXfA+uTFBid0Fx6YLz8tPBBSa/fiTtyFbkFsg1CzYHcEjGmtiP1g0jmooM/Uj2rZPzxZgxnla
	X/6rJtJaBtmA9qJDSnm/xnMthc5l1rusn7+iX48y0JKVXADiy/e9RsGd4GmgTOFty5azJHMsECM
	mkZkJKW7GC5Picssm3gzLzJqF7Zi5C5K4HQahee3/loVAKhk94qIP6ibm2GpBvj8AzoIejEiDDJ
	7xin5PEMvdhUI0KMF5BfGIIMIIBcJpDHbByZIZgHKfGAUzoqyISsWtjh67zHgYGy7zTJhJHxmkw
	/JivxvfRg9CuQH7enYA==
X-Received: by 2002:a17:907:8e95:b0:c46:9745:ac13 with SMTP id a640c23a62f3a-c5131a79f69mr2232389066b.32.1795806599650;
        Fri, 27 Nov 2026 11:09:59 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 19:09:57 +0000
Subject: [PATCH 6/6] power: supply: max77759: follow the supplier from DT
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-max77759-charger-fixes-v1-6-b364a0862d72@linaro.org>
References: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
In-Reply-To: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable+noautosel@kernel.org
X-Mailer: b4 0.14.3

max77759_charger can follow the wrong power supply on systems with
multiple Type-C ports, misses suppliers not named "tcpm-source*", and
starts charging from any unrelated "tcpm-source*" supply even when the
PMIC DT node lists no power-supplies property.

Although the driver passes psy_cfg.fwnode when registering its power
supply, it ignores the power_supply core's DT supplier tracking and
instead uses a global notifier and power_supply_for_each_psy() to match
any supply whose name starts with "tcpm-source".

Replace the global notifier, power_supply_for_each_psy() scan, and
delayed work with .external_power_changed and
power_supply_get_property_from_supplier(), which follow the DT
power-supplies relation. Wire max77759_charger_init() into
power_supply_desc.init so hardware initialization completes before
device_add() exposes the supply to callbacks, serialize supplier syncs
with chg->sync_lock so chg->lock is never held across supplier property
reads (lock order: [consumer epc_sem] -> sync_lock -> supplier epc_sem,
and sync_lock -> chg->lock; get_online() and the regulator ops take only
chg->lock), and invoke max77759_charger_external_power_changed() at the
end of probe for the initial sync.

Behavioural differences from the previous implementation:
- The 3 x 10 ms work retry loop is dropped, matching other charger
  drivers: transient I2C arbitration loss (-EAGAIN) is already retried
  by the I2C core, and any remaining error is logged with dev_err()
  rather than retried by the driver.
- Previously, charging started whenever any "tcpm-source*" supply
  appeared, even if the PMIC DT node lacked a power-supplies property.
  Now, a PMIC node without a configured supplier logs a warning at probe
  and leaves charging off. The in-tree gs101-pixel-common.dtsi gained
  power-supplies only in v7.4-rc1 via commit 3653ea2aa0a2 ("arm64: dts:
  exynos: gs101-pixel-common: add supply and regulator properties"),
  whereas both the charger driver and the power-supplies binding
  reference in maxim,max77759.yaml landed in v7.1-rc1, so booting with a
  v7.1-v7.3 DTB loses charging and logs the warning. Dropping this
  undocumented name-matching fallback is warranted even as a potential
  DT ABI change: maxim,max77759.yaml documents explicit power-supplies
  wiring, and matching by name risks binding to an unrelated power
  supply.

Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
Cc: stable+noautosel@kernel.org # v7.3+ .init, v7.4+ DTS, psy core fixes
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/supply/max77759_charger.c | 219 ++++++++++----------------------
 1 file changed, 65 insertions(+), 154 deletions(-)

diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index fe71e8143954..655061a1dc93 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -8,7 +8,6 @@
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
-#include <linux/devm-helpers.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/linear_range.h>
@@ -21,15 +20,11 @@
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 #include <linux/string_choices.h>
-#include <linux/workqueue.h>
 
 /* Default values for Fast Charge Current & Float Voltage */
 #define CHG_CC_DEFAULT_UA			2266770
 #define CHG_FV_DEFAULT_UV			4300000
 
-#define MAX_NUM_RETRIES				3
-#define PSY_WORK_RETRY_DELAY_MS			10
-
 #define FOREACH_IRQ(S)			\
 	S(AICL),			\
 	S(CHGIN),			\
@@ -76,13 +71,8 @@ struct max77759_charger {
 	struct regmap *regmap;
 	struct power_supply *psy;
 	struct regulator_dev *chgin_otg_rdev;
-	struct notifier_block nb;
-	struct delayed_work psy_work;
-	struct mutex retry_lock; /* Protects psy_work state below */
-	int tcpm_current_limit;
-	int tcpm_online;
-	u32 psy_work_retry_cnt;
 	int irqs[NUM_IRQS];
+	struct mutex sync_lock; /* serializes supplier sync */
 	struct mutex lock; /* protects the state below */
 	enum max77759_chgr_mode mode;
 };
@@ -422,14 +412,6 @@ static int max77759_charger_get_property(struct power_supply *psy,
 	return ret < 0 ? ret : 0;
 }
 
-static const struct power_supply_desc max77759_charger_desc = {
-	.name = "max77759-charger",
-	.type = POWER_SUPPLY_TYPE_USB,
-	.properties = max77759_charger_props,
-	.num_properties = ARRAY_SIZE(max77759_charger_props),
-	.get_property = max77759_charger_get_property,
-};
-
 static int charger_set_mode(struct max77759_charger *chg,
 			    enum max77759_chgr_mode mode, bool *changed)
 {
@@ -460,6 +442,53 @@ static int charger_set_mode(struct max77759_charger *chg,
 	return 0;
 }
 
+static void max77759_charger_external_power_changed(struct power_supply *psy)
+{
+	struct max77759_charger *chg = power_supply_get_drvdata(psy);
+	enum max77759_chgr_mode target = MAX77759_CHGR_MODE_OFF;
+	union power_supply_propval current_limit, online;
+	bool changed = false;
+	int ret, ret2;
+
+	scoped_guard(mutex, &chg->sync_lock) {
+		ret = power_supply_get_property_from_supplier(psy,
+							      POWER_SUPPLY_PROP_ONLINE,
+							      &online);
+		if (!ret && online.intval)
+			ret = power_supply_get_property_from_supplier(psy,
+								      POWER_SUPPLY_PROP_CURRENT_MAX,
+								      &current_limit);
+
+		if (ret) {
+			/*
+			 * power_supply_get_property_from_supplier() collapses
+			 * absent suppliers and supplier read errors to -ENODEV.
+			 */
+			if (ret == -ENODEV) {
+				dev_dbg(chg->dev,
+					"Supplier unavailable, disabling charging\n");
+				ret = 0;
+			}
+		} else if (online.intval && current_limit.intval) {
+			ret = set_input_current_limit(chg, current_limit.intval,
+						      &changed);
+			if (!ret)
+				target = MAX77759_CHGR_MODE_CHG_BUCK_ON;
+		}
+
+		ret2 = charger_set_mode(chg, target, &changed);
+		if (!ret)
+			ret = ret2;
+	}
+
+	if (changed)
+		power_supply_changed(psy);
+
+	if (ret)
+		dev_err(chg->dev, "Failed to sync with supplier: %pe\n",
+			ERR_PTR(ret));
+}
+
 static int enable_chgin_otg(struct regulator_dev *rdev)
 {
 	struct max77759_charger *chg = rdev_get_drvdata(rdev);
@@ -554,8 +583,9 @@ static int max77759_init_irqhandler(struct max77759_charger *chg)
 	return 0;
 }
 
-static int max77759_charger_init(struct max77759_charger *chg)
+static int max77759_charger_init(struct power_supply *psy)
 {
+	struct max77759_charger *chg = power_supply_get_drvdata(psy);
 	struct power_supply_battery_info *info;
 	u32 regval, fast_chg_curr, fv;
 	int ret;
@@ -569,7 +599,7 @@ static int max77759_charger_init(struct max77759_charger *chg)
 	if (ret)
 		return ret;
 
-	if (power_supply_get_battery_info(chg->psy, &info)) {
+	if (power_supply_get_battery_info(psy, &info)) {
 		fv = CHG_FV_DEFAULT_UV;
 		fast_chg_curr = CHG_CC_DEFAULT_UA;
 	} else {
@@ -607,116 +637,15 @@ static int max77759_charger_init(struct max77759_charger *chg)
 	return ret;
 }
 
-static void psy_work_item(struct work_struct *work)
-{
-	struct max77759_charger *chg =
-		container_of(work, struct max77759_charger, psy_work.work);
-	int current_limit, online, ret;
-	bool changed = false;
-
-	scoped_guard(mutex, &chg->retry_lock) {
-		current_limit = chg->tcpm_current_limit;
-		online = chg->tcpm_online;
-	}
-
-	if (online && current_limit) {
-		ret = set_input_current_limit(chg, current_limit, &changed);
-		if (ret) {
-			dev_err(chg->dev,
-				"Unable to set current limit, ret=%d\n", ret);
-			goto err;
-		}
-
-		charger_set_mode(chg, MAX77759_CHGR_MODE_CHG_BUCK_ON, &changed);
-	} else {
-		charger_set_mode(chg, MAX77759_CHGR_MODE_OFF, &changed);
-	}
-
-	if (changed)
-		power_supply_changed(chg->psy);
-
-	scoped_guard(mutex, &chg->retry_lock) {
-		if (chg->psy_work_retry_cnt)
-			dev_dbg(chg->dev,
-				"chg psy_work succeeded after %u tries\n",
-				chg->psy_work_retry_cnt);
-		chg->psy_work_retry_cnt = 0;
-	}
-
-	return;
-
-err:
-	charger_set_mode(chg, MAX77759_CHGR_MODE_OFF, &changed);
-	if (changed)
-		power_supply_changed(chg->psy);
-	scoped_guard(mutex, &chg->retry_lock) {
-		if (chg->psy_work_retry_cnt >= MAX_NUM_RETRIES) {
-			dev_err(chg->dev, "chg psy work failed, giving up\n");
-			return;
-		}
-
-		++chg->psy_work_retry_cnt;
-		dev_dbg(chg->dev, "Retrying %u/%u chg psy_work\n",
-			chg->psy_work_retry_cnt, MAX_NUM_RETRIES);
-		schedule_delayed_work(&chg->psy_work,
-				      msecs_to_jiffies(PSY_WORK_RETRY_DELAY_MS));
-	}
-}
-
-static int max77759_sync_tcpm_psy(struct power_supply *psy, void *data)
-{
-	union power_supply_propval current_limit, online;
-	static const char *psy_name = "tcpm-source";
-	struct max77759_charger *chg = data;
-	int ret;
-
-	if (!strnstr(psy->desc->name, psy_name, strlen(psy_name)))
-		return 0;
-
-	scoped_guard(mutex, &chg->retry_lock) {
-		ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_ONLINE,
-						&online);
-		if (!ret && online.intval)
-			ret = power_supply_get_property(psy,
-							POWER_SUPPLY_PROP_CURRENT_MAX,
-							&current_limit);
-		if (ret) {
-			if (ret != -ENODEV)
-				dev_err(chg->dev,
-					"Failed to get supplier psy property: %d\n",
-					ret);
-			online.intval = 0;
-		}
-
-		chg->tcpm_online = online.intval;
-		chg->tcpm_current_limit = online.intval ?
-					  current_limit.intval : 0;
-		chg->psy_work_retry_cnt = 0;
-	}
-
-	schedule_delayed_work(&chg->psy_work, 0);
-
-	return 1;
-}
-
-static int psy_changed(struct notifier_block *nb, unsigned long evt, void *data)
-{
-	struct max77759_charger *chg = container_of(nb, struct max77759_charger,
-						    nb);
-	struct power_supply *psy = data;
-
-	if (evt != PSY_EVENT_PROP_CHANGED)
-		return NOTIFY_OK;
-
-	max77759_sync_tcpm_psy(psy, chg);
-
-	return NOTIFY_OK;
-}
-
-static void max_tcpci_unregister_psy_notifier(void *nb)
-{
-	power_supply_unreg_notifier(nb);
-}
+static const struct power_supply_desc max77759_charger_desc = {
+	.name = "max77759-charger",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.properties = max77759_charger_props,
+	.num_properties = ARRAY_SIZE(max77759_charger_props),
+	.get_property = max77759_charger_get_property,
+	.external_power_changed = max77759_charger_external_power_changed,
+	.init = max77759_charger_init,
+};
 
 static int max77759_charger_probe(struct platform_device *pdev)
 {
@@ -741,10 +670,10 @@ static int max77759_charger_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to initialize lock\n");
 
-	ret = devm_mutex_init(dev, &chg->retry_lock);
+	ret = devm_mutex_init(dev, &chg->sync_lock);
 	if (ret)
 		return dev_err_probe(dev, ret,
-				     "Failed to initialize retry_lock\n");
+				     "Failed to initialize sync lock\n");
 
 	psy_cfg.fwnode = dev_fwnode(dev);
 	psy_cfg.drv_data = chg;
@@ -754,10 +683,8 @@ static int max77759_charger_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(chg->psy),
 				     "Failed to register psy\n");
 
-	ret = max77759_charger_init(chg);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to initialize max77759 charger\n");
+	if (!chg->psy->num_supplies)
+		dev_warn(dev, "No supplier configured, charging disabled\n");
 
 	chgin_otg_reg_cfg.dev = dev;
 	chgin_otg_reg_cfg.driver_data = chg;
@@ -768,27 +695,11 @@ static int max77759_charger_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(chg->chgin_otg_rdev),
 				     "Failed to register chgin otg regulator\n");
 
-	ret = devm_delayed_work_autocancel(dev, &chg->psy_work, psy_work_item);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to initialize psy work\n");
-
-	chg->nb.notifier_call = psy_changed;
-	ret = power_supply_reg_notifier(&chg->nb);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Unable to register psy notifier\n");
-
-	ret = devm_add_action_or_reset(dev, max_tcpci_unregister_psy_notifier,
-				       &chg->nb);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to add devm action to unregister psy notifier\n");
-
 	ret = max77759_init_irqhandler(chg);
 	if (ret)
 		return ret;
 
-	power_supply_for_each_psy(chg, max77759_sync_tcpm_psy);
+	max77759_charger_external_power_changed(chg->psy);
 
 	return 0;
 }

-- 
2.56.1.839.g22a8290db9-goog

