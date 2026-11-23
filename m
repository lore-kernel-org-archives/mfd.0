Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432742;
	b=MeL+LCmDsNODVfM54tK1zFA4pMjpw9+O+qDlboCvCMuNOYopS9bcOoKpNyA0Yl7ztVVF
	 ylETI/CAxIbRLM6vnLY6CRI036syXQtkN+mgUs72BWsuA1GDEPbsS5lP0keCJ5TI1KSFC
	 nVMKWc7d+SNjEuJxAEjMvBWnn3wkmS4TSzHmHU6eoXXYMMEo2R2z73c9NmKkPgYVeyieV
	 NvIGPmS7xUvBRLsLnfIPgVW/k8YzDcnNviBcdciy8T+CFbKR+2FGiGIY1vgwwI3xvNJVk
	 YsWmozi5uEDnS7kTEr5MolMzMT9upDoIlFXUbMVJAZwgCnrNc4y5Wdj6KU5d8vgy57g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=wfoqPgqjOoBEdt77NL+di01ivSMv9tm+04A93YFGYZ0=;
	b=LdCwOQlDpsMACAcZJZXvm3BNKEJIbF1OieJkqDwXbiJ5cG+Ifa7O6BbR5m4Jhmrx+41e
	 r2C9senY0FhhUo5txfRCty1ldvJ7jVrjCZp2E4mEGExrIhTLAzGWFycDWKdy1cAgn6J0c
	 zNo8wdiKCTJfYH3L8sCZiCVT/qwuMfAF/xL/D/Gm4R4pJesG/6CH+a3Y7R+Jt21SQKwOP
	 38/iRaBQTfgzLMEvF/flhY7W2Oy51GeN7J/7eYbFe8K8DdxBfPmSm4CzTdOxhGlDMTlnp
	 yDwczQeppdZuR0jIXWVfjBygxPpyuXiMM8jP+sOcZ5DTffpucPljYWsdZETtESDUC1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Zy6A21lx;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78382606A682
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78382606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Zy6A21lx
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so29412295e9.2
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432741; x=1796037541; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wfoqPgqjOoBEdt77NL+di01ivSMv9tm+04A93YFGYZ0=;
        b=Zy6A21lxl3aEm5YavcxgV2DVISF254386qwlvpvhmCsq1pnOaVN5VLUedbXhnsnlB7
         tZaF51i5rI9waPDcC+nYYZcQbXmjfFLJvoQ8ezhWnZMmISvJp/RMPdpQ4LfUJoykvLuQ
         qxCGEltj6Vqs7IaeDiwQuEiiCdQC0IbYyNVZnQmmfG0g7wUd2oiN4R08G5pxzQ08LmYu
         ixT6qKq1hM2iEyJGuarJSHmVE3VXYHZ+AzVz52OrRBI8JQZX2AlS3ORmcXmohuJ87Gga
         DNro5FpEC8u5N8kHLtdvSIbg6VYHfHyNbFZdTj/J1/HysRbRouBpiLVylPnEYyb7s11x
         5YXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432741; x=1796037541;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfoqPgqjOoBEdt77NL+di01ivSMv9tm+04A93YFGYZ0=;
        b=nhreAwoLjexIUfndWp7hUN8uMS9bvVYF/tueoIwpakUxzQtMYsduHmJbAfG2SR3Wge
         U/8ezHspuL1Hi0KAZEvRAP4N+ICrBBv9eXbu1qDqAhRV4bEkChw8LJopnvlicy5DACmo
         LXsForh3Wxj7xQUuLROv1KdEKNpBZynk338a7te4HwK2RJRlpkSB08gen+a4msiqcaKM
         pHL8wT6So6ZQ0RLSpKXfH1LuEGmBrPg8l52+lGZZ63Vjst7XQTLPzsprp+16/mLRfFPv
         tV2qqk/tkCW4tndRcmNVyYWqu8jCyaVQnfNW9klrTFB37fkfDe9ueEVGRQh6I6XAhOlR
         QLNQ==
