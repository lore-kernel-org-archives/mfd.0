Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A95B427F80
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497849; cv=none; b=g/Nca7evAiAz2LwYFhvjHWR34FYKW7Od+OvIDDa7Wls7bbwHSQqmqu4mVZrWHQBluK+tzSEwC1KBkL5LSrM8RNYObc3z7nN1AJ8XYRxPHXuBu+2up9E+8TX8TsYCOm3oWgK+nkwedzQ83wkDjKqY9BbW7Y5+E1M68KGuP4i/nAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497849; c=relaxed/simple;
	bh=XJPW9wWVGIYK13Jj227Wper/L2IcVnCSHBbetNAUY0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMKKAdwzGvftSZJhkGkLo7F6SClCLUw8fYu75odcx2Tx5ez2hd1359Z1zlMlUAYKrWNfIG1tsZsUyzxQc+Bc7Bxsla2DV2UsePnAOL4pi3aormBW615My9K7arzh2iSHKlLFtSzbrThw3XKpZ3JgsjUjBUFaux7i8k20ce8XyUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PT1VBzdr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PT1VBzdr"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f7854678cso128542f8f.1
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497842; x=1786102642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPCwNXXQzUx5SzGc5RGFQWtwM4MIgHKgBLvTAnTdtiI=;
        b=PT1VBzdr7wYi58zpeE2Y2pEmiUE4wQuXI+QKqZtQKsIBBEZNomv/V4pgVhkHR9AYBL
         4y1/DKrnZo+UfcomprPw3JbxxVEs1yxIddapTCD0ewYARvPUxb7kBo6AwBv2pC9bJ2ZD
         uETiagv3ZlwZj6Lt1AgOrdFfTxsDIwMmo4OuuKO+EJRNOnTOT+5/rPXvuK5gBZY9JswG
         34/dOcZkVrxoOmIFW1Jsz4arSAnTHFwIwASldHDuwuJ2nJyi6pm1StFMDemiT4ifys5K
         qUN+r32fHRXiMxVx+XLZeiBq6V3A07O+vjzqU5uovCUZWdg55kLFnQGrPkrZC2ky7gE1
         Xlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497842; x=1786102642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPCwNXXQzUx5SzGc5RGFQWtwM4MIgHKgBLvTAnTdtiI=;
        b=Km1SasK8pJ7eLXd2dzygJZCQC8g8OKZ42WS1oh9ht9acwnyM++t7QYxQh2EV8yFqYx
         nhTHSBgn8cuABNemtOx7MUEzWykJlJ2gFIreL2ZMof+dVllTP8rb+jlzF6jlbgprobh7
         SvBsW/RDScVLvYGhKOcx8nn6sw/qwkEH2WUE2rzzy9/xzmn4VENtnm5iKV0YnNcNyChs
         jr764nC1djppOs684YHuyaoC26vfJxR/aBdFkgK1mcOu9+4HX7cQZpYt/GqE4pyMprxw
         PZBad/BkCYOfusTytStAYbt5ppO4vWHOCuwK0UDpdmtr4BLaO7HTo03UD6tW39aYrV+D
         2TUA==
X-Forwarded-Encrypted: i=1; AHgh+Roeg0RGk36dQeIyqS7OPu5Gbz3tDStmuvSY+RHjMZ3ukBp861uRnatUUe3iWUtLSXOvUfI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVGpoO35/BPN4vJOmsHWFa7fzNifvXAR+g1F8WlMDwcuxL4sVz
	tudqfW2qDjR9opGivGj90bEDfzKlP7Ad4meWuf6f41euFRVhzAArjx8x
X-Gm-Gg: AR+sD10xPmrWfp4R63hwPWDZth3XXg2I9tr96aJGoIm9FOP0vDjJZggP7KTQqoO7+I+
	bSxGuORPlJffF3g/W0vI1iaN2/l9F/vUW9QONAAMXA60zLuXBjmTLOKwe17U1qTgjK4nK0ZI0Uk
	ONcWGdKuhImiL5EtogV22TSlWBscIhn1aMybulo0S0v0tA8fVrFLPCTETKgn8fE6XfB+bySWh8m
	qN763xLl754OxU8YWtHSjs+qgF9MVb3U82zBr3Iy8NvBq3bwojvAX+Z/djXTKIK729/+2k3KO6P
	AL/QuPcnz4KhdQ5K2qBfxT9GmfIPEe3AHHXW8aCw8VYWFROvHQu1jdYMFvmbQOR6fqazreGR2RO
	Tl+/QHiHtk4wiFhsSKH3Y2LDwW+uqQIKDkTDi+Y3PC+eq5mZTMy+knqWsg+vpex/B7skLBBEHuH
	HwGp19m6VnsGpcSK832gfdI1/3XzAx37QjryZIqdC3LcFMhNXQbgZ9RyHEsUGnj08pTyNpoo+Ug
	lI4u8Ohag==
X-Received: by 2002:a05:6000:29c2:b0:478:4de8:9b91 with SMTP id ffacd0b85a97d-47fd2b55e06mr2408925f8f.41.1785497841644;
        Fri, 31 Jul 2026 04:37:21 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:20 -0700 (PDT)
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
Subject: [PATCH v6 13/14] video: backlight: lm3533_bl: Implement backlight_scale property
Date: Fri, 31 Jul 2026 14:36:31 +0300
Message-ID: <20260731113632.158440-14-clamor95@gmail.com>
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

Since the device supports linear and non-linear modes, implement the
backlight_scale property to describe this state.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 666213cab667a..adcd6ac7cf229 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -141,6 +141,7 @@ static ssize_t store_linear(struct device *dev, struct device_attribute *attr,
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
+	struct backlight_device *bd = bl->bd;
 	unsigned long linear;
 	int ret;
 
@@ -152,6 +153,9 @@ static ssize_t store_linear(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
+	bd->props.scale = linear ? BACKLIGHT_SCALE_LINEAR :
+				   BACKLIGHT_SCALE_NON_LINEAR;
+
 	return len;
 }
 
@@ -294,6 +298,8 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	bl->linear = device_property_read_bool(&pdev->dev,
 					       "ti,linear-mapping-mode");
+	props.scale = bl->linear ? BACKLIGHT_SCALE_LINEAR :
+				   BACKLIGHT_SCALE_NON_LINEAR;
 
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
-- 
2.53.0

