Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742EE43DA38
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509409; cv=none; b=OGunzHnAwpUG3Pgbjj1N9+09lX2stJ2bLIaSQz94GTUUGBR2S1NlpaQ3teyB4kXK3qSYl2At7omO2FHoakxQO7fikzehSNVq52cxSAQZRYY8Z0TZ0NHWDush6c6Fq5a+jDIxgoZt3mnwLHlONnMOB5FzbIeqcs969nM5kVSTrb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509409; c=relaxed/simple;
	bh=Yu1IpyuYYUzbf+7marfaBTnzx8BbEm2oTotGiN4NhcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=thgn63HBTjX9kjppGGgRIMKc38LRnSFe5KWZ8vuLGlLFOkn4qBMbZs0vXpTPM1bds+2Bbnp6/BYUuAT4iwzkIZ/waPS5fIm0280fEKrtMYaPkqinrWdKMXQG5lPHFl4IiYSFyTbowmRXOYeyd/KGpKaGW6TJEDcmUJL/nj79qyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UafxNtZt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UafxNtZt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b27c7451so19088115e9.0
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509402; x=1784114202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MG3FU7CU4B5nmUNJ9cOdrHELZIlUEf3pKuMQh8F7+AE=;
        b=UafxNtZt94EDXlnIDx9GILtSkjNNzp+zwHCtxnYGWMZVNKXN5cR/b1Yp0bcPSb/BkG
         KoMMGqRyqQzATAnQsgyrZ4+9DaokCTkpLk9IiJlD8TwReT06AOPVal3cBDMHQWWevKhD
         O//5TNXH6ta5q4apDkze4tf0yfnwa6OrYPzLXNslasMdMz8GWTDbi9YnEVHTRahUfryG
         9Q1N2MnGSpsHoDK7Pk9S6RKLT5eEMgpy06n2PSjoXeNGL2lFtPn8Yao3CvkO1dRuAmpo
         4mSQJL6s9jd6bPsR62rb54llAlGjUAIaJBCJk8y3BjHB1NDZlOf0iT74XrBzXEjkKdg6
         Tafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509402; x=1784114202;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MG3FU7CU4B5nmUNJ9cOdrHELZIlUEf3pKuMQh8F7+AE=;
        b=GDURbYNf005g7TrRIEDxDvOleQrjL2gvYhtTj0OIzC5ur1ko8ArvNwJXzJp/YL2xk2
         /hBYntmUhPVefsEjSBeaR6GTzc+GX4aWclAtbJQUWw6kChLo61tCqucGRQgJbNVWG0ws
         JTgYEdQHkRtXe+8H68Q27llLol27c44oCrcNNH2E8tgYMYeBBnMQiw/G1BH0fsI4Enb3
         NaMe1Vrp+3eZbx/BqCToXtj31s/L2YGFySmq8Gkb++85mV0ifdtD79rgFoPdZCemeh4t
         egIW2UB/PVwBByhHUfYE0IYKIrS1CXsVoDaRYKfMC5Cibl0Vl5hkK71bu55T7npJ1x44
         8y7Q==
X-Gm-Message-State: AOJu0YyecvTNBT7j79BEuPTjLIEHoy7qaYX0nVC4qJtc1aO9bgV034Tj
	V8CMZ8ke0wAKQLQouWm+QgJcXVNq+bc9D39sy0sKe2IEXWdFyyuRg/bXRf4uFyL9vwpEkFH5RLW
	pIp1z
X-Gm-Gg: AfdE7cmYiLxUVoKIk0eIrSExvcsMvQG6QGlNLTFv74CUd0z2L7vmxkUvmZKoC3ldUVf
	o5pcyppVNZ0n3Ry3obFb6RD2L7Md84wwtTj5E/jtbLk8/018BN0bAsZh4uN+DigaQPF0E3MV2fP
	oXb3QbpIgqA3iBYRX2Q8O3pwWeM+NMIyWCerUXJrsm1rc9DGyYysruaZUFD7fJPPSb6kxqnTJUV
	YJaj7i3QM7pqsio4OC1pyjO2dK2qhsJMyaeSbCTE9z4BR5anZI3gD/yYANgLHZlfLwt9O5KwTHZ
	jiPR041NODdA3O3xcma24tPzjuoPOzeADj9rA6eO9IUEPuWXOprTQjp/HKQfwxlvVZUH4K6pJYK
	SuRLzIUzukkk8/Dw7c9wOLt/K+M9Vr4LJe8g4kqQgW9QtJS3uliV5csZefN4s2bsu2++bI3u3+1
	ek/hX0EfzUsm+ZdcW3tPYkzYdpaMeZjlXiHCUeal3g6DbSMP4nIZd9XwMChwrCf+PJJ/oR3QIds
	dJy4P4aUe0J/BM=
