Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455627;
	b=bnaXglum6MZbJ4fzdasd72ENWOGi5tK77S0aDqNhKkTakXZqELEvwr2pgfDw8X/uTqAr
	 V+OiT8a37JJUpbmITzzOj3/aYbOh8ycwV42UVgfo/8K73M1b6sHT66iY4LHrHYS9Z2tqY
	 D9mHFU+jRR+xvcGUYQqBjJmQcBMeBatlqhyfpopbKMPboFlCEQQeyEkUZNUyoh735zNHH
	 1F8z33W11UhsoBl+q9JC8Ca9S5BaIJAq2cwwFn8lElKxdRojg//w3cvu1ADclfdAdP8Hr
	 JKyIy/uaMFJ0SVQmuOcYh64lJYdZhLGgC5e23ImrrsCVnr9dOqFIdxLStp+bWyu1R5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=m7ZQkqoer6i6wo4vX9KRUxRB4qtv9xqBhVPgTvtWcdE=;
	b=XyFRmdGSTsmG8qyzWzbuR1xG5X0lsPnKUbki1YU5p1ybVdAjepdAVKQkz2xptPKD+a+v
	 saIqvYlFynQCJbUU16xKFLPVebZu2cBn83Eau+piaiSUZSWs07oUcSMRrHdWiBAIFdHIb
	 7L4v5X0B0f1gRQ4qmEpstwo/rTATR9j643CP9U9kPE3ZSoVS5OO43aoi1Rq9YrMmM8k96
	 kPD1p87Mu4EzkjMI3M3um7LO0nF6XwDDfWgYN/Omcj8Sz017fpuDrkTUtPSz2gKYwKGYN
	 VRw7RHTiAy7ivdQ4QWGMeGUjBS6vDuYvhcOhOPNRW7ElADGvGAIPix5qDsixSz5byFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sv0D7YTp;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F95606A31A
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 17:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sv0D7YTp
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so4310168a12.3
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795455626; x=1796060426; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m7ZQkqoer6i6wo4vX9KRUxRB4qtv9xqBhVPgTvtWcdE=;
        b=sv0D7YTp2QVSXzvg015Pi6Zz4jpliv/2HNTibJWU3P3QXCKvtAbADls6ZP7xoVH2Ja
         bTQi4+dQiyFUr9L8l6enKm7FuGmwfEkqccMxsn4XQ4xMQXz9rNqu27amaWYsv+yVx9QN
         JvI6bLhtEla0l77fFyumMiPYvl4gdw3BieM5choUnI3bwGO7FGYi6nWviZUgzUrHRB3L
         Dr0jjZ77rG1afgug87sxQ9pppYWKazyJkvdL2v7AXPtRU1LLviKTrfVeYaNF4OJSKfhU
         wive9mqfcXjMHxHBWSn072Chos8A6fe2JsiSWokCak0kjURAlXesNihE4oOdzASOqqbo
         KSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455626; x=1796060426;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m7ZQkqoer6i6wo4vX9KRUxRB4qtv9xqBhVPgTvtWcdE=;
        b=OnFbOc5IZ31rRFkTPiKlx5jDkDRB7rtfTFkb46Vjtk6WBtIL+Ub+DAI+S0LZLvSXqg
         XlOe/eb1zIg8RBI1THVH/8kXNUIgATpY6MdIExcN+iScjuR/dCvnxn4PtguWc/0lklpr
         MnaagRpASba41r5Ski1xRjS656qAVTyLQW7zfLl9Ekhwy7bVPlSk14Uheq7d5kf6xD6K
         6kdlhY//sSm2t05YAnB/7s/hUrxjFXhgX7bzLiv4lRmopK+GG1sJOYzoA3RtFbROtfZP
         fe+X9t+UH88A2GHAmyVlqyYNkqJoaD2jc6BtAL0ZL40EETf4qwMucjYm4vrW3suSnT6s
         bmog==
X-Forwarded-Encrypted: i=1; AL+hErHRdvFutDof6tdkRCTwSrW4J59HoTdxY3o/b6I3UfiJKO4LaqqBbD2YVww2RzIP8+rsIyI=@lists.linux.dev
X-Gm-Message-State: APuU4Z93zs7esOK2ZAc8cH7jIi9zOdwqzRCl0YJkNFu9qkOTqJOd81a9
	Ml+jWXMzJdrcUmxelwV3JVM3pgIiTf3LGDo35t0lDz/MrPSMkb1YymZs3tOrWLzC3Jc=
