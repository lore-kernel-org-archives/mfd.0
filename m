Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907894;
	b=cxmubrTTsGvIhsc5UH4yoetSazns4hQvsx9Z2c7AKVxdz4D8n+aK+YhBvZcNCeKHYAAH
	 fB4oBRBc25kpxncYPnQBxVSM+mhIrWQexPt8RRREtt6DG5wwvRUINHBR25B3UPQ6Acyb0
	 1XsKE42DQ6+WAyrrWK7uoCgMThrBe0H/nJ+qmJrX85uVLqrSTYvMtTtco5W33zoxPjvOG
	 y51rexrPD/CaY9Ja8NrwPw1ec2VqcJeytg5mQleoKBMdHWeFrH2KAX/GIBRmT1BNsmCS7
	 9i3rjdBcMO/MWfKI/NNnF3hSttSKKMwFSL9PFN4iRZAxewqZ3pwg6S9WPRDy4cngs4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qKMu7fZRj+bInVCVJVTcipZVR9tOYgtfexJmTWWS9M0=;
	b=ye8d2q/90GtrNGc1EplOXMPHMyKBngzrlxFA0gjFlEXyMdEEn4O2NneVwPMancywySh5
	 KHgRComsCkOyAvpcn0MMozYS2WAjCqvlSKBNg9NnurDoSuR0nLqvWVe4q9epTcpTXaoyM
	 if98B1cXprTfBgFMu/hxx3YiU0nq1Oi9IpwbdSYCliTm1TTKaA3rSbR8nve6RXsRmkzhf
	 X6y757j2jrEiUiiPxggcHFYIUHTSapAi69wA+Gs8olhFLhNS+47WieENRwJ1PEsGOrPwc
	 Hu2VmlT4x/z76seQUG3LruQ3psrnyei/p3w83unJwsyawpoNID+DxqlDCMFFUtoiinA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYjTzu+7;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35126606C8AE
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 19:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35126606C8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYjTzu+7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so18670485e9.3
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 11:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907891; x=1794512691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qKMu7fZRj+bInVCVJVTcipZVR9tOYgtfexJmTWWS9M0=;
        b=mYjTzu+7v6irW1ACHN7w7snSCdn577t7MmEFvgQ9idSKwiP02bGlQHE5p7Tw0UvzGx
         DeC5PZbfu6UoxuaFGId1RK0Hf/xdvsz1SAQwvtkt4cvKyF/byoErZtwr0d9r0L9Ja4Vs
         j4MF3NT0WGRaynBibtJVJqifa5mHtrWJ1ptzPEMBkyU0xZi3l9eSvCAdG1m00z3Qyv8F
         fCcQ0u+3S/tyaf7031KkpbSsCve1tSnPhu95OMewbfu94qQEg5pyqAqd6rg5lz+anJDK
         frkhh9aQZZafblZjYrtmSW3fSI1PhTEHZ4R9ubleBvjqFu7aing+gLMGPaa9FEVvtVGb
         MMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907891; x=1794512691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKMu7fZRj+bInVCVJVTcipZVR9tOYgtfexJmTWWS9M0=;
        b=qe5K1OHjQ1FilLPjUqYQmoaPuMBa/NZGjENNlfJZwGvRmMrjQ6QQnRKgQXqOUyShqZ
         wciaLz7RaGXWCCs8CkzXXqAWFaWxltxqVfcFxeil5/F/HlixpO65A1aKzW7gnEm+/XMW
         /kTxECBY4Z73ZusQ2J0OFiDJbVX4s4jxkOIEYqGP9yBoGPZuc4z4SoduqBftMMoWgcrb
         KhreSg+Iw1Ir8v8diz4oKu0Kr3oKk6KSLO0OIGPNdwKT+7PqDQxjImU/26z77S2xJ8h3
         dujN1A7Ii9xRSXL9bHKQLpY7eiZuVqzygqMiUEKz3fGLklV5MCgGcT4yiqlDEfzDSATk
         emfA==
