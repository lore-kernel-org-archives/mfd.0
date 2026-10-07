Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127A546C4A7
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364952; cv=none; b=uKO8UjZo9A/3R0zIqsd3VU67sQVXBEwFd9AvMyLNCDEKJppsZdb5Yy20m3B6wdF/+nlc/q+pODPEkCKt5p0OIpZygzFHJPWJqA01naK3ZogklNoyqt1q3PxEuIqPzOnCCPm2yZ3/hXnkttBzgOhRQ4E37Ge/7JL8O+7k5QqZtiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364952; c=relaxed/simple;
	bh=P8DcaDyloUSHH6tyh7gkZMDkHNjzoxVgXbxZjvb1tMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oEQ+tjynUH1q0oG57JnfpvbbBca6f4HN9EKxLFGhUMR1HDm6/9owgWc8rJstXa4eCiU+Y7lT3jJTds0Lnl+JTqRAsher3B6EPXwsk3M8+8HDb+z3rLrpI+KHtlYyhqP+IBEdq4hSzLtLC4yW9qBPaPExKn5z259JGxznGMnBI64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7tdzeVa; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7tdzeVa"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c9879395so830222a12.1
        for <mfd@lists.linux.dev>; Wed, 07 Oct 2026 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364917; x=1791969717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1h3IXAG3nbsqOmiftp8JIt4CSVlO4ck1uT8LyManWE=;
        b=h7tdzeVaHpi/MoqiwD775GscNrvlFLWXf+dksLazCTmKqHPzggeybI8yFVZdFVlyN8
         dgeseDXnxHHNlPp6cecx+GXf7PNRhczP+uyHrEbGxj6jobw/rFkslYFrUUmIi2NGEQz2
         ymOkAjrJ9MKs+VcqgJyckpWvxgZOCRbZQWYd01Qzrhd8lPMkldk3WZD/muuyP6Hnm+C8
         AILP2QNpHZtxNv8FonM6qutjA/J3eXT8QNXnm7ehCwoX7Xepc1VCm6C9naJGcOp98mQw
         9flopVHcC4UNzMaL7qPbjNY2KnGnpY0zwt1uz3x8GAmTRltUHgTSPcex6m7f29sfjaFh
         g+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364917; x=1791969717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1h3IXAG3nbsqOmiftp8JIt4CSVlO4ck1uT8LyManWE=;
        b=jwbOHQibVGYiHLdBbRKa0ZGz0DWnunkRU2+RBq77wv9yjrIPSrktqbOuJgXVhBp6Hs
         FVCQGabo530BQIWejbGUke/mj9K2EJJvHctHY8rwCj847SHtcuhL2EJeKovWmdn0gdQ/
         wUshlWV4XMwlzlNJdZpAgFdEU0FYloBg3v+jQj+aBhnaVfcajkZJWCpHrZI9ROSPYtIM
         l4AmG6SBZ0q3ASi7zFz7zJW+K0dHVUemEuS7effeEuxyPmSyooiwxc4mxe6wJm8g3w20
         4WhzWSoT6HoioQBrx4b7344MVdFJalmrd2FEwVsN3oWr7sKmNXV13CkHCGoh4Bx2x7d3
         K1bQ==
X-Forwarded-Encrypted: i=1; AKwUvBz11HF6dmvC/7yZxRqPTm97uOzquYAIZIMkqhv6iIEs+1eRuTAYIAXjKGDZv9A+IJ7s8Mg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJpjoq+LY2/adqPZbA1RMVxn/UpEfe6hkr0JaGRiaEmP+8EFkzh
	y2Am21rbuWewlsVn9o5IxgvMRGA1x3wPB0pystLPIyo7fn7PNjUBNoVU
X-Gm-Gg: AYBFou0CccNEn7dKsxCaDBXJvcTljVxx0VKsEwNet4nZrBEmvt28xcvhyxmTkg+8ann
	nVUsSgmU+JSDG1/dim35h6USCz303g+P49bTVPBHGOUxpseqoX/6FsypFDgfJTTXxAtei37nct0
	hYb6FwxC+263b5cMq2L7jHKuH0sfYgPnuuimtG9fKj0Sx/gS1PnLpe6ucpXctco5aSdc8JjEQxE
	PQZsFpz7p5SrbX3u3f6JidM5ys/oEPXMfynoQUlTXdof5kpt1NWGh3EeDKKtzVNVlKLmm14aTbb
	tODNrEg7SGrnWLxid7id4z2DMyNDFAenrcR3/43s6QykqHEVYYfmsa3/2G8jf/1XxG3lA55S2vR
	YiJSKW75fLdOuSPGYKBO2QbKU2IP25/AbBuewFOA7x1B5R3lc8/Ab3a9qiXS8LRKRoG3CtqtoLq
	XhgEn9ImubNoUDs+tWkYf99YVLMGOceJJI8HpeUY++Ph+Oy3ytFlnKr7pwaOPFpD9wuuHqfBwA1
	9g+X0IRja2kS5j7jCrO8bSTAhOd+Lf4+ODiHEK6
