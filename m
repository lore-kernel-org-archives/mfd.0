Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC66426D39
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509415; cv=none; b=f3TrxsQVv4jFadKX8LijRVWd9s0r+Fmz8wqoqltzQ9phV0sIBt4EbzPq5dsJVyTBTNPa3YuGm8JiF5/c9Uhglnx9KYSdlrObJhY29xMqjw+c19SJBKxbMw0sF0U2hHB2QY2OhhrlDXCEEyH1nfkjn6OxnWpaNXW1tgwDQlz0lMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509415; c=relaxed/simple;
	bh=y7f83ZY+gmTL8dJXkT7Oh4B6CFbmyiwfPpSWpfyjPp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTeExkTT959aORuzlM1932+FlEnoJf7bMfSoA17TudYUXh/KvOKmtOIclf2XEDNk5xJ94UUXjurBN06dHg/8nXVoisgAzWu7UKuqExycxCRhG45MMLQs70MVWubE0EYWyYJ0LaUq5jQAGNzN/7vmSiv2b5JmQPlUc4h+XqSOq+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j+oAW1Ce; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j+oAW1Ce"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c00f74baso3644795e9.0
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509409; x=1784114209; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GlJi+FC4zIqo5knAgHx8QAYTJa9mVgt2EW47vWH9pJc=;
        b=j+oAW1Ceqtk+hzP3TeZOzzArikvEbSycSDxqyPCgLQFYeRNU5T56y20urctCEey7w1
         mtY45/tSs8qz94grSJQ/mNFIZcSPRP6f4tXoHaUO1rXVLwMkzGHJkX2mbfJM2bGRWOQ4
         u+Pv8C9pTK1D5P6OIpCf+pb7OBIcNqurMGGQsl0sqGSm/3OX8Fzqf5VXvSwCg++N2rUJ
         z0tfi7TWdG0B2nSmGz3GUClGfQul2QHvFY7F/JW9nByYOnlqZpdC9r7/9V4wdrgwSv0o
         82FClQujofl8ZdJcCL9fJkizRrLr+YIf9CYcPyjgkvYcq7u+o3HzJXk5JDXt8d0t+Fye
         kALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509409; x=1784114209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GlJi+FC4zIqo5knAgHx8QAYTJa9mVgt2EW47vWH9pJc=;
        b=J5nvanr/g952eZU+uTEmJ5FDK9sGa4QGuSqy++BtwTjf8t+uDE0l+H4S2jNmcNp/ek
         DUUzykONK4ml78fBX5dPrQB+U0EgmjshX3tmIhoXShxOs7gXISqdlsQepfm480zb+/ts
         PJIiXAezXkzNdHVIej/PZiNeXZKJHIWjshg4HlMNk9ty0m/nxx7b2B+EZsStRm4PFzu3
         mJpADtcmCTe0LkTHlVzCxyVjS14r6OpWd+uemCY3Dz9BqPZNpwYwRJUWMgoWuxK/UaST
         8PyExtP9y6NoamoFqNu4OCXDWnJGg1PyRs89Mwlo1w3S8aVzUgV3bFSYnX4vcZfWoUPu
         0srQ==
X-Gm-Message-State: AOJu0YxEypMLCiAAn6iSPm/MZp7YV/KWLHksXhGTjoWpJ/UHpwFv7iga
	dr9uROumQh2ogzqJ2f23r4PZQs4bceLEQm6KmX9jPMT74F8jZNc8DfnkObU2L8AlfZlt3XIrvOX
	djkjX
X-Gm-Gg: AfdE7clE+w5UpO1t7jPQTRd28JAUWsC0WSWgA3zeoiT+a79AoFh6nhHF/V57wH8mroF
	zL7g/n8T2xPIbpuMlN1bPaextOs3nZMlJlLhnoyXMtZ76HYgSTI0bsb/Y215L2nhPrMfL1VrxYZ
	6/5jsxmdsTiRd8ZCqcgvGj0LfvXKUr0kOdtAO7ExiS9Fqro2MT5mfqCaZlIvjk6v20EcwooSdU6
	0jHv8uFjX3eVDOUAfPfnqjgyjLS1m365lxtzPxm6AH1AVeX7Si1S4OYreuWUEssBUqpf1SXHweR
	JrXzMkIBfHwLoClwUIu49WpSoi0DYl1cfFo3vORQoRB24zxzGB8qhIsMQDycfRzJAwt2dtb2xe9
	HbU7smVwk5BSCg7RCkf0dzYbt72Laeq/bM7jDsHap1ZG3E6/b6avnTmhaKJqsw7EdROVFZbsaS/
	gpdGyTRWaPNhih90ciVTHY0dZ07M9lBodcPccdX2Cyry4bgOgOLpXON/RhK5m0WOgE7830T1QJs
	R2M
X-Received: by 2002:a05:600c:6c8d:b0:492:4a56:690b with SMTP id 5b1f17b1804b1-493e68d50d6mr13150715e9.35.1783509409246;
        Wed, 08 Jul 2026 04:16:49 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e5a572c3sm60777765e9.1.2026.07.08.04.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/23] mfd: Drop unused assignment of i2c_device_id driver data
Date: Wed,  8 Jul 2026 13:15:15 +0200
Message-ID:  <8cbd70006d2b1c4572a3523d05b22c5141ac1095.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=y7f83ZY+gmTL8dJXkT7Oh4B6CFbmyiwfPpSWpfyjPp8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFRbmm0aMZXuG8matPXHm/L9Nb2352ebx/z3 CcygXDMGxCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xUQAKCRCPgPtYfRL+ TvVEB/98o3g/TMUS7KLilP+LlB7RNXWg2pTcxucaw2lsXG2t6uRQwvh2kaNEP+97IiMgvXRe0/M mMXSpwGYEs2jUFol1NKi5qhwd6yZkloHZ2JenoyB+HQo1uta+Mv+DrQUkGwBxK+GSyBEF1eXnf9 ibe+cdYv9P5rW+zEqu98I4xDXb7xAJsc35n9lKqK4dmv/Gh2rtVn3NB/mfF0IO5d31VdCmQU1Am joLX875JGuVTgq6XR2ezVYVoJ7dGzpDA9d4wLA6OTTI2CC57r6sexnverwuvhFrVQQaVLIDC5LJ ruExMzBzanR93q6CCoGP4tJHa2mBj4dkqS+uoeXUGG7nIywJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
i2c_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/as3711.c  | 2 +-
 drivers/mfd/rc5t583.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
index 9741977031df..eb03b813d58f 100644
--- a/drivers/mfd/as3711.c
+++ b/drivers/mfd/as3711.c
@@ -192,7 +192,7 @@ static int as3711_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id as3711_i2c_id[] = {
-	{.name = "as3711", .driver_data = 0},
+	{ .name = "as3711" },
 	{}
 };
 
diff --git a/drivers/mfd/rc5t583.c b/drivers/mfd/rc5t583.c
index 2c0e8e9630f7..4ad761fbfab2 100644
--- a/drivers/mfd/rc5t583.c
+++ b/drivers/mfd/rc5t583.c
@@ -280,7 +280,7 @@ static int rc5t583_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id rc5t583_i2c_id[] = {
-	{.name = "rc5t583", .driver_data = 0},
+	{ .name = "rc5t583" },
 	{}
 };
 
-- 
2.55.0.11.g153666a7d9bb

