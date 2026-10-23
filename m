Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749847;
	b=AUplUdLo9N6Ede8G53lpKIXqPJAAvRD9p0dRmekL6JzQWILXAaB5e0SMmOM4FvXSWObl
	 B3sHdQ++rpvMnntIitSI6voPAop+KlhJQQQ7mKOFCfTgCOHOeYhZ93IGlA4VCKbCoDFFk
	 YJxhhzXltan0h04wQA2GdOqzKVd4rqw783ODk9jtYnvzkimVSQIbtcjCfJNqdv4Vz/fDX
	 PXh7viv3iixlkqWjXZ8JExxvTp0zsR2RTuYT/z2gSkSAXwflk0jl3l2BCQzXFboouUHF3
	 4q9Z6BIBQSgdkujBrixUeKqfetsFBpEIC0R3UkIXzCx+YjX1lIknErRuVG54hpaMwqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uMSmtL8aALIL7nW1ScT+iJ8InFRsxd+68YkyGBJ0A5s=;
	b=dQz5mx9WCfF1coXfjbfR2S3MHDK8X1N5TO1Wr2kNyT03mC+z+1+5HiR2IOSPYu5S/nTf
	 LkG1zo7In12col83aYQNcx3DCbLRbaimdjCXkQjY8Sl+6xAgRlJOOT9e4qfbY3vaMREiv
	 OIDZ+YGvVUVeUwoZ38oY2tT+yCCXRG2j0PybKnK6MC1cUJHNDaKM6RCyaWXff9TkDzyQE
	 dZUobIVAOW5PjNESRZalDncBV2s7dK1LHn9U7aYyeuxCVSJ0zl0+QxXrEnE9YMs31bDbG
	 0Ojt815oZh0F14NL8XS9A+DZ6VWGj/PyuG7ngudUI5wj3y0tQImIG8D/7EfBVWYdlHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=hhxFSHdu;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFC9606A31F
	for <mfd@lists.linux.dev>; Fri, 23 Oct 2026 10:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AFC9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=hhxFSHdu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so8670945e9.1
        for <mfd@lists.linux.dev>; Fri, 23 Oct 2026 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749845; x=1793354645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMSmtL8aALIL7nW1ScT+iJ8InFRsxd+68YkyGBJ0A5s=;
        b=hhxFSHduvhbubngNk4WEmB6JMu2uD12jt8MI/vaowrCFe6ONTDZIedJZ8c9p9a+IZH
         pCuP7OLQ8n9WuA3XbZrPEWd6tlxECDqkb7yG8HjKfYdaUKcNVP44SbtoerMkq1/57jX+
         4mIwAUFKg8LOsP3zPkP7LLDMwPsqUFnK5kOjHE/Fo/Gkp34EH+bW8kRIcr5mhJ9AbVPl
         m7CwmRSbjkSPvQ0McXvAjBWLJqSLV7bjwwTN0UjToq9wvLCY7AIcsMx1bgMHRJE3j1bi
         yakLY2O8i0FYwSRAjFXQHoWkAEoL5GkVBR0IJDsEpB/X2jxwXKu9Y+Mkk4Gbz9c7N1lk
         oh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749845; x=1793354645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMSmtL8aALIL7nW1ScT+iJ8InFRsxd+68YkyGBJ0A5s=;
        b=xrECQ+fISe6QYvF85yG5Ry+XiUaSyxUtuTX3zwxdDxMs4v+f0HFDDvFzPJ4YBGr9jX
         UjQCaTbZQmH/189G2P/rzjV7Jvr7yHU9eopPdArpcs5u1fbdSVZvrf7XEnvygbJFoytn
         sb05XQF4gK3mthtb+59ugiRJAm5H7O6Ccye6UXzSy56Pizd97IKRndeFcVmS9cVgl5SG
         PkCrkrcoH1jbT7fBuK3G0I/ZE12634yVX9piO8PjLa7LpNjVdvYRQ+QCLaJfAH9LPtCF
         v9q4l3o2ihUtW75v6dnqO43KlhbzdOjH9hT4qPlNQJp0DtuDJBXwshUDzKPRErM6tr+r
         jVhg==
X-Forwarded-Encrypted: i=1; AKwUvBwqRmwghjGDDYFPST9W5eOEL4zOXjPBhi1T+qqqVMbxPpDSEhAx1rdE5xiT0/hOM0qM/Lk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJNO37T6TS4ZsquyaFXbUrH826LATK6vu7Eea+FxxrKP7A+ZnXm
	RBR409swjNsJ+66ch9uTIv4XFqiNM8FavttTL4OQrlgfmNNOWGqp/Kx1vODRv44hG2A=
X-Gm-Gg: AYBFou0u2xqRRZEaWP3VnPcRLk51hSYxQ+D5eHKLfjirm6mMvt26HGdpe9aeWBTQNux
	nC/8By1BaPPqE7+mF4jrM10XeRIEMf84Qtua9t5xJypb0Jb+YvHIf4rFW15rpSkA4woqyPMzQVk
	W8Q6AoS7Wovx9LWtb1zRFjQOrJLBdCk28paf0zEJm3IKxLp0aooQEIfGdW3Z4M1fbJVZAeUNT7G
	3TV08jkwHHExolAMbKgvKkOWVXjEMH4dsmQVtJ1mdQ2Zpc3KwxkGSsTbt//Ri4GnoFW+cDecM8v
	3KS+9jHnk9IkQzqsi+zkVKTJmCI8XpMAxpmwDBUdfTmDgFLotZTbo/8EBsPSTAn9etJezyLLvp0
	IX3b6wdJ9IkS8UqghtxdU3za6zcId3wIUagMdyIDGidcOJbWhwt3PWuRP+HO7YniF/a4c9rRrA7
	I+svwXyQYsiaEhBXrdup9BKkTgdl4hxqPM/5mu2EKCUGK0mUa9U5SFegO+5otHTKlEz+CSlmzal
	NqT+PxoazY7afJEgYGlRi3FYE7CS1Lig3lHPNTNcf2umVe/5rk7a0SBSvZoeepmOvuWS2N7dvXS
	Qz2KYSL1niX/
X-Received: by 2002:a05:600c:470d:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a211c51ae0mr27667465e9.5.1792749843285;
        Fri, 23 Oct 2026 03:04:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:02 -0700 (PDT)
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
Subject: [PATCH 0/7] Add support for the X-Powers AXP2101 PMIC
Date: Fri, 23 Oct 2026 12:03:54 +0200
Message-ID: <20261023100401.67592-1-olivier@mgcrea.io>
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

Every patch builds on 734bef548a96 (v7.3-7363) with W=1, passes
checkpatch --strict, and the three bindings pass dt_binding_check.

Open questions: whether extending the axp20x drivers is what you want
here (the alternative is a driver of its own), and whether programming
the charger from the monitored battery at probe, read-only afterwards,
is acceptable for the battery supply.

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
 .../x-powers,axp20x-usb-power-supply.yaml     |   1 +
 drivers/mfd/axp20x-i2c.c                      |   2 +
 drivers/mfd/axp20x.c                          | 107 ++++++++-
 drivers/power/supply/axp20x_battery.c         | 221 ++++++++++++++++++
 drivers/power/supply/axp20x_usb_power.c       |  86 +++++++
 drivers/regulator/axp20x-regulator.c          |  88 +++++++
 include/linux/mfd/axp20x.h                    | 114 +++++++++
 9 files changed, 621 insertions(+), 2 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

