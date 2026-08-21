Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6172D37DE97
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283356; cv=none; b=fd+47gNBpWmKCd7jdHBaI3I08nZJX45Hi8upw0H+kyJrYplIJRw/48+xFATUlxG+2KkeLLoHXeOc6VvU1jersdqqdWq1GqJqChq5NBhp7tgTM6alkNcPqa/oViMBWO6mFq6AyhK73aSNrtEcmm0nJ4XM3+qYuhucNEy0ngh1sHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283356; c=relaxed/simple;
	bh=Whms/+q4JoPzCtDw3QlXcuef1B5M1W4aqbOVC7Ygfug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bw9WaBxlghNYA1QIYbdhSsuBCnp6WHzxMSdi95xkoLL4EFirUdHi+7jeT/xRte4eYAsn52PTbIaqZWgAW7TWdRn5teTaHdw1IrPCY9+o32UukvG0EPwpfnOl+pzp7fcNxB55r8rpFzeN7VAh+Sh/C4IE0bmTX7JtYE444+ZQ0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=js6immtV; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="js6immtV"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso418985a12.2
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 20:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787283348; x=1787888148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlFmNHRW5eiulSAG/+fFQ1Eg/WOdNRIY5GXFaD+LV78=;
        b=js6immtVYQ8sxK7/pyakbBq8ReMzML7CznG6nQFMofcAsTwQLRvmsIggLPINW2jFMZ
         ANyiwiLBEOM47sCp5EDnsWlBYHA5poLJPGyKzVNZ8UeJ45HevTa/XmhwSrtiG+7FilOL
         pwha2747FnK7hAhZjm8jeL/Ct5IplOqaMFhAni8i2qEAFyeXNaCQ7wVP/w5K1CVEyqSE
         kSZHSl/ePZPPUGGxvajTnuKXzD8ynbXKmBLiA5IeIGNEV0qrYV4DEir6KjbmDWxpJvPR
         r5nBA2EkUWKutBcayKJ01vpgUMjDuSHoM7Jc2ZDtX0Kl/PCPhvutrKC8TGGXGbinUHKK
         g/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283348; x=1787888148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rlFmNHRW5eiulSAG/+fFQ1Eg/WOdNRIY5GXFaD+LV78=;
        b=KbpIwiyJxLbnl50o3glwBSSrItnDgR/H8hIf+D5tPfwsdJotqdCEicaQkSfXqsmqEL
         QVI5fPlcHcNy7j7d7jMAqG6z+U0A35aDLTJVKVxPahrYZpaUiJ1+7RSS7ZUaUHQAWJdF
         bNUyqM7zJ8apzLZzeuwLmwKImd0wEkRzpPexZMAgNP7APuGopeByTnzuYVt/SWMjO1Pf
         cy/Xzko19N8ehcSTXcv5WgvY27J32Nx4ViH+2DkMqCFMJ62hQz/uuNs2pjirPslKjJz5
         GhiP1YIA9cIHy5Wjx6wEwO9kmVQhAB0VOF09LpfqiHD/OAt5vgXBYfaslMY5PFMM9pMZ
         uv6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpWVF+gG2TR9XiyTalmMiTTK4hrnYi2FznarVOMXQkwoqI6QlRaw/guOf5W0wdPGtX3Z2o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNsiyqbAl/joszRHGF7UkEaFbgJHSJdyvZC4pkLs/UDjbfmIHf
	kPOaKBJBIEnvO+4J56wINoDMiN19f4f3Cwg5HrV0Q2lV72D0zhUddcXtk+YkBQ==
X-Gm-Gg: AR+sD13vrQOdQKHFGyi7LGPqLowvADDYH55zLoCSVeauP8qUMpL/3dRWKGFeBdI6e7R
	7S1kZ6NVz4mTuzXQHrExe5rncCRpteEN+e6kLd8WGUC/j+wDTiZp1DzQ7rLsIGhiGhupeCnXuoF
	XXkoMSiHuHILehEv9D8e9qA7+KBqOgJ+bXHLAmZ6Fjv4GSau3mj23YaSruzlxcMmJVxMKUZrYW5
	wnkQVVYxVJ89dNw3E7v7Azr7poOAUMQ2PcNSXx1V8C5KoYzp6OLl+ziT2+M3XRHvNeRbSdNjDrq
	KSrygd4Hc2G1r51Iq3oZy2nU1JjYAG8/lBNuG0hYU68PYjfk/BnLNjU09FV5Cd9Ql9AOW7gJGVg
	LT4ZkIBZLAM///KgxMl9J4SVWqxdhprDsHNTPN1iGh42GgbHstL5cK142i2Yu1ziEhb7azwwV+x
	57tQvUPOMcG6Ci5NpmMCLCeKYkP8ddAR6C0QCsOUfSyTsz64bh8mGGVsR748x1QBI1xHeQAMAOt
	A7rZPKvsqb5xghZLY6XmWnkJ8CZoj8=
