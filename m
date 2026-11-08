Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131806;
	b=NxvZSgImVmhkRBTd5AvL+F+xjhby+P9MOgxPfbQLqCcVa04GzFEqTpqm+hRxrKDQ4/hW
	 xsY++QQluB8gfGGwNU0ur2JrQl+CMXg/L9wVjX3vsbFNqJhx2Qdze2/DOXI5o1A11YUkz
	 3qfpJz3mI/LSv3Ljx00AIsCkGpsm5H6xJN21JML5qq6t1mtcjIf07eF9hyE7oTcB/0dfG
	 lMzP3s4qgZYTSSbXZSUiV8I7JshQVvEFkp5qOOs+VSMWq0leuQL8p51FLw1wgtnhBPOfj
	 uGEIYO6ukxBtr5UAgmF/WN9iJG8VHYr2WSKQf/azJJ/xD3UijZ2SnVvkIjUJ+ZgXUgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uKFGtUNuaI75fKMjBlQigCXuvmnu+j2Ar9uMYNWhR2Q=;
	b=Fw3aqYsXBRf9pi5VkUaUuZKiZsohu1qA/k5mz0yDB21S6WlEw33kHTZS8vCZT4OhIFXF
	 erxGNVrAaDEXvX3mnABk+ek8Ris4JULKjSdodIwkh+1Z8/IZ79EhHGf+zU3hVdp9K+ZXF
	 XSe1f3W6xz1LdRY0pj5TBNIbcgwOMTUG+fWOtwr9UaF7HfR20fxDCU2PHl+Bcjeb3bYIS
	 rqfGyukL/KEXuHr9vAr6d9KaOibX3laNhnmUkbspFucaEiM901iko5qRJuALT7f4nm4Wv
	 PsRLRa/kIDxOA7S8gdkpDcDl2H+hi5Wdpi0hrOJWHRZVNPwgKjUtlyh1cEGn7HOC4LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5ORjzY2;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59625606A322
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 09:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59625606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5ORjzY2
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3fd91337baso2377066b.3
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131805; x=1794736605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKFGtUNuaI75fKMjBlQigCXuvmnu+j2Ar9uMYNWhR2Q=;
        b=n5ORjzY2D7AJWDaSR9Iv4RYiz1q8dUJJvKerhY227wMCt8X2linchsOb1Smeb4xthK
         17QCdcqBE2sHnfKM9pgq6XXIP3nUYhuBpXV8sx/J3z6v53QMtzbhJ6qYNRKMDJWWdvP2
         i7jvpOGcf0rjMe3QcdRPWNVrI+MqKexO4SutQQE/u9I8A22QChcuhoLICh86hRpDQ1yb
         3i7fyoYGuF4WtSPfEsWInbMeDnmc5piSH4Xj/xj0gQXW3MGM6fhZjN4TFUXzSBsBnJ/P
         x6LK4AdNt3MYMHnqRkWj/uvIjRvM4RrAh/zQByeTuL/M3b0HgumOVWjJ3isnIR3VFERs
         AXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131805; x=1794736605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKFGtUNuaI75fKMjBlQigCXuvmnu+j2Ar9uMYNWhR2Q=;
        b=dx0eMcJiCAZ/i6t1kbexJ/Zh4xem3Q0YpNTdBCZUXFl5HQ7WbuPjflMfxfw6Cu4Kjh
         86fV3TixfIW9oAm2fmKHuHssqqtpEpPi5R1Sh/ViiNM1zpGMmbf0+6OZQla7PE6b5EB1
         X5EK3O+ynCy/YwMtaIOm2IfFRo6L+wq/Kaz35wScR6CK5se1XnozQE7/ZNjvKeKwgpR4
         gdT6VCXW9YsBnbJbiinprLxKndntKY9TXxFzRM0SpdWqWbfYl1qRPZ/UySFhuMQyV5+q
         1TlWmdSPJlNM24rTvj65vaBYzuxdWHBNDpJ1BMwhUv00h2qqCTihB/kwW5TY5C5HhoEy
         tv5Q==
X-Forwarded-Encrypted: i=1; AKwUvByvhitmc+E+d5GrX/6fA/0SHeEgD+nvTb9dN8L6i7F/Nycfls25xuCQ3wrFIkKueIRkZ5E=@lists.linux.dev
X-Gm-Message-State: APuU4Z+bb4U/ohX3XhlytQJemRhZVzB/QWgP5Co1lAMnYzzblybAzmfi
	DtnfWpBP9ET+OM3NK2YpanT4JmnNV1WmidCVlM86WYWrqpz2zsz6I1i/
X-Gm-Gg: AYBFou0UxHl2aqWKwRfYWJctVZGxWfSh93/7cWRGbmhDs4xTbjACV4INwpZLwrgaN0l
	u1G3ebt4dY8bb4N6vLnuLF2k9a0r/ACqpAi1gBxdSYU0ZKYsCPCuLGj2CqijUSwwjNrzAhDlR1q
	4kLEUE6VwTq7LpOZAGdIYEZ3NDfC3MI4s2yEBgMU3xG2YDjVkfg/0P7UofMrrs1VBw0sYVnmegB
	gcBeZ+lx1dD/3Sp/Oa1VeliGfCXzBqI5+ibvg6T6uEus+2XXR0vvxAeIGHMik0XW6B3odglJpS1
	xFbl91UPsplP7IPlvfWwvMSSWyx3wgYP9s5tGtwnanyNuyiq9fKdz1evgDebwjFOMsxKzrT/tVi
	6MFdTU8hnNn8ALKFGSFLQTW/fdTBCRLnPWDdyhy8wym3PTHTuqN7x0/CxFA/OeLbGGEq6Ec929x
	BMmXNYyGHaDuE+CQMsmumEi1f/ne/W6uruUd7dbFb172UkUmcDD0vBmo7sN6+M1SO6EYYfdiJ+9
	OqpdiRCxN0CCM4u2aCYCiQd0z0PWNaRiGHZ59RQR89k6wiyJRQ5lh8Fzduh7UpQxrXK+cKVrgYh
	nPV6+QJVEDaIeJIFVOK5ePeWpfHmCCBU1OCl4HMS4rEJPUOUT/RJrgvBnJbV9x+57MqWsi32G6c
	rksjbfOS54Hvh6GsTY3OHY/SIGJ09hwo=
X-Received: by 2002:a17:907:94c5:b0:c4c:eb16:b567 with SMTP id a640c23a62f3a-c4d6d4e45b8mr82837666b.19.1794131804580;
        Sun, 08 Nov 2026 01:56:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:43 -0800 (PST)
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
Subject: [PATCH v1 0/4] iio: adc: Add support for MAX8907 ADC cell
Date: Sun,  8 Nov 2026 11:56:30 +0200
Message-ID: <20261108095634.100517-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channels
with information about different parts of the power system, including the
battery, charger/plug, jack and thermal readings.

This patchset has 2 dependencies:

- patch 1 of the series requires this patch
  ("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
  https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

- patch 4 of the series requires this patch
  ("leds: Add driver for MAX8907 LED cell")
  https://lore.kernel.org/lkml/20261027115006.86032-1-clamor95@gmail.com/
  Or to be sspecific, part that adds max8907-leds to max8907_cells

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property
  mfd: max8907: Add ADC client support
  iio: adc: Add support for MAX8907 ADC cell
  mfd: max8907: Add ADC cell

 .../bindings/regulator/maxim,max8907.yaml     |   3 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/max8907-adc.c                 | 195 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  75 +++++++
 include/linux/mfd/max8907.h                   |  53 +++++
 6 files changed, 337 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

-- 
2.53.0

