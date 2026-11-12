Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487494;
	b=Uz+2Gk96DiFLdtqkCO6qOgUxJ2+FNuCqZcUNsDux2oC7OH/XUIVKqxdmF6Hz9qOusQNe
	 tX3sEuPTvZdBf6zs+cZWhPVv4WZNAyPiI0bn9z6sL/XksvlOXwbWm7/WyHgn8oPNHyHq9
	 KK0Bx3hln9/S6z6NKo8Ht6DOGzWrMMs858ci5Ua7rO+R+FZ5WzsdC9QwrIhenHkEbJL8/
	 Im4wgGHkSxk7rTutGqgDeWMsB5NwG9okDwSRJ3DNccvEemi3TrONoXB9xAg/zHFJdillc
	 DZ44V86D6pAvTTeehq/7iS0jA/LT+2KB0yRt/P+S9fq//o0U7PNUGXljNVSmPCoDl/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487494;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Virus-Scanned;
	bh=Gv9zCllNQvgvbOgAonF5220OrqKd+Rj8BjVJmczouMQ=;
	b=rYI40YeOWYAjYc4RJZ/baKbhaJFaMp4Vy7NXd71ZkA9oA+KnjUIoBCds6Uu1vciP/jZ2
	 2pSVvA1m3x0XaVHihcNQ9XSp45Zy6FXsafK0M7bpJWQwCom8BCWYQU2+IkVVcWWodlFf6
	 nBW4xZcXUgghfaSEu3IZJ8ZzA4COEKtjkCnZqjOc/BiaJy6Z4MGuuQPRRRhSdASyb/x/4
	 20SZZAnt9HupPCL9/TRlXScOmDOzgARU2Ki2XUmYtG1Qcz6hpv0Qb3HSQMkIBNCFXCDHE
	 X1nuYBlIP68TqJU94YpemTNJOLv8e71NZ5/rO7elH6gNgU2rYGdnOtAz40g5MEgDeEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	arc=none smtp.remote-ip=92.121.34.13
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427A7606A332
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 12:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427A7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8A8021A002E;
	Thu, 12 Nov 2026 13:44:45 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5315F1A000D;
	Thu, 12 Nov 2026 13:44:45 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 94ED01800068;
	Thu, 12 Nov 2026 20:44:42 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v21 0/4] Add support for NXP P3H2x4x I3C hub driver
Date: Thu, 12 Nov 2026 18:14:33 +0530
Message-Id: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
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
X-Virus-Scanned: ClamAV using ClamSMTP

This series adds the MFD parent, regulator and hub drivers for NXP's
four-port and eight-port P3H2x4x I3C hubs. With an I3C host, the hub
driver exposes I3C ports as virtual controllers. SMBus ports appear
as I2C adapters with either an I2C or an I3C host.

The I3C core helpers, DT binding and generic hub support from v20
(patches 1-3 and 6) are in mainline. This revision rebases the four
device-specific patches onto v7.4-rc2.

Sashiko flagged the location of p3h2840.h in both the MFD and regulator
patches (v20 4/8 and 5/8). Both reports appear to be false positives.
The MFD parent and its regulator and hub children share struct p3h2x4x,
so the header stays in include/linux/mfd/.

Changes since v20

Fixes for the three Sashiko findings

- Close the I3C registration race by keeping routing callbacks active
  until all virtual controllers are registered. Under the routing mutex,
  write the route mask and mark the ports permanently connected only if
  the write succeeds.
- Apply the same "i3c" and "smbus" node filter in both DT parsers so
  an unrelated child with a "reg" property cannot claim a target port.
- Service each pending SMBus receive buffer independently. Acknowledge
  overflow by writing only bit 3, so a refilled buffer keeps its new
  receive flag.

Additional fixes

- Reject duplicate target-port numbers in DT.
- Reserve DT-assigned addresses for all I3C ports before the first
  virtual controller runs dynamic address assignment (DAA).
- Clear only the transaction-finish flag when starting an SMBus
  controller transfer, preserving pending target RX and overflow flags.
- Set up the optional IBI before taking the routing mutex so a probe
  error during setup cannot leave the mutex held.

Previous posting (v20)
https://lore.kernel.org/linux-i3c/20260922103551.2754613-1-lakshay.piplani@nxp.com/

Mainline merge
https://git.kernel.org/linus/3ad1536d831a104b4134924d418b072b3f175e81

Aman Kumar Pandey (3):
  mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
  regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x
    i3c hub
  i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Lakshay Piplani (1):
  i3c: hub: p3h2x4x: Add SMBus slave mode support

 MAINTAINERS                                   |   6 +
 drivers/i3c/Kconfig                           |   1 +
 drivers/i3c/Makefile                          |   1 +
 drivers/i3c/hub/Kconfig                       |  11 +
 drivers/i3c/hub/Makefile                      |   4 +
 drivers/i3c/hub/p3h2840_i3c_hub.h             | 356 ++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c      | 432 ++++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c         | 213 ++++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c       | 648 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/p3h2840.c                         | 164 +++++
 drivers/regulator/Kconfig                     |  10 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/p3h2840_i3c_hub_regulator.c | 289 ++++++++
 include/linux/i3c/device.h                    |   2 +
 include/linux/mfd/p3h2840.h                   |  41 ++
 17 files changed, 2193 insertions(+)
 create mode 100644 drivers/i3c/hub/Kconfig
 create mode 100644 drivers/i3c/hub/Makefile
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub.h
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_common.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
 create mode 100644 drivers/mfd/p3h2840.c
 create mode 100644 drivers/regulator/p3h2840_i3c_hub_regulator.c
 create mode 100644 include/linux/mfd/p3h2840.h

-- 
2.25.1
