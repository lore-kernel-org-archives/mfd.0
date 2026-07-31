Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DB03D9672
	for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497809; cv=none; b=rZxwNiXnkvE3aZCtP2OD31bDnJuTzt2Bh/MSmbJ4xWE7pUR/obJHIH8UtonGIivlWf1vYVSjZDi8HTDhl6Xlhnsbc+nv2V6USRrAVbRlN6r37YSzcElTjkYEeMjYTjZxrXDj8DYLDhMkHLI+sk8F4mh6CocPGL7A2gde0hdtWfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497809; c=relaxed/simple;
	bh=AUKrB+1UwvRA+EobKyrqOVgmoMGLyj3fg3zoQatKMk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GRBavwzIUD8wKxy0XdMeftwY9k3OcqsR5oDiPSxE7UEGrHOxZUtZNiULjoZ4CkC/DbhIqgHkVoStUruA/sQHCu5HP+dD93KkF32zQOY25zV7tfq9vzOYzHoszM2HoR/9SHYjWVqNF8DUbrn3Veb2ZPWjLHPViA4bkRiCISzHsHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMKAKeKN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMKAKeKN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-472326ca506so611958f8f.2
        for <mfd@lists.linux.dev>; Fri, 31 Jul 2026 04:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497806; x=1786102606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0oYKY0Gc5U72MShEoavxG+AazK3v/FMxLUqW5uFuuYY=;
        b=UMKAKeKN9X1fz9dqrGX4Lrdk8gyFuwCG3q5XqIliEhpRxljwErFdHTU5FmxasRsCXP
         BBoFCkqk8ShMAoovYYal9//Z9CuPwnZMp9wGcEnZxsspftXRufPzCyqITJZKhPjqVrce
         RSGlIyaG2fXRd2unBua3o/HRYRnYDt9X7P99SKIs4R1UBlMtlvLZwBQnmEuci3jwABvP
         rv6QebxiDNjK59TNGGOGLUdf2hyjVXDlvdxgZkxxfzGvr1bN6+T2RUhJhwFgHn4t+yJh
         lL9fnNiHsKd30cRXXVg3upYkR3LschCYXVCffzUHc1wGxqLd4N9kixxMZZCgMV6LLyJj
         tdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497806; x=1786102606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oYKY0Gc5U72MShEoavxG+AazK3v/FMxLUqW5uFuuYY=;
        b=l56PSV4HQlnCQ3CwXk+GkWMVGkzvd3aMQjiNsAK0OIIBd+FzBOQWP4hDsJEfkgZG58
         Eep25AzVdrYwb+W9+h66xmFXpsuMXvMQxrI67fNbS3xbUrsDFoj4jifsMKicOtoIWdmd
         7RU1U238OFRlNCmb/gbRLpk8BwscJ7wQYY9A+wjDhj2N3kw8+HQpQs+Qn3X+4HYQcVTf
         WcBKsYfKMGQgaknXCXzVSHdaQchUj+O0qht232Iw9kT48rRMu1PRTgpp8loQQviuwGJd
         S2Mxdoepw/LCWWfnyMZdVUXVpFOYttEBhGy4G5Kp0uvRSf2/JAU2buyHk+kPrhO9DoVQ
         YXVA==
X-Forwarded-Encrypted: i=1; AHgh+RrhwW7zHqjWUU3b+x0T6UKZAXInp01A5dDq1nglH9syT7KMByGpf1x5Zpa2sipR3rSlCV8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbVRWTZNatCf7gdoo5G8apVD9jn/HiSX0W5aqGLO+VlcRAWC/E
	cbzyy7ZPbTZhMxSpU1t9qUqDWtuyVAAyj6cq6UEWag8oHbEjjQ/zHvuH
X-Gm-Gg: AR+sD104+FFR1bWvV08mbFAR+jI+p0Ii4o2cQumEJm3drEyR4VXFMFtgmCVKYugvXUI
	Y0xElLa6ZwoDEQgUONim9K+RGlddkWbRGl1SJNAQQM6qNhTBuHqOmJSFWvW+N9tio8nUszpQddx
	XXr5dZCW83Tg4ruOOuh+O+Hzct/vhFgZWBviIqS+olDgwDW7MzKmzrNp9u4xGQmKXRbCRA7H2xj
	oisSMoQ2CK1DKmmxTwivsjTD3EiFrpafa0WGaOmSD9aJGRwBSMGG9VQAyTbPeJv9gcH5BQ2Deip
	/83c0Y5Fa6vLRAKZwayjSItjuZGXIlbkG6UdzpWd7Iv1bltrBd4YZYGB2d2nEMM5QK97TSLFXYF
	HVkkVOPbT1JrZn9qN/nGTPllaeIX/teQQmJm3ZjM3voxnAYD3fF/yeknq0u/dndk9yODYeHAxWJ
	zyiuf/7JXB/Yjev6ocTsIPwkwQzY6BDP4gOjfFpjAi60CJ4Ly0nH0QfYzao4tHIcelXmfLPJwYY
	t9A59v8+A==
