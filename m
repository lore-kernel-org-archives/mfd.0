Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379286;
	b=edzLXcjQgF6ocQkTnoq5BOqGCuA9s2lIW/gW2E1YwVyRY/rjF/rMd1adEIwj9OmsZuSg
	 IaIjRzUbXGFuo4LaWvr0dPSicCOzHtfENq5pGDtCqJ9YxtHe5Y9/C1Np9dtwMq96ADLSU
	 kE61W2cP3M0rJtQrE564jCNI6ze/+UelNTDtrr8ztrhmK8Q4bC/Pe/20gPvhCvfFkxeKf
	 Gl4dxq6eI0toNQ2oIb3gzwXYcGwoP1dctDOiNFXTZvUCx+X33V2nu2EJ2nvHLW/2aBI5R
	 uIczQO8SLKD3h5VCnqoaiRqvx1wTm5xBS06GrnsUWF4we34IlIjFetd233q+lIdQu9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379286;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=aGTgRmIChqUrwHEFXITL+j5gAAqi0dRCXqiqJsw3B4g=;
	b=p932fHupIK+FInc40NWCzxRvOJnJ734DSMIfMeuYwD9blJR9sjzOE1U3Op3oo9NPmpNt
	 uFUJryPFJODMWFKjpTTvMLS3OWWDfi0UYyMlnfAUncioh3y6d0kNX60xMx8v+0PO0vO24
	 vjd/zmXv2X8IockuQ9M3pNAZMrllIX2JY2EXZpxToD4XU+A8SRQXQymAbVaGMXvAd1hWi
	 C72ZxiM58KfZ+5PYh9+xvxXO/6EVC3HayvvP7SZzwoUb72GvcZrQGm0Z541vIG8PoYu2m
	 Cm5bCeZT41A8GDfUhGfFZ/2NM6j8kzewUEDaGeSqu1SiIroNB5occo23VePUB+oCbjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="D6n4X/yL";
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CA7606A323
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 16:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8CA7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=D6n4X/yL
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52f74f120;
	Sat, 31 Oct 2026 00:54:40 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Lee Jones <lee@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	stable@vger.kernel.org,
	patches@opensource.cirrus.com,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] mfd: wm8994: Fix potential use-after-free during removal
Date: Sat, 31 Oct 2026 00:54:29 +0800
Message-ID: <6c39348d96fd188f514e9b0f1e5cfad19af6d0ae.1793377422.git.liguangshuo@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa18dbc252f03a1kunm46158e5a52a34
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0pMVkwYSUtITh5OGEkeQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=D6n4X/yL/EmYS7dx8Dq3LxuEONurnrNuQHG5kCaXUi6tyHwZGvBuaOhXl/nwhswKYLwKVqG1CTbldbs7qJzBlivn9BfUq26sjFlLNaCu01Kt/NbBv+2F1JLwOe1bg1rKswwexZG1VuQLwhclnFtAs04WIq1nmlVi3OVbGRTQWNk=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=aGTgRmIChqUrwHEFXITL+j5gAAqi0dRCXqiqJsw3B4g=;
	h=date:mime-version:subject:message-id:from;

The IRQ chip is deleted before the codec child is removed. The codec's
IRQ cleanup can then use the freed IRQ-chip data to look up interrupt
numbers. Remove normal children before deleting the IRQ chip, and keep
the LDO children until their regulator consumers have been released.
Use late removal on probe failure as well to clean up the LDO children.

This issue was found by our static analysis tool under development.

Fixes: bb63f7d33d35 ("mfd: wm8994-core: Disable regulators before removing them")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:gpt-6-astra
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 defconfig plus COMPILE_TEST
and the driver dependencies (W=1).
No runtime or fault-injection testing was performed.

 drivers/mfd/wm8994-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index 094c0b3dbd97..9dbc8dbaeff2 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -29,11 +29,13 @@
 static const struct mfd_cell wm8994_regulator_devs[] = {
 	{
 		.name = "wm8994-ldo",
+		.level = MFD_DEP_LEVEL_HIGH,
 		.id = 0,
 		.pm_runtime_no_callbacks = true,
 	},
 	{
 		.name = "wm8994-ldo",
+		.level = MFD_DEP_LEVEL_HIGH,
 		.id = 1,
 		.pm_runtime_no_callbacks = true,
 	},
@@ -586,7 +588,7 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
 err_regulator_free:
 	regulator_bulk_free(wm8994->num_supplies, wm8994->supplies);
 err:
-	mfd_remove_devices(wm8994->dev);
+	mfd_remove_devices_late(wm8994->dev);
 	return ret;
 }
 
@@ -595,10 +597,11 @@ static void wm8994_device_exit(struct wm8994 *wm8994)
 	pm_runtime_get_sync(wm8994->dev);
 	pm_runtime_disable(wm8994->dev);
 	pm_runtime_put_noidle(wm8994->dev);
+	mfd_remove_devices(wm8994->dev);
 	wm8994_irq_exit(wm8994);
 	regulator_bulk_disable(wm8994->num_supplies, wm8994->supplies);
 	regulator_bulk_free(wm8994->num_supplies, wm8994->supplies);
-	mfd_remove_devices(wm8994->dev);
+	mfd_remove_devices_late(wm8994->dev);
 }
 
 static const struct of_device_id wm8994_of_match[] = {