X-Forwarded-Encrypted: i=1; AKwUvBxIiZztLmwUsDTKH4gp6Bq1e5awPZGL/jvW+M4xje4TdBvJYpRRjRTOtBxs4JtRd8UC6yQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z82SeK4RooPPMo1i25jwIXav554hnXJYgKBqfBYb/gG4nVPOSlP
	Sc3aW6wDq4I+w5ifuSAUkY4GNX4ks6X8xPfCdN3NAVjSgliihEHEF1qC
X-Gm-Gg: AYBFou0d2j2vYhr3hsxHirXRdg6C0w8X9L/bOEayiUKrODaaTHASNzEprUEGq+peDwv
	ZEPXIj9mJdPY5E/jgPB6sFxEZZ0ymHYeXgR1XtWo9kpck829yPGP3hv2V/y4MVhotK/8b8a4Rve
	A1W0Z8hib9XAzqlfR04ZPXGHlo9+/yBwrhApHhGOYsC2W24/+RxLA9ZQpzPhiS3iIpCjYrVlppT
	e6q/FZnDrtDDxWe5MmQPKazzmqnTsrhgQ/RfdWmsdHEyqYOji1olJA6vKasES2HQNMYZuXU7A+S
	Fn1NfUs8ZICG/8GZTxx8kzCpuTs9/noHahuuKm6mHHtKEZubo3FwpCKB7uYQ4OfJS0jcCEZtbmA
	0k0wBmN0uN71Bz0Uo/UEvXtN7BdGdbSfmDWSf7Y16Z7qT648f85FJ3KSKYAIiu4hYyEEju0U7do
	wR+EXxhMvV50lCmB0l4lqn12d1u/IZIx6/snLGI4xOPPngSCgA68u5d2bcqyLokpu5vYPncIzlI
	6d/PLLHX58CLyekF24jzzZ4/gtpfc1KlVFVCgVEje4+v0yjJP8EPtPQGk+wJC6cLRwu27sbSxVO
	P7eOgFQyZzd9sOU+daGbiMLp
X-Received: by 2002:a05:600c:c168:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4b6db2ba2demr2607695e9.4.1793907891234;
        Thu, 05 Nov 2026 11:44:51 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:44:50 -0800 (PST)
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
Subject: [PATCH v12 0/8] Add support for MT6392 PMIC
Date: Thu,  5 Nov 2026 20:41:31 +0100
Message-ID: <20261105194426.1113050-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Lenovo Smart Clock 2 CD-24502F, on Sony PlayStation Classic Mini
SCPH-1000R and on the Lenovo Tab E7 TB-7104F.

Changes in v12:
- Rebased over v7.4-rc1;
- The patch to convert all mt6397 cells to MFD_CELL_OF was removed from
  the series, as it's not strictly relevant for mt6392 support. It has
  been submitted separately [14] and can be applied independently.
- Added the regulator-always-on properties and basic voltage restrictions
  for core regulators for Pumpkin boards to prevent boot failures
  (suggested by Sashiko).

Changes in v11 [13]:
- Removed the example from the PMIC binding, fixing some bisecting issues.

Changes in v10 [12]:
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
[12] https://lore.kernel.org/linux-mediatek/20260902193351.185771-1-l.scorcia@gmail.com/
[13] https://lore.kernel.org/linux-mediatek/20261021105109.199886-1-l.scorcia@gmail.com/
[14] https://lore.kernel.org/linux-mediatek/20261105104837.1105227-1-l.scorcia@gmail.com/

Fabien Parent (3):
  dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
  mfd: mt6397: Add support for MT6392 PMIC
  regulator: Add MediaTek MT6392 regulator

Luca Leonardo Scorcia (3):
  dt-bindings: mfd: mt6397: Add MT6392 PMIC
  regulator: dt-bindings: Add MediaTek MT6392 PMIC
  pinctrl: mediatek: mt6397: Add MediaTek MT6392

Val Packett (2):
  input: keyboard: mtk-pmic-keys: Add MT6392 support
  arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   6 +
 .../regulator/mediatek,mt6392-regulator.yaml  | 112 +++
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 145 ++++
 .../boot/dts/mediatek/pumpkin-common.dtsi     |  82 ++
 drivers/input/keyboard/mtk-pmic-keys.c        |  18 +
 drivers/mfd/mt6397-core.c                     |  97 ++-
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
 18 files changed, 1913 insertions(+), 28 deletions(-)
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

