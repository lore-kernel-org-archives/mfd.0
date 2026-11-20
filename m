Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186395;
	b=uV5j54mYsjhc4P6Y/vCLR9lSRxYk54o1wPgGLziTnDA7VD4VMXe4bw9SKOyXp0SlAt/L
	 Jl9YaTZdiZ9E7Oq1jluisH/4o0Ynw4YHJ78BvLUH3cghSv6FiSc2OXBKITXeUJJLJYMUd
	 jr9zsU0JP5b7RjXU1/XUHdLJOk3rt8SGIFvNePkGt3SoH0V84U0jI6C2dlDJLy73FQSxV
	 +LnzmuuoebpdO9amPHGXwr8ZGg9p2fqTGyTiV0f2w4UujgZmtqMj0aU1EZhRXHRKyHH7k
	 cKmEaTRFRec1TGvVkYQ/JgoNPbCVMoPfoRpE8V0qRcxJZO/HHHRoVk41D5I0lMHfy4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186395;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc;
	bh=gLHe0mN7pxYygtroa4+XzdYi7MLtdsV3ip56v/ac0JQ=;
	b=b9yLwLcU1EEWQbdjW3Lsa1viOU8YXsgVuTRrhpiW12tDhURD9Cp62kJsXT529FdvZ0Wn
	 QvVkM9qAhkxYSwnnSJGIY1O4ua3+KiTcwNePJJVZ4Z9MBRCkX+x0C8MdpUHGfQ8aitKHh
	 M5fuZoGJh8CmdQiIzdBDdxcBB05as4GtLTwqwsqRE7gxhX8g7qS6XmdmkYac3EVksLr5b
	 GAyZAygEBKxw1acTEfuk94FXu6le+2fJ0EZ9dTlUc+AyuDz+2S4aiCFPPhu47xpQiO1tZ
	 oXW2cqsxLT4CASo8EjTAVJtDBs3kGA62gyfdAasx8DV+pO4mV6k4e2Snlt0V3mA/1rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AwZ2MI3u;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TCxsRz1y;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011F60A380D
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 14:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D011F60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AwZ2MI3u;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TCxsRz1y
From: Vasilij Strassheim <v.strassheim@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795186393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gLHe0mN7pxYygtroa4+XzdYi7MLtdsV3ip56v/ac0JQ=;
	b=AwZ2MI3uPJ8QCnn5iAcPAt4TYIdeC9QGmcs/cFBczcxDjl26qgyjBDNdVzJ0tNRbl1BoAI
	qVhSFEXUDBL8Y59Ra9cAQmF9ci/OsrNnFtWpQ+XMgd4AQDE1+o0BMwqFtExYKdtxFQEe63
	xE1tG83tILuvD09YSc6CuQKXkUSrtANAmiJYY5arLuG4isSaeXxI4HKLPzwPVv8PSTXhfz
	pbEjnlZqFRUBv/ntzlkT3xz/VZcB2RUpKsIZ/4EChwawPSj8p4CVLNrMSmxxx2WA+jWSBW
	0h+WSBWxRAvigxpTb3oa0XyWEdBhOqlUhfHD1s3p6XbJrFl5/ZC897Ovus19UA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795186393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gLHe0mN7pxYygtroa4+XzdYi7MLtdsV3ip56v/ac0JQ=;
	b=TCxsRz1y21gq70/HIZ/iFy7OamrGMkHmOBpcdQu4VSNFfZC5/FvYFu1WeRH4Ph115SzV3z
	t7AVvcwOID9UnTAA==
Date: Fri, 20 Nov 2026 15:52:24 +0100
Subject: [PATCH net-next v5 7/9] mfd: soce: Add SWIP core driver
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
Message-Id: <20261120-devel-vstrassheim-soce-dsa-ml-v5-7-5de9225715e6@linutronix.de>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
 Lee Jones <lee@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Vasilij Strassheim <v.strassheim@linutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, mfd@lists.linux.dev, 
 Martin Kaistra <martin.kaistra@linutronix.de>, 
 Benedikt Spranger <b.spranger@linutronix.de>

