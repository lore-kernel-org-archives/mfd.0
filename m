Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029554;
	b=GKiNCo53i+bRxXUOVlyGBCGQD8m8KabFDnb0T9VNWu7pyWLPlLd1l3R+z8CVNTRUWyTf
	 /sD6CoyZDdVeRUUyVeKvzxxQ2NHimFiBz0cGJqd8Lo00tor6ZGB+JlUe8Q3EFRMrhO0Gz
	 5k1cHdi2QKHJ8ZnDg4HgVf2vkO25u+yK/kWNH1/CO4fWrE4L6gB8MGAkQKlSREST2s0DA
	 q+zFQC9RSVfe2/DjV+SSiuRgZzgAg2yyfwG1/OSTqxiNbyR0+A2cx3WQtPqqunvSXNR4i
	 ipqJ3xaK7SNL05o8bhTP2dCLur6xidX2H5Qpr/p1r3V+QgtSyQT9pkb2gYZ0/Yt1DYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6sW0z1d5SKi+Jg6QexltnX75AHvo1gx3Slpp03kBvI0=;
	b=0eh45Lt/ca76pyB7gFfzizRqhi+9uV/3Rwv/GbburKmDhVaOImyqOsVTFvBl02mL398M
	 eRYcudDZT5Zp0kboC0JMHwNg+mOPteG2sBuP8ENdHj3NoYJlNoFWJXz6E+cJlPsVorY7V
	 CkTg7oKuNTvF/SJnCs8Nn9ZDEFqOQCmTd9lsP/wiuFu2AiGkB+7dwEg+eeSR7dnx1u4Fn
	 +WFCnKfsXoRcfuENCFcJts+e0tYmwWPjgos4nOGuYj8QTlA9Px6DSbBeSrzr2BCQKLcpc
	 1Li57YSaGixZ46XYkimUi/yYuW48ADnM8tzXvkwbtZHZU0NB6O70WafPNyxOpuuRwbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGYl+Gfk;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E63606A32C
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 05:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E63606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGYl+Gfk
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so657394a91.3
        for <mfd@lists.linux.dev>; Fri, 06 Nov 2026 21:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794029552; x=1794634352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6sW0z1d5SKi+Jg6QexltnX75AHvo1gx3Slpp03kBvI0=;
        b=wGYl+GfkAQKxedZtEeNSUSb22Dd7TIBPnVsRzZP4RoJIHJ2+ICZfsKqXXiOY8hWahE
         Aukcy3QL1YoQcpwCsJyXdxpJT9l1eVjPJ3kp1uGIPjZryvuHOtQvmzt2sIlLx0Bo3V4r
         UIUPxDpt0vVSVEZgb9moG5PnGKuoIXqeM0dc/eB1h8D1s3YvgBqteKXC0dK0mrSYsUXE
         CenVhAIRFuijjY75JiD74wlbl432YwC2jZU/3hsVjVrkNsW2YVh3eoMT9/yp5Uv5K/UU
         bATCeWUeypnerCYXeFnvF2QW+nsTPo5jCW3DR88nL489+epCl2SKP869KKjSugV8yITK
         zSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794029552; x=1794634352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6sW0z1d5SKi+Jg6QexltnX75AHvo1gx3Slpp03kBvI0=;
        b=NJrj+wdVGk4uVw1wGaD1zn0VxItgd5oAtgMRR9uBCZpT1i1G7RlbOuTdr83yjPXhyc
         QYzfaCK0dAeQH9CTnuXYcKVs9SuuHq5V4+gc891qfkutBi/SjSxEew3HNNK1OBHYf+/Y
         2lPUObQMoRvdzdpwTo9wsNje728oSkfX3j3Z9f1cuONrh53PlAhRKbTRPyFl9ZeXQhtI
         7Tm2pqPBMGegpdIN6zFflHPE4Ky+009NFZKncpifq1ITV8UNAajQLUMFftN+Hqd6ST5p
         vxFijCL7Odl+R4tjIwgoAediGFQgv+gBs1lvEaa77Z8Fz73W4gcA1CJyKAA7uHhqHUWD
         knOg==
