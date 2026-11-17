Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908875;
	b=mJLhYdks8ptJVWAqOYMhvOujmwLxCqEVnAzt15vSGsOTS1kTn3PYy+5P0At82TFVF3ns
	 juo727c5+RWOVX+u1oDXZMR4dTXpzNmwSckBn/Mu32qHtRpcZpdkYra3fZ/LdcgvPtKrr
	 0OGt6kVpLmj74c9J8ixI79OvZ7MBnB5ziVshK76/OazzV00Cw8iD+qzHf+OS5o0JTgCGh
	 TFW2ict2tTNom3pekftQnuEfHhkUGrSDqsJLCvZjOuJbm7BDl3RWveQsP/hlZ/oL0LEqO
	 HQcWdopPWdC91d7QrDvC/+muvsdJ2udWDvyVXkpvEhRbsSQSOQuX8HqV+nr+VcgUmXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908875;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=8vbPJqTbumBhqNcCMW5mlvCQlbvHbLgn8cK4HAuHvjk=;
	b=ndd4sRX6Gnqlb2/UScTmfBk+9q1/19yoFn6Zdz6/kdr0EEU7W98+AXGJpkgprHDoMegp
	 quBAIO3jKsLIL8L1Imeb6XBl0JhKqPTcoN1h1h1gRaeFvMJM9r6dtIjyJXxZQsbOwXODh
	 5+p+XAQTO76rzTG5OXk+9+sTh3uyJYluSv2sEi+UqEl6GZFXHpn4jG4goAosh1/44p1aZ
	 zxHKTikDDXNWQqbCepEmbeXqYRVhSYyYoIApc9iKD5Q4S2L2Utuf14SJyaj9Uk8wOz6fN
	 jqUX0rSLUyzwmxmmkPPVQZ4uc3OokVYMwWQprKhW6RO+O1SYz25YqPkXpfvXsk6C85w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1XoXPsti;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA5606A323
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 09:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3EA5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1XoXPsti
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 50197C4EDB9;
	Tue, 17 Nov 2026 09:47:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2D665FC81;
	Tue, 17 Nov 2026 09:47:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C30C11BC02EE;
	Tue, 17 Nov 2026 10:47:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908872; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8vbPJqTbumBhqNcCMW5mlvCQlbvHbLgn8cK4HAuHvjk=;
	b=1XoXPstiMASE/2Ht/XAH8uj7y+0eHm/trDe6kLhxppdWsouVBe3USv/55J9g2f+5k2frgY
	b+4ckrimuue2cXzlmcdjPraqb6AD5i0FIF3JdTZpC3mD6WWeA2ouYw8U1G6Bp3+2Ghyu40
	5enPjzGTC9JezGf+W1U/IODJNASuuCVKiJHa8rZw2SJXrEMtohruayXrjrEDzFmiyuKFOG
	yV4e9sbhH2d3k1tponcV2XPY7Gh/unYdHQZmmIpEPJo2OAb+UH6HNcw1E993YuyS/2Wh7S
	3lYMjZT3PwxKQAmMb1zT4O75wDjk9mV89XO87DZEuX2bkzYF5b8oTQdV/OLbpg==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Subject: [PATCH v6 00/10] Congatec Board Controller: Add storage devices
 support
Date: Tue, 17 Nov 2026 10:47:40 +0100
Message-Id: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Oy07DMBAF0F+pvMZoxo88WPEfqAvbGbeWIA52G
 hVV+XecViKgLMjyzmjOnRvLlAJl9nK4sURTyCH2JVRPB+bOpj8RD13JTICooMaau5N1PAjH8xi
 TKfuuXDnKPF+GIaaRW0lUOzJSCmCFGRL5cL1XvB0fOdHnpTSN6/AcFu7r/saEy/TR2ID6v3FCD
 txTJxuNUNXoXm2M43von138YAs/iV8k4g5SFFKSN23bEJDXW1KuZLuLlIXUrbJaeus0mS2pfkg
 EEDtIVUiyShB47Lxut6ReSQS5g9SFNA7RC+kNafxLzvP8DY3eRXgzAgAA
X-Change-ID: 20260717-cgbc-i2c-storage-devices-support-b3ee7cea3320
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This is the 6th iteration. As discussed with Lee [1] I just picked his I2C
patch [2] (to handle the conflict) and rebased the series on top of
next-20261116.

[1] https://lore.kernel.org/all/c9d26395-93f8-4e63-9cd0-586ce913931b@bootlin.com/
[2] https://lore.kernel.org/all/20261027093306.2812695-27-lee@kernel.org/

Best Regards,
Thomas

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
Changes in v6:
- rebased on top of next-20261116.
- add Lee's I2C patch (PATCH 2).
- Link to v5: https://patch.msgid.link/20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com

Changes in v5:
- mfd: fix error message in case we fail to get session handle.
- fix I2C bus names earlier in the series.
- Link to v4: https://patch.msgid.link/20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com

Changes in v4:
- Fix struct cgbc_i2c_platform_data comment (kernel-doc warning)
- Move struct cgbc_i2c_platform_data from linux/platform_data/i2c-cgbc.h to
  linux/mfd/cgbc.h
- Use MFD_CELL_NAME macros.
- Link to v3: https://patch.msgid.link/20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com

Changes in v3:
- rebased on v7.3-rc2
- use PLATFORM_DEVID_AUTO for child devices
- move I2C bus and I2C device definition in the MFD driver
- Link to v2: https://patch.msgid.link/20260811-cgbc-i2c-storage-devices-support-v2-0-3efa998e0ef5@bootlin.com

Changes in v2:
- i2c: fix typo in CGBC BIOS EEPROM label.
- mfd: make cgbc_devs const
- Link to v1: https://patch.msgid.link/20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com

To: Thomas Richard <thomas.richard@bootlin.com>
To: Lee Jones <lee@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Werner Gartner <Werner.Gartner@congatec.com>
Cc: mfd@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org

---
Lee Jones (1):
      i2c: cgbc: Propagate hardware errors when polling read status

Thomas Richard (congatec GmbH) (9):
      mfd: cgbc: Fix use of negative error code as valid session handle
      i2c: cgbc: Use real I2C bus names
      mfd: cgbc: Add I2C platform data
      i2c: cgbc: Use plateform data to get bus ID and adapter name
      mfd: cgbc: Use PLATFORM_DEVID_AUTO for child device registration
      i2c: cgbc: Add support for fixed frequency buses
      mfd: cgbc: Add virtual I2C bus support
      mfd: cgbc: Add virtual storage devices on the virtual I2C bus
      i2c: cgbc: Register known I2C devices on the bus

 drivers/i2c/busses/i2c-cgbc.c | 135 ++++++++++++++++--------------
 drivers/mfd/cgbc-core.c       | 187 +++++++++++++++++++++++++++++++++++++++---
 include/linux/mfd/cgbc.h      |  16 ++++
 3 files changed, 265 insertions(+), 73 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20260717-cgbc-i2c-storage-devices-support-b3ee7cea3320

Best regards,
--  
Best Regards,
Thomas Richard

