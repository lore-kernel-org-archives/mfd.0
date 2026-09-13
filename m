Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAFE30D3EF
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 02:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789265671; cv=none; b=ciPW776l0YVXTyUSv5dXy5R+L8nfF8ST0vF2eoUKSj9iYWMfyKFs66sbnp8yhVJSfU1ACOmubYnAthMMiq7H9AWwbJ3oIpGyIo7cxwFiThMyVgK+nP9ECLQ10XAWi8jlNsvel/X65CaItftNTKHJvMa2rIV3r8goDKGbu1rk5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789265671; c=relaxed/simple;
	bh=MaAJoU6a7Qyxznv4vcbVvqn1Vtx1/3A0x/k0WpAIyt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gl6UPvslcdfH7Urcjo5k3EFDt5075+dgFgqompo0HxGG/pzLZB2gW2vK24BPjolKu4t+9Xkm3CkFYllEygiBCLVwY8Mq8ugogFQMUo4Cb0+EbJHs9Y4KfZJyGgaq5guRw95mV5dw2MgwJzcqitrrz4pjPK52lkFs9YMIA+cpdag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3vlUjfo; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3vlUjfo"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cc46c7so64273785a.3
        for <mfd@lists.linux.dev>; Sat, 12 Sep 2026 19:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789265669; x=1789870469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3En0YSc2ctcfWFz6P+MWPu/wu8wKVRURedbkaqkB1rw=;
        b=e3vlUjfofi/1JrjsXRgHERUlaMgwb1P4r3m8/Gz9X3w+4+EY30/4CoFtWSQugljUFe
         JCklKd6qQTy0Zh7iyYUPsscFDcEGgD9Uyfjp2fzNXFcOuqhBuLqZphA9iJYbO183tg/z
         OKeDmi6Us8rZ1gJ3EWp27fdSDMxowlb5D8Vi1+BXWBoGsP79/pkSXEJIsc9pzfDLPqkE
         U1i6/3xK0mnwlBzRcMBa76mzTZ8cFp676zxXq9uZQaJSfyWjoLX9IYpbqrso4mEHigLi
         LsrigP5TH1hH8rsT/zrBWh64xL18QoJJeTls6bL/mjAIeQMGWtV7Sh/zFI2gVPE8ZbNs
         4J5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789265669; x=1789870469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3En0YSc2ctcfWFz6P+MWPu/wu8wKVRURedbkaqkB1rw=;
        b=kHsBo4rJxHLriTnJvN0FMGNon1OgjtK3eRt9XNISepARACVvsvmizxP003AOe1swaK
         7UoZWDB1gnSmsEYiQ67ZnhfPcIBrtOlWUNwXOtcjw7plzVhvZK1HD/AME6X56vxfrpz0
         HPR8wVq6r0zklqmn/1jpKHSZEFXRkhkJEZb/2HUh8bbULO355smna0AA+nIIl7A4zvrm
         UBbejSoWT6yQjndXYZaDZz5ZcYl2Z/m3Z2AE38wK17VAQJKDuJQGN9uFWyD0gKGAQUUx
         g8TbdsxzvOIixkwP1tLay+K/JBYaCQbsDJBYs3s0b1/mtfvQyWv2d5QJ0v2llLDTKzv1
         FwiQ==
X-Gm-Message-State: AFuF++mS4zJHgiqZ6GpaUMAbsqeA4VEO5/iHGMGnlxGp5cgsEyYz+poZ
	66hLCU3qmW+PrTrYecYvBC2rVBAvbufrD3I60OSGv4G8R/dVurGhakM=
