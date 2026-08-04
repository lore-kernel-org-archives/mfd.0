Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF1246C4B0
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785855386; cv=none; b=W/D0X2wTk6ZtAq6IpyAzOZklUjvVD3dfUexS+uV0is6LDA9UsI2SS+7AiWq4MjBGnGi9Vjcv/KyX/npb3aDIJrbUq/3Yj879SUs+LfzDNNsQmsGD+bZIZ/tMPUn16+V8epSjkrwqs/SWhmeoL3TuCUNxPlFzb8xFtroSiTVxSEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785855386; c=relaxed/simple;
	bh=RmSrwG1F/7aFAs+HK0sePhP3Sxnni0CaFwzbwEbsY8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FSbsdxGkdeLZfMsOciHiBp/RMtlfOhpHXHlVGiLIOa5JQOQlo6NAuSSHw8LRWupy3MLWPaY+HqspxTEkFtyuai/WsaR0T0rgTb30qA2OUkL8FjHJDNj+IutzjVkR6WqRNrr9uBLH9S6ZHhAW0fzjyZ8qCfra6KOXxJZ81sAfH7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0cqLLQLw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0cqLLQLw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33E791A140A;
	Tue,  4 Aug 2026 14:56:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 060F46029E;
	Tue,  4 Aug 2026 14:56:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A151E11C32F24;
	Tue,  4 Aug 2026 16:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785855379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sKJTZ3340Wy50yFmZKeX4ClEQ3lKUgb8dpkNiuzSFvM=;
	b=0cqLLQLwDEvg9gnAs07pGYm6N9sU3ZDiMTf2M+f4TSdVvfvEXJeYVCewlvyUiLmUnZUlsz
	7Mc2mxLQK/9E20mb2AnA7hdtorR7YI9VVgzNzDecTb2UMBDFKDW8AOGljgSBOGhakQillE
	5QniHtghbIw50GAeS13+/r+wcEF9s7yOIxgfIkswvmjd4XRC5BQ7Runmz6TXd5ZoJPEoVu
	NAGpXWTwuHfzVzqUm+J0Crx3mQCiU3ipYfLr3cAZRIGfzg/nflDIbz0TCnwq6C1eCE54Ex
	7zdJfnISVpLLLEAD8PRhsuPjr/errUv+p4U6bV3l2xbfxmbVSitvZ4VbSnFFxw==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 04 Aug 2026 16:55:53 +0200
Subject: [PATCH 3/4] mfd: cgbc: Add virtual I2C bus support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-cgbc-i2c-storage-devices-support-v1-3-fed38510671c@bootlin.com>
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
In-Reply-To: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

Internally the Board Controller has a virtual I2C bus with some virtual
storage devices (EEPROM and RAM). So add a new I2C cell for this virtual
bus.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 4a409234e66c..81bd0a381ca1 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -240,6 +240,7 @@ static struct mfd_cell cgbc_devs[] = {
 	{ .name = "cgbc-gpio"	},
 	{ .name = "cgbc-i2c", .id = 1 },
 	{ .name = "cgbc-i2c", .id = 2 },
+	{ .name = "cgbc-i2c", .id = 3 },
 	{ .name = "cgbc-hwmon"	},
 	{ .name = "cgbc-backlight" },
 };

-- 
2.53.0

