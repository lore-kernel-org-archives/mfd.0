Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880124;
	b=ZuoySC6AHP1+qw5sawmx2B3VQS83N0ZkgxL7w5n0jFWZXxu/VWArtBxBqe17gd/RqIpF
	 WEuUWmFXUlwLBfBHi8UJIqhjZaFBR1pPwaQDBTMF9D9AEXp8PzLHZ7CeXNauU9J4CKn0i
	 5Q0HmXFqkqgay8SRGESbldCkfMkbHMquWDDqD2ulSPoGaa2EjnhHYlX102PM8TcCA2lka
	 QPTGYkcFc268Rd17d9gnTo3IA7yNtAJdDumzyZSHqaDn4Q3hbs0EMe1gpPQMKCazy3fpm
	 ju3wO7lHfwJRWD6u3wOp4XUPJ5ZMcPpLQZfQLQVJEVeCuT8vseS/xdefxDoSpKU6NNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4UNIcfLh2UmARAy7gKdF7vRyfbS9uaHEze4ik/95PcQ=;
	b=VoHhPN+xO0mASc5PBmKcs4DhZ1zUTThfVD9N6LvTl/beT4+gW08Lz3Ys9Muwx9mP9d0m
	 EymPBuuIodzbEbQNUlzJI+za4gnue/VFIHXefsEuQk0JzVUtboCGFl0EqA6hbLn7U5tPX
	 Y1+hLz6HCGKp+vlrBDWrShav0vwj5wGt2pLA/q/BBYSVnc9Ru4GgOk2ko+udzvLgumaRB
	 ui3AtPg6pvaQN4K5NgGJD2IsPKjyJ9F7JiMue1nIrEiaO6IT/AlrwizyihORcp/Y1S9hT
	 o53Z3+rXVn/bs9kig+o6KgNSgGWbr53mZJnjd7NwIvPuRlLYcSc1wmwlz7C2j7GHDwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W67fTYTp;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE5F606A321
	for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 15:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE5F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W67fTYTp
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so71373215e9.1
        for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 07:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880122; x=1796484922; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UNIcfLh2UmARAy7gKdF7vRyfbS9uaHEze4ik/95PcQ=;
        b=W67fTYTpXS15jR9fpvnphINxNYIy4y2/nA3jAodLMREvxCAMHmHQSB6cDjhYWw0I/x
         MrgGyX87cMsXgOancWXRTswIpHRCTP8B6gvo/IJR7S50dDsfIFbUvOxj2roH9I4Zivqe
         jwfuXeW8vzTCRH1MTRECRaO4NXcD3zYHeTNsoGv+513pzgC6Axa2rEusu6YQ00gjp0Li
         6qkiMm7GyPaWyDlX7GwI9DvkyEqtQpxi5Xj/m9/vRJzGgGkJbrdhNEtF/sZvH0yVUSBv
         9h48gd0pRt4/R7JVzmBro503VKSb/0PYfY+c0Km9WaHl6cupRMQLFYx2ycamhBwLLNqP
         csHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880122; x=1796484922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UNIcfLh2UmARAy7gKdF7vRyfbS9uaHEze4ik/95PcQ=;
        b=gsIP1zNgaTCm48eRJ59j3cbXvvsFywCC9fK2XGgYDhZieGGsUw+ZIzIY9aJeWKFEp/
         nXAFd55IDMfiP+ph/4oY8gadFQxAxl9Ss6Y2fIh695S+RoqsjqGHTZSKz0IRbyZz70sE
         rDf+WUjJJIAI+/yMqPWyGMXl9TDsomyv58py9+eZaAHgC8MDewl8/XcAthNlWm3gGGKC
         CIj+3mF8UPmm17jUufY4lUoWCfnelbNm5KtmE8cqV/mjBOOz7dojeabOHpyYPp70VrwS
         XSjBxzi6HwxaKv6n5eRIz/LXALP7Mh6o2alSW/jQpt4dvUbdW44Qq02hUnlmrloi20MA
         YNdg==
X-Gm-Message-State: APuU4Z/0dGIaPcYSU9dSIdXGHVJ8AUtW5VY58f9aMtAasrMLT/GAQTDv
	eNyu0CAgEz7StKN31z9Yg8Eo7DOn2UWMWqwaV9LFwCppKJFadqHlxFvf
