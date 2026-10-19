Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF7D4CE670
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404587; cv=none; b=fkq3ov/1ZSACWsofZpZ+Fk8YkrVlewKKNvmEBEbQ/JBqrbxE+3Oy1K4zZYfbLsMJoj8/J1Pahb4cKzyt1lH4MhYriRIUvMMdPT0tNlnpkgIrRA3d/1DAMSCIWY+k/0NuwmHT3fEMgaEFN0JbQxri+lA5Q/juDfkg3YlEnyj4U0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404587; c=relaxed/simple;
	bh=PkwePPbuzVu9fbzReX4tE5VcjsQsyH/gZI5uyzCeZOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+NXKawmCw/WFVeAjZwbEW/IVsecOVG8vd1DoB7FQ4rjeiBDDMLk403/ztqaqyOsQKse03QrDVcpYrzEFlUbo4111Yz2nJZUAJcFP25l8uQRbKBuScQjd8B7bNW00yA1IljWfWsUx7hkFAVXE6wKtrkD/xWNkh8xF6iEguJVm48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WO6dhc8a; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WO6dhc8a"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b042c0759so1150145f8f.2
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404584; x=1793009384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/trV4jow8NDaSDq91x2ETJmC0OZjy2jDwgvKC6ameE=;
        b=WO6dhc8aH0xEkFHVXw/5GTmgf28SY4JvqecozcImUao4U1n+nKG1DITaUAfRVKs5cZ
         kxdYatk1ZhEb1whTdYXvvWT1+EcGXG1Iog8aBKR19RuZj3QU53CwGEv1RSzEIj2zEb1V
         wt8b0ImzSsx0ErZgyJZHsPzVfrxhO0q1tHt3/dYf37xfGXZMvMwncv18iio5KGZS6Hlp
         VL0CEe0aTczdQ3dPGdGEAZQsSenOhlSKoEfRB5VvAjEgM2HlFdVjMpwwJ5I6n9Uk0Aa2
         poOntlndJDgJWQSWVkFbQrAH9hR6e29ZIY9vo146gfhNgAKpX2mudjhMJVp4OtWPrgjR
         zFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404584; x=1793009384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/trV4jow8NDaSDq91x2ETJmC0OZjy2jDwgvKC6ameE=;
        b=XgBDg56EMswPR0TtVIu4E0lyswmU/gCleP2t0UFlb7Rk/aqQAptpjeIJ9mhqO5BnOt
         e2lSTDSS9bGgHPNrY/mSNlfOW49nhqdyeWh9v31uT7Cyr1cQ8+sYYTibbS+A6zjOS3KD
         HKHpjt9GRl+9cPje7oAKCy/mEmRz6gEr60Kgx7iqOYWaxQ4S7dX/I+9OBhY4+P+sFakh
         Fys7jzL9M4g/YdTj4cGG+xOF6f+n5C1Kd0S01n1Zwe3O74JD9U2cd44Z5yDOrJ90qWWm
         6ECObQdOx42fu3Xc2ZxOwXqVA0wsQP6xMcntTgr4ucslR51O6mmGKqIn/aLzsW8RxRl4
         G49g==
X-Forwarded-Encrypted: i=1; AKwUvByudGFs9cFFQ8P0o4RaL27ubI+W3ck36rFb20C3CRyGt6m2CtbELH6YjY+vhy5NXIgwrW0=@lists.linux.dev
X-Gm-Message-State: AFq9FYJAk1hy2+2J4SQxGZgIWdsFH/QynZJdXsWQP7F4umxYgUqTSVcm
	WuUzDBhfBeQVKaBmcxd/Kq2PFgGiBDp6Yb0Q6cl6ke0yEra86+zqQuGv
X-Gm-Gg: AYBFou3NfZS/BT6PMDD8pWpB3Z/mT2nwf8UtfY3I60zuIccL5ev6bVGII9dLA1lmDzn
	3+AUd9O3/348q3oBNjTLUZmg9KC4U61NGFrJ74bOwi5IG+NPVhzsc66d3tJq/g1TYsD334q3sO2
	rWTOvLJfrPbNxXsB+p7K19RyhC0xKktMFD4epgduHAir4grkqd1jhxXNCYspnlDBNG31qKb0cJI
	EoVVpH8gAOgE8HkaU1L+ukMoqYvAVo8vKDOnqPaWJoXZlIBHY8xu0tNTDlKnv8REWlURLtqKLf7
	WxtBjVwldM8CrpClbglzyYVEH6wVrxWhGu7UDTB4H5w4gfXo58wJgQxoucCCbqGX8jUcecg9fDz
	R/L5jjjuryGHUW3sKC69OTntJ8UbXx4XlD5uwCJR4KkDG0hGplE4QbHH2paGeBFMZQI0vrHZdBQ
	R6xVnnsn/wDlWFAFTpGE74jVFc+YPp2Doshr/fJpbR0PFGbBjVoyjjdB1L4ZgyGFhUrZRIHmqQw
	e6y7Bb/99FqrPALxHI=
X-Received: by 2002:a05:600c:3b91:b0:4a1:dfaf:f43e with SMTP id 5b1f17b1804b1-4a1dfaff680mr129256885e9.1.1792404584307;
        Mon, 19 Oct 2026 03:09:44 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:43 -0700 (PDT)
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
Subject: [PATCH v4 2/4] mfd: aat2870: Derive brightness steps from max current
Date: Mon, 19 Oct 2026 13:09:28 +0300
Message-ID: <20261019100930.110954-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
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

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 8b790df1e842b..c9e764a94a238 100644
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
+	bd->props.max_brightness = aat2870_bl->max_current;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
-- 
2.53.0

