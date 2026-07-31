Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD0D426694
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 11:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497848; cv=none; b=M9QFaTFGDIkb+HnHwDZJ1cAS8s9EF6y9kUHQsTkw7Dlq1b5WsTCvdGmStXuHjRdP+kNOI3MnrXE5R2u/SN9UFnvSBW1l1ykvJO586QAobQ3ZmvP/zoLK9BuwL/1dcDf4UZ0WY3FptPpRBk/Fv7raeCKCJp9Vhop+TtrydhBJmuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497848; c=relaxed/simple;
	bh=Fz4O9nNI+mBOWsonwfBBh3DSW/u0KKHFtWGWtm4D2KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQweB57VkFOZrN0w8O80rw6xT/T1kzCnARXKTCXE6xdRlo0pYM39LWC7nFzoKlw8H4hamGUaeWwOhresgEIawsnUzjFc0PToUgHN9FJew6I9ZtK6xw06ZVqOPTX796lGbNVrsw7GVTNEFxLT9uZS/g62pPp2acpAx3hq9M0fG2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/rHwX0+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/rHwX0+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7872abb6so622445f8f.3
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 04:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497837; x=1786102637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PyVHQRL/Wspv3Qk4s8DBLC6Ax3FJKAvcclZCqUsci0=;
        b=S/rHwX0+Vvfhy+8G3YgKg3Bo20/SeZlK0ltzxJByvwjZiYLC1GOdxXL76FO5fNY71W
         QmX6YfVThLAsnNPIHS+cZN67SjUcOVtLXWRe+h5uTTSssmmDNRrEu2Q/LuOew+P5DsJU
         8Lf4bfNRjywtnlFPCs+6YUMdBdMvnBETwvmA4WUVdSkmKfPAN8ZXKYzLHw5c0P4wDfCF
         4Nadq7/h1fSExkm+w47M2+Zmxy8d7BwW6QFFRq7k2nOxBIhlQtsLCRNMPnEVEJpOgT8S
         1QVQE7nAMEHPOa9cztwo8stVVb86LFBig9+6apf2+GDjiBo3LLYJOL3Jo2/XqAGDSPwf
         J3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497837; x=1786102637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PyVHQRL/Wspv3Qk4s8DBLC6Ax3FJKAvcclZCqUsci0=;
        b=ZWLa0sLpb0bjIyknxcaxeU6r13IZRajOjIwSZKsbHYS3y6GZM94+SbT3sl4SgU0+wS
         17ohCgSoIqlT8rNHN8dR+QEzIUe1t3zHb6EqTXcgbaZZi1zigwFWVcSw5/SSL6ryYG8C
         9kZwmaE8BAjdCK7XiVYZy6ly+jo2pR1z+isD7NEDsxyE5Ri5PfpPCOdikz9b+9IXgIrl
         EIB2JFlbABcdNOyxsb9DvwJ1Dkj2MRdHE9EMoyMsQHIkVMf4s4ajWLT6snsAlmAq7g77
         H79yyI5tpbzzVDTprEG6NhG/e9TcYwt05ff3Ud333HPe6hyornfVSn731/QJGw+Rw4Qb
         yvqQ==
X-Forwarded-Encrypted: i=1; AHgh+RohxixlwnDT2m6zGG1gbhL7UzbIGZSJTNOV2oRMBy5DUz0Tt44Iz1PykU6x8fgmJD8sGKE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkb/vX5gTkUxr7yU9gUldq7FMN6S4AvdZFzPNTuDt02xinuXHL
	3hGTzAf1nWRBlzaidaMrmkgodnWPXZCVx4tD+jfF7tto4SfJLWvya5pZ
