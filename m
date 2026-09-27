Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E453B42F0
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524692; cv=none; b=TbtfQGX1bZnid06vu60aB4U0i6K7OWZtTbB35czQ4mvsZPUK2MR0tt+14IrwdS1/NUq/o+tsHe38+2YOzqy/mv7xIC6wUKeDEwgkWISvdd821Ici5mbFMyg7QToJw/7/ssqGH8xp2a4eRY78NK5+XembKuGtlbsQ+yDhFXawxvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524692; c=relaxed/simple;
	bh=tiF4dNCYfSiePx22DoLQmh8H7VMxIsra+1NAFUac6/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERmBqLBd7p0dA+dR7WJ97DqIVIPph+pXrgyhFAQhDWAibNjxYpm1Dk/apciT/thkbUlRby1JlL52rn4/yJSdTL2qZ5V8AydwhqIb7r1MLZGzYWLNZ73ezHqq0ueaKQ3UC8wLpWeBMG2tObJJ6OR3m5MPx+PfmllusQFjcSf9NfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXfcWs3p; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXfcWs3p"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b926f0so1156639f8f.3
        for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524687; x=1791129487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hVPxB3LDp7THumASK8lONkRvyk4UvlnbOgMgC/3vpg=;
        b=nXfcWs3pt4V8nJpdPaNLVGyyklh1Mov9Sq//gOFVoYVAcupc75XCPYipVY/sTQPZuv
         p5RUunjWxA2mZ/l5XwXcy00PPLuMbZfouH2NDy5Ww5m8N6W6nAq03sMOPyyZUNZDxlxm
         L+aIdrv5FNn/R4LRymtp73isI4KPMS+75GfsS/gmp6+s6yZvxpQHOJorzxtQShruoIL4
         bU00K+i7691FjKnuxhuOpE4FqDtIKJ+3E12v157MCBFwZ2Ctnb1AdFkkuI68mqwdKRCJ
         /88wlw713wQzYsQIbCveKErlMe/NVvy9dnGK/M9lBF29vESN17qwBNSRVswutBUx2e84
         KCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524687; x=1791129487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hVPxB3LDp7THumASK8lONkRvyk4UvlnbOgMgC/3vpg=;
        b=u49R15fZGpiBrc+j4/39vfuegoSCvlw7UXCMUrU2asBcdq8SKl6dNi9uBYPkiYe64R
         YG4nj8Ma8iTa0li32nAewPRHzLcllD3YYeH0BW4oYzMjXybW9/Xbg2uXS/IffE9Kyg4C
         7cK8I/BoOqnheinhi2wMUYqW1Ujf1N4H/wChdHVFtzdW5bTn55Bz9zOWMI0WUOKLmMbQ
         pt71m2rSoDgGw+UJkPa8tO9rAyT5oVp+KiTHvlQAYVDfLKDP80vwznHrQXoXkXqIabiy
         m+vO7lZvuyPNAkWQ+lUQqoJ604eJKpsOdSWbYRY1PhsorjNY2+iJA1U6JFMqQc8dVzlY
         Vnxg==
X-Forwarded-Encrypted: i=1; AKwUvBzYiiwWBgMe3wAEF2HAZ73xQkBVu0mn7PmDrh/MHyao+nBUX6V5kL58OKCsYUuIa692RYc=@lists.linux.dev
X-Gm-Message-State: AFuF++mOv6k3+xyz49aeC37gZD8WrKSrFG++Xmohu/LhPD12e2HSbhua
	oW2gLKp4hk8/agym0c4oWfLhtGGfUxIUzGSIsczXGKnSY5E1rqy0Zrk9
X-Gm-Gg: AYBFou2lL/8KdS9P0qXFyW1wMOqi6H4ZTUgPBEI/vixNpWoNG1R4jJvxHdtjaDfCSdx
	MDQklBSTXkYnBM9kUqJp1bGH+NLOU4xn68AHglUNg7WtqK7QXEQ2OKQmrC/5fO7AoMlxOAQ62p7
	0U+pk/q/gL/LWk8BlVV5LbUZfXy4izakv5bHYSPtdm+e92kbUrf1JBTletu+TxDr1L4sEpxotew
	8r1LiqkkoR40yX/jCBMCyM/5cTASCQd1AfAimGWGldoC/Fqo/n793SY/fxZc9YJrpz3g6PL/SWu
	tZiN/1EViIWiCiAy5Go7g3CKS9U1lDsDgS0RwKaVoltf3z15Qd00y08w+L3GF8veyhz3FomKLRr
	GpYrBv2XBkwHxUi5JMDwlRtt+0uiFh7I6r3Z6+hj2lsHUFH8UxjmR1q3dMG5ayydXfeuBeoPqd7
	hrm5Y8nhTlDN2gGwMiGMSh2WPkQ+Ci6TBPZ0LNym1DZQUp1ZIDJFVD8YZaddAV8jGKYhcI4/9iR
	VizKKMePyqpRHfURbnDTOmODRTgdA==
X-Received: by 2002:a05:600c:a06:b0:49f:fd4c:cccd with SMTP id 5b1f17b1804b1-49ffd4ccdd5mr65841555e9.28.1790524687190;
        Sun, 27 Sep 2026 08:58:07 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dd5easm66708625e9.3.2026.09.27.08.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:58:06 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/3] mfd: max8907: Schema, pdata and poweroff
Date: Sun, 27 Sep 2026 18:57:41 +0300
Message-ID: <20260927155745.187758-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  33 +-
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 304 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

