Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802314;
	b=2+E8O68B52zgNfE0xuPRXB2CRmNEBpT0534+hwoPZvSJMgIi77G5/lueF5AdP6qxvBF8
	 vEfRjk5LhwG/W28HaZ4WqbKjuwHojlc1rCmUkHjWosT1JhUA8KayQBu+L5VjP1WgAOjm6
	 daWLzp0ozXLGFxxK0TmacYfhur0zmq0j66JDaUW0HoawCkkVfg431U3SfoC/UxUw6Q0YG
	 dFs3kkhUL6r+FXRHNTI+b5BslqskG9keOYgicGBMdc9Fnw9IO2HHHi2eJO8BlmLlGJrE2
	 rqdg5wrq+wQF7wF6FtmCoCSdTFrWbo334hDusgC6RQ8QQ+bOp+7ZNdz5BTjbSCj4HDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802314;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=AT8jCkieV89SScQUsNrXmDOXu9xAfYk+SvljhVm6qhE=;
	b=zqW28tyBHjOdcblKqTo+p0jgMM5irAmtNWOnCLMsgtJtuzoyVKaIF+3wFFVSQ16ku84Q
	 I4xVVmzBOPX/auMzq4JeAQA9VW0EFI68iGlF3O1d3lW7NHY+FRwKm0ar2h63yUG/ZLv0x
	 53n26L8cGH+GMqarqWYRBcHZDyj3Bw1fsnSg6VCLAFivngvOtyrRpJvAXf5m9FXGJ90Kf
	 2eDY1tTAX2dEBCzq4kRqwuaOXPtm3dmVks7kv/xYn/qaaVkmCXZyBOEA0dCkhbFXER0xC
	 9ZE7pLKCaPCYYex51ADtx4gTOXT6jtgA9K0CLwYV9oxwkfAQEe7e9q+SYp4NCt+oaFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wWrcyjPK;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80F606A31E
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 17:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB80F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wWrcyjPK
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C91D4E417C9;
	Fri, 27 Nov 2026 17:58:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39F1A6049C;
	Fri, 27 Nov 2026 17:58:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7EE610439571;
	Fri, 27 Nov 2026 18:58:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795802307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AT8jCkieV89SScQUsNrXmDOXu9xAfYk+SvljhVm6qhE=;
	b=wWrcyjPK0wSAi8FQ1LR/zhfFW47DPAi8dY6c7Y8azFdm80yGRuXiwdo0PiK+GlrVzowtQC
	1tvcVV/Q+9m8zoeqtp70sPjZthmMwiH6ssSMo0qsIETnYzqe6BVMEBn0ClrT2FPWdFIrq2
	cAjgNl7f1lfU59VH7kwkLsrSu6D0WZ5jpIC8+2JDZcmxWQ8JUlGWpkXNe+k47a0w0c1ZXA
	TmG5XA85eVOoqbAnITPnfueZCJcSxKfz+nQegD6WA+dtRSrjDDAruU+9IrBH/XKm2t0BjE
	otJthC0ewycgOuvZSmtvzz97MMW60CC5oo3GK3uY3TZbNPdpw+6g44ELaRum0Q==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Fri, 27 Nov 2026 18:57:48 +0100
Subject: [PATCH v7 04/11] mfd: cgbc: Add I2C platform data
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
Message-Id: <20261127-cgbc-i2c-storage-devices-support-v7-4-d0e70fc57879@bootlin.com>
References: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
In-Reply-To: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Define I2C platform data for each I2C bus in the cgbc MFD driver. Platform
data passes per-bus parameters to the I2C driver, rather than being defined
inside the i2c-cgbc driver itself. This makes the i2c-cgbc driver more
generic.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c  | 38 +++++++++++++++++++++++++++++---------
 include/linux/mfd/cgbc.h | 10 ++++++++++
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 1d5c99a38e85..6c1fbff323e6 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -55,6 +55,35 @@
 
 static struct platform_device *cgbc_pdev;
 
+static const struct cgbc_i2c_platform_data cgbc_i2c_i2c0_pdata = {
+	.name = "cgbc-i2c0",
+	.cgbc_bus_id = 0,
+};
+
+static const struct cgbc_i2c_platform_data cgbc_i2c_ddc0_pdata = {
+	.name  = "cgbc-ddc0",
+	.cgbc_bus_id = 4,
+};
+
+static const struct mfd_cell cgbc_devs[] = {
+	MFD_CELL_NAME("cgbc-backlight"),
+	MFD_CELL_NAME("cgbc-gpio"),
+	MFD_CELL_NAME("cgbc-hwmon"),
+	{
+		.name = "cgbc-i2c",
+		.id = 1,
+		.platform_data = &cgbc_i2c_i2c0_pdata,
+		.pdata_size = sizeof(cgbc_i2c_i2c0_pdata),
+	},
+	{
+		.name = "cgbc-i2c",
+		.id = 2,
+		.platform_data = &cgbc_i2c_ddc0_pdata,
+		.pdata_size = sizeof(cgbc_i2c_ddc0_pdata),
+	},
+	MFD_CELL_NAME("cgbc-wdt"),
+};
+
 /* Wait the Board Controller is ready to receive some session commands */
 static int cgbc_wait_device(struct cgbc_device_data *cgbc)
 {
@@ -236,15 +265,6 @@ int cgbc_command(struct cgbc_device_data *cgbc, void *cmd, unsigned int cmd_size
 }
 EXPORT_SYMBOL_GPL(cgbc_command);
 
-static const struct mfd_cell cgbc_devs[] = {
-	{ .name = "cgbc-wdt"	},
-	{ .name = "cgbc-gpio"	},
-	{ .name = "cgbc-i2c", .id = 1 },
-	{ .name = "cgbc-i2c", .id = 2 },
-	{ .name = "cgbc-hwmon"	},
-	{ .name = "cgbc-backlight" },
-};
-
 static int cgbc_map(struct cgbc_device_data *cgbc)
 {
 	struct device *dev = cgbc->dev;
diff --git a/include/linux/mfd/cgbc.h b/include/linux/mfd/cgbc.h
index 91f501e76c8f..4b6e41b9ca4a 100644
--- a/include/linux/mfd/cgbc.h
+++ b/include/linux/mfd/cgbc.h
@@ -41,4 +41,14 @@ struct cgbc_device_data {
 int cgbc_command(struct cgbc_device_data *cgbc, void *cmd, unsigned int cmd_size,
 		 void *data, unsigned int data_size, u8 *status);
 
+/**
+ * struct cgbc_i2c_platform_data - Platform data of the CGBC I2C driver
+ * @name:		I2C adapter name
+ * @cgbc_bus_id:	I2C bus ID (from Board Controller point of view)
+ */
+struct cgbc_i2c_platform_data {
+	const char *name;
+	int cgbc_bus_id;
+};
+
 #endif /*_LINUX_MFD_CGBC_H_*/

-- 
2.53.0