X-Gm-Gg: AZFdTZfwRdINTTthcSC50Z5wd8+wo732qbM7lHasbTMHR6AfmMOApnIiz6HVtHvn1Ii
	GW1jKoQh3iv7lvM44A2uO8Cl2jQ++Ml7fJ7Vj+k33LepXMkgiPQpCOx4aXxGoMLJAyFLXQvGvoV
	3kOwX73Ls48d0MZCJsdQwBxt7RG/aTxfoF1EkyVs3lFVyvAOARoFk4tctkXZHhSDL6DYyBvzdAx
	EAOD6p/g6PYXNCz2GlBZWKpJvx07tyQjP7fE29YBtmuFOH4Gz/JYFqELkpzxnWmnZvrcd1BxO6a
	oozta8f0kmr/M2m4J6AdYIr7/KTrZ2RceM7nb4oHbEv1Xfe6tCoJDaCu3GvPXbw9YYS1Q80P9oP
	zemrOfR10IvN/Yp6NYO1ZXevV82UQu8+9Keb7JpP/XKcNWpAzSBDDzadBOocxPxBerkQohigNW+
	zELNSFGgwRgAzB1QlEJ4sCzjPKG7aDec2O3BLOGHr7Oo/NK554ixBK5H1MQKZappp+Wu4W/Yzdd
	vLsFdMarRsp5X+o/UCsTJN3o12k7etCwUh1GCNMj9+Lq1AIdcwCMiW/G/4cy98+gVSRJxCdpbSv
	A5NWAMirKvx5jws6A6sP9s/MdjZ3eY4D+H77sckwWLv1ZJUT/38cc5eKHoxpMaPN1lt2H53k7Nm
	tdbU03QYGQDP7rSg0S9k=
X-Received: by 2002:a05:6402:42c8:b0:6ba:a216:fe0b with SMTP id 4fb4d7f45d1cf-6baa21701bcmr3926014a12.42.1795455625781;
        Mon, 23 Nov 2026 09:40:25 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm3565504a12.30.2026.11.23.09.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:40:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 23 Nov 2026 17:40:24 +0000
Subject: [PATCH] mfd: max77759: set zero DMA mask
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-max77759-dma-mask-v1-1-6f5c8d52904f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAId6BGsC/x3MTQqAIBBA4avErBMaS62uEi0spxqiHxRCCO+et
 PwW770QyDMF6IsXPD0c+DozsCxg3uy5kmCXDbKSGlHW4rDRGKM64Q6bEXahVYNmajVaVUPubk8
 Lx/85jCl96sDjk2MAAAA=
X-Change-ID: 20261123-max77759-dma-mask-65417b861a53
To: Lee Jones <lee@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

During probe of the DT-backed MFD child devices,
platform_dma_configure() calls of_dma_configure() with force_dma=true.
Since the parent I2C client device leaves dma_mask as NULL, both
DT-backed children trigger warnings in the kernel log:

    platform max77759-gpio.0.auto: DMA mask not set
    platform max77759-nvmem.2.auto: DMA mask not set

MAX77759 and its child devices only communicate via I2C/regmap and do
not perform DMA themselves (any I2C DMA uses the host controller
device). Clear coherent_dma_mask and point dma_mask at it before
registering the MFD children, so mfd_add_device() propagates a non-NULL
zero DMA mask to all sub-devices.

Fixes: bb71e40db1b7 ("mfd: max77759: Add Maxim MAX77759 core driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/max77759.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
index 5818ee2811d1..e31af2c0d25a 100644
--- a/drivers/mfd/max77759.c
+++ b/drivers/mfd/max77759.c
@@ -693,6 +693,9 @@ static int max77759_probe(struct i2c_client *client)
 				     "failed to add IRQ chip '%s'\n",
 				     max77759_pmic_irq_chip.name);
 
+	client->dev.coherent_dma_mask = 0;
+	client->dev.dma_mask = &client->dev.coherent_dma_mask;
+
 	ret = max77759_add_chained_maxq(client, max77759, irq_chip_data_pmic);
 	if (ret)
 		return ret;

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261123-max77759-dma-mask-65417b861a53

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

