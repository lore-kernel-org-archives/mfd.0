Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699691;
	b=r+CtPgZDHu8JUEIt1aGWf92w/E4JTdQhbFLrjSML3CNlcChszcfuBeQiM1RMYUadaMk9
	 92YqO12vcBgQwps0qLYHyEj+VC8yvWSQv1YBcZf8YLAURRSq7zqpoUgTpAhsV4P8+SyFi
	 v7Lb5lOR72mMGWTJ1SLgcVqAuhphmfVBgelTpvORyJ6pxSNCJ1vEXh8spRN6c3wmrlCOp
	 Dy9mpZOqDdAW5EyamwDNT/GL0u/7F9mLrZT9nP85xGBYtHmQ99Ddx4qS91gQF5gGaQzIY
	 9aY4i3oZFz9Qv2TJ3hb4Cb+SOmfV5lxXyKY/Z97EyWLlvz3tjSxyBeEMwCH6E6+0v5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699691;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=ofynBkEO4JdRvXaGj3ZBIzoR7OwqUEwwLGOeO0731gw=;
	b=w+oiy4N3Csf6hS2nSM24RBODAfwgDEwim5pIZO3jviIjknG/S+o9ifr6EnmD5Kyrx9GO
	 UtKBcavRXMUrCOsU4DmBzbRpyARlfsK/kFsn8TauARd77kic9S+QMB0XuvxHhlmC2jXJu
	 MBuHi7+VLGSBwUHrCWxbdgKIM3JbI+qe2zdgDTKuXzCFaUovD7ZJdgCxYzBy5lkdU+6L+
	 hLtCJ89FDewx3tEudlMahTC5EKOiB1VcOhKoyt94fe/9EKTfgXaVmJWr952ygkh2ednoJ
	 6NeTRRO6omm2/pFnP2Qoc44Pa5I0cdozACl1cfSkD69+4te20x5WP3zirN3sb8fArhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Hv0JOpRc;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C8606A326
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 13:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A21C8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Hv0JOpRc
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcb5;
	Thu, 26 Nov 2026 21:28:05 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: lee@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	j-keerthy@ti.com
Cc: mfd@lists.linux.dev,
	linux-omap@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 2/2] mfd: tps65218: Fix potential use-after-free by child devices
Date: Thu, 26 Nov 2026 21:28:03 +0800
Message-Id: <20261126132803.4091137-3-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126132803.4091137-1-202300460064@mail.sdu.edu.cn>
References: <20261126132803.4091137-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa2180ab9e903a2kunmf8b0a91135d959
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDShkdVk1KHUsZTEJMTEJKHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=Hv0JOpRcgnN/1AeJjq/grIOi/bIdxLbBwztPLfex3gq0CWfpxBLbjt0O89ym6hbHPExh8IlnzY99vC2RzAfpDLHHGcG0i6BINTNmZYU0DYPpmzom5nTyMvoFOBq+aZyD5m2ZynthSsdvTBYkGE03Mrbh6X5Ow3UEDkLQ8kFD4/g=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=ofynBkEO4JdRvXaGj3ZBIzoR7OwqUEwwLGOeO0731gw=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The MFD children are not removed on unbind, although the parent context
and IRQ chip are device-managed. The children can retain access to
released resources.

Use managed MFD registration to remove the children before the IRQ chip
and parent context are released.

This issue was found by our static analysis tool under development.

Fixes: 44b4dc616365 ("mfd: tps65218: Add driver for the TPS65218 PMIC")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/mfd/tps65218.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps65218.c b/drivers/mfd/tps65218.c
index 491c379a1a0f..12bef7a11471 100644
--- a/drivers/mfd/tps65218.c
+++ b/drivers/mfd/tps65218.c
@@ -328,9 +328,9 @@ static int tps65218_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ret = mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO, tps65218_cells,
-			      ARRAY_SIZE(tps65218_cells), NULL, 0,
-			      regmap_irq_get_domain(tps->irq_data));
+	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO, tps65218_cells,
+				   ARRAY_SIZE(tps65218_cells), NULL, 0,
+				   regmap_irq_get_domain(tps->irq_data));
 
 	return ret;
 }

-- 
2.43.0
