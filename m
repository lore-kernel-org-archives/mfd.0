Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114694;
	b=4cTktl+rPlmIcEAijMxt/nwV5//HBg0Q0tU2FO2vsZVVwxc4+Hjy4NS+yRC3Qrlhv1Y9
	 T2Ocr4mQR2moo9xQIGuG9MpwsPp9BR07V+oBz92mDlngFn6mV8RK6KxcKGJefNULG1X9X
	 xXkV1FqVZZldURhyhzUaQzjRGcLImi9puZcMq7O/RyvEyjQG30DXYSNXIAHNe9xW5+M3Q
	 3FiPP3+6c0BEFYu9ryi0Br8mA7npXfx8zz4wTZGSfIF1lCGkeh2wJP+qopWLwEXfqp2pw
	 n+yDjWphEgHd+uYerWhxiSxkWvWlvyDXHJIvl9a4g1Hx4soMuZj7Pei///TzPj/fJ2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hDdFqYy/BQ5aunaQkAI9mUkJJTdQwxxuNDFrcHBEph0=;
	b=Q2PBPpzUuI9vhxpExYLuUTAHC5SDRAYTEdtt0lz5dZl8aat9Zj0Qpa0pJ+eNGxDMaEEv
	 ilvfmNJ0vdrjE/6pxu2lVssqTxURKDpH1KCnUstBXELjDboC3Q2C8Ua2ALrifBh6pOGst
	 c/lttf0VLR3WU3xqC2XFt9KItEOvL+LDXalLOZpb8Dcn4NbTKDG1xgQOWrF4VEUpnaGo9
	 jzH5MQNlplYmn6cfxpQy/ToKmSAEDC7We2d6A+kjgrRbhfEjgVcDGocpT+vumBb1SwAmv
	 AlYsHQh9VkGtk5zsK3WKNj/0nU7rkph2KYrgtwY2woQz/rRXQEV6YLe+0LuTdOlZ/sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xu3/97Ta";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64441606A330
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 15:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64441606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xu3/97Ta
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40e30c26a4so176432166b.0
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114692; x=1793719492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDdFqYy/BQ5aunaQkAI9mUkJJTdQwxxuNDFrcHBEph0=;
        b=xu3/97TaqUhwujTKvqBj4J/9kbdOeIKg8ZRNKVtnJhv7tN9iXvi82HdolPgwfklf9l
         P67H3AAs0AddF4OWoKCz4MAl/tvjepDEvf/77Py8TuAX8nxwaByOuXpKdwJL90lMEE1D
         81zYyp0WBlZekoc2Qgdng3l4Hd0wTMrjwUl0Ej4rGLhQ2ZwYmg1WitpQHylNMIRx+zc9
         mwdapsNOuTWSlkyYjoKOt9E3hFwyPLKWQ3BvOga8Xwt+CJ13bKtaoprHrSbioCKM2ePE
         quJvTvold0FnRYYmOJYccZZok+aMrnySx588fvwJWZqfZGcws36ULjRpflMYfNC/oEcx
         1+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114692; x=1793719492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDdFqYy/BQ5aunaQkAI9mUkJJTdQwxxuNDFrcHBEph0=;
        b=PRiz+q9Zbwo6OfFUh6chWqv5u+Bgfs/WwX0qoOhEHa7SG0TUDJ8BKltA7uyv+pfTfc
         W65663MaeZ0rab+fAvg+J21b9vq9CQWHyj5vxPihgv9yHpQqtJi0slIPSpn57mqohM/l
         Q7px5ZJ+V2rluCinE+npF9ZMvinujG7XaE+F6XuMjCFfx+WjZxroLSe3SwBBVT60Xp4s
         61/ZDXaytXUkrzqRa749lO30Cb/CF3S706ilFez43IXjEDJj3Zy6p/fMILf50AmiKPX4
         rrLKpDlGncMd4rT7VGwQKZWaDUoYAjNqGvlZ49ARITxcEhDYzcEe1G3sLXA/Cf+aHjCW
         b6bA==
