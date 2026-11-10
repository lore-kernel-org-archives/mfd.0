Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347767;
	b=AXudxtIytTiXr9QGbr9GTL8Ug4UIEmZhzJLW40CvdSOmykDMVRbZNRNCj5UbmPMocDJY
	 GFERuw+jLfXH6JYGP/T5YGQjOu/Ogk0HzVtHwvjd8MZMwonu4MuSn4Qy9bannMbcq35VG
	 R8hk0x5UUireS/Ri4wxyCf5WmJddl1DhlBMHtuX9uFBHGmz2QDmqb/IPEIGwfBOvUCkrB
	 2uCstBA4A5Tz8ZGxJIiN9OZ/LMYyT98ljBjHUaO8lqR/cn3yXUy8btzlVfz1z2wOJxKNK
	 I8VOQoKXjeKEBIE5qOnVnOBv6c7VmOmY3gA1r9WHTHcdJx7jwzXDe95vKlhT29p/J4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=27advilcz2wP6UN5M54Q2ZsQBSdNoHnIxCKVWfLF+lY=;
	b=BXRbX68Hi/zFQosLgzsszEW5CwCFn4Roa9kn4lJEdFAl+ggI8bN/qoZWEU343lBaZYZo
	 JdxXukeOUVe5tIIUI9cGwZacGQLgr5I1mRBS4V3f0JGhoJHqNUhXGVWVhYXOiO0QRY73v
	 hmtc/b3+ul7L3gBPeP4In+QVe5WUxmSH1VCOuIQSORVtid4FlX3jO5AL1boxiZl3pGY5U
	 QgLS1bhuDwfXF4Z43RjNEphCQ5EYb8+yiDr74mGW2YH7+p4euucgRbC7J/5nQxzwGHsfH
	 8DldPOYvbZMNLH/8i/FGbIPvAiH0eSjr7Uhieyroi9Jobc7HJOcs25Zqj/6r5YoFybA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ARjWvTNX;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0A960A3814
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0A960A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ARjWvTNX
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so31011655e9.2
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347765; x=1794952565; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27advilcz2wP6UN5M54Q2ZsQBSdNoHnIxCKVWfLF+lY=;
        b=ARjWvTNXC2XkuXlfsPvG/cnqGkiTbimkqDF2UFtR8Z7XiN5VnBqOOGfk1PbnKOrykj
         7+1NycpxRYX1PU9mhBEcUwXGRhKkG/S+cz1X8AjkmXKuM8wXtn0MjmJXeFkgda7bCLdk
         oRsqu00TTWlq8aofklgzlq/VyI1ITN1HsGshSOOQqOI3Mrnrzfw9TgFmRKMcADKmYb9i
         H6JdDI/4n5LrAFsiEMS7wFlw55CKsnZ3brl4BzdG4p4AYioaa7GlnG6tR260hUhBY0Il
         RUjZ2IYoGvEVpa7N0G7szT7r8jH2L6PS3+pmA+zG7p/jMWnaqi1T115PkE7LbvJIW1be
         fSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347765; x=1794952565;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27advilcz2wP6UN5M54Q2ZsQBSdNoHnIxCKVWfLF+lY=;
        b=lcC6SfbdxSOsdbDwnyDKfgjgTn++13ecVRUw/dTqstfBmfGRg9FxC7lu8IyBEWoxwg
         dzeBLkIanD1pjx7vZIy86kukRvFWLai61mkpPDWhg3uy3ylG26/ja/GwOotd2hoXdiES
         CI/FCKBe5DtOosGFs0k4UwtAQOCUf/fEqdd6hzMv9EFDIFZ0GpGJtxdjysn17vu4talI
         vOalSsLpWhb1ZEMxGizLzx/MvRatOF3lWRrKSGaUT8OhDKbnKIdjY2EjW4C/k24ds4pM
         5eELJiuJYbRGgOXIvC9cyN92XmFjVMusWTSENFKI8fnbUFGVKTFwFBhrxZZ0cjwhWbS3
         VwuA==