X-Gm-Gg: AYBFou2SnESLclnZW54SDCt3UVD2AfTUK7oMvc+V3YwgdEIR051HYGpEQ8eQbop7dAl
	ZZvi2FjviqxWh/ZFQt3IH60bx6CcWl0IBS8j7kMIfsNDjaT6gg3o7Kru1DgUuW1SHFsznw1ydqo
	HNy/szjoqre+2GUXtQ6opvIiUXNFNRbDQZ4dFmDqNHF2XTsMOoeNrlEVb1FTS+pILjDjyvsfuvN
	7avGCGfxIajBL4WNHi0ElZ08fWqY/ozBcYM8HRU0JvPbA02FS7eXOVZSzS39LmB1cVGCKiJIrPU
	LCBFFZoYHHg+HNcGmp+7kcE7/pspXo1QUqhn0x67vHh85Wa42wuYnrkKc7znYanfP16jIcTDyEW
	CmmzrcTRY5lt8W80XI82oZkYKPEnouqFZcXi169oWnGqT0UVvFa9rXX/CrT+r/8GpzfOH4zCvs8
	kEJOR85u8/VYMewZq1C3QEVmTs63srK9fxWMzwIRXAJ5IMgVP2KGi17Vo+bRdwX+ebA4zGAy6bY
	z+lYNjFjQED1mMqSSYncz1aBhbAZCqUK9B3ExrScewduWlEcMvRPWVGIB7pWwjpmSq8wLkwU9y8
	6HHg1JT0Ocv5ymLLJEZIOpJHzuDIQ/arxis3X0Yb1irr
X-Received: by 2002:a05:620a:288a:b0:939:ede4:a499 with SMTP id af79cd13be357-93a035f328dmr773950285a.5.1789265668929;
        Sat, 12 Sep 2026 19:14:28 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939f1dd527asm512943485a.16.2026.09.12.19.14.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 19:14:28 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] mfd: da9150: balance IRQ wake on teardown
Date: Sat, 12 Sep 2026 22:14:20 -0400
Message-ID: <20260913021420.60344-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DA9150 enables IRQ wake after registering its regmap IRQ chip, but does not
disable it on a later probe failure or driver removal. This leaves the wake
depth elevated after the handler is removed, and repeated bind attempts can
accumulate the imbalance.

Remember whether enabling IRQ wake succeeded and balance only a successful
call. Remove MFD children first so their nested IRQ users are gone, then
disable wake before removing the regmap IRQ chip. Preserve the existing
non-fatal behavior when IRQ wake cannot be enabled.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: b8fce55c09d3 ("mfd: Add support for DA9150 combined charger & fuel-gauge device")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/mfd/da9150-core.c       | 9 +++++++--
 include/linux/mfd/da9150/core.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 5c59cc869fb3e..d91d419fea663 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -450,7 +450,8 @@ static int da9150_probe(struct i2c_client *client)
 
 	da9150->irq_base = regmap_irq_chip_get_base(da9150->regmap_irq_data);
 
-	enable_irq_wake(da9150->irq);
+	if (!enable_irq_wake(da9150->irq))
+		da9150->irq_wake_enabled = true;
 
 	ret = mfd_add_devices(da9150->dev, -1, da9150_devs,
 			      ARRAY_SIZE(da9150_devs), NULL,
@@ -463,6 +464,8 @@ static int da9150_probe(struct i2c_client *client)
 	return 0;
 
 mfd_fail:
+	if (da9150->irq_wake_enabled)
+		disable_irq_wake(da9150->irq);
 	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 regmap_irq_fail:
 	i2c_unregister_device(da9150->core_qif);
@@ -474,8 +477,10 @@ static void da9150_remove(struct i2c_client *client)
 {
 	struct da9150 *da9150 = i2c_get_clientdata(client);
 
-	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 	mfd_remove_devices(da9150->dev);
+	if (da9150->irq_wake_enabled)
+		disable_irq_wake(da9150->irq);
+	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 	i2c_unregister_device(da9150->core_qif);
 }
 
diff --git a/include/linux/mfd/da9150/core.h b/include/linux/mfd/da9150/core.h
index d116d5f3ef561..369698036d1aa 100644
--- a/include/linux/mfd/da9150/core.h
+++ b/include/linux/mfd/da9150/core.h
@@ -65,6 +65,7 @@ struct da9150 {
 	struct regmap_irq_chip_data *regmap_irq_data;
 	int irq;
 	int irq_base;
+	bool irq_wake_enabled;
 };
 
 /* Device I/O - Query Interface for FG and standard register access */
-- 
2.47.1

