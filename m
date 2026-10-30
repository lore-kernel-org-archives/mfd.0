Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379285;
	b=J4XtIx1S1zj+losPj5EKroAJx7bAkyv9hGxgknLmXSiZS91iDElOemLJezNrtgE+97Qa
	 07UL+HY78lY9ktwi9J6YNaWDSrJAXtTs1+Esa7/hpzkCs10E0GxxI20svU95lhl3nUYs8
	 n8uv/g9YsIJUjJybFa7DTPGMOa6bNcuJLXMIJfVxhxBOXcjQp86AHzd0JuY8q4OxwWMLA
	 OBxUF/BbuRVwzOKokxx9hW+NG/opmA7c6GEjZqZqT2B2pDN2bshdLjOUok3FiO7B/HW3k
	 y7ej62BtS0t2jfsPhwIRWlXb4ndVdqnII10M8zW7owqdmew7N8I2ipzVPBs3tWTu7xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379285;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=wVuG7q5uMpwLdeNdNqczhbqcCJJG1XE+6CcI8ium2FY=;
	b=gYbkmmmGqYvWq49ook1Jk+CBRBNI9QBXwDj4xKeN+KkZ0k+c5PbziBcvFmaOekbR1TOL
	 8afoDNPbXU+mjJUw3boRGpwX8kx7IEecCdNNTcGw8gTJZ37IckDIKzfEkPgZWmNVpsiLA
	 2csjc/be972GvoE2K0OXGfATqqfVLcR5UF3lcgzJyqv3WwOn68PRsd/8cJWYDr5U24Z9C
	 1vAHYE5ufuvwFowVVZp0Wc+aIhqI/Zo9q/n8GbVW9fKTCAooG5M3tFVtzGhb1g80EA0bC
	 6gYTzZ8PvPvJsizHGK5ZggdY2XRaYT9I062ZRtNWGiNPGfm812jflvcZtBJPlB5Oepg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=IH6pW7U2;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CAE606A326
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 16:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CAE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=IH6pW7U2
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52f74f11e;
	Sat, 31 Oct 2026 00:54:37 +0800 (GMT+08:00)
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
Subject: [PATCH 4/6] mfd: stmpe: Fix potential use-after-free during removal
Date: Sat, 31 Oct 2026 00:54:27 +0800
Message-ID: <f25172a8ca446456fa3e856b1b8b76e11dace293.1793377422.git.liguangshuo@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa18dbc199a03a1kunm46158e5a52a29
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTEtPVk1NT0NIS0xLHU9KH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=IH6pW7U2J4IPfcChpf6c2jBoUJlT7AjgPqMcSPjDAvH7wI1GVrtbeu2zLTGUFhAixV+e5e1v5B6MKMolBfR7nEZL3IFiQ0OFJ4gxzce9OGTI1CvqGH1xoaZncIpouPMTJuS17B0x3OWbAVH3yIVY6RYTE3xeJodqeodh+R2ALGE=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=wVuG7q5uMpwLdeNdNqczhbqcCJJG1XE+6CcI8ium2FY=;
	h=date:mime-version:subject:message-id:from;

stmpe_remove() frees the IRQ domain before removing its children.
Deactivating a child's interrupt can then access the freed domain.
Remove the children before tearing down the domain and supplies.

This issue was found by our static analysis tool under development.

Fixes: 57bf2a312ab2 ("mfd: stmpe: Remove IRQ domain upon removal")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:gpt-6-astra
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 defconfig plus COMPILE_TEST
and the driver dependencies (W=1).
No runtime or fault-injection testing was performed.

 drivers/mfd/stmpe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 3c5c2f157f52..89c1c8deadc6 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1486,6 +1486,8 @@ EXPORT_SYMBOL_GPL(stmpe_probe);
 
 void stmpe_remove(struct stmpe *stmpe)
 {
+	mfd_remove_devices(stmpe->dev);
+
 	if (stmpe->domain)
 		irq_domain_remove(stmpe->domain);
 
@@ -1495,8 +1497,6 @@ void stmpe_remove(struct stmpe *stmpe)
 		regulator_disable(stmpe->vcc);
 
 	__stmpe_disable(stmpe, STMPE_BLOCK_ADC);
-
-	mfd_remove_devices(stmpe->dev);
 }
 EXPORT_SYMBOL_GPL(stmpe_remove);
 
