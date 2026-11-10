Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347751;
	b=PWkPIqe8RISL9Urz0C8Rh1LAxkUObGif72ddtX6h1e+57v0rV8W1NQF825eS9foHgxnQ
	 ik1e2Sj0Q+gogd4FEzryDdlFT+V5994T5xQY/pQ3aYStXcjv78JAN0USjJWutwrfX0AnA
	 anUkRYXX2oohbFmXzJUkjecLl6IDw2esjtuxwC8j+Cp6POI8rNraNPV8V3D7ms/dJ96Wy
	 whMsSYdTNJDuxbQHQbsPILtldzgKVLpp0Al1zPzorGOBcfKEq3mRi6VBCVFqWj0OLVIOY
	 xbG27SaQvuXKejLYnPnSplWDR6FjQB6L60HyXQAbZwrn1FyL7R8Kows5USqph4iPYnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Deb+vUk9umqS3aVt48smxAj2eQ6juTzTMYV5l066V5E=;
	b=zddtORkTVqXZq4fMnirus2xNNbN82ZUqNhZ1q6pEdTIqzAuWEYJ2NomvV8rpSXu2SAw1
	 9XSY6Bp/PW61K9oFdit4QgxhOjApQNy3kSWVUQaiNtofnM9YVk2m7luDL0wnN1D6wq5gf
	 mCYDf0PjNZPiFKIQOICJAXC1XDEWcJytyLSh+ruw2dOa1yffsfKnU4nerCSlNNTPRR0CI
	 QoY/RLJiA+x63l6AA62+qLKnb68Epevu13uK/EHNZRAXhNYQZJ0I+X6lq1SjcWbgbLNBZ
	 l9QaOox9Ru29rsUHq6YuNx+PB2fPnOW9BsetSeY1nZ3x2pqewf2n9n6LYiZCkyXEXmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NvylRZyC;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA0960A261C
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA0960A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NvylRZyC
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so22559195e9.0
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347750; x=1794952550; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Deb+vUk9umqS3aVt48smxAj2eQ6juTzTMYV5l066V5E=;
        b=NvylRZyC/l0l1Mzy66QO7eQFeXoKa6A6P4ylyuX8SvABnTHc+Xxsl83JM7hcHB4xtp
         vMFbA5AnfmPUmno/MuWQ26SwXLu0ka4yxY/OLLx4bwcc3PIO5Fyo1B2KMwO1hlajgMTT
         5kkwYSvZmL08ykHs55B94UG3ogGi+6KZiUucwePDCF5JvWQpsS4DlhPm2YZaE0rSvsEf
         R89iqzqULfMQG91CsSY8wmxcQqdytaNowj/o1mnuD4TItCAAIzVw9vKVKuYRpUFf+2BH
         KcAZvnVkNAZXflRaSLX6rtEXi/GX2hDkTufjgAhoKnaC1l86JMx7KN/zgDrW3A6jZUs5
         x/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347750; x=1794952550;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Deb+vUk9umqS3aVt48smxAj2eQ6juTzTMYV5l066V5E=;
        b=0/GNNRNyMG5cnP+ZfZzaVfDXbeFaDYJ8ork3juLNvDo37jTI1gss6qlmu4WKcHZ5Gi
         0VHclQ8dVyKBCu/qPnx4q5E2tVDfTpDOOjkNsVlLiw/pRrKa55GiCtpiAaW0sy97fkqx
         I2OhOlbUWQCI6icb9dkgWbzv4jc2ZZqLsKNO0U0atc82pBgE4QcDNgtBGUP2W78DI/VP
         V8+envTzrGq6ADY24KRH+len5vvqZ+hz3kgBtb6X6VXUrqVShVEiSRc3GYXRe+iicUhS
         QzapWJpzad7IS0ErjQEkJdhT3pMKH33eh29J2/x6uRMCeQ/Ct9W/IIGgw6thL3Hr6yfM
         IGNw==
X-Forwarded-Encrypted: i=1; AL+hErFb12+b29IJY5Vx2G6MRmruREUmumaC5AEv75YgFuVTiVIsQql+5iL0f/YfC148V1TwQ2Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Jz7rgbwzcJha0C6qePtbs4ckXe5sntcmYLaZ88M0+D7MOwBeB
	R+qC43o9ryhBWzGliqYb0Tg3xqgian+fN+m16yJJsTeyF1c50RyimjD0s/wl78QK2XY=
X-Gm-Gg: AYBFou2Nm8Zl5QoopLwqjeIPqOShz1YBZIcNeciKJWIV+vvCZX4iL/Pv4wjUkosITvA
	OOm7QMSWwcKDdAxmZT4QH/8NO9BSDZaJ2AK9VWjx5HTiRcBUsHNQZLJwQOVfRAqDsavjtWeThWO
	dq9dnXxjnWFLOucLlC0PAhuSKKaDqac9tEf9m4xk8zWEuelUgxr3dFTOYk/N22jUX4ztUu8VmtJ
	MlphS8cHjD0olvsR4D8Q2a+v/1PmM4Au+2Ui+Qh0QEi90t7HNq6HF+NIG7tEMhn6Vqc8duBT6sN
	x7qW61CQz/3W89FQp1Sgp0NJYo76Isp8nYOVJSinkbJXDJuUe+dRJ8NabD9v3zl9pZmr0O6tvi8
	Jx+uQv/Xo5X3IJjN0P/RHbBd2KPzU1lmcBzZDl2MfajU2QfBpMLGqLiJhoulFVB4uK+if1IUXR5
	tkvkERZMS/ZxeSxMznVKaNPmgwIEKA6kunPC3hiFXN0BIewnQ6zkDh462ZO3rgxpZsX2vPOCqc3
	lcsDnY3g5/zB4oiG/sa9vA/K4WDKpqpey7T86cMEEh67hhaLv89e0m8b42GI/WBdP36nyR3nBx6
	8fumXUu1e6/w3NCToOpINGT3NVZY/M8w9w==
X-Received: by 2002:a05:600c:3ca2:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ba0935dbf1mr6324345e9.9.1794347749735;
        Tue, 10 Nov 2026 13:55:49 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01d9df5csm109091985e9.0.2026.11.10.13.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:48 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 02/20] mfd: bcm2835-pm: Drop unused header
Date: Tue, 10 Nov 2026 22:54:27 +0100
Message-ID:  <c3dbfde231fd08ec74b875026bd820987934f620.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=UdHoeNWC/wFvkdmLuQarAQl9dCSespRdlpxDjltm++I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KXl1OBAGE23elaJ3Rm+dDA0IlB3w1RSbdY+ 43FtWNovUqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSlwAKCRCPgPtYfRL+ Tk3gB/4rjRvfTFLDwOwuaM8jz3V2FahhT+hj3EGqSUhPRPVY8DhvhnoGuBfwkEu5Dp2fvKFBjUA PGsBBpPjWf+Y93zL2Gs7GA8yxo9a+Ljp8tjD2QeNaiTht7AgUSwWa5AXDavdKJhDxWEiQ9DZOUv WkaXrjSkHBs97VS35AH0wYV19gbLycmKAYp/Uo7ffHSnqJxn+E+Ef6yz5tzvjIxzsAPyaPWKqC4 2GdVeNIbY72nbJqmrPQfxz6hhF9R1es5kz+IXcGyePWxGD8NSVM8nPFcZuiG1Sr0vMvPzN7SDrb 3sTc4pcDkCPLLetAg1TmAlTJ63wSusk5hpGgKhwQsbiA2ivG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

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
2.56.0.rc1

