Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802320;
	b=1UD8yigiyaKdtfhRBfaLNxU5Fk/i5uLT7gqa16RsRvrfvxI1Db44KhPjUljrMw6qqh+p
	 CP7J/zR8QgSMPSd1noWQHaE+SuQlOq9K2m1oFOB9v5VssoH3u+vd7fDlHvD/XxVr53c/w
	 tCz4jqim2Aj08RRqkZithsGm2eEJmac3FODivbYybjvV77SFmOoJkwFmcQ2BEg7/aZ3h3
	 D9ygr7I8oegVkU/OrV2FhtwsH21e6U0OfWAsX3RHKq0J6XawMULsm5KB0NqNt5I1wlcrU
	 Dl3LBNdJZoOXYIi5QZfokXkbHL3fmiWxs/mBBWgRRDx8BceMg7H70Vr8emKPlptiXgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802320;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=gtvR9miBTva7s2ycJTQZotb4TSIDS9gAitRlfuCzzCk=;
	b=YEvKstyOiz54ydCUXD1tUlMa0x4Al+WcnaFFxW0XJf1hOjgB/ABXh7+uEml4gGoajk6j
	 Y34YsdJg9bW38PWBowQN8VYoNWRtIVEVyHGYZATnUr/SbG31x57o5y/JYet5VKBm+OONO
	 9AdXWwbuHD57mLvqDtn0VsGCFsd5UTLXNOjnoI5Q6vvxYLZvcwYCPm8U6JmiNrMmVqZrE
	 eislI7m2MtoRii0QT2VCOG0AxrqFkUhoXE7VfFy4UpkwiaOEa13Ymu8YI/aRqDivQ88MP
	 3OqEr3elBtxElPERryr7kN5JkCeCD7iwc3a4I6kY30fntib7xWgpZaRL0quqJHeTX2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IAcvTDOA;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB6606A693
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 17:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CB6606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IAcvTDOA
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E266CC2AC4E;
	Fri, 27 Nov 2026 17:58:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 154CD6049C;
	Fri, 27 Nov 2026 17:58:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8430310439571;
	Fri, 27 Nov 2026 18:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795802317; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gtvR9miBTva7s2ycJTQZotb4TSIDS9gAitRlfuCzzCk=;
	b=IAcvTDOAFMCruGuz5uK8WsbglsjlUlyTPW2ADYBx3+FWf0565p3blavqsTeewnElJzVpDj
	nI2IEN2F0m2a7wxsDAlOGivGPmrEx95Guek4XJpgsW5pXY6gwJ8QcmCPaiGK9p2R8MbaA2
	xeCRvgCIbaQS5yMYLI5RICOSOXrfEMjdrJ9PlBJ6ZuhWUgSfgL075r63cICrhhdU8rDkjA
	A1kjA1oS818IcD+Bj2VYamJTn+Z3wznMk/MT0qiONgxV3Vf7xQBgV/c726Fbv2RXV7mPKE
	PBkHfIzbWw7prrr8jZMG/MXRRQ//raV5KESFkui6l9RF6xhBx6zQgSjK9gu6oA==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Fri, 27 Nov 2026 18:57:54 +0100
Subject: [PATCH v7 10/11] i2c: cgbc: Register known I2C devices on the bus
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
Message-Id: <20261127-cgbc-i2c-storage-devices-support-v7-10-d0e70fc57879@bootlin.com>
References: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
In-Reply-To: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Register any I2C devices defined for the bus at probe time.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/i2c/busses/i2c-cgbc.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
index 85cbe709bcde..5105b920e919 100644
--- a/drivers/i2c/busses/i2c-cgbc.c
+++ b/drivers/i2c/busses/i2c-cgbc.c
@@ -364,7 +364,8 @@ static int cgbc_i2c_probe(struct platform_device *pdev)
 	struct cgbc_device_data *cgbc = dev_get_drvdata(dev->parent);
 	struct cgbc_i2c_platform_data *pdata;
 	struct cgbc_i2c_data *i2c;
-	int ret;
+	struct i2c_client *client;
+	int ret, i;
 
 	i2c = devm_kzalloc_obj(dev, *i2c);
 	if (!i2c)
@@ -393,7 +394,20 @@ static int cgbc_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(i2c->dev, ret, "Failed to get I2C bus frequency");
 
-	return i2c_add_numbered_adapter(&i2c->adap);
+	ret = i2c_add_numbered_adapter(&i2c->adap);
+	if (ret)
+		return ret;
+
+	/* Add known devices to the bus */
+	for (i = 0; i < pdata->nb_devices; i++) {
+		client = i2c_new_client_device(&i2c->adap, pdata->devices + i);
+		if (IS_ERR(client)) {
+			i2c_del_adapter(&i2c->adap);
+			return PTR_ERR(client);
+		}
+	}
+
+	return 0;
 }
 
 static void cgbc_i2c_remove(struct platform_device *pdev)

-- 
2.53.0

