Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98696414A3E
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 11:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497842; cv=none; b=F/ElhqIVtQBx7XcOR8nWOtYN9VKfOWA8FeJDYIyWQzKL3/XqxHo3DvQmtM3tcdVyCDO5vNqGjF3DcpYaPCZdS4LUykcsyk4J9gc+ZNltNbvcpfivMX7JoNIqr5W1aKjsjbHaBPZX6JM9jEoJhsL4cMQLm4eyqWDEZxb89vDwWhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497842; c=relaxed/simple;
	bh=LRUvSV70q0AFA1Wddwi0DnOPUeCXzMEzhUYihJPrra4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsLRLpYIo6Fbl1TWYydxQFHYSFjJ8W6ntL2zt9N/nLcMtaNwFwbvZuHxVpItLCRJq05Rx5BLDzDZg9rUE72xoSkbCKLjyFL70AUlpgeFy5wUWz2W2hQLez/Y8z5cnXvUDevLUWCuvj0k4l7vV+G9JGSAxr22iVGEKkYtg2EEVVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=io3yEfgw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="io3yEfgw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1212155f8f.1
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497834; x=1786102634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjX+fB5UFRlHcf7n2PcBZQATegbj+CND3nwA4wOUKpg=;
        b=io3yEfgwpok5iBHeIDW2hy11BdzBDHz25en1/LlCB/iYaVWt5Z5/T1CtME3kqEKUw7
         FCT2GWJPT/yegY48BlWc2PV5wbqp3RJvZ0rbhfv0+AhV9wM+AgVHwrqp/aZqr7L5EbU1
         Px3StLjWs2t/aR5goKR0VdlLiX/b204IFBC7SlWAUn+7wQepGQdUomwu+XgYoK+8Pexj
         9qEvZ390AO/S8Jl/uMaZsvDXeSGehhO/rQ873KbuFj9QnfmVLTvDdetqIL5t0SLxBpKz
         NnuQF0499exIVP8hN9GHU1smceY3Xa8MTabFoP0UnKw4ALg/Mo+foRKijofZqu+DfW05
         ZeJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497834; x=1786102634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjX+fB5UFRlHcf7n2PcBZQATegbj+CND3nwA4wOUKpg=;
        b=Nboyj2s+y7EaHC0fAVMNicX6bMEFDE4SA9/NlpoUR3+NiPQP3kxqwu7kgmJIKQuv1m
         ZdE1eLIq06lG02XAVw+LTNuzCA9eoyS3F12+Uhr0UtwJOLI7hn7S233JqEyEjQU/9UMR
         Tmra/sfSHrz557ScuUGMMzN8pe0U+s1oWGg3tPzS8RTbmekjI8Omut0qzh0Qzns4o2tf
         1PQCyC/N80LW545SRN6IX7m5EPSluqHOoZ20tpUnoYo01Gwj+usdSeEGRflzMZbJlbj/
         p+soC+DDWv+PaXszVBfSqSmHWmHH+dHvya2NB/NI2+oSHhS329IHkGGzP9EZh3S0VJN3
         WawA==
X-Forwarded-Encrypted: i=1; AHgh+RoSjjXWSJ7elakz6SADGLyETXPGgN023z1GRZ5yh4ge74VEJdxbSeGpR8p3kfqQvIqHGzI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyD/b9Ai6eH1W+sDpJ1pSAppHk9n+jxC4a15o/pkZPeGMQxyW76
	XYdo91JFs11LQzGYQFcaYB7BfHMfjubcjf252Hux1P6RGS9DIrzzbN+S
X-Gm-Gg: AR+sD13xf0knmgI3z5mTfeRSlrGd38eRc+ROl6N7PZEWYM0sW8ppd2QmLOSIbKtRruO
	eqwv3jOVmk53Eo1UlnsBopu8JOpX7Jo+voRdHKWsIk3ACQIQ70FRgmrvKlRvtwbWg0pRYvH1cQl
	ZGG7G4aJrHHvgTk8OFs//kFh+TkIGEcJ5QpY9hny61Zsf0SkCeq81VzctYRQlJF4vA/Kllf4m3K
	yKYpPnKj12DIhZTDNKGKWoCkV1IYeKkAWRSatlH6pF1PLMg/dTZT/gv20cygezHA5dw+hGOl4cb
	MMh5eX5zQvaES/gQEi9TO2ERvcB5SAb29AAh9wBRta6Wy5NAwyflghnUhG7ePYz9oTXuzZtpPDR
	e8P4TJrsGqMmsHZfg12U4umCRXBEl8h7u6anQhcwSJ/eeAvH3QqysB/5phcgliyloU5myawUx3U
	CpFDvjXllVVVz57uw+rF+dirzSOqOfqm4iEVuHNqT75AZCvGx7m3Q3KWxIawDBLgphGN+lwNvOJ
	8I/5pwA0A==
X-Received: by 2002:a5d:5f85:0:b0:47f:70b2:7321 with SMTP id ffacd0b85a97d-47fd32fcb20mr3516082f8f.27.1785497834285;
        Fri, 31 Jul 2026 04:37:14 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:13 -0700 (PDT)
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
Subject: [PATCH v6 10/14] mfd: lm3533: Set DMA mask
Date: Fri, 31 Jul 2026 14:36:28 +0300
Message-ID: <20260731113632.158440-11-clamor95@gmail.com>
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

Missing coherent_dma_mask assigning triggers the following warning in
dmesg:

[    3.287872] platform lm3533-backlight.0: DMA mask not set

Since this warning might be elevated to an error in the future, set
coherent_dma_mask to zero because both the core and cells do not utilize
DMA.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 2a63df034171e..9233da7ce0996 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -479,6 +479,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 				   LM3533_BOOST_FREQ_MAX);
 	lm3533->boost_freq = lm3533->boost_freq / (500 * KILO) - 1;
 
+	/* LM3533 and child devices do not use DMA */
+	i2c->dev.coherent_dma_mask = 0;
+	i2c->dev.dma_mask = &i2c->dev.coherent_dma_mask;
+
 	return lm3533_device_init(lm3533);
 }
 
-- 
2.53.0

