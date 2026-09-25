Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27721A6839
	for <mfd@lists.linux.dev>; Fri, 25 Sep 2026 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343485; cv=none; b=Xjwk86a4u1LOjJSiB2hbKeePFQkReLzLejM96OrVwvJ36JwlbfpKmMCu/1vYNHo4bLHA7x+96KRDdSDOQjQfJxwYjFj8gCFxIpSPCXkovoDM+hnQsrQgxkPp1oBWNxD/+S92mFk4Mky0JZCIhdAWRxRfrl8lOdi+61PSUdiH2Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343485; c=relaxed/simple;
	bh=GSiIIb/g5GyHauoFwUjAVo68TeJOFVwGqe4Z6o8QFp8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y4qJVt8wNliu4Ld4V1fPGh6LHTNbKi8DNsE36jTJUUvR9ksIuXskyama/J/MNUNz8xV5A/IN670a/XwFajN4u3AGYHOhN/elhWrb56VJ2Lqo7WOsFIQe24uaF8x/WRVSPa0uWrg8oZsNwd9P1Bc9uktSQDHpIoHdLVwbe7YA8/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UQJJ31+m; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UQJJ31+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rm
	M6xXrpr9UKxLs3b0jxjQEKmSBnAiVp0w5mF33ni4A=; b=UQJJ31+mJU+OIxt2Rv
	TjKym/z16WJnBM6nLdEoogyVvi29rXJOTy8a5Q2aj2a73sKAE7ibAEoem8lmF1TB
	BMrc+0UBX5TqQPHBVhi72y3lwHf0EH46L31BiGt/tBMo3qfohp6ZGCiYtGb+RulK
	Yv/s50sV7CbO2wwTO8p5lmtII=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3X4QwebZqHTBAAw--.28279S2;
	Fri, 25 Sep 2026 21:37:53 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] mfd: mc13xxx-spi: Reject devices without match data
Date: Fri, 25 Sep 2026 21:37:51 +0800
Message-Id: <20260925133751.2230782-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X4QwebZqHTBAAw--.28279S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWDGFykuF1UGw15Aw4ktFb_yoWfuFb_Za
	sa9r1xWr1UGFn5KF18Xr15ZrWSq39Yvr1vga1ktrZ3trWUZFnrXFs0q34DJr43uayDA3WD
	Xr1UJr4xZFnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtHUDDUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhGy7Gq2eTFebwAA3k

A device bound through driver_override need not match an entry in the
driver tables. In that case spi_get_device_match_data() returns NULL,
but mc13xxx_common_init() later uses the missing variant data.

Reject devices without match data before entering the common probe path.

Fixes: 15d71e678ec1 ("mfd: mc13xxx-spi/wm831x-spi: Use spi_get_device_match_data()")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/mfd/mc13xxx-spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/mc13xxx-spi.c b/drivers/mfd/mc13xxx-spi.c
index 56d2e57b7d73..d1523321152a 100644
--- a/drivers/mfd/mc13xxx-spi.c
+++ b/drivers/mfd/mc13xxx-spi.c
@@ -150,6 +150,8 @@ static int mc13xxx_spi_probe(struct spi_device *spi)
 	}
 
 	mc13xxx->variant = spi_get_device_match_data(spi);
+	if (!mc13xxx->variant)
+		return -ENODATA;
 
 	return mc13xxx_common_init(&spi->dev);
 }
-- 
2.34.1

