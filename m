Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379285;
	b=VcjpVQQJibvY1bKC6fNTDZTe5ctlu97oImjqGUpyH2vHO9HxDKeKxE6sntiYN24yCKaV
	 esG/HDE7Ivz3kNM5S8FtxYQU0vuhT3jCHXeJX3Z+fFwp/brLYY95ED2wlaiTDAE+qutSQ
	 2yM2FE5oiWJCuaIzh8lsfpXB2mXMHegKrXNA5uj2BzR+SfJl+IUqqijFQcCYTXAVyp8rg
	 w18thjtm4uSvv3/9HkVFFiCGFNh4mwvWv0SNBBbEK2xDOLa3B9sVw1XVeS6D6Jyge0gYo
	 BxhfTw15/ndN/4RwP9eIPGPJJtgE5i+RXUjr1D8wTrC7/Q5Mp7t65lFbyBYksNCRBFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379285;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=DB/e/wpajODFnFEPNZQEclDOTwh/b0zcDe2j8D0AgVE=;
	b=0NM5VsZjCQ/C2vg5v08X0r3nP4/O/xtaRfFCIYNjmJlg5OXHNTi1Y3vpXwdOsqpLoSrI
	 ovKmq4G5qTmMpRkljyfSoIt/ZyPJHttfHl75fs7Ejc2HwrptlmzXFlPsaWvVxL5MvkxZ4
	 7WnOBaJViQfHnBjAqdccrK8z/qc6ACy6Bm7SHyGjmAp/r/u/khvzByaGKanEbe5dTXdnD
	 OhBQwBeGilkLKVEmWWJq8ArDTfmDd14XI/+mvBonznhnRRf8zvGdFiN803F9sXWAFTn2y
	 TfYDqJfa2MsM/cQ0wcdLxZhYDd5TidFu2se6qWvZxFozmdAVIaCjJMDXitIYi7UHzfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="UKiPS/IA";
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74909606A32C
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 16:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74909606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UKiPS/IA
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52f74f11c;
	Sat, 31 Oct 2026 00:54:34 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Lee Jones <lee@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	stable@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
	linux-actions@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] mfd: atc260x: Fix potential use-after-free on probe failure
Date: Sat, 31 Oct 2026 00:54:25 +0800
Message-ID: <344536111bef51c4ee95740e2e17af26ca26929e.1793377422.git.liguangshuo@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa18dbc0ec903a1kunm46158e5a52a20
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGB1IVh5DH04dGktNTEhMT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=UKiPS/IAzOKMrkmM/mh6aKka+HiOk5GztCpNL09AeXLeimK4CUYm3URX/5nsK4iAty4hPPCcEZOA04Uf63B0tnoH/jyapy3GuVocdC8d/PqjQJK5X7C8aSEEuFnnFZpFtr9XFS8LCAXPKl/xbbbBPCS3zjTAlpyNXxmeCzpDEB0=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=DB/e/wpajODFnFEPNZQEclDOTwh/b0zcDe2j8D0AgVE=;
	h=date:mime-version:subject:message-id:from;

The IRQ chip is device-managed, but the child registration failure path
also deletes it explicitly. Subsequent devres cleanup can then access
the freed IRQ-chip data. Let devres perform the IRQ-chip teardown.

This issue was found by our static analysis tool under development.

Fixes: f7cb7fe34db9 ("mfd: Add MFD driver for ATC260x PMICs")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:gpt-6-astra
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 defconfig plus COMPILE_TEST
and the driver dependencies (W=1).
No runtime or fault-injection testing was performed.

 drivers/mfd/atc260x-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/atc260x-core.c b/drivers/mfd/atc260x-core.c
index 6b6d5f1b9d76..da233b6482fc 100644
--- a/drivers/mfd/atc260x-core.c
+++ b/drivers/mfd/atc260x-core.c
@@ -292,10 +292,8 @@ int atc260x_device_probe(struct atc260x *atc260x)
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				   atc260x->cells, atc260x->nr_cells, NULL, 0,
 				   regmap_irq_get_domain(atc260x->irq_data));
-	if (ret) {
+	if (ret)
 		dev_err(dev, "Failed to add child devices: %d\n", ret);
-		regmap_del_irq_chip(atc260x->irq, atc260x->irq_data);
-	}
 
 	return ret;
 }
