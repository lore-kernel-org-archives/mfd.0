Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD3546C4C5
	for <mfd@lists.linux.dev>; Wed,  5 Aug 2026 12:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932448; cv=none; b=MpfNnTh5axKstAAdF1Uf7kWPWol2hUBBQcsSjtH8GK2WLW7uCfxnl/boFdQM483A6NKYANB/K91lRUfd+HkY7PiFT1USwVYlceShmgBcBcBLk3zegKpSuQP+e5PCfPcZpxKrn/1bs8aDlOiC3nzj5otlS1oiHZcJJCO7g6Un6yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932448; c=relaxed/simple;
	bh=roOUZz+FfXSMhtg1bMW71ZDBfr+/TUGyZakL5Aco6Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzXXKhB/kv/q5dq8sP4h4st4ga4RQFiJP3tmjKX7c7L2xCKN8Rk/61OnsnlEkEOoOEPF4f5PROnDXUPb5O1HgZAan3D/UJVLlJ6WFGMvIzyOFaJr6ENNRK/ObLeJDGDYGXoBiFKxu6dJb989PqjJpTFd/MZjZCxBnq4rpUuQVkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=XRIpgpF+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="XRIpgpF+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso4884415e9.3
        for <mfd@lists.linux.dev>; Wed, 05 Aug 2026 05:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932443; x=1786537243; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qy4Y0gaC5ktZKg+2qOASCifq8sJvLeariutbIIYNiz0=;
        b=XRIpgpF+C2qYMvyi40CFY1xmCHwEXHzoVA07/xZSgZHdpNG4dos4mjfsaYOsXs44TO
         ZWgpzD7+5/WG1Ih767KwTbYmGk+ewByl96gkCs0HsjK4DvH8FPeRNl6YExreYkfgdtjw
         z+90BMPSlz76k3WMjt+R1aHZgaVSrx+mk7WderWKJjR23RjAQmWK575SN+hfcF5YFtFo
         aIYU5RSvZqqlOgt020oEMbrImdtI5PSEys14kOfjugHjm+Fl+vf8i4zAHaUExKTcVH5q
         MODjAPBQPwntLXXZLFKK9e5R0wu2SG5a5F+HJTCxRfWlDKpjdW1RB6vRD7k4ZGqRWIiL
         TZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932443; x=1786537243;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy4Y0gaC5ktZKg+2qOASCifq8sJvLeariutbIIYNiz0=;
        b=VYiwFw3Zh6/FujPq0vQIVdzPiCzrT957PPk/oWTXIZVDr1BywJA/+btlkFwEDlkm60
         4Q0S19i/bowxlSSzC/7wTLIRBAWPKtSvPmenRwF7qrF2RHKx2HAxziziCpdsRbEYNnza
         YMW3fW38HKgs2nyhAqGk7/R0k5sRnMz8dfZKFP1LsxG+hOmW3KTI+2JCdLpP+uysP3eM
         JgGTN19m9wYz23BPxP5PoiU3N4dBJl0NChvcHr1pcMKAyMq9pnaiutotMDS3o2GZCAhT
         AxooKTLPMV83XWC8TGK1C/e2OdrMITZFbgsCKBaN7mncaQyI8Xw0l6yaQQMNaRm4g2gq
         +3fw==
X-Forwarded-Encrypted: i=1; AHgh+Rpp1eUPpHOhP5O1r+fz/SEO8OJt6whZQU5v7yOuFPvrxuSqT/jHJT4PH2stdtkDuzsOSG0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBMKNaxMsxKdKIZlKphtERC8MSOnGGG1FMskQy113GJOY1uWOq
	VSbL78Tw1nbcSA2TEuK/1dbBfF+pad6vI3hb1zf8hc2N2zbqmlnrl2x1XByQR9LgMGE=
