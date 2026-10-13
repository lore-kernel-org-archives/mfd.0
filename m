Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B755304B0
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914992; cv=none; b=qiV0Hl+sznIL4QFIXhBccAsDQbf5M3WNJEr4hSLibIF18Qeoir0l3l7C8HIGEn51w1T5dwZKLF/8436jT+4lU/DqM6+u1o1xJ40kbyTrbQ8KErCMqOpEEMt0ScUsAkS1Uk1cubniH7YcJx4vyUT8yXYXf01bvZQpUkc2v47K7rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914992; c=relaxed/simple;
	bh=8u6UgmlMcnxZT0MDTxqLLP61U4irzqcwFndOVAUV0ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhNdaeTs5NY9h27NjPC35bRW4M2V+6mXL1JgFziPWVYX2ixFDQ2x0pJR1o+ehJ5x4JWvLGR3aXHyOyifb/hnRWPyWV6b2rV9+orX138X3Xtu7QDWWPin5xsj9cETtp2gS2vjANNW6b+1v9D45fFU1RFkfPf3dRmAUcd22Q7PoMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQ0jgXWI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ0jgXWI"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1905500f8f.3
        for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914988; x=1792519788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwqTFwjGa56BYbboUIBQ+4BPXdstI8K16QSmTD6KIFk=;
        b=TQ0jgXWIX7clsTsvZCXBCR4K4TPwthqV6jiZ92C09+dFAWgbabT1pP+UnYcn7ukqdT
         N4Z49rMVoKByW2k8g4ay5XESK8ObX/d6LB5Dttn04xxm97cDIFdOlVB6/xcfChQfRcL2
         tDdzjiKvC2sNTezTQP72uqojdcYTGUiiqLPZh2oLfAiGrnhOLi6zjRoowxHle/kHjSz7
         nzpHsXikJO5JXf7+leT9PaqX5NsL/l/0HLB7kBMxZZaO9xqEYkv8uW0ooSfFFJpA+RTT
         2JO891gJPlwkZnAtG+CZSNRv7Fw3biFJKXSEzUZMpYQe/e7KKAon+z/ddVzRW638Oiwx
         8cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914988; x=1792519788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwqTFwjGa56BYbboUIBQ+4BPXdstI8K16QSmTD6KIFk=;
        b=OApKudTnyxnSFxefm0KZDeAAJugL6V1Ux1JYoTl3DathwIJ1Gq7iwAVo7CDW7bYLPm
         KAEsp1LWNgdptwlD6nLbzAXRlszUjsNbLOXkNrC+K05N2cFAlRDDSk0SJ1ky1Tn3nXNA
         NwNTpZXXol4HMkyCKTC2HmrglRowJcKQA1iqBiUdpps2Ealq17u5xFnt3vsZlGYu+k36
         MuUKK6hraOOULgR4AV5PzUJHYS/hK5hozsOfymGaechFL9i3/yGS5ayZbHnrCoF56YsO
         gzh+Tppkhjr1kHtwmR1slw+VCsEAu53cnlAMKdGB1Uw1iqgrwBDlQfKQSBgrhyD/hpQ/
         4zAw==
X-Forwarded-Encrypted: i=1; AKwUvBxVlRb81mBfsifnjxg5rvLlJloJwiGBlZ2cbyLufJT2No7jPfF6/y6R5QmpwlCGubl/578=@lists.linux.dev
X-Gm-Message-State: AFq9FYKU68paooF9lp/IZHpXZ6Ddd7qStagE9sPkNQcIPANiLqwDZuGv
	UcnLL+QcfHuQIDWecKL68simMWWAHwWrqfbK2Sjst5or6pnZU5n2BUWi
X-Gm-Gg: AYBFou2U/hES1XL+IxiAAHN9ZdKip9xg585g/Nx/LZLHpDR51MbZ2B2YKXvZbrJEXQx
	7f4mc+0SgvE6Hp3NZw8IATkRbIMXjg/WdarRcrzxaPMFTo66oBNJmSGbg6cGq+++bg4cjP5j0rW
	eyCbltv/vhXnqNlEHhyFhT30kLkcceRADoKUISmhV+OkFiZoLxbMo5jalrWJTNBAc4fnH5f6jLz
	Y9CNVjoxL8VltUxwfF7D1ugeqtZYhIut83qE/YY+ram8p7zW6TMTpAVfJUkcr59F60e4KGggbr+
	CaK5uCKy8w5a5fBulAsyb9ZmZGPHUVsrm7he/o0oNCxln+0SPyhKCMTTZEO5HscPRzT2Mk2zsf1
	deN0Ntiw6bViHyuYOSmPxJRKN7vs4CeC9YmQ4cJk0FHUunVUhPZRDcZVhGTI9FH+/3PAN0YSvkE
	oY2HKDGt6RosNrufUMZgma/e+8TKU2eqXS8dzmZGdYwUpuTlSgrUMEKoJLIn4wI5d7qyxBh7cYy
	subTPlfx6ZM9AHfDCQ=
X-Received: by 2002:a05:6000:481b:b0:48b:11ee:de66 with SMTP id ffacd0b85a97d-48dbad1217fmr23545543f8f.34.1791914988401;
        Tue, 13 Oct 2026 11:09:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
Date: Tue, 13 Oct 2026 21:09:31 +0300
Message-ID: <20261013180933.487013-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180933.487013-1-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT2870 allows only 32 steps of brightness, with this amount defined
by the maximum supported current. Remove the need for max_brightness by
calculating the allowed number of steps from the maximum current.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 8b790df1e842b..eb686e315921d 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -24,18 +24,6 @@ struct aat2870_bl_driver_data {
 	int brightness; /* current brightness */
 };
 
-static inline int aat2870_brightness(struct aat2870_bl_driver_data *aat2870_bl,
-				     int brightness)
-{
-	struct backlight_device *bd = aat2870_bl->bd;
-	int val;
-
-	val = brightness * (aat2870_bl->max_current - 1);
-	val /= bd->props.max_brightness;
-
-	return val;
-}
-
 static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat2870_bl)
 {
 	struct aat2870_data *aat2870
@@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
 	dev_dbg(&bd->dev, "brightness=%d, power=%d, state=%d\n",
 		 bd->props.brightness, bd->props.power, bd->props.state);
 
-	ret = aat2870->write(aat2870, AAT2870_BLM,
-			     (u8)aat2870_brightness(aat2870_bl, brightness));
-	if (ret < 0)
-		return ret;
+	if (brightness) {
+		ret = aat2870->write(aat2870, AAT2870_BLM, (u8)brightness - 1);
+		if (ret < 0)
+			return ret;
+	}
 
 	if (brightness == 0) {
 		ret = aat2870_bl_disable(aat2870_bl);
@@ -150,10 +139,11 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 	else
 		aat2870_bl->max_current = AAT2870_CURRENT_27_9;
 
-	if (pdata->max_brightness > 0)
-		bd->props.max_brightness = pdata->max_brightness;
-	else
-		bd->props.max_brightness = 255;
+	/*
+	 * The maximum number of brightness steps is determined by the max current.
+	 * The aat2870_current enum maps directly to the allowed brightness steps.
+	 */
+	bd->props.max_brightness = pdata->max_current;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
-- 
2.53.0

