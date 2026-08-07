Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8539A3DB96B
	for <mfd@lists.linux.dev>; Fri,  7 Aug 2026 04:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078314; cv=none; b=gvuAtKPY9igvwXoaJaAlfAfNch1NrlNukxnBaPppa/g6ZATPgcoIRowsss/20rzAedRH5rOzzPmOc0QbFfUkLZc/BvxIJU1+4qWU2Vz6XZgieqE5zeC3sPq3YsS+w6HdsFzPIwbidvK5h7QBEh+7dQSByOFqsqq40q/Iw91Gpj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078314; c=relaxed/simple;
	bh=PENvm0RH5peOe74MsvZzT30c7H7WNN1y3i0ZiSC/dKk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o/mn46kgwK1T96CO69YLeznXuQWj6QfzLNW/PdE6UTxYt5kKQDdk69frcfJzET/ft8yaiggLD/FMetw50o2u3KIEMjW1a1XPVK3rKGn4nrNXgArzgICs9jW26+xkumdh7Pl8US913WWeeATcp1rDzp2+93iJsMhc+Ljk1YseJSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay/OJpyF; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay/OJpyF"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6ae50ba83efso962457eaf.0
        for <mfd@lists.linux.dev>; Thu, 06 Aug 2026 21:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786078297; x=1786683097; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kq/dlWVRI2Avr5GzB6iyWp2eRKjm173hdqa7VNHE6z0=;
        b=Ay/OJpyF6SLkfEzPhMYhQBYsKYFGfB/NGCCk1cDWkRBYlhiI9HldL5CQuf/VqXzOBJ
         EieUuUXPtZ1ZaAF41m3FQ2CDYacSJBZsw2joecGLG3fr6qwILWcYAfzueVqWkVbgnlVc
         bf9RfPQML+BQewQHx+XgZnnMUlGRIj1PhHzrWI+NCr5xpV5yMrsPtwUbvKhwbXp/Nv5V
         2x+fmyWJRCH4vN4eKRvlqwZzQASDgTEpPHhfY+pWrkzGDYN++O4i3Aafr+ZTaft/gU/0
         HcLLdFMf83xFqs58seohTiohkLyBTSNxco9CYGwI2O18Uz02AMGK5spSnD86tUryBf6Z
         Jztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786078297; x=1786683097;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kq/dlWVRI2Avr5GzB6iyWp2eRKjm173hdqa7VNHE6z0=;
        b=pHms+IzBHIMv+D86dZwBMCKHSPqMTuytCx5fQdu8aIsHlyi2HRAIIVJlOSraf8DNJI
         zLpKk1ESbPbC0fx8bah+6s2kgYi7cd0T/4NaH87IaK/J4FGQjougEnXp7H7yzVhCeIvG
         ECkRF5K+AYTgcTiuiFPrw/w0OjzyYPQhc9N6v3i2iicqltqo1vY4r2FqB2QWki8skPtk
         ipeqFimL3gwZaN8R/MKB4j1FfDDpbdO9r3cC4CDGSb5vWmmXA2QD6scZVHg0Z+Vy/YSy
         5PM8dn/lR9HG8Anrn8pcE/4wfEorgKPCLomF5l+VV4HuG+wELit7YVid3LrCoCm+S+kL
         6S5Q==
X-Gm-Message-State: AOJu0YzXwuLM9+XFHTwEMX2mguL3P097GBXi+ksgowSlDsJHlcEuq9Cr
	pQfPqRHBSpzB2C5uPWmMEuOwCiGg59ROxr0Qq5/YHj+zlq+Pu7tDy6pf
X-Gm-Gg: AR+sD13zKxRBlJ0CbiZkgM9ZppUKoBKnT2bayrAAthNEMcxpcELZ8SETVyOb46eJ5bb
	kqfShk7/T7YViXvP4/NZeILStRnyGIei7Yw9r1OWbxHZvQZyNHqw/8hJDM1bsoz5ygx+blmHfdp
	JHdMluxFQpzvQ1qFmSvVbluFCvd/jmLdtv83h/CZ6Enk+DFzxzWPsbr06032I1u35syzs7GMRvy
	IJxPqtxc4e7x+oirZv0CLE7PhSUMyo4xZROV4duj9uHyhwRAMVuclO48OXHHbB41fD+yE/eZ4q3
	GO6M8/mANKQZJp2k3dLjl0z4p3wfZk5IBoy1+Fa23DP/Nic5wjRaxk4v1ZvFKm2VE1hcA33qxYW
	LbZqY3xtMi3TiEc12jgIvuSZmY2xAAyBW6325G57/hZTpMD9lm53qBfUlEM8GDqdHYMhCVuvZQK
	fHwoxuDO3OIKx6r2GTrA7lzVAJazS3x/UkPlnlQfOIbRO9m/GHMePhUG0yvbWVHWZGd8d6nxvrY
	9sEAkwJmNi2arQh7sbHhS+uHgCEon4uPV1bxRHLurxPv3WIH22PJdWwo3Ss8CX+43QS0NP6R+3x
	CQkywaRfX1vGJrF4NAOB4MMsQwFN8xvfzgKTMWhUE5GU8jrSX26+tuuKJhXDqK70kmN7EeikG46
	35p/vCKOScyb8+aa1
