Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6331A6823
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 05:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400498; cv=none; b=sUwF5PIRoE5ODS9jbuDqKMP7y8cXXBgH9/gUun2s1xPqFQuqW5UX7jBaTurb+wAISjF1aKAnYBYcn78J0qJcKnEO0JdZKAHzEjz3U3l5GXZts3vjj1HOVlaRrN2lgOpl9l2PcbKPc8uooaKYAe0EJikVxB3bhHqzSHcSIdPtkpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400498; c=relaxed/simple;
	bh=KKMd+1L1xc03tndOr2GnhqDZmykh8QLkULWmbc2Ehjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKy4QW4sGe4HqEnioN7vDuiCPk+SQQkyd9JdmwycRXW5HTIj0wk34VTfezvPHc1HZhCK+u+CST7jIMxyEL5Z3uEi4PrCMq3N1eURUZvnVJB1HCWu30381SvM0LBsGcKmcUMbFArvQozL9taGUuCU9Kkjeec0VVGtK6azZ0KSBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNW/JohX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNW/JohX"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84830c774a0so166349b3a.1
        for <mfd@lists.linux.dev>; Mon, 06 Jul 2026 22:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783400496; x=1784005296; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnU2kcoOrK/rMeDh05luvRizUeGTLGwR6hs1iqkHFrs=;
        b=FNW/JohXG9/CroYAUgdUGX+0oy7YvVZifX5NvqyyO3g/EHoHXqgarpQLYf5JWdIZNK
         O1/YIAs+vnQZcCv0Cb25f7kEEVy/VET3zeZX282S1e07H5eJTTwe/WBHV1QIhMyZSAhT
         w65g1PyZo3W3rPAAu2+ubiAaZIZg+o7IKd1ps/vTOY8CbwkDLGTnGRt1+jVkw9jZmH8T
         PM0/mE/sdBDxzdk1uWJM8VC5w1deRlLXVGRe8kxOdb8dBcPzMA4hQcxydAKpUjBASX4/
         FI89cilGX5nNaVok1F2rKtJ0GODYRyXjp4qVIoLhpSyiy4cFFjSbbfNlkHQwM0JP6pth
         MxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400496; x=1784005296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnU2kcoOrK/rMeDh05luvRizUeGTLGwR6hs1iqkHFrs=;
        b=WiP+cBMbbuYvMbvWMAAZUpHzSgVMXdIRdPAgut4UdWkHlJg1vASGALE1NrwzUSeLG5
         1nZTZRQ4IVIkZ4iaZd+jqioC818ON7/1dyeStdu8F0EwuOD158x5v1m4ioJfYJB9GhLh
         Viwi/nf3mL9BiI/lGpxYSGdbStOLgQMB6zglYh8iNfEntkLySs68f+xxu11muaXIrgcD
         WMaZdhJK95gkHge/jec08ecDbl0CfJOQAfiouWwIrxCzE1qVGMENG/+NkxTrXzzuQiIV
         I9R/xQS0kvi3Kmx5Nkw2NMjII2DAp4ViwjDSXQeGIvV80iCw/OW4JxgqtSzgztjJjK5+
         jsSw==
X-Gm-Message-State: AOJu0YwqKr3PY0qa0NDWJMLjTE3fkZJo520cdGRTuQOHze0Jgo3Eb2bO
	mqxHZDaPhRKE8WM+8YJdwCKW4hnPLjyPONtRba0vlDaYyKRxA2N2yypE
X-Gm-Gg: AfdE7clNWFLT98WQQ0+vKqsKd3mf/DvrU8Lz0YB6RDAyPJxPVB7W7snRJapjBxO8qcw
	S1LUqRky4mgZBMKi9zGZJkDDR/WE9praWimN8HOrmEPHFKRXxb+Ajq29HR4FKufiaEX5LBUKYij
	OS65GJGudUhVBA+/dMbuHiShEcqsloZNM3rHQnA24Ye747wAJW4B1LVyAYsbsOTg7HjeU3YXjhf
	x6bTJ1/7hm0p4dSE9BCzq0/T4qfovxXKu0M9DyULKiesSaJXSFD6vehrKi/QkVmSPwVsgamHTdN
	0MW4S2jxko7aFtje1xfO1SJde9ni9hwNa31NJ7lUkwGO4jDbUp92U6KSXg3DpE2ePSbESJiuCmM
	z2nohLCI/3wfJbBh1noFeWIeKaYlkfjJxVb07LDb37TqwES7B7JnGwZd2DTt5tNg8vErHSCChvc
	uBA3fBIZr2ix3+ycssPAx+TjLgV3OX4Jl+o+6FHKG86KRLd56jjlLqd7nodlU50k2POHaboM9wd
	OMP
