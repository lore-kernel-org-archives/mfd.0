Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797533D9689;
	Wed, 14 Oct 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971346; cv=none; b=MJ11UsYa7qdACiqv3AjR8KAdxU/s4pVXAlS9a9WXuVUTNTDTO4+NpexBZSyvoSo/gxHhBWfphsWPPn68gKrjW6w9gATaLF4jBb0RIOx7mA6yi4Y0DGniMcWi4adRIs2VbTBc9IMJ5QWBE5/aQcSgGW3PC4Q9p7A6nqQV64JK4tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971346; c=relaxed/simple;
	bh=dmtvFnbT/qiJQJAWMo+oYUTME5Zn0gcAPE62bNiPWvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDQQ3iN8onoqV+O2yamGA4y36AHYcYmOYGhiV6jqct3g0qY/fhSQeBp+rZuGuKKj1lFJllm4n+pPb6+7NkioT+UBwVxxJnIZwJhGslIztGPrEsrr/0eA9rpCSgHZYMLZM6x3Q1+FuNr/pYHM9I6ObAZOawMx7jpeS7CHU2le3Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7Moi3zj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7Moi3zj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD31D1F000FF;
	Wed, 14 Oct 2026 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971344;
	bh=r2PZH9rvwhfnhzGEchpWvg/vIL49C6ucN6Lb9LuHIWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N7Moi3zjwIAcB0kMWfmbYQ7wsD91LeUokDe1+FapvC2eDS9sD/w6uR0Nqza2QAMpj
	 WvwovyiHHZWjAa/wSEfWWPOwOUEW7ssOnZqhIKiJzctv/6/aKUcvsX4X6VP4KpzXw9
	 VoONPc7fz4Iad169Mq+vEE1PAOi5GtsKNJnplrxG7Xsui0B/SYNW/5R1ZvQjQ1NwLc
	 294JeQKc4LiK+JIYhdnF/EWmMZeRkNZXyv7713rRXhtMR0OMmHCCijShi7QFNOIDWZ
	 /CAMUlLBUE27F1BjMCfi6wmTM6LEbKk6jmAFS2nJ3znz2DOW54XTOvNPlhdOZJMlsa
	 ED0QPzBgGfQ3w==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 11:48:46 +0200
Subject: [PATCH RFC 4/5] bus: Add a shared BCMBCA PMC3 PMB transport
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-xg6846b-bcmbca-xrdp-reset-v1-4-daf5d177e113@kernel.org>
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
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

Add a bus driver for shared access to the Processor Monitor Bus (PMB)
of the third generation Platform Management Controller (PMC3), initially
for BCM6846.

Serialize complete register sequences with a mutex and the
keyhole hardware lock.

A software timeout does not abort a transaction. If the keyhole is
still busy, retain its hardware lock and reject new callers until
delayed work observes completion and releases it.

Build this fixed SoC transport into the kernel and suppress sysfs
bind/unbind controls. The reset child can remain modular. Runtime
removal of the PMB platform device is unsupported.

The keyhole register layout differs from older Broadcom PMB
controllers. Match only BCM6846 for now.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/bus/Kconfig                |  13 +++
 drivers/bus/Makefile               |   1 +
 drivers/bus/bcmbca_pmc3_pmb.c      | 232 +++++++++++++++++++++++++++++++++++++
 include/linux/soc/bcm/bcmbca-pmb.h |  25 ++++
 4 files changed, 271 insertions(+)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e4b1db809187..a3cf367c4327 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -29,6 +29,19 @@ config ARM_INTEGRATOR_LM
 	  Say y here to enable support for the ARM Logic Module bus
 	  found on the ARM Integrator AP (Application Platform)
 
+config BCMBCA_PMB
+	bool "Broadcom BCMBCA Processor Monitor Bus"
+	depends on ARCH_BCMBCA || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	help
+	  Provide shared Processor Monitor Bus (PMB) access through the third
+	  generation Platform Management Controller (PMC3), initially on
+	  BCM6846. Child drivers use this transport for operations such as
+	  coordinated resets. Firmware must power the target blocks first.
+
+	  This fixed SoC transport is built-in and cannot be unbound through
+	  sysfs, so recovery can retain ownership of an active transaction.
+
 config BRCMSTB_GISB_ARB
 	tristate "Broadcom STB GISB bus arbiter"
 	depends on ARCH_BRCMSTB || BMIPS_GENERIC
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index a01f97fef3e8..209af710bbd0 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -7,6 +7,7 @@
 obj-$(CONFIG_ARM_CCI)		+= arm-cci.o
 obj-$(CONFIG_ARM_INTEGRATOR_LM)	+= arm-integrator-lm.o
 obj-$(CONFIG_HISILICON_LPC)	+= hisi_lpc.o
+obj-$(CONFIG_BCMBCA_PMB)		+= bcmbca_pmc3_pmb.o
 obj-$(CONFIG_BRCMSTB_GISB_ARB)	+= brcmstb_gisb.o
 obj-$(CONFIG_MOXTET)		+= moxtet.o
 
