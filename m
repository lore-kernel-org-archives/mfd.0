Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2C480DC4
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 10:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059829; cv=none; b=BdRJGuT/SoF4GB31f6gOK83yBllKpqnBeNNwRrlE6r4xc0KiLk7Rv7Q35U9U9xF/3oBxgBGIxXXSodxvOJGYHzsBNYSzWgEiGbm3cHS72tdkQi0lJtXQcWX/AWUJMXlpDu+dD06rvWqa06LTGpQ7vFqFJH12b4m7os5Jz8b/vlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059829; c=relaxed/simple;
	bh=2mZK2ZGotEARFWTHG636eo19/tYUBtXMmGNm1GwyEfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U7LHJUlp2yQ/vSV/X5B6qHXIhPH0iwehFSus38FSyd873pOqu58RtIBOFYhd7q+7T1LGY5Dx2jff7LWEasFTgF3HqBpnmZbHErpHf+s7EiRWK5QunhlTPnB2QktB/s0TnvW8hZgZw2wHABDElJk/OEUAp4UU08lT/IN50cyy+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jor8GlnY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jor8GlnY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso2183083f8f.2
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 03:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059825; x=1792664625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80gvmjFzYYUW2PKFCzsQYCTYe0k3yn4h1BOFa26pPsA=;
        b=Jor8GlnYUsp2kt7V4XAqW2uSAVdPlK6s9cQsqK0HwsO/BBKH1MBKf0dzEInlwICoFI
         4VbyVZdz3XOzvnRMja+Wfms1bF9gka2R6TKmQobvtg0ftVzIaUo433sXVLgxlBdYEvJD
         xV5+GEcyu4iNK+RzLQa26r5c1q5XIorp5SnH+XZZubc+5BkiAWW2+Qh+RQJtZKK+TvqS
         9m/ecGHPlsSD5CMtkUi+Oznn15wK2RsSfnk3AcH1PyOeqMeSutGJa7Eoabbuv/7VNqsp
         CByNm5WYWdSAqe6O18JIDZ9xNIJizYTAYnZlvxnnuDxh3/2vsIzx/dY3EFpqrjB3eK3d
         +DmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059825; x=1792664625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=80gvmjFzYYUW2PKFCzsQYCTYe0k3yn4h1BOFa26pPsA=;
        b=gdaQ3CNOjPanCyphPgoZs9sBaYQ8ICd/58iArEIZ3SnqMwDdwvAS0sZN5ryBPrlLuz
         gr/ZVfkS/VnmBEUHTB58RdAM+z5YOktVr64N5EINGgH+HugA+iCOnjRW4ZsdGy1OMdVE
         2a92UZ8dCaZMCsgzL0GtLsMiH+fbHecOnmkATU0NDLfnXlZPVpNR3kBfUw5gOmhIOl2e
         0sULMlAkXmMDhYz4kRuH1FFeVaEP0Fe+/lsbKWznnrs3yDx6rQHf6qyQbH35Cch860CL
         TYNDc6eSc0oblzA2IS8UZZKN9ttqae4BS20A3XXPJdVhWhxcJCr233vysnzdS7Dy9V82
         jS1A==
X-Forwarded-Encrypted: i=1; AKwUvBzJeNVBm4tMkQYhDNPhPTZa2Njt5FMSbiKdUHZAunOw0F0+E3thV+Cz02P8GsmHWDmvJOk=@lists.linux.dev
X-Gm-Message-State: AFq9FYIVQKg+rK9g59pC/R1OHCygZaF8+LrnyKiZtrdIqsT8c89u1r6p
	SPZcnsFTIzQK4F8wUFbWNTl+3G2WA68fcCSP9tqOTmVygmDTEZcmFIba
X-Gm-Gg: AYBFou2kSX+R126c3rdd1TcCiYILSlaKW8rfo5JEPvVD7a8Hl0sTPuVvPQt1g+nrLrk
	O1lNjMrz4G55gslcy8phtl28a1sVj7GglHqjIDQNWAxk3FYL7vY//1Gvfp3pS9Bkn09LjmzE7mm
	yefC4lCcK0tO8PmXdSVOWPtPtstEPmhGTrhedjC/HDJreMlEBiUVKswXLYDcOZY1fXWcHO/UGyB
	lBrdJi6VrGg5aFdGuBJOCS3HLQf/sax57n5GVnvn1VPX6yThinwpGeYTeaKnep+FEkNONct29Rg
	7MWQBJQFxnc4Sp+/jjCqO2mx3YM5gi/zGOfC4Hj2K3iBek2ehoWmkOg9cxaI6m/yid4AKWXBozW
	0PA0srPGOO6HJw5rBhwLcMUyi0kZR9RBP64ePWQZjYLQgRIeh+1aTdk3LuPbMw67eS3RyK4vqyu
	o+z/rUTHd5nrzcPsHjejQBYRwdSFpulWz4RlqLeKnKBLJTTZdEPIlb3aO/oTz6JrN2whX3nz5Nv
	8T1cGChVi1onol9lBQ=
X-Received: by 2002:a05:6000:220b:b0:488:8ad2:e169 with SMTP id ffacd0b85a97d-48dbacf039cmr33593925f8f.56.1792059825131;
        Thu, 15 Oct 2026 03:23:45 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm14952542f8f.32.2026.10.15.03.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:23:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] mfd: tps65910: Use devm_register_power_off_handler()
Date: Thu, 15 Oct 2026 13:23:19 +0300
Message-ID: <20261015102320.23760-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015102320.23760-1-clamor95@gmail.com>
References: <20261015102320.23760-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Osipenko <digetx@gmail.com>

Use devm_register_power_off_handler() that replaces global pm_power_off
variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/tps65910.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 6243b66b1b6f2..18b76359046b8 100644
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
@@ -425,9 +426,9 @@ struct tps65910_board *tps65910_parse_dt(struct i2c_client *client,
 }
 #endif
 
-static struct i2c_client *tps65910_i2c_client;
-static void tps65910_power_off(void)
+static int tps65910_power_off(struct sys_off_data *data)
 {
+	struct i2c_client *tps65910_i2c_client = data->cb_data;
 	struct tps65910 *tps65910;
 
 	tps65910 = dev_get_drvdata(&tps65910_i2c_client->dev);
@@ -435,6 +436,8 @@ static void tps65910_power_off(void)
 	regmap_update_bits(tps65910->regmap, TPS65910_DEVCTRL,
 			   DEVCTRL_DEV_OFF_MASK | DEVCTRL_DEV_ON_MASK,
 			   DEVCTRL_DEV_OFF_MASK);
+
+	return NOTIFY_DONE;
 }
 
 static int tps65910_i2c_probe(struct i2c_client *i2c)
@@ -501,7 +504,7 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 	tps65910_ck32k_init(tps65910, pmic_plat_data);
 	tps65910_sleepinit(tps65910, pmic_plat_data);
 
-	if (pmic_plat_data->pm_off && !pm_power_off) {
+	if (pmic_plat_data->pm_off) {
 		/*
 		 * The PWR_OFF bit needs to be set separately, before
 		 * transitioning to the OFF state. It enables the "sequential"
@@ -515,8 +518,13 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 			return ret;
 		}
 
-		tps65910_i2c_client = i2c;
-		pm_power_off = tps65910_power_off;
+		ret = devm_register_power_off_handler(&i2c->dev,
+						      tps65910_power_off, i2c);
+		if (ret) {
+			dev_err(&i2c->dev,
+				"failed to register power-off handler: %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = devm_mfd_add_devices(tps65910->dev, -1,
-- 
2.53.0

