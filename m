Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793071578;
	b=KZPqcodtVbsN9SF9zOGOZYtf0hvB7cqbaLa/PMrAc44cV7KOjKke7Qnd1sXsF+WrGbk+
	 6nxo6HR/Br0+jniAmoSoT6M2gQRAXdSNCr16B+RY8Bz9XY3qljlevbGBgzrGHRiIfWZLy
	 ybhCVvyQ9njlUfzoaNmBkdZ53BNRud07gdzE0bIoiY2yZZTlqgf6WWBzP2Rdfotnr/2sV
	 ZO3ikOX6aJWrEqrNYWQGk+ISqRyb/x+X4hIpbtuPpxdk8q63AvpUbpEr9m0eHIVl2QeYE
	 TkJxdt1GuBMw6pypfzQQYGpQK/RvBovXNp8mPobDs0o2qg4WZS4958kxmbPKmWs392g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793071578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2QK2iE7noXFpUwQUNk0LfJ3uQv+Asv37AvrfE0uGxCo=;
	b=RTgvr5J5ioaa7r/8uSj/ohcFovPkNjgTFNr0k9zBaPjE4JpIrdgDZy8hFweHX8oECC16
	 LZ7cvG3iRwV3x5f51egCDIYC8d+cF6Jo7kKaiE2AwB22CBrs9oGes/Khi1x+qvXPg4QZx
	 iIMtSwJzw7IfHMuz7VCVxwUCizTZpUQ5Wxv0mbm8MI0kyRgIoAs9NH2AB0Rp5tYkPSOMS
	 ooDV8jX39Rr7TRkWrfCPq2Gx8heHQzD/1bhGJHdnvY0RhpBOtqw0Z/3xtQ2ys2gLYY72x
	 zCtZLRHt8xOhaic8hvMY24llN4/q4gNP15zVcWphHhbPr18xwLez7TMuBWNB0M7PeWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MAT16F8O;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEBA606A31D
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 03:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBEBA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MAT16F8O
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-18cdcfc05ffso4526169c88.1
        for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 20:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793071577; x=1793676377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QK2iE7noXFpUwQUNk0LfJ3uQv+Asv37AvrfE0uGxCo=;
        b=MAT16F8OY9cpPhYNbioLS5c6zYYY3BtpymU5vCuntENARUTwb1cB01illv3uzblzWO
         OFh50tuhH/zhl8pQh6RE8FBZk7ShpCwWtOECXv38SnfHz3R0M7+U4rUc2rL2CHMCIKvP
         YV6xz+tnlSVC8aNcFIBaSaovOLRGjgKbxyBOP+raGk3dYfoEbM03h5kGqon33qBl7LDu
         zDMn8SqFeMUV64qGXXd5DRXLsCQQFI2oyNL2Iy9WkzuZuDI+8y1sk77KT/5jVHkRaLoP
         15FjzPkZudg7yvMS7L439tGWUL+h4dqRyaf57FVX7g7ileUFr1XdFQNWAVaHcw442Wx9
         b6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793071577; x=1793676377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QK2iE7noXFpUwQUNk0LfJ3uQv+Asv37AvrfE0uGxCo=;
        b=iUyFkOpphTIqwTxPGLmVbRnqA+djh2Uu9YrwA07ztjI8BP0Hp47dTE5MNvOUEWOwhO
         PhSt1w1OefqfFytO+rnrhVEvGHG7CU0/SYOnNx7uEJcUTFP8NN6dSoO4FlLveWji0nR7
         BdQJ0XqUddrZ11G0jg5Vpmf/fQyozX2o1uYJf0/XtwevG55+fiOmMDfrE8t5k821hlY0
         rQ22GpBys8Zj+amG/dD7uB6hwfL3cA5HlyITbkFFrE+SFnJj6wQbVNTWIex5fEuWqfNX
         0LcK2eOoIIBYrqHS0Xonsi6oYJkDms0Nj/x9VeQ/4Rjkp6WI6NbJUbIkdj+mRd5qnRUc
         W5lw==
X-Forwarded-Encrypted: i=1; AKwUvBxxcouqZmrxcOueQd7Em2/hGX+C8GA2JhPsevagitvrOPkThnewyl/ieJakVcFyn6M0CSA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKOG0jeyT4RfBn4HPW1z2GilkeL0/bT+/ffyTVNAl0AVF6inHsM
	BqsrIkMpWugeVP1WJEQqAOh5HuQ2A0nq7aMoPsJ1bMqh8iEk5D8tzEki
