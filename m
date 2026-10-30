Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379286;
	b=5apkdhgWuyUyHba+tpyaOUJetVARI2Dluzd/trwyFjHLAxwRoudgRAUpUGxSbFNN5XcE
	 evmth2Lt0NgLs/ueWR8PKlYMfdZMjj6cHha2AMTb2gtAwMVYRo4JjcjMYla9sJChwq+ht
	 tHIDTX8gz5Th7/ulxGMiwqdZltRjWS+SU8PKzlGzciokPKICCtSzmMCt8lD+fPJk1fGdP
	 uC5Rd4ZuZupVlBzUGPi9XyE72GTZ56dZz+xBE5WGQakHMcnNNv6XjBOFjY+DaJ2iIbspB
	 +ZMgUEsYf7J2g58wZT65aX99BmPvWxYDNMI7fSBxp6ISbip+D+i7DD40lyFW1nk1/Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379286;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=fNE2eV0m3D6OyWPIqQmvZsbomGlIUyQZym9vjn+vL/o=;
	b=DAMdTiyWpv8yTtHK2ZBYmJlcqtK9X+8qsFI7dNQ4byxRwU++/HTq4//C10s62sIk7wE2
	 jqJwbe4nygmudZtcpm72gpR4xOdt2T+2xDYmXXhTAJJtv+lQfIybW/Y7j3kmO33S2CvZ2
	 ZOWsNAswC2zEqt/fidl/l6OuN8vrMcVpU3/Z2sLj5Or/UBe1FQJW8ui8a2COwKUrTb1bu
	 u2+zfM8QiuLpssgAzNglPbLAxyE10+hi6unRD/EuvXVMzrrtLXXJtoJl8x56z6y1ukrBo
	 pffkV+0zxsdUhomjTWRuMrhpzFBG099VezkZn2AtY7zDVqNuPRy6XVoHQL4ByRTnBYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=NJhLc9zU;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727FA606A334
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 16:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 727FA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=NJhLc9zU
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52f74f11d;
	Sat, 31 Oct 2026 00:54:35 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Lee Jones <lee@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	stable@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] mfd: palmas: Fix potential IRQ action leaks on removal
Date: Sat, 31 Oct 2026 00:54:26 +0800
Message-ID: <fe4ee2ff4b3ad6675a46a169d6de6410db32b652.1793377422.git.liguangshuo@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa18dbc13bf03a1kunm46158e5a52a22
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0xDVhkdTE9KGB9IGUsZTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=NJhLc9zUAZUbMz4RbfiQSzAdSh5etaPu1SNUALwGAEHFs5rwnZDkv1J34bEZO/IXSofz23Irx8eYaLbEfxdtfKmvIT+PVhIX7D9k6szQiPJNrMwJNluGUevNAlYIfuTQEn8y2dtyS0D8h92Iiwbv8WMlcg64FyiqBLzbYY9Fms0=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=fNE2eV0m3D6OyWPIqQmvZsbomGlIUyQZym9vjn+vL/o=;
	h=date:mime-version:subject:message-id:from;

The remove callback deletes the IRQ chip before managed OF children
are removed. Their later free_irq() calls cannot find the disposed IRQ
descriptors, potentially leaking interrupt actions. Depopulate the
children before deleting the IRQ chip and auxiliary I2C clients.

This issue was found by our static analysis tool under development.

Fixes: 124e9deb1c40 ("mfd: palmas: Use devm_of_platform_populate()")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:gpt-6-astra
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Build-tested the changed object with x86_64 defconfig plus COMPILE_TEST
and the driver dependencies (W=1).
No runtime or fault-injection testing was performed.

 drivers/mfd/palmas.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index 7fc886f4f80e..8a0b7b1e89d7 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -677,6 +677,9 @@ static void palmas_i2c_remove(struct i2c_client *i2c)
 	struct palmas *palmas = i2c_get_clientdata(i2c);
 	int i;
 
+	if (i2c->dev.of_node)
+		devm_of_platform_depopulate(&i2c->dev);
+
 	regmap_del_irq_chip(palmas->irq, palmas->irq_data);
 
 	for (i = 1; i < PALMAS_NUM_CLIENTS; i++) {
