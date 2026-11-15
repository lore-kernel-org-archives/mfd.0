Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733326;
	b=c+AKTypAgeJsIwANFZAxPCdrgk3XytxT8znv6/Nnjx2H1NCF6LyCEpcLPIvT9wcgMVcv
	 9YPQkmGDbzKN6Q3yq7d7He+PogowwrtKG5vL/stSTTbmgv+/vudvcPblmtnYX6oY1y6UZ
	 PO4sQIuG3L4Ez+1Mk8zt+Ip4RMNmm20xKbQGypuqW0b3Ke3WIf+i3eD+kkJBebm1AC3vA
	 6ilY4X3nbuHZ5J6irzKz/6wC3aCdeHLQ49MnqPBfGNiFXMnsXQpXfIt/TOUvF/CHV0X58
	 1gNslGy09QxHcCu9HfdjhnNmptIVFA89dPMjZIoCbcvsoUfkN3bQqaQGq37JC4pEebQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JyM31cGx8Sg4l+C801TiUlTl53Lt9FfHftI5A2bsynM=;
	b=ITiQKOca31PpjiKAURIb5HtXkS9JOATOOzmpi6+GNFbVn2nIOn6AHxRH0yUmSOARbZT+
	 ofxi+D72v8Y60JyoO32lTfltFWQ5VVrriJfAmKw5WTS8OHnba2X1Fd6Ee6ZO3w0EkMRq/
	 kiNsqiQlYfhvvuzl0wsaBhJ5B2mpfviq8A/kLsvnkJj8LKlcTFMfOqmGsP4ft3u17XDPv
	 o2hiQDCixWa50gPP1+yoetGI9V7zFVSaxqxuiVP3o/DQfhhyiu8iPNLw2XL6JIORKb0hz
	 b4WuVWTb+Nkcpq26Xd3b0YbXST40SUKfIMEBJkOUdcrmJA0XNfsvQBvAnokZ/m/dCYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMga9ZAc;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A30606A8B2
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A30606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sMga9ZAc
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50cc7540b7so48311566b.0
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733324; x=1795338124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyM31cGx8Sg4l+C801TiUlTl53Lt9FfHftI5A2bsynM=;
        b=sMga9ZAcKWMxrN38a7BRVTr701Qk3gfdOGgksR/4m7TSwfNmu+fn4wgBBvhIku93Kc
         q4KvAIutxkIoM68tLvuc8XHuVtpjAy4JXANdYzZEpL/zPPBcgkBRBHpHlBwdr2bnsk/X
         /CVpFKhqKIIYfJCVH2Lo1X7X8zbhwxanD63zl/a5xEgs1LON0RZdmwk4sbs0SWcRpujj
         3LQkM0xrpai2neAsYx1keSzLkY89BvTcWUtkHN99ap+oooHiLKvSMNm6IVOVpFqPcZCm
         S+Wg0I8SCIw12Vvz2nrnjTICFpI603zPpdNwMK51IdMgQ+Lk6TOvPblfYAnlEvnisxsH
         PLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733324; x=1795338124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JyM31cGx8Sg4l+C801TiUlTl53Lt9FfHftI5A2bsynM=;
        b=pU7rNMwIy6YOz5v2PoxYWKgljRZph27T2PAlfewoz4O97hce5+Ez7Fp2+aOWEvPFLO
         y32/QXpJaY/su0EF1GFOskXAoLVzgmbEzsH89ELQXbgTXFq3Jpl9jfwrsv8MYqphIw7R
         pa6lU2uJhe+cpSjJjoCxn3eVJ0GTU2LTtiWUx8/s8DDH/PJXVFn9eFw0W3bxDqF7cJEe
         ljUwB9SiJFaXFVx1pF/GKQKP7agFyoJ895QClOPO47dCy7zgVWyZAe6bgo3ilIdNktPb
         kQidZArtfLc6AjRpMuuRJWZPhp/v/qdNifyXVXBy3TEXV5lu+g84NIkhgS7KCz1C69V/
         Id8w==
