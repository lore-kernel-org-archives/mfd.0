Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FF3A83A9
	for <mfd@lists.linux.dev>; Thu,  6 Aug 2026 01:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979472; cv=none; b=seLy5rhjLTe95N85l/2RSL2RBPoJ2UTnUvPWiBXeYhoyp+sP1TfKc4okzVamCI2XiONQS7eSf5yPdjC01fb2dxlwuLlDsxUor3U9uLDyYqn/uu0+ETOHa42+G6jBL3bUs5Ogg5kH2KUQ02JWE8kQlW/6fd4M37muJ1/U4abS784=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979472; c=relaxed/simple;
	bh=qQFBJzFLMWyKwoFpmu6UQo1ju/fdD1C3Jwgv1sGJZkg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XbLih5Nb2gbV6RiPmg0iSBNcDvRl/2gjDrj4eFS+PvuwmseRKCOCDhO3pRhml5xfACyDKEAxoRVjDRNGGu6CFFUZX6XGeiVZEnUXVA0UeMggrpCon3Z0es/iYATtDOdWL1xZfVJFB6dnZIFbrimhFktqKEo6OHmTKu2Nra0vigs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6Jyj3aW; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6Jyj3aW"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a45b3f0becso1036894b6e.1
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 18:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785979469; x=1786584269; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hgNyPDmiWf2JyFcdGsGo7TCFxm1Nw/oDsN4ntI4YuJU=;
        b=l6Jyj3aWxkSVVObjUXYvzgtXVELdc/ePMeg8Wc3DgJKeBM7BX5jYW9BWdodTbJxCsG
         mHLos9Lum1Ol6k8oeDavYtusR1dfDvDRhAkK4tEkSdURwk28N+XnoPeHAbjp0CzX3r0r
         gj2HttmcT1C1pWDIb8cP+JA28m7sKhPDZMCU0QtBlqdqoTs/dwrFOPV4aNQMzFi3w4xT
         fU47W2KeK+5v1PBL+67lOGOuzu4h18CwM6xKzvh9pxnXTf3PQc6NmvZyF5LKPvdQ2B6t
         2fQj1+MWPIpy8YOVEeOUCm4h7695JuHAl6pxOIu6qQQQf8W/cDckgVM40WgkLz6+LxNC
         NWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785979469; x=1786584269;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hgNyPDmiWf2JyFcdGsGo7TCFxm1Nw/oDsN4ntI4YuJU=;
        b=mIr6tF3+umUDr7TgTWfhApx/5Onf9ZVnKw8xSRD2FjGmrQX/8wLREpI9as2hN1U5gE
         4MbSWzRCWRvLet1jhW5WqU8ptTNGy1oB1K1p9/3etjphkDK8pmoN6lzt+Gt37mC6Vkij
         HB73pPFy+uKyRK/Tahmo2ijgZ4ZXMlY3NHWxmSZpccWSZfHf2V7WnOYwerY+RICYInq4
         IbgArZMCyra2wo9GQTHFsnb89dhXTVAsnb6DHp6hpG8FV5IcamysMfuQRZF/+Ih9bqbe
         fG5t7TJjSsQ+tOwNDMoPEXUUW8TX0sDVWHLoKdMWCeSNqHOydxEfJejULyN9KKPKd048
         AtTA==
X-Gm-Message-State: AOJu0Yy1XZgRSteCk1tO35Lpp8a2rCGdR72iHQHaXsFph4MJYKR1Ag7D
	GBXNhyRZkYnyOhJrghrucQXFwN9A/4HJljSxELvNG3M10w/HxshCfEH/
X-Gm-Gg: AR+sD13i7fwlTZWttX76X3uzCmipjaslUJvqMQxniUsdPcqZENkdDZTDtjwG7xqdK9x
	cbkbXNlIuLXIjnmqssnnicRNAVau1DypvoqOCRmPnXtcb+VzIcY6dxMZ1y1os3TWBtUeSU+t2S0
	4K3mV85+vTV8UvLu1lGHRO+w+ffTTxA8Ot+6mC9LNtrgMKrXkSjqw+cESkWlK1Y41jLAdeQ26p6
	de1i4JvT/m91U5j4MnAee9PcTlIdGQimZnyQ7st+Wrp9tyMicCG79CbXwFQbpbjJGftQiZg8/sg
	cGgCr0NLwrbEbHMfbWbA7ZAytoM2JXxKCkf8UcUe9QnCNct/FP6CFGA4lAziDkwbB38ngx+O/JV
	NR4z5mHKX2pey5eQDlJqOhy1x9XU/RoMmJirLKDqHXHw1B+Ei32N9p68FFE40PpHW1Vkv/2FLEq
	TFSvIdE6faMvPda40Jy/pQW5NcdVLb1Ee0cEGNpOJz3haRBgS/AD46SSYAFoDrSQxG+f6J6y1Va
	3PcwpidSmq60FLAIPu4U6rch0Ol7j1zZ2rkLmOVT0ChHXVDCd5WktzLbAMJ7Pcl0V+FUsaNWmBY
	XlkfqRQUZ9ugmNEebQk4qkQyczGNj/e6ceprwThbcvYvXwuKHB3xOGMNDGGnvyt7GPtOP/A+K10
	L5ZlBKxW4uSKQqD97
X-Received: by 2002:a05:6808:c14a:b0:486:4892:d553 with SMTP id 5614622812f47-4afadc03178mr6289641b6e.0.1785979469032;
        Wed, 05 Aug 2026 18:24:29 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae75db20sm3274755b6e.14.2026.08.05.18.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 18:24:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v3 0/4] net: phy: add X-Powers AC200/AC300 EPHY
 support
