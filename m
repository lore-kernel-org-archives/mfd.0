Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724576;
	b=O8ydsPZawjvtv7ewLceSEEO1zacmp5qevpQebutqoy8fnWho36pdltWqNof0VN9uWOF3
	 1KLk+6e+z+ohGAChreXVSilLdkDkMOSml+nrmI6s9GmL47zMm3iGvXXXuuQ3e8CrHBYbL
	 ARokJosNvfvZSUA6Ee++Pr1tmuNZhzTYT932YPUoKbdFqelCAOibY8SKfroPZQhu3oryO
	 yCQEedU4ekN+XCq0ctMfnvT6JJnQe1VcJyW0ronR/gkGr+XIKpv2e5LIIC1pUZrjx9ZTr
	 +PrNh9qP1ZXx3k26K0kEUOhF690rsxySSKRSZeSyZWmGfOcqC2eyiOc76P9MJrpKa8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724576;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=RnwW8JdB5UARoPhC4AEKlAEss5f849c5oZKwccCMzBk=;
	b=jA3J9w+bh+DPsohY8Q0j0c+AGzI/C/YRw29eM4XMhomerM5PRFP67p53+vtXaYj0803O
	 LkznKfWSJ2lPplCf0x+pu/sc6cTYr3msXzhi8qYCOs5ffB1TmCK8SDKjJ7sP07Rsus2aB
	 UzdCARE3ltJei3PRQwh29BYUYN4s3/UH8sS3yWPM/SZ65L+n/4ZQ3KhMENVKNv0u7Zzjg
	 4yPkJjJrIkB/EZJxlTSzgRe1gcRaP0UuyOJkh5HWgXHFP9KChuBfoCDKbROfbY/doHy83
	 hiohFOpxG8RgK8d0bsUw9UDzPgSS6+52bj40h6CpYMnqTMe7qf4fXPCHIlLljVl9PXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JN+hHvHV;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340BF606EEA3
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 16:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 340BF606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JN+hHvHV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E7F761A143C;
	Tue,  3 Nov 2026 16:49:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B710B6046C;
	Tue,  3 Nov 2026 16:49:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A341103291A7;
	Tue,  3 Nov 2026 17:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793724574; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RnwW8JdB5UARoPhC4AEKlAEss5f849c5oZKwccCMzBk=;
	b=JN+hHvHV6NeIkR3aHisLPynZGqzNnHCsTUAotoMWobbtn4WsPQMM2j9K/07Ri19Pp/KdcU
	3cFQNNBy+T6GwnX78eBIazG+MGHFVAUzgLQxIH2VjfEFNqxDp+SHDHRcq4ScalSfLKiGTo
	EFnX7IG6i0M5LSWrQHRaSByngx0i+GGjpKRqbu3+2jSdhkrSkkwOUsdp0xOhsE85/a8Woc
	zBZ4iTh0g0nV/L3AyMVNo9XWnSIK1m47KbpWapSz5K7800mgBhR9BEe11ZXmYrTc/sJiN3
	ydShOXZw2eUigtZQmB0CKIYdAItJ4qpBqecGUIIJbhUTIAwtj5eNBuViyEFqlg==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 03 Nov 2026 17:49:15 +0100
Subject: [PATCH v5 7/9] mfd: cgbc: Add virtual I2C bus support
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
Message-Id: <20261103-cgbc-i2c-storage-devices-support-v5-7-ac11f23fae51@bootlin.com>
References: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
In-Reply-To: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
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
index 7f512b4f07f7..e0d9939d8c0d 100644
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

