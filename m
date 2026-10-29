Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268411;
	b=c898OP6JshrrBnhtaOVFgKlnxq+28u/VmmiNaFlcVmcLlHIMLGPiOBssH+mt8XkgTVro
	 LTWi291nmTH66Fo/+hyOQBb09P8rbDbgzEl8VN/9yG6iYvx4fLM1xeE7CcogvJlIZx3py
	 aC27trrc0Eb3wCgUt/VSv7cjwfZFPu3P0vy9twje+f6AOPW4X+lge6j5pz5Xai2MYsv55
	 lOegV8A+K5TsbMjUhB1Aai0FSZSmSuXMBKSDArialS8McejjnpKlcr8HrTsOu6CUhT0Xk
	 P+mKffwl1MMwsgGrV48naY7yZNrnWiUO48K+X7DmRZh+ohxXeYsbpQqUui634njMSeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=C716tLFOYukgv8vVV1xiU5crvYZUQVn0gaj4X2Zv6Ao=;
	b=YKlBmGODsvtAttfkjZRf8pY+y4ROV4BuNF3tVC5PAjJxDQfnNJkbCxRSbhOwecGYVgOh
	 TupVuseEpsBWXiBbF3mJ+qGoBLFSlPnxSHVRBhJrfHb0+1ztHX1k3LrCo+sfPfevG9MUJ
	 jwixyvPXp4RKK07SEacl1bxV7j8+Rk+Co96K2L2Wc0+JNio+r+tmaegE1fX8ZLn8S7d2V
	 iZoVe5/j6d0MuWe/Kx4KIST5HW/8mmPvK6tcHcztD5AcTj1p5BQLLop1sUlyUHc95TUA2
	 vSSiZ+BU3lc4kFkB9XHP+hXasiKshBse9QEiD5WZTO12Jl4vDplB4+b3T94AlMIJ+sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eausvRn/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE6F606A330
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 10:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE6F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eausvRn/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso20042415e9.3
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268409; x=1793873209; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C716tLFOYukgv8vVV1xiU5crvYZUQVn0gaj4X2Zv6Ao=;
        b=eausvRn/u1mr1daLXKE1MTz+uLeUA/kxjhyov0xocjDVHFtdGqncoHt6ZEa5bEG7pO
         HtvKX0c8oV5ROyRiUcxv6QNzQcE0LPS9FidRDKLujQWcy3pA7pAr0oF5+zHPWVX2tuTG
         dee3dv19NGen3OOP7mNf5U5YeLmazwILRirTlAFwAiDRoHLrdANdzhtpaEs0hQ68i59d
         4oEKG1FbubEE32i5Mvvzb+66V1GWBeu3VL0WV0ZcLACNSLUTq8/5wbWxfcL7EHRE9nVL
         Bipi0YQk1AptPfHILpG023J0Eq6sQ2OJTSWUfzuEk661XK9flpMjikCZXDrS0QNyifft
         Jo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268409; x=1793873209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C716tLFOYukgv8vVV1xiU5crvYZUQVn0gaj4X2Zv6Ao=;
        b=yJoWVKmSxw/UAjt/+0eJo4OHIdqeVg9PJoz/7UbOia43d8sWpynqx0dLi92Q3QMNhm
         yBGZNnvsKa7n57ljfFI39frLkVKa+SQVOr3Eyay3oJc7u5beZ8iCYFVuHvbLQlypjsDF
         qArS1EVXy3zGq4pGtlaY97+cVCEfBckGEOV24lxvwAsXTkYhonLTHXI1yGzqxdRP4w+W
         F4+hYVpget7v+YQqrysg6kbYYhat8eRbntEHD6PqYM4gSes0yKAl0Vnaa+pyds1HXg4v
         00KhpSTUZgTtmQbiRABM8EiOU+CiedHDhxkqQR1PB6CwUt835w6pT9wXXS6fVjhUpycE
         gpCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCZvhtzzVUDV1gTQQbmmWFh/Qd5A/WU4EgHO+Sak1axaxQeFI2eLjymE4sEXDNi0zDto0=@lists.linux.dev
X-Gm-Message-State: AFq9FYI2qPW50qvSP98J5c2Q+CspRGpwS15o1HMCapu8fiQjDFlQXa/m
	6un3fN+uk0rdTcY7yGp+GxbiSuSrSWLW9B1Ty9fWQp5ZLa1bOHmimrfV
