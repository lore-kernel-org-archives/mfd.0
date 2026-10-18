Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF163309F08
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 02:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792290257; cv=none; b=LyFUHsdDSOiRJzdyas9jxZ2su6vnCJDV8wdRhSITa4CzZcOxVDP7mT8qXj3oPxBbnxLB8VvMhsVl64E4jo5j3OiBypcSFIL1hnIS1Yhnuz6aLUmfyLsFoSO7Wux62CJ2En2x+95Pz8AAcraOhn47QlGbFFGeIcksD7UEJoYe9oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792290257; c=relaxed/simple;
	bh=flhb0gip6ac+yKbn9op5HnfVk9ByKpzEsFTrJgZuPyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S43IiB0QcVLRo5U3xVaeiBkEyqI56OJ2LV+OdlcfSe6yilbKWglnxVhGbgiBPNT4GMPnelWfUE+SFfeZ/2a48kFe3F8Pi86+ESZeurI8pQ3/v1/9oD+73DgoWLnA5G/Inhy6iRgY/njfghEJ0VdF/nm2Cs/NQTLOe2fUAhVjhpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pn/aa5df; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pn/aa5df"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc013095d4so329999137.2
        for <mfd@lists.linux.dev>; Sat, 17 Oct 2026 19:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792290253; x=1792895053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=guJnNJx35gGcmWEl1UQFNTpJpm/r2Xf62CKT+X59fAg=;
        b=Pn/aa5dfd8Tx0W+KEyGXum0jWkVvlTL7RLuTgr5i949FPZ9QN2U36tyGOZGQsx/N9d
         Sn8klECh+IDeKM7DSOjRQEfLRCaQdKELePYvDX1q1eu8d4MBhyENCtpyA1UeVXVF0LRs
         zQeL8z0Pu2u9x2uzNl54s9W+JB6xW1Yls52cuHulTcMbpri097waYYfsmpLyuj5UR0Q2
         lSNdNuWvikyj5TZqj2BDj/DOCwekBQ6QOigQu24IGBAVffwivp/m3P/FyC8zFjN1qlWP
         CG4Z8zvhwou2i127O4nty4SbDG/W7ONsHcxRYiHw3lqsW3lNyEjEkDYYmLppKjGqIiA5
         c6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290253; x=1792895053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guJnNJx35gGcmWEl1UQFNTpJpm/r2Xf62CKT+X59fAg=;
        b=rfbNyUll2ckgJHX+GSJD93u3MwZWXny2pkyd+yma3RFKyt+sOX2/fSoRTA41cKueIf
         34q51EEyKVLA033haoCUIpIMzuWLHBeUYj7gpIJMaXxlFhWxYMrIqJn1ps5aBRCq9DMx
         lO3ylWHI3KLHeThZziMqMq4+zKSByyJMnQoFuPYCogFo/pq/MH+2vV4qnZVFQa0xgI0B
         l1plKYgks0p/bSdnGeY5BLwDaYzHSBucBJcOHlsxV+/li+T4GxfTv5zBb6olkFNNp2SG
         a6dnOhdMyfxQUyLw8pW1jFJRZ3MuqCO+xX96ZxmKface5CEHbgq2w3gI8yyAsi1pwBJ8
         I+BQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWo+34Fy202Ys+92rZR1BIOU5x1ozmGC+mtU1UEksW+p9vhJp5QkPU/VOsdtqcLLR6gDk=@lists.linux.dev
X-Gm-Message-State: AFq9FYIS45kiRPjlGWBfb4m0Vb4uDiUt/euocdRSUxR3k5UCeP1oyKXx
	oQRhvUhFmZF4dfpNjMvpO7RJWrJA0hnRk/L10rf6hABCOpdO+aM/JPyC
