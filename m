Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797676;
	b=xnsepPfItNIKAjYMlw6UdYcnBpRz79+3iEnicpIJMPHVGvg6XyVgUeRA58YPMCM3WGYs
	 MUHLJANZ9Aw5cWxtmIIDAdxyPKe8eYzNP1Aauznll6RoCgm5xHrDR1OURQPBhxOmYE7pS
	 MDhV4krbU0csAaxMfmvqEMIlF2vR/giiyL9YTimSC2npSLTBFD8XiTXU2yFCEjknuUGFj
	 ruNUVGAP9jzHvBjFGaWYFiuXnRwIBUnvajwhnndXTfjBO7nF6y7HyNwjqocv9he/nsPhi
	 nSMIN1jSVkKJ1CR38t4ILUim8QFEzObZJOr4QaJeoFdv7oi/vuHrJHlGy3g7ZIQoUFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
	b=Guhk5fYzn+6ShPnfKQYgnJy4UoIuwUTuMe5f5ieYecTJ+NJ8wsLeQ/DzfMYIOZC0ZO3R
	 6IZbdjpZUB//nDGPP+8fRVhhM47trRqWL0sJlLSxxsfGnBqW3yz0UUcqefkgx31nw/7tX
	 qcregbiFyph0sgMBgVI/8oQP9lYy/0RDLdDmEtHmX3W4c/3+C10zP+jI4Ezp1TDvGD87W
	 8kgzgNvWr3dfFlyfTshkUKsIrDE9TQylfAL5K7ni7N7AoI8sgpZz+TBKpRkf/L3r7ZV0C
	 qDhRKgCwQiNvhp7AQT2CLOtAQFJeZqlW+fLpA5CGnKD2LzLuK0zhQ9xP+/9kQJjU+fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DHpiJXjW;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4FC606A330
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA4FC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DHpiJXjW
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so1046822066b.1
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797669; x=1796402469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
        b=DHpiJXjWc2VvUZ+kTST+87LNAX1RA+Jj0O7EDxLFrShsa7yBlQWpAxoM+6HbXEnwZ9
         aRRZSVKU/ZcM0Zu6kVV6x8osOnwXT4j+4u4jI1N2HfjZijrRu3vJUdqkju6M6mrZYKvj
         xPgUPomWIx1ccqHgw2zN+Tzk3OzO4My7zmuOmR38M3Jeu067GNBcGfqNnT9y07oFhDp+
         wG4sQLfgzZfFsIiXWy8dBaaotqlRwYyTW5dn16dU/50vO3rmGFNCZWikb/vahK65wQTN
         VDIMp3xExdZaV3ul8LkxkOohLOpRpon6ukikLyeejWHDRABYPpzW1a+pAJCADzCeHl7L
         aC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797669; x=1796402469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
        b=goXIzrO8qW3J8EnDUL/HfXOeUNKta2r7VbxLhkjbpJIgeCBboL7huk62jPcJt0wU3X
         mR5RyRLNAqodbl2GH8pfG5X+JoKDuhIHeS41zwgXEkJaP07W4bd636d6KBxhTdb5sbDw
         YkCu9tueOG167JiDBv8JJ4hWHHcmWKPCmmsyYiXIprDhBOwNZcTfUaZC1PCbvog/lKM7
         y8CzQm6iDSjvVlIaDr+i+UKr29/KZbXEt1S/9QXSqcaKI+S6ITtAuQpryNJ/fsk7xZPg
         4FkNeqoEfMRQaqXqu5TIm3Z+R1gNx3vhTVHLANDndWvm5hOPWg28u5cJGIC4gepTTNfK
         QyyA==
X-Forwarded-Encrypted: i=1; AL+hErEHV7ovY4KbpxW2bE1/iIx5jMqDB1aD+XkLZnrXm0/CDzcw4U905hTe0sEmeN0QkFiAMXI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/unMZTy696hyG4ClMXUNsbq8zGSZZPGxOn7HpZux8YiMJz3z4S
	rDfe5CKAgRUu2oVV+dBtMKKcpn32lXaGTYZiw30BZdLvkrNRxPzAxt14nNuq8Q==
X-Gm-Gg: AZFdTZc41fzhAtSXOKDUm7oQiejIzKHeX6gatGeaEcdWdPLKigfCayWbjWTl3XwiHnF
	JfCyh/RrlXDRSi6ZtpVe6PbyrT1FM4Eg2VHC/zH+PVGv5Yc/XUKNI63+CsAmXIA4lnrUOD1I3T/
	fTcqiNbpDBoKYwPBytVgDg2qqSpeLyQPDWjniTS14ypYaXNroA4C9kWLrbzIwneg8SmfAHx3DtO
	163s3jpEhL+/8bITQcUlbLOggWw/5JhnAnbwGVQ5PUmKxCWd5ykWa9SeOoaOWPmEjIm8t3UkcjU
	389AkaKXyX5JAAt3I60/HXkfRcMN8KUCvidhNsad088H6ycS81RxCgqlxVZe6H6WBg4k6rIP9Dr
	fnr5BMqMp65+GvpVz+x6No74NvpFXgSyI4YU3UzOPlCJgWc/Lm+bShKpW/FP7pBJODD5KZ/5+Is
	Uf3R2HesW05Q/ufgyaI19UruI3wCjLttT5KTgHg00kDPUfjKLEPd51BBFIkznSxc5nuPmeu2oAn
	xnKczNdL4cAJqBlrVwJZ/jYkXVrkrKvYxaoI3eFSX6xvXQd7TeJUrIGZmLR/dobhIPU+z2LgJFc
	zkJN2QeFOwiZ08XXeYM7hp/RwqBms7X1DLxrwTRyRjq78mAb0nR2rfSUu01CHBsXyVHM8/SBqRU
	5UDf4c9FyAw==
X-Received: by 2002:a17:906:6954:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c513a5ebc65mr1653532766b.13.1795797669130;
        Fri, 27 Nov 2026 08:41:09 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 6/6] mfd: max8907: Add ADC cell
Date: Fri, 27 Nov 2026 18:40:44 +0200
Message-ID: <20261127164044.285910-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164044.285910-1-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
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
index 103294c76b97d..ac7b41ad400ed 100644
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

