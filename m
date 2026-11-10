Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347749;
	b=xCNIYiXHFLFLo0mcDNMh96FD0FN5BQNEjyzHxv63hdnZrFYGiJaLgFQAnwFpMpZNFcQF
	 CXpnEAAWy5ChzeGhcNGaR5fSyCPrNN6Lm5baLtNh9DWhOewi2w01ISHCGfuoui4nhkNaG
	 BRZvjHFnZooK+0NAF/JSUcXdQzi5ouG44VsHsuENFosGc39YkLTF525afxwFUjpazYDK/
	 6VNYNMBUX97EAqg2/qThea/tOQo3AeG4B2MYgPbk0MJ3LSxGwRKV8PGXBio8J0KOL73uk
	 vYWiSJCydSsC37qzQf0I1SkWeTeI0q9VdZlfNvhCtSAljRT8tBVdNVQLiti0O7SQ+Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=7+a66nuJAxZv2NLoN6sl/H/HIeT9eO6TiCDIQQ0skPA=;
	b=oQ9ESlm0dx16e2qO/IGYzD1g+/Hrztcj3pvyKtlOEm//j9N7v78W65h63IFGk7Q+B1Z9
	 D/y4Bt6Z3mp6bUT5s5b9IUDN2u7SjDRQyJBKNIIr52cEr0MHcxV1yA3a1WzardaqnexLp
	 ICt45tW3lc4ca8JxjkW5yD7+xKQ1R/MvfCySil4Jd4mJGybxWMpV6Jl6QXi9hAMCGFqPE
	 4s9STiQbtiuOxzQfHvuN7vRsrkmj4EzzfOHPtEKanV1qMUbXQJsVeW7AbF3mxakRzvkM+
	 myd4BLT6sSG8adaX1FSOQC+GxIe0YlhlKBnmaq8D/4mjzrWs19kn2bf6Ey8iLcANUlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BoEYTqwC;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004E760A2600
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 004E760A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BoEYTqwC
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1699618f8f.2
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347747; x=1794952547; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+a66nuJAxZv2NLoN6sl/H/HIeT9eO6TiCDIQQ0skPA=;
        b=BoEYTqwCELVijard8O8pabvj3N9oycv6CglpC/9NO8IP029vQUFMms8slRTAkSxg0F
         2iYLx8/44tTW0YkLcW8eQ8f8Px8dCZlxkgahOtrE83DhVhji8wWqVhCHsL12TiKuVZhW
         WmEaQW5H4/ajfuXZgDoqspoAo+eb4d7/UpHnQ359Y3u6YWt+yFBOFCzFrU+i0o4g85o8
         BhXtX9oBJovs/kcMGfM5WDY4fKrTj8nOQF1zMHQIexVf25iswfxHrf+c2igonRc2BEEt
         SZd1dEn/1vwRQODPBnrd6zUelNDAt6ma84KPfsfGK3UcVSt+0CPZ6XHTjBTS3PPg22kI
         aeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347747; x=1794952547;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+a66nuJAxZv2NLoN6sl/H/HIeT9eO6TiCDIQQ0skPA=;
        b=nkIDOKt/Qu4U88ArSvOp+h+rPlhlK/TfhVahX6fKTcqnnXjz+C2nNpe7PAt6KbbHhR
         6W7DNrtZ3mbUxeUDhezXF3q1wfQ0Xy0QokzOp4bARNr1AjC2EOJdlcvnfIQStqOg5mui
         PELRDl+t60tOCIhBwg1FC0qWHrRKliZSmjeG0gUBds7E3d+bl2LeC3oYU4kHKx340bLz
         oL1cWj10zIZWLfW7W2EjPz33+ZIhzqtcrevy8F/W10qiP6+dHVQ5qYmX27HgVgjBzfiK
         y099LvLM9/8N1dVLN/qE96asGMzLRE+40mYOxkjwFEVdwQ86g0sqQkkfnvGjx+acqD7C
         Y11Q==
X-Forwarded-Encrypted: i=1; AL+hErGl+f/ZSSEK6iKy1WvBUrV1mJsro9fOf6c62/zJq4f1cB9K2qlwFq6jfLkpq9LcKDIKjZ4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Ge36ddZQ2TGpvapca5MUSlaVhAZPj1hLFsUc5nPWr2RJ6CUDV
	K1cY0zZtmnXyFmxYsLnyKtV+v03v0tKqUQNWyGHnHN5T9+CndzqQ7WamkC/wxT1826g=