diff --git a/drivers/bus/bcmbca_pmc3_pmb.c b/drivers/bus/bcmbca_pmc3_pmb.c
new file mode 100644
index 000000000000..998a254c57d3
--- /dev/null
+++ b/drivers/bus/bcmbca_pmc3_pmb.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Broadcom BCMBCA Processor Monitor Bus (PMB) transport for the third
+ * generation Platform Management Controller (PMC3).
+ *
+ * The bus child of the PMC complex supplies the PMB register bank.
+ * Children share keyhole 0 and hold its software and hardware locks across
+ * complete sequences. A software timeout does not abort a PMB transaction:
+ * keep the hardware lock until completion, even after returning an error.
+ * Module removal and sysfs unbind are not supported for this fixed SoC
+ * transport, allowing recovery to wait for delayed transaction completion.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/ioport.h>
+#include <linux/log2.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/soc/bcm/bcmbca-pmb.h>
+#include <linux/workqueue.h>
+
+#define PMB_CONFIG		0x00
+#define PMB_REGS_PER_DEVICE	GENMASK(29, 20)
+#define PMB_CONTROL		0x10
+#define PMB_WRITE_DATA		0x14
+#define PMB_MUTEX		0x18
+#define PMB_READ_DATA		0x1c
+#define PMB_START		BIT(31)
+#define PMB_TIMEOUT		BIT(30)
+#define PMB_SLAVE_ERROR		BIT(29)
+#define PMB_BUSY			BIT(28)
+#define PMB_WRITE		BIT(24)
+#define PMB_BUS			GENMASK(21, 20)
+#define PMB_LOCKED		BIT(0)
+
+struct bcmbca_pmb {
+	struct device *dev;
+	void __iomem *base;
+	/* Serializes register sequences and recovery state. */
+	struct mutex lock;
+	struct delayed_work recovery;
+	u32 regs_per_device;
+	bool recovering;
+	bool stopping;
+};
+
+static struct platform_driver bcmbca_pmb_driver;
+
+/* Only children populated by this provider may borrow its transport. */
+struct bcmbca_pmb *bcmbca_pmb_get(struct device *dev)
+{
+	if (!dev->parent || dev->parent->driver != &bcmbca_pmb_driver.driver)
+		return ERR_PTR(-ENODEV);
+
+	return dev_get_drvdata(dev->parent);
+}
+EXPORT_SYMBOL_GPL(bcmbca_pmb_get);
+
+static void bcmbca_pmb_recover(struct work_struct *work)
+{
+	struct bcmbca_pmb *pmb = container_of(to_delayed_work(work),
+					   struct bcmbca_pmb, recovery);
+
+	mutex_lock(&pmb->lock);
+	if (!pmb->stopping) {
+		if (readl(pmb->base + PMB_CONTROL) & PMB_BUSY) {
+			queue_delayed_work(system_dfl_wq, &pmb->recovery,
+					   msecs_to_jiffies(100));
+		} else {
+			writel(PMB_LOCKED, pmb->base + PMB_MUTEX);
+			pmb->recovering = false;
+		}
+	}
+	mutex_unlock(&pmb->lock);
+}
+
+int bcmbca_pmb_lock(struct bcmbca_pmb *pmb)
+{
+	u32 value;
+	int ret;
+
+	mutex_lock(&pmb->lock);
+	if (pmb->stopping) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+	if (pmb->recovering) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	/* Reading bit 0 acquires the hardware lock; writing 1 releases it. */
+	ret = readl_poll_timeout(pmb->base + PMB_MUTEX, value,
+				 value & PMB_LOCKED, 1, 1000);
+	if (!ret)
+		return 0;
+unlock:
+	mutex_unlock(&pmb->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(bcmbca_pmb_lock);
+
+void bcmbca_pmb_unlock(struct bcmbca_pmb *pmb)
+{
+	lockdep_assert_held(&pmb->lock);
+	if (readl(pmb->base + PMB_CONTROL) & PMB_BUSY) {
+		pmb->recovering = true;
+		dev_err(pmb->dev, "PMB keyhole still busy; deferring unlock\n");
+		queue_delayed_work(system_dfl_wq, &pmb->recovery,
+				   msecs_to_jiffies(100));
+	} else {
+		writel(PMB_LOCKED, pmb->base + PMB_MUTEX);
+	}
+	mutex_unlock(&pmb->lock);
+}
+EXPORT_SYMBOL_GPL(bcmbca_pmb_unlock);
+
+static int bcmbca_pmb_op(struct bcmbca_pmb *pmb, u8 bus, u8 device,
+			 u16 offset, u32 *value, bool write)
+{
+	u32 status, command;
+	int ret;
+
+	lockdep_assert_held(&pmb->lock);
+	if (bus > FIELD_MAX(PMB_BUS) || offset >= pmb->regs_per_device)
+		return -EINVAL;
+
+	ret = readl_poll_timeout(pmb->base + PMB_CONTROL, status,
+				 !(status & PMB_BUSY), 1, 1000);
+	if (ret)
+		return ret;
+	command = PMB_START | FIELD_PREP(PMB_BUS, bus) |
+		  (device * pmb->regs_per_device) | offset;
+	if (write) {
+		writel(*value, pmb->base + PMB_WRITE_DATA);
+		command |= PMB_WRITE;
+	}
+	writel(command, pmb->base + PMB_CONTROL);
+	ret = readl_poll_timeout(pmb->base + PMB_CONTROL, status,
+				 !(status & PMB_BUSY), 1, 1000);
+	if (ret || status & PMB_TIMEOUT)
+		return -ETIMEDOUT;
+	if (status & PMB_SLAVE_ERROR)
+		return -EIO;
+	if (!write)
+		*value = readl(pmb->base + PMB_READ_DATA);
+	return 0;
+}
+
+int bcmbca_pmb_read(struct bcmbca_pmb *pmb, u8 bus, u8 device,
+		    u16 offset, u32 *value)
+{
+	return bcmbca_pmb_op(pmb, bus, device, offset, value, false);
+}
+EXPORT_SYMBOL_GPL(bcmbca_pmb_read);
+
+int bcmbca_pmb_write(struct bcmbca_pmb *pmb, u8 bus, u8 device,
+		     u16 offset, u32 value)
+{
+	return bcmbca_pmb_op(pmb, bus, device, offset, &value, true);
+}
+EXPORT_SYMBOL_GPL(bcmbca_pmb_write);
+
+/* Children are removed before this action, while MMIO is still mapped. */
+static void bcmbca_pmb_stop(void *data)
+{
+	struct bcmbca_pmb *pmb = data;
+
+	mutex_lock(&pmb->lock);
+	pmb->stopping = true;
+	mutex_unlock(&pmb->lock);
+	cancel_delayed_work_sync(&pmb->recovery);
+
+	if (pmb->recovering) {
+		if (readl(pmb->base + PMB_CONTROL) & PMB_BUSY)
+			dev_err(pmb->dev, "PMB keyhole remains busy; hardware reset required\n");
+		else
+			writel(PMB_LOCKED, pmb->base + PMB_MUTEX);
+	}
+}
+
+static int bcmbca_pmb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct bcmbca_pmb *pmb;
+	struct resource *res;
+	int ret;
+
+	pmb = devm_kzalloc(dev, sizeof(*pmb), GFP_KERNEL);
+	if (!pmb)
+		return -ENOMEM;
+	pmb->dev = dev;
+	pmb->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(pmb->base))
+		return PTR_ERR(pmb->base);
+	if (resource_size(res) < PMB_READ_DATA + sizeof(u32))
+		return dev_err_probe(dev, -EINVAL, "PMB register range is too small\n");
+	pmb->regs_per_device = FIELD_GET(PMB_REGS_PER_DEVICE,
+					 readl(pmb->base + PMB_CONFIG));
+	if (!is_power_of_2(pmb->regs_per_device))
+		return dev_err_probe(dev, -EINVAL, "invalid PMB register stride\n");
+	mutex_init(&pmb->lock);
+	INIT_DELAYED_WORK(&pmb->recovery, bcmbca_pmb_recover);
+	ret = devm_add_action_or_reset(dev, bcmbca_pmb_stop, pmb);
+	if (ret)
+		return ret;
+	platform_set_drvdata(pdev, pmb);
+	return devm_of_platform_populate(dev);
+}
+
+static const struct of_device_id bcmbca_pmb_match[] = {
+	{ .compatible = "brcm,bcm6846-pmb" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bcmbca_pmb_match);
+
+static struct platform_driver bcmbca_pmb_driver = {
+	.probe = bcmbca_pmb_probe,
+	.driver = {
+		.name = "bcmbca-pmb",
+		.of_match_table = bcmbca_pmb_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(bcmbca_pmb_driver);
+
+MODULE_DESCRIPTION("Broadcom BCMBCA Processor Monitor Bus transport for PMC3");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/bcm/bcmbca-pmb.h b/include/linux/soc/bcm/bcmbca-pmb.h
new file mode 100644
index 000000000000..f95523d52e01
--- /dev/null
+++ b/include/linux/soc/bcm/bcmbca-pmb.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __LINUX_SOC_BCM_BCMBCA_PMB_H
+#define __LINUX_SOC_BCM_BCMBCA_PMB_H
+
+#include <linux/types.h>
+
+struct device;
+struct bcmbca_pmb;
+
+/* The parent bus device owns the Processor Monitor Bus (PMB) transport. */
+struct bcmbca_pmb *bcmbca_pmb_get(struct device *dev);
+
+/*
+ * Processor Monitor Bus (PMB) operations sleep. Hold the transport lock
+ * across a complete sequence, including read/modify/write operations.
+ * A successful lock must be paired with unlock, including on errors.
+ */
+int bcmbca_pmb_lock(struct bcmbca_pmb *pmb);
+void bcmbca_pmb_unlock(struct bcmbca_pmb *pmb);
+int bcmbca_pmb_read(struct bcmbca_pmb *pmb, u8 bus, u8 device,
+		    u16 offset, u32 *value);
+int bcmbca_pmb_write(struct bcmbca_pmb *pmb, u8 bus, u8 device,
+		     u16 offset, u32 value);
+
+#endif

-- 
2.56.0

