Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347798;
	b=IfMfQp0DFv68am756quqEC5J85z+UgrBCaikY56FASFP8R2xT9GdS3w1sWnRXobp9j5V
	 EUYcJzTUpE3uKlI+L6i5lOf88/U7/aVE9VY1DNLQny7GZIqB4zbpd49b2VSek/Ry25rGT
	 naGdazBfsgFIQLCc8QUVyBOpq8LbMSwl3Z/OsDJytiCawSLu2BwtMD4/SZdt+0AAb5nl/
	 a2YK8HbC15c6+TnVXOKcVtgr1jzFgTsBLSSmiiK073IqcC1gaI28LNi8U1yW0LVnvhmAK
	 tEsqNRJyrXuSp+7DJmktaWbsIWzch3OJh0iJwa+J6QXlVkcSf4hge3Ju7x1P2ILrW8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=AJK+0YT5sOGn7dOYWNuj6ktzaYa5W0p9EEeFHLkfTQQ=;
	b=lippqaREKbGLqmcjxvSSSGU5aOM/h+fwTGtnz2Wc4fpHwSSoIU78hBy6KsslOrXH5POX
	 C1ik4IiNRE8uk1Nc5jeb93e03sgixl8ix3y5/m9fNQMrX7R4uDlEhGNyszmmGvg3tjPtY
	 qEZ6yfB3np553/WJdUfD0Vx7DHULrbAOY8+QqGxYm+XrjAHKi9BqLXBF3MiJjRrLWWgJx
	 PQ0h7Ue9M+QcIhK6bKE+cBLRleUMMty/nucq5OmoQaYg/j45SOk7M4CyKps7WrCiDdLwl
	 mP7jErS80JV4HdaVKsDSL88BtnIZPwbrzpWiHr1OQ+cgj7OrFbozIn8mzgLOIcgaB0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n4WUrOrd;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A38606B56C
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A38606B56C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n4WUrOrd
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1702539f8f.3
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347796; x=1794952596; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJK+0YT5sOGn7dOYWNuj6ktzaYa5W0p9EEeFHLkfTQQ=;
        b=n4WUrOrdu5EC2YhtFr3kzADpB1G4mrJcLzAGSx9xB7cU0Piy83UAiI3Sjzo50whU4i
         +uK+FzHLCpqKx3wREXwF5+7C9ZPRXMfVmqPvFS2+4gZezYg4Fc3xXVffRjANV/hb1+eq
         t37HlJGm5luXQR5k++wEOkbipWJfpHmt/wVxEu6HpZFKguz4XnmTE4p+A+JAw2xcmxde
         XdGK/PTWdKZDXcG6BQjzpdGIJmTJpftoDwK2iTZHSWXwSYlB4sdDKve1bW2GOs0KPi2W
         yQA6peq7CUP51XZkqQhn7XfrHjiLSfyxFivFVk9n0ehV2a91dHF4Yvqct4ehh5oQ9Dma
         Pjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347796; x=1794952596;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJK+0YT5sOGn7dOYWNuj6ktzaYa5W0p9EEeFHLkfTQQ=;
        b=0ZpykefU/9AsQbgh+X02oON3AXPpRrF8uDBJqD5QViEkdv3fjX9zVM7EeDOP95BvBD
         Dh+V8VpQMjRKnDnGbwVY7KpP601dedCWjeDMPi0a0aoTA4vJzwSZqp0TYUJK+pcOngtk
         zfNSb9WOjSq1X2NnDpttaWUMvIHLrLFp9xLkk5ngUzQf9aiX1JZX9+YSkKQxc9bKJQiu
         z3hB/FHZjC6n7oB5/wLxYWFqTDMzFvDJBZG3sBvIdoYcs6uLvpjUeELZmd8esmO+RS6e
         +/ef0wqcpGQc38aDYSleY4twVA5DnWV2f0UdVQty1d434JQ+IA7bW18LshAZ7jfQOEj/
         DqVg==
X-Forwarded-Encrypted: i=1; AL+hErHpszC4nq7F0oKgbgi2yrs3UcVg3ze4qK2+gYegIIYpVf+dODCNOeZSDTxKPZ2o0OTVZx0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/2Fh7++8dRnHA3YM3Rk7sNoG07XbXhEhwfTg9M+DnB7TVupC3s
	03RGrHqDWniMLCldPBhhOS3Z21nmk+Pxz7+ja+5UHdNuX6Rn8BwXNs2u2vGBPtG4fVk=
