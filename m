Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655994;
	b=3AW6Gl/Q5dxYXr6xqUyMTIDpiqLSbEeTfREBLOvT3A7vNjf8kz0HNwXXzEKQTBTtBmzd
	 CSoQae6VfgS2IQOwqw/r8irrN3AA39SCyEfVgtia36L+dbt4MmM9rYPlBC9sw1p6Yiy9U
	 QM8ttofUJgvrqr+aopbE1G8lI/c0B9mkia0Q6Zschc4IaP2x36hBSDQIOQeTF7Fq6UEcM
	 jRMEZokyOjfAKtKLF274+bYISkAv93Ob1TdExq5dfJs2zmbXrVPh+rthP+lknCEZoTE5/
	 qg3IZT346vPJti6Btyt6eyoCg05fCdquLqZjQSzc6djaxp+h4PAzwYsNEDTcQHeYIPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655994;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=s7zuj6DsUNNuSVXT7SDA5TaygmefAyEHFDucZK3jebM=;
	b=UzPFVLe444LDpe0/Vdib35DgOZyskP0u5rorQmZChbTxWRNGKVzvW2MsA2QG3rV4Mle/
	 4C4SjDZGtihijnMn03Jb8DH7ZJu7fTcRxBToOSdY+3TCKt8+yVsZHy2nz7RU6JuoVAqwp
	 4l/7GJc3EBFchMRJUGfAXW/IgVstEIOcBRpqaEn6F0X4Qdv2gYfmQ/FSfZtAaOo+dmpnI
	 cqp/Dv3TadJ7H5dPCEWkGcib9UeenSrIP7Bk4fZw14LiKbPrjGEb3DykJnGBTYXLTSWJg
	 KlrOGJL+DjkMrlSCkTb+oM6S31m2siMsTeAes69sNe6dSZ96EK3htCf74WZWB7kjvag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=kRB1ziro;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89A606A31D
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 07:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F89A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=kRB1ziro
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261022075951euoutp01fcee70c169ca30e69aa5251e3913e9eb~gyyBW_pvm1224212242euoutp01a
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 07:59:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261022075951euoutp01fcee70c169ca30e69aa5251e3913e9eb~gyyBW_pvm1224212242euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792655991;
	bh=s7zuj6DsUNNuSVXT7SDA5TaygmefAyEHFDucZK3jebM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=kRB1ziroCwrjbCVkp13dx1dECoOmgTE0MR0sZjBOqTJKoOtWpAQpAwBjMNzmshwU+
	 QkWQysQyycwMLV7k6nuzbMrPktAzBJK/dFQw2pu5yN113jbjCtNsFiJQxa9AFu2PBN
	 Ylrql/HokonruIYVzxsmQOumhFKiZB21re7UEa0E=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261022075950eucas1p24096817dd7f79071a41320d9cf2d1c30~gyyAptZZ_2485424854eucas1p2u;
	Thu, 22 Oct 2026 07:59:50 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261022075950eusmtip18695a430becfc0ce776a5d0b716e4f61~gyyAQZ--e0199401994eusmtip1U;
	Thu, 22 Oct 2026 07:59:50 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: patches@opensource.cirrus.com, mfd@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH] mfd: wm8994: Enable runtime PM before registering IRQ chip
 and children
Date: Thu, 22 Oct 2026 09:59:36 +0200
Message-ID: <20261022075938.625795-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
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
X-CMS-MailID: 20261022075950eucas1p24096817dd7f79071a41320d9cf2d1c30
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261022075950eucas1p24096817dd7f79071a41320d9cf2d1c30
X-EPHeader: CA
X-CMS-RootMailID: 20261022075950eucas1p24096817dd7f79071a41320d9cf2d1c30
References: <CGME20261022075950eucas1p24096817dd7f79071a41320d9cf2d1c30@eucas1p2.samsung.com>

The wm8994 regmap IRQ chip is registered with runtime_pm set, so
regmap_irq_sync_unlock() calls pm_runtime_get_sync() on the wm8994
device whenever an interrupt is requested or its mask is changed.
However wm8994_device_init() enables runtime PM only after
mfd_add_devices() has returned.

If the sound card is already waiting for the codec, it gets bound
synchronously as soon as the wm8994-codec child registers its component,
so the codec requests its interrupts from within mfd_add_devices(). At
that point runtime PM is still disabled and pm_runtime_get_sync() fails
with -EACCES, e.g. on Exynos4412 Trats2 board:

  wm8994 4-001a: IRQ sync failed to resume: -13
  wm8994 4-001a: IRQ sync failed to resume: -13
  ...

Fix this by enabling runtime PM before registering the IRQ chip and the
child devices. Hold a usage reference while doing that, so the device
is not runtime suspended before the probe completes, and drop it at the
end, replacing the former pm_runtime_idle() call. Also disable runtime
PM on the error path.

Fixes: 7a97637988c3 ("mfd: wm8994: Flag the interrupt block as requiring runtime PM be enabled")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This patch has been developed with LLM assistance and have been tested
on the real Trats2 board.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/mfd/wm8994-core.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index 094c0b3dbd97..231f21851614 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -562,6 +562,15 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
 					WM8994_LDO1_DISCH, 0);
 	}
 
+	/*
+	 * Enable runtime PM before registering the IRQ chip and the
+	 * children, as the regmap IRQ chip and the child drivers rely on
+	 * it being functional already during their probe.
+	 */
+	pm_runtime_get_noresume(wm8994->dev);
+	pm_runtime_set_active(wm8994->dev);
+	pm_runtime_enable(wm8994->dev);
+
 	wm8994_irq_init(wm8994);
 
 	ret = mfd_add_devices(wm8994->dev, -1,
@@ -572,14 +581,15 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
 		goto err_irq;
 	}
 
-	pm_runtime_set_active(wm8994->dev);
-	pm_runtime_enable(wm8994->dev);
-	pm_runtime_idle(wm8994->dev);
+	pm_runtime_put_sync(wm8994->dev);
 
 	return 0;
 
 err_irq:
 	wm8994_irq_exit(wm8994);
+	pm_runtime_disable(wm8994->dev);
+	pm_runtime_set_suspended(wm8994->dev);
+	pm_runtime_put_noidle(wm8994->dev);
 err_enable:
 	regulator_bulk_disable(wm8994->num_supplies,
 			       wm8994->supplies);
-- 
2.43.0