Date: Wed, 05 Aug 2026 19:24:17 -0600
Message-Id: <20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3QrCMAxA4VcZuTaQxR+mryJe1DTVCOukraMy9
 u5WvTwc+BbImkwznLoFks6WbYottpsO5O7iTdF8a2DiAw3EmF/X0Qo6qUQ4BfTv6EYTnHs87hx
 56feBB4YGPJMGqz/8DFELRq0FLv/TnIdK+dqwrh8UZN2iiAAAAA==
X-Change-ID: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2

The AC200 and AC300 contain compatible Fast Ethernet link PHYs which
report the same Clause 22 identifier and use the same link-side register
layout. The link endpoint is inaccessible until package-specific control
registers have powered and configured it.

Version 2 represented those control ranges as separate devices. Following
review, this revision instead models each variant as a standard Ethernet
PHY package with one forced-ID link-PHY child. The package reg value is the
link address. AC300's control range is a fixed package-relative offset of
16 and is accessed with the PHY package helpers; it has no separate DT node
or MDIO driver. AC200 references its I2C MFD because the corresponding
control registers reside in that multi-function device.

Fixed hardware uses an AC200- or AC300-specific package compatible. Systems
which can contain either package use the ACx00 package compatible and one
packed SID configuration field. Bits 3 through 0 carry the analog
calibration, bit 8 selects AC300, and bit 9 selects its low-calibration
tuning. The driver chooses the backend before acquiring any backend-specific
resource, so an AC300 system does not instantiate or access the AC200 I2C
device.

One xpowers-acx00 PHY module binds the link child, joins the parent package
and runs the selected AC200 or AC300 backend. Only the link PHY registers a
driver. The backend source files are linked into the same module and merely
keep the I2C and MDIO implementations separate. Thus the PHY driver owns the
complete Ethernet PHY while the AC200 MFD continues to own the shared
mixed-signal chip and its regmap.

The series contains no generic MDIO reconfiguration. It has no hard
CONFIG_OF_DYNAMIC dependency: fixed descriptions work when their provider
path is already enabled. When CONFIG_OF_DYNAMIC is available, the AC200
backend can activate an explicitly marked fail-needs-probe I2C/MFD path
after the packed field selects AC200. The AC300 path leaves that candidate
disabled.

The common link implementation performs the vendor analog initialization,
supports MII and RMII, preserves automatic MDI/MDI-X, and restores package
state across suspend and resume. It preserves standard MAC-managed EEE
advertisement while disabling only the vendor PHY-autonomous Intelligent
EEE mode.

The four patches add the minimal AC200 MFD binding and regmap provider,
then the AC200/AC300 PHY-package binding and combined PHY driver. Board
Device Trees and optional PHY features remain outside this initial series.

The AC200 portions build on earlier work by Jernej Skrabec and Andre
Przywara:

  https://github.com/jernejsk/linux-1/commits/ac200-v4

Public AC200 and AC300 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation completed for this revision:

  - arm64 defconfig vmlinux and module builds with W=1;
  - x86_64 allmodconfig object builds with W=1;
  - a built-in AC300-only configuration with I2C disabled;
  - dt_binding_check for both new schemas; and
  - strict checkpatch checks for all new source files.

Hardware-tested on an H616 board containing AC300. The generic package
driver read the packed SID field as 0x106, selected AC300 without enabling
the AC200 I2C path, accessed the control range at package base plus 16,
bound the link PHY at address 0, applied RMII mode and negotiated a 100 Mbps
full-duplex link. Bidirectional network traffic and cold-boot testing
passed. The AC200 backend is build-tested but was not runtime-tested in
this revision.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - model AC200 and AC300 as standard Ethernet PHY packages
  - remove the standalone AC200 and AC300 control bindings and drivers
  - put the common link implementation and both private backends in one
    xpowers-acx00 module
  - access the AC300 control range at package base plus 16 with PHY package
    helpers
  - access AC200 package registers through its referenced MFD regmap and a
    managed device link
  - add an ACx00 package compatible which selects the backend from one
    packed SID configuration field
  - combine calibration, package selection and AC300 tuning into that field
  - optionally activate only a selected fail-needs-probe AC200 path when
    CONFIG_OF_DYNAMIC is available
  - preserve standard MAC-managed EEE advertisement and disable only the
    PHY-autonomous Intelligent EEE mode
  - reduce the series from eight patches to four
  - Link to v2:
    https://patch.msgid.link/20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com

---
James Hilliard (4):
      dt-bindings: mfd: x-powers: add AC200
      mfd: add X-Powers AC200 support
      dt-bindings: net: x-powers: add AC200/AC300 EPHY packages
      net: phy: add X-Powers AC200/AC300 EPHY driver

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  69 +++
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 208 ++++++++
 drivers/mfd/Kconfig                                |  11 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 184 +++++++
 drivers/net/phy/Kconfig                            |  11 +
 drivers/net/phy/Makefile                           |   3 +
 drivers/net/phy/xpowers-acx00-ac200.c              | 374 ++++++++++++++
 drivers/net/phy/xpowers-acx00-ac300.c              | 415 ++++++++++++++++
 drivers/net/phy/xpowers-acx00-main.c               | 536 +++++++++++++++++++++
 drivers/net/phy/xpowers-acx00.h                    |  28 ++
 11 files changed, 1840 insertions(+)
---
base-commit: a23b36233d4103def55dc8cf65698106d0bd1e62
change-id: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

