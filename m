Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762714;
	b=TPl3dyjg0AQpyNqcwiOqtWIai+TmaqZQ5pfdSlWbqxumgESGtiWAFBuWdb7QP1Onz4HB
	 wpQbS+hh8Mu7cMHhvaknpvBqCVmZO7JLrF/G4S1LoSzTVWL0cEkeQ5H9GFGLO+RpDP6fo
	 0ekbJZTMoQTxYziKZtHbSA0PTIYlud9DfD7I9OM6pIVZwrDCu6LT/NIri7xZSOAnQ6JcG
	 97CgWkKDqKM4kXQzuAF/ZvjZorAhLJ8XCBKxbxB8Aq1Uv9HWWi79ssKQ87UhFTIeXFVw5
	 ywRKS4af9mmhA8P6Z8/sUwbP+Kz+BQ1iKAdhTFvBQ8iNruFT69JSN34ohXY2bNVtSiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=boTZDXSN4oprrtS73rntc9EJscLfI/TB1oiEFbCPLbg=;
	b=1pSqZpcuNrM2OuJ0fbpjwytwmZMrM/njLCCjyyxxyNCJK3/zq6R/P1x6uj9YEfzy3Gu8
	 6xIisshK7m2NC9iDkj5YbiwKy8nZoXCHcwucmPomCuUiyn5lkHoi0wWtMK+1tud1gGXec
	 9L8PQ+BCNhlRklk2Z0/BNgdKYYFOd4wopCZKSkSBs/wDODk88AVELbwJLbh0beSAxBq2h
	 Pf4srbMoOCGz4HxbRUtw5diG0EWCpIQ7GtTO9EnXnCs5iHMZz8zYWZGKr7P4zVaG4nSLP
	 Nge+ryNnonnYN3nlQdVwzPSw2wFIvuJsZ11rs/g3FySpMbqKlhHugrFbY++Hx6Xj2pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=KcKAJsaX;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C4606A31F
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 17:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3C4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=KcKAJsaX
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so5311945e9.3
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762712; x=1795367512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=boTZDXSN4oprrtS73rntc9EJscLfI/TB1oiEFbCPLbg=;
        b=KcKAJsaXERznKEFz/rW2N2xnfUaUooFQhO7wmASXWaTITb19tPBU68Y0hc8UPvCeEL
         JgvQy8n8E1Pw4hf68XbByr/ZBzuxUgUEYYZC8x/qxAfrtAx0gNZ4WUSQBKtxJgq36ftT
         zGqQwt5lZz6gg9FuCxUQ2dCbHB3WmVgfhhv6UX+GzKjSsAEeiw2azmuNUukq30dEGyPz
         6MeDpSN93afUomNzHA/uxsLEKokCU2MFIweG93qwcJEfWTXDrYDLipp8v/tz2O9Rn5ev
         saUsKydykrp/ytq+XSdmk99yNppXOsLWWRJFQ7jTHfEUn6pfqU/KqX81m0gSScDBTICZ
         UX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762712; x=1795367512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boTZDXSN4oprrtS73rntc9EJscLfI/TB1oiEFbCPLbg=;
        b=QW7J+aEVjlu71fG+GskaVHTWmaonJ3zWxBqaeMF2GG4FqlJC05GhKB4XI3TTVcX4Lz
         WczfQDGOHCPtUVEPeeVZl8Gw4722jDNhWY9RdndDkzcwWLpAK7juKsvvmHZ8986KttYc
         Y6+w+SfqeDrMAWkFai4dBokd43yDQLyAcNZeIFiRauqUJibnMe8p6tyy1q9GpyhTFK5x
         so6gBCy3XFPuSw0JZj2NVtwYn4XPFWy5B8+47KkAGhtXgnuytdHCyDn4S/R7c8EVsQ7k
         /yZ4IXKZt4Lng7IQ8gmhyACo1V3q4x7cpVVA2zE8J6JSrblsz5uj57Asd2YzVsTZ7SYL
         YtFg==
X-Forwarded-Encrypted: i=1; AL+hErEwbrrmeW5cMPDnguOrnLqc4imYfMXXNmIkz7Let3WzV+/qNnfqmu5JDqqNzQEPUIaaH8w=@lists.linux.dev
X-Gm-Message-State: APuU4Z85MT7wOwpCdOFddWvACmhBkD40/hV9+z43MnQSKXYkD5IvwruZ
	Ns2ExX31VYwfiHKHGf0JPixqh7WEn9zspV7w3V4dq0JwOKXh7+yDTS3Eu4jHtplkRsY=
X-Gm-Gg: AYBFou3GkIu+GqDY5yLZdYJThp9ZAUuOyEwNc2f0SoGIZX+0ZuX4bhdD/kFvcu6WKBR
	cfZAKc8iRE4M0/j0o3p7cNoxqXuJrLVfIOhGLA8lWNk2yFJtvKVA1SvyKdEoStXNgpqP9oLFCSC
	Us0lU/kGrc2KDCz+z9l0ELvFKE+rkO5UHuZYKwM4awEls291MPJcoLi5Lt2NYgqJvjt2yPMSvB0
	Em/ZG4mV/wqgJLjkXyFWgupPBVCOY0lFGm8gfMdkpE+38c2sBqMxJT/OnToeEOdBHIn07VVJLyI
	IprE1oaZUZjcW74HbRMj/v9P1PSeayYGUS7ENowY7i4st9uXK873GQI73UA/duH86mEE1PZLTDH
	EHQHG3cmK/+SGUzmznDjUSVecXNdg1RgPH6Ipi8oUk/+vka1CYsOOHmf4/CXKiQuZJW5l4Am3fD
	3KSS/kn83iXi8Noot4P+x59FpF5cHwh0kZKBULyLdYtWeuh6qU/58ojzOzae4fc32TQDrE/0guj
	GuYvYuKh9l1o2M2SAvMbgrooWlQKYM5aDS7oM/EKSJgK8H8U7rjus5denhzX5MvmX8Wj4WYlhlV
	1aIGct/1UmHR7yJybcI1avYNirimsbDw1SlY2nCcsa4KADW1EDgv4i2IwoqJHeVQ1gCXpmxECMT
	PVURPg6M=
