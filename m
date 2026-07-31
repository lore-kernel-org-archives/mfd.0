Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F63FFF8C
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 11:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497830; cv=none; b=Hg3of6DyQXG31MB5BfUd7ScYEbNWsJUuyhnUWrqiZBYJ3HPJ6sDE/jTZW5Ug3xNtM9eTwOOmW0v/E4ZXmu+ZNy6D31Ue1Ttl/1nQm8dwhMLuBW0xp0/Myv3nekn2gl5EF+kFpsKNbOjupv8j/rhSc1AEIkcdlEujmpRz9l5LNB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497830; c=relaxed/simple;
	bh=vOJZIL8hR0cnu0DgFb5kL+GSXYmqw7zQYPQUbRUs9eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRPvu02GWBFxJ5zETu0nBFlSYyvpouqzIbzxKuWrogF2NTKirsKC8nWX+ZlkFIylQ/g1sUcmoEz1xyZIZUNzMEzszUekS+V6QgPSyUmxpso05DcisAdicCKNuFnEasFJTKpcdzNL9qgeZiaOIXB1ZgNI74Pb+dp1HngnYRAagno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mx4/qaMS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mx4/qaMS"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so828065f8f.1
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 04:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497825; x=1786102625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ircJJN/vjkOsrZPEPqNXfhhtl9Kl7VXZaKYIBCeg3Vg=;
        b=Mx4/qaMSB91OsE95F54y/3Caq9N5fjN2vN+MElwDVPSgjxLa+TVJ4IA7/qcfTy8s5B
         Lj2485ZHxw8YDsV15eFae+E0D6DFjNkAM3yQYC/eawIUUTgvQBqjAx1tijcZIkSNA7PP
         WOsCSEM5B/N0YRnFy8My3dV+KK6ephdOUl5DsoINaYoHCHpqt7/Nzeh73X7grtYhtW1/
         mYAtNTJhnkPY5lKMVQWHMRLT42tTZiXbFTES13temJU1kQCNgRj/xLAX47TlWsofTT3q
         F1ETtrRi3eBkIzQppeuuWjLuulmGNO9ys1vX/fCQT6yLC0oYpRiXFuXPUKQgdRfwqLP9
         x5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497825; x=1786102625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ircJJN/vjkOsrZPEPqNXfhhtl9Kl7VXZaKYIBCeg3Vg=;
        b=UJhPMrFaYDZBrqvUIVLe0LngNDAppN8fG41MDsCIYLbCEkafsNeDbtaWe9OGal/7tO
         Ycauh6zz6Ahq+JLfK9bXtzUqIZ6l3YfooJ2a5hwh9bN66UTBKLTP6f7VkuGnhn3aEgm+
         iHkMC///9YQXnhHbLX7uNUa+wRl142gcZ6UuCIp33PId4pMqMwL3HGHbNda0b1H31NNv
         1V1FUazTtfULsof982NM3jLEmGJ1pwxXzE95AyZu8mbDGdcaSQ4+MLHY5HEriWUwC3W8
         SpjhuV382/PDDv0Up5iBWQg3YEkKFqgGtVh/ayE0TFsLeU2NJJn6qZpyou7CKGhx6b6A
         kM2A==
X-Forwarded-Encrypted: i=1; AHgh+RqT1kSD70L1GegIbVAGWmGOuypg06C2hwntKSaXB8nKaQVbmQiNSxPHuQuCPv01iyFzqDQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZywsWkj1TyoingZUGe6tKMv51NoZ8RBEoJ6SX7RHN/9c7xcrk
	bxb79hn55iZnQxX/dYVxNyf3OqMuso0xc29X7VynDSftfVmlAeqYI6rA
X-Gm-Gg: AR+sD13LTIcKiKcOOIdvVxSE11xNpifaWZLXoMFaqIxdQV6+esqD2bmhA0oGYALE0bb
	AJgOni/cTT8zwObd9Png1oXlWSGbXcVx2ufqHYhkTukAhlBVLzPhlT/yXx3Sgsmn31Avjk8dFsf
	0/mu0xKoqNke936KzeLN7XCKFNby3LcA74d4jcvZKI6yyFJbsYmE9dLkmBMtt4+io3Ng7yExU+h
	82yxQDPgQKrm2IvZNK9rLPKwh8uZuxpnim5siNeUCMHVPfsMcKHj/akOWhdQ4pGLI16rcpLLAIs
	oRVhYo2e4N5X6F7D9rwWO5FFnM0LQZ9xMzqn4uGmRf0+hlnezGH+plhIaiyid2Iub7e/OR5EEme
	2wZF4Nf93MtfoJATpWIQif/LEgDh6KrJMEkAfn+OI/3mZoM/5WvXAK6fOnjYAuJkdMKvhlrHX45
	dut3QUBDTPsY4k0C7TM421dBwS0/Eg3g/X+FFW5sKTflnAyHC7l4tk8fXEuUXhGF3nfo6Hl8vej
	2px3onz3A==
