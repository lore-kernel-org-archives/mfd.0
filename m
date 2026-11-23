Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446457;
	b=OMxCZaEaiqwN02x2Wpvxq3aKVYkUlfX1tb6ulM+c1srBgN/VJm/rkEM3PniWLtvU4I7C
	 upsGbKsi9Cev297Qj87bMY8aMP0nn+LDqW657CCesUSFy/zyOBY9iIb5uFzZa+MoTqYA6
	 zvmsEGp8qFgP5OkMz3fQ83shXbEIM7T5S66NjLfOE/ZtpJoFFjTK6JIbLo2S5TwqDqQwL
	 ZxFlrYo/IqI4Y0Jf7w26nCjdgJDWuNyrEp9jJh5wHHwOOFlAqdnb3IVAcsOUWrTzVmt59
	 cj3PJbI1Z3QFkVyvqv8MM+OotQuICS2mffah7RkRc8RdqRR8UZil+8NwqkNMmazjzEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LrQqNvxu/j1cHnx9Lcyw23sony0Jj3XqLz3lYlPUdFQ=;
	b=KPnYrtElx0EgS0fF6lB6EnrIAVZb8JHZGbrUBppGTeMK06wxN/KsiD8WA/+gs/F0QQ7a
	 fYzg3uhBEChKhUN2WkMIn28NnWD6TYeDOCTuMSHiV3ADEMRg8cR/I7yK24P/qlXEj/TuD
	 AF0Adu1Fy9iDb2k+KtyESi8QZDloDsPsQTA0eK6ygSUsoyvHSGbf1KYLk997Gs5dkju0Z
	 70fpXtxS9Q2EdXtplTlIRElUdXIFZZOB9MknyP+e1RobZjVz3peQ9gocoCVPmvcXOpNuW
	 UcgI3DV/l445miir67XEhD12IciFTau4Bo+nl57Kbs1P6I5IG2YwMLUH3uDlf9/oysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsJi+bWS;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A7606A31E
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsJi+bWS
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso3806591a12.2
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 07:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446456; x=1796051256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrQqNvxu/j1cHnx9Lcyw23sony0Jj3XqLz3lYlPUdFQ=;
        b=ZsJi+bWSgV6dx3YqnarlZfbV5DT94yDHox3RwcmFMw8+97mp1wctUkCmTGFfgGuQvU
         kRUfOMLaCKlLBH9e2l6PnVwo//HAlFOZMGRSSQgbpPCrxX+PEvX1m3QBqfjRYSJolpC1
         wcBEli+GKLBQOFcXKetNlRc1pJ0Or+PCmOk9dJW2j1uxUQhaMItLEmLpEqAGn0a1ODTV
         XIm5mVLtTotNINqB/IFI1LMpOuejGIN77fYjjMi9hgF2v9hxIPe1Q9zOSBpYjxZlUgfy
         HZU4LnhTLXLCueDVXGBZxuCdvlexjOxBDKRwOOmOnltlyEBRHBV0bOZOEmmA09LKUi0E
         OQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446456; x=1796051256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrQqNvxu/j1cHnx9Lcyw23sony0Jj3XqLz3lYlPUdFQ=;
        b=xIUxaVV3oCqRUXATMAcqtMGpOKbLEtCTOrB6X17Colp1doMSUHqHabnAUNlnUJPrRJ
         Cg67T5ZqwLIke5eJwALVziuou8hMmv1RrHTVzG1UMrRzOhmGbjqUIe6RlZiZ3FdbVAWe
         VUl1E0WlpaiU66eKTUuIn73qOg22HReKDeNxMMNy/53e93n5RdYX6O5J8AgP90MX7EQD
         Q6nZmsr7+xXb+H1IyyoPsNRHqAfxgArClv408BRSO2nLHXWuY+x8PFaHQ0buQ7ylyzGE
         f/I39AbW61XCnp86m8fqnsRxqXkZjO1fTdKcW5UT4T2hUdAWuD6G+S/D13Qt0v/VSUlz
         RrMw==
