Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908881;
	b=mbfpYU40oqY1hhIF1BDhjU5NrKaMuA3JOs6vNiXEEug5aMujxoZTd92OOwXeGDY1peZ5
	 0tU9FHYDUHUCFQWIbMAYRPIEdcu32vsL9KP/YrwURRSlt7/1yHpGXYkHHgsqIhyWQ4w/Y
	 TudmpMKrWTyk9hJgJbV6/qDDJkuChl8PSdSdzn7+xq9R1i1QBlQ+X/RBORIDO+yb3h75L
	 /6V+TcNvfgNLqo2YqaxTD6hXG5UigFI7sKiQ1b2wcEtG8p1X7n4PgnMtwuQKSsyTU4a5r
	 ja5+NLif7niNj3XF6Oh9qwx21wFpaPkgJY/OekXdGrm0sMPNNCNHFvSi2W6RdPSEb4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908881;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+AsUTeuDtoqWFfTi16/5lRvZw+5Sfn1TyWGKEkc3fRc=;
	b=Oh0U7gmiDcbSQfQzL898BjECA2coHNP8Q0badlMNKUikGTLgf8ziY0kltUPgIKF3lhzj
	 nWOS6dab4TITJn0jKpTQH0wrKn+DP4GPqYchC08Wbxt6irzroO3QIPMSc7laz56CK7zw4
	 7pMxw3c6dshZoxQraiNmn6u6/BIpnBaoTE5hypow7FWyxqQq7AR2YWRXuwZ4Gms3ZSQNv
	 P8mq4xJm3m/zhXYSUXe8VsGRPz7OY5G7p86nECZHnlTg6mAA2KRMBj1ChJzYNrQhHhP4v
	 O60KNJNVMt62m01rCDZRl1ND5/Y1dA5XfIw/54ET1SuJAhA/TSb10wtHrzD1xpK3FCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ptIgS0jc;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5948460A262C
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 09:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5948460A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ptIgS0jc
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F560C4EDB9
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 09:48:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F36D85FC81;
	Tue, 17 Nov 2026 09:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0ECB211BC0C04;
	Tue, 17 Nov 2026 10:47:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908879; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+AsUTeuDtoqWFfTi16/5lRvZw+5Sfn1TyWGKEkc3fRc=;
	b=ptIgS0jcmqIyGSMWrcy5rS3wdqOa40UL7QImnlMt41o5yVXtB+OmcmM6f+VvJbnX6nf7H2
	UB74E1aV+tmZaw8niSi/pyOUYBpXqpNS/jjSH/fr5jh5S7xsDyWfwMc8XPpy0IqbHNFuey
	RY1SvvZCvdByzCa+gzSq4iGhQTA/SKo50dIW7D/k2isc4TkzTtfuOA3HNx5t2+Wu4X1zNM
	8d4EzSiPwimg1t2i4fo82zTkxx3JtWSyDJX3uhdrk3qYVPATcOHzglJlCWgbeUuBw8Y1Ua
	Yg7xneWITZ1R17SWj2XVXuRP17k6ZrGafh0V+936w6DdXYavZAXNyDB2DQmuLg==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 17 Nov 2026 10:47:46 +0100
Subject: [PATCH v6 06/10] mfd: cgbc: Use PLATFORM_DEVID_AUTO for child
 device registration
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
Message-Id: <20261117-cgbc-i2c-storage-devices-support-v6-6-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Since parameters are now passed to the i2c-cgbc driver via platform
data, the I2C driver no longer depends on the platform device ID to probe
the correct I2C buses. Drop the hardcoded cell ID in favor of
PLATFORM_DEVID_AUTO.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 6c1fbff323e6..dbd6a7539d8e 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -71,13 +71,11 @@ static const struct mfd_cell cgbc_devs[] = {
 	MFD_CELL_NAME("cgbc-hwmon"),
 	{
 		.name = "cgbc-i2c",
-		.id = 1,
 		.platform_data = &cgbc_i2c_i2c0_pdata,
 		.pdata_size = sizeof(cgbc_i2c_i2c0_pdata),
 	},
 	{
 		.name = "cgbc-i2c",
-		.id = 2,
 		.platform_data = &cgbc_i2c_ddc0_pdata,
 		.pdata_size = sizeof(cgbc_i2c_ddc0_pdata),
 	},
@@ -350,8 +348,8 @@ static int cgbc_init_device(struct cgbc_device_data *cgbc)
 	if (ret)
 		goto release_session;
 
-	ret = mfd_add_devices(cgbc->dev, -1, cgbc_devs, ARRAY_SIZE(cgbc_devs),
-			      NULL, 0, NULL);
+	ret = mfd_add_devices(cgbc->dev, PLATFORM_DEVID_AUTO, cgbc_devs,
+			      ARRAY_SIZE(cgbc_devs), NULL, 0, NULL);
 	if (ret)
 		goto release_session;
 

-- 
2.53.0

