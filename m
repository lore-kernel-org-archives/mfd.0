Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131819;
	b=u0FWR693PvAl3FF6/QR2VayS/7iC7YHJ5fSOM4Pltxcd5QDem6S4LDknKCyPkW47BufF
	 il3BGeSSL6KwdRymPznUsauO4IDEA80VKfFCtCj3xXlFNXawiCSEIJLuhk+bIGr2XBDa2
	 sB4DYNyi5+Duy5eTnlXwKxu2hCtlk+FD4O+IZmD2wAxtt2QSEGOg/J0St8Vf6Abft4akp
	 1Kbot+OTGzIlIznZW73Q/gCd2U0o9UxPRoQcSG0CyNtx6Fr+mMJ+mJgoTSgTINlB9zNUo
	 nIOL/sv/sFfv4L0Zqt4ZVnHeJF+6CbZXvzpTXoIHFPzv8NUszoqzL9zGyFKtxXVUzHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ugACOXCHmbMQ59e6XOW7QryfqNYQQNBqkuOYV89Woug=;
	b=qCHGInksnKyG44oLOqSGDMPN/fubtZjUfLtybMgPzxigAVtZYDoZx2eguczJ8dnriRVB
	 UvSD6GqyD+C9akAJNeT1YUx3TarQmVXP3JMj8nP6kUnaJFthPjf/ckRSTUIlO9+XNEEEc
	 MUHAYAL9OyEj9vwCRqlzyZDvhImJ/4v3+e0AIOK2la+bbx/6cuapBuQacZv71EJoYsdnO
	 EF+HX9gKQWHxX2Nu+q7mIirt2wMzLjqfpbZG+7+HvZlmWiqSw9Z/t1/OadJO163S5KoP4
	 GkgAe+JJOVAFVIZRrsjvKqAJyeIURX1oqYXeNaT/pR0pVxWDTkul7GARbGYcTaw1njA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPrL7nl6;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DCA606D81E
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 09:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DCA606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPrL7nl6
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4682977f9aso2340366b.1
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 01:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131812; x=1794736612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugACOXCHmbMQ59e6XOW7QryfqNYQQNBqkuOYV89Woug=;
        b=OPrL7nl6hD+yu46s2QfM3P1w05jwpwCOxK51eFrQgZGNVHJjry2M/nX5SxTMXYQiaN
         JttjrRHjhNm7HL4RC0Wh+M0iAAZ3A6YtMUPIEq3VKpFfPeWp44D67z9g8KqqkrwS91xc
         L5h/GTRDLNlDoAa+7WSiaPekGeX6cmdIybnfIP3A5+xyVawdyZKGsd9lIKzz85167QBr
         SHvWS+lIlQhnWyiWhNUo5U6ss1+nQJgf2aGANMm9jG2fFpp5/cdksttVG4mrVuyxP9M6
         hVTU2QcHRHVqSYjhco8WGK7fbOHfnwtMfuVWE22QDDtRuHUJZQIGJrDsueiX9Is4wDYH
         s6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131812; x=1794736612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugACOXCHmbMQ59e6XOW7QryfqNYQQNBqkuOYV89Woug=;
        b=EflHj9xMNB2Wj2RP+pjs56Rp0c/iw6vGvCC34ZA+RK5env0G1eL70lbJNjn1+gD/00
         bKSh726Q+xzX5AVTsDz9al0LmjHgQC/RKAMaIxqOWGPjlTHJ5xhS3Lq6xYq8UaLvRMwU
         Fyrz6c5pfSBkUb4W5IcbQlPvJjthkCh2FqEtRVp5fw9us5cTFzEdbE8JIPR8r9Jb9n3j
         B4Jc4UKDmUrluRATzf+tMQkibQjgXrc0F6McGAqlY3iUna6bWTX6oxzCH+7/kGnq/XkT
         5txCp8GAfSEAp89rOqctA3mpVaBBvN4ZEM5OUKAaj9ee1kCYhkdjYAsSGjuEtjCT14FG
         KMYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwufhd/IZjXC4J4HAFafdLOnqle/zFm+5o9rAbIYO+cd9Hw95UUupNwjeaoE1CwF2RAAZw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/sAkPzffRjj2uCyXo4d7D2PFeayvOo17dKHHsOXdKgFl/tKDXN
	Bhm+7SEFZj87zjH8iNRV1LDBEYSEwJnQ3uKZjllAMfbKZbqugFozLq4z
X-Gm-Gg: AYBFou3QBfLxnaBVUs2OO7WzvT7tQ70rUIK+7uVePzuPG+2MubKf7GwRBKSI+6bc8Dz
	aESGtwrdHM7MTPtsxVUf50+u+QPcSQxodF7oZYeWTnYHU2VIWqqH3PvUprJA3jZ6d3tipphuJ/4
	09tH2bbM0QgCC4HKsawV8SwmFA/nuNIvJ+XwNoxVm+Dide78tSDBJf8kbalVW9rviXHy6jvLudq
	CmysALY3z72l2jz9y8YmZd4dw/xpL9Ao9cDsSgc0Rxme5qlWMYbH7biYg8PCQ07Gn+MwWxm8bPf
	7CD1R/IIYQx6DP+BaY/v24xCL0fgml2pS1tRImmFhaykcckMSw+gvyeLfkYulhmwMGk+F1AlJNs
	SVdp3Ws5DUMqCayWyjpEuRc9XgKLEL8oKJxobxNMdk/J+ONnTJueqbitDhZBmjD8fvmoMfbrqkH
	/VLVIjWWGvHW5zgjWfC0AnKU7yvZuX4AbGCrW4WTl1CEFt4maOXUjQE1igh6t5gJC0RyoXYkRLS
	Yig1BxFDJgkD++3WPxDFahdg4BJAf98KfJc549rjv4ddIekbrtnsCXyuBXTpOvI/SskAuF6EMUs
	Ya72axs8YoI05wRVzdkKvYopBU8S6PN+I9aXQ8vQlfR62HSAMhxlBXo+Oraxl4l7wFqbQM7tzgK
	fKruEsBqfZQ==
X-Received: by 2002:a17:907:2d0e:b0:c29:d31f:7d6a with SMTP id a640c23a62f3a-c4d6d7d7a0amr75803866b.35.1794131812255;
        Sun, 08 Nov 2026 01:56:52 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:51 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 4/4] mfd: max8907: Add ADC cell
Date: Sun,  8 Nov 2026 11:56:34 +0200
Message-ID: <20261108095634.100517-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108095634.100517-1-clamor95@gmail.com>
References: <20261108095634.100517-1-clamor95@gmail.com>
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

Add the ADC cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 86579729111ee..f6b584b002e02 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-adc", },
 	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
-- 
2.53.0

