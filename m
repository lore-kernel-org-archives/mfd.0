Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430599;
	b=DS2erc2DmgU0oHAmcs14M07aRIVARuZAijdfPgZjxwORGp/W1xcsRyOOP8UGpA9bD4+Q
	 Kq2fzCIrDZ4ipS0Dfo20Gl8QCNdSjv82yB3yAYFCLyY1BBoMPwF3u+DOZYhEPzMnPWgK4
	 dCvQDZIlJ/NmEE5r+xFZni7kpWermtYyT7NaUhtQ9jQbsG+gE5LPuM2hho/cbbqEwkK9z
	 EVFL1BkKE8KOI8cVxjvP7TXfKZl4J42XJDtKJLOMohqnruVz6K3jFJMmOjYUzJewD/8KW
	 jn07VEuWl0DcAbWguzqX28H2gZ/wDYhrifaBmlqtZ6Smgqi4TkTuwbmtlrldTeTo6Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/68slAGoCiWwGW7/BCLB0f6DYnWaQm4ouuZ6Xn1Qqn8=;
	b=D8tvzpHR2TyO/colSbEz6yJ5IGFBJ9GPiU6ruXFIytw6g/2vwEXJsjnpvx+gEeYqSMdX
	 Zyh/iP7uIBT69qkpt7H2Yn4P2iVjphYY9fzZ+RmHBlo9otKAoVQHpI10LvmNeHKtJhyrV
	 vfsWiPY9VE2Rnb63LdRzzksaMnyUoBXldPkUuv+O7j33Y5sE1IIw6f9k49rxXpDbRuOw/
	 UqtAP4tS8jQl63RDXlWWlZvBNOW+P2Vnnt93XtjJUXDU7x9MsqbA14D2du4/2LsIJB8Fd
	 lOCYKSi6uRmEGkphzb95+IRR747Z1ly8DfXGm/aX34xkzv40YeMga479WxOxfGYlvVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJFt2fLD;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7B8606A321
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D7B8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJFt2fLD
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53dbe9b8d6eso201458b6e.1
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 12:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430598; x=1795035398; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/68slAGoCiWwGW7/BCLB0f6DYnWaQm4ouuZ6Xn1Qqn8=;
        b=BJFt2fLDF/3jmBPcLfpRvMCyq3L3JH9lQO1PwP/oQ+jkuY4yooB8flnat7OhLXBOlA
         N75s/s5l66j39rNWFQZtQlzFH8gsR/WgN4HyDhMBOceYovTd3ZPXMkk77nV5NM1ZKGjd
         SQTeIkLl7gY7SS0jYkNv5NI+5c7eGOUnVh2ohT5QeMc/pOh71aXkKuxJb/ekXVmjlzqC
         8qvOao7hnTWYKqErKcW44xlqiaQ2rZf2xupruBlIZByX9pUmtVqjF2uC8zjZ9WgzcsQq
         EV31TpoPquiQXeNrHJGmeAWA/YGep3rbqR6E3SZ2VoECeigKFkajFsPUH4uvYnNl9/H8
         oAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430598; x=1795035398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/68slAGoCiWwGW7/BCLB0f6DYnWaQm4ouuZ6Xn1Qqn8=;
        b=qG/14+u5+qnPOcq8CIi3dzXL0rY2xnd4hLFri05YOzH6E6ObmZUagm3NeoqDcTF3+S
         u1MuzOTSdF/MrFaKK2uMXN4GwU20Mw/Z3vOHElu//I/vcvUKRV0KdcaOsir0UPdUNIKg
         HXT3WnXCju6Ci6dFQ8wN5FP9yVJ7/2U/8utjPZ//9yKJBTPC0Hp0Q0WoXdTPQcQPh7GV
         8EKobqNxPkAnSispLdvfYtkITJz94Gr4RaSbBCC136L/CTSGa/4puE7F3GHn2x220Oy3
         r9MvdzK0KeE5hxXUHrIvzAsMx0xH7d0roTcFbaEqd5QzAsR3bV1UOT/oZ01gc7b6wPss
         Rxag==
X-Gm-Message-State: APuU4Z8gihyK2XF0Wmz8lRkVCvaDgKBq/x4f/pAKZyM+Bqt/NJrjXIO3
	g6w/NCyMsu9P8QODquDh1qEZ8d0uFFMSVF34wU8VgbxhfBdWJB4NrvR9
X-Gm-Gg: AYBFou1n+SV9fkCPu01XpQlDaVDSVEvTzFx45PkeGCNm8Z8HkyfJyy4mupdeYx94JW7
	CaqfHwXP5Zsbmp/+wfn33UamMCCFI+xPY8nENDb8ZfzdYFoZhG1HDfbbTMEx+LIcUJ4NgUKktq0
	p+s+LRE0zT2Rwv5ZP9mBjoPJFTiIfBZXiXG+ESx51k6I4+vtS58DlVVtASJf8ltDVWIrGaCrCBC
	9w8E0W3cw/QoRK6IRF+uUB33Py9/d4wJtYyh9wS18ZJdlHu5gPnaLiLEoZQ0sSOl+hvd0Cq1UX7
	CNcNCq9qggFF2rGIVzhSb12cnW19K0edvIkIAGZt0+M8QD1M3Z2+qyuTXShEwr+EP5ebqTj3tZG
	S/tIUrceY/vvhyoYqnO8LFtR/MZRLXLURokUAEFF8EzK5BdhN3Zc2v42XFeNKFjRnEYc/ffIpJc
	2HCjdE0XOvyQe4qW5G39rVcBivN8eOCw77lC8a+CYDf0FHsXnYu/BZr9ViIMUnSXm2OlL7HqN6I
	Wp4/X6np+0sO7So+N33sR8Rif0Yzu9JcSdwAKtZftM1ymBJ+KYetimokJiFA9mEdxs6A7d1RPPi
	2Ak8Zj4i2nZ1g/nPszxN92Cfx4YFTx4MoRRZb+H30RJzCYz+M5c=
X-Received: by 2002:a05:6808:320e:b0:4a4:989:bb1f with SMTP id 5614622812f47-56cd7618fbbmr471755b6e.9.1794430598142;
        Wed, 11 Nov 2026 12:56:38 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm6564231b6e.11.2026.11.11.12.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:56:37 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mfd@lists.linux.dev,
	linux-pm@vger.kernel.org,
	maccraft123mc@gmail.com,
	heiko@sntech.de,
	lee@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 7/7] power: supply: rk817-charger: Clear full charge cal on resume
Date: Wed, 11 Nov 2026 14:56:27 -0600
Message-ID: <20261111205627.56652-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111205627.56652-1-macroalpha82@gmail.com>
References: <20261111205627.56652-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

After suspending, the coulumb counter may be off by a bit. Set the
cal_soc bit to 0 so that the gauge may be recalibrated again on a
full charge.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/power/supply/rk817_charger.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 9a8d14691f9a..fa140d437b04 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -1398,6 +1398,9 @@ static int __maybe_unused rk817_resume(struct device *dev)
 
 	struct rk817_charger *charger = dev_get_drvdata(dev);
 
+	/* try to recalibrate capacity if we hit full charge. */
+	charger->soc_cal = 0;
+
 	/* force an immediate update */
 	mod_delayed_work(system_percpu_wq, &charger->work, 0);
 
-- 
2.53.0