X-Forwarded-Encrypted: i=1; AL+hErHngldjrW5GEN4ZH8viuZ8VGgyI2Qq0d0x6r9rBXSzFxLUAA6nRKEjie9g+D6jDA9Ucgjc=@lists.linux.dev
X-Gm-Message-State: APuU4Z+PVr87qA2m4cqKunHT+G8XE6QqpxILRJzCKLqRw0J1a9xehdCT
	9blPQNk3r00YZmd6wXZgnImVG24CSoZJRLIlwQ6SfG2X8HOo4uA/YjOr
X-Gm-Gg: AYBFou06JzNH8HFrtbvgyKvGYb/rolAbhf21fVcjlzRG4hdt/9wxzmCHzX7AKQRl84T
	kAhfaSyB2MJ7laiDJBORNPY1EsS/abkb1wkSmbgDeZZqZcBYQB3V9IFxfBDrqse1NJGRKDNZxqX
	zkbXNgH0oiUKwqYi1k6c0sBRqwFfyChZYJlSYSnJAAqm1Y8A3MyXBm1OjIefULfcFZYu0zdgjgG
	Wgg1KQKRGZj87G4g7Y4G2niKOr4skH9YjUEsuA8ga/riNQkjyfJx/9kouRcGNMSL4oHwwulgI19
	tLqWjPyk95Nsn2BS8FGXSqNzEIDk4cY3e632NSGbzFDeawH4VKEWKMR1GQSHXK6OJLEWLE9wd1u
	pAfqhy5ElC4UkQl4YPuqaY6e8ayuO65XcBzf3PUTmmD32OFzh4di/wcM4/AfwPMgV7cZtHRA8gs
	iKVxmkKSJivgNM1Ue7cuX5KqoLa3ukuQNPYxizZOeD2EfVSKDWAwXVgenARc/l3hYisv8apS1k6
	KHgPX0jzq1C97GUcb6bdwaTfCxJEmgPKkguRjai6HJTvvLbU7LooXS/3aCIMZaBYmbQ1Q8rU5Uq
	GAumoIYoOO2mEv4nWNSUPkY8GFbchiSZdQwQyur8f1dCzdAriGvdSghq8E7HoVP9iIAYC9pqsG3
	jDVUidMPtlQ==
X-Received: by 2002:a17:906:f595:b0:c50:94be:22ab with SMTP id a640c23a62f3a-c509633e68cmr632454066b.18.1794733323864;
        Sun, 15 Nov 2026 01:02:03 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:02:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 5/5] mfd: max8907: Add restart handler
Date: Sun, 15 Nov 2026 11:01:47 +0200
Message-ID: <20261115090147.95337-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
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

Add restart handler to reset hardware properly on system reboot.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 17 +++++++++++++++++
 include/linux/mfd/max8907.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 8412dab2133e3..b57c497334ea6 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -187,6 +187,19 @@ static int max8907_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int max8907_restart(struct sys_off_data *data)
+{
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_SOFT_RESET, MAX8907_MASK_SOFT_RESET);
+	if (ret)
+		dev_err(max8907->dev, "failed to reset the device!\n");
+
+	return NOTIFY_DONE;
+}
+
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
@@ -246,6 +259,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
+
+		ret = devm_register_restart_handler(dev, max8907_restart, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register restart handler\n");
 	}
 
 	return 0;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index e222250f0cc1e..025874e5f8808 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -164,6 +164,7 @@
 #define MAX8907_MASK_OUT5V_VINEN	0x10
 #define MAX8907_MASK_OUT5V_ENSRC	0x0E
 #define MAX8907_MASK_OUT5V_EN		0x01
+#define MAX8907_MASK_SOFT_RESET		0x20
 #define MAX8907_MASK_POWER_OFF		0x40
 
 /* Regulator IDs */
-- 
2.53.0

