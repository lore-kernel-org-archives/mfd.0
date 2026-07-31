Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7421040B106
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497839; cv=none; b=AsWQ82liYztZU55i5Pl8dIEZ/Zqj+j4IndtrwS6wRBnpGrcKxzAybvwZ806M/e1+3QHYx6Xn0zo9ESNZyx2rjya/w+mpMVTqCrKlV9nAD441RJLTjVCi5jbyxCv4j/1KDaI0Uui3sCWvSbhDkfX8cNL5rZ+KMeuOMLxH8AR7pd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497839; c=relaxed/simple;
	bh=Fsi9naHLvq24ntJl8U1aGARdwDxfue5n7pfYhUOdjEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqLeNgHmbWtjjSutd15UfUIyDPf1CEY4skDIhdRiBI+Uni/4cfwkntJb92ZgyZch/GrGEZXO49twzDCuyY8IEWdPd2cjjmDcK3pbPX6YIAXWLE1JjW9W0eCUoxVqipC0wE6XfP16LPrP8pXarq1qo5NJ9ahdQOLkHxWPe51kfuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oK/KYxk1; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oK/KYxk1"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1f7666a90bso131155866b.3
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497832; x=1786102632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HoJ5QEzgIc1R//Ldk+eAj0/fHRhzYHI0+TPDQsoclNc=;
        b=oK/KYxk120MrdLPU3a7ELEmOcOPbgyZ9j8d+l8NBCVJPacI3tpGErKp1xX+1ykXUnO
         rvHNEwzAxinZhGZKKzwzgO61pw6iD1JZ95jOb6lfryi+Y7jpIgnzp8kNbw+suSq1yeAI
         v1BIE6fF2BnpI6ZBa+TcP3Td83CsfHGnjjM7/EYnbKW0OYoLveYaDZyJdZeIXUNvlu8b
         9/XPjiliaZ0y4RfrRSpSkwC4AC7NiiKUOrNvhhPSMAsfRBXgRTu4OiIZc7xP8//qxXQA
         poBKPE22K0R4JG5rRHB5eGdXzDKuajWUEWALoz1R6EhGbzBY4MyevwxVpYoYzeyy47mG
         7JDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497832; x=1786102632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HoJ5QEzgIc1R//Ldk+eAj0/fHRhzYHI0+TPDQsoclNc=;
        b=IPdzcn3QXjdphfrui10Svzjf89AM4wdkBSLC/W1Cu1RGpT++1yDBRddSs7koubLlV2
         R0ZssHtzgPGDorul6eQ43hEOk+jWDPTO7vD1KVocQdeoUd0enKSuIEZ3rHSavH8HxPwH
         3RMD67N5Y/ZQMW6/SC/3+ZK7UETGsQB3qxNCFBfuY8KIb4I6GPnP+OFNceZHL4z+G/Hz
         KBCgcZ2U/pqlMhp3Kuo8A8Xd9TCVqIS5QAjbJvU2Cy5allkm1ohbPa5D7V8bYHeJ8HJi
         MHspQhz/ZipQ29ExO7Zb0MEyPfi4xmIl+TUaId6DDTQRn0NhDA2DzZ7SIAfwWx5QlkpW
         guLA==
X-Forwarded-Encrypted: i=1; AHgh+Rpd90VuPa2u96TL6VwTsI2TLJ8BLnGzOloY+MLs69831ueXiLFJYIqvyJdzxzmsak/C3aA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx2yhQIOSuLOGl/11GHCYFDH86DaAW5q+S6OGnGW1rL9Fnp2TW
	/R6YVuvjbqa+BbwKahdXkSEHzNntltZHif/odmtPQlxARY0FeMLCOiKW
