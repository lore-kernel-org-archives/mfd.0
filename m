Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699689;
	b=j9CvaFvUVzIJMwdGZ1M1AHm8kP0U3hN+Hp1jKbZaRsDxVhK5HlmIydymFrWTtJ2KDQ66
	 EG46lt6OVlvmnyeLTQWG8ulX05Nl5sM9nWs9fBQagIrbgsi0cOS7xpY4gWYE3uAzOEWZF
	 w3KvQi2aw6RyjWk6REqpLVlYLp6tlGNJ5V4YYnJAnK906ebmBKYEr9Hs93q0M3eQmv1Sc
	 gfzaoVn7TogyevAmkfcoALVqbzBGRsC5oBcvu7vsnk5bna7ZX5vV14gSSq7Kz1iggqCmf
	 M2mD4yLU+oBYx0APrUJLTh8VDSm+EXpPuK4aRRC2ghkJ59h3DOUylss1D4bsthCHKtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699689;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=OACxoaftaV42FyDy68F9cJqMQyaLPhGFgARyBLGjzJo=;
	b=2hUWLZjbo2sdL/2VTQA6GL2ZIZsJLJhdnwqYzMWU1fqt2ee2SEwtNHET4zYjlRIuxfAi
	 PkrWE4o0fySJ8+KiBIB09UqOGlin5W3bn7h2keMwloSrks83nMt177zkEPvbklgZQii8a
	 O7ek/I3C9URDbO6PSC9zs8+f1kQGZ6xcp0il6GRNYNiDGnXz03QwoOG6tNSPgmbFKXROI
	 //YPatYqXhY4GWA7hX1UR46hISLLkKaLb5TpVmKtqDmqUqeXEoxhQYsQPjxIPiPRmKjHc
	 oLcYZzscl26hLEmM7UByNRk7xjBNJaCJkFmLsbxl155HdknfbALTWycJWuVA8YiXYwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Z9CeI5zW;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E4A606A331
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 13:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E4A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Z9CeI5zW
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcb4;
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
Subject: [PATCH 1/2] mfd: lp873x: Remove the child devices on unbind
Date: Thu, 26 Nov 2026 21:28:02 +0800
Message-Id: <20261126132803.4091137-2-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa2180ab6b303a2kunmf8b0a91135d955
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0JKVkpMTR5KTk5JS0xMGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=Z9CeI5zW5cmC4aFKHzIv/WH9M4b6ayNqJYF8pDiYXLnHs1fz0XvR/S8+j/Xx6wUX0Xd7EFvyQeFvMMxT2QyHsa+QgxmQsQqS7MZ/Y/lCe0fIm1zMvWX5Z4ILsp1uhEZ/EoD6X0Q0QAZqqMaR3HYm4cPRQhWnn+bbGxDfY1Waz1k=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=OACxoaftaV42FyDy68F9cJqMQyaLPhGFgARyBLGjzJo=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The regulator and GPIO children stay registered when the I2C driver
is unbound, although they use the parent's managed data. Use managed
MFD registration so the children are removed first.

This issue was found by our static analysis tool under development.

Fixes: dc21c7ad3a8a ("mfd: lp873x: Add lp873x PMIC support")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/mfd/lp873x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/lp873x.c b/drivers/mfd/lp873x.c
index ab7bd46d9ff7..6b2badab4f2d 100644
--- a/drivers/mfd/lp873x.c
+++ b/drivers/mfd/lp873x.c
@@ -53,8 +53,8 @@ static int lp873x_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, lp873);
 
-	ret = mfd_add_devices(lp873->dev, PLATFORM_DEVID_AUTO, lp873x_cells,
-			      ARRAY_SIZE(lp873x_cells), NULL, 0, NULL);
+	ret = devm_mfd_add_devices(lp873->dev, PLATFORM_DEVID_AUTO, lp873x_cells,
+				   ARRAY_SIZE(lp873x_cells), NULL, 0, NULL);
 
 	return ret;
 }

-- 
2.43.0

