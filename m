Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880128;
	b=aQuLJE3Z/1SBYNVd7/EA94dG6PDqPVasPStigXTYtZnzYrIZvw4xMyZj6XSZumujoTjq
	 7nDPigo68o4nidydfjJXB4uplmDZvgxOlHPEMDH/yyHzhTd7QhbRtiY4/+phJDs+k2XKM
	 gdE36VdqO1/iCaWty464gl1XeSUZb0nAm0wj4hHrz2yISwsQ3di6nOS8/NzbX+hzvksuN
	 B8fBaH1VF9bQUSblqefLhVPCrSr5CZHt/vhyiSOjtMGgrhLVyi0QRGtWxOnTyiVUuLzqe
	 CCn54hzF2qv6x2F6SqR29XubSxjoemsVdGqwCB7hwLcYM9RD00yjBGkripuzvo1L4ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cfftNM/o6/uERx2scyV8aMPrgBR3cRX3BHVyMUstbh4=;
	b=Vha0XBnUshb1k6QKXEJsb0gZngcxqaERWSwHMt4zZGiEZHtgBErq98x+Y1QokE8r4iix
	 /ZSZ55Yx96/iq2CWYWRnsSBziYviRiVHS57jJOYUVxsnYy4IlIDbNxWUw3mb6CgHi5Oux
	 ZvhtzMvRrG73eOpA0CWCRZORr98EQ12VsxL8w3VIb47D2zsXHcXLO9y/FnrxEFWSB5caA
	 E6H3THdfiGd3maNMIezrIY7u4bneKJoNzyC4hBg2MO8iQypL2JwPDGAPOIpQYrspNLPjS
	 TSU3gj6hy5sDUwRKwQrAcZSdwDawc7de4T/QtmHvANSyHogXPTiv+WfBY5ddeYSHxIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcJNVH3O;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B75606A31F
	for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 15:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B75606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcJNVH3O
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso85991285e9.3
        for <mfd@lists.linux.dev>; Sat, 28 Nov 2026 07:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880126; x=1796484926; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfftNM/o6/uERx2scyV8aMPrgBR3cRX3BHVyMUstbh4=;
        b=vcJNVH3OCPZC486GozhgIQMv7fTKffFyvO/gEFsLXRBf964cFsBM9846JVC2FKbCPt
         9TzYD4rarz9KHAFau4k+GeMNSe6q1319F2ch9w8fRtQIaIP9F08MeJxwP+GuvtVTV7M5
         usAX0D9jpoWVbqlHbW4SUXk7xf+EIHKfyjOIrM/Qa5m5Y+YXNUemJ+8iVetw6mePy4As
         OcMH4orOLnnGRXjMwtnNfvW1adSytlVzzL4IjXmLnSusDzZE9US+Kxi2y83hm5yclwZt
         KHjjcMoU/9eH5skDZA8Yxx71olaO9m0zka+Li9kdVaO4hcM9ltBQyjyJnVJCOEgLSDvS
         EuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880126; x=1796484926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfftNM/o6/uERx2scyV8aMPrgBR3cRX3BHVyMUstbh4=;
        b=DnNFC3OrLf77rAX+/leM3Zxsv6LGuXnTPRC7ZYhiGwxorIOC7UNSzI4MLXxlSZda1Y
         FhSfNTikSFFAS/NdREQ7SJ2FKykaGL25B2imyrwPgYMS+P5JOvYcKKowBUUlk0oCm/RE
         YnmTYVp7zmhEq2DSb2ZZGqe4/mFyrRt1kg/OF7G92FNj7rDtYE2cCEiuTY23HoljHBXE
         e4yrsFujgqM03frY1VudgPuXRFymWO37ekyWiV39+1I10sxpjT+Cnp7V9Rj33TRWCQ+K
         FC6MudeiXIhCPEObungUIi5ifROxlhFt5CsSuYV2u1dErDnrf2nzdBiNNp8o6cZ3XS7s
         xlzQ==
X-Gm-Message-State: APuU4Z831LjbXQ2ajQY2Lax2ZQZmcF4o+hOmRlqOPuQPadPw78OymIYK
	TCgmVeG6HozBA9fD9gmZ/h9nx6VCFU+waRBRtKBZCKB5tSM1FulNSlBO