X-Forwarded-Encrypted: i=1; AKwUvBwvynn2dkdg6uGFZQxuY5Gdj6FEg+0Hv+knG8gjmcxJPEFD9922fjX7ca/C1MU0cdn4ywI=@lists.linux.dev
X-Gm-Message-State: AFq9FYIyveohhWyluDyqLo/tdhJAxlg0Y07fomJ4yORcBsctuIipXMce
	iYGhHbSeQZ3luRlEy8q8NjJnzsC0Lz+jIG4dm9FWAyVSF0553pABiUQZ
X-Gm-Gg: AYBFou29oSynDNBUW/7AgexAdCkf4NekgHQnPxZxuIoDZpNVkq6Esp5KCwsb38pUty3
	tOe+5dhvTAVnU/XBwsnTarb4bg9oOitWzvRzTaKAfNOLTllxQi1KayxkBbEth0qqsFunu3l2V6d
	G3bgqJVlNIfIopkkwI51sCoZi2JBis0qdV8QJHDtHDQiZijvv+GU9KdB/hJhwBWKERckgIyFzPW
	BG509+WIZnd272HLMWO3CUp489+dOvt+7D2WnnMtlPJKy/G9JYBPRkFB+hM4g6E3EcTXcQyGwVn
	DTYKWQi6WRBjQubU7nud6c1GI/IbccTAZaQGpa9+L7s5OTnSmuD43x5As+G/kTPt8Uzvvxtp99k
	msKlguverrjGmEdmdpTjwRU7Q/PEkWfOINvy3hAHXjSniaVASSiksLuRwoAeSl31cs/yWJlyW+R
	3nzbYo1fSF5LqKDg0l4Dqrqr/a63EBETuzngQq+9P0du7OSuTL1iOOFxTUWABh9GQviUdNWm1ao
	SidOov6Kn7GoF1GECPp8Fs4JeDAiiod1kKOgYx9QfP52AhX3zDE8cNDrwtKT0TmgKYwDGovNPAg
X-Received: by 2002:a17:906:c10b:b0:c45:219c:7fec with SMTP id a640c23a62f3a-c49a744591bmr269233766b.27.1793114691772;
        Tue, 27 Oct 2026 08:24:51 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm467303866b.37.2026.10.27.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:24:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mfd: tps65910: Use devm_register_power_off_handler()
Date: Tue, 27 Oct 2026 17:24:21 +0200
Message-ID: <20261027152423.194794-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027152423.194794-1-clamor95@gmail.com>
References: <20261027152423.194794-1-clamor95@gmail.com>
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

From: Dmitry Osipenko <digetx@gmail.com>

Use devm_register_power_off_handler() that replaces global pm_power_off
variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/tps65910.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 6243b66b1b6f2..97855bd9cc3c8 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -16,6 +16,7 @@
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/mfd/core.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/mfd/tps65910.h>
 #include <linux/of.h>
@@ -425,16 +426,15 @@ struct tps65910_board *tps65910_parse_dt(struct i2c_client *client,
 }
 #endif
 
-static struct i2c_client *tps65910_i2c_client;
-static void tps65910_power_off(void)
+static int tps65910_power_off(struct sys_off_data *data)
 {
-	struct tps65910 *tps65910;
-
-	tps65910 = dev_get_drvdata(&tps65910_i2c_client->dev);
+	struct tps65910 *tps65910 = data->cb_data;
 
 	regmap_update_bits(tps65910->regmap, TPS65910_DEVCTRL,
 			   DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
 			   DEVCTRL_DEV_OFF_MASK);
+
+	return NOTIFY_DONE;
 }
 
 static int tps65910_i2c_probe(struct i2c_client *i2c)
@@ -501,7 +501,7 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 	tps65910_ck32k_init(tps65910, pmic_plat_data);
 	tps65910_sleepinit(tps65910, pmic_plat_data);
 
-	if (pmic_plat_data->pm_off && !pm_power_off) {
+	if (pmic_plat_data->pm_off) {
 		/*
 		 * The PWR_OFF bit needs to be set separately, before
 		 * transitioning to the OFF state. It enables the "sequential"
@@ -515,8 +515,11 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 			return ret;
 		}
 
-		tps65910_i2c_client = i2c;
-		pm_power_off = tps65910_power_off;
+		ret = devm_register_power_off_handler(&i2c->dev,
+						      tps65910_power_off, tps65910);
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret,
+					     "failed to register power-off handler\n");
 	}
 
 	ret = devm_mfd_add_devices(tps65910->dev, -1,
-- 
2.53.0

