Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904605;
	b=xkE+JigYLMOVXQgBI+P+ED6blyWfEsguGTKHLmyhC2ZbDnwRyW6JKG5BKb8V8/lNFCC2
	 ZuRgLtEIijkXmLhV9QbEDldqOUuqRiJONMSerRIPIFkhbRy6eABk74LWmvOG9C/1CpSFc
	 1fUT41QmRItodcLx/iYZylSbHKRJS4fvqqb6fhX67aZES2uByuy0EQlXlMquhUN7U+vdu
	 z0fFb/SigqSCBdttck97+X2LoqWzMzuovfgWoMTKNViTZzfgn1FuhAPsKgtQ2KvbjwlGj
	 SmtrrD4so/7IoJ45mvqTO7zOiC0FI3PiZs8p005dUUnxrGbEUNvctMca0isdHwClNsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vg3iWXsq+9LQItsbYMV41+h+b+1SR3dvuRxMlkyE2es=;
	b=5Em9kjasyyoJcwlQXiRmU6MI9jyG2JXgA5044GT25abP4jaP6wo9ln6B+Ytv9c4uYM2L
	 7yvA2vWPSv3XaSoVJXYa9qgcBEWMUgzu4eUgSKp0S8aCTHz+WM/Ky3jxRDOxPWt6eM8BI
	 YWPQB1h6XymsUo1CQucFB36iF9eDUzepLnoqOl5xG/nQyJzex5ojey5zV3d4519QUTQva
	 14fuyWXWTxgH1OjIGZUzR7DrfVoruKpG+9557NegTQFOlEaJUKonhsKh9v3OnEsWnZi3N
	 WTgZzwj+ZMgfKs3yXpRF56u7RNtbev8Fk7HXuTrg0LLH4rGi44psOHDcOakTO4tqiCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lsbnV0EC;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3405606A33B
	for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 05:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3405606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lsbnV0EC
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35943f55c06so2738058eec.0
        for <mfd@lists.linux.dev>; Sat, 24 Oct 2026 22:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904604; x=1793509404; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vg3iWXsq+9LQItsbYMV41+h+b+1SR3dvuRxMlkyE2es=;
        b=lsbnV0EC9eAfI8tYFxycSjNG702yUQZCVybH2C00MckFPWIHnh80ofAUKhu8Ivmja7
         u1Ku/uc8Ih2zAUvldevsbst9ykY+xOWGFq1RDxVPU29g1VF4G3biEmUFUILgod+DLi74
         gSbmDRspMbQdAnthzgV22OfYVU7hgVNkbOMvqYHvGr8jfONYPNZulTJ8m4bzy3Fzn5Q1
         B0BQGPztO+5gOFXUKoPyWWaZ0ncfezU+F2b5UtqWzytyqOpKhho9OP/C5WysvC4aydGr
         TK1jA4KJUDAPjkflRTmiX7Cxmh2fA/hjX3OrFAVooUSJQIsWJBLpZO3m9oEC6IIKmMIx
         UDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904604; x=1793509404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vg3iWXsq+9LQItsbYMV41+h+b+1SR3dvuRxMlkyE2es=;
        b=gl7HAHtT23slFLKPLwEwhHuLO5Qlhp7nf5WJkt68c7anqtnXIba45MdxuwlzkehVKH
         85XFwxZv7lC+oT3abhzB/q2NF00Oj54yUnO4RWaRCOCk325nTlHNao9NIqbnElC5FVEi
         OsonDJxOxK00GU2/DlbApwSVg3CGHAkY2btW6+j6/5ZOW9YsHqp4aNl/VZV9U7YYtNu3
         1paWQZZTG33NvGuysh+XzWUZe4FdQhXrVN86DAW5tPlvhUYmfNox47lME0cBmto3Qd7Q
         fHAtmSBERIRyHdWiaBg13ExJdO2wjcYcZ9OW9xfpdPiLHsvoPdP2Orv6r6wkLUa1stpj
         G1HQ==
X-Gm-Message-State: AFq9FYLaCsue6aZQyu+zLdWj3Pc9ELBkivh4CS6L6ajk6cvBrydLA1g9
	ApCLIhmU5gxYj0hzIrAl4wXZ5b2j4EObEG0uGGaIKlkUJZTVUGuTuuJr
X-Gm-Gg: AYBFou2x8jflKqEVr1SBOLLYzBtOIMb6kb1Z30klh0UCmfFGf6SLcWbYzXqnoCN6GJZ
	heZLx8l8wzXJZthjqVW8x4v59coSi6OLjosiHzzaglhFsMYOMgmGIqRAyI68ttdNNSPUTdUFNBO
	cKg4ww2wf3EHsx8SlMRtbwc3rnOEu4iX27L7ZacVj3haaKDaMG4WBcOYp+cLSh6s2GCYEwDMCYs
	v/4ICy1mHmLKukeR0lVI2EhP+XXdZ2Jx29C2lrh698KM4MVeHtgdDvYzuPz4v9peoGNFGvKiuvw
	zFWuJVW2fIeJqm0iNlD8E6HJ7A/J+CK1SgQnT9+8UQV/qz+Ea9InjTXRL8JRxkYrwWxC7PJL5pk
	poF18fXAh9dcq9pBDoO08gpIFoEbJ7TEjPfUw+3TZmlOuOb6QcTbaDOaRGw+U0xgDzzoYgmjKWT
	UnwPPHfrAgACl1i9Qlz9dGz+tiaqFNHqKeYuyvTST6JbPPJHqImAP4dp/OJjPitJxvUOYurMaEe
	3IAs/6E1DrGXONeU85wNuXhm89z4W0dR3XhZreXfGThpnHpbd4bZbV9/OEGJ5SNnwD59eaDx2HQ
	YBDEXAGMn9iR8epji+1mUifGuUPlaF+XX6/5CuibdgI=
