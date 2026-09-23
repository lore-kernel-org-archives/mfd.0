Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CE73264DD
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 02:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790129982; cv=none; b=BEO0I/pkbqnhmkvFHxHu01d63a9jlL3SxHHyYSjMcakJteJE69lg8iH7n6CDMWuwxFfboTJLYx/FvttY69MkNApGcvRpnr7GSKoCFcuJAfjeNfdMqhGiDa3IrAKikA7k4O+j6KutjEJQ8cjPdQGX1VGOLXzBMUP5otV6g/TYKN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790129982; c=relaxed/simple;
	bh=yeoozMOBAPscK9CJul77EhmZLidRkoePYC/PeZy9YR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r/ZQamE9WSk5vgQFtuNKc8FKjtiXYJU7Ffwr48lL4NMPC67tH2e9XIqdsFX3qVkodSeyuCWfbw/mlAxwhUu6ZUuK9/fpulT7ljTMtgPoDZ//yAkieSR1nCHs8+ZbTXsDt+Y45vIc8PObDeY3YFDLAudjgOzeByEfRtuvqWn2HM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7yvBjrY; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7yvBjrY"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb766bfd8so4637631cf.3
        for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 19:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790129979; x=1790734779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=caXTtPj1dEs62sQQ1E9/TMQFbqUzSaglq9nrKjxoqck=;
        b=K7yvBjrY2rqJIPoa1/YUtRXVvaqyyZssLJTleO6tJg6Tletq7G3uF6lMQGalt1zLCG
         Gc63OYQuQ1ejesJ8t0F5F/3/XFMqJSx50aEsmEB9IoU+2QAbrDtiqK3+mEua2iD71U9F
         uFxB1Htg+MIv47oi/O8I78qthA/mBzrGB/k23HqG9RizerJZOSrsX/gfHyQd8m3lhIe/
         flG2aCRn5/FF5gWL4EmCPXBeACVyc4j/+djC9NZK/F1/88AzEryqkjqGOLktO8+w832x
         mhcExem5T4/PKR/58ubw3DrBeAw/U9vXOy32oO/dDv12mPPEJECdQe9eTfCpOgmDs3O1
         m/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790129979; x=1790734779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=caXTtPj1dEs62sQQ1E9/TMQFbqUzSaglq9nrKjxoqck=;
        b=wgNqwcqVURCcWLcplWvyPWaJgB4OjWZ2HUSXRwpb2lvFxfnhaSgZQjK3iMAcJRuqhY
         vg/s943YREqveuqCNCEQr9Wrauz218Ql7ILq6ZUiRK9zxZBb0cJYPw1OMQacIewsFeV0
         tq5dRrqedz9hjoQ55tOIOqcIsH6IgqLRzwMro/RnEkuB3UjdMefnSJWBuoGkv5FbXfJP
         jOXtJIN1OTKdHVreV3u99KpdjU/C/dW1naN9yvmeLD1DulxcKJNChxjbAeI/YpffQjWu
         bML24qQbFD3JmgWMrxC4doNO1AHs/oO280oLFDJK5AbjYzW0k34V4WaCATr59VJrJvQq
         b/pQ==
X-Forwarded-Encrypted: i=1; AKwUvByHQwveKLv+VpbHbkeT904jf5JdXm8CutcfmQT0n1Nj3F/g/TlL5ffW3DkH8o5ZBX6iMjk=@lists.linux.dev
X-Gm-Message-State: AFuF++lpAwG78VQIj6o4RzmCTXNxaDBbVIrh4X6A6l27t+jG9uj3MsXY
	Z5B4k6aBIPIq+Oh9MNhBqHQ4YcmrZcEYW8NUvHu+Y9DE0Y6JCXeab8A=
X-Gm-Gg: AYBFou1FdPLA3aLQVa65H/mLNRcJhqUKdQ1PPW54wD7RqzvYexsr+yJ2I5kPx6sXRs9
	p/4vyIlh85Ck82tBVzdYrNYR3+CzS9HZhvfzcjGSIOd/FhOl6QrkQxN2PDtWBPyUVXj1C5nyckc
	xZ3N94+QIao8smQvGt14cQdr8V/j3XBqeTztH7anM2wCHhalbVaPUGJyfNa5z9zYR8cxdKeNU7D
	3/g0W3UMdddrcWlQ1p/2XaDp7psMmtOG6UOMQnDksn1SD1koAhtFmsLHlQASwwn7iJ05pWejFkz
	jW3Bnd3yV6y+MzlIT6rIhd+UQpAKJE7g9OBpusacSwuKr90elCSMTqChV8+fezf4YVXKdQqX25O
	EWsJkZRtmLUZxGLyCuniIHBavBSHNPkAjcWh/9/vsXpkusG8yVMiUre+4l66vSmU4mp3NdX/bHa
	ZAfltUV0OHhxyogkGUqgGHU9mNB2CAeZVzzHjv3gUZ7iP9knyzhnbLl1aNPJvYTaebShzO8hVPC
	nvi/+XuL6SP4y9g4hY6Pk9XvhL5ECE0EBDgAdfbJnQkwG84TteMuYB0thwSZBfhEbuGZBAEsWsH
	zNpPhUcyqpOzLt01+J93ejt8mh/E
X-Received: by 2002:a05:622a:406:b0:531:190c:85d8 with SMTP id d75a77b69052e-532eac9ea80mr21968421cf.43.1790129979398;
        Tue, 22 Sep 2026 19:19:39 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c440a66sm10919026d6.29.2026.09.22.19.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:19:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] mfd: da9150: Balance IRQ wake on teardown
Date: Tue, 22 Sep 2026 22:19:36 -0400
Message-ID: <20260923021936.957065-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: b8fce55c09d3 ("mfd: Add support for DA9150 combined charger & fuel-gauge device")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Record enable_irq_wake() success in one assignment. (Lee Jones)
- Keep the irq_wake_enabled checks. disable_irq_wake() after a failed
  enable warns about an unbalanced wake disable.

 drivers/mfd/da9150-core.c       | 8 ++++++--
 include/linux/mfd/da9150/core.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 5c59cc869fb3e2a6ac5aaea7426f38241cb92cb1..19325d72a27e7e12aa8acb121b5bc115305b4231 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -450,7 +450,7 @@ static int da9150_probe(struct i2c_client *client)
 
 	da9150->irq_base = regmap_irq_chip_get_base(da9150->regmap_irq_data);
 
-	enable_irq_wake(da9150->irq);
+	da9150->irq_wake_enabled = !enable_irq_wake(da9150->irq);
 
 	ret = mfd_add_devices(da9150->dev, -1, da9150_devs,
 			      ARRAY_SIZE(da9150_devs), NULL,
@@ -463,6 +463,8 @@ static int da9150_probe(struct i2c_client *client)
 	return 0;
 
 mfd_fail:
+	if (da9150->irq_wake_enabled)
+		disable_irq_wake(da9150->irq);
 	regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
 regmap_irq_fail:
 	i2c_unregister_device(da9150->core_qif);
@@ -474,8 +476,10 @@ static void da9150_remove(struct i2c_client *client)
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
index d116d5f3ef561288756477e7170400b47d65e180..369698036d1aa5d1722f6459946f38abfc8cf350 100644
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

base-commit: df2908090cda368b01ff43709f51890076c56157
