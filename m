Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1210E3FB7E5
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497828; cv=none; b=Syuw4nuzpxE5wYLiHBhyZ2fpXgiVSHsIyQPhDvTN70cBxveoOGX1TPtNOS7oY3VIZ48BYNVpdow6bKf1Gs0ng3n9cO9eIK5FeksNgjGBpeGe+Rq6+VZ4OTC/Rdc9EY059yguDZ6lXVsNnIRpE6bVTRrGJA3Xv2mmhkniiHMW2GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497828; c=relaxed/simple;
	bh=utgrkcrPEexnwKubYxzeT83rM8IkZKoDxi9jYmOHcaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pIOZLYxatYC+KYvTPIrfs+pt6Y+bnPJr2gPjvq7bU3QhWzTyrrfHv387jx0oifzs5Ctbjym9RNcQbRMthavVbZIHVcV4tWYhPwwAPsTlXTPG38mVC5xWMY+ZTDlm8GtKNhts8jwc1vz7wNKlvJMjpaH4x9Zu4tNMZKqQJpd1Ho0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCodwzkw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCodwzkw"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f7854678cso128251f8f.1
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 04:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497822; x=1786102622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbqFKXAPXCgqFlzsfbnx5DNlo8ULOW4jbUhFKit/7gU=;
        b=TCodwzkw2QGQdU44QxVPn2/onU0XWTDHyO3jh74/+w5EjuhBHm+GuDEVzmQO+/NKU7
         VOJTlJhYGzewx/68SrhAO5QoupCfYDQd0Mg13Mb4ertevmxOck/2weZYB2fNDk671U/5
         +J66j2EX+W4jRb+G5WlGT+Kn9Ov0/yXFEswrtnUZPHU0egOvRUnyCFlqaiAHfKMfqkyq
         k9Ddx0dcDcMZPD3Iq0UMGqELrMyDztiKWDnWJy9KVnKfnq8fD0M5rZS0Pn7eVWbgodGW
         +uc5cVEaqO+mdBrHgoLZqEfD1aFWOCTWGJyK8kl0byNupS2nCRED1uzhsK98DCAz4Yuk
         8iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497822; x=1786102622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbqFKXAPXCgqFlzsfbnx5DNlo8ULOW4jbUhFKit/7gU=;
        b=AsJmBD6q/YgvjDGKCvYiKefxALAuQufxKYhUL6XNHgcKb4I6rr1im3mjoXai+CHYyV
         ol7iV/uY8S33xiBrxaQCGez3eKd+GPts5APQbivugeAwgcTLRX8rf8HrMwsVbuZbbwpE
         f4WacYLJphNTJHAWHq7zN0ouvLJAE/vKITcffS/ryr/LU9JEkA6bRQznJQsS7NPy3D/c
         kXQr1jGjlORMW7/a3noiHJfW4ppn6xsYgNj6rsWIOK399nUrblxNJY6Sq2ZNFU7J88Kc
         7FQGrvs3p+rx4bbGu78+mgD0dLuTD9cJk0+VIExq3cGIXGO/b4J/y8Y9YY/EfD7brB5n
         jhLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrubrV9afuMHMzFMD5yOKn+B7YdUa9dkOeEJijQJAZxQQhGLz6nezVXk0z6te33uhHWMDc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd4IOeNh2sjDhE8dl4Y4E2Q+IZP15TRW+K6AkBDqMqmKENLcW5
	to8ah8qanHsg74GFzcx1DRW8R7b2THfTTnMrEiI9NGVdSoI4ivBSNYM8
X-Gm-Gg: AR+sD12YpB7YA0F3muVdfKyWEgKbwS+21FGaHDGH+q1o3cgPME+TelCCiHb1McMsuVh
	mE9Xl3Q9uT4TOtCwJacPGz+43ozqlAHxAMGRemt/I9TZzblHpKUJf2y8jEONG1SbDaRvM/W6PuL
	qls4ZvXXIsAapRYlMpnclIu0EMpijdWcRlu9SalfIylMhHsoHNS/OzeSPILj2hOq4ewYaKwEeJ+
	uPsGyJNdbVHmx+hiu8Mr9vaZEQfPiUx6MaS1fzXfg7FSbvQ1IkMKBAHLsDe027LsKfTmYjrtU9h
	M09am4eHDxOHX5AUAbiAIDYG58RX885w73U2gUF3d3owM2TooFyfoljH/93A4isaDwTJjMJ2mW1
	MfuVYgKtRfjSrNVNjQmOCb24ty+4r0EVl6o9j8w+PjH4HxefPgKNpp3dqRn9N0NH+aXhTnlzekt
	kzpHcuS/zBEWGVwrz1x+y8H2vAiL+h6P3HdbpVyPujdgVyj6N5hVme1ezZDn8Jx9bMUzEe5SKOW
	f1/czB6sg==
