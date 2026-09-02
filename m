Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40FB3C4B60
	for <mfd@lists.linux.dev>; Wed,  2 Sep 2026 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377674; cv=none; b=S7utoc6PReno+NzN7CB2eT5j6twDFcvSk7c+QX3kr2yuCTVw1YfgBuW1j5X+oW9Jz++RynUqs1fozdpukyWXDmsqveQMSnXuSWXJdX318IjQ4pc02DDBwvWbeoK2qUMyuuv1Dglx/BOkuH3rt7SKTH6IWgkGNhQ6oQw7d5AMdig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377674; c=relaxed/simple;
	bh=eYrnMB7bcQ9tZrk9TdZFWbZtcH84ppkhNhwV/tshEyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=soWKQrGGFMniljbhCTnLJTTppSAu1Q88Xlb/VyDam5+YUU/wGv8StwceK8bnoujrsPsEXIFwlmr4tH/DJQN4lalLCYzZ/5iCH6Ch/Y/9X4K2sMnAbx5B1B9sma31KKsatcJPqWduYp4gk3Sap+CL9HXJ6sOpQL9vRlfzJp0riLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOzspDBU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOzspDBU"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48433fad54aso988881f8f.1
        for <mfd@lists.linux.dev>; Wed, 02 Sep 2026 12:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377656; x=1788982456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dql7ivfqyvhGH9YThZE2gyCfSsqd8ytrUGm38vXWCVI=;
        b=QOzspDBUUj/GxxOkB7hGDQZnXqTLGPloQtplfRO/8tkfIg8MqKt697aU++gOz5Qf50
         GOFLklPbfjceKi06j8gT9wk1JnlQzeaYrO8J1oxR7ssFN0hbVhW/P9cR2NahR+J26gKO
         au+Cz3wSA7ugx/hwtZPBfUTRopd1r9FZm9ku3lf+H/FPNbGfqT7wuAOJiCGgJj695zhG
         3BdkeEgNcH0WqZYYPcm/FugCoLBjBEfH1Szj6hwhQNVir52Q4aijjlyA90mkCYYMSjXG
         gPfe2KkwPw2J274KpCSnRoDzYecP/EQv+UQZvAzg1qZ8lSGWUDYDrgcrN2ymqXkbRp47
         7Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377656; x=1788982456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dql7ivfqyvhGH9YThZE2gyCfSsqd8ytrUGm38vXWCVI=;
        b=aAhcokJwtjLs655sGn2bUmSlXjz3GfTxAh+pKTWL86LJL2pLXAMkokR+WpJU9vYRb9
         iMTVVaedKWbX2A4suMbHTmtj1x+1JxMtJM6lNBAkqAZq0OY3IT2ZddEszcJg01zK+GKq
         oSWU+AgyBncWJ23mefcoS9lKEi7nx225xQcdfAXzAM/D0Sr1aAOizg+47FoRPdcfVrAg
         i92sF7YymGwyskYvjGiv9t6ejtMyNFglQImYupCZkplWEjtdN8ILFuXHVZXgt8sIGL7W
         iXgngFeV36rmEy2MxlEk8cgALupRyJGyTaMq4AxOTjJD4T6NHkrolP+cyDh7OkBvMvaS
         B4Sw==
X-Forwarded-Encrypted: i=1; AKwUvBxPEaGcRjqiEmovYhTVRUcwZaJzsZkJgghIfOZQjSTq+jYsFdGhap2E5ev1SkrrG3uynxQ=@lists.linux.dev
X-Gm-Message-State: AFuF++kaJI9WB+YnW2zCnccWXKIJhPeuzK3F53V+rwV6+We9rG8uJIqV
	89G8O6ZBdsvM3+nFKMvnjFw3fBqvVv3zvYEtsy/9YLcNe0whqpSXn2EX
