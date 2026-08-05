Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1FE45FFB3
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932432; cv=none; b=IEO/UxWZi3zvS56NnszeGIMKKPmHF3q0z+Xn+QusGjRXDIA/A7eV3mAVdbjfeoP0Bnmc4SJvLYJ5soO1+eBJ1vo24brdA6/IZjk0YP8CXoesiv0yTWBiH7kywtoRNm+YfejpAhg+W09J9i6KSDqAKbna7Ye8/+njSMvPjH67oS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932432; c=relaxed/simple;
	bh=xl1cOK/dGjUW1mBNDOJNs68D8duvgWXHAALZFiZHDPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FfZmW8+vqilrTjVRccP6d5dpZ7IGsapfnGs73RxlNO4kNwZdugnK0QGuF30pTO4m9uu3gzfWkNBhOBWGNXcy6sDPaoCgULZBGieWqDGyZzgS9/WsJ4gNSTk/OtqJgf2ArtJsbkhaRbdAQIljA34lAADHdho8x6AyCyJuNqqlVQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=AcvHcLFR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="AcvHcLFR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso5957805e9.1
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 05:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932427; x=1786537227; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dp0YqgID/4phtDgYq1gE5Cv1WezComCCtY1tYXFFVXw=;
        b=AcvHcLFRi6ExpQKi5a6DHtoyrjl0RgopJ0f1UOEUh0ll9y55fJWdJujqG+LkkyKmlz
         H9dWzIBBrR4AtJ9xjNUvzPXneldIrvytoQLB2EHPcW91wZlyG0+YXxIkvXEhgApGVx96
         s9gcC/RoBVD+anvRqeAC2/caSD+qhNxF2LS/q6k+TTX1mK5lNxdMgK4HnOeakvPcGiuO
         ozXTiLwZSLX1KaPA0UnaSeqD9HjqMZtGq85Wa5UNYm66eWuUzh/F6vQCmYJb0qTFgpd3
         jRSjbWCLc3rAh0+9Wscx3vcVHTZX2tKfK8jr6YKsohHQdzOCzkOULNRNQx6iBg45CwwH
         X9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932427; x=1786537227;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dp0YqgID/4phtDgYq1gE5Cv1WezComCCtY1tYXFFVXw=;
        b=B2F0xmpnxib6IRcqZ+6/0hbhSAK57jzqzVlD91vfxA0C55YTUvgmT4oEnMx/WNOABf
         cDtQ0ZcfJj1d6J2m0omwscWU9rocAVxtWCULlaZSkyrhm+ygq1wwQjcKgimSgiumFBnS
         RMcDIWk5ZvIo//VRHbu/8eydji6E9nC0YUMsRmTUfnpbqgx3alv1F/QPKzmzq+59CClT
         2TP/SnK9Hm9XiHxDWxlmr/ibJjIUH1f6XZNAeLesoR9o3a9OSILHWoowdFgRFTNDfwJy
         8tZoIJXj04Fr00+ExEb/Z19C0saTJoV5BTfeCC4d9T5ABq0j8ZwegXo2xyppdz9oRz9t
         5Lmg==
X-Forwarded-Encrypted: i=1; AHgh+RrB4mvZOv1fg8TocUgYLJQogxF0ZAK3K6Z7rip7EekITkGvBfRrM1/kHl8Lr6tXkimzFHE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmaJJSyC9P73G1K03/DlNysolMFtyUrY68nE+xEEpw8r14iSf2
	Ktf7I4KKSIuWnwuIMD2FFRu9PlKif28P9kYIwMgjE5iha3d+2TS4Qoe/4x4aMb/n9QA=
X-Gm-Gg: AR+sD13lLGS7yGubT7uHwUyiZejh2huz0Ks6+sZWsVSjUGzvoja9O5q6EQYGMvsQJA4
	VWuX//xpctwsx2bHlzqW9YdH7YliGjmmsy6FTgDqBmu70lP+ziuocEcdQYrQXMLlf9vWBdTTrRq
	TJzP/xWQCIT1XvdDCSQVyfR2ia6jMdWFvwEEhR1BAPsT7013yOESgGzK5OtXrR5xPySyUyK0Dhm
	lAeRG2UOTXgRadPT6QKF49zNdBjm0qbvrjMEbtWdQb5CXnwJ/TN8etHVnDsgK2GuAyEAcen6/FB
	9bCuTI67j5c4mnZ+wKRz7qLahjmR722H8HylbMCZnYrOXkeMYDHTugq56qjyuhw0rPpt6hHezic
	QnfBm0XITGcGGhWqt4KqcPtHiBPyQ9nkgjunZNsQ1ZXlxrgQI4DyyLhLl7l2MpBOdndpZuufw2w
	qztCr86a5VI26tYopX39vsRqF1U/DW5wnTDshkjsM9+WJmtY9eWgzlwPp5KTgad9125lEkSBO1C
	omIH+sLAM1MQ8YQEoIjc18jvztyXAAkXZdye2d2a+5+xjtc9DkRe4e0eIf/05Kx/EmUwbb8SnMQ