X-Received: by 2002:a05:6a21:e081:b0:3c8:f342:132c with SMTP id adf61e73a8af0-3cd3000a342mr5655274637.11.1787283347733;
        Thu, 20 Aug 2026 20:35:47 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15891a04csm2204271a12.15.2026.08.20.20.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:35:47 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v7 10/10] mfd: nct6694: Add Host Interface (HIF) eSPI transport driver
Date: Fri, 21 Aug 2026 11:35:05 +0800
Message-Id: <20260821033505.4017901-11-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821033505.4017901-1-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Add support for the Host Interface (HIF) transport via eSPI for the
Nuvoton NCT6694 peripheral expander.

This transport driver initializes the Super-I/O to configure the
device's shared memory base address and SIRQ. It provides a regmap_bus
implementation that drives the firmware command/response exchange over
the shared-memory window, plus an internal regmap_mmio for the report
region. The initialized device config is then passed to the MFD core
(nct6694_core_probe) for sub-device registration and IRQ domain setup.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v7:
- Zero the tail of the caller buffer when the firmware answers with
  fewer bytes than requested, and split the transfer helper into
  separate @tx/@rx buffers instead of a shared scratch buffer.
- Request the interrupt before registering the core, so devres frees it
  after the sub-devices are removed. Mask the interrupt and clear a
  stale status in nct6694_hif_irq_init() so the handler cannot run
  before the IRQ domain exists.
- Return IRQ_HANDLED once the interrupt status has been cleared.
- Skip hardware interrupts that have no mapping instead of dispatching
  virq 0.
- Bail out with -ENODEV if the BIOS left the shared memory base address
  unconfigured.
- Program the SIRQ register with the hardware interrupt number rather
  than the Linux virq.

Changes in v6:
- Reworked the transport to implement a regmap_bus instead of the v5
  read_msg/write_msg function pointers.

Changes in v5:
- Split from the monolithic v4 patch.
- Adapted to re-use the newly introduced nct6694_core_probe() and
  abstracted I/O APIs.

Changes since version 3:
- Remove redundant module type macro definitions from sub-device drivers
  that are now provided by the shared header <linux/mfd/nct6694.h>,
  fixing -Wmacro-redefined warnings.

Changes since version 2:
- Restore per-device IDA and mfd_add_hotplug_devices()/PLATFORM_DEVID_AUTO
  to avoid child device ID conflicts with multiple NCT6694 chips.
- Validate irq_find_mapping() return value before dispatching IRQs.
- Check superio_enter() return value in nct6694_irq_init().

Changes since version 1:
- Drop function pointers from Super-I/O access and use static inline
  helpers with proper types.

 drivers/mfd/Kconfig       |  16 ++
 drivers/mfd/Makefile      |   1 +
 drivers/mfd/nct6694-hif.c | 590 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 607 insertions(+)
 create mode 100644 drivers/mfd/nct6694-hif.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 742fc26e6ff7..f37acf585671 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1175,6 +1175,22 @@ config MFD_NCT6694
 
 	  It is selected automatically by the transport interface drivers.
 