X-Gm-Gg: AYBFou13NOsj3Q4+S71wevROc8KBPPXU20mpyOegkQwPzjgakVejzqCfZwoIdt1jmHx
	HJrAKGA5SbIJ4bVpdBheriA/O9YHMdkqnGGS5jvMyj+wuM4NmibwIxtIhW8H35ud20nkFULj16V
	rYQDQvkwsOunS9Iml+wiT0t9H4OLJMffkeMxK7IzFvzaFpMC+wI5fiU80WJqbD4pNPzJTsbRt9S
	MCfk7sD21jP+u2MWd30O22LNQE8l4Hku9eAq2000IF0qf+6LoGjzKVdrUR6zqQSjocS5O64sHzI
	Nsa7oHRonUFeB8sNnDoqcRT/3u53k0nNzeULFkzhNv6b1lUqi/4U8oM9EpeH6bkhsom5pBUOY1g
	MqBmMMI1JoVOc2e6r+Gic2JkChxnGvfenUlDSAib4q2gLzLKMdaWUP4lqnCvy8QRriAXCwPO5X2
	hUeuKYMDDyzOv+ovFfk3wbXKzYIdoOw9LRMC5DVbr7puBtT8ccKdF1wARZMXOoZsscAj3fH7KiE
	sd4S/mTpryf0cV71zTmIQidN0erePHoEJRDa3cmJn3SkqsjBRxgj1pABS7+/Mb+mq69zZOSBTwN
	uhgN/cKlpVnc7bVYhpWihzRflRc2pmKo2Q==
X-Received: by 2002:a5d:5f47:0:b0:493:690c:8364 with SMTP id ffacd0b85a97d-499c3ba0637mr411346f8f.3.1794347796102;
        Tue, 10 Nov 2026 13:56:36 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-498365cbbe5sm7894356f8f.42.2026.11.10.13.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:34 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 17/20] mfd: Unify style of dmi_system_id arrays
Date: Tue, 10 Nov 2026 22:54:42 +0100
Message-ID:  <d5b5b1bc744791e3d3c0853c49cb929d7859f6a1.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=SERAhXaidkBINTbsPUDlbXlyPqZpWvLU6rbuhUh7+aM=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LN8GVXUMII2zUy7qf7edF8KeOIIt8DjWzIA 22KcLOu+TeJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSzQAKCRCPgPtYfRL+ TlI+B/jR2Z6t5/jwnemCAQ27fSBcvrirLllISPQbA5CdjTXz0f4o+hLEJPfyy9ocn0WRB3GZ9dp x6I2l8yxgiFs0mZvNA79vB0CBcPrxe64PrHTrroCvjJIIM8NcCmk5lV+K3K+gylpM/XNQTwcLF5 KFOgnUCE3yifgF5TwpT+B3+ZiRnHIs+SMSO/qwrxaAanVYk2+L4gE+SeYzpMxA8xep6hjxdhEIz KiCusMU7yT8+XkpSEYQxHVoJ2IKFZsOZbNVrJ+p0hafNcKt6V0guF8T3Qyh6C8A62TiDjp+eKa4 h5ogK3JEHIcJ6YbjK9KKRZ8aJp/LjfWUhRX/qhJU6UNBXGY=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These arrays already mostly match the most used and generally
recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Only the list terminators didn't match this style as they didn't use a
space.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cgbc-core.c            | 2 +-
 drivers/mfd/intel_quark_i2c_gpio.c | 2 +-
 drivers/mfd/kempld-core.c          | 2 +-
 drivers/mfd/tqmx86.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 2becaf797646..e32c709edbac 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -393,7 +393,7 @@ static const struct dmi_system_id cgbc_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "conga-SA8"),
 		},
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, cgbc_dmi_table);
 
diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 443a1a0cf777..7f8c16d82738 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -74,7 +74,7 @@ static const struct dmi_system_id dmi_platform_info[] = {
 		},
 		.driver_data = (void *)&intel_quark_i2c_controller_fast_node,
 	},
-	{}
+	{ }
 };
 
 /* This is used as a place holder and will be modified at run-time */
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index ceef894efcca..3f6a863dccd9 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -737,7 +737,7 @@ static const struct dmi_system_id kempld_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "Qseven-Q7AL"),
 		},
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, kempld_dmi_table);
 
diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 1c2fe3f91238..16f47566cf3c 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -338,7 +338,7 @@ static const struct dmi_system_id tqmx86_dmi_table[] __initconst = {
 		},
 		.callback = tqmx86_create_platform_device,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, tqmx86_dmi_table);
 
-- 
2.56.0.rc1