X-Gm-Gg: AYBFou0herE1kY4PV8hVnRxmvPprpPF4+kyaSIsj2IalCdy3hXvF4aAfr1oXWOy9qzb
	hn6yUyqx6OOWNENVMKCFdV/3St+bDVkp8psehKOXL8ladGTQ+9Ms8M+WPf6YVU+cCpGU91hhr+t
	t6XrJduCXNk/mcNZOHiyC6arcP0M/MeV0B0gsD/9m/5jod6bAo+GBkVxUua6xA5mPmAKR0lxaCv
	6dvV5tiK1JE947214FFQdpqRipYyk0Hnt6YTg4jd3AQ7hR3VJQY2GGoj6UXnZ413ZIBm1sbWWdH
	wQfG7JniP6Mt9TLOmgotzW3uz6OMxGRAtEi/y76lffo62cIRKuBkGcA9avisI152KGERK7HIc99
	EByoegLTSJCU7qGFxJXboHfvmRmcSio6d7z4CENB/f55qzaImt2E7mLCCCFtKAZDuNaPTBp1QIJ
	WR648fgsP/upR5fEfgwPs4IX/bzByH8OFcJzXlFcX7jTdXlmbHy+hbEwKXuJCKFeJbA/iCzbjS7
	RonRUmQ3NF2uyXk5LI6QROAvyTkK7JGzf5RfIEUXQupI6bfQzZ66PuLS5xtBxBmZWWKQkTcR89T
	ISN3+lN1M/PJH4uraA==
X-Received: by 2002:a05:7022:b886:b0:16a:b995:dc7c with SMTP id a92af1059eb24-19935be80e7mr11905109c88.21.1793071576759;
        Mon, 26 Oct 2026 20:26:16 -0700 (PDT)
Received: from lgs.. ([47.82.67.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm32317865c88.9.2026.10.26.20.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:26:16 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: twl6040: fix IRQ action memory leaks during teardown
Date: Tue, 27 Oct 2026 11:26:08 +0800
Message-ID: <20261027032609.119226-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

twl6040_remove() currently removes the regmap IRQ chip before
removing the MFD child devices. This destroys the IRQ mappings
before the child drivers can release their interrupt handlers.

The parent driver also registers READY and thermal interrupt
handlers using devm_request_threaded_irq(). These handlers are
normally released by device-managed cleanup after remove returns,
when the corresponding IRQ descriptors have already been removed.

Consequently, free_irq() cannot find the IRQ descriptors and the
allocated struct irqaction objects are not freed. The associated
IRQ threads also cannot be stopped through the normal cleanup path.

The probe error paths have a similar issue, as they destroy the IRQ
chip before the device-managed IRQ handlers are released.

Remove the MFD child devices first, then explicitly free the
parent's READY and thermal IRQ handlers using devm_free_irq()
before removing the regmap IRQ chip.

Also update the probe error paths to release successfully requested
IRQs before destroying their mappings.

This issue was found by our static analysis tool under development.

Fixes: ab7edb149c75 ("mfd: twl6040: Convert to use regmap_irq")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/twl6040.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
index 562a0f939f6e..7b05d21cd17d 100644
--- a/drivers/mfd/twl6040.c
+++ b/drivers/mfd/twl6040.c
@@ -745,7 +745,7 @@ static int twl6040_probe(struct i2c_client *client)
 					"twl6040_irq_th", twl6040);
 	if (ret) {
 		dev_err(twl6040->dev, "Thermal IRQ request failed: %d\n", ret);
-		goto readyirq_err;
+		goto thirq_err;
 	}
 
 	/*
@@ -791,10 +791,14 @@ static int twl6040_probe(struct i2c_client *client)
 	ret = mfd_add_devices(&client->dev, -1, twl6040->cells, children,
 			      NULL, 0, NULL);
 	if (ret)
-		goto readyirq_err;
+		goto mfd_err;
 
 	return 0;
 
+mfd_err:
+	devm_free_irq(twl6040->dev, twl6040->irq_th, twl6040);
+thirq_err:
+	devm_free_irq(twl6040->dev, twl6040->irq_ready, twl6040);
 readyirq_err:
 	regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
 gpio_err:
@@ -809,9 +813,10 @@ static void twl6040_remove(struct i2c_client *client)
 	if (twl6040->power_count)
 		twl6040_power(twl6040, 0);
 
-	regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
-
 	mfd_remove_devices(&client->dev);
+	devm_free_irq(twl6040->dev, twl6040->irq_th, twl6040);
+	devm_free_irq(twl6040->dev, twl6040->irq_ready, twl6040);
+	regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
 
 	regulator_bulk_disable(TWL6040_NUM_SUPPLIES, twl6040->supplies);
 }
-- 
2.43.0