X-Gm-Gg: AYBFou0zXdm0jjZqQ1toWQZksHW+LnMwvdWSDAPx/+SKi+GbYWW+zUeGkOPOSKAN6QN
	QpW0efJfwANuMK4MpdWTpzFkvKqRtcnSYEiWCnBD1jV2mSebfnH/2NEPV7HHm1z4TSERVGFUhzh
	RnFqETX7Kx2ooVmiwPqLyPs8znrz6TbFW3CTi2iQwx4++JA1+7cwyEvklcp35L2CpKfil5NasJw
	ks3AY8mCnvBiVdVt1y/Oc+mDUy5JbtjnjjhRWa3ZEVCqzbq06x6T63H85nqnKviil/ZmCoBz26t
	KKzaCyvL2fZqDpOKqgtU2k9vUxFgWJzEa1ZVUaADpxXkIkSMu4rkHt4hEFYtYz4p8TKc1GK5m9q
	gJYqySUNBdKLR5rXQzjrCwWBlh6CmK2GXf0HBnUXzcCI9r1ZyCtq5ostZMOlshTxwOmLzZ7+G1r
	yFvITEKbXDu9U9KdNj59lLNUwsTR7L6qtDYvpLFb+vpJLo9L0gTQCUXlEr
X-Received: by 2002:a05:6000:40d9:b0:47f:86d5:d1d7 with SMTP id ffacd0b85a97d-48488e037efmr14500352f8f.6.1788377656038;
        Wed, 02 Sep 2026 12:34:16 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:15 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 0/9] Add support for MT6392 PMIC
Date: Wed,  2 Sep 2026 21:25:36 +0200
Message-ID: <20260902193351.185771-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT6392 PMIC is usually found on devices powered by
the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged and from Val Packett's
submission from Jan 2025 that included extra cleanups, fixes, and a
new dtsi file similar to ones that exist for other PMICs. Some
comments weren't addressed and the series was ultimately not merged.

These patches enable four functions: keys, regulator, pinctrl and RTC.
Mono speaker amp will follow later as I need to work further on the
audio codec.

I added a handful of device tree improvements to fix some dtbs_check
errors, added support for the pinctrl device and addressed the comments
from last year's reviews.

Please note that patch 0006 and 0008 depend on patch 0005 as they need the
registers.h file, but belong to different driver areas. I'm not sure if
I'm supposed to squash them even if they belong to different driver
areas of if it's fine like this. Any advice is welcome.

Patch 0009 also depends on patch 0003 because of mt6392-regulator.h.

The series has been tested on Xiaomi Mi Smart Clock X04G, on the
Lenovo Smart Clock 2 CD-24502F and on Sony PlayStation Classic Mini
SCPH-1000R.

Changes in v10:
- Removed the fallback on mediatek,mt6323 in the MFD binding document
  and in the dtsi file. Suggested by Sashiko [11], thus removed the
  Reviewed-by tag provided by Kryzsztof Kozlowski in patch #1, version 9.

Changes in v9 [10]:
- Correct binding for vrtc as it does not support mode setting.

From Sashiko:
- Added missing include in MFD documentation example.
- Fixed constraints for regulator-initial-mode in regulator binding.
- Fixed wrong register write while setting LDO standby mode.
- Added missing pmic interrupt definition in the pumpkin-common include.

Changes in v8 [9]:
From reviewers:
- Added example code to the MFD device binding, removed it from the
  regulators docs.
- Added minItems/maxItems constraints on the regulator mode definitions,
  improved the mode constants.
- Fixed formatting issues in the regulator binding.
- Import the mt6392.dtsi file in pumpkin-common.dtsi, as it was originally
  meant in [8].

From sashiko:
- Added more explicit constraints on the regulator modes definitions.
- Use the appropriate modeget register for LDO regulators, Buck registers
  don't have the corresponding register according to the data sheet.
- Added the missing of_map_mode function.
- Removed some debugging code that had no use and masked error codes.

