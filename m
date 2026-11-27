Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751655;
	b=48MsMHqlG6ZSsJcCUYQkSyfQi4CHpN5lLstRqc9aQ1UrpxJzlLNs87gCVIb+6Qrv1dsq
	 addpnPBlXNJF8UxrwoNT3wD16THVh7BVfC/2GWZdSYVaX8aU+V9e3XP44c0mOSaSYmjvt
	 9SYjm862/nbDr1VLv0g8wY5OqptITlmNH8aQ38FbOwkqF1czYaSrogRR1OsqpCDZgDdwW
	 Lvzqt+2H1A3ChvUMRv7aaUJ2Z2aAdApbpiXDHoOJWm+AF1Y63dd6Q8eYue2YKO8J0QH4r
	 gTbzpvrapgCuafRJmBUky2rsd+ckZLOB7fDgSAralgliyr1nMOQa0x1n/MgjXkO9IiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=h57xKWPZLHJFhTxzl2lAvcXdhuofMfYff0yEHztw+1E=;
	b=IUuQrQEpp1ago0wRbBiamzGHKqZGfOJNjSplvhKL1/CeNlgNVeWeFhcT029NBctDTdOs
	 v8qEcpKkbBR7LnoHGBDiSoVLZd+zMLyvWi9zTN11NVjm3yau3PwpIOkXyIQuejBJyMpMJ
	 RoQm9E+iTZtAnGCVfsCzWCvCj3Ily2bcZFjv1qZZ9XUoj6u5WwA6HolEDnai8fmtviGTF
	 3lF/j4zC8H94OsZvtYg2PLCivvpq+h6tVK1zcOin6Mt9iUiSixCwv3CrH4HOBbFLdgqZT
	 H0v2ftFC6lXo8lrzOJgqnFrJyhFli+yznvC96G7ZQ4aUt6HUqrWT1TFIj5H6GE/oasQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b="GTii/UHe";
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3792606A31C
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 03:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3792606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=GTii/UHe
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jbKKd2N9dz5B0rf;
	Fri, 27 Nov 2026 11:54:13 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795751653;
	bh=cNBGwkketYspE+jWRam0Vr2wuKlEtIsb97EhF/rYdaU=;
	h=Date:From:To:Cc:Subject;
	b=GTii/UHeoN1DvgpsveXby0kw/kckUnZkQQYdcM9ehIoFXepeXnm9ODkqAJAFAHgK3
	 u38NiynHTcmS1ZWIWyITQ0W/NlhEsVcQD3L62DZsqxaFVpmPPuLWKbMD7ysnyW3qHG
	 RJrsgYHkLgFt6YalWR/sxAIzjET9zaSO/K8mOCJimV0fqi1j1QEhUPng2mSz9GtObU
	 ADeiflXMBxOeQTwbZBjyxf7hzrX8PLypllMWACUnV6m7KcM2Rlyx0FFBWOwNohKkdy
	 NMoRMyOCac0AAjNIDkaTfalc2vjZymcX2gI99d72DiKIZ4tEDNn+Qe/NHJuViLBWmC
	 +HGH0Bbna/NnA==
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6AR3s1Nd061799;
	Fri, 27 Nov 2026 11:54:01 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 27 Nov 2026 11:54:02 +0800 (CST)
X-Zmail-TransId: 2afa6b08feda8dc-b8248
X-Mailer: Zmail v1.0
Message-ID: <20261127115402117TMtE2xcPXch0CpM9te7-L@zte.com.cn>
Date: Fri, 27 Nov 2026 11:54:02 +0800 (CST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tharvey@gateworks.com>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHY0XSBtZmQ6IGdhdGV3b3Jrcy1nc2M6IFByb3BhZ2F0ZSBJMkMgcmVhZCBlcnJvcnM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AR3s1Nd061799
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 27 Nov 2026 11:54:13 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6B08FEE5.000/4jbKKd2N9dz5B0rf

gsc_read() retries the SMBus read, but reports success and returns the
low byte of a negative errno if it ultimately fails. The MFD probe can
record an incorrect firmware version or CRC, and the hwmon driver can
convert the error byte into a sensor reading.

Return the error from gsc_read() before writing the output value. Have
gsc_probe() check the version and both CRC reads and return the original
error before registering the IRQ and child devices.

Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Changes in v4:
- Return the underlying errno from all three firmware reads.

Previous version: https://lore.kernel.org/all/202611091914028089L4I88l9WGcWziY8r3qZb@zte.com.cn/

Build-tested on Linux-next next-20261118 with GCC 13.3.0 for x86_64.

 drivers/mfd/gateworks-gsc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index c034d54354f4..f3d44b775b5e 100644
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -62,7 +62,10 @@ int gsc_read(void *context, unsigned int reg, unsigned int *val)
 		if (ret != -EAGAIN && ret != -EIO)
 			break;
 	}
-	*val = ret & 0xff;
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
 
 	return 0;
 }
@@ -215,13 +218,19 @@ static int gsc_probe(struct i2c_client *client)
 	if (IS_ERR(gsc->regmap))
 		return PTR_ERR(gsc->regmap);
 
-	if (regmap_read(gsc->regmap, GSC_FW_VER, &reg))
-		return -EIO;
+	ret = regmap_read(gsc->regmap, GSC_FW_VER, &reg);
+	if (ret)
+		return ret;
 	gsc->fwver = reg;
 
-	regmap_read(gsc->regmap, GSC_FW_CRC, &reg);
+	ret = regmap_read(gsc->regmap, GSC_FW_CRC, &reg);
+	if (ret)
+		return ret;
 	gsc->fwcrc = reg;
-	regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg);
+
+	ret = regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg);
+	if (ret)
+		return ret;
 	gsc->fwcrc |= reg << 8;
 
 	gsc->i2c_hwmon = devm_i2c_new_dummy_device(dev, client->adapter,

base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
-- 
2.43.0
