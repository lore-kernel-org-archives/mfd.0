Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500731;
	b=G0+rDEMmHgGl1VBE6Kvz1ag+PtAqubZWt5BijbrU9sF47ZZGsjHLysU7JqguDvn0hsQr
	 9vYVq4O06DhYf13hhUH9bMEhFRecC5IzrcwgbupVKoyN7F0ibkHKKdS6AoEUYy9Z4udge
	 K4+jUDA84bg64/yihvXeL2SjL7Z5zk4vmiGIsPR/CXOycId7417Hh/ifPWC0NWb7aY2V5
	 QEWSJcWBB2/j50Kj9F1ncBL3J74aPnuUBo20AHQsi1Bxqb1nr7QgSeDiX8VtMG/26OmK/
	 MnLcdtXVZp+spy69BgFOldS3tZ0Yxmi/sQxeZWeNu+q9bvPD+vb2e8ZVNihlthCgdCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=mWyKPl3fYTX21Xcks1P19Wig3EEm3zJMXAWb3yv9l3A=;
	b=EoCD5Tugk8jRoS31c42Kpo7jgPGcOsdCSM0ST+xf0xQpzRg5eY31e7OTe1VigSY73dcQ
	 Trvci+dpEbONKTrIC9H53aB6IOeVc8O9mCHr/ZSffdD0KtEaYqZb8vS8Au9dOLP22HD4C
	 HXV/JIbYsZtB5vud8TkR7B/mMfHI9BOvJjfHIYqjEbaubnT9pQYdH/WzjRAqSH65wZ27s
	 mhEtFJEo7+CuxdDvYQnW/U8V4w/9+eJjXyA69/o6qVMOX0TlvJBlcX/v25HwGgshNZvUF
	 YgvdOUcuqAHeIinyC24ELtA+13QZ84q7aintwBA0L7bfexULtcvDw/qDEn+q5zhjHAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O2hP0RYx;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F2606A31E
	for <mfd@lists.linux.dev>; Tue, 24 Nov 2026 06:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 963F2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O2hP0RYx
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c506a231b88so574101466b.3
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 22:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795500729; x=1796105529; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mWyKPl3fYTX21Xcks1P19Wig3EEm3zJMXAWb3yv9l3A=;
        b=O2hP0RYx2zlVnAtyLTzef43r9QY9iRxlh63rzeI8s7WDl7zAxUW8lU/it5fQ3BkxaT
         eia+uUL47zq6C6LJxVO9lPgAWJA/PbL8sPzNqBScp0SXbQdNGRFz/aYi8xpomAKsupg0
         M1c1ycY/BvISc+IsjPpjenEd2W6k31CSV8wY3aEeTgc5d6vXkn/BhP2Hd7Iob5MAVpZ/
         Pw/6UchdtjI2MfmR/D//UkBPyaarbEd+VzBOCrFjI3gukp6XyrIvIr0RRNrnJbM4wRJf
         ObO5eu2uDzdmPxj7RRTGMdmLRkskO2O+0vqhY2V6HkM2fdJUStem0jelEAM4Kd7ePK2G
         J+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500729; x=1796105529;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mWyKPl3fYTX21Xcks1P19Wig3EEm3zJMXAWb3yv9l3A=;
        b=lxrPUyH7wU9lP6SXQQsaw5CMMpsBvcFMilIhaJTglr62I7/F6tqd3/JqDkuGYGE2M6
         SAMKQejnVQ0ZofNjDnDND3i8C0KdnvNlqMhJJbJ+16MS0qscP7Gev5sx3W+ZvAwzd+c6
         xGxk8mizZ/zOnZ17jOQmgpgKRGW8UrSvwfmas/+4cE2cIFrjPXJIywKleFpZzFuY2TxU
         dsSFtMioExuvllIWWl7sLhKDq0HHbCe0KZfrVRbHX0b4Uo5DDETiOJGt0COlV/YnGp1H
         9pBDalbo7rDwbOlCvPARbzatOS/4s52INZYRjCCGu1Tv+wpvyZA1ONAHG1DXxQ6k38aO
         Tz4A==
X-Forwarded-Encrypted: i=1; AL+hErH9LbaM3Qmf7JzYJ97llWwDH7HWUr4LpkOyIojlSEf3MCGn2cd57IhXhZhkmXi+q7IzX70=@lists.linux.dev
X-Gm-Message-State: APuU4Z8VU9jA2GXuTy/u824CZ5dTlEIRn7ZUx+hNoTy78fgrKGZ1Owfh
	wxTqDjnlEdARokc0BvtoHajRVJ7WIopUNtQ+n832ayW4Aqo1exAOhglWxdSmi19JbWE=