Changes in v7 [7]:
- Removed patch 0008 dependency on patch 0003.
- Reintroduced the regulator driver. In earlier revisions of this series,
  it was proposed to remove the dedicated compatible for the regulator
  device [3]. The driver does not use actually it, but it is not possible
  at this time to remove it from the bindings since it's a required
  property.

  Making the regulator-required property conditional was NACKed in [5],
  with the suggestion to create a separate binding altogether for devices
  that do not require the compatible property. I tried implementing this,
  but since the parent device needs to be declared as compatible with
  mt6323, it leads to a warning in dt_binding_check since mt6323 would
  be declared as a compatible in both mt6392 and mt6397.

  In the end the only regulator driver from the mt6397 documentation that
  still declares an of_match is mt6397-regulator and it does not seem
  to be necessary, so it should be possible to remove it and make the
  regulator compatible optional for all regulators, but that change would
  probably deserve its own separate patch series.

Changes in v6 [6]:
- Dropped the regulators driver for the moment
- Explained the FCHR key name origin in the commit message
- Introduced the MFD_CELL_* macro in the sub-devices definitions.
  A separate, independent commit introduced MFD_CELL_* to all the
  subdevices in the mt6397-core.c file for consistency
- Replaced of_device_get_match_data with device_get_match_data
- Removed the mfd_match_data enum in favor of the preexisting
  chip_id enum
- Adjusted the error message if the device is unsupported

Changes in v5 [5]:
- Double checked regulator driver with data sheet and Android sources.
  The data sheet I have misses a lot of register descriptions, but
  Android sources have been helpful to fill the gaps
- Reintroduced the required attribute for the regulator compatible
  in the bindings
- Fixed the missing reference to the MT6392 schema
- Fixed casts/unused vars reported by kernel test robot
- Removed Reviewed-by tags from the regulator patches as they have been
  modified in this version

Changes in v4 [4]:
- Dropped usage of the regulator compatible
- Fixed commit messages text to properly reference the target subsystem
- Added supply rails to the regulator
- Reworked the regulator schema and PMIC dtsi. Now all supplies are
  documented and the schema no longer includes voltage information
- Removed redundant ldo- / buck- prefixes
- Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
- Modified the MFD driver to use a simple identifier in the of_match
  data properties

Changes in v3 [3]:
- Added pinctrl device
- Changed mt6397-rtc fallback to mt6323-rtc
- Added schema for regulators
- Fixed checkpatch issues

Changes in v2 [2]:
- Replaced explicit compatibles with fallbacks

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/cover.1771865014.git.l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
[4] https://lore.kernel.org/linux-mediatek/20260330083429.359819-1-l.scorcia@gmail.com/
[5] https://lore.kernel.org/linux-mediatek/20260420213529.1645560-1-l.scorcia@gmail.com/
[6] https://lore.kernel.org/linux-mediatek/20260612200717.361018-1-l.scorcia@gmail.com/
[7] https://lore.kernel.org/linux-mediatek/20260615071836.362883-1-l.scorcia@gmail.com/
[8] https://lore.kernel.org/linux-mediatek/20190323211612.860-25-fparent@baylibre.com/
[9] https://lore.kernel.org/linux-mediatek/20260620200032.334192-1-l.scorcia@gmail.com/
[10] https://lore.kernel.org/linux-mediatek/20260820122242.120039-1-l.scorcia@gmail.com/
[11] https://sashiko.dev/#/message/20260820125850.3B34D1F000E9%40smtp.kernel.org

Fabien Parent (3):
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC
  regulator: Add MediaTek MT6392 regulator

Luca Leonardo Scorcia (4):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  regulator: dt-bindings: Add MediaTek MT6392 PMIC
  mfd: mt6397: Use MFD_CELL_* to describe sub-devices
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |  72 ++
 .../regulator/mediatek,mt6392-regulator.yaml  | 112 +++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   7 +
 drivers/input/keyboard/mtk-pmic-keys.c        |  18 +
 drivers/mfd/mt6397-core.c                     | 307 ++++---
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 ++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 764 ++++++++++++++++++
 .../regulator/mediatek,mt6392-regulator.h     |  23 +
 include/linux/mfd/mt6392/core.h               |  43 +
 include/linux/mfd/mt6392/registers.h          | 488 +++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  42 +
 18 files changed, 1974 insertions(+), 168 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.43.0

