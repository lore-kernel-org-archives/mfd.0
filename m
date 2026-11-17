Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908886;
	b=VTQoBd0j020+K7ep6GCsib3c7Tpbm+PJZyuvJ9V97BJxjhyHGRv7lHXh9k0y2ClcaZpR
	 PpyL9B1Fk05TRbSe7FnG26DFrJToawHsmTaHkltoZRmUXSwq5U1U1VKdNm/5x/8Zo2CXl
	 GYuaCfm1q35MiE2SMIlDODcJ6qKu+YNktGXZX13vPyhZmNTT437knSrKh/SxyW/J7zYyU
	 cJwp+Fbk6obuN/uSJLtcZifMPmJmxFspjONNDGqqGlpwjTJsWu6FBNisZmzGhImfKqVcN
	 qd059A2zX38FAPhRm9YwRrhjBawws9dpQtjU/VBw+ztixixANR2OC1QG/+TLzI7Gggg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908886;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=RlVbir1e9PHS2ziu2NVnoqOT7r+Itp0ONcO+u7lofsM=;
	b=OitglQKVOlvh2UhXd6AjiNRI380t5bcQPeQjJhbUhlaqZGVDEswch+9ecYFPueMROngT
	 ZFwtu7Oc8wOadl+kdB2mLWdL6zto6vPMW675m83TS63GH+H+qejO+byzweSBMJtJ249I4
	 yZbcOnsNxCJ5kGtyr/m7LZqNH78eQN30mNUi1NvzBc0W9MNr9fUkY118lumkF6ROlzYYM
	 36xRq4ZeliLJhPoImv/mpSAM8C9bzzG5HrVZlIrWVe8NUdlVTUqbvYmQSFAK6kpS2eaau
	 1jCX5ynOEk2hjk6qIaXnzRmuZkuuylNGJKqy4Wbm1tr0wdyK6Te3a9TwFDlM41mvvGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IYxaGgir;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD0160A383F
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 09:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DD0160A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IYxaGgir
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 72A511A158C;
	Tue, 17 Nov 2026 09:48:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FE5B5FC81;
	Tue, 17 Nov 2026 09:48:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD4E411BC09A1;
	Tue, 17 Nov 2026 10:48:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908883; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RlVbir1e9PHS2ziu2NVnoqOT7r+Itp0ONcO+u7lofsM=;
	b=IYxaGgirwY53iWU/07WrWo2TsgaDCVpM2ualKG/ah742IG7aiVl52/sPIgI86Q4CjxZCxJ
	FIosQwfCo0/qJS83ZoQEPOeK1ObazW28+5qYoBDrhi67HqRWLWBoAJH7+Wq49TEVjPyYPI
	5aOWRCD/CaRA6EPG/bGpOKEkx9+11173Yq68RcYgyQUz8XnAO1enQbfGPYCaz9UJLPfTC6
	Fnm6xXJZ6OCnNJoM1mCpAb+fJwz3JP/izVHWM0CZ6PGpM/+58zWx2ltD6WJlmCYt+eYIZw
	IpxUn97LqoVpErJ1dlzV8MmNrfF1qnQ1oHU6SHBaLdbyYYWzTtWQF24ICirZDg==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 17 Nov 2026 10:47:50 +0100
Subject: [PATCH v6 10/10] i2c: cgbc: Register known I2C devices on the bus
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
Message-Id: <20261117-cgbc-i2c-storage-devices-support-v6-10-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
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
 drivers/i2c/busses/i2c-cgbc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
index c523ffdc22f2..13ec160ad092 100644
--- a/drivers/i2c/busses/i2c-cgbc.c
+++ b/drivers/i2c/busses/i2c-cgbc.c
@@ -356,7 +356,7 @@ static int cgbc_i2c_probe(struct platform_device *pdev)
 	struct cgbc_device_data *cgbc = dev_get_drvdata(dev->parent);
 	struct cgbc_i2c_platform_data *pdata;
 	struct cgbc_i2c_data *i2c;
-	int ret;
+	int ret, i;
 
 	i2c = devm_kzalloc_obj(dev, *i2c);
 	if (!i2c)
@@ -385,7 +385,15 @@ static int cgbc_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(i2c->dev, ret, "Failed to get I2C bus frequency");
 
-	return i2c_add_numbered_adapter(&i2c->adap);
+	ret = i2c_add_numbered_adapter(&i2c->adap);
+	if (ret)
+		return ret;
+
+	/* Add known devices to the bus */
+	for (i = 0; i < pdata->nb_devices; i++)
+		i2c_new_client_device(&i2c->adap, pdata->devices + i);
+
+	return 0;
 }
 
 static void cgbc_i2c_remove(struct platform_device *pdev)

-- 
2.53.0