X-Gm-Gg: AYBFou0Ch+PIEJ0VgOQrdoPGVVNy4SgfS8DSGH2Ei5G8VM64dL7ZMWHATiVNMcVLfAj
	vGsF6USWsLJ2xX8mNk2U0/xbge7hPDTXrXMVbJbD/zvFHedJixPtJvR9tlktNdEmAd2f/jkZ9j7
	HjJXPKztuhQk/yp9saInEunRy5NizBka18OZCkzYAtTyCHkVYosEHV+bo8Sa8+vdGtsje5MU90E
	BZhExzSXiADtKRIBEzTob3FhVmXhrYL/MlnXqXusQtJ6GuOa2vlXIvtalEMd062PouEpcvi2X3N
	x3jbzr5/p4JKNQj79M7NW3HV/V2j/rzYToPsOkJ0ZChzd0G/NFaUcacUI4POzzXIkrdzgcQaZoG
	ubIQ5hCb18/64mGPEX2Zh5KvW8v8gAK28UvNJw7RdbguHWqsWnvQnjD4tNbWbT1RP8M3HkYhOaY
	HoDHMzhfvufNaaoljWv0leW2ZSsLYxJlggZdxvlBrcuk2D7+tycD9bFRmhSx/eouUmptg4Y3PoR
	rk9B19vS7DPf2H7nwwLFl9cfw32TS0tgh2E7z0cwtccY01JtjFLDoWnIow/8CwOdA8N4EW4AyhN
	/hJbeRsFe0cRJ5jNQXWEG48XbQ/b/RVriA==
X-Received: by 2002:a05:6000:22c4:b0:488:823d:5086 with SMTP id ffacd0b85a97d-499c096bfd5mr530611f8f.0.1794347747383;
        Tue, 10 Nov 2026 13:55:47 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49835d2c05dsm7160201f8f.25.2026.11.10.13.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:46 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 01/20] mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used locally
Date: Tue, 10 Nov 2026 22:54:26 +0100
Message-ID:  <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BVhRr6erYdr3wFkjbzEJs89tzl+sRAbty1vb11mdCc8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KVWt+3x735zZE7d3XsVM+Ir1QvYkRsw/GQV AkuwK9+YrKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSlQAKCRCPgPtYfRL+ TsCYB/wKlHgDWs9WbgfoPzex63S+2tugmXVK7KqaQrfxk+uogoRgx22NJCTuQEza5JqZNvFsSs0 twOEXeOfgMREGY4+lHrUyYjk7kC0P4zIhVYdO835/BF9lK1Pdc3PMKVkwdnujeRur1xT5BCwfdk mtghQTqpD6Cb0GDwB/4n4QwirZZGZAsccX6I3WrkOuvibweAhGBy96Vf8U0e1WKnNl37Ou2m4/K Zbl5MJiV13Dvajw2inFrhe0wwMSC0kpa4ImetQsXmxRV00fR8NnvYNncgOZxckNxwfu39q7tXB4 pk2tgDKioZu9PFekQy7YjE0QtRZvqBa1SoD/LDTV411HWeNo
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
replaced by a local variable.

With that change enum bcm2835_soc is only used in the mfd core driver and
so the definition can move there.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/bcm2835-pm.c       | 11 +++++++++--
 include/linux/mfd/bcm2835-pm.h |  7 -------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 9e8e3dcf4bce..87de35075419 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -69,10 +69,17 @@ static int bcm2835_pm_get_pdata(struct platform_device *pdev,
 	return 0;
 }
 
+enum bcm2835_soc {
+	BCM2835_PM_SOC_BCM2835,
+	BCM2835_PM_SOC_BCM2711,
+	BCM2835_PM_SOC_BCM2712,
+};
+
 static int bcm2835_pm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct bcm2835_pm *pm;
+	enum bcm2835_soc soc;
 	int ret;
 
 	pm = devm_kzalloc(dev, sizeof(*pm), GFP_KERNEL);
@@ -81,7 +88,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pm);
 
 	pm->dev = dev;
-	pm->soc = (uintptr_t)device_get_match_data(dev);
+	soc = (uintptr_t)device_get_match_data(dev);
 
 	ret = bcm2835_pm_get_pdata(pdev, pm);
 	if (ret)
@@ -98,7 +105,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	 * bcm2835-pm binding as the key for whether we can reference
 	 * the full PM register range and support power domains.
 	 */
-	if (pm->asb || pm->soc == BCM2835_PM_SOC_BCM2712)
+	if (pm->asb || soc == BCM2835_PM_SOC_BCM2712)
 		return devm_mfd_add_devices(dev, -1, bcm2835_power_devs,
 					    ARRAY_SIZE(bcm2835_power_devs),
 					    NULL, 0, NULL);
diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index d2e17ab1dbfc..f70a810c55f7 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -5,18 +5,11 @@
 
 #include <linux/regmap.h>
 
-enum bcm2835_soc {
-	BCM2835_PM_SOC_BCM2835,
-	BCM2835_PM_SOC_BCM2711,
-	BCM2835_PM_SOC_BCM2712,
-};
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *asb;
 	void __iomem *rpivid_asb;
-	enum bcm2835_soc soc;
 };
 
 #endif /* BCM2835_MFD_PM_H */
-- 
2.56.0.rc1

