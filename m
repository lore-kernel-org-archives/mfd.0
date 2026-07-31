Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEED426699
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497846; cv=none; b=mskD/1TR/1+YRXTq5+dhQp5Oj4kLEqMOojvg6e5t7A2dfvjUSzezu+/uqJNdQZXq19kE1jRL463JfgWywaMT0Dpb8CR1j17gj/m7M9RVJqbBF4sw4FXLIf2DAv22nfOw5mLkDnNkl73/uThvo6SbmOt9KGxCCxh+/pvi5NTKAUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497846; c=relaxed/simple;
	bh=jzKL0N3YlVllgP+B/U9c8TNN1MATVwvNIY+TMDc6s/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crbO5HXO5dFrAkqJ09pFGsp7kN/ALfT5lbkoQ/IjEYL0mJS+wdAXPubsKC0kWHs2zhY5TmrGdlCh7mtpRqR0jlarbmc055guw9t0YqyL11mzOWs6DbbU/fF6VTipAP/JBbcF3VzlV3SUWoAXcQ23fULgFLbwlip882tRMe2k6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xyz30egv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xyz30egv"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso898243f8f.3
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 04:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497840; x=1786102640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0eE6D17SL5fIygwG8Kw0xWT8mg9cqKbwl7rsTtSWgs=;
        b=Xyz30egv0QZz8toHSioeQbGfvP0fwujZyHvOaKVGFQM3iZTdyboJN0r6qlf3KFjDos
         qHq2ifIR/eNkGMJof20hYTA08t+2pStwOwNZJKDI28es0817z/w/9EvFlIMT6vMSU2FP
         z0LmK1Ucf91LZavFA+Epa5VG6qTFE/gYsBvwsIqD41CsD/qffRQL0ovhwwaQUGhsm9WV
         FFgyM4QjIkwGKcbc9Rc2gCXshIuOgt5B19h9RvAF698kmMeZhb6EElF12XoS1QCZ0K/6
         KUGHeMYm0Mi/YUgOzzHqQ0XaDGwzB7AsZeMAcRMzWgUGG60bR77ngdPdz2cCg/Lvyw5H
         WK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497840; x=1786102640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0eE6D17SL5fIygwG8Kw0xWT8mg9cqKbwl7rsTtSWgs=;
        b=POCBvRu0zAdOgAgPLKkeJ9Ft33lIF4qJy/ebBC5Kczz+ftma4t6xCH+xUvSe5zqPZw
         pZghEddoptdcaPcs06YtzLBsB3Gt07xo6n0JQ8vHcywwhXqGG2ljQC7D237FGg3z2H3R
         eYrUAOYQezgxOZNVNJg2oX0nnNgJPfKMSyBhgEYLCWPnrpAhr9/gpEjEtxlchWScfOlC
         CW6ZbqixjohqFVHUFFT+Ikx1yIJiJPFwup9Zl32xRzgkLYBpcW0QzUK2NFLy8IJvABko
         agUb8bIyak34BdnjGQDFFlHTzdZrWREhny78K4zW1oL8700wsKssIBFTla38guRL5A2z
         CizA==
X-Forwarded-Encrypted: i=1; AHgh+RpDmyjVS7J6ivb520R7hrWaSp5KlMW5odbhNBa1RO/4kVITCJHN2f7uGN5y/DSh11WjUi8=@lists.linux.dev
X-Gm-Message-State: AOJu0YybQKkjn5xz4jLAvWvhN63ydmEFC3oQG++H1Woo9rP+yqFt4/6e
	deOISd6YW1IzlwMX4SZYae9wE99O7OcwEO0IfjoJkIkxgm/mEk0HpebD
X-Gm-Gg: AR+sD13JXfhY+l79GTW5JeHuZ5KT2nGlrmO7MH1W66Jq59bA2+I5PTZay9f0dBhvlGM
	19+EubvLepS6Fu3ocP1iMECPET6e191Acez2u7bfHMxlXClpfqnehGS5Qenwj0CcBgCjedz7quS
	R/cNHREMvw73DS7xxrWcnqEKNf38PFXeLq/jXT4ATg4h86XXwwFCP4qZMlwjukYTRansRcwPeWb
	wqm/7KHgmpRHCchZoeoaZSRjphua920u5tbw2fioMLALoPN/EVn5PsmGLmeCE9dGgPab3G01H2r
	Tb4rSwJGiXYZLsl3RKpKxFkTAoYYAZs6+Z3XWGeidpN8hDbuEqmsvB79gYMSfMP1HcJypBTgZJf
	DypceVEK9s1qg6x8kvtFcoQGImo9vgiVRKIgrzsqMwUyuxVnu4KuZhqMl3KLpAnHYcbR4LfwCfH
	MTdaywgjGINH11bZFmjNbqIt8ybBXgKmwlKTVl5kAvAcXLYGTJLt4aPR1K5nNWXS81Pjq94QZyE
	cLnkL3Ubw==
X-Received: by 2002:a05:6000:184f:b0:47f:9760:4d25 with SMTP id ffacd0b85a97d-47fd2ac97a4mr4103846f8f.14.1785497839657;
        Fri, 31 Jul 2026 04:37:19 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:18 -0700 (PDT)
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
Subject: [PATCH v6 12/14] video: backlight: lm3533_bl: Set initial mapping mode from DT
Date: Fri, 31 Jul 2026 14:36:30 +0300
Message-ID: <20260731113632.158440-13-clamor95@gmail.com>
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

Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 2e31a79628d6b..666213cab667a 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -36,6 +36,7 @@ struct lm3533_bl {
 	u32 pwm;
 
 	bool have_als;
+	bool linear;
 };
 
 
@@ -230,8 +231,14 @@ static const struct attribute_group *lm3533_bl_attribute_groups[] = {
 
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
+	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
+	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+				 CTRLBANK_AB_BCONF_MODE(ctrlbank), bl->linear);
+	if (ret)
+		return ret;
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -285,6 +292,9 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
 	props.brightness = default_brightness;
 
+	bl->linear = device_property_read_bool(&pdev->dev,
+					       "ti,linear-mapping-mode");
+
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
 	if (IS_ERR(bd)) {
-- 
2.53.0