+config MFD_NCT6694_HIF
+	tristate "Nuvoton NCT6694 HIF (eSPI) interface support"
+	depends on HAS_IOPORT && ACPI
+	select MFD_NCT6694
+	select REGMAP_MMIO
+	help
+	  This enables support for the Nuvoton NCT6694 peripheral expander
+	  connected via the Host Interface (HIF) using eSPI transport.
+
+	  The transport driver uses Super-I/O mapping and shared memory to
+	  communicate with the NCT6694 firmware. Enable this option if you
+	  are using the NCT6694 over an eSPI interface on an ACPI platform.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called nct6694-hif.
+
 config MFD_NCT6694_USB
 	tristate "Nuvoton NCT6694 USB interface support"
 	select MFD_NCT6694
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 10c19a19541e..97924dd3552c 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -125,6 +125,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694-core.o
+obj-$(CONFIG_MFD_NCT6694_HIF)	+= nct6694-hif.o
 obj-$(CONFIG_MFD_NCT6694_USB)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
diff --git a/drivers/mfd/nct6694-hif.c b/drivers/mfd/nct6694-hif.c
new file mode 100644
index 000000000000..198838d3e7d8
--- /dev/null
+++ b/drivers/mfd/nct6694-hif.c
@@ -0,0 +1,590 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Nuvoton NCT6694 host-interface (eSPI) transport driver.
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/unaligned.h>
+
+#define DRVNAME "nct6694-hif"
+
+#define NCT6694_POLL_INTERVAL_US	10
+#define NCT6694_POLL_TIMEOUT_US		10000
+
+/*
+ * Super-I/O registers
+ */
+#define SIO_REG_LDSEL		0x07	/* Logical device select */
+#define SIO_REG_DEVID		0x20	/* Device ID (2 bytes) */
+#define SIO_REG_LD_SHM		0x0F	/* Logical device shared memory control */
+
+#define SIO_REG_SHM_ENABLE	0x30	/* Enable shared memory */
+#define SIO_REG_SHM_BASE_ADDR	0x60	/* Shared memory base address (2 bytes) */
+#define SIO_REG_SHM_IRQ_NR	0x70	/* Shared memory interrupt number */
+#define SIO_SHM_IRQ_NR_MAX	15	/* Highest ISA interrupt line */
+
+#define SIO_REG_UNLOCK_KEY	0x87	/* Key to enable Super-I/O */
+#define SIO_REG_LOCK_KEY	0xAA	/* Key to disable Super-I/O */
+
+#define SIO_NCT6694B_ID		0xD029
+#define SIO_NCT6694D_ID		0x5832
+
+/*
+ * Super-I/O Shared Memory Logical Device registers
+ */
+#define NCT6694_SHM_COFS_STS			0x2E
+#define NCT6694_SHM_COFS_STS_COFS4W		BIT(7)
+
+#define NCT6694_SHM_COFS_CTL2			0x3B
+#define NCT6694_SHM_COFS_CTL2_COFS4W_IE		BIT(3)
+
+/* COFS register block [STS..CTL2] is the only SHM range driven via inb/outb */
+#define NCT6694_SHM_COFS_LEN			\
+	(NCT6694_SHM_COFS_CTL2 - NCT6694_SHM_COFS_STS + 1)
+
+#define NCT6694_SHM_INTR_STATUS			0x9C	/* Interrupt status register (4 bytes) */
+
+enum nct6694_chips {
+	NCT6694B = 0,
+	NCT6694D,
+};
+
+struct __packed nct6694_hif_msg {
+	struct nct6694_cmd_header cmd_header;
+	struct nct6694_response_header response_header;
+	unsigned char data[];
+};
+
+struct nct6694_sio_data {
+	enum nct6694_chips chip;
+	int sioreg;	/* Super-I/O index port */
+};
+
+struct nct6694_hif_data {
+	struct regmap *rpt_regmap;
+	struct nct6694_sio_data *sio_data;
+	void __iomem *msg_base;
+	unsigned int shm_base;
+};
+
+static const char * const nct6694_chip_names[] = {
+	[NCT6694B] = "NCT6694B",
+	[NCT6694D] = "NCT6694D",
+};
+
+/*
+ * Super-I/O functions.
+ */
+static inline int superio_enter(struct nct6694_sio_data *sio_data)
+{
+	int ioreg = sio_data->sioreg;
+
+	/*
+	 * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
+	 */
+	if (!request_muxed_region(ioreg, 2, DRVNAME))
+		return -EBUSY;
+
+	outb(SIO_REG_UNLOCK_KEY, ioreg);
+	outb(SIO_REG_UNLOCK_KEY, ioreg);
+
+	return 0;
+}
+
+static inline void superio_exit(struct nct6694_sio_data *sio_data)
+{
+	int ioreg = sio_data->sioreg;
+
+	outb(SIO_REG_LOCK_KEY, ioreg);
+
+	release_region(ioreg, 2);
+}
+
+static inline void superio_select(struct nct6694_sio_data *sio_data, int ld)
+{
+	int ioreg = sio_data->sioreg;
+
+	outb(SIO_REG_LDSEL, ioreg);
+	outb(ld, ioreg + 1);
+}
+
+static inline int superio_inb(struct nct6694_sio_data *sio_data, int reg)
+{
+	int ioreg = sio_data->sioreg;
+
+	outb(reg, ioreg);
+	return inb(ioreg + 1);
+}
+
+static inline int superio_inw(struct nct6694_sio_data *sio_data, int reg)
+{
+	int ioreg = sio_data->sioreg;
+	int val;
+
+	outb(reg++, ioreg);
+	val = inb(ioreg + 1) << 8;
+	outb(reg, ioreg);
+	val |= inb(ioreg + 1);
+
+	return val;
+}
+
+static inline void superio_outb(struct nct6694_sio_data *sio_data, int reg, u8 val)
+{
+	int ioreg = sio_data->sioreg;
+
+	outb(reg, ioreg);
+	outb(val, ioreg + 1);
+}
+
+static int nct6694_sio_find(struct nct6694_sio_data *sio_data, u8 sioreg)
+{
+	int ret;
+	u16 devid;
+
+	sio_data->sioreg = sioreg;
+
+	ret = superio_enter(sio_data);
+	if (ret)
+		return ret;
+
+	/* Check Chip ID */
+	devid = superio_inw(sio_data, SIO_REG_DEVID);
+	switch (devid) {
+	case SIO_NCT6694B_ID:
+		sio_data->chip = NCT6694B;
+		break;
+	case SIO_NCT6694D_ID:
+		sio_data->chip = NCT6694D;
+		break;
+	default:
+		superio_exit(sio_data);
+		return -ENODEV;
+	}
+
+	superio_exit(sio_data);
+
+	return 0;
+}
+
+static const struct mfd_cell nct6694_hif_devs[] = {
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+	MFD_CELL_NAME("nct6694-gpio"),
+
+	MFD_CELL_NAME("nct6694-i2c"),
+	MFD_CELL_NAME("nct6694-i2c"),
+	MFD_CELL_NAME("nct6694-i2c"),
+	MFD_CELL_NAME("nct6694-i2c"),
+	MFD_CELL_NAME("nct6694-i2c"),
+	MFD_CELL_NAME("nct6694-i2c"),
+
+	MFD_CELL_NAME("nct6694-canfd"),
+	MFD_CELL_NAME("nct6694-canfd"),
+};
+
+static int nct6694_hif_err_handling(struct nct6694 *nct6694, unsigned char err_status)
+{
+	switch (err_status) {
+	case NCT6694_NO_ERROR:
+		return 0;
+	case NCT6694_NOT_SUPPORT_ERROR:
+		dev_err(nct6694->dev, "Command is not supported!\n");
+		break;
+	case NCT6694_NO_RESPONSE_ERROR:
+		dev_warn(nct6694->dev, "Command received no response!\n");
+		break;
+	case NCT6694_TIMEOUT_ERROR:
+		dev_warn(nct6694->dev, "Command timed out!\n");
+		break;
+	case NCT6694_PENDING:
+		dev_err(nct6694->dev, "Command is pending!\n");
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return -EIO;
+}
+
+/*
+ * @tx is const because regmap_bus->write() hands over the caller's buffer. A
+ * GET command carries no request payload and passes @tx as NULL; callers that
+ * need the response pass @rx, the others pass NULL.
+ */
+static int nct6694_hif_xfer_msg(struct nct6694 *nct6694,
+				const struct nct6694_cmd_header *cmd_hd,
+				u8 hctrl, const void *tx, void *rx)
+{
+	struct nct6694_hif_data *hdata = nct6694->priv;
+	void __iomem *hdr = hdata->msg_base + offsetof(struct nct6694_hif_msg, cmd_header);
+	void __iomem *payload = hdata->msg_base + offsetof(struct nct6694_hif_msg, data);
+	struct nct6694_cmd_header cmd = *cmd_hd;
+	struct nct6694_response_header resp;
+	u16 len = le16_to_cpu(cmd.len);
+	u16 resp_len;
+	u8 status;
+	int ret;
+
+	if (len > NCT6694_MAX_PACKET_SIZE)
+		return -EINVAL;
+
+	/* Wait until the previous command is completed */
+	ret = readb_poll_timeout(hdr + offsetof(struct nct6694_cmd_header, hctrl),
+				 status, status == 0, NCT6694_POLL_INTERVAL_US,
+				 NCT6694_POLL_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	/*
+	 * Write cmd header fields, but skip hctrl - writing to it triggers
+	 * firmware command processing and must be deferred until data is ready.
+	 */
+	memcpy_toio(hdr, &cmd, offsetof(struct nct6694_cmd_header, hctrl));
+	memcpy_toio(hdr + offsetof(struct nct6694_cmd_header, rsv2), &cmd.rsv2,
+		    sizeof(cmd) - offsetof(struct nct6694_cmd_header, rsv2));
+
+	if (tx)
+		memcpy_toio(payload, tx, len);
+
+	/* Write hctrl last to trigger command processing */
+	writeb(hctrl, hdr + offsetof(struct nct6694_cmd_header, hctrl));
+
+	ret = readb_poll_timeout(hdr + offsetof(struct nct6694_cmd_header, hctrl),
+				 status, status == 0, NCT6694_POLL_INTERVAL_US,
+				 NCT6694_POLL_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	memcpy_fromio(&resp, hdata->msg_base + offsetof(struct nct6694_hif_msg, response_header),
+		      sizeof(resp));
+
+	ret = nct6694_hif_err_handling(nct6694, resp.sts);
+	if (ret)
+		return ret;
+
+	if (!rx)
+		return 0;
+
+	/* The firmware may answer with fewer bytes than requested */
+	resp_len = min(len, le16_to_cpu(resp.len));
+	memcpy_fromio(rx, payload, resp_len);
+	memset(rx + resp_len, 0, len - resp_len);
+
+	return 0;
+}
+
+static int nct6694_hif_regmap_read(void *context, const void *reg_buf,
+				   size_t reg_size, void *val_buf,
+				   size_t val_size)
+{
+	struct nct6694 *nct6694 = context;
+	struct nct6694_hif_data *hdata = nct6694->priv;
+	u32 reg = get_unaligned_be32(reg_buf);
+	u8 hctrl = FIELD_GET(NCT6694_REG_HCTRL, reg);
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = FIELD_GET(NCT6694_REG_MOD, reg),
+		.offset = cpu_to_le16(FIELD_GET(NCT6694_REG_OFFSET, reg)),
+		.len = cpu_to_le16(val_size),
+	};
+
+	if (cmd_hd.mod == NCT6694_RPT_MOD)
+		return regmap_bulk_read(hdata->rpt_regmap,
+					FIELD_GET(NCT6694_REG_OFFSET, reg),
+					val_buf, val_size);
+
+	return nct6694_hif_xfer_msg(nct6694, &cmd_hd, hctrl,
+				    hctrl == NCT6694_HCTRL_SET ? val_buf : NULL,
+				    val_buf);
+}
+
+static int nct6694_hif_regmap_write(void *context, const void *data,
+				    size_t count)
+{
+	struct nct6694 *nct6694 = context;
+	struct nct6694_hif_data *hdata = nct6694->priv;
+	u32 reg = get_unaligned_be32(data);
+	size_t len = count - sizeof(reg);
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = FIELD_GET(NCT6694_REG_MOD, reg),
+		.offset = cpu_to_le16(FIELD_GET(NCT6694_REG_OFFSET, reg)),
+		.len = cpu_to_le16(len),
+	};
+
+	if (cmd_hd.mod == NCT6694_RPT_MOD)
+		return regmap_bulk_write(hdata->rpt_regmap,
+					 FIELD_GET(NCT6694_REG_OFFSET, reg),
+					 data + sizeof(reg), len);
+
+	return nct6694_hif_xfer_msg(nct6694, &cmd_hd, NCT6694_HCTRL_SET,
+				    data + sizeof(reg), NULL);
+}
+
+static const struct regmap_bus nct6694_hif_regmap_bus = {
+	.read = nct6694_hif_regmap_read,
+	.write = nct6694_hif_regmap_write,
+};
+
+static const struct regmap_config nct6694_hif_msg_regmap_config = {
+	.name = "msg",
+	.reg_bits = 32,
+	.val_bits = 8,
+	.reg_stride = 1,
+	.max_raw_read = NCT6694_MAX_PACKET_SIZE,
+	.max_raw_write = NCT6694_MAX_PACKET_SIZE,
+};
+
+static const struct regmap_config nct6694_hif_rpt_regmap_config = {
+	.name = "rpt",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_stride = 1,
+};
+
+static irqreturn_t nct6694_hif_irq_handler(int irq, void *data)
+{
+	struct nct6694 *nct6694 = data;
+	struct nct6694_hif_data *hdata = nct6694->priv;
+	u8 reg_data[4];
+	u32 intr_status;
+	int ret;
+
+	/* Check interrupt status is set */
+	if (!(inb(hdata->shm_base + NCT6694_SHM_COFS_STS) & NCT6694_SHM_COFS_STS_COFS4W))
+		return IRQ_NONE;
+
+	/* Clear interrupt status */
+	outb(NCT6694_SHM_COFS_STS_COFS4W, hdata->shm_base + NCT6694_SHM_COFS_STS);
+
+	ret = regmap_bulk_read(hdata->rpt_regmap, NCT6694_SHM_INTR_STATUS,
+			       reg_data, ARRAY_SIZE(reg_data));
+	if (ret)
+		return IRQ_HANDLED;
+
+	intr_status = get_unaligned_le32(reg_data);
+
+	while (intr_status) {
+		int hwirq = __ffs(intr_status);
+		unsigned int virq = irq_find_mapping(nct6694->domain, hwirq);
+
+		if (virq)
+			generic_handle_irq_safe(virq);
+
+		intr_status &= ~BIT(hwirq);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void nct6694_hif_irq_disable(void *data)
+{
+	struct nct6694 *nct6694 = data;
+	struct nct6694_hif_data *hdata = nct6694->priv;
+	u8 cofs_ctl2;
+
+	/* Disable SIRQ interrupt */
+	cofs_ctl2 = inb(hdata->shm_base + NCT6694_SHM_COFS_CTL2);
+	cofs_ctl2 &= ~NCT6694_SHM_COFS_CTL2_COFS4W_IE;
+	outb(cofs_ctl2, hdata->shm_base + NCT6694_SHM_COFS_CTL2);
+}
+
+static void nct6694_hif_irq_enable(struct nct6694 *nct6694)
+{
+	struct nct6694_hif_data *hdata = nct6694->priv;
+	u8 cofs_ctl2;
+
+	/* Enable SIRQ interrupt */
+	cofs_ctl2 = inb(hdata->shm_base + NCT6694_SHM_COFS_CTL2);
+	cofs_ctl2 |= NCT6694_SHM_COFS_CTL2_COFS4W_IE;
+	outb(cofs_ctl2, hdata->shm_base + NCT6694_SHM_COFS_CTL2);
+}
+
+static int nct6694_hif_irq_init(struct nct6694 *nct6694, int irq)
+{
+	struct nct6694_hif_data *hdata = nct6694->priv;
+	struct nct6694_sio_data *sio_data = hdata->sio_data;
+	struct irq_data *irq_data;
+	irq_hw_number_t hwirq;
+	int ret;
+
+	/* The chip is programmed with the SIRQ line, not the Linux irq number */
+	irq_data = irq_get_irq_data(irq);
+	if (!irq_data)
+		return -EINVAL;
+
+	hwirq = irqd_to_hwirq(irq_data);
+	if (hwirq > SIO_SHM_IRQ_NR_MAX)
+		return -ERANGE;
+
+	/* Set SIRQ number */
+	ret = superio_enter(sio_data);
+	if (ret)
+		return ret;
+
+	superio_select(sio_data, SIO_REG_LD_SHM);
+
+	if (!superio_inb(sio_data, SIO_REG_SHM_ENABLE)) {
+		superio_exit(sio_data);
+		return -EIO;
+	}
+
+	hdata->shm_base = superio_inw(sio_data, SIO_REG_SHM_BASE_ADDR);
+	if (!hdata->shm_base) {
+		superio_exit(sio_data);
+		return -ENODEV;
+	}
+
+	superio_outb(sio_data, SIO_REG_SHM_IRQ_NR, hwirq);
+
+	superio_exit(sio_data);
+
+	if (!devm_request_region(nct6694->dev,
+				 hdata->shm_base + NCT6694_SHM_COFS_STS,
+				 NCT6694_SHM_COFS_LEN, DRVNAME))
+		return -EBUSY;
+
+	/* Keep the device quiet until the IRQ domain is ready */
+	nct6694_hif_irq_disable(nct6694);
+	outb(NCT6694_SHM_COFS_STS_COFS4W, hdata->shm_base + NCT6694_SHM_COFS_STS);
+
+	return 0;
+}
+
+static void nct6694_hif_core_remove_action(void *data)
+{
+	struct nct6694 *nct6694 = data;
+
+	nct6694_core_remove(nct6694);
+}
+
+static const u8 sio_addrs[] = { 0x2e, 0x4e };
+
+static int nct6694_hif_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nct6694_sio_data *sio_data;
+	struct nct6694_hif_data *hdata;
+	struct nct6694 *nct6694;
+	void __iomem *rpt_base, *msg_base;
+	int ret, i, irq;
+
+	rpt_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rpt_base))
+		return PTR_ERR(rpt_base);
+
+	msg_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(msg_base))
+		return PTR_ERR(msg_base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	sio_data = devm_kzalloc(dev, sizeof(*sio_data), GFP_KERNEL);
+	if (!sio_data)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(sio_addrs); i++) {
+		if (!nct6694_sio_find(sio_data, sio_addrs[i]))
+			break;
+	}
+	if (i == ARRAY_SIZE(sio_addrs))
+		return -ENODEV;
+
+	dev_dbg(dev, "Found %s at %#x\n", nct6694_chip_names[sio_data->chip], sio_data->sioreg);
+
+	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
+	if (!nct6694)
+		return -ENOMEM;
+
+	hdata = devm_kzalloc(dev, sizeof(*hdata), GFP_KERNEL);
+	if (!hdata)
+		return -ENOMEM;
+
+	hdata->sio_data = sio_data;
+	hdata->msg_base = msg_base;
+	hdata->rpt_regmap = devm_regmap_init_mmio(dev, rpt_base,
+						  &nct6694_hif_rpt_regmap_config);
+	if (IS_ERR(hdata->rpt_regmap))
+		return PTR_ERR(hdata->rpt_regmap);
+
+	nct6694->dev = dev;
+	nct6694->priv = hdata;
+	nct6694->regmap = devm_regmap_init(dev, &nct6694_hif_regmap_bus, nct6694,
+					   &nct6694_hif_msg_regmap_config);
+	if (IS_ERR(nct6694->regmap))
+		return PTR_ERR(nct6694->regmap);
+
+	ret = nct6694_hif_irq_init(nct6694, irq);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, nct6694);
+
+	/* Request the interrupt first so that devres releases it last */
+	ret = devm_request_threaded_irq(dev, irq, NULL, nct6694_hif_irq_handler,
+					IRQF_ONESHOT | IRQF_SHARED,
+					dev_name(dev), nct6694);
+	if (ret)
+		return ret;
+
+	ret = nct6694_core_probe(dev, nct6694, nct6694_hif_devs,
+				 ARRAY_SIZE(nct6694_hif_devs));
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, nct6694_hif_core_remove_action, nct6694);
+	if (ret)
+		return ret;
+
+	nct6694_hif_irq_enable(nct6694);
+
+	return devm_add_action_or_reset(dev, nct6694_hif_irq_disable, nct6694);
+}
+
+static const struct acpi_device_id nct6694_hif_acpi_ids[] = {
+	{ "NTN0538", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, nct6694_hif_acpi_ids);
+
+static struct platform_driver nct6694_hif_driver = {
+	.driver = {
+		.name = DRVNAME,
+		.acpi_match_table = nct6694_hif_acpi_ids,
+	},
+	.probe	= nct6694_hif_probe,
+};
+module_platform_driver(nct6694_hif_driver);
+
+MODULE_DESCRIPTION("Nuvoton NCT6694 host-interface transport driver");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

