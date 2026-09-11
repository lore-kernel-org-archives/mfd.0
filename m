Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B440860A
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 18:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152549; cv=none; b=Z/wuf1KAFpCA+aqlA4EoXHWRAx8ZaFA/ecYUkglMsWLHhjFBUmSjg6gxritutVgTG7kd7UZQKq7FWdrqCay59ayIHAmjMZwsSeqUU8sBNCL8uT4ca+IZz/5NV/kRimpmc7E0YMpLSGnbTONm7L72FXM1FqZB2alNbML6lS8tW8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152549; c=relaxed/simple;
	bh=yPKpAyMldxqpCT9O7miczpE28O/GeHwma9x0pTHhBqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcYlnF2aDRPFjld3xE98CDK6zwDDOKGKorDoZiRPej0FssNO88tjEomiUzTypsxyr6M3zxJWyzRqjlrzOaXBR4d2ZU22w0chSZ8VRo/6OwkVVw9Dk/fw/kAlUry7e/9XLYsCEw1gjERnVF05BdKl23ptnRY7VGyn98Gd7eBmGnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L6y/TV2r; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L6y/TV2r"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EA7CEC63441
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 18:49:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8536560735;
	Fri, 11 Sep 2026 18:49:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0210711C7A9DC;
	Fri, 11 Sep 2026 20:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789152541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NsrDGn7EOh4dNRz/sOT1dQVDqqvsvxFmaCzhKqKNUwc=;
	b=L6y/TV2rkXuvdyzIhSlbJri5+vyE5iAYoI05iMS+vM3L2yMPOYg6WLBQ4HsUN2CukaaYJg
	8OXhetoI2v6/iZ8pi0CluxMa+9gw2odDifw/OFSalwWsXObpRMmVYqIhMsfYuoXVW4rXaI
	pp96syhr1E9sGZnGcEpMAf0eAmlcgUuOjPxkP1Z057FhW90FtEDi5b8eZ9h/MUJ6C0zPUt
	IYmWLGwQkmD+oi0xBkLpsqTgwrJtE1Q7E5aOl25rGY9zsd6xsDyJfJu9zwx48qNg3x5Bf8
	1jJ55HfDjJCUko1z1hYx8ZTghhtlIKUbNIfyli7/j6FW/C7P9OjfoOJy3Uskpw==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Fri, 11 Sep 2026 20:48:09 +0200
Subject: [PATCH v3 7/9] mfd: cgbc: Add virtual I2C bus support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-cgbc-i2c-storage-devices-support-v3-7-594b53fbc5ea@bootlin.com>
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
In-Reply-To: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
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
index dff14cd98271..90fa0e657385 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -66,6 +66,12 @@ static const struct cgbc_i2c_platform_data cgbc_i2c_ddc0_pdata = {
 	.cgbc_bus_id = 4,
 };
 
+static const struct cgbc_i2c_platform_data cgbc_i2c_i2cv_pdata = {
+	.name  = "cgbc-i2cv",
+	.cgbc_bus_id = 3,
+	.fixed_freq = true,
+};
+
 static const struct mfd_cell cgbc_devs[] = {
 	{ .name = "cgbc-backlight" },
 	{ .name = "cgbc-gpio" },
@@ -80,6 +86,11 @@ static const struct mfd_cell cgbc_devs[] = {
 		.platform_data = &cgbc_i2c_ddc0_pdata,
 		.pdata_size = sizeof(cgbc_i2c_ddc0_pdata),
 	},
+	{
+		.name = "cgbc-i2c",
+		.platform_data = &cgbc_i2c_i2cv_pdata,
+		.pdata_size = sizeof(cgbc_i2c_i2cv_pdata),
+	},
 	{ .name = "cgbc-wdt" },
 };
 

-- 
2.53.0

