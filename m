Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942C349CCF
	for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546760; cv=none; b=rhcf4PLCqsOkUMhp6L4+7QBEaLwTRZ3YHltlpjgm5ryyl1wVK3cFMq9r9/HSJhW9LR3bvKnbfAhnGckMHGIzPaJUXr0XCJScgoszvByfJd99YBh50aEkk70vg7yuA2/LYn6AnUydnmP1n+eFru13uXjzWWUfcBEzKDBEKIvpYsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546760; c=relaxed/simple;
	bh=MK/EvtItOpT/zgPL5nusrcrvyqvBtj5dEqAmbXtdchU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bG6yWtEUgnJsesweTMdfuC1TlUK4HleqJtWlLhD2RNpJPzpOPw2Q2oabB9YiR+3wgSe0kW2VUNVJNVW0dpH+kMqq43277rkYOdGra8uf0t0iIT8Clzt9MIMEJwYXw62aCmzxy2aUXSBGVmEAZORPujLp9DpGwp++fPu4ApEjrpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=z2o14kCG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="z2o14kCG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381216921aaso9679353a91.1
        for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 04:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1784546755; x=1785151555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/f8DL2vIooznsDdQVfwxZs99v9VD407+Uz6ZGQECJlg=;
        b=z2o14kCGLf9ZIDmE+bL1WTFBOGS+t6fqbTvE4pDrpjZ20ZBXoiRSVBv4LXKvJkChhq
         JmaiDSKmoPV06ZHR1VCRUIslYYbqFMqUamBaEluFRhX6Y4/ZtCmCfQfQudXh5+8VihBg
         dLWA30ugN3cm6RMqGu5a7qspTI544XSSg2gctDSdup0zOEUcWQjuz3Jq+fm2Eac/+F5p
         zosbek4Xor4lYDdy6NMxdBS7/OFueUKu7bXU5vcjQCZsImfDcfVz71vwOPOxjCtbR7iq
         AYuLzYVje1PPcOKP9NsELgY8ybXPYCCgyI96/FwbkOEP1Rp8ghgjJ0pEymQH/JK5iP3v
         KUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546755; x=1785151555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/f8DL2vIooznsDdQVfwxZs99v9VD407+Uz6ZGQECJlg=;
        b=b9hGcisaujCwQjY65mxzZ+sGY5nE3VUd647KkKzeeKHUNyezDhDFADaT3WMsHit7xj
         ZL7mGaJQS/qBDYKGvFLXZRsYdxMWXLxXsC8o8eQhugPkiX0LzWoxfO8aCgOM017tyaJY
         UZvA2kIPzDyShWhSlhJ5QNT7g35KwHtj7Yr2u00Jfp5hZ7eDk7K6mKd+JpXkXIrlYXMH
         x725zpRj4z8YMDBLodlG9qrqcmak1haEPmU/tiQWt2dOtKmi9A0wZC3ile8EiEp+W/TJ
         GihzGkQXXZ5O5hunfMG0HOvFAgVC3FcNffntnQmpB+S8PqQ3Mr3+/WHfEjblopi0EcFg
         CEAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgRWtdQ2hZw6Gbpo3FCgRL7xVIGcYCseG+TgjtfXbtca5KZqjH2Jm66PLAgWWYnNYCz4o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCoY5KIhPreli2gflIZNSHoVPtoKTIGy92Xnh3ryJ7nTShh+Oh
	0XN0jPVaTE/JLzVzqi8PFHd1C6wp7AaQ2EGQMct/gt+5nget+DDtmvwgUKPC3kcyBrs=
X-Gm-Gg: AR+sD12Kw5Hd5ooFRMGlO0HvM+QRyWPLrrwij+hXH8Kie8Jl7o5kZTn4c8VQ6z6cSFa
	3FzMg5nd/7zpW0ugnE2jiITa7LfFcLBJ6QVeM7AHUZ253ktV/EC0c2BQ0+lLdZYzMbMWgYRC2oV
	T2aMXCdz5tBYBikhJl1Jx1Ig8LGm77Bgk02nFR9uS4q1WgaXgtobAe4xXzSqANEtbseJBpyRzc1
	M8vJ8j3Nfogz9DKl9OHicgSjHAyMe3fnG2xQAKO8Nt1KzxsjwLK1XCiXFjOnwJQQxB2kL35Nj+5
	VxiAuH/hRNt4ruijY5fYZzoyOvqqKlP81B1V3olNfE1yZslg/qu1mMn5vYlZANjBxkzIHmHqH00
	/qRE3XhS41Eaza9lMlROPaVpaI+PjhE2oN4q6fEfak9vTDmKINg9t7KpidD1OkZJ3ztlIkUOWWA
	atoEboe1QKQqsg/5X+B6UysODQS89gdAS+4EyRhNYIlf0BTwtrhy6PD3a4NSngocU/nFtrMFr3+
	KX55s2QNywbYr50Egac05H6qJXfSsay
X-Received: by 2002:a17:90b:4a08:b0:380:9157:d6c with SMTP id 98e67ed59e1d1-38e4b41043cmr15033493a91.10.1784546755329;
        Mon, 20 Jul 2026 04:25:55 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm30620268c88.15.2026.07.20.04.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:25:54 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: lee@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gustavo@embeddedor.com,
	stable@vger.kernel.org
Subject: [PATCH] mfd: sm501: Fix potential memory leak in sm501_register_gpio_i2c_instance()
Date: Mon, 20 Jul 2026 16:55:31 +0530
Message-ID: <20260720112533.70538-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocated for pdev in sm501_create_subdev() is not freed in
an error path in sm501_register_gpio_i2c_instance(). Fix that by
releasing the platform dev in the error path.

Fixes: ae7b8eda27b3 ("mfd: sm501: Fix potential NULL pointer dereference")
Cc: stable@vger.kernel.org
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/mfd/sm501.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index b5bda477ebfc..49c6b21a44e8 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1103,8 +1103,10 @@ static int sm501_register_gpio_i2c_instance(struct sm501_devdata *sm,
 	/* Create a gpiod lookup using gpiochip-local offsets */
 	lookup = devm_kzalloc(&pdev->dev, struct_size(lookup, table, 3),
 			      GFP_KERNEL);
-	if (!lookup)
+	if (!lookup) {
+		platform_device_put(pdev);
 		return -ENOMEM;
+	}
 
 	lookup->dev_id = "i2c-gpio";
 	lookup->table[0] = (struct gpiod_lookup)
-- 
2.43.0