X-Gm-Gg: AYBFou1QfbJFQ++WT7J92arAIFhpcukHQH8rMoOCeE7UuJhemMhoAUQMSsUD+F8LdnU
	bVoPUMh015oDdhw5Q+rnAhZ0hkRAVIJyVmNdfdTDCMTUIZruAzPfTJ2TYleeOLXIjp8X7xzkZrY
	7iaYR6MBdHTrTC4LCOolZAbVynBMCcHp8/VcWuPj+FXxo6eLgAGzxZ8a7uTO3H/Ufdit6P2h0Pr
	WXFW1qAEYjV99Rs4d5UkBGb9YFzybqUT2VuttQ8eKGDN+dZAJ4T4b/9l1c7lcBL757QxD1VZL9s
	AdnJ+LGEKWpLcAbs44GtVZ+eqsCd/JhDsH/RTeAovQ9jUMPSzfsHHsK6m4ymJ12R1mQxZe00Rzy
	x/xYguBDQ5EGvzMRkHlw42aRZCi6NZ4y6DPO8ZIaZS91lE3zQhYLG1FGSV4X38RTO5mfYGINoQK
	rT5estnmzGGO23ZwoO/t418aINnQa8m0IYSCwTTRWJ4qveYT09PCP1/YBvsTydr75jvj9qy3IWF
	mhuHJ2X/39ZRsBUVCkNAkcH8lFX5+DrpOaJ2D/j0ChQWdjDD7vDpkLbIYTmfpSB4uIgYlVFIR4+
	oCqNOz0DlNIP6Fg4+f3IhCTrQz2dqtDO+5vaABiOx0FpADWZaksrT5vz5KJWf84WXz/oEW9NS+R
	8T1/nJZ+T
X-Received: by 2002:a05:600c:5246:b0:4a2:14af:1ead with SMTP id 5b1f17b1804b1-4a9676d1514mr113081845e9.25.1793268408743;
        Thu, 29 Oct 2026 03:06:48 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:48 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:23 +0100
Subject: [PATCH 1/4] Input: rk805-pwrkey - enable the wakeup interrupt
 during system suspend
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
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=3230;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=3qBapWKlE9gnNc1OkRIJoQ7rj2z5kJO1plv4vMvRaIE=;
 b=Gax9ATA7YcEykEZRoU8HuTbsJxxf2tMvfTF8fzq4d1vXJVAPuOzgirPI7o+V26V3EhSkl5nP5
 acS+c8VRtbJBrDNorA6RDsnaahLsnJ730MdZY7glDerfZxdequzJfBG
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

The driver marks the device as wakeup capable, but never enables the
power key interrupt as a wakeup interrupt. As a consequence, the PMIC
interrupt line is masked during system suspend and the power key cannot
wake up the system, e.g. from suspend-to-ram on RK3588 with an RK806.

Enable the interrupt as wakeup interrupt in the suspend callback if the
device may wake up the system, and disable it again on resume.

This is done in the regular suspend phase on purpose, rather than with
dev_pm_set_wake_irq(), which arms the wakeup in the noirq phase: there,
enabling it updates the PMIC's interrupt registers through regmap-irq,
which fails when the PMIC is connected via SPI:

  spi_master spi2: Failed to power device: -13
  rk8xx-spi spi2.0: Failed to sync masks in 7a

Fixes: 5a35b85c2d92 ("Input: add power key driver for Rockchip RK805 PMIC")
---
 drivers/input/misc/rk805-pwrkey.c | 42 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/rk805-pwrkey.c b/drivers/input/misc/rk805-pwrkey.c
index 76873aa005b41..9b64ec7463c62 100644
--- a/drivers/input/misc/rk805-pwrkey.c
+++ b/drivers/input/misc/rk805-pwrkey.c
@@ -15,6 +15,10 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+struct rk805_pwrkey {
+	int irq;
+};
+
 static irqreturn_t pwrkey_fall_irq(int irq, void *_pwr)
 {
 	struct input_dev *pwr = _pwr;
@@ -37,10 +41,15 @@ static irqreturn_t pwrkey_rise_irq(int irq, void *_pwr)
 
 static int rk805_pwrkey_probe(struct platform_device *pdev)
 {
+	struct rk805_pwrkey *priv;
 	struct input_dev *pwr;
 	int fall_irq, rise_irq;
 	int err;
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
 	pwr = devm_input_allocate_device(&pdev->dev);
 	if (!pwr) {
 		dev_err(&pdev->dev, "Can't allocate power button\n");
@@ -84,16 +93,47 @@ static int rk805_pwrkey_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	platform_set_drvdata(pdev, pwr);
+	priv->irq = fall_irq;
+	platform_set_drvdata(pdev, priv);
 	device_init_wakeup(&pdev->dev, true);
 
 	return 0;
 }
 
+/*
+ * Arm the wakeup in the regular suspend phase rather than with
+ * dev_pm_set_wake_irq(), which does it in the noirq phase: enabling the
+ * wakeup updates the PMIC's interrupt registers, which is no longer
+ * possible once the bus to the PMIC (e.g. SPI on RK806) is suspended.
+ */
+static int rk805_pwrkey_suspend(struct device *dev)
+{
+	struct rk805_pwrkey *priv = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(priv->irq);
+
+	return 0;
+}
+
+static int rk805_pwrkey_resume(struct device *dev)
+{
+	struct rk805_pwrkey *priv = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(priv->irq);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rk805_pwrkey_pm_ops, rk805_pwrkey_suspend,
+				rk805_pwrkey_resume);
+
 static struct platform_driver rk805_pwrkey_driver = {
 	.probe	= rk805_pwrkey_probe,
 	.driver	= {
 		.name = "rk805-pwrkey",
+		.pm = pm_sleep_ptr(&rk805_pwrkey_pm_ops),
 	},
 };
 module_platform_driver(rk805_pwrkey_driver);

-- 
2.47.3