X-Received: by 2002:a05:600c:3f0f:b0:493:b698:9247 with SMTP id 5b1f17b1804b1-493e639ac57mr22213845e9.14.1783509402127;
        Wed, 08 Jul 2026 04:16:42 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f3677asm117598505e9.4.2026.07.08.04.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/23] mfd: lp87565: Explicitly set driver data for the generic dt compatible
Date: Wed,  8 Jul 2026 13:15:11 +0200
Message-ID:  <1e596fe18a6bd2ea363be3615eb512dff9bd18a2.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Yu1IpyuYYUzbf+7marfaBTnzx8BbEm2oTotGiN4NhcE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFHXlx4zbiyHUGpu54qoXkdQvA4zDSLokcFY YZ8zdDsYEiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xRwAKCRCPgPtYfRL+ Tia7B/4xXw75inKIMzDsPHwdqaJzz+1U/mpy8zjSpa6b7AJX8VvWZSLnP5VwNdpKapxrbFydSav E53QSn1pY0SyGOJFdYgWgYV+ZVyWB1a7FHeOGkqdOx2nsa+hsXS3ppy49Qt3hUYSckUx2AWxunc YMbuuqAqeyzTEN9ES1E/ZfOr2aBtDpvmAWQ7h6x7yuYJe5doGVX/ZQF3VVSCMezOUoA09bna9io FiWwtJ8lZbc3AnlrvA4NVZpMQhtgrSAHJvkjb9HSvdQk4wOj6SSBLmujuvova+mqU1W+wL6GfCa zASHiQXM4n3pUUtefd/fF9Mv60SnxVh5OD6w0FiW52NZQAHk
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver relies on .data being (void *)LP87565_DEVICE_TYPE_UNKNOWN
(i.e. NULL) for the generic device tree compatible. Make this explicit.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

while I'm sure that the driver is improved by this patch, I'm unsure
about the handling of the generic dt compatible. E.g.
drivers/regulator/lp87565-regulator.c has:

        switch (lp87565->dev_type) {
        case LP87565_DEVICE_TYPE_LP87565_Q1:
                min_idx = LP87565_BUCK_10;
                max_idx = LP87565_BUCK_23;
                break;
        case LP87565_DEVICE_TYPE_LP87561_Q1:
                min_idx = LP87565_BUCK_3210;
                max_idx = LP87565_BUCK_3210;
                break;
        default:
                min_idx = LP87565_BUCK_0;
                max_idx = LP87565_BUCK_3;
                break;
        }

so if "ti,lp87565" is used for a one of the explicitly handled types
above, wrong/surprising things happen. I don't know enough about this
driver and hardware to suggest a better handling (apart from maybe just
dropping the generic compatible handling).

Best regards
Uwe
---
 drivers/mfd/lp87565.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index b78ae79df5fa..efea1ba82811 100644
--- a/drivers/mfd/lp87565.c
+++ b/drivers/mfd/lp87565.c
@@ -26,7 +26,10 @@ static const struct mfd_cell lp87565_cells[] = {
 };
 
 static const struct of_device_id of_lp87565_match_table[] = {
-	{ .compatible = "ti,lp87565", },
+	{
+		.compatible = "ti,lp87565",
+		.data = (void *)LP87565_DEVICE_TYPE_UNKNOWN,
+	},
 	{
 		.compatible = "ti,lp87524-q1",
 		.data = (void *)LP87565_DEVICE_TYPE_LP87524_Q1,
-- 
2.55.0.11.g153666a7d9bb