X-Gm-Gg: AZFdTZdwoZY7rYTFHu3b8PENQv6huDwJDRDAncWMYM3NK4PBbvPe1Fi4UhkOdp2VQSJ
	3xkwUzwTHDhlvWyzYXzANwGMU/G8k1zFyLINBL05YM5ZLAXdPH4441IKl60bLjc91YEJbIoIIm2
	cHjPbkO1vGl+NTC9GlGHdRfmdtat4RxPqcDO2DVHUv+B5Wyxj9pCm7k7SQw94+rGWGhEb59lge7
	9qGbsLBj1tb4SLZYov19yfFsByxJmlplgvPM927u0naNHDsKdEO/IHeREHLm/g9FYep7gvrBaLv
	+IibcuJ+pavMx0QK8MYq8Lg2awybkLsWDsEFgswKDDH5kVJLn9+XokTPAPujONPifQ1fXkvtRA4
	0SnSDaSEJNAFWzBumDbsqgd29e2FUPDo0xtSVGUSidCSdzVfPwMx42LAtWgwF+VMx/QTlnS/sOq
	RloXacYwqRfBIHCk2JZSwiXOqCPtt8zY8cw6H299Vm52jVqZyp4G3if7yOWRCEO0dHFVDwNKL2h
	DAXIy/bOB3HAu90yuhND9SpSI4EdIjWiO3ADZXXyIMG6QWXvCZ1Nr6FX8cbTM0XJGgG+fGuVk2A
	VOU1vXhN4aVTIQsMn+dlxf+eLGBl0AizS47OmcuLrVSt3HCLObPrIp83pVAVgPHWGlxsvF9zbf/
	4LPO6IvhDm6ulKJWXow==
X-Received: by 2002:a17:907:c08:b0:c46:88ef:2e46 with SMTP id a640c23a62f3a-c513a433bf6mr1210066666b.1.1795500729052;
        Mon, 23 Nov 2026 22:12:09 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm464681866b.65.2026.11.23.22.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:12:08 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 24 Nov 2026 06:12:06 +0000
Subject: [PATCH v2] mfd: max77759: Set zero DMA mask
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261124-max77759-dma-mask-v2-1-19a5db3c7a28@linaro.org>
X-B4-Tracking: v=1; b=H4sIALUqBWsC/33NQQ6DIBQE0KuYvy6NHwW0q96jcUEV9KcVGmiIj
 eHupR6gyzfJzOwQTSAT4VLtEEyiSN4V8FMF46LdbBhNxcBrLhF5w1a9KaVEz6ZVF8QHk6JFde8
 katFA6b2CsbQdm7eheKH49uFzXCT8pf/WEjJk0oqxmwTv69Zen+R08GcfZhhyzl9Bl0qMswAAA
 A==
X-Change-ID: 20261123-max77759-dma-mask-65417b861a53
To: Lee Jones <lee@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

During probe of the DT-backed MFD child devices,
platform_dma_configure() calls of_dma_configure() with force_dma=true.
Since the parent I2C client device leaves dma_mask as NULL, both
DT-backed children trigger warnings in the kernel log:

    platform max77759-gpio.0.auto: DMA mask not set
    platform max77759-nvmem.2.auto: DMA mask not set

MAX77759 and its child devices only communicate via I2C/regmap and do
not perform DMA themselves (any I2C DMA uses the host controller
device). Clear coherent_dma_mask and point dma_mask at it before
registering the MFD children, so mfd_add_device() propagates a non-NULL
zero DMA mask to all sub-devices.

Fixes: bb71e40db1b7 ("mfd: max77759: Add Maxim MAX77759 core driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- capitalize commit subject
- Link to v1: https://lore.kernel.org/r/20261123-max77759-dma-mask-v1-1-6f5c8d52904f@linaro.org
---
 drivers/mfd/max77759.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
index 5818ee2811d1..e31af2c0d25a 100644
--- a/drivers/mfd/max77759.c
+++ b/drivers/mfd/max77759.c
@@ -693,6 +693,9 @@ static int max77759_probe(struct i2c_client *client)
 				     "failed to add IRQ chip '%s'\n",
 				     max77759_pmic_irq_chip.name);
 
+	client->dev.coherent_dma_mask = 0;
+	client->dev.dma_mask = &client->dev.coherent_dma_mask;
+
 	ret = max77759_add_chained_maxq(client, max77759, irq_chip_data_pmic);
 	if (ret)
 		return ret;

---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261123-max77759-dma-mask-65417b861a53

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

