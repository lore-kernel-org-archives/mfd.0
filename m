Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795853;
	b=xaQNcKNF7hTz9tDXRp1BJ8Q6Um4sKtfj5ml92um8nCPic347vnTQts6nLPZavDvg8GUP
	 CEEFMJUJ5TuiBN4YdkqE2ieg/hSdWzuc2Rwru3HKwTd2H9ZS1gVSb/il/yCXG7+ZYMq5J
	 Bw2zfWxRtHRV7bkidERWE+iyCFjcaEAW0B7skBVU4Wi0RNaSBSu59guxB5TtPDPsrOCFN
	 GRBHkhn2D3HEAjAp9j9FB66mx9RXGjONj1c6xFYH2OYYYEBzaXTDlilD3S5mk5OhQZhc+
	 18uF2zoW81JIPD1XHK968rwwJTj4/QTTc/r8DcscoT8MsRrMHGHloU776N+6FwQW1kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
	b=j9Ml3VRDZ5sjQiC+LCMyM25tjMXeTkETh96VzFBxBxBObb6a28ZYVxkFSPVltOQ8bzES
	 H4ynSJj8cP8tndy2MUPsli9bw6NWHAC9n/zKJnWbZgSc4R8BL1HwU5EXP7M+mHBVZ98/P
	 OIrJ6yuh7xNqlAl0kXdxQKaTU17HfgMR3VG897ukMpw0UmgTHISMycNfINdaIsGi63rPa
	 nRhOrChTR2qu5OfBStJ85TvuFomNa7lLRUZLjS42qx7hAySbv+MVxshHDN2d6wZs4DNR8
	 uAn/q6trd6Nu4YqMt/ihZssLtMF8ipEe6eaFsp2AXgQsmlfJwzS2ZaXCiuQkciXkDkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhiONPwE;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4302D606A32E
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4302D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhiONPwE
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so4756465e9.3
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795852; x=1794400652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
        b=bhiONPwEuDKBNi4CsL6xcRIlulekAV6WW0djoU5PM9iHFz+9NaK4OKetthIKfPTlPm
         eZMvSXjL85yH3N0Ev41TBHT+LIZMMLRpKbQ2VXq7lF+2HLT5OJWUm1ljkRbKeOkzmduh
         3vGMxn9TXDgCze21nxAdfcZDw9kiE8RxwSWpu7WE1mOmYczXfVnlt9JxOCeJi/hoLw2x
         JSawkDSwMVgfJTiAMyhYyocS2YN9Z7AV1qwCvH7wKMG154hyaDeDAUfM8reBFcuFhVlH
         LtsmLEN80533rCrtWk/Zp/vSAPvRLfTBGKgaw1iDE078LQgRQFTdxQgkvKm9TB0nfde7
         CVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795852; x=1794400652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
        b=ZQp6vOnn0CB/8rPbzmwGbKKH+oUfkIAB1PqkLGJaftGraiieIIYHwPYVgn/YAL/13k
         pKVfXCgHPus74b/oX7h0O+VSgdNLW2xF0OH353mndnDeioIWbao2lvcztBgvQyukaI9I
         SfStqa99zWIa/QT995zTj4Dz3+w78+2TjvMvVjqYvDFh3fWSH21qNsbqsF7cTw6AxKIo
         R4ghwDHVq7vUnOlk/jegys1OvbTXiHIaI7vCMsiDaD2YLPill3sswNjKezUqEPO+9UTV
         oxYNLAeWX6lgjEd6wUtPp/6qrGpiadFA1JqlC0FtcewJ/aCu6NF5wvvPvUvosGwMeWeZ
         1eWw==
X-Forwarded-Encrypted: i=1; AKwUvBxLj2cPt9uPPkXUakOCMYcL9eHRh+MunAhRsoctvb9fb8Ou+RzlgxdfLsMBiFzNvkGMrZM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/EulfiXnTyuiU5Z1h1uCL/heEkf7EgqP3t7srwcJsOL3UjD8HM
	0/QjLey17sSG29jose11/VAHYLu8qVrFah1XRZHkJd3782Qe+sUM9Ef4
X-Gm-Gg: AYBFou2Bi7tPwvA+8LcKfmexqbcrQAWSck3LowFY57CkJcqP2g0cgy1j6ch2WmXlBX+
	YHZ1Z+8XlzDZpE/lZX2EBJaj/JdzEh37bubKqS6iuHzwBZfYiD9iLVLGALWSbgI25SoRv+RWZq3
	6hkT/uKZPxV6oCAAPpBy1rFvHGhTJGIL0COgcd4BntlhH5ZKfGgB59XBuXLp8Uz9fBiS3DONLbW
	CqYL5oTzeYdkaMtWXLArMDfmr2FekOG1B4adtOiAfPPsEelRAmrqbykA3Kvtl80WzA7cx1XH2GG
	G2cn7tfnb2fEkeHWE4cRnapFNfTsvNpCKI98Il7AsfF0VRCbskI0DYxhfZ9XbiW/HSyNYPQmdoU
	mVgxkwZt7M2XW1lXk2/997M0VP5sp25XqISn28oE1NhTg31ia2J05bE0ll30qPcp1QWK3HNSKmP
	837aGDBckOvrqujUWTuQNG0Pa3h1OAuU85j8Wattwcxctv7WcGcvxrUfjt1r/k/sZgfhrt6v5YS
	zLORhs6nsXJpClA0JiqLA9iqOqv+zguysw9eDbCGepgRLj094HfPtHCNnvjmNzM062wxPYWHiOm
	IFwetc2NcxdCRfUGnChtBuBkU1r5sKI3RJw4DRPsVPlOYLcrVA==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr367279085e9.27.1793795851589;
        Wed, 04 Nov 2026 04:37:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:27 -0800 (PST)
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
Subject: [PATCH v6 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Wed,  4 Nov 2026 14:37:12 +0200
Message-ID: <20261104123714.234634-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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