X-Received: by 2002:a17:903:2ac3:b0:2dd:2b8:7198 with SMTP id d9443c01a7336-2e5ffabd5famr13974385ad.6.1791364916848;
        Wed, 07 Oct 2026 02:21:56 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:56 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 13/13] mfd: nct6694: Add Host Interface (HIF) eSPI transport driver
Date: Wed,  7 Oct 2026 17:21:02 +0800
Message-Id: <20261007092102.3768818-14-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Add support for the Host Interface (HIF) transport over eSPI for the
Nuvoton NCT6694.

The driver locates the Super-I/O to configure the shared memory base
address and SIRQ, and implements a regmap_bus that exchanges firmware
commands through the shared memory window. Report accesses are served
from a separate MMIO regmap.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- Embedded struct nct6694 in nct6694_hif_data and dropped the priv
  pointer; renamed hdata to hif_data and the transfer buffers and
  lengths consistently with the USB transport.
- Adapted to nct6694_device_{init,exit}() and register the MFD cells
  from the transport.
- Request the interrupt after the core is set up, so that it is freed
  before the IRQ domain is removed.
- Dropped the max_raw_read/max_raw_write settings, which are ignored
  with a regmap_bus.

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

 drivers/mfd/Kconfig         |  13 +
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/nct6694-hif.c   | 572 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h |   2 +-
 4 files changed, 587 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mfd/nct6694-hif.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index de7d2171f514..9afd6b5bd28d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1178,6 +1178,19 @@ config MFD_NCT6694
 	  Additional drivers must be enabled to utilize the specific
 	  functionalities of the device.
 
