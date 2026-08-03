Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DBB23E325
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734124; cv=none; b=G1u9msDZ+F61ifVgrBqJn/TDxVoMasrj7kxJIJN6rBO+5KxwS4YIM256QtTJevb6tDD3Aakyl+tr3tjkLlj0q6wQPumo4lqWG60Nu20D1L9Ml3k0RG7Kjrm97gyCb433N+bjJVxQhWZu1faaGhLmOM3i28VXrkYgtkJIxGdavfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734124; c=relaxed/simple;
	bh=Ty+uKA3eiiRiyu4mre481GMA0Pl83SsAKEiKhYGpnrc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s7b78WzoJ68EFqElFCRhj8OUkUio69BASz9kIl5lNG5/qslYcmJDTvi9jrXu9O2AMO/DhPHKUCbGy6v64IdssayKcUugILH/cvIHNSiC9Vq69Qaly87481Z3YpyQHFHQr4KjIUbJTQTrvDjHQpNWHZExOe8UJAblr/bH9hUytSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyRDsBWG; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyRDsBWG"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f0167e59a3so1503732a34.0
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734120; x=1786338920; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=74sKA3Fp2KekMkzYHPtGWFK+N4ABlBFoAFD2YVwF/bc=;
        b=IyRDsBWGX2XkNwahN5PTadBA04M2oSFypwwvtKGBlj6B2Lqkj869qizzULJEHZK0aq
         4CqsGIOWA+AG2Fn2sMid+7CelP5Pxqa36z2gR7jIDbzE85WCvVD3ddvVfqbKzGqqrZzU
         9TT3QULZILb/JC6XC6O2LUpHNjbJ6T2yzKXqNli8CjK0II75Jl7jH143xo8ccoILJN1b
         4XlaQnd9UgkUvHO+zgbV9Ay3Z7d19jhmj+3g8LC7QFCGoIiNC5exoErr3Gc6z2bmD7ue
         IkXTkcH40+d/YszX5SaLeql2dLHlMnmWn26AdQXiZxcwc/WWQiVEseXU7NaZu9UMdpWU
         +cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734120; x=1786338920;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=74sKA3Fp2KekMkzYHPtGWFK+N4ABlBFoAFD2YVwF/bc=;
        b=SiwXZmAFyT833q+0cw74yF1Z2pRSujmGeU+nRls4w9gNwCTealDnGgGjLRmpKGVI2Q
         hQV0ftHYoUr8zhYDxC1LPszIxzttqhhprxWVsbI3u2IubOqL1u4uJ2fk41nB9bGjbTav
         CBny/9QYJRFn83AogzGRdGzyKnVIX3jmzdBhBYz16TrnN1/m2oept9IyTsgF1VrmNEqt
         4Ff0yrRnUeKIOuwVKT3iHomKyXPXgp4rmhYs9A9v4COsm7vYMuHcbZfu45gP1QXQngXR
         7c9qcO6E34Jo6w6/CsmIqbwyNqIRdSjVNDixXExJcyLNzO+lDZZlBU1Hpb/01PJjv2bv
         ZbFA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8NuZMiAHUgG182YabrW1Iym8o6YX52ODapKuwlcQg1EU4pk/gkSvI7aYPWLYhVHG/gJU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzW/9RrtmwTEKEMc7Bf34kkNYwm9wQ12bat7PtAwiBCmgThdtfy
	FMP0K63eTzJD5gQ48B5+HR4+fufnhvz9O4LfdDKcjTms3Y//+rg5aYdu