X-Received: by 2002:a05:6820:220f:b0:6ae:84e6:2ded with SMTP id 006d021491bc7-6b016e4d786mr4951415eaf.17.1786078297390;
        Thu, 06 Aug 2026 21:51:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02bbbf755sm1519726eaf.2.2026.08.06.21.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 21:51:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v4 0/4] net: phy: add X-Powers AC200/AC300 EPHY
 support
Date: Thu, 06 Aug 2026 22:51:25 -0600
Message-Id: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OQQ6CMBREr2L+2m9KCwRdeQ/DopYWvpHWtLWBE
 O5uQdcuJzPzZhYI2pMOcDks4HWiQM5mUR4PoAZpe43UZQ2c8Zo1jGN430eKKNXEGDqD3WzlSAp
 TgedSsk4VleENhwx4eW1o2uE3sDqi1VOE9utkzkOruLG37EAhOj/vP5LYG7/J6t9kEshQcCV4w
 WRteHXtR0nPk3IjtOu6fgAjtYl14AAAAA==
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

Version 2 represented those control ranges as separate devices. Version 3
instead modeled each variant as a standard Ethernet PHY package with one
forced-ID link-PHY child. The package reg value is the link address.
AC300's control range is a fixed package-relative offset of 16 and is
accessed with the PHY package helpers; it has no separate DT node or MDIO
driver. AC200 references its I2C MFD because the corresponding control
registers reside in that multi-function device. This revision retains that
model and tightens error cleanup, power sequencing and diagnostics following
review.

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

Validation completed for v4:

  - complete H616 Buildroot kernel, FIT and SWU build from nand-rebase;
  - arm64 defconfig vmlinux and module builds with W=1;
  - x86_64 allmodconfig object builds with W=1;
  - a built-in AC300-only configuration with I2C disabled;
  - dt_binding_check for both new schemas; and
  - strict checkpatch checks for all new source files.

The AC200 path was hardware-tested on an H616 board with current v4. The
driver read the packed SID field as 0x001, selected AC200, dynamically
activated the fail-needs-probe I2C/MFD path and reported AC200 revision
0x101 in package 1. The link PHY bound at address 0, applied RMII mode,
negotiated a 100 Mbps full-duplex link and passed bidirectional network
traffic and cold-boot testing.

The AC300 path was hardware-tested on an H616 board with v3. The driver
read the packed SID field as 0x106, selected AC300 without enabling the
AC200 I2C path, accessed the control range at package base plus 16, bound
the link PHY at address 0, applied RMII mode, negotiated a 100 Mbps
full-duplex link and passed bidirectional network traffic and cold-boot
testing. The AC300 reset-preservation change and removal of the unsupported
MDIO-error clear/readback sequence in v4 remain build-tested.

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

Changes v3 -> v4:
  - rebase onto current net-next
  - always restore the PHY page and release the MDIO bus lock after a
    page-selection error
  - preserve AC300 external-VDD configuration until package status identifies
    the supply arrangement
  - remove the unsupported AC300 MDIO-error clear/readback sequence, which is
    absent from the BSP initialization
  - remove AC200 post-reset waits not required by its documentation or
    hardware testing
  - report the failing AC200 control register
  - follow MFD subject and driver-data naming conventions
  - use the AC200 teardown callback directly, follow reverse Christmas-tree
    declaration ordering and use a named I2C ID initializer
  - use named input-clock rates and simplify MII/RMII selection
  - avoid blocking on the AC200 supplier lock while checking driver readiness
  - Link to v3:
    https://patch.msgid.link/20260805-submit-acx00-of-dynamic-v1-v3-0-32c3210a6f25@gmail.com

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org

---
James Hilliard (4):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support
      dt-bindings: net: x-powers: add AC200/AC300 EPHY packages
      net: phy: add X-Powers AC200/AC300 EPHY driver

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  69 +++
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 208 ++++++++
 drivers/mfd/Kconfig                                |  11 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 176 +++++++
 drivers/net/phy/Kconfig                            |  11 +
 drivers/net/phy/Makefile                           |   3 +
 drivers/net/phy/xpowers-acx00-ac200.c              | 388 +++++++++++++++
 drivers/net/phy/xpowers-acx00-ac300.c              | 404 ++++++++++++++++
 drivers/net/phy/xpowers-acx00-main.c               | 536 +++++++++++++++++++++
 drivers/net/phy/xpowers-acx00.h                    |  28 ++
 11 files changed, 1835 insertions(+)
---
base-commit: 4fa4977a0d900f936bcae5cd2c510be5554e8dd6
change-id: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