X-Gm-Gg: AZFdTZcBvpA1oWsBkPUAuHiZ7HBW1p2UWbNQ1TwiHpj36EbCwtof3BurE67gL3iNK9c
	gZ3c8HynpX8F9IV57HOCTvCi/22rUuClFbAHkJl3/H/o3QMvPnxDgmJSe8u5+dWZ/kFyylVwl3q
	hAhxddsq6AGnxPvZbkW3mEujRIaPlb1JGdcvINZDT/CGH9fyjb7ooFuaykZhtfdYpFz5nptVaAF
	myl8r0sA+1q7ct6E97uHO5MYy2POh3N3495ULbyvdJ2W/LKKsuhoap3akfcIDWOJpbR2VUyjcOL
	MIejuplQAf+5O4ELy/PHu4/ygoYGcao3X4fQIxLnWfPS+uwenbiHbBpjhnXMPWh4dDn2ctc6w6c
	CXEC78fEjSUV6unnRVlmjehfEOAMPKFqmVcBjsSTfH+ppqd+pQu6PdVcfkmfipXJAPEIdaHyUUh
	/6VIavOzKTfP/W2wUl66kA7BYfllRueISnS/HhZ5l7vTnowvgXCKmfiPANC18S7wKwsKa9yBFsI
	zsMrYCylEgCgswBRXP7hEq+6W4QtTaccUNvblAIkMjT58ymvUkoisdtU/l6uDWlsS+2PHqODuKS
	qg1ZsrXTZ/A21qHKs1wfxIQ+NbWUcWSFVJJxncGf
X-Received: by 2002:a05:600c:1da9:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb88819294mr584305435e9.30.1795880126455;
        Sat, 28 Nov 2026 07:35:26 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:26 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:35:00 +0100
Subject: [PATCH 4/4] media: tegra-vde: Drop warm restart workaround
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
Message-Id: <20261128-t20-soft-reset-v1-4-0db458c5996b@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=hFtT0U2Rwf+oq2641JSfqN8CqbYI8bYr/DwXrJChJgA=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl61MTeKt/Iwu07XrJh103vSX9VZ3R9GsO4quqvGWL
 32/1zB1lLIwiHExyIopspg9FPrCM8/r/YaXWzth5rAygQxh4OIUgInMdmL4Hyj/7K4PQ9Ha64fl
 eF5M+83SvFvhoG9F5T2N1ycnihwPnM/I8Lrvy9Nfjpq1ITNNNnkcuNFn8OqkWt7MD1P3TZxx6FD
 IGmYA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The VDE driver powers the VDE power partition on from its shutdown
callback, and leaves it powered on in remove, because the Tegra20 boot
ROM hangs on a warm reset if the partition is power-gated or clamped.
The PMC driver now powers the partition on right before restarting on
Tegra20, which also covers emergency restarts and doesn't depend on the
VDE driver being loaded.

Drop the shutdown callback, and power the hardware down on remove,
unless user space has forbidden runtime PM through power/control.

Tegra30, Tegra114 and Tegra124 aren't affected by the boot ROM issue, so
they no longer get the partition powered on before a restart.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/media/platform/nvidia/tegra-vde/vde.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.c b/drivers/media/platform/nvidia/tegra-vde/vde.c
index 878a5b37846c..6546959e4069 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.c
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.c
@@ -394,22 +394,10 @@ static void tegra_vde_remove(struct platform_device *pdev)
 	tegra_vde_v4l2_deinit(vde);
 	tegra_vde_free_bo(vde->secure_bo);
 
-	/*
-	 * As it increments RPM usage_count even on errors, we don't need to
-	 * check the returned code here.
-	 */
-	pm_runtime_get_sync(dev);
-
+	pm_runtime_suspend(dev);
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
-	/*
-	 * Balance RPM state, the VDE power domain is left ON and hardware
-	 * is clock-gated. It's safe to reboot machine now.
-	 */
-	pm_runtime_put_noidle(dev);
-	clk_disable_unprepare(vde->clk);
-
 	tegra_vde_dmabuf_cache_unmap_all(vde);
 	tegra_vde_iommu_deinit(vde);
 
@@ -417,15 +405,6 @@ static void tegra_vde_remove(struct platform_device *pdev)
 		      gen_pool_size(vde->iram_pool));
 }
 
-static void tegra_vde_shutdown(struct platform_device *pdev)
-{
-	/*
-	 * On some devices bootloader isn't ready to a power-gated VDE on
-	 * a warm-reboot, machine will hang in that case.
-	 */
-	pm_runtime_get_sync(&pdev->dev);
-}
-
 static __maybe_unused int tegra_vde_pm_suspend(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
@@ -543,7 +522,6 @@ MODULE_DEVICE_TABLE(of, tegra_vde_of_match);
 static struct platform_driver tegra_vde_driver = {
 	.probe		= tegra_vde_probe,
 	.remove		= tegra_vde_remove,
-	.shutdown	= tegra_vde_shutdown,
 	.driver		= {
 		.name		= "tegra-vde",
 		.of_match_table = tegra_vde_of_match,

-- 
2.56.1