X-Gm-Gg: AYBFou1QFT9DsFR8KWX+ydO47WERG8P63wnAaA6ZhWpmX+dIf3WvL6feRsDxd4Qkdo/
	SUAdyadmgrgwGrslUfrJFJwyYTPkUFhDdDFA8EVEgo1peaWVtLQWTAbmwYPTLjMUxHKX+6vM6on
	dtZUB7yXlqe1ewAyeuXfBvcKzrnpIJOUdvHhsLLCld3LvPqtrlmAY84Qk9Nt98/sxznzTZvS0VZ
	uA/Ku6bopLbK2SPXdTIe3zp9PjyEG+saoy+RFRHjbrXk6+RDB5991YDaC9THeO0S2iQhFSle0KE
	MDOaOWKrsxHv03JxxJ1KbO6dBNXMrwQAAWHnOdTnmnooUKu2fMZkdJkCuCPLOaZ/LMsnao2lQqw
	zH0uCieT90IusejU/+rSyPtNpDJTfwBo0t4GThpszw1YmBXYqYloXE7GpGeTzL95wDz/H6LM1wR
	gImSZB0Q7rhg1sS00n1OeJpO6dqq39xXXy51tkfwLSItoi+eLp3LTLc86lbG7zOCAcPgGjd5KKo
	Nw9POW3gwwEpNaicN0x2FV4slYRX+b6bpI6+QD4B6+K9A==
X-Received: by 2002:a05:6102:2c0d:b0:7cc:1c60:d4de with SMTP id ada2fe7eead31-7cc368f6d0fmr1151509137.13.1792290252593;
        Sat, 17 Oct 2026 19:24:12 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:e5a:e466:ca42:1512])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc1987c95csm6311942137.11.2026.10.17.19.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:24:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: dmitry.torokhov@gmail.com,
	jic23@kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: mxs-lradc: Pass mapped IRQs to child devices
Date: Sat, 17 Oct 2026 23:24:00 -0300
Message-ID: <20261018022400.599028-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFD resource tables store indices into the parent DT interrupts
property. Since the MFD core is given neither an IRQ domain nor a base,
however, it exposes those indices to child devices as though they were
Linux IRQ numbers.

The touchscreen interrupt is at DT index 0 on both supported SoCs.
platform_get_irq_byname() therefore rejects its child resource with:

 0 is an invalid IRQ number

On current kernels it also returns -EINVAL, preventing the touchscreen
driver from probing.

The child drivers try to map their resource values afterwards with
irq_of_parse_and_map(), but the touchscreen driver never reaches that
call for index 0. More generally, translating the parent firmware's IRQ
indices does not belong in the child drivers, where platform IRQ
resources are expected to contain mapped Linux IRQs already.

Have the MFD parent copy each resource template and resolve its IRQ
indices with platform_get_irq() before registering the child. The child
drivers can then request the mapped IRQs directly. Use per-device copies
so later instances and reprobes still start with the DT indices.

Apply the same fix to the ADC child, which uses the same IRQ mapping
scheme.

Tested on an i.MX28 EVK. The mxs-lradc-ts driver now probes
successfully, and its interrupt counters increase when the screen is
touched.

Cc: stable@vger.kernel.org
Fixes: a85a6c86c25b ("driver core: platform: Clarify that IRQ 0 is invalid")
Closes: https://lore.kernel.org/linux-input/CAOMZO5CgTzo6GuXptD4mFTN=UsJJqpkixDW1Q64gqZGrij8+uQ@mail.gmail.com/
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
This is a long-standing bug that I reported in 2020:
https://lore.kernel.org/linux-input/CAOMZO5CgTzo6GuXptD4mFTN=UsJJqpkixDW1Q64gqZGrij8+uQ@mail.gmail.com/

This patch touches MFD, IIO, and Input. Since the IRQ mapping is moved
into the MFD parent, I suggest merging it through the MFD tree, with
acks from the IIO and Input maintainers.

The full backtrace:

[   10.540505] WARNING: drivers/base/platform.c:492 at __platform_get_irq_byname+0xb4/0xcc, CPU#0: swapper/0/1
[   10.555516] 0 is an invalid IRQ number
[   10.559627] Modules linked in:
[   10.562849] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.0-rc7-next-20261016-00003-g36062817a968 #17 VOLUNTARY
[   10.573732] Hardware name: Freescale MXS (Device Tree)
[   10.578934] Call trace:
[   10.578992]  unwind_backtrace from show_stack+0x10/0x14
[   10.586955]  show_stack from dump_stack_lvl+0x48/0x64
[   10.592170]  dump_stack_lvl from __warn+0x8c/0x190
[   10.597114]  __warn from warn_slowpath_fmt+0x94/0xcc
[   10.602232]  warn_slowpath_fmt from __platform_get_irq_byname+0xb4/0xcc
[   10.609027]  __platform_get_irq_byname from platform_get_irq_byname+0x10/0x30
[   10.616337]  platform_get_irq_byname from mxs_lradc_ts_probe+0x18c/0x378
[   10.623247]  mxs_lradc_ts_probe from platform_probe+0x58/0x90
[   10.629174]  platform_probe from really_probe+0xc4/0x2cc
[   10.634649]  really_probe from __driver_probe_device+0xa0/0x1e0
[   10.640721]  __driver_probe_device from driver_probe_device+0x30/0xc0
[   10.647315]  driver_probe_device from __driver_attach+0x94/0x158
[   10.653466]  __driver_attach from bus_for_each_dev+0x7c/0xd0
[   10.659280]  bus_for_each_dev from bus_add_driver+0x158/0x1fc
[   10.665169]  bus_add_driver from driver_register+0x7c/0x114
[   10.670901]  driver_register from do_one_initcall+0x60/0x294
[   10.676721]  do_one_initcall from kernel_init_freeable+0x19c/0x24c
[   10.683073]  kernel_init_freeable from kernel_init+0x14/0x10c
[   10.688997]  kernel_init from ret_from_fork+0x14/0x38
[   10.694200] Exception stack(0xc8819fb0 to 0xc8819ff8)
[   10.699335] 9fa0:                                     00000000 00000000 00000000 00000000
[   10.707591] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   10.715843] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   10.723117] irq event stamp: 146363
[   10.726729] hardirqs last  enabled at (146367): [<c00adbd8>] __nbcon_atomic_flush_pending_con+0x120/0x1c0
[   10.736770] hardirqs last disabled at (146372): [<c0008f38>] __irq_svc+0x58/0xb0
[   10.744618] softirqs last  enabled at (146362): [<c0032c20>] __irq_exit_rcu+0x148/0x1d4
[   10.753153] softirqs last disabled at (146385): [<c0032c20>] __irq_exit_rcu+0x148/0x1d4
[   10.761603] ---[ end trace 0000000000000000 ]---
[   10.766374] mxs-lradc-ts mxs-lradc-ts: error -EINVAL: IRQ mxs-lradc-touchscreen not found
[   10.766456] mxs-lradc-ts mxs-lradc-ts: probe with driver mxs-lradc-ts failed with error -22

 drivers/iio/adc/mxs-lradc-adc.c          |  7 +---
 drivers/input/touchscreen/mxs-lradc-ts.c |  7 +---
 drivers/mfd/mxs-lradc.c                  | 47 +++++++++++++++++++-----
 3 files changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index dda5182a5076..2c7129cd9c05 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -17,7 +17,6 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/mxs-lradc.h>
 #include <linux/module.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 
@@ -691,7 +690,7 @@ static int mxs_lradc_adc_probe(struct platform_device *pdev)
 	struct mxs_lradc_adc *adc;
 	struct iio_dev *iio;
 	struct resource *iores;
-	int ret, irq, virq, i, s, n;
+	int ret, irq, i, s, n;
 	u64 scale_uv;
 	const char **irq_name;
 
@@ -743,9 +742,7 @@ static int mxs_lradc_adc_probe(struct platform_device *pdev)
 		if (irq < 0)
 			return irq;
 