X-Gm-Gg: AZFdTZcEAstfKIIwtS9LxPHhmrKWwtxLV6LkVrtqrZON/nTqUHYVYbV9JefoS3IvCYd
	YpcDEiz7GaGqkoxSvx1dTTMFVEWuBoyC/8r15+KLtrS8NMLdcTP281+QYPnnopVbVtzJBTzGG62
	JjEqLoX1FMrfVf/3DR7S5EeSQSmp+vzkZIfP/LUqKBqM3HbxE8PY8mXuow1fmVXKumox1eVZ6tw
	8/6S/GhjipD9SGlsXv7gq+606kAs2/obTriqfdzRHBVJCRccLU7OaBkRIfQIN8pxU4aXbQzQuBJ
	qx7qoMVpCAFwKjLY+glIW87zEaJ7I78Mz/wDfQVO4be49TzKGL/3D0ugdDkVxY1XCVfNBduWTVT
	2IzbaV9CQU3ytncyXnfZaDqc0sSDr5EBWiYyHFq7iSWP+PQ6Z7c9usf7nQgfaq+ZYVqsb4+z8Pj
	htrW+wnvFbYPcmahphIoVI7rtAdpgnd0ElUFOyqdJmLCuQ6bQOvlJWm6SuFh42L7A3uMaWFzLAC
	mW1YhzYcKoMAd/s+JCKHiVxuXOh29tvsKDEqfyf4KIBOXXlQsr3oclwLp+XHiGdVwAFtDmcKj3A
	xXdBRd/QXtca5E+p/U3ADSQ9jrpB81Vgqq6j7mt5
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr571761385e9.3.1795880122490;
        Sat, 28 Nov 2026 07:35:22 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:22 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:34:58 +0100
Subject: [PATCH 2/4] soc/tegra: pmc: Register restart handler from early
 init on ARM
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-t20-soft-reset-v1-2-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=1FogJzqzHqWpDAjuCweRHcTK3ViL2zXlOiygHcXOspQ=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl63hotdPHJj4Qa2g4NqnKVxrb9lt2dU18b8s462Xh
 vxlvRU3OkpZGMS4GGTFFFnMHgp94Znn9X7Dy62dMHNYmUCGMHBxCsBEGPIZ/vBubk5wqHlinHI8
 ufDsya5Ss9teUv8Eg26KFD/lKo6b8oaR4YyB2NSN96+zaR1YYbrL5/9Hm0luNd9yW1/s1s46mGz
 ZzgYA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

On 32-bit ARM the PMC restart handler is registered at probe time, which
is deferred until the core-supply regulator appears. If the kernel
crashes before the PMC probes, it won't be able to reset the board.

The handler only needs the PMC registers, which tegra_pmc_early_init()
already maps. Register it there, using early_pmc, so restarting works
from early boot, and don't register it again at probe time on ARM.

Also switch early_pmc to the new register mapping before unmapping the
old one at probe time, as the handler doesn't take the lock.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/soc/tegra/pmc.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 721e9596b07d..fcd9a644d97f 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3090,7 +3090,8 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (dev_to_node(&pdev->dev) == NUMA_NO_NODE) {
+	/* On 32-bit ARM, tegra_pmc_early_init() registers the restart handler */
+	if (!IS_ENABLED(CONFIG_ARM) && dev_to_node(&pdev->dev) == NUMA_NO_NODE) {
 		err = devm_register_sys_off_handler(&pdev->dev,
 						    SYS_OFF_MODE_RESTART,
 						    SYS_OFF_PRIO_LOW,
@@ -3168,8 +3169,11 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 #if defined(CONFIG_ARM)
 	mutex_lock(&early_pmc->powergates_lock);
 	early_pmc->rate = pmc->rate;
-	iounmap(early_pmc->base);
-	early_pmc->base = pmc->base;
+	/*
+	 * The restart handler may use early_pmc->base without taking the
+	 * lock, so switch to the new mapping before unmapping the old one.
+	 */
+	iounmap(xchg(&early_pmc->base, pmc->base));
 	mutex_unlock(&early_pmc->powergates_lock);
 #endif
 
@@ -5182,6 +5186,7 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
  */
 static int __init tegra_pmc_early_init(void)
 {
+	struct sys_off_handler *handler;
 	const struct of_device_id *match;
 	struct device_node *np;
 	struct resource regs;
@@ -5235,6 +5240,20 @@ static int __init tegra_pmc_early_init(void)
 		return -ENXIO;
 	}
 
+	/*
+	 * Register the restart handler here rather than at probe time, so
+	 * that restarting works before the PMC driver has probed, e.g. on a
+	 * panic early during boot or while the probe is deferred waiting for
+	 * the core regulator. The handler keeps working after the probe, as
+	 * the driver hands its register mapping over to early_pmc.
+	 */
+	handler = register_sys_off_handler(SYS_OFF_MODE_RESTART,
+					   SYS_OFF_PRIO_LOW,
+					   tegra_pmc_restart_handler,
+					   early_pmc);
+	if (IS_ERR(handler))
+		pr_warn("failed to register restart handler: %pe\n", handler);
+
 	if (of_device_is_available(np)) {
 		early_pmc->soc = match->data;
 

-- 
2.56.1