X-Forwarded-Encrypted: i=1; AL+hErFkbzMNC7rgFhIrsdA5JoAvnFYIEZ9fWRiMwZFl8nmAjWujlRXafox/zAzAXH3hPT+smIA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZdsYOSBuSTM5UEr0Q04IxNuAqDtL3gU3wRR8hfZRN62J8dQhb
	7REZ1NwUQ+kXfzOfqUYW7fzj6bKXZ1/yzeFZpuDcWYP1g0gcaXksqExy624TXkSsZUk=
X-Gm-Gg: AZFdTZfaTnb9aOds9mciu7NGxTUHE9rnE8uPUz9XiFQ6hzDY70x6690ch6Gikfl5g1q
	aqSvNLx994bzqmgIRqUjhBTYo01yxQxaJfzPZAGrICJSbaOqa7UDPKN/teduLdqCBl93v/6qJ61
	ARj1Mn5QNGtUW7U7SI0hWlH+85qPIxgJRBnA21TcEOjuz/CBgso8CthIRkfFeoZogEgdXae4Cid
	bQPjnsUkFGXoM21xCXD9fClFzzewM94qGKz4lLP1KMW/GBfNy3hb/3dP+iGs4gy8qmWnHirHq4i
	P4rkWKckGvF7Zui2HrqZKUYSDE5B475UuKKZdRo7/Fk17rgnlJmLuff2JqhOG/zLM7yumyoLS6n
	Oy4z393TJioXUf+xNfu9LadtK6JdiPDBVpu+JvztRNBG3uAezIzmkbN5YMTpgbSxmbQ573T7SSh
	P4UGHhhs+6LDvRE+kp7IBmjgnwsqgIG/Eq7i/OYYbC11yuwJtjlB03l6vZ6z0QbhWutlmtQbdMS
	f7GBe/qwV4wSMJZEI33l0DGBssm5UtqDZ66Tc2Bp2W/DYQzzYCEbv3LyEfEL9t5IQhwJdRCxl4k
	ZdbbWQjrUl/TYofIjy/NHCsLvYaCFxLBp6us/QBq7XRyBwrqj0Z7FeuyGe2MH6vOVmEkAu7yam1
	CkuJKhTSooZvXQalu
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr230949095e9.25.1795432740837;
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8526cbd0sm451761005e9.0.2026.11.23.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 02/17] mfd: bcm2835-pm: Drop unused header
Date: Mon, 23 Nov 2026 12:18:00 +0100
Message-ID:  <a9189a77d973c1de0919e677b3aa2356987cd189.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=861; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=NEe9YBbMZXMEbXYJMX3Yb/1ndoZ/Dmuud2fnIKbLu4s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDsN9DaGbH4sRvm1kmMVMoZQoYD+THO7sMJq c5fvKlpPEWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg7AAKCRCPgPtYfRL+ TohNCACV8HRlC7pWjZBnU0TL84vAdSWAfOva9050R6uNV8ih8XuaoI0NfZEX0PGyUeuRt8bs4dM v2XA5PW6cc1tr1+JGiM70igioPAzQU7KobIh0gdtSGT2PiITyNZY7ZlAwcDS69V/EIqrOPvUJ8G iXXu2csZXsOmU//uNaOz/GnDIqoJjl4hQkzXnvBiIwRbv453hOVxYR1Gv3GQCRSZ0160OxLIjPr JsbSXt4Vu2XINOJwlB4uDWvQRb7Hb1Q5aTPXdXUYm6IGCcKVhFBLGLPzGyBKCC7KbQofxcwzj0W 0zirKNJvCxvPazYCUkPlfQT0E7koHud2EKIx+tnvDU4Fke5i
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

<linux/mfd/bcm2835-pm.h> doesn't use any symbols provided by
<linux/regmap.h>, and neither does any of its users (i.e.
drivers/mfd/bcm2835-pm.c, drivers/pmdomain/bcm/bcm2835-power.c,
drivers/watchdog/bcm2835_wdt.c).

So the header is unused and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mfd/bcm2835-pm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index f70a810c55f7..12bb6bc2c07f 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -3,8 +3,6 @@
 #ifndef BCM2835_MFD_PM_H
 #define BCM2835_MFD_PM_H
 
-#include <linux/regmap.h>
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
-- 
2.47.3