X-Gm-Gg: AR+sD1349thcbg298CzFPAqntISnc7POgjPEfA7wTZ8O/EABifZWIGIIBl+pI3nB29a
	S/eN5Ugo5Yw9KdSDSvXZREzSN2aK6Jio97Fim5ewf9zy/3LgVZrgCnz/OjZQ8vXDSI8kqcReuBK
	eN7yAwwq0OHtxIeup4QXHGzwkKnd5VEP7UqKfSUsGyjSgmzjKqAgeGn/jO5xZqARj56902P3FHS
	JyV3lAgAIYU16Hc80UvwQmHW+2bUvHJkChYzqUNvQ2RtHs2btl7ZwbppH3Q4eGw0cSEbNKbpGl3
	FgcDNwAi/Z6zuEwKPIaXdfIm9EIHFBAmXo/VW6xwYdEBpAXHC0xyJY/yuOtBXbZYJg2OkrENA9U
	KC1auoime8B5cHTFtkKotZmAWSM8RU7DKViG9p3YhamP0Vur4WCU0KgiIXXEOb1Vvszdb1uwD4m
	pyW0jKOMAJLlAnOfzw9Y8Gfn1FQkHhB9dU/OcQeexypCzcv+sLblIjzCMTuvauh44R/b5XTdqgC
	8IQnBEZcLHQ03iwWOC8lGFQoKxmUWX3MzEr6ibGM/37bZrZHQrh8mDIEefndCN/y1gDebVg6Ta2
	h/cMLalRlM5B
X-Received: by 2002:a05:600c:1f96:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-4994e7cbc2fmr65080725e9.14.1785932442983;
        Wed, 05 Aug 2026 05:20:42 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:42 -0700 (PDT)
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
	lee@kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <git@gregoirelayet.com>,
	Tan Siewert <tan.siewert@9elements.com>
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device driver
Date: Wed,  5 Aug 2026 14:19:51 +0200
Message-ID: <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for UART over PCIe between ASPEED
AST2600 BMC and host.
This is the host-side driver.

Based on ASPEED 6.18 Kernel SDK and trimmed down
and changed to MFD driver.

The AST2600 has two 8250-compatible register set usable over PCIe.
These act as two UARTs. As there is only a FIFO internally between both
ends, they are called Virtual UARTs. This patch adds both VUARTs as
plat_serial8250_port. This is the core driver in charge of setting up
MSI interrupts. It doesn't bind the whole PCIe resource to allow each
sub-driver to bind the needed addresses.

This is not added as a PCI 8250 UART device, but as a MFD driver, as this
host driver can be expanded upon for IPMI over KCS. It can also be used
in the future for custom BMC<->host communication with shared memory and
doorbell.

This host module should be the entry point for setting up all features
related to an AST2600 present on the PCI bus.

Notes on the implementation:
The host can't detect the VUART addresses, so they are forced to
0x3f8 and 0x2f8, as in the initial ASPEED driver.

The MSI vector index of VUART2 has been changed from 15 to 17.
The index 15 used in the initial driver was not working.

Tested:
Data path in both direction is tested on both VUARTs.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 MAINTAINERS                   |   6 ++
 drivers/mfd/Kconfig           |  12 ++++
 drivers/mfd/Makefile          |   2 +
 drivers/mfd/aspeed-pci-core.c | 120 ++++++++++++++++++++++++++++++++++
 4 files changed, 140 insertions(+)
 create mode 100644 drivers/mfd/aspeed-pci-core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4016b3db13af..6afe1b8c6555 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4011,6 +4011,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/aspeed,*
 F:	drivers/crypto/aspeed/
 
+ASPEED PCI BMC DEVICE DRIVER
+M:	Grégoire Layet <git@gregoirelayet.com>
+M:	Tan Siewert <tan.siewert@9elements.com>
+S:	Maintained
+F:	drivers/mfd/aspeed-pci-core.c
+
 ASPEED PECI CONTROLLER
 M:	Iwona Winiarska <iwona.winiarska@intel.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782..dd780f72d169 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2573,5 +2573,17 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_ASPEED_PCI_BMC_DEVICE