X-Gm-Gg: AR+sD13HYgse8ZROyi9DRcFeeNTdKFM4aX2Y9fa+fKb6q3+zwl0xK9M3bMHh9HIfKOX
	rJ2d2nMMsOWf6waWbmsZA2ru0mpnYtItKzhHY7jIfDCQkJ3ZPYVf6m7i/aleTwouy2SL4kUlaWu
	Ji8USt2NaYGR6FLzvEZaFKmlcQw7YD20WXc8/aMsmAqvznVlmA68/bdUlIwzmkrW/nZb8B/omN8
	ARyzmPN9Xcw52LdRU8dR3cgcL3Z7MPyJlf/W+lrdD0Wq6LRRvi1wKTgBlqEWhXSa8Nqcnkv7o29
	X36nsnA76XDjhSOBVF0DDbCAjah3NihhGtcpXwvyqq9DX6rmYy97S8wp25Dd100scr3RidQJLaC
	KhLKON7FgTbKj94lGusyB6sSnY9ZpjLVAtCMOkOd8+RobetuUteGd24KKBowqbmEJK+T6c8uuNC
	jntEySPHJlLKblWJDzSNFZ2LQuWj3GN4fn5t2F+QERI9ZL519mS6G4kuooXm9prN9L6qW2JhwqN
	A9I5d+DFb23xDFRHp6o8Ykh0V3uUdvD53G7bxSPbNjqomFl+6Log+8UmmZtU0zbESCHpsRrNZbF
	ZuMMV/0acdfMmUy/9ueANMeTUXm87f3s+PijkjHyRPOw19b16XXwMq0KLf5R8fWAnb4NDlRG2V+
	Gp1va5g1pJSb0zM5E
X-Received: by 2002:a05:6830:488e:b0:7e9:cce4:803b with SMTP id 46e09a7af769-7f196e9595cmr15400429a34.8.1785734119585;
        Sun, 02 Aug 2026 22:15:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
Date: Sun, 02 Aug 2026 23:14:10 -0600
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Oy27DIBREf8ViXazLy2CrivofVRY8rlOqGBqwo
 1RR/r3E6fJIM2fmTiqWiJVM3Z0UvMYac2rA3jriv2w6IY2hMeHABzDAad3cEldq/Q2A5pmG32S
 X6OmV0VFaCJ6pmRtOmuCn4Bxvu/zz+OLW/ka/Po3/iYKXra2urxhZsFa7r07d+z6qQTDFOVM9G
 7lRI2W0xPathP6EKW/hw+W8nmPqfV4OT6uzFWmD9nPqQCunpZHMBYBBWeGCFVKC0cJrqUdhcBj
 dYMjx8fgD77ZBiw4BAAA=
X-Change-ID: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The Allwinner H616/H618 secondary EMAC is commonly connected to a Fast
Ethernet PHY in an X-Powers AC200 or AC300 companion package.  The two
packages expose the same link PHY ID and largely compatible link-side
registers, but require different control paths before those registers can
be accessed: AC200 is initialized through its I2C MFD, while AC300 uses a
non-PHY Clause 22 control endpoint.

Some H616-family products were shipped with either package under the same
board identity.  For those systems, this series uses a SID NVMEM field to
select the control provider at run time.  With CONFIG_OF_DYNAMIC, the link
PHY enables only the selected fail-needs-probe provider, so an AC300 board
does not probe the unused AC200 I2C controller or claim its pins.  The same
drivers also support fixed descriptions without CONFIG_OF_DYNAMIC: a board
can reference one enabled provider, or enable both candidates when runtime
selection is still required.

The series adds:

  - the H616 EMAC1 binding, stmmac variant and controller node;
  - generic MDIO OF reconfiguration support for PHYs, packages, scanned
    addresses and generic MDIO devices;
  - the AC200 MFD and AC200/AC300 EPHY control providers;
  - the shared AC200/AC300 link-PHY driver, including calibration, power and
    reset sequencing, MDI/MDI-X, statistics, EDPD, PHY-managed EEE, package
    LEDs, interrupts and Wake-on-LAN; and
  - H6 and H616-family device-tree descriptions and arm64 defconfig support.

The AC200 and AC300 control and link paths were exercised on H616-family
hardware during development, including link traffic, address handling,
ethtool EDPD/EEE controls, statistics and LEDs.  The H6 interrupt and
Wake-on-LAN description still needs validation by an H6 hardware user.

