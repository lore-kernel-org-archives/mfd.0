Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724572;
	b=fryT8fOItw/Oei+Wb4KsoZevwEgEubUahg1ZzmerYDHykVyF1ugTW7k3YnG4jk6MimVU
	 wBC9jdyxg8zJnXDZc7/fiH9bpLFkkgnXmnSxonflCEz7AIwH01MyHC1IUhefpel8zrJND
	 7MrbQZAcoT7wV1T8Zjo8Hgn7rRTGpsmWrI2a0VSl/4BLlW+2tjcWjAEETw0OFIczqjGjr
	 H+6Q6ZvqnIN3g4xP2oVn62scxHmbMdTVUS4b14rK488W4ZMEd1isiG1YuilD91gNfmonP
	 3eK0wPomVAugsErO7qX1q9lniMhyyfXZrt106r/lZchTZOCxmQIkg71J+0aQHYqYNmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724572;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=ENJkHkCfpFwdQvw3umeRws6G85S/Qq8yf5a8h/OQL8U=;
	b=ZZYPJe8xFiYwI/bK7P1eEb+LiX0aA62UBHzBJhLnkSnuh2Jg6sjJ4xA/glP45MeNGw0j
	 beGEIDGnDdqUe8U9TfxCSzwTxP0fxNwS1qRsmpWBgrAZdEldjDaWF0ae2DxvbhJ+0qrLK
	 dkQLIoiP6N994tWu0qZ3khsvpMuakKXIcIg//zZ0JOp+gZjMBeW/vk5W/5qVK9CfZvGqK
	 vjkr7JfeZF9sfYnjOmaWZR8biL8NWgNzpMAqD33xmfSAdjYj4uWfH/rm8RiWfEVsl03WW
	 8V1fgzk36aNYDzN2MPvCUUZukGLRUYezECRMXq2QyjaMBWy+Np8GbYCrDKwTgBV1yIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NcSfNv4c;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D0606D805
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 16:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03D0606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NcSfNv4c
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E9774E413E7;
	Tue,  3 Nov 2026 16:49:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 340506046C;
	Tue,  3 Nov 2026 16:49:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FF1010329123;
	Tue,  3 Nov 2026 17:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793724568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ENJkHkCfpFwdQvw3umeRws6G85S/Qq8yf5a8h/OQL8U=;
	b=NcSfNv4cNiP0umd6rQiY6FaHSP0DxqMF7EEpB9VLEmr6kTGBIrSZ9AoedIN8oqrV27VcTi
	CMAt4qLCh3FcXjDT6UP+JwWIj82J5+2KA1IeZ3b88GUsVguJE+JPDFGDOmS/ePqq69Ck7Q
	91LB1BdHYRKc/4CsA8Ut42N3Kor4v1HK0PMG6CC+dJa+/5Ob8unqMZ4/ymgmxQjYaocTaB
	a2LhIbcgOTL8ICw+ZCk+RRobpYcHAgDJsKJkVUCg+9PfE4HFnFzRRWVFB+eOimfEdAu0ey
	5eEdcjpETgiSeFy6vzc/3uLKXfr1PLI7b5KNDrOSvZNtvWeFLf3gpgRb8LYuVg==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 03 Nov 2026 17:49:09 +0100
Subject: [PATCH v5 1/9] mfd: cgbc: Fix use of negative error code as valid
 session handle
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
Message-Id: <20261103-cgbc-i2c-storage-devices-support-v5-1-ac11f23fae51@bootlin.com>
References: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
In-Reply-To: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The cgbc_session_command() return value was directly cast to u8 and used
as session handle without error checking. Casting a negative error to u8
produces a valid-looking session handle. So check if return value is
positive before to cast and use it.

Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260713-cgbc-core-fix-cgbc-remove-v1-1-79274ad62b3a%40bootlin.com?part=1
Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 3460c50047ea..02a8c0078287 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -103,7 +103,12 @@ static int cgbc_session_request(struct cgbc_device_data *cgbc)
 	if (ret)
 		return dev_err_probe(cgbc->dev, ret, "device not found or not ready\n");
 
-	cgbc->session = cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
+	ret = cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
+	if (ret < 0)
+		return dev_err_probe(cgbc->dev, ret,
+				     "failed to start a session with the Board Controller\n");
+
+	cgbc->session = ret;
 
 	/* The Board Controller sent us a wrong session handle, we cannot communicate with it */
 	if (cgbc->session < CGBC_SESSION_VALID_MIN || cgbc->session > CGBC_SESSION_VALID_MAX)

-- 
2.53.0

