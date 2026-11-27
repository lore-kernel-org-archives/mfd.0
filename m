Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802317;
	b=1lxeH2/iQWivmOgjF7wqyFuJsL3CUZu/CDZgZ/xmVtF05GS/m2R/gNd8XpSzk/tVtnTQ
	 C57H1V9GX4KGcPDeZUnCUDH9TxTj2wKYoZAmd7FzeWuLai3WcYNvBCu5k1GPI05lXg/k6
	 8JB1XYXaW5fhIBnQl/MF4KY8L/MzRGZXuN0aiHXy3+x+0nLUH8JBnzbwQXL/XvbwS/FXL
	 /B5mlN20ylL7PF63OJWupdU3QvW4NAfsxtIa/Q8IjsEOdxmRYfcbjTrv1ecANR1FCSYLN
	 udqOEAkO9gkAVUs2YED82eFdutADtWQjcidE6ow34K4N5stsiUluYVhq83647zUg8LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802317;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+AsUTeuDtoqWFfTi16/5lRvZw+5Sfn1TyWGKEkc3fRc=;
	b=YXLFiZxxwY+SZs3lY4EjBEooF8pL8DrkOe/FVWr+WckaxcvfBzfnDQIVcviES+/HvmgZ
	 o1jGG2KBX2qPhDDHMVQJiBgJrXOvLEI6Y48HbX/y8cwVbXG4pBQvv5x7TXCBygFrZXKck
	 hd6aLlwcHcuC0NeBWOlS0+aFyD/unMHVjx8vOsm6xNQTqT0VXFNBvTnccn0OrJp5jwzOq
	 1rueZStiAG7HGfgCKwMEheYQLod+MaETP2TjN6/MHBJru52IlFHlskKDd8+hjVBXhg8iA
	 GZBccqce8oknk8jRqoL2LZqwoECHRvo0M6VRROFzcOZKuPbL3mjslalVWgZOwE6chVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BeqXkpqX;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A18606A333
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 17:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A18606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BeqXkpqX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7BAB14E417CB;
	Fri, 27 Nov 2026 17:58:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49AF56049C;
	Fri, 27 Nov 2026 17:58:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0D8B104395A8;
	Fri, 27 Nov 2026 18:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795802313; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+AsUTeuDtoqWFfTi16/5lRvZw+5Sfn1TyWGKEkc3fRc=;
	b=BeqXkpqXEGtyk2kFpN97HQ4lafiuUdXgLnybTU3tf0bGYGh0DD0N0dbzR2P7tXZ3NWBaKx
	0gbRs/FBPDb2E6GSYIVvQ6WYDAw0D38nIeeGVlHuSmdxuksjIKUdIxv28TDZpG64enkWIU
	VfFKSGu5nXUsNkUwDY4mAL5rnuMrGn3HuVbrvRD4A28epyL5PxnEZwUjvftOzyA1hRx0D1
	uQWn+R142P4jaA9OXd2DBbYiJ5m57zXfigDpE+/jrBS5FWnwzvydwFcTwfNfBSIxsgtzXu
	lp7PcBJ9Q2xlk00wdreHWOH2drxn4ePZyuY8PhxQgpHjKL8zoIvaaI8qFrXIaw==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Fri, 27 Nov 2026 18:57:50 +0100
Subject: [PATCH v7 06/11] mfd: cgbc: Use PLATFORM_DEVID_AUTO for child
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
Message-Id: <20261127-cgbc-i2c-storage-devices-support-v7-6-d0e70fc57879@bootlin.com>
References: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
In-Reply-To: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
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