-		virq = irq_of_parse_and_map(dev->parent->of_node, irq);
-
-		ret = devm_request_irq(dev, virq, mxs_lradc_adc_handle_irq,
+		ret = devm_request_irq(dev, irq, mxs_lradc_adc_handle_irq,
 				       0, irq_name[i], iio);
 		if (ret)
 			return ret;
diff --git a/drivers/input/touchscreen/mxs-lradc-ts.c b/drivers/input/touchscreen/mxs-lradc-ts.c
index 137ab3b60f2d..ff9310592ad0 100644
--- a/drivers/input/touchscreen/mxs-lradc-ts.c
+++ b/drivers/input/touchscreen/mxs-lradc-ts.c
@@ -18,7 +18,6 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/mxs-lradc.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
 static const char * const mxs_lradc_ts_irq_names[] = {
@@ -605,7 +604,7 @@ static int mxs_lradc_ts_probe(struct platform_device *pdev)
 	struct device_node *node = dev->parent->of_node;
 	struct mxs_lradc *lradc = dev_get_drvdata(dev->parent);
 	struct mxs_lradc_ts *ts;
-	int ret, irq, virq, i;
+	int ret, irq, i;
 	u32 ts_wires = 0, adapt;
 
 	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
@@ -674,11 +673,9 @@ static int mxs_lradc_ts_probe(struct platform_device *pdev)
 		if (irq < 0)
 			return irq;
 
-		virq = irq_of_parse_and_map(node, irq);
-
 		mxs_lradc_ts_stop(ts);
 
-		ret = devm_request_irq(dev, virq,
+		ret = devm_request_irq(dev, irq,
 				       mxs_lradc_ts_handle_irq,
 				       0, mxs_lradc_ts_irq_names[i], ts);
 		if (ret)
diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index 64afc7631790..f893312a1d9b 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -22,7 +22,6 @@
 
 #define ADC_CELL		0
 #define TSC_CELL		1
-#define RES_MEM			0
 
 enum mx23_lradc_irqs {
 	MX23_LRADC_TS_IRQ = 0,
@@ -123,6 +122,42 @@ static const struct of_device_id mxs_lradc_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mxs_lradc_dt_ids);
 
+static int mxs_lradc_add_device(struct platform_device *pdev,
+				struct mfd_cell *cell,
+				const struct resource *mem)
+{
+	struct resource *resources;
+	struct mfd_cell child = *cell;
+	int i, irq;
+
+	resources = devm_kmemdup_array(&pdev->dev, cell->resources,
+				       cell->num_resources,
+				       sizeof(*resources), GFP_KERNEL);
+	if (!resources)
+		return -ENOMEM;
+
+	for (i = 0; i < cell->num_resources; i++) {
+		if (resource_type(&resources[i]) == IORESOURCE_MEM) {
+			resources[i] = *mem;
+			continue;
+		}
+
+		if (resource_type(&resources[i]) != IORESOURCE_IRQ)
+			continue;
+
+		irq = platform_get_irq(pdev, resources[i].start);
+		if (irq < 0)
+			return irq;
+
+		resources[i].start = irq;
+		resources[i].end = irq;
+	}
+
+	child.resources = resources;
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
+				    &child, 1, NULL, 0, NULL);
+}
+
 static int mxs_lradc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -189,13 +224,9 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 
 	switch (lradc->soc) {
 	case IMX23_LRADC:
-		mx23_adc_resources[RES_MEM] = *res;
-		mx23_touchscreen_resources[RES_MEM] = *res;
 		cells = mx23_cells;
 		break;
 	case IMX28_LRADC:
-		mx28_adc_resources[RES_MEM] = *res;
-		mx28_touchscreen_resources[RES_MEM] = *res;
 		cells = mx28_cells;
 		break;
 	default:
@@ -204,8 +235,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
-				   &cells[ADC_CELL], 1, NULL, 0, NULL);
+	ret = mxs_lradc_add_device(pdev, &cells[ADC_CELL], res);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add the ADC subdevice\n");
 		goto err_clk;
@@ -214,8 +244,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 	if (!lradc->touchscreen_wire)
 		return 0;
 
-	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
-				   &cells[TSC_CELL], 1, NULL, 0, NULL);
+	ret = mxs_lradc_add_device(pdev, &cells[TSC_CELL], res);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Failed to add the touchscreen subdevice\n");
-- 
2.43.0

