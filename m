Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775872;
	b=qeZLf4K7wYL+X4kzhbuj9U1ItgAfF/FyU0feJbA6/2ex6IsVjWqBRtNJsl56Dgl4VWaw
	 uWv36yyhSuw5gdZXM5xixStCFx0i8t0P3L8PwZvMNr5uL4yMmz2iFU3EuOZErYIwtwrmX
	 gwbmGG0Lt3+xy5XK+yfOyS1aVqYmqgDqEUR1dmoB9lafhmJBLOr8vZIP+FGoImIEQkesG
	 hPSymmk1qcYFHep6wzOMVxnCLw0zeCgtzN383FJON8OOUEQh4RKPxiwdW0xAcr603pBsu
	 ra4H7x5V1KwaJ62eckAkDO8OXrwqVuD6PUdZUWz+rGiFqfk6BF33fpu7DyZn5aSVI2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
	b=i+phGNJPiqUg84Umcbvne9piMiRnQDjoUwUZYwhApJryp/agMeoW7Qjf2nAjfe0ygIH+
	 T7IYpqNY0EVfkWxY/pD3upVpLTvFxUfodfuaWvfiZwjk3xvuvR0AjvhZ1GgVTmtQeO1yy
	 nsyR8yM8fpbIh+KTs8p6yn16rdsNYY++nND5Df7BlMwsl+zKpuoECIqDob+aC4h84DGi+
	 xdpkBHMS6JnPUatZnGRG2GPXPp4kYROKuQ0pmVQj7m0DoG8npms7iw7GhnPcCklupucW7
	 6thlzqWCHW/a38JVvkdDd3Jf0UsDq2CLQdqY0SPqTciGs7g3tNoWExT07C1w0HudxEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WuiA7wHu;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C265606A33F
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 10:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C265606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WuiA7wHu
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so76461065e9.0
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 02:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775870; x=1796380670; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
        b=WuiA7wHutY0z5+O/7Jai4FpScMga5ZG+e7V6AtrZbIKMIRERRvbnoQfKFLyTq7S0oZ
         KmdyS/Yh+O+qRlKfWUGB69JJgLmLTqU5CXb2Vq/PhHppJfIPZjjgc8j3JCDLmIgoK407
         FgWUXCFtQBIDSl6GsrwPfh/DLi9TC47v/Blejku3rCLEX8z1VVi0st/ipLDoJ0nYAW0s
         WPpGfa2zIM5uSCgV4gSCtEGHz2720/gAuO6jL0WfMLx3lJfGqw15GjRFmN9EtFHwXxYg
         eSvaTtbTcxvuEamxuO207xRmqpQXTfIViZnG+xh26cPxebVgxyrpgoGY6DqxbgT2qMvD
         7t8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775870; x=1796380670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCcSULvlLrU2xkg1gi/cTVgyvaGO2KEpoODvKxtBE20=;
        b=OyBIoWdFKTL+EnXEiY9Xl2EcOYDb017FZwienlZNatokcb5QIOaiMu4trGOzmUmBsj
         RYP7fK7EeKJvQ4Qif+tzjF01Hhev+t6uLqUyFd06IlSP5jmOkysVlTXIEYuqVroI3598
         9gQKWcVHUmzymn5VIbd4nsp5zgmlf1nf31bC6DUZxicXvqdKi9v0WIyyHGJQMPIV+5mT
         w4yYlyoFsm0UzkB7pyja8IUhJ4vDJCD7yIVtBvP2Q8wV6Wk/wY4lD+RcBNe2X7t+kNjX
         Ms06pWkS+CeRoeV3vA4idRGb8/qc7wMyGQATshKvuJn7NB+w1+vBskcMZ8JuuKxDQfx6
         BNnA==
X-Forwarded-Encrypted: i=1; AL+hErHtFiJy3OrLloCxMyCg+UJDiJ+x8pBBlCuzHkXR/TKg4yA8n3AxNjBKSoN/V5Cs+izcMbw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+wTLthxcFs9XJeCuKOmUfAOhfYcV8CfFV02xpQMC3fBPpEHz+7
	lEvFUpa2Xs15NDeuyGeYCwZ31RopiISKH+JH3uoRn3qgiMkso51dW9Tv9dQx6SiuioA=