Add an MFD parent driver for SoC-e SWIP FPGA IP cores.

Validate the core version before populating the addressed switch, MDIO,
and MDIO mux child devices from Device Tree.

Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>
---
 drivers/mfd/Kconfig          |  9 ++++++
 drivers/mfd/Makefile         |  2 ++
 drivers/mfd/soce-swip-core.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..ff3378e928fd 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1291,6 +1291,15 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SOCE_SWIP
+	tristate
+	depends on OF
+	help
+	  Support for memory-mapped SoC-e Ethernet switch IP cores implemented
+	  in FPGAs. These devices integrate an Ethernet
+	  switch, an MDIO controller, and an MDIO bus selector.
+	  This is selected if Ethernet switch functionality is configured.
+
 config MFD_SPACEMIT_P1
 	tristate "SpacemiT P1 PMIC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index f8101d2a9ce9..9f4d2ccc3a24 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -302,6 +302,8 @@ obj-$(CONFIG_MFD_QNAP_MCU)	+= qnap-mcu.o
 obj-$(CONFIG_MFD_RSMU_I2C)	+= rsmu_i2c.o rsmu_core.o
 obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 
+obj-$(CONFIG_MFD_SOCE_SWIP)	+= soce-swip-core.o
+
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
diff --git a/drivers/mfd/soce-swip-core.c b/drivers/mfd/soce-swip-core.c
new file mode 100644
index 000000000000..2f7d966eeab2
--- /dev/null
+++ b/drivers/mfd/soce-swip-core.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#define SWIP_CORE_VERSION_OFFSET		0x0000
+#define SWIP_CORE_VERSION_VERSION_MASK		GENMASK(31, 24)
+#define SWIP_CORE_VERSION_SUBVERSION_MASK	GENMASK(23, 16)
+#define SWIP_CORE_VERSION_REVISION_MASK		GENMASK(15, 0)
+#define SWIP_MIN_CORE_VERSION			0x24
+#define SWIP_MIN_CORE_SUBVERSION		0x01
+
+static int swip_check_version(struct device *dev, void __iomem *base)
+{
+	u8 subversion;
+	u16 revision;
+	u8 version;
+	u32 regval;
+
+	regval = readl(base + SWIP_CORE_VERSION_OFFSET);
+	version = FIELD_GET(SWIP_CORE_VERSION_VERSION_MASK, regval);
+	subversion = FIELD_GET(SWIP_CORE_VERSION_SUBVERSION_MASK, regval);
+	revision = FIELD_GET(SWIP_CORE_VERSION_REVISION_MASK, regval);
+	if (version < SWIP_MIN_CORE_VERSION ||
+	    (version == SWIP_MIN_CORE_VERSION &&
+	     subversion < SWIP_MIN_CORE_SUBVERSION))
+		return dev_err_probe(dev, -ENODEV,
+				     "unsupported core version %02x.%02x.%04x\n",
+				     version, subversion, revision);
+
+	dev_info(dev, "SoC-e IP core version %02x.%02x.%04x detected\n",
+		 version, subversion, revision);
+
+	return 0;
+}
+
+static int swip_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res || resource_size(res) < sizeof(u32))
+		return -EINVAL;
+	base = devm_ioremap(dev, res->start, sizeof(u32));
+	if (!base)
+		return -ENOMEM;
+	ret = swip_check_version(dev, base);
+	if (ret)
+		return ret;
+
+	return devm_of_platform_populate(dev);
+}
+
+static const struct of_device_id swip_of_match[] = {
+	{ .compatible = "soce,swip" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, swip_of_match);
+
+static struct platform_driver swip_driver = {
+	.probe = swip_probe,
+	.driver = {
+		.name = "soce-swip",
+		.of_match_table = swip_of_match,
+	},
+};
+module_platform_driver(swip_driver);
+
+MODULE_DESCRIPTION("SoC-e multifunction switch IP device driver");
+MODULE_LICENSE("GPL");

-- 
2.39.5

