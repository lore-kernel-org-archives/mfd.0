Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432747;
	b=UHNResKkrN1lMQWKflcSJiA+YXKwiPcoUpcbkKqDzwsq4LR3Y4qg2d2B5oGfoom+grZJ
	 8OsetWBqShNm64QU0/4xkw+EpNQ4zBMcdqGhbNs03bDR8sa5lqMfXBq/Z5PXhu0YPvC9p
	 dlOM0Mvo1nSxtHaYp/qzrzV0LukoeaDkuQTWv8nHtJfy0WiGK06RkhH8StsRU3+YM44pW
	 wX0RE3T7CFZyTqiSbZIc/CMrfnRz++6ksCdw1a6gc0jEnMhd5AtKTbt6h8mDtA4TGR59f
	 LZPWRS8hBs9tLsI10AuToPUttVmiJWT/edQ/jR/tdw2kS62xMS8VxpONGq2GhCkHjLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=299WwfKpIB8L515wrEP5ccR9wyNJ/yU3oXrTEFsLWVk=;
	b=BVXwn/+dyRybMIx9LdXZ/ItgzdjGJNO8zQpklSvQCMOngb31g4kq7UhcW02r+rWBLlf7
	 czIn2URG6cGRDIzdQj2P8+Ap9l/bDXRtQ2OeWuO23c1c8+lXhXLnwO2bTQpH9KSassrX0
	 qN3cfaPCFkcGy6axb4Kf6eV5CJixWbSb/t4px/UNmL4+VvcseAyYGY92GPrvvEIx9kzpb
	 ZMCtMXSY3FfHD0+Xa4053fOy/7tWNOOhTt6yanzL+HeE1SrlTpT9mNsUEmwqMcOXZTvGC
	 QlbrHlW6xvZDDaq2Fseq77wflckJzNfi2FrpLQeb19LlJKWM+h0TetSYdjyAtEDQpPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eEfULmHC;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515E460A260D
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515E460A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=eEfULmHC
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so27254985e9.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432746; x=1796037546; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=299WwfKpIB8L515wrEP5ccR9wyNJ/yU3oXrTEFsLWVk=;
        b=eEfULmHC5KOwOl69ze/z8JZklxHLBervrfMU/DOoLJM1mB4kdyZllQh0s5O2uZ8wgx
         wd4hfqjUeqdUmozrdLi2ctTH1ervtixko5eO3MS6eup9KxpwPAKII9UhuKslzwkTWcdW
         u5357wZQBT3ltt5hajoRhJyEsPTRDj85MoHJ+B4gEsDhfgjLZiQ/QzMzn6NYsHNWp4nA
         t8ypOjJHN9JppFs/rdw0MnEbvx6ohE+kS3y19+hRQob7Ft2ZbIT8gYSY2wL4DbaMK9+M
         g+A9xh+DC7ekiWPwBN6NK1axegzl0bmGFoGhP9Qn8cz4aDhWvhqAs0W1s6d89W2tsxUT
         xkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432746; x=1796037546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=299WwfKpIB8L515wrEP5ccR9wyNJ/yU3oXrTEFsLWVk=;
        b=BC87VgOm8N+ZiQwiilVLU8mSI2bQATuDn3pTPtvBEf6bHZwywafJgwfI9PNYOSgzQR
         jQOi9QCmlWd5UEAsaDPqopqLfYKxC6i4W0DId3BKYeGC3FpfmppA125/0tYO4hb4EBxZ
         8YGJoqX7Qm+zMxi3FubA+PX1LtEXdK7W/63Xvr0AL4fs5vRqQstl3DFSZ3n1Wg+CgUiw
         hu0kNzUdk0NTdjk68UJHD9mgrr40I1Rhh9kRCPvj376NFgY09lGbRnH8jxbKHjuIsiNV
         4Ie5qzQzkoil2VqUuNYYMBoknSa/WfsjYNM9uFzNjbTG62L2PWfwHU8/UevPO1P66s9T
         TPTQ==
