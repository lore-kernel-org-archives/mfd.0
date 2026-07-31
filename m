Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0B3D6682
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497824; cv=none; b=JM7THntvWGd2PXNJCdxe5fsX9J87qlCYeBWqtzs8DWSvlpBURtWSRrT/pcZ9+zLlYTr5phRkYCcTkY6yr35sMkq5xQDr0pDGcGufK9QxwSjmlu/g7tI3op5e851wymQcPT3iYeVyVt+mJ4+bnu3X19Uw+5bAYSBK74Qos2GjKYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497824; c=relaxed/simple;
	bh=YR6/oGVbHnlemUZ2JFQ25LTccScQ1moNvQCqFBjDqAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=alXuLDiUnhBLgWMMIHE2GrKE+s3uWQRlxr9G+mEwqqQ6OVTxuTDOtNrPLVrQ7lGzylLN/J0cSMkcvgWE0QesdX8an1di87au53q1dvnPEus+1w6n5yEfTN9DAlkG4JPhZM08s1b6CafNVFRA8pKLD67hZg21DHMAjJmSFewCuEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDo8gzX7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDo8gzX7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso897875f8f.3
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497820; x=1786102620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88fGtlotIiUSgMJVrGrIa8cGFo+gZlVN06W7NwNhiU4=;
        b=PDo8gzX7oyr7HMJqDmYKRMAeW4hRUe1/4QGwT/mWq5WMx8IivJe3gzk5hrXNQ2e/Wv
         Vn7f6DI2fyvAnxniuAfsxtFPl4CXcmzbkmZoelzWKcMN5jPBsXsLUZAxTh3nmPMgGSPX
         p5Q4lRnbqKKmvdlxBIjpAY1v03/PWtkPO58yCAxGW6804RV0kBhKDIDJxpVTasRP5ILI
         kWcrrD/h+OEkARUURnL3OBH2hIE83hv8dilYBGb31b6u8XkxQGxmcAzSMgiDoemtq2yM
         GBLULnje5YN57PMGXLe2HCzm8XZHFTclydGZAIHzOul9wwGOV8aK5GgteWKKhp/rpyvQ
         V7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497820; x=1786102620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=88fGtlotIiUSgMJVrGrIa8cGFo+gZlVN06W7NwNhiU4=;
        b=f/ar5nVFKTcsrcbKb12SZUcGBRmq7uOVhRXdHkBd5T/x3WPhvG2C7VPd2PEL7++/cE
         NUiyfv1l05MQXk8urd7/uqfCPsYPanDi18v5CSj2h+trenjCr9K3uHQjJ8JxHdX1I2mi
         TgRo0XiYXHHnfbp5l0sbAORWNGpCq7NSALQJgy2QsoyLaOI5hTq2EDtUFy+CZ1tEYS6Y
         9mmQyxrIQZz+KTBrCM45aRKaTSzXIpD/tCdztoFEztfmR7sLXtd5hiiXlxf6SS2ZyWkn
         UvsATdMAuCSGKEzF5KGxXBc1+jVZTgEoNMaLTqhBR3GWWcD9lO5XJVCPgMsoCk9/6yEU
         tSbg==
X-Forwarded-Encrypted: i=1; AHgh+RrsLahu/HM4Tdqva0vTRgQieGvxaAVB1Iihkf5VqDkagtH+sumnNE8IDai+P17hIvsZO6A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRrj6SuGSkeQ3XOkWppy0uv+iyRJDCGBISmrEoKSjBCiRtdrcA
	ygLphK00nBmDS522+EkdoXWqGIM5j0nmhDqVT7ftxfFuM0zPMOf3+iMb
X-Gm-Gg: AR+sD12dgEyW+oRIr+L149gYdO1Twbp2mxEXihKCcHAkJv2d2pyidll7Wg3hVREFCWm
	M+53UGFhFKt3XshgAOwPx9E3JobvLWsETQbbQPrj0WUx7vBbLTB7RYmWviiusSI7Y4MrgQHfGTm
	kYHCro5IsZvrr0epCVkKiN+hHk0XXUhxumrANJ0t57JDDZ8zQe/Ebz+MpDxSIOI93v/HBW1HvXM
	oQgM9wcFKObEzgHDUC2IHKeY0E7PT3CEutkeTmy4beZg01ULPcQaEvbh1fIhHjba72W1ZMvvGeF
	gzezfQUpD8l/QZge5vPPBi0mjj7TMwYBSgWPLJZPQyWG8l2jW1YD5GVZtMXx7JKgIAEwmQOuDXi
	ox9op+b6TvHRPVVVw3UxE5VrteG1p41oI7JKLXf9n0qz5ZbrR6EKRJhZwf80frdHjOy2AfIq+bl
	Q/TWcIdXIQVVDQu9kwPoGcNxGI/tDKPPPCq0qNwgxvR8P8jGCHBqhm7s7l9DUCOqK2cKG1vxpjo
	H3SK9SM5Q==
X-Received: by 2002:a05:6000:41e6:b0:47f:9171:c59d with SMTP id ffacd0b85a97d-47fd2b30babmr3903817f8f.32.1785497820326;
        Fri, 31 Jul 2026 04:37:00 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:36:59 -0700 (PDT)
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
Subject: [PATCH v6 05/14] iio: light: lm3533-als: Remove redundant pdata helpers
Date: Fri, 31 Jul 2026 14:36:23 +0300
Message-ID: <20260731113632.158440-6-clamor95@gmail.com>
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

The lm3533_als_set_input_mode() and lm3533_als_set_resistor() functions
are used only in lm3533_als_setup(). Incorporate their code into
lm3533_als_setup() directly to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
---
 drivers/iio/light/lm3533-als.c | 56 ++++++++++------------------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index a9af8e2b965f8..55c35018704c8 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -708,55 +708,31 @@ static const struct attribute_group lm3533_als_attribute_group = {
 	.attrs = lm3533_als_attributes
 };
 
-static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
+static int lm3533_als_setup(struct lm3533_als *als,
+			    const struct lm3533_als_platform_data *pdata)
 {
+	struct device *dev = &als->pdev->dev;
 	int ret;
 
 	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
-				 LM3533_ALS_INPUT_MODE_MASK, pwm_mode);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
-								pwm_mode);
-		return ret;
-	}
-
-	return 0;
-}
+				 LM3533_ALS_INPUT_MODE_MASK, pdata->pwm_mode);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
+				     pdata->pwm_mode);
 
-static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
-{
-	int ret;
+	/* ALS input is always high impedance in PWM-mode. */
+	if (pdata->pwm_mode)
+		return 0;
 
-	if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_MAX) {
-		dev_err(&als->pdev->dev, "invalid resistor value\n");
-		return -EINVAL;
-	}
+	if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
+	    pdata->r_select > LM3533_ALS_RESISTOR_MAX)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid resistor value\n");
 
 	ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
-			   val);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set resistor\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static int lm3533_als_setup(struct lm3533_als *als,
-			    const struct lm3533_als_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
+			   pdata->r_select);
 	if (ret)
-		return ret;
-
-	/* ALS input is always high impedance in PWM-mode. */
-	if (!pdata->pwm_mode) {
-		ret = lm3533_als_set_resistor(als, pdata->r_select);
-		if (ret)
-			return ret;
-	}
+		return dev_err_probe(dev, ret, "failed to set resistor\n");
 
 	return 0;
 }
-- 
2.53.0

