Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808583;
	b=LoON9LgxHPqQSUnwg3sY+YU5hiwHHQbfWX63DI9g1mloO4UbZEBwqwXawFv4sIBIpytD
	 02NBriqJgiPsnazd+RhKWcMXBoDwfAA0hX54Cp+iTsolN7WRqPK1QdSH4M7FokkIRWVO9
	 St6NTAOI5vCuGSYkD8rigKj0roWEt6QTx713Ej03OGNIJlIzGdBgTHpoYALquvdYyXnNr
	 ey+pJKTM5zrW2rRhCkEa3Tv57Wib7U1gui1abxfero6jEDmVzDbN37UA8uTRTfDX1SljK
	 vrgsHluCSE92g32/GEHyA3+BCeqpZd2gpMbcx0WUA7vqArlemuS1/B3ZIfcDqZe/4yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=PcOOxxq2ohI8gSGHxj1Mt9IYxr9F0UQJs5C2ymn1BC8=;
	b=TL/HXfGAAnogtLaDegSIQ6NfDvLkUa1bnO6v5Pxim4guDrWz5JDc7bsY7K7J4Nsul8Na
	 eb0HsSiTod3Hj24eHKup5zmzPCP4Xgb0p2AEwGWa+MXz8T1DZjZ28lTiLVuHkd3jBoVmi
	 X2bWzyQ6KrjhcYH7/QprD15o19fu8q2+DqqKgSZjGmJ1emoyLN4IJjNCEGmeW2RO1JHkB
	 liSFP2XP6CjEtN3lzg0b25F4H8DtYjmSzU5lP5RhGQ+APzO9Rbz4EePK8z02pOsEFnguW
	 mBxADjZ2jCVO9/lgS8GbNOvi/SVwCym3Z5IayJ2HV9DzJ5ReGyO2SKWzQ7dodwresfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OKWmyA8H;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67D606A33E
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 16:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC67D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OKWmyA8H
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a208d93758so9765495e9.3
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 08:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793808581; x=1794413381; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PcOOxxq2ohI8gSGHxj1Mt9IYxr9F0UQJs5C2ymn1BC8=;
        b=OKWmyA8HI/695MKdpnPw2Y3Xc5YITEL4iHphdJIOC8+Vhx/4+D4EiKZlkQ00jX9Biz
         nxboyxVDg5gAudK2i401v3evecoXk65peGYcX4CyleZJxeGOL9yZ2lL2c8f5XwlAjG+F
         6HKkcP9g8LMJ8QiFDaxPrCeP7PhV4T4D2da6TF024A/AuGf6lFFCHdoiOYZOq3okKjQm
         Et55jntmJDMM7iKqme5LtOtRByZpxyfSBHX3zZ8eVluk9dBGQt/vk/dGRgzkE7UxhYf7
         YU32PU0F1nGywNuasj/VVBuswEhBq0b8qyogtE4AJOmCCO9B2rBDSjIqDQUTu6xDiAPp
         ih6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808581; x=1794413381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcOOxxq2ohI8gSGHxj1Mt9IYxr9F0UQJs5C2ymn1BC8=;
        b=hyFiKzJvhpZDWcYRdlCgId9qWr5IG804JaOiLNZ3jEpThaniD+LgMi1BYXheiAafN7
         0K9po/21wdy8pD7wxwG1qJ0gqXOdY/QWgIVL1f9gNp9V/o8ZpxXb2tcvmnyNWNZgOGPN
         s/iFCc1oTENMQ1HOAs7aeyZ/uX+Cz1AU6ynNyxoPEi6s9oujrx8eyFlqNabGJF5lBPIq
         eURl8CpLh2bScRpPwLg7IwQC90b90hf59NgyRZIPzZqgbzqBm1RyIjnG1f43GAD4zp4m
         CwmxW7OvrRFel1cG7OYfBsyhdjmZjNNFPWms4QN0Pw1l42C8CGZxAG7UIAP0EMoU0CJj
         5Mfg==
X-Gm-Message-State: APuU4Z9f2wxVzk6upCmY4x7ShbaUZ1QFivq1P0JzZD4tCYKxbrHed570
	ErveW5L7YJO25Eor1ss8CrwOJbuz933Ik/mUmU6g7a5NazBDJEsCUVODitOMqMKtgOs=
