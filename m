Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDA448EC64
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059827; cv=none; b=HXcTcfA1+CZN3bWLLE9b0wYIz7qSBmybm7tnaE44Px3ngMv/g4ELLFnxQ3ky8fM+pD6YmxaHBl1b7hwuW7B8B1/Cz8XcvCLQ0lshGND4WFlT7IyOpIeyCfl0gf45j8OnT7bs9LHu74qIkNpCXW6q2+9uoWQkd0Cc7WOT5EVCIVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059827; c=relaxed/simple;
	bh=Bh3H+LUzhkBIffj284EKBCnhxWAGkIa9mZwra3fm6Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l690MnEx7l/q8SfjqU+oGxkXYCmXWEmqBBJ0Pz6wiVcKA1TKV8z7PaikOiA7j09LsVRPxHxbU/BvLHW0veWB8BY58TNcf87Fuiyxcxg6JtBPOj8v1DNLcxg1l13X3AqUnnhNFqWMZLOOn+2ZBxNw333wbIR5pi7tIxoHVoYyvNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=em92WwO1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="em92WwO1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso4502978f8f.0
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 03:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059824; x=1792664624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZ03ahkbPaO+GKHMEmL3lRce7EgYgsIUaIYhnRWAhmk=;
        b=em92WwO1/Epurng9UtxvcBtNt41MQeion8yOhthktMugqQIH0K5KOoZbGZ6jsh+YL5
         lc1okc7hlPehFM1ikTOSYx/qwjiM0Qd5Siqjgay4OjnvpGPcH3L575/Rh9yV7J6bEwLr
         7aV2EPHgKHhx1uyf0If/7RSO38ZOGaQgUaItpE9+ejMzxpgshOTKf5ClN44R5W+66RuP
         lv3XjZG9OoDkbTBIN7ePZ1IsomKnJWm6qLW4T2xX90/1subMAjkIl7/TXqIX+lZ3+ER2
         4yoENDaTiy5I3VZh3KTb2z9AHN712ZuXUBtR05Qo8bXlXjrY6fo1OBk/rX3QKNM4wJdV
         2xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059824; x=1792664624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZ03ahkbPaO+GKHMEmL3lRce7EgYgsIUaIYhnRWAhmk=;
        b=eHNGoT+Q9oNUUA5K99NdmDG5qnT5g8tuc+hKzTTeIRwDAqa6H8KdS2Fpqh/XBysNzJ
         HRa6Z0lvLWaYitA6ve3DzfY2tyWzQD/u9DsBq6MZA5NSOSXtfZEinM8JW+lPsn/snGm4
         OX1tbw/1YKb0+WWEGkuP0UC/vikzZhJaXwS0ms4RwYmnTQFaRrgBkqHEHwC20BXcd6gV
         rqO1ukSwidjfgWdr6xQVjxZDL67SCGjzMxoPPjB9KmJ6v6U2WVtm1lP0dEX/Hc+9WLs3
         hpTvZ1XEXdlTlgvtwG19CNwqi/imeC9eomU+Cux4c61pzUZanzYIBPxnaFL7bB8G0sgR
         pO4w==
X-Forwarded-Encrypted: i=1; AKwUvBxhLLpBHSmgjfUbU7aR1mfBLOsRCpOXzKvpVvc5ZrV57q26yM16J390Wo/hZI70gC+055c=@lists.linux.dev
X-Gm-Message-State: AFq9FYJGeBOpSdy5a3sb9mvjirLTtbdsuvMS+mj75K/eEge0LrH2yikS
	mlnyDK0i4LlegsTN/8UdzKFyXxWXdBod1vk82PIuEmbYyE8LubSzGXvz
X-Gm-Gg: AYBFou06Syqt+hS67b95KgO9UhSy3QS/mXJLf3hDHQ93JsV8DkByxn1bEMq/npqnEEQ
	0OrC6nEWO0LV1BSfZLa8ff9qixzF8vMoM5vRK3cuN0WjbjyqeusTSo8+N0Pbb3BQfovTReYjRGz
	b/j/aFc9YpgZ8VqkY5hZgiURjvP4DGvfoKLIEh+rwAKqNOCqQRW5yJ+KQEq/29P5opt2pyDBh8e
	uY8/IsODq4ICnDhqCbvtdtEv2wZ949Z4iE3KrPktESmzYyar9K+CK+7s/RgN6LnC5iPM/wpUohj
	mtxwUjzzEvl+ILov4bndrbXS9MXUFpfLCD/9/DhMFIb4q9k3HsuPrpB6VS9mVd1TIjsGQZsJ4Vw
	FVsLFa1JeAsgJmhDDKarpba3HYKoFhEasbIbNSS/h2gbrB7oDy4rr/Y5lEkOpsWsW7Jc2aufsYS
	8LXbllNaDO+RES+mt9+PamEgBp/78Bbumv9FDuvn9EoRi7O+y5Vo3Qe1sKvOil4Uv+v3dbdkpeD
	thX3XoWica264wihvA=
X-Received: by 2002:a05:6000:2dc5:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48dbaaecd68mr35443212f8f.13.1792059823690;
        Thu, 15 Oct 2026 03:23:43 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm14952542f8f.32.2026.10.15.03.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:23:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] mfd: tps65910: Use modern API for poweroff and restart
Date: Thu, 15 Oct 2026 13:23:18 +0300
Message-ID: <20261015102320.23760-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to modern way of registering poweroff call and add restart call.

Dmitry Osipenko (2):
  mfd: tps65910: Use devm_register_power_off_handler()
  mfd: tps65910: Add restart handler

 drivers/mfd/tps65910.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

-- 
2.53.0

