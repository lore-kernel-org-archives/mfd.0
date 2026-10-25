Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792904600;
	b=GFUYBVvDZKt7RL8lhItkbv6D90TOEunP1J+D/S80kpKg/wLxqiT4jGwy/mdnt88N3MgR
	 xwq9O+oOxFyxrrvJ0LZb6YN1LnEdOUgCIuyoDAILn33Xyh+zmFRw3gDPoI39tDWmOEC8T
	 reUdbEz5W8kDNlyqtMACWIz7eM63yf91bnKJFS8x0txTdlrIIrnV32aZtLhXiadIedwuB
	 R7toWMUnZXJoOwp9gmXaWe+jwRURKW1WVduMiKv7/kl70TpL8lBbifor0HFldQL/HZb2p
	 km2udT6bvnd6BQXO39VM4z7xfAHm6L9DFbUMNScEPh4NIG0LUxow9RtktXhZ5F8KbSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792904600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=4DzG5D7v2La/sD4DyNjoiERdLKEODMg4TWNG90dgHBE=;
	b=Ti95f3nAScIwTMhO/75p0kTnzRtSH4yLYw0oQZ+vN9CarU6AWAYf0jKWWkBUEQAhrM4k
	 MAMVSzYoDsEsbeOtaCzPCl2omxUU007GOIw6FvgnWm9D1Nvcs6ci2iLLzLICt3UOqK+Wn
	 Kd9lnUW6z4Bfpttj6zeapZMdg8541agZ3V2CtfUFLig5C1wKvi8jmabBcTlmvhff/x35v
	 DzjxjIziLvivEhQXjOrWtm9RhAtDGis7zrPlaG5Ac2IkzmBbqrR1lpeJ7SGUjGgzz0LYM
	 NLYzEW5SL1x72/o8DDP0PFMBCNCD86+ycOVdOI6FI/tQcNExIj/yXqOisLU8vdKfbzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r2E13wtQ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEAF606A31D
	for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 05:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAEAF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r2E13wtQ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35943f55c06so2738013eec.0
        for <mfd@lists.linux.dev>; Sat, 24 Oct 2026 22:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792904599; x=1793509399; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4DzG5D7v2La/sD4DyNjoiERdLKEODMg4TWNG90dgHBE=;
        b=r2E13wtQ6huhjE3eDL9D6VyJRcenwTCigB5u2eirvUZCwPKKt/sSOaul8O7tp4B/gR
         m39cvFPYkHy2/syzMFTJmHSF7Vj8vW6vNxLdJt0YcbSTNjUlnZrPNR0YPUQPicgzr1MQ
         R1kFKh/Ge/LgqlzLNfq5bj24z5SF8+C8rFuSwQzikijVZGoHuR2e41mrE9/aJs2cPZ3j
         naRkyKpoBdUO4hI4NGf2G+rR42KTrVY2ACOUQ5FkaCNoHfYmZc1Hmeg+lVCW5OIcdWio
         fOgV4r5+W7a3mNRJsyUg2u4r9S0v5VsIDB9Lv8qBKIyvzphteBP7KEoa+3+Ip0HcIc6o
         X5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904599; x=1793509399;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4DzG5D7v2La/sD4DyNjoiERdLKEODMg4TWNG90dgHBE=;
        b=Wt+JZ3ifjF2ODvlIa4zjaA+In1gXu83L2gLjOhpVnJ4cJPfLQ8lnIIumS+DvpZ4FBL
         Cs/HIeoet4x0TF0Z+5EN12OTIgz0erO8AB/Sgi/K3pnJlP7Bv36gBSowMKx0tbtihgq3
         1xHxXaDITe1juB7Y9URrxCRVZHIcTKLbRAKaSD3POckmFOTKIwfYUqWHCx8xEZLfnDwB
         DjVSdSBjD1TqzSbRVevW0/nqd2ADcB0Wq/ulFn6/5KOW4pWlsyk62Yu9tU5sO4P1l0dw
         x63ZWHVmlLQTegQ7V0gxZh24ED+rnybjg6mjmMrfs80bASq06jfQ3GcPdAappcz2gX3V
         4unw==
X-Gm-Message-State: AFq9FYIKmDole6sHH3OzE4tIMbFzwyly7VwZA0VrqSdJhYeTLdfGIwMk
	OqD6ANOBmphHxr4t3O8iQQFA5lSlVZpKQuIyGDMw7gL4IYz2J7X3OkNH
X-Gm-Gg: AYBFou2qdRubyf2VMwNrnZGDAZ7TKkHyvUKTSXa11ApgiAi3JWYerrBNnOmDHXLCCmS
	6IRruTwX88LbM/fT5NYhKMUbJN39hgBgWVyFq/+iVEmMYllqiijbdyfw7vc2obikarmgegYWev+
	WGJpetSf1rj5Dp/URX4zRTs1ufHMIWudz3wvFublj8XISkdgEL914g2t8+vOdesFG4aTp3aQNlg
	18Dm6Cl5YEX8gd5qr1woelgdDJ1VGMPWg/VAVXwqGItgu3ZK2P4tAbBaFW/OMUXZagbspfDmxZj
	2V1xJmNz9S6grj+vWXdhb8pr3o9/Y5Z82VdA9diUAV5DD+bxmJ7YCkyBK6FY74AtZpWqprd8/Js
	rN4woSqa4Yi21F8DbYQjeIb5YFMeKN+OriiSEp6/IQ7VZzOpCHdLSQX61DOjW3X/HeCqVFs6qQp
	JtePAGPdOQrxRfr2YI0X3pdHMbKnjFbPtGqX0Z54QKjKdG70wpM0VQfuiYXPJm3Hw6f6GkPIZqZ
	pvuj/VWgnkZoxevP7r/c1NSFfV/43Qx5YGrO406Dl0uj0YsZBlEGlIix4L2e5IF6yyh//RAxmYl
	MUTdXsDOEGJH2ZiSPRaijdgblnDbZlRy/D8QOKcyOh8=