X-Gm-Gg: AYBFou1ASaljx1c0Cj/9baTYBa9QvtblSVJ37+cLP8rkdLnRfIr3dwDHnh85t8s1q8c
	IF/wp4NIkW2nB/dmDqPx1zIXXx6xWjTp2/PslcLz5V85fm6V+RR8F+fjPqRjLFvoERh8c4U5sZJ
	eqVRvKxyofHHWXdRhmIuCuc2oMJu30doWuJCLvWgBwmvVqYLvd8jVww3iYAAr7uww+0nLXXjnx9
	j/GQTzvv59pbqZS/Q9b6L3p+Stb+4Ub88kq05uJ98eNiwATN/Bx4s0yA9M7D8vjZTG3c0yupAk0
	WIfg3MYNNP4uiMwz96KHTdtl6YTfGmzx062X0F0FMsxXRyNLh+qy346DSbGs/LEUcmRdlYJx2Sj
	Eo1+sndOk1RUVODqxQOJXaeyD9yze7vIESpiM1FN74c4u8KezPmpROTcb0T7bg4yi/I+upMqXK4
	w4y2yHkZKGdNSEvTUAfaPNT7RNGlbEEDPWS2DcBUuy9KcUbDZab3JrPmCsobc2h+yM9xG6yLTjN
	soJMWtL9lXvCiEmsiVHVeDYmFG00fsGYMc+YQ+q4SfuYRtGtbK9zenQALaUguTj8CGWDJZvO4bx
	gCMgatq2KrkC+f3mGbJEsuchfYOFswXj+hg3qzMdIxVNfQ==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4ac17d168b1mr414966515e9.11.1793808580996;
        Wed, 04 Nov 2026 08:09:40 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:458e:d526:4eee:2f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm85089815e9.3.2026.11.04.08.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:09:39 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 04 Nov 2026 16:09:30 +0000
Subject: [PATCH v2 1/2] mfd: intel-lpss-acpi: Use named initializers for
 acpi_device_id
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
Message-Id: <20261104-acpi-mfd-v2-1-64b9dee3baaf@thegoodpenguin.co.uk>
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
In-Reply-To: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Zha Qipeng <qipeng.zha@intel.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-crypto@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793808577; l=4260;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=Pb1xaEOBDiGouaBxIYgpbZgjIv3fCd5ArxVoKy6CMhI=;
 b=vFUUfugOugL4hmuAGOfxj0HO67PsTVAc5kdU64y3m1BVV7RANW3KRU1RgpXwoobUNowIYkytj
 Xz/5Ats9qjyBD7w7/RIJHOMWagDXEzyMW5nwxpIWaPuckHR9h2HRpOp
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mfd/intel-lpss-acpi.c | 58 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 720adb0ee21f..2f46a85066bd 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -137,38 +137,38 @@ static const struct intel_lpss_platform_info cnl_i2c_info = {
 
 static const struct acpi_device_id intel_lpss_acpi_ids[] = {
 	/* SPT */
-	{ "INT3440", (kernel_ulong_t)&spt_info },
-	{ "INT3441", (kernel_ulong_t)&spt_info },
-	{ "INT3442", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3443", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3444", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3445", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3446", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3447", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3448", (kernel_ulong_t)&spt_uart_info },
-	{ "INT3449", (kernel_ulong_t)&spt_uart_info },
-	{ "INT344A", (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT3440", .driver_data = (kernel_ulong_t)&spt_info },
+	{ .id = "INT3441", .driver_data = (kernel_ulong_t)&spt_info },
+	{ .id = "INT3442", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3443", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3444", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3445", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3446", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3447", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3448", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT3449", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT344A", .driver_data = (kernel_ulong_t)&spt_uart_info },
 	/* CNL */
-	{ "INT34B0", (kernel_ulong_t)&cnl_info },
-	{ "INT34B1", (kernel_ulong_t)&cnl_info },
-	{ "INT34B2", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B3", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B4", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B5", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B6", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B7", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B8", (kernel_ulong_t)&spt_uart_info },
-	{ "INT34B9", (kernel_ulong_t)&spt_uart_info },
-	{ "INT34BA", (kernel_ulong_t)&spt_uart_info },
-	{ "INT34BC", (kernel_ulong_t)&cnl_info },
+	{ .id = "INT34B0", .driver_data = (kernel_ulong_t)&cnl_info },
+	{ .id = "INT34B1", .driver_data = (kernel_ulong_t)&cnl_info },
+	{ .id = "INT34B2", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B3", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B4", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B5", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B6", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B7", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B8", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT34B9", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT34BA", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT34BC", .driver_data = (kernel_ulong_t)&cnl_info },
 	/* BXT */
-	{ "80860AAC", (kernel_ulong_t)&bxt_i2c_info },
-	{ "80860ABC", (kernel_ulong_t)&bxt_info },
-	{ "80860AC2", (kernel_ulong_t)&bxt_info },
+	{ .id = "80860AAC", .driver_data = (kernel_ulong_t)&bxt_i2c_info },
+	{ .id = "80860ABC", .driver_data = (kernel_ulong_t)&bxt_info },
+	{ .id = "80860AC2", .driver_data = (kernel_ulong_t)&bxt_info },
 	/* APL */
-	{ "80865AAC", (kernel_ulong_t)&apl_i2c_info },
-	{ "80865ABC", (kernel_ulong_t)&bxt_info },
-	{ "80865AC2", (kernel_ulong_t)&bxt_info },
+	{ .id = "80865AAC", .driver_data = (kernel_ulong_t)&apl_i2c_info },
+	{ .id = "80865ABC", .driver_data = (kernel_ulong_t)&bxt_info },
+	{ .id = "80865AC2", .driver_data = (kernel_ulong_t)&bxt_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);

-- 
2.53.0

