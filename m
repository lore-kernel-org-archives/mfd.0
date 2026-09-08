Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79E48E0F3
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895289; cv=none; b=GvuWteE9RwlS12lB4//1drGmAb6KdxFOGZy1xVqpTiWyfLFIx83j76ojb4it0sBwnQnA3bwez43CaHiaDS97Lmqh5Htjy1RT6Dtq/QYAI6sH0Cp35J/2QwI0Ogg9qnNehHMNURHNARshtmbZUpI6qhTv/gKg+SqIMPJ34yUfXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895289; c=relaxed/simple;
	bh=4EOC3wW3OamsK9JdLlJUqHEbH0Xlwq31V0h4ZN+fFs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fxPaaZJNoWhlrFakEdi26pFwHpyNXTnWOxztThfD9BTHZgrS4xpA/QyVQR1etmUpdyXRViMiKXIYrqyAwt6Q18M6fA+SyB9D/k1N8174Pc6xQUNQKIxAKHNePxUt10MskqgpnGnwe88K0DYmfV3oauU+H9NpiO0Cxo4YxMKswgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuoXb4Ov; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuoXb4Ov"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3731327a91.1
        for <mfd@lists.linux.dev>; Tue, 08 Sep 2026 12:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895280; x=1789500080; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QRL3dA3Rcc+XFjHN/uSduejfnR4cK/ww1jXye5/2bAo=;
        b=GuoXb4OvGMQetpm7Elzzb6S7rBVjEcVw8nHmmcJjrNj1m5z48cS6OZABpwDEjJaUz8
         KZDLaGX3gMZxQjOqI82urjOx2CMzKleemVVYelXuyjh206f0i2nqRSB5BdG2g/0GK2su
         i1k41TcDaNClaACU0sSgNXPqLgEAEP4Rudd+WelHhKith4iXWj7QkeLb5G6RVwrETtQd
         oXE4iF3bOeBZ4qpEux9yYObxbfNu50U1Y5yUtw8dwsMSw9a/dn/T2QeQM5eRNNu/J0lD
         Aq6uDDgMZHqRZmpaT4lhbvwU/++mydk0XUV66vziwG8WEgkoNFlYXBCpjRbZEpK+uxxT
         1t0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895280; x=1789500080;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QRL3dA3Rcc+XFjHN/uSduejfnR4cK/ww1jXye5/2bAo=;
        b=UjKtduJ4MTvTlYpZpo/HTn5bh3GQ2sWQYOmKB7VJYU9AZsQHhZv/Y7GHj93rb4OtWh
         9zuNWOEc94rtWJy9/RTFpk0EPDd4ktCmXRKTjhmw9zHmHxA+o6i/mzZPRKWI9TWkPHa/
         DJP693Ywu9YOdbcnCqjxGMB/IVKxKJdvAjJ+OPVALKMCdHsXXPkVAJ+yFtdstJCxTpCS
         61Vs6C3Bu1G2hdtm5/HrkzsuzHA8V1Za/CF4JtXtgBp8o5lhHCJzcdxLEC1Bz68Nz0ou
         aWJGaz3AM00z4J6nZDa4Q5DinAcoWVH/bqs4ganEGqSbSOkIIAuxvAPG8XGWcFYGnEf/
         Huuw==
X-Gm-Message-State: AFuF++makG7MCyBRnFuPPWiTHHD4z+xcRHy1TZpURPSNmqqoLKUtDIxc
	JnLCqlLtEJOZ1NQwcGlb+X9+/IJ6vGpdtRGME/yRF1wmEOw/PwhC7s25
