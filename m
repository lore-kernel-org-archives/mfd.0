Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E15A480DEF;
	Wed, 14 Oct 2026 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971331; cv=none; b=XQYKHtUFIWeXpe/Q8A5EkIY8Qol+twga2x/YBemUzZeQXCrP2M+0fhW7jYZ9dkEozQDUkNcKEYWCyBjCdJI3nnYzoi3tphUyoAfWUtZlo21ZJjl0kqzMYeqqGNK7coo1iXPViD9InBxIY/ctnbQaj6Pvfe/SyKBNOD3CayvYCfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971331; c=relaxed/simple;
	bh=OPz/XBGCo038L0hkGIP/UP/AQdEFNYFaKLrrZ/3fF3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nowL5Vf9Gv0ALSFdIVMEGLSDKDM6txTCveZYP0Ks5tH89jhO2U4g7ILfBA/dft+CpZzAHSQYH3L/C7DTakQelnQRVqtoszXxZv4JuP53beLYhzE5eJQnFwu7jAIp3zykzhHDMTZZ/ux3DZ2E1QjRSlaC8hVo1O4gMrayiBZpQEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnUJwydP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnUJwydP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07A71F000FF;
	Wed, 14 Oct 2026 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971328;
	bh=G/2llohs/KPObuHyET4p2v7xDP/sdVjpNeBSaMAKCss=;
	h=From:Subject:Date:To:Cc;
	b=cnUJwydPx59VjWSX4qP1fwUunlew0NdECFVPiPLXa476fOJAbMYWNB+3R022HRGyn
	 vE1Bi0+RW1DT0ObZ0xVMMc99VB706b6zKYEiCGoOgwroXczzigYEYOs44BLW6BrvEk
	 ArV0AvfxAb7cmDdqAkfb5KZlruwv9O7/nMu5lo5GGvrSTruFR02dNA3eBD8WZfaT88
	 ftJas8e7Qmd8HgzCguGjiURD17WV8b3ZrT80YWOG8zxJOqjeszJ7q9Q6TcozocER+e
	 lWG4mc9fY/OnipeVBlip083SJY4OGzMWT7Y01+s/DeJHHlOCWJ6eZjcZjM1XxI3/iW
	 Xpg6HP63e1AtQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH RFC 0/5] BCMBCA PMB reset controller
Date: Wed, 14 Oct 2026 11:48:42 +0200
Message-Id: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Nj3Yp0MwsTsyTdpOTcpORE3YqilALdotTi1BLdlFRzwyQLg2Qj00Q
 TJaD+gqLUtMwKsNnRSkFuzkqxtbUArltojnAAAAA=
X-Change-ID: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

This is another of these big upfront design binding and driver
hoards that is the consequence of adding new SoC support. My stake
is to be able to boot and test a full featured Cortex-A5 system and
the BCM6846 XG6846B is one such system on my desk.

It's been cooking for a while in various prototype forms.

IMPLEMENTATION:

Add a shared Processor Monitor Bus (PMB) driver and a child reset
provider for Broadcom BCMBCA blocks. Support BCM6846 XRDP and its Runner
cores, PCIe0/1 and PVTMON. The PMB bus driver uses the third generation
Platform Management Controller (PMC3) keyhole interface. It owns the
register bank and serializes complete sequences for child services.

The fixed SoC transport is built-in and has no sysfs bind/unbind
controls, allowing delayed recovery to retain hardware ownership
until a busy transaction completes. The reset child can be modular.

The series contains three bindings, the PMB bus driver, and the PMB reset
driver. Describe PMC 3.1 as a simple-mfd with two system-controller
children and a bus child, each owning its register window.

The bus child exposes the PMB transport and contains the reset provider.
The parent uses Broadcom's "brcm,bca-pmc-3-1" compatible. The PMB and
reset drivers support only the BCM6846-specific compatibles for now.
Other BCMBCA SoCs have different reset groups or PMB interfaces.

Use one reset specifier cell and define BCM6846_RESET_XRDP as ID 0 for
XRDP and its three Runner cores. The vendor sources describe individual
PMB device addresses and reset masks, but no ID for this combined group.
SoC tables map IDs to blocks, register values, timing and sequence
callbacks. PCIe pulses preserve lane-selection straps. PVTMON uses its
analog-acquisition reset. Consumers must quiesce every affected user;
these resets do not replace clock, power-domain, PHY or UBUS setup.
Power-cycle operations for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL are
left to power-domain and platform power-management support.

This series is based on v7.3-rc1 and is a prerequisite for the
forthcoming Genexis XG6846B Ethernet support series, which works.

The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
ports and copper WAN and has been tested on that series.

MISSING:

I did not add MAINTAINERS entries because I don't know how the Broadcom
maintainers feel about it. Tell me.

MERGE STRATEGY:

I'm not sure. Possibly through SoC with ACKs. Through an MFD immutable
branch if Lee wants to handle it.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (5):
      dt-bindings: mfd: Describe the BCM6846 PMC complex
      dt-bindings: soc: Describe the BCM6846 Processor Monitor Bus
      dt-bindings: reset: Describe the BCMBCA PMB reset controller
      bus: Add a shared BCMBCA PMC3 PMB transport
      reset: Add BCMBCA block resets through the PMB

 .../devicetree/bindings/mfd/brcm,bcm6846-pmc.yaml  |  98 +++++++
 .../bindings/reset/brcm,bcm6846-pmb-reset.yaml     |  46 ++++
 .../bindings/soc/bcm/brcm,bcm6846-pmb.yaml         |  51 ++++
 drivers/bus/Kconfig                                |  13 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/bcmbca_pmc3_pmb.c                      | 232 +++++++++++++++++
 drivers/reset/Kconfig                              |  15 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-bcmbca-pmb.c                   | 281 +++++++++++++++++++++
 include/dt-bindings/reset/brcm,bcm6846-pmb.h       |  15 ++
 include/linux/soc/bcm/bcmbca-pmb.h                 |  25 ++
 11 files changed, 778 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20261013-xg6846b-bcmbca-xrdp-reset-de71b80c25a4

Best regards,
--  
Linus Walleij <linusw@kernel.org>

