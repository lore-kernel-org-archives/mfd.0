Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379292;
	b=EFoZSQ2E7uyEC32jkHI2GN8t7LIOhM868xLOoRQiGzuha2gV/Nh4fF8eMw3dLd1E6MIC
	 ItyM1ZQuZDUbx2A/Btou1nsq3La8blU46E6RuZAbOnOBA9YDCHKYMh0hnbcP2uMJ5kZjf
	 1LyB5JizxfVlNnXWhs8Kz81rppG+tGBxrCoSkLTftIUq3C52wODIXbJbNa4jv4nyiNT6b
	 TYit9U9uEHD7q6wkcMoJ6R24cR95La5Ar4+YkI2G3Ge0jkx9V8Ku+DysBbnjBXFC12Epw
	 oUA8O2tWxzua6DFPcdl5IgnkEoClusEBvRA8qlSeR2H4Uka6Gbl8p972aGwrnTZxwPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379292;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=Zup0ssAFr6iZK+F8bd6TsKJG5vW3IBQaP27+OPMuXxY=;
	b=ZOhvBFuvIsWrPX1au2NvDY/0b6M9n3TsAp2vS7avw94dZjoWkor5De9kXwgbjCPboWLG
	 IS9x7JYNhqXmufKaciKrhLfoadL2Um9XtpiLFrk+GLJD17xDA5EpjknGCRVKb/b3d4iI1
	 HrawI4h9/9i22CRa+vmYPOqX6kOOkYi4Nck/0Njg/CtuRksv3uz9p1HR9x+OpEIdO0z8U
	 GwpBavYmHU18ahxKCbrkOAD2E81VuyWYl1RIgjUYEQZZIJxjPF50udGU3lUu0ACW/ldQG
	 yVdFBaFTNfIZ7NzpRbNSK7Q/CA5uG/bFHRPYLFyJ3bG3wjlx8eOFki2X2CiVoi+0R7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ddmpdcPB;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FBD606A320
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 16:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FBD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ddmpdcPB
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52f74f11f;
	Sat, 31 Oct 2026 00:54:38 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Lee Jones <lee@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] mfd: stmfx: Fix potential IRQ action leaks on removal
Date: Sat, 31 Oct 2026 00:54:28 +0800
Message-ID: <fb75e2706d7608956b5198c674fedd2f9cae7d55.1793377422.git.liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa18dbc1f2f03a1kunm46158e5a52a2e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0JIVksfHkIeGENLSRlLTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=ddmpdcPBR8UZeA8kfxBKyFYBSAYtV/iJ26Hm5kvVoLbNCpUxTJs/wD4rT5fgmSc2qEcUxom4pcZGMxOx5wz7C2mHlSGtSFX8olaJmRSVEbwtK3l/6vJV5hzDvqub4mLHYhvLGIT+6X3IMV+fyMP1fJo1oLdNI8p+W/P0We9IEXY=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=Zup0ssAFr6iZK+F8bd6TsKJG5vW3IBQaP27+OPMuXxY=;
	h=date:mime-version:subject:message-id:from;

The remove callback disposes IRQ mappings before device-managed MFD
children are removed. Their later free_irq() calls cannot find the IRQ
descriptors, potentially leaking interrupt actions. Remove the children
explicitly before tearing down the IRQ domain.

This issue was found by our static analysis tool under development.

Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:gpt-6-astra
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 defconfig plus COMPILE_TEST
and the driver dependencies (W=1).
No runtime or fault-injection testing was performed.

 drivers/mfd/stmfx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index f683fdb6ece6..82e81e084795 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -448,9 +448,9 @@ static int stmfx_probe(struct i2c_client *client)
 	if (ret)
 		goto err_chip_exit;
 
-	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-				   stmfx_cells, ARRAY_SIZE(stmfx_cells), NULL,
-				   0, stmfx->irq_domain);
+	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+			      stmfx_cells, ARRAY_SIZE(stmfx_cells), NULL,
+			      0, stmfx->irq_domain);
 	if (ret)
 		goto err_irq_exit;
 
@@ -466,6 +466,8 @@ static int stmfx_probe(struct i2c_client *client)
 
 static void stmfx_remove(struct i2c_client *client)
 {
+	mfd_remove_devices(&client->dev);
+
 	stmfx_irq_exit(client);
 
 	stmfx_chip_exit(client);