X-Forwarded-Encrypted: i=1; AL+hErGG49h8OCc0kjjTwwGkBri8oIJWrzkmLEA9PdY35RaUa6Og1tKBAG5ioAdAvRrass7ih3k=@lists.linux.dev
X-Gm-Message-State: APuU4Z/fosPh8ttbL4ePvQ3Eo7IZ/ado4qFBIbEUeBHYiZXwpaapstKb
	eGEXdqyqwICan9xcWGIsR3IqgY+s0WK1Z851jjyff18Yily48sLCld9K3psz10V6ptg=
X-Gm-Gg: AZFdTZc7DbBLFneT11owB1jantpeKSp8jF55SUdNeESqM03+UJeZkV9NTT58KEweDei
	sl5zTmQg3Atx/U98BADmt/h3xgFGpUncWJAS+8r1agE1IS7xuMRDPPq69sbSrXLpoUQ4vzpn7LG
	85tPlY9+sSQUln3S2D2kDwTmzdDWPFrrZSQ/gw1SqjnMEZGDtd5UN+Dgbzf3KEru71Q22tYyQMj
	tEZWnErYexewZpG4qKTav9x1xo9vr5tlco/yMfFIyxyOL+VvjdAlZyVS1CA+iIMWb8Q8tY3EqnP
	w3RwqbSfKj8lFH/2htfvFB8vK0LQVlecnBZYmW9mUymMh9T/1lavcB4DgUxMOEmQSueRh4SS3Z0
	MOYoI62p9EZQxNq7kTPbLC7VcqRz46NPIwgQ7wTUvmKk6nNeY7n7PKjRFnxcAq204ofK83ya3Le
	dUVG3phYgpNywn4O4GGN0RntzSLCT5yoPcy4Xax6GqOl9TlJe8QuuFYSbaHSuC0JlPvT4Y7BmKk
	53fQ38Pu8jpzXo98lYl7erFn8uOAv1RJRS9KTlbAslvmvLPN+9Q3l5uuxXrHFESHPBNOx7SZMID
	E+pvniMHMKE8DYURH4jee25Plohk+StyebTNM5RUJRo2TrGyiAUkBHxtjyUPkQGrs5kRD8jMsS9
	aglngKph5EenRcx4w/LHfi+hJGoHPbw9YfQ6atg==
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr249116025e9.5.1795432745778;
        Mon, 23 Nov 2026 03:19:05 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8533579csm307418455e9.2.2026.11.23.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:05 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 05/17] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Mon, 23 Nov 2026 12:18:03 +0100
Message-ID:  <244a3c6366c388ef24b2388b730a3eb15c263ec4.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5sHptaYzwLrjcdh1NqJqGmbEvltctvs6O0xb2yZ2KRU=; b=owGbwMvMwMXY3/A7olbonx/jabUkhmwWhc+tGraG+jKhKnseiB1WaG/I2LdD32jvXxGLEleuL W63F/Z1MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRqUHs/10b+AUibCKWdQVX rf97KKfx9bwdF5we2E7M2fN7z/2UaxHV/KFrVjfGuc+dlatVWeVgtG/GiyUCvu5cZkcZ/CSmMH7 9yCaSLHN6ldnqIuco9v1lbhEGL0wL12zxVLPmnL6zY3ZZ+RKeDEa/FX9nay4QXCYndLfH7tpb/Y 358jEKX8IEVHMflK/8Wc76v9KuJIxvyYFof0t5/vWdW3K/LK+5OHfzbLHf4jw/74VY81c+0Vq+k zlw5+218aIrykw+Hyk7uiN63oF5etHBLBIMcV2FYsx71i2Km+su28DyJfht33z3yp+Hk6Z/2WUZ +uEKw0zPdxfVRJYKaS9jKS7+9UfJJ+1vcKbKeV7RIPGVAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 8c46e74be6fb..40a035a89c8a 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int mt6360_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.47.3