X-Received: by 2002:a05:6000:2904:b0:47f:2de3:b351 with SMTP id ffacd0b85a97d-47fd2adcad1mr4260062f8f.26.1785497805482;
        Fri, 31 Jul 2026 04:36:45 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:36:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 00/14] mfd: lm3533: convert to OF bindings, improve support
Date: Fri, 31 Jul 2026 14:36:18 +0300
Message-ID: <20260731113632.158440-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert LM3533 to OF bindings, add missing VIN supply, add support for
setting mapping mode and LED sources based on device tree. 

---
Changes in v2:

schema
- maximum led sources for leds set to 4
- anyOf > oneOf in ALS
- improved ALS descriptions
- adjusted example
drivers
- dropped devm convertion of irq and mfd helpers
- all als configuration moved into lm3533_als_setup
- added regulator/consumer.h
- lm3533_bl_setup set before sysfs_create_group in backlight
- added check if LVLED is valid
- LM3533_REG_OUTPUT_CONF1 > LM3533_REG_OUTPUT_CONF2 for LVLED4 and LVLED5

Changes in v3:

- ohm -> ohms
- added default PWM mask to schema
- added commit removing driver regmap wrappers
- added commits which flatten pdata helpers
- adjusted check if als->irq > 0 since als->irq can be negative if error/missing
- added count for children defined in device tree and mfd_cell is allocated
  via devm_kcalloc to be able to contain all of them
- fixed backlight boundary check
- fixed count increased unconditionally
- dev_err returns node name instead of reg value
- LM3533_MAX_CURRENT_* defines moved to common header since they are used to clamp
  current values read from the tree
- mapping mode commit splitted into 2 (sysfs logic improvement > mode from DT)
- backlight mode configuration set before sysfs group is created
- fixed LVLED check on LEDs setup
- added check if HVLED is valid
- fixed wrong err_sysfs_remove goto in lm3533_bl
- added commit implementing backlight_scale property

Changes in v4:

- fixed regmap_update_bits val and mask swap in lm3533_als_set_int_mode
- fixed als->irq check in store_thresh_either_en
- removed clamping of r_select in als driver
- added use_of_reg and of_reg for backlight and leds registration
- added intermediate step in asigning props.brightness
- fixed HVLED/LVLED configuration overwriting
- added bounds check for num_leds in leds and backlight driver
- switched to regmap_clean/set/assign/test_bits helpers where appropriate
- dropped extern from header function declartions
- switched lm3533 pointer in cell structures to regmap
- sysfs_create_group > device_add_group
- changes in backlight sysfs were expanded to all properties

Changes in v5:

- aligned driver helpers to use u32
- child nodes parsing linked with 'else if' to ensure there is one call per node
- removed redundant pwm var init for leds
- fixed regmap_test_bits return check
- fixed leds and backlight counting handling
- iterator variables made scoped
- lm3533_als_setup() set to exit after mode set if m0de is pwm

Changes in v6:

- expanded commit message in OF conversion commit
- restored original comment regarding PWM mode of ALS
- switched to FIELD_PREP macro in core for helper flattening
---

Svyatoslav Ryhel (14):
  dt-bindings: leds: Document TI LM3533 LED controller
  mfd: lm3533: Remove driver specific regmap wrappers
  mfd: lm3533: Remove extern from shared functions in the header
  mfd: lm3533: Pass only regmap and light sensor presence to child
    devices
  iio: light: lm3533-als: Remove redundant pdata helpers
  mfd: lm3533-core: Remove redundant pdata helpers
  mfd: lm3533: Use dev_groups in struct device_driver
  mfd: lm3533: Convert to use OF bindings
  mfd: lm3533: Add support for VIN power supply
  mfd: lm3533: Set DMA mask
  video: backlight: lm3533_bl: Improve logic of sysfs functions
  video: backlight: lm3533_bl: Set initial mapping mode from DT
  video: backlight: lm3533_bl: Implement backlight_scale property
  video: leds: backlight: lm3533: Support getting LED sources from DT

 .../leds/backlight/ti,lm3533-backlight.yaml   |  69 ++++
 .../bindings/leds/ti,lm3533-leds.yaml         |  67 ++++
 .../devicetree/bindings/leds/ti,lm3533.yaml   | 169 ++++++++
 drivers/iio/light/lm3533-als.c                | 179 ++++-----
 drivers/leds/leds-lm3533.c                    | 181 ++++++---
 drivers/mfd/lm3533-core.c                     | 378 +++++++-----------
 drivers/mfd/lm3533-ctrlbank.c                 |  33 +-
 drivers/video/backlight/lm3533_bl.c           | 231 ++++++-----
 include/linux/mfd/lm3533.h                    |  75 +---
 9 files changed, 818 insertions(+), 564 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml

-- 
2.53.0