X-Forwarded-Encrypted: i=1; AL+hErG5rlmftmz/kV93kPTlKAyAlSnPqeo49JaCPCKWT1Azm0SndjlknKLLlayK2sXjdg22GcY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+rG3BihIv0H/DKIi2C8c/2YJpG1Ocad6GkcEUQTMPpFBEiE1cV
	m3Z9jdwUK4VHgU8AFcv+NeOoF8JCmgMCHz+1s926QBDhCznPJwDasddg
X-Gm-Gg: AZFdTZcQHkyOP1ctvFOtbNFcpI9Agkona6VxTSvEUxe3vivz7rYJNl3QI9lTCJf8H//
	HG8HPUTwAXSKqgGBI7k2KeLdUFNSAg9nA4K0JeHXEKS+Gabe4OEeOzeCJNSW3QNFrQeFvXF6ZAh
	GPSbteDO+OXA5wAp6Ye6/Vupk3s9hwizEHH6ZORBZRWUCoIR2vBnSChUJrcAN993HHJ4J11Kz7H
	6ZrQ8K2SSZQ+cpStrnuaJF/WVS8UAGFvztYL0l82BGIfknx3avlvd2J1cgv9Xfu/4LoayFAQmhF
	ClU06FHbNssaOR7mplLkmKl6olgwqiGLz64V4OXgt/Zy3L6g6LJw1xvbESOSqnWUYwY3UMDRXDB
	0MKx8LzW/4OJPZTF7zPmpzIrhg/rJu70qh25/otW+Aea4aV7wCfanyWul8gk8QzZ/KJuMbM4/GI
	dtTtMsAyXHED4QKWQt3YbR3bTay1tWaGib6cbCPhj85gTgTPOSthOYOdbPZhLDvjFLQXdlRCMES
	1pbcsRQXb/P1g9Yhz0Tq4XabodqGWgmJYLs3ZKSTr7ZiESGmnLchwq0SeU7QcDkY+qVhSpopCNf
	jDnvQQloQuZcK+47JLefcSQsz71J6HkkHh/PmszU0A97TvYOdxfLKKNOADC3r+oghi3oeUzCAjL
	X/T5smoT4vg==
X-Received: by 2002:a05:6402:4416:b0:6ba:b24b:a25 with SMTP id 4fb4d7f45d1cf-6bab24b0fc3mr2248751a12.7.1795446455855;
        Mon, 23 Nov 2026 07:07:35 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm5446279a12.25.2026.11.23.07.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:07:35 -0800 (PST)
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
Subject: [PATCH v3 0/4] iio: adc: Add support for MAX8907 ADC cell
Date: Mon, 23 Nov 2026 17:07:21 +0200
Message-ID: <20261123150725.212836-1-clamor95@gmail.com>
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

---
Changes in v2:
- remove unused register fields
- add prefixes to used register bits and macros
- default reference values indexed off the enum
- swap data array to __be16
- set bulk read size with sizeof
- return directly last regmap_update_bits in the max8907_adc_init()
- added comment for iio_device_set_parent()
- MAX8907_MASK_RST_CFG_INT_REF_EN > MAX8907_MASK_INT_REF_EN
- dropped kernel.h

Changes in v3:
- explicitly assign values to channel naming enum
- add missing headers
- loosen regmap_read_poll_timeout() loop
- rename module description
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property
  mfd: max8907: Add ADC client support
  iio: adc: Add support for MAX8907 ADC cell
  mfd: max8907: Add ADC cell

 .../bindings/regulator/maxim,max8907.yaml     |   3 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/max8907-adc.c                 | 181 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  75 ++++++++
 include/linux/mfd/max8907.h                   |  53 +++++
 6 files changed, 323 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

-- 
2.53.0