X-Gm-Gg: AZFdTZd1L6IXVR6pVRmd5WqbtoWKnoDpmLqQQ1+GSsZK7+6rO5vk+oqr88bmQcUnJPf
	NQ7EdL+gmj003d1JaEBDppDExipyBoiJ17pFz0D8Ehu5Eu7SUQX50rvh7WAt3iYBlIVbjjBg+N1
	96NbL6YJEfYe1Ztfe4uSpZ3gc6LqS//voRcvG+B6Wpoe7wP0WSGuQ3g8n+N9EY6fi0kc9OwvgUV
	/+AVR4Lr09ip/9ctBilb/DGqZt5hc+WEY4O0+KglfVGULLkdTI8p7vCN5YPSCDLk7CBbFFPuJJt
	zmPK10YpIOghUf6OUHFKA1vrPUO3aXQ9gsnmDzXZEJm4JQtwYxWmMPm6hj9/yKmA69bmBkN1a1p
	zEm5J9flJ6HhWl7z+ycT+NcDSdAWmnI0K8b19S5RAtzoITe5vAGqhqeX6i6qtXPKmUGP85AbcN0
	ypZGkxXJsrYqYB5zLzOazU4gKZGlIZIlC/ZprZtdHHEf21hqO6IkEZKbcwGbiXRzSj2MSEq+J7I
	cAwdtJjuxKytvLk98Eh5f0FNKSXmWD+POYvsh0qQM7v+j9QsiwuLYzonKsRSNhv39lFtDvFFBoE
	unXniX21Tv7+LAAEOjAY46osllcYbN4VhF3x2+8FWqRkBPBf
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb8893a963mr460358005e9.30.1795775870518;
        Fri, 27 Nov 2026 02:37:50 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm714014105e9.2.2026.11.27.02.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:36 +0100
Subject: [PATCH v9 2/5] mfd: axp20x-i2c: Fix i2c instantiation
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
Message-Id: <20261127-axp318-regulator-v9-2-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=avi9IFPWiAVWFQGWnKZC1/X7ESTAnJfLwhLIKQW4SsE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVVhMxhMbT/PLffc79DFJs35NFVq1YLVnuuebn1+5
 Hj3/ljHjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEzEuIKR4XRDS7tcT3j0nqUL
 DoZpf2VVFhBW+DM5+vAiscvnzfeeU2f4nzKj7Ne6+M/bj72e8KFGMt3Ssts64egR05+lu+8LXXd
 YywQA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Apparently this device never really supported i2c instantiation via
sysfs, because the driver does not even look at the i2c device data,
which are not set. It would only probe if the device matched through DT.

Fix that for correctness, even-though it is probably useless.
Add the missing AXP323 while at it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
 drivers/mfd/axp20x-rsb.c   |  1 +
 drivers/mfd/axp20x.c       |  1 -
 include/linux/mfd/axp20x.h |  3 +--
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 9ddc73b8af43..aac4fe03f7dd 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
 	axp20x->irq = i2c->irq;
 	dev_set_drvdata(axp20x->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
@@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
 #endif
 
 static const struct i2c_device_id axp20x_i2c_id[] = {
-	{ "axp152" },
-	{ "axp192" },
-	{ "axp202" },
-	{ "axp209" },
-	{ "axp221" },
-	{ "axp223" },
-	{ "axp313a" },
-	{ "axp717" },
-	{ "axp803" },
-	{ "axp806" },
-	{ "axp15060" },
+	{ .name = "axp152",	.driver_data = AXP152_ID },
+	{ .name = "axp192",	.driver_data = AXP192_ID },
+	{ .name = "axp202",	.driver_data = AXP202_ID },
+	{ .name = "axp209",	.driver_data = AXP209_ID },
+	{ .name = "axp221",	.driver_data = AXP221_ID },
+	{ .name = "axp223",	.driver_data = AXP223_ID },
+	{ .name = "axp313a",	.driver_data = AXP313A_ID },
+	{ .name = "axp323",	.driver_data = AXP323_ID },
+	{ .name = "axp717",	.driver_data = AXP717_ID },
+	{ .name = "axp803",	.driver_data = AXP803_ID },
+	{ .name = "axp806",	.driver_data = AXP806_ID },
+	{ .name = "axp15060",	.driver_data = AXP15060_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
index dfc665f696bd..e48cae751fb1 100644
--- a/drivers/mfd/axp20x-rsb.c
+++ b/drivers/mfd/axp20x-rsb.c
@@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
 	axp20x->irq = rdev->irq;
 	dev_set_drvdata(&rdev->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 4d770e718716..de6946d4bb13 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 	const struct mfd_cell *cells_no_irq = NULL;
 	int nr_cells_no_irq = 0;
 
-	axp20x->variant = (long)device_get_match_data(dev);
 	switch (axp20x->variant) {
 	case AXP152_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index b352661d99a1..1badb4868d17 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
 /**
  * axp20x_match_device(): Setup axp20x variant related fields
  *
- * @axp20x: axp20x device to setup (.dev field must be set)
- * @dev: device associated with this axp20x device
+ * @axp20x: axp20x device to setup (.dev and variant fields must be set)
  *
  * This lets the axp20x core configure the mfd cells and register maps
  * for later use.

-- 
2.53.0