X-Gm-Gg: AYBFou0USB1e3hX6EKOO7ZW+nVlKfWtib/0QUKQ33twqLgA2zn3p3C3xY2JHcjlj2xP
	uzja4ULIeeGZdSWRHUuORFlMf7IfM49iaj5O5oAXL1DzOdR1exkKvLNzvfUYFveczPkvt5cTPQA
	7U9zzNB8othRCi34Q48M/O6ECJgylH+JLJfcZ9EBKoNFtjpe+6A/x0k6pqV8T//wTq4FxwbBJKm
	XU+zQr2qq5x8pksfh+wJoxHI4wX/nvsyLsIsPamzbS7tYfbrbYMzd50WcI3qjIcMVZfAwgGGnRD
	b1vsTghyciuFxJDkcu/y8GIYJJ3rkVxEU1R6WF3hB69ywnceOY2l2BLcgRaAZ6mllqo0DTEsHFT
	lmMRyLLkNFVvhTsx+0dvkyZIdUcBkuoJqg+MNyi+ZhQpAKc7XoLZpRcAjU3Ay20Jb4EtqTmcbkC
	tYoOVgG3GkmVtc6Wo6dwIKlGJ5JBfkewdxnr/S4gJu4JBn0xmRiUKmhrPyhVLSyFPc+z1lkA==
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr43780160a91.1.1788895280501;
        Tue, 08 Sep 2026 12:21:20 -0700 (PDT)
Received: from [127.0.0.1] ([2601:1c2:e01:85f0:7a30:bd30:851c:db6a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm22280244a91.5.2026.09.08.12.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:21:19 -0700 (PDT)
From: Eric Anderson <ejona86@gmail.com>
Date: Tue, 08 Sep 2026 12:20:39 -0700
Subject: [PATCH] mfd: rk8xx: Register poweroff handler in atomic phase
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOw6EMAwA0asg1xspgBYRroK2IGCDKRIU8xXi7
 mShfMXMCYKBUaBKTgi4srB3EekngXZoXI+Ku2jIdFZoo0u14hG8UzIsc+c3p7SxOTVE9ksGYjU
 FJN6fY/17LYsdsZ3/G7iuG7YHi7VzAAAA
X-Change-ID: 20260908-veyron-shutdown-09b3faffb5f9
To: Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Eric Anderson <ejona86@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788895279; l=2014;
 i=ejona86@gmail.com; s=20260908; h=from:subject:message-id;
 bh=4EOC3wW3OamsK9JdLlJUqHEbH0Xlwq31V0h4ZN+fFs4=;
 b=FkumfeDmjPIZ+aWz2xwq2LP+5HBrHZM+CLurBl5Ry/sURLJWMXpanBX3OOeJt2BLTWAZXQPCx
 UhkOcz7NFjACLbtHD4RrcYgMhyh5oPfSWSiXsEsq9VM48w+ntHe6C2Q
X-Developer-Key: i=ejona86@gmail.com; a=ed25519;
 pk=2H3Lzec9LRMjV4nOTpsCkU4+6npwE5AujP1dyNqM4lE=

This fixes a regression from v6.1 to v6.6 where Google Veyron devices
(rk3288) would not power off after being shut down.

Prior to commit 4fec8a5a85c4 ("mfd: rk808: Convert to device managed
resources"), pm_power_off was called by legacy_pm_power_off() which
itself was registered using SYS_OFF_MODE_POWER_OFF. But in that commit
the registration of rk808_power_off() moved to
SYS_OFF_MODE_POWER_OFF_PREPARE. At the very least, the code should be
consistent between SYS_OFF_MODE_POWER_OFF and SYS_OFF_MODE_RESTART; both
should be *_PREPARE or both not.

It appears interrupt delivery is already shut down (but not disabled)
when SYS_OFF_MODE_POWER_OFF_PREPARE is triggered, so
regmap_update_bits() in rk808_power_off() does not complete
successfully. Registering rk808_power_off() as SYS_OFF_MODE_POWER_OFF
runs with interrupts disabled which causes polling I/O to be used
instead, and the device to power down.

Fixes: 4fec8a5a85c4 ("mfd: rk808: Convert to device managed resources")
Signed-off-by: Eric Anderson <ejona86@gmail.com>
Assisted-by: Gemini:gemini-3.5-flash
---
 drivers/mfd/rk8xx-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 3dcf6abfda74..21182df45d1b 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -875,7 +875,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (device_property_read_bool(dev, "system-power-controller") ||
 	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
 		ret = devm_register_sys_off_handler(dev,
-				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
+				    SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_HIGH,
 				    &rk808_power_off, rk808);
 		if (ret)
 			return dev_err_probe(dev, ret,

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260908-veyron-shutdown-09b3faffb5f9

Best regards,
--  
Eric Anderson <ejona86@gmail.com>

