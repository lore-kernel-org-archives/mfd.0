Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733122;
	b=XJWB+NdBLQJ8hAYIXDNHSgAmU6502t/6IjDi3EJSxqAZx1wXpQsjHuurcXicPaaAJ1AU
	 3C1ZbTxW8RYcYzKJCcQJmiLwU3StgMXJ8yZV5OesCNT7/hfqCM+WfQSnLsZr/Qic6NHba
	 8T8nyGmC/fw+Zh7Uhn9HiLOpPX6fPakIYamJntFyhdtmr8fGVpPHU+uCoWsSBSshCb0AE
	 BEjGwQjIfSefHyQlbI/sYXRZEJnY7P2GKMk1sfeNlCKL8jB8rUqQztsodyQKlg9e/YGoX
	 qXVTeKy9HU6cdkm6byXb+KXaGJwC+RlBx8rv5bvInb+V96OE9DEOx8e3Yb0iHdvJF4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
	b=IDOuF46plsyDKJtjwVq4auBZvmW2JLT1X+26vUSWvWke+FrSznOp2iNXrL9ShLo7OsDd
	 EeE81Dqy1lX2dSHPfWvxmhp4899rjIu465pH6OMwRTMpyj3GpYzOHk3yHaHPCJcJ4cCy9
	 qaTfiy6QguvnE6RPb2JijAlm8cBIddhWl5Iz9Sndna5JQoRTMA4mb15OO6S2NGQAVg1hL
	 1Qmlb3c4zIVGXuj5WovpDSmPVVp6iu+yc8YYMV6InjMenm2BVED8xgMApWGdOR9S5x6zG
	 10nBV/Bjt8GC6eBsjmp1+cIcpde2PNWtpejbE/4pqHyex82vAbPVgpYv0J7+Ez9hwwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c7iICRxd;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE617606A32E
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 08:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE617606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c7iICRxd
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so188968066b.1
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 00:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733120; x=1795337920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
        b=c7iICRxdvziXD5SQc5w6mMLi9a/dcNGy9F2yL0OBw68aiQ8SlSXT8DphIK6A+aSOHt
         S6wOCDQFoUyGbdZQNn40r2XzU0n/pJ1r4oV/edQ5PFYWw85Fuur8bI1BcX2vQRiUcdh8
         WxBk14rT3xZPE3ls2/UNe6Ym4gHwAcsHg/yadqv6VtyyFzQjkLoyJh4xhLl0nVy8Zlc7
         5BHYPsY1YAFzRP949ZKP0DB3gZoCoVh8NaIHJqPg/fuw2PXLsXjWgnY1/GUcqn0DCz/D
         pRQRfKOseedUfzFaA8RSRBfFB4hBtbRjq0/O7Auct7OyRK8ea+aOZssXU3JnH6r8xShK
         oAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733120; x=1795337920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
        b=OnJzJrJo9XEtuuTyhCXCLeKaeQC90OyjkEcTDJh4+x2UiqhcvWdWFY3r4+kOx64yh+
         TkjT/Ze8s1tu27zqBiRkOiR3ANalbd6yVa1K4arTVpDmsq3oVEsN8pbk7KovzOsOh2Na
         wF0D+jmvnT/X/9gy5d3ErROSL/JsymmsqiHuqLpV47Jdw6ajNbTAiQynpHgEHdYrffvQ
         D4D16feqosGGpyL9Cc7YhpPLb46cnM6Rb2iUJEbViPPYHoUYM0YLZPHQgNtqD51iqtlC
         64Z1cO3SyXlBosS/G6xIeJjhYsneUX5bxLdalxXLHhtR65Nhb42zGpEWlB87YsVUqOmu
         eENg==
X-Forwarded-Encrypted: i=1; AL+hErEjSbWEyDpA4rO8YURZkKXRvMQjaaro2hSpDyGDHYFF5u3fuqlm4MkwrBP4Kpq56LfJWwE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8GutcL0tPLEU0d2PWrBHoWlRFkUnYNTeKWo9lfr3Ue7LAKxyQs
	HzD/o+esIQRPzrzmZUq/PVrQPOiW2APQgEOtOiqLZ+Cm/nAYRP6U/pbV86HyOA==
X-Gm-Gg: AYBFou1u0g68xFL8HFSMyx5ywFaDea3w9mQ81nvDe8uNSe16I6fE86/DHV6Umb0NS1S
	1oGO3/qIqObaBtmLKKXxneK3Jh5Ua1BgWezL8Cx28DSLUYUmNB52ZmQb3iuCME6RTysaDH8ci4T
	MmlsW5AXAwLU7Jz7kjCVGXQcX2IeJyjh8hW8sl6yVrbnjwfc2TKpkcMMyZFWWfBj9DKIHD38bo/
	jKl95nUzo/kdvSteD0XV5kbKJGxWLDt4PI68aYj2w0lcg0sSiIY2HsWE+a8N6b85B7ymB52ojx3
	Qtt22tMXTnkCrjUkChFbwQYVJF3J/rS0XGvo85eCtYfHsQ9/DnE2XuwIVPy+fW0KekOwz9E/vGK
	BKS3trZLmWW6jGJLPOXh1BqvLwJK8WP/Trm2USoLM8wobbGgV8jOw4b0lw/Rn96H0A7LmEjVB6d
	Y0PtJ4xgLamrR764e6m5QckKuaVUdye4ZMNRCc24rlejF6rhfXPDoGPatYulnh/nPfYFzMJCGx9
	6svZOJ7GseUSzKsb3i9LDxSsHOskpVxY5Owsuo1utioiKMYGULimblIrKqZn5rw/JQoUTWQF8tG
	S6uwpsWpnUI3zf9za+3LVAJOC0b8FxumifGH1lDdZK7cNVtOD1kSRxpjx+XdTM1MrV0JjksEscR
	RoElUIuS/wC5nCuMSr++ZNVJEV05hdvM=
X-Received: by 2002:a17:907:3f20:b0:c41:4d5:e97c with SMTP id a640c23a62f3a-c509640f665mr613525366b.37.1794733120092;
        Sun, 15 Nov 2026 00:58:40 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:39 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v7 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Sun, 15 Nov 2026 10:58:23 +0200
Message-ID: <20261115085826.89641-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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

The AAT2870 allows only 32 steps of brightness, with this amount defined
by the maximum supported current. Remove the need for max_brightness by
calculating the allowed number of steps from the maximum current.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 35 +++++++++-------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 5af36d3784f11..ea955b55bca18 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -20,22 +20,9 @@ struct aat2870_bl_driver_data {
 	struct backlight_device *bd;
 
 	int channels;
-	int max_current;
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
@@ -69,10 +56,11 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
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
@@ -143,15 +131,14 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 	else
 		aat2870_bl->channels = AAT2870_BL_CH_ALL;
 
+	/*
+	 * The maximum number of brightness steps is determined by the max current.
+	 * The aat2870_current enum maps directly to the allowed brightness steps.
+	 */
 	if (pdata->max_current > 0)
-		aat2870_bl->max_current = pdata->max_current;
-	else
-		aat2870_bl->max_current = AAT2870_CURRENT_27_9;
-
-	if (pdata->max_brightness > 0)
-		bd->props.max_brightness = pdata->max_brightness;
+		bd->props.max_brightness = pdata->max_current;
 	else
-		bd->props.max_brightness = 255;
+		bd->props.max_brightness = AAT2870_CURRENT_27_9;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
-- 
2.53.0