X-Received: by 2002:a05:7301:5808:b0:369:dc59:7a6f with SMTP id 5a478bee46e88-369e866b781mr8368007eec.1.1792904603687;
        Sat, 24 Oct 2026 22:03:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 22:03:14 -0700
Subject: [PATCH v4 3/4] ARM: s3c: crag6410: convert basic-mmio-gpio and
 LEDs to software properties
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-samsung-kp-v4-3-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
In-Reply-To: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e56a4

Convert the basic-mmio-gpio device and the GPIO-controlled LEDs on the
Cragganmore 6410 board to use software nodes/properties. This allows
removing the crag_leds_table GPIO lookup table.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410.c | 117 +++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 53 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index d0ec7697f366..2855d6d32fa3 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -319,12 +319,17 @@ static const struct property_entry crag6410_mmgpio_props[] = {
 	{ }
 };
 
+static const struct software_node crag6410_mmgpio_node = {
+	.name		= "basic-mmio-gpio",
+	.properties	= crag6410_mmgpio_props,
+};
+
 static struct platform_device_info crag6410_mmgpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= -1,
 	.res		= crag6410_mmgpio_resource,
 	.num_res	= ARRAY_SIZE(crag6410_mmgpio_resource),
-	.properties	= crag6410_mmgpio_props,
+	.swnode		= &crag6410_mmgpio_node,
 };
 
 static struct platform_device speyside_device = {
@@ -835,61 +840,68 @@ static struct s3c_sdhci_platdata crag6410_hsmmc0_pdata = {
 	.host_caps		= MMC_CAP_POWER_OFF_CARD,
 };
 
-static const struct gpio_led gpio_leds[] = {
-	{
-		.name = "d13:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d14:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d15:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d16:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d17:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d18:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d19:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
-	{
-		.name = "d20:green:",
-		.default_state = LEDS_GPIO_DEFSTATE_ON,
-	},
+static const struct software_node crag6410_leds_node = {
+	.name = "leds-gpio",
 };
 
-static struct gpiod_lookup_table crag_leds_table = {
-	.dev_id = "leds-gpio",
-	.table = {
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 0, "cs", 0, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 1, "cs", 1, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 2, "cs", 2, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 3, "cs", 3, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 4, "cs", 4, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 5, "cs", 5, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 6, "cs", 6, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("basic-mmio-gpio", 7, "cs", 7, GPIO_ACTIVE_LOW),
-		{ },
-	},
-};
+#define CRAG6410_LED_NODE(_idx, _name)					\
+static const struct property_entry crag6410_led##_idx##_props[] = {	\
+	PROPERTY_ENTRY_STRING("label", _name),				\
+	PROPERTY_ENTRY_GPIO("gpios", &crag6410_mmgpio_node,		\
+			    _idx, GPIO_ACTIVE_LOW),			\
+	PROPERTY_ENTRY_STRING("default-state", "on"),			\
+	{ }								\
+};									\
+static const struct software_node crag6410_led##_idx##_node = {	\
+	.parent = &crag6410_leds_node,					\
+	.properties = crag6410_led##_idx##_props,			\
+}
 
-static const struct gpio_led_platform_data gpio_leds_pdata = {
-	.leds = gpio_leds,
-	.num_leds = ARRAY_SIZE(gpio_leds),
+CRAG6410_LED_NODE(0, "d13:green:");
+CRAG6410_LED_NODE(1, "d14:green:");
+CRAG6410_LED_NODE(2, "d15:green:");
+CRAG6410_LED_NODE(3, "d16:green:");
+CRAG6410_LED_NODE(4, "d17:green:");
+CRAG6410_LED_NODE(5, "d18:green:");
+CRAG6410_LED_NODE(6, "d19:green:");
+CRAG6410_LED_NODE(7, "d20:green:");
+
+static const struct software_node *crag6410_leds_swnodes[] = {
+	&crag6410_leds_node,
+	&crag6410_led0_node,
+	&crag6410_led1_node,
+	&crag6410_led2_node,
+	&crag6410_led3_node,
+	&crag6410_led4_node,
+	&crag6410_led5_node,
+	&crag6410_led6_node,
+	&crag6410_led7_node,
+	NULL
 };
 
+static void __init crag6410_setup_leds(void)
+{
+	struct platform_device_info leds_info = {
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(crag6410_leds_swnodes);
+	if (err) {
+		pr_err("failed to register leds software nodes: %d\n", err);
+		return;
+	}
+
+	leds_info.fwnode = software_node_fwnode(&crag6410_leds_node);
+
+	pd = platform_device_register_full(&leds_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create leds-gpio device: %d\n", err);
+}
+
 static struct dwc2_hsotg_plat crag6410_hsotg_pdata;
 
 static struct gpiod_lookup_table crag_spi0_gpiod_table = {
@@ -939,12 +951,11 @@ static void __init crag6410_machine_init(void)
 	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
-	gpiod_add_lookup_table(&crag_leds_table);
 	crag6410_setup_keypad();
 	crag6410_setup_gpio_keys();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
-	gpio_led_register_device(-1, &gpio_leds_pdata);
+	crag6410_setup_leds();
 
 	regulator_has_full_constraints();
 

-- 
2.56.0.257.gf7497c7d27-goog

