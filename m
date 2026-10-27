Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100778;
	b=AqhMFSdpDpRo8OhHM8lvbLw9bPznSPXgGtkMcQmPTgXtY79frCRRz4YuOi/0ltzFrdjA
	 p0x8VaFhe24GxoDofgl3udy5oDMAFvhu+Ki2GejiEm0pEOercP1I2niMS7VvihzPFoHda
	 dfq20Bes+LZ7OS4G7shF/J/1n4rUyOfN/ZGynVpdz+4CJ0xVcsKJCXv+H6RyNRJkUssUR
	 xSa2QzfpDBlvr4UZ7Wnjfc8JThdugJGINFWix6thKeOrbCg8plBTJ5MG9cVjZxEQQXOE7
	 GI/nSvx+XOswCjUmKc4Jog2skey4XzvTo17XYU41nykK5ck5ZL7fH86ueknifqteiPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
	b=tlJnqC1GdI9jT2bhUuBz3J/kXmX05UlRkYFr0/3HF7gWiOboBhl9OELKb9qO7Jgdiw9L
	 jO2VVtn+2JmKwGcdM9Q70hxMChOc/RvH7Mi5YtdEqQt9gG0whWEb6/jrrszVPKwS1BrE0
	 hJO7EPkIJltpkYw533B3MtHTWNlEY3JUcvjXou6dEPIQuckvv5aXbr10CNXMu86GvYqEF
	 GlHfdqnydcDmIMY/M4tQhhJWcsi2fLXW1a1ycUA0zmzJXQU8WdvTOT18lGkvt0fOzqE9z
	 9ZD90NiZKw1CuE4v0m79REPFgBxLWHIeLFQb6socNHkdxgFNzvpM15MPlJsfD95rNzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q6VcMOYy;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA9B60A3813
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABA9B60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q6VcMOYy
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c411e139259so319122466b.2
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100776; x=1793705576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
        b=Q6VcMOYypKEBFzzJp7pyecDBbAwY23mI9ArFTWmX+0h781/n1mQvFV1eC1vYEiL5wO
         FSUiBO7SWO/iEtlDKEoADG2GgPn8q3WHzsjSlu8llqcEZgzQjzsN/6vh4yj2f3OLmKqW
         D81JORPQTkWoyirTkmAk1r+WeQLp8BOSr8X7DWNr/0P7/mSAatTwIom1EO3rfqn7SBQq
         +bPZW/p0+6TMfZ9M3pPJpVSaVjQKVc1IzIz2Mn8pyXfkCiaC+MykyIo9tVBmPfWHp45B
         n3AfrzUsuFtW0yn62t1XHbAaoeeQcewuCj0a/J6/Poxw+L7d9oz6NlXT0vTEe7YmjA0H
         u8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100776; x=1793705576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
        b=HHzfnVH9YgkJnzO00INgaJ6dyJ6poO1/OE6y7KDdzmM3VOzvniHYzB2SmMSrXmeFcB
         eOl9tXDyew5EKiBUWAgG+f5z6LaUmCuAi4pvWdJpp9y67FBHDSOxnWefF2c28KUiMus1
         C3ybLy5WFejtkiaX6REWjbe4a89oK2gWyk/pl3uCtFw5tLIua5EIkfCHZhdbA3hmCKQs
         GkfN9WNag0QK+K/D3Q4NbhhIkDjVreWNJTrXd9P0B+FVgtV+0ywvXgdDypyA9UwZlW9f
         5U65V0eM8Nnx04Qz4nQTc+fxkz60cuTiyaG99vmuutB+JSbnSnTNEzCinOLSb5LA/D8u
         5PQA==
X-Forwarded-Encrypted: i=1; AKwUvBzkNr7Y2utqvep+SnFh8Qo8X/hBg8Mvi3NvgGMY1QEruoaaqtzrIIZsGh9jvQBXuzGVQlw=@lists.linux.dev
X-Gm-Message-State: AFq9FYICGhH48P3K3vgD0RsqBj3tZaGEr0igMOHpinr3o1F3yFzFXBFr
	1vwWNCk7A0UgTTGlj91gvVJDY3h4tZ1zDWIMoZxWjaRfff7rM0b2CSPl
X-Gm-Gg: AYBFou2eDBdncuqcdp+m1ACSOkpH3TqlMkkve5v5zlyB/uQ8CL+25RBLluVtIinfTnw
	P5i/s08w6OVesUT+xfqsdtoIjPC8WD+uNOhqGvymxFrN3Et23F3L6M7XFxCJGGJ5iOhcaXhiMq3
	M+ixrxlIXcfipfYv0MKjpuZlJxLO3e22p3rmyVt/GM3Uqov3mbePxHsUJEhq+5cx4mv7FSxL26t
	EFzVi3VZQU5UN6vfjAee+8ad2WZZ4xpNC/WLqofRV3Or4ZGjMko+JI1lFYOVNnfV7g2FoG1KDtR
	Jiuo7w0dxyohgcEPT9UbcikE8GIXzVAG1Z+Et7U05I7Me8viw2i03hZ0ChczeJsT4NJSfTRpDz/
	LydDHIBg7l1vNAMklEE/ukobMHsEWMRWN/TT0eT6p0Ju4HS4jbLqBNAseFDGB/00B8Yt6uJlV26
	RyNNqi4oW/wb1buc3Bf10/5vTBUdWx903Iq7c4ZsvtF+zeg3cLih4CirgdvGoKwXlI7jZLr3Kdq
	1RCAIiORB5xypj9rxkEZcThgL1gBPxJaKPZP8sK/xW48dBCRihJmjKFFNvINn8/EFt5tdgDDNpT
X-Received: by 2002:a17:907:720f:b0:c46:7fa4:922c with SMTP id a640c23a62f3a-c46bde3211bmr1016964866b.24.1793100775923;
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
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
Subject: [PATCH v5 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Tue, 27 Oct 2026 13:32:28 +0200
Message-ID: <20261027113230.47538-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
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
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 35 +++++++++-------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 8b790df1e842b..e85f2b4d81068 100644
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
@@ -145,15 +133,14 @@ static int aat2870_bl_probe(struct platform_device *pdev)
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