X-Received: by 2002:a05:7300:fc02:b0:366:eabf:ad9c with SMTP id 5a478bee46e88-369e8759b5fmr5049781eec.5.1792904598560;
        Sat, 24 Oct 2026 22:03:18 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm4710287eec.15.2026.10.24.22.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 22:03:17 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v4 0/4] ARM: s3c: crag6410: Convert to software nodes and
 properties
Date: Sat, 24 Oct 2026 22:03:11 -0700
Message-Id: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+N3WoC/1WOwY7CIBRFf8Ww9jXwwLa68j/MLCg8WqIUAx0yx
 vTfh7qqy5Obc3LfLFPylNnl8GaJis8+zhXU8cDMpOeRwNvKDDkq3oszZB3y7zzC/QmGyFrl0HX
 IWRWeiZz/+8RuP5VdigGWKZH+SnB16oVsUJxUqxAE2OCX9GqWmOJ9iuU6Bu0fjYlhi04+1+H1O
 VhwS2+hlne8338pCBykackqcx7k0O4q25cid6oQX6qs6oDO6EF3nXZur67r+g+Z/U5xJAEAAA=
 =
X-Change-ID: 20240819-samsung-kp-ceedd4f2f720
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e56a4

Hi,

This series converts the Cragganmore 6410 board to generic software nodes
and device properties, allowing the removal of legacy GPIO lookup tables.

We add software node propagation support to the wm831x MFD core to route
DVS GPIOs to the PMIC regulator, and convert the peripherals on the
Cragganmore board (PMIC DVS GPIO, basic-mmio-gpio, LEDs, WM1250, and SPI0)
from legacy GPIO lookup tables to software nodes and properties. This
eliminates the legacy GPIO lookup tables on the board and fixes incorrect
GPIO chip names from previous conversions.

Hopefully Krzysztof can finish merging the series through the soc tree
once Lee acks the MFD part.

Thanks!

Changes in v4:
- Patches 1-6 from v3 were applied to the samsung-soc tree
- Rebased onto latest linux-next
- Capitalized the MFD patch subject per MFD subsystem conventions
- Added Lee Jones and the MFD mailing list to recipients
- Link to v3: https://patch.msgid.link/20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com

Changes in v3:
- Fixed legacy property handling regression in the keypad driver by
  separating compact and verbose binding paths
- Removed redundant registration of crag6410_mmgpio_node from
  mach-crag6410.c
- Removed dead S3C64XX_SETUP_KEYPAD Kconfig symbol definition and
  selection
- Fixed missing newline in pr_err() message in mach-crag6410.c
- Redesigned PMIC DVS support to keep regulator driver changes minimal
  (untouched) and only use software nodes for GPIO routing via MFD core
- Link to v2: https://patch.msgid.link/20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com

Changes in v2:
- Patches 1-8 of v1 were merged into mainline, dropping them from this
  series
- Rebased patches 9-14 of v1 onto latest next
- Resolved conflicts in mach-crag6410.c
- Removed redundant "out of memory" error messages from the keypad
  driver
- Added an infrastructure patch to register and attach software nodes
  for Samsung gpio_chips
- Converted basic-mmio-gpio and LEDs on Cragganmore 6410 to software
  properties in a new separate patch
- Addressed DT bindings feedback on the compact binding patch
- Fixed proximity switch event type for GPIO keys
- Added support for software nodes in wm831x regulator driver
- Converted PMIC DVS on Cragganmore 6410 to software properties using
  the new driver support
- Removed legacy DVS platform data fields and cleaned up driver
  fallback.

---
Dmitry Torokhov (4):
      mfd: wm831x: Support software nodes for DCDC regulators
      ARM: s3c: crag6410: convert PMIC DVS GPIO to software properties
      ARM: s3c: crag6410: convert basic-mmio-gpio and LEDs to software properties
      ARM: s3c: crag6410: convert WM1250 and SPI0 GPIO lookup tables to property entries

 arch/arm/mach-s3c/devs.c          |  35 ------
 arch/arm/mach-s3c/devs.h          |   1 -
 arch/arm/mach-s3c/mach-crag6410.c | 234 ++++++++++++++++++++++----------------
 drivers/mfd/wm831x-core.c         |  47 ++++++--
 include/linux/mfd/wm831x/pdata.h  |   2 +
 5 files changed, 175 insertions(+), 144 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20240819-samsung-kp-ceedd4f2f720

Thanks.

-- 
Dmitry