X-Received: by 2002:a05:6000:2997:20b0:47f:9661:6766 with SMTP id ffacd0b85a97d-47fd2b9824emr2824366f8f.61.1785497822299;
        Fri, 31 Jul 2026 04:37:02 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:01 -0700 (PDT)
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
Subject: [PATCH v6 06/14] mfd: lm3533-core: Remove redundant pdata helpers
Date: Fri, 31 Jul 2026 14:36:24 +0300
Message-ID: <20260731113632.158440-7-clamor95@gmail.com>
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

The lm3533_set_boost_freq() and lm3533_set_boost_ovp() functions are used
only in lm3533_device_setup(), which in turn is only called by
lm3533_device_init(). Incorporate their code directly into
lm3533_device_init() to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c | 61 ++++++++++-----------------------------
 1 file changed, 15 insertions(+), 46 deletions(-)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index f9bdc0a1d9bec..5baf934fac825 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -7,6 +7,7 @@
  * Author: Johan Hovold <jhovold@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -23,10 +24,7 @@
 
 
 #define LM3533_BOOST_OVP_MASK		0x06
-#define LM3533_BOOST_OVP_SHIFT		1
-
 #define LM3533_BOOST_FREQ_MASK		0x01
-#define LM3533_BOOST_FREQ_SHIFT		0
 
 #define LM3533_BL_ID_MASK		1
 #define LM3533_LED_ID_MASK		3
@@ -80,35 +78,6 @@ static struct mfd_cell lm3533_led_devs[] = {
 	},
 };
 
-static int lm3533_set_boost_freq(struct lm3533 *lm3533,
-						enum lm3533_boost_freq freq)
-{
-	int ret;
-
-	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
-				 LM3533_BOOST_FREQ_MASK,
-				 freq << LM3533_BOOST_FREQ_SHIFT);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost frequency\n");
-
-	return ret;
-}
-
-
-static int lm3533_set_boost_ovp(struct lm3533 *lm3533,
-						enum lm3533_boost_ovp ovp)
-{
-	int ret;
-
-	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
-				 LM3533_BOOST_OVP_MASK,
-				 ovp << LM3533_BOOST_OVP_SHIFT);
-	if (ret)
-		dev_err(lm3533->dev, "failed to set boost ovp\n");
-
-	return ret;
-}
-
 /*
  * HVLED output config -- output hvled controlled by backlight bl
  */
@@ -406,18 +375,6 @@ static int lm3533_device_led_init(struct lm3533 *lm3533)
 	return 0;
 }
 
-static int lm3533_device_setup(struct lm3533 *lm3533,
-					struct lm3533_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_set_boost_freq(lm3533, pdata->boost_freq);
-	if (ret)
-		return ret;
-
-	return lm3533_set_boost_ovp(lm3533, pdata->boost_ovp);
-}
-
 static int lm3533_device_init(struct lm3533 *lm3533)
 {
 	struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
@@ -437,9 +394,21 @@ static int lm3533_device_init(struct lm3533 *lm3533)
 
 	lm3533_enable(lm3533);
 
-	ret = lm3533_device_setup(lm3533, pdata);
-	if (ret)
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
+				 LM3533_BOOST_FREQ_MASK,
+				 FIELD_PREP(LM3533_BOOST_FREQ_MASK, pdata->boost_freq));
+	if (ret) {
+		dev_err(lm3533->dev, "failed to set boost frequency\n");
 		goto err_disable;
+	}
+
+	ret = regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
+				 LM3533_BOOST_OVP_MASK,
+				 FIELD_PREP(LM3533_BOOST_OVP_MASK, pdata->boost_ovp));
+	if (ret) {
+		dev_err(lm3533->dev, "failed to set boost ovp\n");
+		goto err_disable;
+	}
 
 	lm3533_device_als_init(lm3533);
 	lm3533_device_bl_init(lm3533);
-- 
2.53.0