+	tristate "ASPEED BMC PCIe device"
+	depends on PCI
+	select MFD_CORE
+	help
+	  Host-side driver for the ASPEED AST2600 BMC PCIe device found on
+	  BMC expansion cards. Exposes two 8250-compatible VUART
+	  ports.
+
+	  If unsure, say N. Choose M here if this machine has an
+	  AST2600-based BMC expansion card on its PCIe bus.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..a364b1b5936b 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -303,3 +303,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_ASPEED_PCI_BMC_DEVICE)	+= aspeed-pci-core.o
diff --git a/drivers/mfd/aspeed-pci-core.c b/drivers/mfd/aspeed-pci-core.c
new file mode 100644
index 000000000000..ad6732133ec5
--- /dev/null
+++ b/drivers/mfd/aspeed-pci-core.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (C) ASPEED Technology Inc.
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/pci.h>
+#include <linux/serial_8250.h>
+#include <linux/mfd/core.h>
+
+#define ASPEED_BMC_MULTI_MSI		32
+#define ASPEED_BMC_PCI_DEVICE_ID	0x2402
+#define ASPEED_BMC_REVISION_AST2700	0x27
+#define ASPEED_BMC_VUART		2
+
+#define DRIVER_NAME "ast2600-pci-core"
+
+static const unsigned int vuart_msi_index[ASPEED_BMC_VUART] = { 16, 17 };
+static const u16 vuart_port_addr[ASPEED_BMC_VUART] = { 0x3f8, 0x2f8 };
+
+struct aspeed_pci_bmc_dev {
+	struct plat_serial8250_port uart[ASPEED_BMC_VUART + 1];
+	struct mfd_cell cell;
+};
+
+static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev,
+					     struct aspeed_pci_bmc_dev *pci_bmc_dev)
+{
+	resource_size_t bar = pci_resource_start(pdev, 1);
+	struct plat_serial8250_port *port;
+	u16 vuart_ioport;
+	unsigned int i;
+
+	for (i = 0; i < ASPEED_BMC_VUART; i++) {
+		port = &pci_bmc_dev->uart[i];
+
+		/* ASPEED BMC device shift addresses by 2 to the left */
+		vuart_ioport = vuart_port_addr[i] << 2;
+
+		port->mapbase = bar + vuart_ioport;
+		port->uartclk = 115200 * 16;
+		port->irq = pci_irq_vector(pdev, vuart_msi_index[i]);
+		port->iotype = UPIO_MEM32;
+		port->type = PORT_16550A;
+		port->flags |= (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
+		port->regshift = 2;
+	}
+
+	pci_bmc_dev->cell = (struct mfd_cell) {
+		.name		= "serial8250",
+		.platform_data	= pci_bmc_dev->uart,
+		.pdata_size	= sizeof(pci_bmc_dev->uart),
+	};
+
+	return 0;
+}
+
+static void aspeed_bmc_pci_free_irqs(void *pdev)
+{
+	pci_free_irq_vectors(pdev);
+}
+
+static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev,
+					    const struct pci_device_id *ent)
+{
+	struct device *dev = &pdev->dev;
+	struct aspeed_pci_bmc_dev *pci_bmc_dev;
+	int rc = 0;
+
+	if (pdev->revision == ASPEED_BMC_REVISION_AST2700)
+		return dev_err_probe(dev, -ENODEV, "AST2700 detected but not supported\n");
+
+	pci_bmc_dev = devm_kzalloc(dev, sizeof(*pci_bmc_dev), GFP_KERNEL);
+	if (!pci_bmc_dev)
+		return -ENOMEM;
+
+	rc = pcim_enable_device(pdev);
+	if (rc)
+		return dev_err_probe(dev, rc, "failed to enable device\n");
+
+	pci_set_master(pdev);
+
+	rc = pci_alloc_irq_vectors(pdev, ASPEED_BMC_MULTI_MSI, ASPEED_BMC_MULTI_MSI, PCI_IRQ_MSI);
+	if (rc < 0)
+		return dev_err_probe(dev, rc, "failed to allocate %d MSI vectors\n",
+				     ASPEED_BMC_MULTI_MSI);
+
+	rc = devm_add_action_or_reset(dev, aspeed_bmc_pci_free_irqs, pdev);
+	if (rc)
+		return rc;
+
+	aspeed_pci_bmc_device_setup_vuart(pdev, pci_bmc_dev);
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				    &pci_bmc_dev->cell, 1, &pdev->resource[1],
+				    0, NULL);
+}
+
+static struct pci_device_id aspeed_bmc_dev_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_ASPEED, ASPEED_BMC_PCI_DEVICE_ID),
+		.class = PCI_CLASS_OTHERS << 16,
+		.class_mask = 0xFFFF00
+	},
+	{ 0 }
+};
+
+MODULE_DEVICE_TABLE(pci, aspeed_bmc_dev_pci_ids);
+
+static struct pci_driver aspeed_host_bmc_dev_driver = {
+	.name		= DRIVER_NAME,
+	.id_table	= aspeed_bmc_dev_pci_ids,
+	.probe		= aspeed_pci_host_bmc_device_probe,
+};
+
+module_pci_driver(aspeed_host_bmc_dev_driver);
+
+MODULE_AUTHOR("Grégoire Layet <gregoire.layet@9elements.com>");
+MODULE_DESCRIPTION("Host-side driver for the ASPEED BMC PCIe device");
+MODULE_LICENSE("GPL");
-- 
2.54.0