X-Gm-Gg: AR+sD13GMbLcsqFbD26DcufbCvjtGq+VaDhzO55YrMX0o2eue97yUJoUCMJuAEqEMWi
	6Z//lKjoODeZypRnj0EczRF5c4D1839ND+1JY0a8uVoA419fI1Q/XNTHUyl2XNao/6Y488rJvyU
	VRZ0/VZLGySQ93QVsi05DX6Y8LifAJbcG85ArP3wx+Sno6Y3+0o8erUEp+CVkglPT35TJfanruY
	GgS+2/nTeyY8ysOR6ZOvSZ3xSyUGANgRIWWTZXyxtskKwbMUNsDgUHp6oeX0yHpYS0cHskiwIeW
	vQSuz1JWbmCdyqL/RuUmlVezQtQwq67A1wid6whYkBEobrX9wsYHr7JuqYT4zb51pAqZhnQgJSr
	FnTN9pb0Nj65u9rHD9YeDaHTrfkFh+caAKh9tlrTSp0lLu5pQrXA00BFwQ0j/eJW/sepjaP0bar
	q6XOpq7hK6B54P4IHmAluSxqYpU25dtFPGsVf7l4xI4nv+T7C0VqPAez6irNkPkB9SJD3H0SGO7
	zxEzMYZzA==
X-Received: by 2002:a05:6000:220d:b0:47f:93a1:1126 with SMTP id ffacd0b85a97d-47fd2b6b0cdmr3767923f8f.61.1785497837511;
        Fri, 31 Jul 2026 04:37:17 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:16 -0700 (PDT)
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
Subject: [PATCH v6 11/14] video: backlight: lm3533_bl: Improve logic of sysfs functions
Date: Fri, 31 Jul 2026 14:36:29 +0300
Message-ID: <20260731113632.158440-12-clamor95@gmail.com>
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

Simplify the sysfs logic of properties by switching to macros and proper
regmap helpers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 62 ++++++++++-------------------
 1 file changed, 22 insertions(+), 40 deletions(-)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 5ce237cb42190..2e31a79628d6b 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -22,6 +22,8 @@
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
+#define   CTRLBANK_AB_BCONF_ALS(n)	BIT(2 * (n))
+#define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
 
 
 struct lm3533_bl {
@@ -84,88 +86,68 @@ static ssize_t show_als_channel(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%u\n", channel);
 }
 
-static ssize_t show_als_en(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t show_als_en(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
-	u32 val;
-	u8 mask;
-	bool enable;
 	int ret;
 
-	ret = regmap_read(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF, &val);
-	if (ret)
+	ret = regmap_test_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+			       CTRLBANK_AB_BCONF_ALS(ctrlbank));
+	if (ret < 0)
 		return ret;
 
-	mask = 1 << (2 * ctrlbank);
-	enable = val & mask;
-
-	return scnprintf(buf, PAGE_SIZE, "%d\n", enable);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", ret);
 }
 
-static ssize_t store_als_en(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t len)
+static ssize_t store_als_en(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t len)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	int enable;
-	u8 mask;
 	int ret;
 
 	if (kstrtoint(buf, 0, &enable))
 		return -EINVAL;
 
-	mask = 1 << (2 * ctrlbank);
-
 	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
-				 mask, enable);
+				 CTRLBANK_AB_BCONF_ALS(ctrlbank), enable);
 	if (ret)
 		return ret;
 
 	return len;
 }
 
-static ssize_t show_linear(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t show_linear(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
-	u32 val;
-	u8 mask;
-	int linear;
+	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
-	ret = regmap_read(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF, &val);
-	if (ret)
+	ret = regmap_test_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+			       CTRLBANK_AB_BCONF_MODE(ctrlbank));
+	if (ret < 0)
 		return ret;
 
-	mask = 1 << (2 * lm3533_bl_get_ctrlbank_id(bl) + 1);
-
-	if (val & mask)
-		linear = 1;
-	else
-		linear = 0;
-
-	return scnprintf(buf, PAGE_SIZE, "%x\n", linear);
+	return scnprintf(buf, PAGE_SIZE, "%x\n", ret);
 }
 
-static ssize_t store_linear(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t len)
+static ssize_t store_linear(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t len)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
+	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	unsigned long linear;
-	u8 mask;
 	int ret;
 
 	if (kstrtoul(buf, 0, &linear))
 		return -EINVAL;
 
-	mask = 1 << (2 * lm3533_bl_get_ctrlbank_id(bl) + 1);
-
 	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
-				 mask, linear);
+				 CTRLBANK_AB_BCONF_MODE(ctrlbank), linear);
 	if (ret)
 		return ret;
 
-- 
2.53.0