X-Received: by 2002:a05:600c:4e87:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4994e7c0356mr76610975e9.11.1785932426940;
        Wed, 05 Aug 2026 05:20:26 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:26 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 0/6] soc: aspeed: Add BMC and host driver for PCIe BMC device
Date: Wed,  5 Aug 2026 14:19:47 +0200
Message-ID: <cover.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the v5 for upstreaming the VUART over PCIe BMC device drivers.
The initial drivers were taken from the ASPEED kernel SDK
(master-v6.18) [1].

There are two drivers: a BMC-side driver and a host-side driver.
Together they enable host<->BMC VUART communication via PCIe.

The virtual UART is an 8250-compatible register set. It is called
'virtual' because it is internally a simple FIFO.
On the AST2600, two VUARTs can be exposed over PCI via the PCI BMC device.

The host cannot access the BMC's memory. Only the exposed features are
accessible. These are the KCS4 channel and 2 VUARTs. There is also some
mailbox register functionality for a communication between
the host and the BMC. More information can be found here [2].

Changes since v4 [3]:
- Squashed '8250' DT binding changes in one patch based on Krzysztof's
  review.
- Removed 'aspeed,sirq-polarity-sense' support on new
  'aspeed,ast2600-vuart' compatible string as it's a deprecated property.
- Renamed 'syscon' to 'aspeed,scu-syscon' in '8250' DT binding.
- Cleanup in BMC driver:
  - Changed bit 14 to RESERVED macro
  - Changed macros ordering
  - use FIELD_PREP macro
- Cleaned up of the host-side driver:
  - Removed unused INTX. Only use MSI interrupt.
  - Proper use of dev_err_probe.
  - Use of 'module_pci_driver'.
  - Used managed functions and simplified exit code.
- Changed the host side driver location:
  - Now in driver/mfd/aspeed-pci-core.c
  - Changed code to use MFD cells.
    VUART are sub driver of the core driver.
    This allows for easy expansion for KCS support.
  - The core driver now only sets up MSI interrupts and
    instantiates the 8250 sub-driver.

The host driver will performs multiple functions. The AST2600 also
supports LPC over PCI, with a specific KCS channel (KCS4). This host core
driver should also be used to enable the IPMI automatically via this KCS
channel.

Tested:
As with v4, VUART data flow and MSI interrupts have been verified
as working on the test hardware.
BMC: Asus IPMI Kommando Card R1.01, AST2600 A3 running OpenBMC
Host: Linux kernel v7.0.0

This series only supports the AST2600; the AST2700 is not supported.

The findings regarding the MSI interrupt numbers are explained in the v4
cover letter [3].

As with v3 and v4, I would like to know whether I should add the
'lpc-io-reg' and 'lpc-interrupt' values to the vuart3 and vuart4 nodes
directly in the 'aspeed-g6.dtsi'. The host driver is not capable of
finding the vuart address on its own, so they are hardcoded to 0x3f8 and
0x2f8. It will not work with other addresses, so perhaps they should be
in the .dtsi to ensure the correct configuration for the two vuart over
PCI.

[1]: https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-v6.18/drivers/soc/aspeed
[2]: https://lore.kernel.org/linux-aspeed/CAFi2wKYOAotiezepDqaR5PZDqDaPKKDfAEnpx5EHC0mL39hy6w@mail.gmail.com/
[3]: https://lore.kernel.org/linux-aspeed/cover.1783524645.git.gregoire.layet@9elements.com/

Grégoire Layet (6):
  dt-bindings: serial: 8250: aspeed: add ast2600 and
    aspeed,vuart-over-pci
  serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
  serial: 8250_aspeed_vuart: add VUART over PCI
  soc: mfd: add ASPEED AST2600 PCIe BMC device driver
  ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
  ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4

 .../devicetree/bindings/serial/8250.yaml      |  42 +++++-
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  12 +-
 drivers/mfd/Kconfig                           |  12 ++
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/aspeed-pci-core.c                 | 120 ++++++++++++++++++
 drivers/tty/serial/8250/8250_aspeed_vuart.c   |  92 ++++++++++++++
 7 files changed, 280 insertions(+), 6 deletions(-)
 create mode 100644 drivers/mfd/aspeed-pci-core.c


base-commit: 253b1036b9163f23f7b18274a0d4e904ac8821c5
--
2.54.0