X-Received: by 2002:a05:6000:420f:b0:46d:d6e0:9cc8 with SMTP id ffacd0b85a97d-47fd2b56316mr3933735f8f.46.1785497824680;
        Fri, 31 Jul 2026 04:37:04 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:03 -0700 (PDT)
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
Subject: [PATCH v6 07/14] mfd: lm3533: Use dev_groups in struct device_driver
Date: Fri, 31 Jul 2026 14:36:25 +0300
Message-ID: <20260731113632.158440-8-clamor95@gmail.com>
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

Instead of creating and removing the device sysfs attributes directly
during probe and remove of the driver, respectively, use dev_groups in
struct device_driver to point to the attribute definitions and let the
core take care of creating and removing them.

No intentional functional impact.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Johan Hovold <johan@kernel.org>
---
 drivers/mfd/lm3533-core.c           | 16 ++++++----------
 drivers/video/backlight/lm3533_bl.c | 22 ++++++++--------------
 2 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 5baf934fac825..53b87958c2c68 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -294,6 +294,11 @@ static struct attribute_group lm3533_attribute_group = {
 	.attrs		= lm3533_attributes
 };
 
+static const struct attribute_group *lm3533_attribute_groups[] = {
+	&lm3533_attribute_group,
+	NULL,
+};
+
 static int lm3533_device_als_init(struct lm3533 *lm3533)
 {
 	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
@@ -414,16 +419,8 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 	lm3533_device_bl_init(lm3533);
 	lm3533_device_led_init(lm3533);
 
-	ret = sysfs_create_group(&lm3533->dev->kobj, &lm3533_attribute_group);
-	if (ret < 0) {
-		dev_err(lm3533->dev, "failed to create sysfs attributes\n");
-		goto err_unregister;
-	}
-
 	return 0;
 
-err_unregister:
-	mfd_remove_devices(lm3533->dev);
 err_disable:
 	lm3533_disable(lm3533);
 
@@ -434,8 +431,6 @@ static void lm3533_device_exit(struct lm3533 *lm3533)
 {
 	dev_dbg(lm3533->dev, "%s\n", __func__);
 
-	sysfs_remove_group(&lm3533->dev->kobj, &lm3533_attribute_group);
-
 	mfd_remove_devices(lm3533->dev);
 	lm3533_disable(lm3533);
 }
@@ -530,6 +525,7 @@ MODULE_DEVICE_TABLE(i2c, lm3533_i2c_ids);
 static struct i2c_driver lm3533_i2c_driver = {
 	.driver = {
 		   .name = "lm3533",
+		   .dev_groups = lm3533_attribute_groups,
 	},
 	.id_table	= lm3533_i2c_ids,
 	.probe		= lm3533_i2c_probe,
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 4d6f680334802..9ef171d3aaeab 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -237,6 +237,11 @@ static struct attribute_group lm3533_bl_attribute_group = {
 	.attrs		= lm3533_bl_attributes
 };
 
+static const struct attribute_group *lm3533_bl_attribute_groups[] = {
+	&lm3533_bl_attribute_group,
+	NULL,
+};
+
 static int lm3533_bl_setup(struct lm3533_bl *bl,
 					struct lm3533_bl_platform_data *pdata)
 {
@@ -304,28 +309,17 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, bl);
 
-	ret = sysfs_create_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to create sysfs attributes\n");
-		return ret;
-	}
-
 	backlight_update_status(bd);
 
 	ret = lm3533_bl_setup(bl, pdata);
 	if (ret)
-		goto err_sysfs_remove;
+		return ret;
 
 	ret = lm3533_ctrlbank_enable(&bl->cb);
 	if (ret)
-		goto err_sysfs_remove;
+		return ret;
 
 	return 0;
-
-err_sysfs_remove:
-	sysfs_remove_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
-
-	return ret;
 }
 
 static void lm3533_bl_remove(struct platform_device *pdev)
@@ -339,7 +333,6 @@ static void lm3533_bl_remove(struct platform_device *pdev)
 	bd->props.brightness = 0;
 
 	lm3533_ctrlbank_disable(&bl->cb);
-	sysfs_remove_group(&bd->dev.kobj, &lm3533_bl_attribute_group);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -377,6 +370,7 @@ static struct platform_driver lm3533_bl_driver = {
 	.driver = {
 		.name	= "lm3533-backlight",
 		.pm	= &lm3533_bl_pm_ops,
+		.dev_groups = lm3533_bl_attribute_groups,
 	},
 	.probe		= lm3533_bl_probe,
 	.remove		= lm3533_bl_remove,
-- 
2.53.0