X-Received: by 2002:a05:6a21:70c5:b0:3bf:d354:1352 with SMTP id adf61e73a8af0-3c08ee36614mr4184279637.32.1783400496601;
        Mon, 06 Jul 2026 22:01:36 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm3906462c88.0.2026.07.06.22.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:01:35 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 06 Jul 2026 22:01:30 -0700
Subject: [PATCH v2 1/2] mfd: ucb1x00: Register software node for GPIO
 controller
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-ucb1x00-assabet-swnode-v2-1-e6271ea3d3dc@gmail.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

Define a static software node for the UCB1x00 GPIO controller and attach
it to the core MFD device in ucb1x00_probe(). This node will also be
used by the created GPIO chip.

This allows machine subdrivers (such as Assabet evaluation board
support) to reference the UCB1x00 GPIO controller in property entries
when converting legacy platform data to software nodes, resolving pin
bindings directly via the attached firmware node without relying on
name matching.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/ucb1x00-core.c  | 16 +++++++++++++++-
 include/linux/mfd/ucb1x00.h |  3 +++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
index 16f64e2b2f77..90edf0352d05 100644
--- a/drivers/mfd/ucb1x00-core.c
+++ b/drivers/mfd/ucb1x00-core.c
@@ -25,6 +25,7 @@
 #include <linux/mutex.h>
 #include <linux/mfd/ucb1x00.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/gpio/driver.h>
 
 static DEFINE_MUTEX(ucb1x00_mutex);
@@ -492,6 +493,11 @@ static struct class ucb1x00_class = {
 	.dev_release	= ucb1x00_release,
 };
 
+const struct software_node ucb1x00_gpiochip_node = {
+	.name = "ucb1x00-gpio",
+};
+EXPORT_SYMBOL_GPL(ucb1x00_gpiochip_node);
+
 static int ucb1x00_probe(struct mcp *mcp)
 {
 	struct ucb1x00_plat_data *pdata = mcp->attached_device.platform_data;
@@ -530,6 +536,10 @@ static int ucb1x00_probe(struct mcp *mcp)
 	ucb->id  = id;
 	ucb->mcp = mcp;
 
+	ret = device_add_software_node(&ucb->dev, &ucb1x00_gpiochip_node);
+	if (ret)
+		goto err_swnode_add;
+
 	ret = device_add(&ucb->dev);
 	if (ret)
 		goto err_dev_add;
@@ -604,6 +614,8 @@ static int ucb1x00_probe(struct mcp *mcp)
  err_no_irq:
 	device_del(&ucb->dev);
  err_dev_add:
+	device_remove_software_node(&ucb->dev);
+ err_swnode_add:
 	put_device(&ucb->dev);
  out:
 	if (pdata && pdata->reset)
@@ -630,7 +642,9 @@ static void ucb1x00_remove(struct mcp *mcp)
 
 	irq_set_chained_handler(ucb->irq, NULL);
 	irq_free_descs(ucb->irq_base, 16);
-	device_unregister(&ucb->dev);
+	device_del(&ucb->dev);
+	device_remove_software_node(&ucb->dev);
+	put_device(&ucb->dev);
 
 	if (pdata && pdata->reset)
 		pdata->reset(UCB_RST_REMOVE);
diff --git a/include/linux/mfd/ucb1x00.h b/include/linux/mfd/ucb1x00.h
index ede237384723..214c71a12e84 100644
--- a/include/linux/mfd/ucb1x00.h
+++ b/include/linux/mfd/ucb1x00.h
@@ -103,6 +103,9 @@
 #define UCB_MODE_DYN_VFLAG_ENA	(1 << 12)
 #define UCB_MODE_AUD_OFF_CAN	(1 << 13)
 
+struct software_node;
+extern const struct software_node ucb1x00_gpiochip_node;
+
 enum ucb1x00_reset {
 	UCB_RST_PROBE,
 	UCB_RST_RESUME,

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