X-Received: by 2002:a05:600c:1c17:b0:4ba:4395:56c9 with SMTP id 5b1f17b1804b1-4bb55abc204mr208568095e9.26.1794762711757;
        Sun, 15 Nov 2026 09:11:51 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:51 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 0/7] Add support for the X-Powers AXP2101 PMIC
Date: Sun, 15 Nov 2026 18:11:43 +0100
Message-ID: <20261115171150.64431-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

This adds the AXP2101 to the axp20x drivers: the MFD core with its
registers and interrupts, the regulators, the USB power supply and the
battery charger. The PMIC is on the HiBy R1, a music player built on an
Ingenic X1600. It follows how the AXP717 was added: the existing
drivers are extended, and the two power supplies get their own
compatibles because their registers differ.

Not handled yet: the PMIC's own fuel gauge (the R1 uses a CW2015, and the
AXP2101's reads 0% without a battery model), the power key, the ADC
channels, the TS pin, and writing the input current limit.

Sources: there is no datasheet behind this. The register map comes from
the GPL-2.0 AXP2101 driver of the hiby-custom-kernel project
(github.com/Jepl4r/hiby-custom-kernel), an open replacement for HiBy's
closed module, and was checked against the chip on a running R1.

Tested on the R1, on v7.3 with out-of-tree board patches:
- The rails the stock firmware turns on (DCDC1-4 at 3.3, 1.1, 1.8 and
  1.2 V, ALDO2 3.3 V, ALDO3 1.1 V, ALDO4 3.3 V, BLDO1 and BLDO2 2.8 V)
  read back at their stock voltages, and the regulator registers
  0x80-0x9a stay byte for byte as the stock firmware left them. No
  voltage was changed from Linux. BLDO1 and BLDO2 (2.8 V, the LCD
  supplies) are switched on and off from Linux by the panel driver, which
  claims them: bits 4 and 5 of register 0x90 clear and set again with
  the screen blanking and unblanking, about 20 cycles over 8 boots, with
  the selectors (0x96 and 0x97) staying at 0x17. That does not change a
  voltage, since the registers already held 2.8 V. DCDC5, ALDO1, DLDO1-2
  and CPUSLDO are off on the R1 and only come from the register map.
- "poweroff -f" turns the R1 off, through COMM_CFG.
- Unplugging and replugging USB gives one VBUS_REMOVAL and one
  VBUS_PLUGIN interrupt, and the USB supply goes online 1, 0, 1.
- The charger registers read back as the stock firmware's values after
  boot, and the battery status is Full on USB, Discharging unplugged and
  Charging after a replug.

The series is on for-mfd-next (c92739a23a80, after v7.4-rc1), builds
with W=1, passes checkpatch --strict, and the three bindings pass
dt_binding_check.

Open questions: whether extending the axp20x drivers is what you want
here (the alternative is a driver of its own), and whether programming
the charger from the monitored battery at probe, read-only afterwards,
is acceptable for the battery supply.

Changes since v1:
- mfd binding: axp2101 placed by the order each allOf list already
  follows (Krzysztof).
- usb-power binding: the AXP2101's input-current-limit-microamp
  constrained to the six values it has (Krzysztof, and the Sashiko
  review).
- mfd: axp2101_cells is const (Sashiko review).
- Acked-by from Mark Brown on the regulator patch and from Krzysztof on
  the battery binding.
- Rebased on for-mfd-next after v7.4-rc1; no change to the code.

v1: https://lore.kernel.org/all/20261023100401.67592-1-olivier@mgcrea.io/


Olivier Louvignes (7):
  dt-bindings: mfd: x-powers,axp152: Add the AXP2101
  mfd: axp20x: Add support for the AXP2101
  regulator: axp20x: Add support for the AXP2101
  dt-bindings: power: supply: axp20x-usb-power: Add the AXP2101
  power: supply: axp20x_usb_power: Add support for the AXP2101
  dt-bindings: power: supply: axp20x-battery: Add the AXP2101
  power: supply: axp20x_battery: Add support for the AXP2101

 .../bindings/mfd/x-powers,axp152.yaml         |   3 +
 .../x-powers,axp20x-battery-power-supply.yaml |   1 +
 .../x-powers,axp20x-usb-power-supply.yaml     |  12 +
 drivers/mfd/axp20x-i2c.c                      |   2 +
 drivers/mfd/axp20x.c                          | 107 ++++++++-
 drivers/power/supply/axp20x_battery.c         | 221 ++++++++++++++++++
 drivers/power/supply/axp20x_usb_power.c       |  86 +++++++
 drivers/regulator/axp20x-regulator.c          |  88 +++++++
 include/linux/mfd/axp20x.h                    | 114 +++++++++
 9 files changed, 632 insertions(+), 2 deletions(-)


base-commit: c92739a23a80f5f0a7c6f3c10aa792102d252ac4
-- 
2.54.0

