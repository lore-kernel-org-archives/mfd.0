Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440341;
	b=mJxfGekJ++JtL6iUM/6qcCxmLHp+fQdPaDLnF71zLUOFx0kmzuHEBdB+rA+ypK6K3MQE
	 M9YSiJtoCCujZXk/VtwT2Lj2yKrA6vPci38pl8DNxKBtr15vci6HWR48yjrTEConQJO4n
	 McG+5F2IbcUmYtCBBrf6G+KwsIEsjCzKTMeUO6/flPDkdWzei/pWAEmejN3+q6fXSzJ7K
	 7FqGexQ5hSTD+Wlr5pg4f/lS7sdcFmH7m1YW45ZujkIjFt/6shmy6Rm6VOT5qP87Xc6q/
	 U6UDngCGJqw9mLvLfqGi33xAKcszWEfirRKQC5EHaw4n/tsHO4RfXNakW6o+R3rAcnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440341;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:CC:X-Mailer;
	bh=Zruk1kJrG0KNFuKlQxpAt1DgMhhrbuqeYBz1BcIwEMM=;
	b=ONBcJnCIdTeEpCzhasaCgRv9usFduUl8eQtmKXCoigkqNEOR9hafcEoUcAXCceEclgdI
	 T+AkAzY3xQd+o+8LskYc3N92ZFav3zvVoiq4x2xMy+iIBs7kxCKcKfX65XnsGWSi6tYpl
	 JDyuS5EKN0JbmcoBae6eQE6R4kGxhreK/X5B1hBkbXoNZABuzGv2ifwBVW9fKy5yyvlhn
	 AOtjVxODA6cp+ZeRg/9TX8+2YvzjIDDJxx7eGByAyEdC1OvVIj5WWafwUej52WAQHnoXe
	 AStP6hZE7L275DRHXJ9iCZv0YdqIc0rgjAJGq4XUkZImV8XuNcWl+laKe+g5/PFwcAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=PsovGr3W;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E8606A321
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 13:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 911E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=PsovGr3W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795440340; x=1826976340;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=b+in/dX32hm/jDF5wRo84HDsEtawHGqccdnfijHYad0=;
  b=PsovGr3WTDoNHN413GhErmVS333zun6B8zFIfRi+eG66cs+RMSqvFgbH
   5J9HfL+RBGiMVywsS6YsK4mM9XUDj5UYHLEHsdzZe8fTQ7b4zb3elzd2x
   frxdFNtk3CJV9HgBbKgTQVMP0X6A36m2oYRKTUtrjx2dd4DLkOQIUZoB1
   DDo92yCvpnR+JelPQFxqrvZ7zNo260otpGQDNMtc3ndQ7DOOBA5RXras9
   32wZvaczAL6j5R7RPDWFAnTn7qBYCTXA/j2hiYrdtLOe8/VT8ie5TVmva
   7agJuoX6aXr0bds7Awyzc+1RaHvgM+iKXewg2w5BqMpDzF6U+9FpxOABM
   Q==;
X-CSE-ConnectionGUID: B4FUNwb8QjeG36RMYBLkxQ==
X-CSE-MsgGUID: Fg0VtAI2RzqOM4svlNVm9g==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="233969644"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 06:25:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 06:25:39 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Nov 2026 06:25:37 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Subject: [PATCH 0/4] mfd: ocelot: Support the LAN9645x switch family
Date: Mon, 23 Nov 2026 14:25:04 +0100
Message-ID: <20261123-mfd-ocelot-add-lan9645x-support-v1-0-567d811fe1de@microchip.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALE+BGsC/x3NQQqDMBBA0avIrDtgQtTaqxQXYzLaAZuEJIog3
 r2hy7f5/4LMSTjDq7kg8SFZgq9Qjwbsh/zKKK4adKt7pdQTv4vDYHkLBck53MiPvelOzHuMIRU
 cyZrW6JnM0EGtxMSLnP/De7rvH6+330RxAAAA
To: Colin Foster <colin.foster@in-advantage.com>, Lee Jones <lee@kernel.org>,
	<UNGLinuxDriver@microchip.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>
CC: <mfd@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

The Microchip LAN9645x is a family of ethernet switch chips without an
internal CPU. Like the VSC7512, the chips are controlled externally over
SPI, and the register targets of the chip are distributed as named
regmaps to child devices. This series extends the ocelot MFD driver to
the LAN9645x family, with the pin controller, the two MDIO controllers
and the switch as child devices, served by the existing pinctrl-ocelot,
mdio-mscc-miim and lan9645x DSA drivers.

Patch 1 moves the VSC7512 specific SPI interface, reset and child device
setup into match data and per chip tables.

Patch 2 adds a binding for the LAN9645x family.

Patch 3 adds the LAN9645x support.

Patch 4 reads LAN9645x registers in a single SPI transfer on full duplex
controllers.

Dependencies:

This series is based on net-next which includes [1]. The binding in
patch 2 references the switch binding
net/dsa/microchip,lan96455s-switch.yaml, and patch 2 adds the new
binding to the MICROCHIP LAN9645X ETHERNET SWITCH DRIVER entry in
MAINTAINERS, both added by that series.

The series therefore does not apply to for-mfd-next yet, and
dt_binding_check of patch 2 fails on a base without the switch binding.

The DSA series is expected in v7.5-rc1. The series is posted now for
review, and will be resent rebased on v7.5-rc1.

[1] https://lore.kernel.org/r/20261111-dsa_lan9645x_switch_driver_base-v17-0-83a471c5bddb@microchip.com

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
Jens Emil Schulz Østergaard (4):
      mfd: ocelot: Select the chip through match data
      dt-bindings: mfd: Add the Microchip LAN9645x switch family
      mfd: ocelot: Add support for the LAN9645x switch family
      mfd: ocelot: Read LAN9645x registers in a single SPI transfer

 .../bindings/mfd/microchip,lan96455s.yaml          | 132 +++++++++++
 MAINTAINERS                                        |   1 +
 drivers/mfd/Kconfig                                |   2 +-
 drivers/mfd/ocelot-core.c                          | 263 ++++++++++++++++++++-
 drivers/mfd/ocelot-spi.c                           | 242 ++++++++++++++++---
 drivers/mfd/ocelot.h                               |  25 +-
 6 files changed, 617 insertions(+), 48 deletions(-)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261118-mfd-ocelot-add-lan9645x-support-9ac4042ba475

Best regards,
-- 
Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>