X-Gm-Message-State: APuU4Z8rfvoxkYcM9mxWmt3qGSdWxLd38Al2uWlHxBSAFXkTrg3h8eB3
	HVat9PkdBZDLp/KmsdifljCoHrHAMTsb8mqJkmjaGwlHGCn7ldUEQpBr
X-Gm-Gg: AYBFou0SyPO0mXRlry0eZ4/StP/ZA5K45pJYIb0pIiBOza2lMv0RT+Ihy/w2fu9u20g
	Q6HuIUuI/7/KO7s1zl31MLvbjXuQvD8GNsad7II0qpsueoupWHRU5ScZgQ4k7LA6JldstaTurdY
	Lv6dL5j6QvkU+MviA3Hlc9B/G9UhX1YuP44JaGG89PW+XQIO7RbLybWbKyqrPsmRsu0AQIKkCo7
	PeFvlVX5hWnYx91OlXE6jSEliIZIOdHr1rpGaXxdN+8v3z6T3jAR/jK+AZPQ7Hq4B1vy9puUZ+l
	eiM1uxlvb6CJfgLZspgkru9CENc2eTa3bsBSzYQDT92+kL9dDCN+/QOuncOrZKyFPASbfV1duhC
	DFy/mTwEbHLI3AMGjHHSGUPXYPZWNhAGIClB2VaRltD1ThB+PidzVJd2J46DQ1TtG2toZVmFFLF
	C08RzSEkMmK34gmO7avMBrBZAkRLeN0V/7bwO9fPfAWRDHqdiFbK9s8f4lXHmKS+PfxP/VacHji
	XH86z8FSIToAuzyi/eDH7jYcQdL+Wl1zF2Q8bcKEr1aOFv6WtyBz1knVdNlx/IzFzepPpw6pXsZ
	+I1cnnb4ZIXYrueCoP482Hoxej0t9/pnwDoZr63UEe/eASAW
X-Received: by 2002:a17:90a:d24d:b0:3b0:db75:4bcf with SMTP id 98e67ed59e1d1-3b0db754c65mr3213278a91.42.1794029552419;
        Fri, 06 Nov 2026 21:32:32 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b101bc4586sm1246851a91.2.2026.11.06.21.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:32:32 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>,
	Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: ls2kbmc: cancel the reset work before the driver data is freed
Date: Sat,  7 Nov 2026 14:32:18 +0900
Message-ID: <20261107053218.3326443-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

ls2k_bmc_init() INIT_WORK()s ddata->bmc_reset_work (ls2k_bmc_events_fn)
and requests two device-managed interrupts (ls2k_bmc_interrupt) that
schedule_work(&ddata->bmc_reset_work).  The work handler dereferences
ddata via container_of().

ddata is devm_kzalloc()'d, so devres frees it when the device is
unbound.  Nothing cancels bmc_reset_work: free_irq() (run by devres)
only waits for the interrupt handler to finish, not for a work item it
has already queued.  If a BMC reset interrupt fires shortly before
unbind, the queued ls2k_bmc_events_fn() can run after ddata has been
freed -> use-after-free.

Register the work for device-managed cancellation with
devm_work_autocancel(), before the devm_request_irq() calls that arm
it, so devres (LIFO) frees the interrupts first, then cancels the work,
and only then frees ddata.

Found by code review; not reproduced (needs Loongson-2K BMC hardware and
a reset interrupt racing driver unbind).

Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/mfd/ls2k-bmc-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
index 408056b..c44291e 100644
--- a/drivers/mfd/ls2k-bmc-core.c
+++ b/drivers/mfd/ls2k-bmc-core.c
@@ -12,6 +12,7 @@
 #include <linux/aperture.h>
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
@@ -371,7 +372,10 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
 
 	ls2k_bmc_save_pci_data(pdev, ddata);
 
-	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
+	ret = devm_work_autocancel(ddata->dev, &ddata->bmc_reset_work,
+				   ls2k_bmc_events_fn);
+	if (ret)
+		return ret;
 
 	ret = devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
 			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);
-- 
2.43.0