+config MFD_NCT6694_HIF
+	tristate "Nuvoton NCT6694 HIF (eSPI) interface support"
+	depends on MFD_NCT6694 && HAS_IOPORT && ACPI
+	select REGMAP_MMIO
+	help
+	  This enables support for the Nuvoton NCT6694 connected through
+	  the Host Interface (HIF) over eSPI. The driver uses the Super-I/O
+	  configuration and the shared memory window to send commands to
+	  the device firmware.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called nct6694-hif.
+
 config MFD_NCT6694_USB
 	tristate "Nuvoton NCT6694 USB interface support"
 	depends on MFD_NCT6694 && USB
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index a42b99250454..f98a92058827 100644
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
index 000000000000..3880f024d313
--- /dev/null
+++ b/drivers/mfd/nct6694-hif.c
@@ -0,0 +1,572 @@
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
+	struct nct6694 core;
+	struct regmap *rpt_regmap;
+	struct nct6694_sio_data *sio_data;
+	void __iomem *msg_base;
+	unsigned int shm_base;
+};
+
+static struct nct6694_hif_data *to_nct6694_hif_data(struct nct6694 *ddata)
+{
+	return container_of(ddata, struct nct6694_hif_data, core);
+}
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
+static int nct6694_hif_err_handling(struct nct6694 *ddata, unsigned char err_status)
+{
+	switch (err_status) {
+	case NCT6694_NO_ERROR:
+		return 0;
+	case NCT6694_NOT_SUPPORT_ERROR:
+		dev_err(ddata->dev, "Command is not supported!\n");
+		break;
+	case NCT6694_NO_RESPONSE_ERROR:
+		dev_warn(ddata->dev, "Command received no response!\n");
+		break;
+	case NCT6694_TIMEOUT_ERROR:
+		dev_warn(ddata->dev, "Command timed out!\n");
+		break;
+	case NCT6694_PENDING:
+		dev_err(ddata->dev, "Command is pending!\n");
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return -EIO;
+}
+
+/* @tx_buf is NULL for GET, @rx_buf is NULL if the reply is not needed */
+static int nct6694_hif_xfer_msg(struct nct6694 *ddata,
+				const struct nct6694_cmd_header *cmd_hd,
+				u8 hctrl, const void *tx_buf, void *rx_buf)
+{
+	struct nct6694_hif_data *hif_data = to_nct6694_hif_data(ddata);
+	void __iomem *hdr = hif_data->msg_base + offsetof(struct nct6694_hif_msg, cmd_header);
+	void __iomem *data = hif_data->msg_base + offsetof(struct nct6694_hif_msg, data);
+	struct nct6694_cmd_header cmd = *cmd_hd;
+	struct nct6694_response_header resp;
+	u16 data_len = le16_to_cpu(cmd.len);
+	u16 resp_len;
+	u8 status;
+	int ret;
+
+	if (data_len > NCT6694_MAX_DATA_LEN)
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
+	if (tx_buf)
+		memcpy_toio(data, tx_buf, data_len);
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
+	memcpy_fromio(&resp, hif_data->msg_base + offsetof(struct nct6694_hif_msg, response_header),
+		      sizeof(resp));
+
+	ret = nct6694_hif_err_handling(ddata, resp.sts);
+	if (ret)
+		return ret;
+
+	if (!rx_buf)
+		return 0;
+
+	/* The firmware may answer with fewer bytes than requested */
+	resp_len = min(data_len, le16_to_cpu(resp.len));
+	memcpy_fromio(rx_buf, data, resp_len);
+	memset(rx_buf + resp_len, 0, data_len - resp_len);
+
+	return 0;
+}
+
+static int nct6694_hif_regmap_read(void *context, const void *reg_buf,
+				   size_t reg_size, void *val_buf,
+				   size_t val_size)
+{
+	struct nct6694 *ddata = context;
+	struct nct6694_hif_data *hif_data = to_nct6694_hif_data(ddata);
+	u32 reg = get_unaligned_be32(reg_buf);
+	u8 hctrl = FIELD_GET(NCT6694_REG_HCTRL, reg);
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = FIELD_GET(NCT6694_REG_MOD, reg),
+		.offset = cpu_to_le16(FIELD_GET(NCT6694_REG_OFFSET, reg)),
+		.len = cpu_to_le16(val_size),
+	};
+
+	if (cmd_hd.mod == NCT6694_RPT_MOD)
+		return regmap_bulk_read(hif_data->rpt_regmap,
+					FIELD_GET(NCT6694_REG_OFFSET, reg),
+					val_buf, val_size);
+
+	return nct6694_hif_xfer_msg(ddata, &cmd_hd, hctrl,
+				    hctrl == NCT6694_HCTRL_SET ? val_buf : NULL,
+				    val_buf);
+}
+
+static int nct6694_hif_regmap_write(void *context, const void *data,
+				    size_t count)
+{
+	struct nct6694 *ddata = context;
+	struct nct6694_hif_data *hif_data = to_nct6694_hif_data(ddata);
+	u32 reg = get_unaligned_be32(data);
+	size_t data_len = count - sizeof(reg);
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = FIELD_GET(NCT6694_REG_MOD, reg),
+		.offset = cpu_to_le16(FIELD_GET(NCT6694_REG_OFFSET, reg)),
+		.len = cpu_to_le16(data_len),
+	};
+
+	if (cmd_hd.mod == NCT6694_RPT_MOD)
+		return regmap_bulk_write(hif_data->rpt_regmap,
+					 FIELD_GET(NCT6694_REG_OFFSET, reg),
+					 data + sizeof(reg), data_len);
+
+	return nct6694_hif_xfer_msg(ddata, &cmd_hd, NCT6694_HCTRL_SET,
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
+};
+
+static const struct regmap_config nct6694_hif_rpt_regmap_config = {
+	.name = "rpt",
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static irqreturn_t nct6694_hif_irq_handler(int irq, void *data)
+{
+	struct nct6694_hif_data *hif_data = data;
+	u8 reg_data[4];
+	u32 intr_status;
+	int ret;
+
+	if (!(inb(hif_data->shm_base + NCT6694_SHM_COFS_STS) & NCT6694_SHM_COFS_STS_COFS4W))
+		return IRQ_NONE;
+
+	outb(NCT6694_SHM_COFS_STS_COFS4W, hif_data->shm_base + NCT6694_SHM_COFS_STS);
+
+	ret = regmap_bulk_read(hif_data->rpt_regmap, NCT6694_SHM_INTR_STATUS,
+			       reg_data, ARRAY_SIZE(reg_data));
+	if (ret)
+		return IRQ_HANDLED;
+
+	intr_status = get_unaligned_le32(reg_data);
+
+	while (intr_status) {
+		int hwirq = __ffs(intr_status);
+
+		generic_handle_domain_irq_safe(hif_data->core.domain, hwirq);
+		intr_status &= ~BIT(hwirq);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void nct6694_hif_irq_disable(void *data)
+{
+	struct nct6694_hif_data *hif_data = data;
+	u8 cofs_ctl2;
+
+	cofs_ctl2 = inb(hif_data->shm_base + NCT6694_SHM_COFS_CTL2);
+	cofs_ctl2 &= ~NCT6694_SHM_COFS_CTL2_COFS4W_IE;
+	outb(cofs_ctl2, hif_data->shm_base + NCT6694_SHM_COFS_CTL2);
+}
+
+static void nct6694_hif_irq_enable(struct nct6694_hif_data *hif_data)
+{
+	u8 cofs_ctl2;
+
+	cofs_ctl2 = inb(hif_data->shm_base + NCT6694_SHM_COFS_CTL2);
+	cofs_ctl2 |= NCT6694_SHM_COFS_CTL2_COFS4W_IE;
+	outb(cofs_ctl2, hif_data->shm_base + NCT6694_SHM_COFS_CTL2);
+}
+
+static int nct6694_hif_irq_init(struct nct6694_hif_data *hif_data, int irq)
+{
+	struct nct6694_sio_data *sio_data = hif_data->sio_data;
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
+	hif_data->shm_base = superio_inw(sio_data, SIO_REG_SHM_BASE_ADDR);
+	if (!hif_data->shm_base) {
+		superio_exit(sio_data);
+		return -ENODEV;
+	}
+
+	superio_outb(sio_data, SIO_REG_SHM_IRQ_NR, hwirq);
+
+	superio_exit(sio_data);
+
+	if (!devm_request_region(hif_data->core.dev,
+				 hif_data->shm_base + NCT6694_SHM_COFS_STS,
+				 NCT6694_SHM_COFS_LEN, DRVNAME))
+		return -EBUSY;
+
+	/* Keep the device quiet until the IRQ domain is ready */
+	nct6694_hif_irq_disable(hif_data);
+	outb(NCT6694_SHM_COFS_STS_COFS4W, hif_data->shm_base + NCT6694_SHM_COFS_STS);
+
+	return 0;
+}
+
+static void nct6694_hif_device_exit(void *dev)
+{
+	nct6694_device_exit(dev);
+}
+
+static const u8 sio_addrs[] = { 0x2e, 0x4e };
+
+static int nct6694_hif_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nct6694_sio_data *sio_data;
+	struct nct6694_hif_data *hif_data;
+	void __iomem *rpt_base, *msg_base;
+	struct nct6694 *ddata;
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
+	hif_data = devm_kzalloc(dev, sizeof(*hif_data), GFP_KERNEL);
+	if (!hif_data)
+		return -ENOMEM;
+
+	hif_data->sio_data = sio_data;
+	hif_data->msg_base = msg_base;
+	hif_data->rpt_regmap = devm_regmap_init_mmio(dev, rpt_base,
+						     &nct6694_hif_rpt_regmap_config);
+	if (IS_ERR(hif_data->rpt_regmap))
+		return PTR_ERR(hif_data->rpt_regmap);
+
+	ddata = &hif_data->core;
+	ddata->dev = dev;
+	ddata->regmap = devm_regmap_init(dev, &nct6694_hif_regmap_bus, ddata,
+					 &nct6694_hif_msg_regmap_config);
+	if (IS_ERR(ddata->regmap))
+		return PTR_ERR(ddata->regmap);
+
+	ret = nct6694_hif_irq_init(hif_data, irq);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, ddata);
+
+	ret = nct6694_device_init(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, nct6694_hif_device_exit, dev);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(dev, irq, NULL, nct6694_hif_irq_handler,
+					IRQF_ONESHOT | IRQF_SHARED,
+					dev_name(dev), hif_data);
+	if (ret)
+		return ret;
+
+	nct6694_hif_irq_enable(hif_data);
+
+	ret = devm_add_action_or_reset(dev, nct6694_hif_irq_disable, hif_data);
+	if (ret)
+		return ret;
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, nct6694_hif_devs,
+				    ARRAY_SIZE(nct6694_hif_devs), NULL, 0, NULL);
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
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 1593806d34fd..34ea9edfca42 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2025 Nuvoton Technology Corp.
  *
- * Nuvoton NCT6694 core definitions shared by the transport driver
+ * Nuvoton NCT6694 core definitions shared by the transport drivers
  * and the sub-device drivers.
  */
 
-- 
2.34.1