X-Gm-Gg: AR+sD11M5M08t8EcPVx4B9kBvagy8/VUYGBiNH7OMBCzYfKpEVJj+zaGOLg7YBJ5ioF
	YxEo6BHPLjpshv/62DHtTNWpaoN/gAW6WTDUhWr94nNj33REk11iHtaoFRPsS6C+jK57xadj+iX
	QcRCi01R1SKkMlSFlmPtLaeJKq3uGIQm/6z5cma8cfxgdvJ/4fimRNGZVVRYGLkayZMDGHfNw6L
	fcn1HBkoeSctXRUl7YA8Umphy4bg1VGi4ms1wkekcHS5tgXV4SyBPH/BGcYc4gBzV5LJVwE8h4o
	v8OmzvLp5TBwbWUFxK+sYKfVogKzVTviPsOo1bRieiNAMg17z8VHwhfIBaDWrDNVumRzVJ+kokH
	FTMn59IjeDSnAGO0Fs4YWaHTmqWmVEEAdKE7KSTdTWhQExvL9UkqyloYRd8V9aleREoyDjUW61b
	UkX5hF167NaufsACwhegiHCZyCyVCBfCwTj6PT5+h4sJEDjRkW9jz1ntGpQ6PNJ6i+FUIXBVOrn
	2OpzG5S2w==
X-Received: by 2002:a17:907:c78e:b0:c12:7934:52fd with SMTP id a640c23a62f3a-c1fd250eeb8mr91901366b.32.1785497831684;
        Fri, 31 Jul 2026 04:37:11 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:10 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 09/14] mfd: lm3533: Add support for VIN power supply
Date: Fri, 31 Jul 2026 14:36:27 +0300
Message-ID: <20260731113632.158440-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113632.158440-1-clamor95@gmail.com>
References: <20260731113632.158440-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for 2.7V-5.5V VIN power supply.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c  | 23 +++++++++++++++++++++--
 include/linux/mfd/lm3533.h |  2 ++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index c7c7e71719ae0..2a63df034171e 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/core.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -111,14 +112,25 @@ static int lm3533_set_lvled_config(struct lm3533 *lm3533, u8 lvled, u8 led)
 	return ret;
 }
 
-static void lm3533_enable(struct lm3533 *lm3533)
+static int lm3533_enable(struct lm3533 *lm3533)
 {
+	int ret;
+
+	ret = regulator_enable(lm3533->vin_supply);
+	if (ret) {
+		dev_err(lm3533->dev, "failed to enable vin power supply\n");
+		return ret;
+	}
+
 	gpiod_set_value(lm3533->hwen, 1);
+
+	return 0;
 }
 
 static void lm3533_disable(struct lm3533 *lm3533)
 {
 	gpiod_set_value(lm3533->hwen, 0);
+	regulator_disable(lm3533->vin_supply);
 }
 
 enum lm3533_attribute_type {
@@ -332,7 +344,9 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 		}
 	}
 
-	lm3533_enable(lm3533);
+	ret = lm3533_enable(lm3533);
+	if (ret)
+		return ret;
 
 	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
 				 LM3533_BOOST_FREQ_MASK,
@@ -446,6 +460,11 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->hwen),
 				     "failed to get HWEN GPIO\n");
 
+	lm3533->vin_supply = devm_regulator_get(lm3533->dev, "vin");
+	if (IS_ERR(lm3533->vin_supply))
+		return dev_err_probe(lm3533->dev, PTR_ERR(lm3533->vin_supply),
+				     "failed to get vin-supply\n");
+
 	device_property_read_u32(lm3533->dev, "ti,boost-ovp-microvolt",
 				 &lm3533->boost_ovp);
 
diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 5710e88da45d2..8f72dd41e8f02 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -22,6 +22,7 @@
 struct device;
 struct gpio_desc;
 struct regmap;
+struct regulator;
 
 struct lm3533 {
 	struct device *dev;
@@ -29,6 +30,7 @@ struct lm3533 {
 	struct regmap *regmap;
 
 	struct gpio_desc *hwen;
+	struct regulator *vin_supply;
 
 	u32 boost_ovp;
 	u32 boost_freq;
-- 
2.53.0

