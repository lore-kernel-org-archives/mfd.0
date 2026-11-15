Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733892;
	b=J5yaaslLwzoRnryCa+9i9nVmwBvQuFTHPqwXjB68EMliX3OW3wXHfMCFV7wa4MiCrCfV
	 5N36NBriAM2VwDiH8Umhwj93m295cJ5O1Yc9kldhHsLENKr+nJ2bskrRviWPiyd36kbdR
	 mkxxrBgSaON2UUMmatys5cwMW+qLxs/yQlSMHOlUeTbOQnYWXR9vATdlE12eu66c9tfV5
	 OeiLGbRIZ9RymPkNmh+b2eDIS7ieZXveIvtSWsFou7pJWG6J7FXlxA3pZkdZ85UejKzKr
	 jJl12Ho75xXN0gRLL+Bcln5KGPU4I8ZZ/5LILWw5FTGTWav+tUdoMHLsfZx/rAz+Irw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=j40ibOKM4mRf4qD2apM+zYLryIz6pOPTKlMB8WE+osk=;
	b=mb0ExuOfi/iOVhPmQY2j2LIS81ZlmCWDd4phWMZmoEiRkge2GX3SyKECGrGo85o+Ab06
	 hcBjQW1UUVx04MgQ0QjPDDKuR2dqA4vpIPD/OGG9tw5sTO+i9tJG/LAuhMqceHnCQKQDt
	 BgDIZyI6CcQFn9Ops8+qITEVsh5eY/aV9DHgfTKZ1qNjCa5irssgf3d8NiPnnbtFgfxtg
	 2TWupOC1Vmbk9M/BrZRWyQQY1EB9ND8Z4t5bYr8mvzS2+qrt5hNBxB9kT/ICPF/6fZ7NQ
	 lS9G/nwggdW7Sts9b7Usb/HJHR6eN+flK92fgRqxKAlX3qpoPvyaK085yNH2u0q5MwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g3Uy/l4m";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45628606A31F
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45628606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g3Uy/l4m
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4cdc606b47so442475166b.0
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733891; x=1795338691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j40ibOKM4mRf4qD2apM+zYLryIz6pOPTKlMB8WE+osk=;
        b=g3Uy/l4mUgg+i2OKguHcaOaRTw/JxITEajPQCEnu6TeZ8INEKLHrpeXoqJC7huSLUT
         2inEmoMDR+FHD0Gcz2lFoCUyG1B6q8cEuYl4Mi0i9Cr+MXbuREiZWrQH6uZxT/rhCEVr
         WWqVf2rAT+ZjshQxY4SScawQlMbbbSWmrdzwFrwna8geeDiouiLer0llIQjY8JFGDh2t
         6mX1pelw7jN1PSZUqF/TTqLmMEfhzjb5cvag2S1py30opfMUV9P9Nu6RfCurkEg6h8gZ
         SFSlfh3oQu9laEeeU4syshXXB+EcU9VGN6DJDZCd+3RDyvNCDmC5YIPfKJ59NmtHLRkq
         sd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733891; x=1795338691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j40ibOKM4mRf4qD2apM+zYLryIz6pOPTKlMB8WE+osk=;
        b=PIy4+2DK9l+Q5Ywe1e77W8N69bQ7VTMFYL95dNr5OVig7CdhMA45A2Wz36rvdQfR+l
         7sVIghe/FAfdWpfU7zpvgRFooF4EUO9rd6d9wQIhcrHciz/ZX++qK6gWLlNiJXtz93vF
         Jme8hHh7DJ6lvak4PzAiJn5zvpsPArM219dkHGjILfAHmokSh16v67wzqESr1wBw2xdJ
         P9kHaS3Be5sso2ArnM9m3uaDx9SFys+xZTpKgVttb8iBryD9muXg1ScIRPFTw1fFr9S9
         2B5ffxa7W+SuYMnvDcxFv2oSOkoJ+JXwOROA7UYPP1ixBecSY4HNcl1ICH4MUzlEjF1b
         4XwQ==
X-Forwarded-Encrypted: i=1; AL+hErGHKsuQvBba//ABLx7/mIUUO287k5A0trzkYuIz3HwG5taVTe10XcMyOKvpEwJFF6oxcMA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9/4EOkCOCSh3OUZG288s2NxpQc7uaBfhtqHup0yftVU81nz6yB
	TsIoxb3JDa7y5gh4UQMJBIYL1hBrLOOmRbEjleTGXidyh53RpJvYYyrL
X-Gm-Gg: AYBFou1/l0PvPhL/K9nHnYpoqikO+eCTM2oaNM9XBY0ay9+2weYzJnBvvkFqzPWCZUN
	rRoXI0IWgyH1+G7ForapZK+KSXl5O4dltKeljXczf4xqvazFqMXPaezA9psjQGCNzoV24emldVe
	NfJsS1WcsXWRYvH3CPmV1V6jyoGCW4q+RLXVLJq25UigKGgDgUug0GtgjcNYpFsjXhnONwSOtYW
	4y0ORzXC1aPuqUwjUrA3NFdeTURjRDyNclb8OGTmnKvZP8Y1WKThv0KTElLa+eoUCJAO5ZF7n+7
	2dl6pYP1PLSPkLsYDOrVVDeXWjlOjJRbgCRG3of+gYUB1Nqhrf7SkTOaLOun356oSMhqFqg/WZK
	0JM490WOATKssg3yV4tYAzyb8F6jUcZyn4TMlRI6PKA9mKS7kYPmEzHE/UeNRlCVQkxQhvYONL3
	wqGa5RPlx5trO6xL5IDmIHjWo+p99oSwRJ3OyYYiTD5M+C7LI2B9jLZ1o1k9bmAfYFJTwUpk9jW
	+N41MNyg6XcFl4vcV//Cdh62MWisSrTjZUVB1ORIV7kDUUcrQHPgXqErFrCEkves26PB8J6R9CU
	+GP0KGkXsPxaQX4GjAHsts9xsfOl+zz9UaQ27MmkuyvDYWDGFQttvORV3qHKtjtxv0GwHnOnJuS
	W461811AJbA==
X-Received: by 2002:a17:907:7b96:b0:c50:62ca:6f7 with SMTP id a640c23a62f3a-c50963b3398mr628172366b.25.1794733890485;
        Sun, 15 Nov 2026 01:11:30 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:29 -0800 (PST)
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
Subject: [PATCH v2 0/4] iio: adc: Add support for MAX8907 ADC cell
Date: Sun, 15 Nov 2026 11:11:16 +0200
Message-ID: <20261115091120.108684-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Document io-channel-cells
    property
  mfd: max8907: Add ADC client support
  iio: adc: Add support for MAX8907 ADC cell
  mfd: max8907: Add ADC cell

 .../bindings/regulator/maxim,max8907.yaml     |   3 +
 drivers/iio/adc/Kconfig                       |  10 ++
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/max8907-adc.c                 | 169 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  75 ++++++++
 include/linux/mfd/max8907.h                   |  53 ++++++
 6 files changed, 311 insertions(+)
 create mode 100644 drivers/iio/adc/max8907-adc.c

-- 
2.53.0