This series depends on Richard Genoud's v7 H616 PWM controller series,
which provides the bypass clock used by the companion EPHY:

  https://lore.kernel.org/all/20260703152215.192859-1-richard.genoud@bootlin.com/

The PWM patches are an external prerequisite and are intentionally not
included in this 21-patch series.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (18):
      net: mdio: factor out OF child registration helpers
      net: mdio: make device map changes hotplug-safe
      net: mdio: support dynamic OF device changes
      dt-bindings: net: x-powers: add AC200 EPHY control
      dt-bindings: mfd: x-powers: add AC200
      mfd: add X-Powers AC200 support
      net: phy: add X-Powers AC200 EPHY control driver
      dt-bindings: net: x-powers: add AC300 EPHY control
      net: phy: add X-Powers AC300 EPHY control driver
      dt-bindings: net: x-powers: add AC200/AC300 EPHY
      net: phy: support configuring PHY-autonomous Tx LPI
      net: phylink: allow PHY-autonomous EEE without MAC LPI
      net: phy: add X-Powers AC200/AC300 EPHY driver
      arm64: dts: allwinner: h616: add ACx00 EPHY resources
      arm64: dts: allwinner: orangepi-zero2w: enable Ethernet expansion
      arm64: dts: allwinner: h6: add AC200 EPHY resources
      arm64: dts: allwinner: h6: tanix: enable AC200 EPHY
      arm64: defconfig: enable X-Powers ACx00 Ethernet support

Richard Genoud (3):
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1
      arm64: dts: allwinner: h616: add EMAC1 controller

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  118 ++
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    |   18 +-
 .../devicetree/bindings/net/snps,dwmac.yaml        |    2 +
 .../bindings/net/x-powers,ac200-ephy-ctl.yaml      |   46 +
 .../bindings/net/x-powers,ac300-ephy-ctl.yaml      |   77 ++
 .../bindings/net/x-powers,acx00-ephy.yaml          |  217 +++
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi |   45 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   73 +
 .../boot/dts/allwinner/sun50i-h616-acx00-ephy.dtsi |   61 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   51 +
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  |   13 +
 arch/arm64/configs/defconfig                       |    6 +
 drivers/mfd/Kconfig                                |   13 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/ac200.c                                |  302 ++++
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |   21 +
 drivers/net/mdio/of_mdio.c                         |  508 ++++++-
 drivers/net/phy/Kconfig                            |   30 +
 drivers/net/phy/Makefile                           |    3 +
 drivers/net/phy/mdio_bus.c                         |   14 +-
 drivers/net/phy/mdio_bus_provider.c                |  140 +-
 drivers/net/phy/mdio_device.c                      |  235 +++-
 drivers/net/phy/phy.c                              |   35 +-
 drivers/net/phy/phy_device.c                       |  127 +-
 drivers/net/phy/phylib-internal.h                  |    4 +-
 drivers/net/phy/phylink.c                          |   35 +-
 drivers/net/phy/xpowers-ac200-ctl.c                |  330 +++++
 drivers/net/phy/xpowers-ac300-ctl.c                |  454 ++++++
 drivers/net/phy/xpowers-acx00.c                    | 1457 ++++++++++++++++++++
 drivers/net/phy/xpowers-acx00.h                    |   27 +
 include/dt-bindings/mfd/x-powers,ac200.h           |   13 +
 include/linux/mdio.h                               |    6 +
 include/linux/phy.h                                |   36 +
 33 files changed, 4384 insertions(+), 134 deletions(-)
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282
prerequisite-message-id: <20260703152215.192859-1-richard.genoud@bootlin.com>
prerequisite-patch-id: 8c447ebd677ea7bf9e63a77d34d8fdaa05eebe7f
prerequisite-patch-id: c7574f9c0e2571ce8c6129ac6db7aa959c986ef3
prerequisite-patch-id: e8b00768102951244927ecf054314f6e02f9ff1b
prerequisite-patch-id: a3e2055ed7f3b5751a3e02d57e674b25ee404ff7

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

