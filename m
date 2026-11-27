Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802318;
	b=dbB8PZOmIOli0PH8cf4dIQgT9dm1Fqr/IhTQbYpRYDzfM6Gu/5cAndeIrf1v2JBbwgbd
	 NquX2RTwKY4AQRkltCIkhL1mUiYz34Cr6ZTk7ZM+K1dF3D0WdS/MoPwrq2uTvXXJtwxxN
	 Wr/bUuP4DrapSyyLCT04oQAFF74JXc1K7RC11ddF8GxCABWue81e04WTEQh7YR2VwiFl5
	 zFEa5Y3mQhcs3MmPd14yCCEP3SyvxXAiyZ6/QfDjY3fcjF+qtXUbR+OolTExKFSDJCLnz
	 oeLD+catXwlgIFILPeYLYHMW2h6HFFbuapOVF4d826vTIGTpT8hCF/RJ/J4W8UIdPJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802318;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=cqykWOtScnn2p0ZVOutyoQbXZ/i7/ANOa2dg8wfH+fw=;
	b=mq2mPNnbmX8NODWCOkxsdyLiBKucetjHaMq11mHW/lFwTUWnCk8Nume8GS3eV0S0ZBWd
	 vyYVZg57Spu3txmsiusIeKfzrZ0juBML0AldRLwsT647o5lXXNWQpli6c976HLn9Xg2hs
	 kKZbZHyuHi6SNG5x0gLIEUDob+UXxNnbfHmktysbX26HRNLQhs4uzxi0DWpA86EtwMMyD
	 qEL74dbA6z99BpT42fte2TURlnnCiJRDYA08k36KMWEddMXRnT3mPnYiz4EDUKpgj54ZN
	 +QhXpf1C7f6sFhd8ueptsWcrinMqRdki4wUFQHW3b/PFk2ELNmlT48Mg8SNRKiHk46A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=u+wNYVs3;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D07606A31C
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 17:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91D07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=u+wNYVs3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2874C4E417CD;
	Fri, 27 Nov 2026 17:58:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAAF86049C;
	Fri, 27 Nov 2026 17:58:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9165104395A9;
	Fri, 27 Nov 2026 18:58:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795802315; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cqykWOtScnn2p0ZVOutyoQbXZ/i7/ANOa2dg8wfH+fw=;
	b=u+wNYVs3VFfkWZo1bu9fhu1LazRu5kfc21TnbXIf+yONFDbvsd7bYFSSab8h9aLK8dPJXj
	7FgTgJB8v3xb7rHoIeaegyLm8C036TrgtWsXwQd+m8QyjH41gKVZCIhAaIOLyesSKbssDU
	EdSJBzH0s//zKndf9MnFfr7ud7ztySj+qqiM0aCV2Od9D1C7AJVZXoec9SGJiVX0ZoEB78
	K5XrKu5tjCedv7QyUKqqUd59NcChNOz2OVCE7LPCiMw0Fz+uDoFTJ7dUboBrv8hIUZJPNe
	WR1OBgP+2pvhHyDV/7bgheeCbBi57Oy0l20QVWYGothMDzeWuincIlWoIOMn+g==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Fri, 27 Nov 2026 18:57:52 +0100
Subject: [PATCH v7 08/11] mfd: cgbc: Add virtual I2C bus support
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
Message-Id: <20261127-cgbc-i2c-storage-devices-support-v7-8-d0e70fc57879@bootlin.com>
References: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
In-Reply-To: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Internally the Board Controller has a virtual I2C bus with some virtual
storage devices (EEPROM and RAM). So add a new I2C cell for this I2C
virtual bus.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index dbd6a7539d8e..db22674affbd 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -65,6 +65,12 @@ static const struct cgbc_i2c_platform_data cgbc_i2c_ddc0_pdata = {
 	.cgbc_bus_id = 4,
 };
 
+static const struct cgbc_i2c_platform_data cgbc_i2c_i2cv_pdata = {
+	.name  = "cgbc-i2cv",
+	.cgbc_bus_id = 3,
+	.fixed_freq = true,
+};
+
 static const struct mfd_cell cgbc_devs[] = {
 	MFD_CELL_NAME("cgbc-backlight"),
 	MFD_CELL_NAME("cgbc-gpio"),
@@ -79,6 +85,11 @@ static const struct mfd_cell cgbc_devs[] = {
 		.platform_data = &cgbc_i2c_ddc0_pdata,
 		.pdata_size = sizeof(cgbc_i2c_ddc0_pdata),
 	},
+	{
+		.name = "cgbc-i2c",
+		.platform_data = &cgbc_i2c_i2cv_pdata,
+		.pdata_size = sizeof(cgbc_i2c_i2cv_pdata),
+	},
 	MFD_CELL_NAME("cgbc-wdt"),
 };
 

-- 
2.53.0