X-Forwarded-Encrypted: i=1; AL+hErEoMK+9KOhWCQw+s4AYO9bw/IufnXjeWEgwwQnk6wLnM5oQIEQuRrphz6KM5wtVjjC/PiU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+kcNOIFibAS0/ZoEmVu6dr/gaaV0k9ejYqFcmIlnnQ2j3cc4TO
	lalTVwpeSb/W0tAxmyUse4BkzRiZiSU8XcI7lc33/CmeX3hOwd4l2lzycTw2GqFJBaE=
X-Gm-Gg: AYBFou39+xFHfmfIbdekCDlui845W9pRHr6pf581eJ11+LasitwBzsaXEmK3e94hx89
	AJcDgNdJHdPGGF0dSei7Qb5PmHOPq0j4P/UJfbNc1s4rKF9c5/F8cWZ/b5tmlJz3/VQKeD+FqeU
	L8CkHqdH7mmKZ+2FwiHfKxiUPsD1H564gOnFxQRgr083Wt7JmGmYbAzMIHH7M5bGWXrkgrVaQ1f
	WB9S9UgFxUyOrtRyrWXPnDNkV5Fl+eWa/3pS1YNC5bRZ5O5hxAhZQB7FP1ETV5hB/a6NErf+K3n
	DrqpK3eXmckVmZXViiXeUB+D0JKQDP17/Igq58lxzl0asWIbTYEEhyjdBL03M1nSmaP9TRf0jlJ
	wofCZ7/t6NI5YWRL1XMs36R+T3aZf6oeK+M9wmZRWkcqy7T3TIgBi/w1HOQNUXL2o8N8lLL0d/Z
	ITbW4fJ9mtk1X/BaCVhmcN85wKviqPJ3yvmNoOq9dCnwjmld0IAyCm87L1UoDzqEylK9MXQ62PC
	ylDP8dr91lmaEzoZ/q44oY/QjEeB5Zp6EeYM+Z0crhavWTroEQ0MLX5HxBvMe5g8PE8p96VV0c/
	PQZJjenH0haGs/doYwc187Krz0mleIbAeb0=
X-Received: by 2002:a05:600c:3554:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4ba0936c8admr6184475e9.5.1794347765628;
        Tue, 10 Nov 2026 13:56:05 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0204e22csm84491605e9.12.2026.11.10.13.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:05 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Qunqin Zhao <zhaoqunqin@loongson.cn>,
	linux-crypto@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 07/20] mfd: loongson-se: Drop unused assignment of acpi_device_id driver data
Date: Tue, 10 Nov 2026 22:54:32 +0100
Message-ID:  <98b0f85e2b1c5330958be64c2bca859cb0e16628.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WctLszqVF045tp6nwF22xHoE9K0taY4KKqQ1CbqyIGQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KqD2/HtYab3u2BGN1KZ9z27I7+Z4HOPLlbB ODCx1BiL/eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSqgAKCRCPgPtYfRL+ TiY1CACST/5p5AX3YvgpdzTMs32H9OuTz+rye6bieanuEfNXqUb1EI11zexHwkp+qT8zOamGcvM UDrCpZmkkj9EodEchekm3zO5dkHT1gMDhyrcvERhGxUYi0FqNpFA1rXdxmFMemjJBeUhyeNm8IT bkMepOvkdEf2vGnBUXUtwDEDIUGR+f1G1yjugjUJ49rE+J+7bYx2JBHqoUrpfgkf5i3QYO1UxEQ JfKv8wUEmKRXHDt7f58nUBylOhN5iaKnqqQOh9NUOSM8cdDtyPEkd8IxXfTWADHNgRd62Sxg56j EC0zVyRXbt8dARWu/o7h0USm2c2tpI6gd2TT2aGuFdbmgAVm
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly set the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop this unused
assignment.

This patch doesn't modify the compiled array, only its representation in
source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/loongson-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
index 3902ba377d69..4c668e2d2241 100644
--- a/drivers/mfd/loongson-se.c
+++ b/drivers/mfd/loongson-se.c
@@ -233,7 +233,7 @@ static int loongson_se_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id loongson_se_acpi_match[] = {
-	{ "LOON0011", 0 },
+	{ "LOON0011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_se_acpi_match);
-- 
2.56.0.rc1

