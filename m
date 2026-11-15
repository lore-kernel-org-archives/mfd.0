Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733126;
	b=jYUE0BpMHI1Npiu8cX1rsgzCmw+vtRX460O4pUXqA44NwmXd27gWmtTkHs8E4in7t7jn
	 EhE15U9uQRezg3VLilW/HvAOLpotFtnQtk4wLwqcf06YbhSi4PRLjgRTRnh/qVPyMHm9V
	 PYmZ3MkjDYH1W7HrdVOeSl6RorgLVAhDGAM1LDJMWk0sY/yBH/zDqL34Mq48uIFLz6lcU
	 7yudePMxnogUJIAYEVomgRBWv7zV/6k1ieDyI/wOxjen1s7M26E4jdLE0+64VOleGzIY7
	 7ZnXoczJT2840sJ32v5E9fkiV/8Bi0E/gS+b3Ci1BqHFE3SA5L9bILnyW3296jaOjXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
	b=SlG44UXnyZ3RRlJLh9lKzxzXppcJCxgTx9khGlvLKWbYN/3cJwiPlmmehicsBshoi0ZR
	 rZBLw/Cnvgc9pPA+dQ5/ZDjRz2JMOptCiMjkeK2AlsjUaMn6QxSx5i7v0Z+nxERR58tTd
	 FpmUK4gGdiQAIdTLYXwCjpgORFGLaoHTgCHelQBn/3b82XW+8CK4Rv52+5k7uLEgQGLVZ
	 5w0XoD36dVLJJAZp54p7MKCjIoQLoOxXdDT39JfU6i/X1Q6ev7ocMXjdvCfZEIhGYQUcF
	 gl3VMbZfb1JUVoQDr6nwwKSTC9tzRqGL7JO0jolUTmTxJuJrGwSUNifaMHrbwEtaZfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wUJPU5tR;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB6A606A880
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 08:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB6A606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wUJPU5tR
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so3712426a12.2
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 00:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733125; x=1795337925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
        b=wUJPU5tRAjA4q1MaDPh9iUtYQ30FCOIHjHHxtr1llZhHbfZG/7AvE+qn3qWKyOFiIQ
         c/o96GgEYVq+cGj0SyYGhktb02UMDtUWZNT5mYmhnLyuPluTaeG0YOGP21V6LHWAdOMR
         Hm8EoyEQbhLCSDJNDcobLJg5h1m06mKlmMsfTVLlumdwzs6Xy4SG5rB97bl3GmI6Cq5v
         6zqt6XEVwtMbtLUBtuqjMoVXPEjRKUL91JBCPjA2LVSzQWKmslaetKOHkXXg95/csNp1
         Vhk2fIxTGtQ+1Qq0WgUvrQlijxW4JuY8PW4WgcQzNEK5gJmW8RT/o8M1YUNSpUzMRv/l
         AHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733125; x=1795337925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yu1iUE5tUZZVSrKcPtur6Bk4ggWxQJ9hvoe00qeVCog=;
        b=ivE2GKqh+Lf5Rawn4+C1cvkq9a4FeZ57RtiBAqDhJCQCDY51YbOEuu3KiYnmNsUWNk
         4DTjJ2vCKjDmgfM/0C6lvRWEMexGDXGFsbyA2zWHGYgiykuDj2ZXCQNI+UGSYZ6JYiVW
         3ndtPM+nFwNi2mqhsoGWJfI0SUrfIE2J3fi8RFOP59rWi1ijo3iaOUp3ps9Cp5KeFg+A
         e9damvPCrhVIYrEBxoxPdl9Bv5YbPjo/ugCifdG1aVKWa23O+kMeypTiAkOA7VK0UiaJ
         YJmfOd7+LlyGXS+6rT92ThaqeAMUvhfK15jHUpGJkQgdB7WATY/y4Xf/KAkAvr4VPDl2
         V81w==
X-Forwarded-Encrypted: i=1; AL+hErE5lsfnptzCTlAggBKhiYNePyXYHbOu2A/eozC3sIyO2zhNdKX6g1mQfEw5vABG3GuepZI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9xRl0Jfb7/pngdnR+gJNuEWCr6osWh1k28J31gNJcRvhfTTxNa
	WG0RlNR7V0RmCZphclYRT3963efhBx3lWPOX3Y7XFPsKg8Vhx+kJfS7q
X-Gm-Gg: AYBFou0LVlNiRPxvRJD4SuVhCk+F9VEOWyUBCh3UkisEW509bJYtdd2++TI9GtDKorV
	oyxVZqpWwCYBDj1roBd8NqroVumyXXQNPk9AsRIld/q/uBHm9LGqIWrzZuA0YNL1CBbnxlw8GPW
	D7gKhgcmBTgK0uyVcR6hwAq6CW5aXFnRwpab4epqwZ2MyrMKdhWgd5bJxJTLBFrB+gIrc0wDqC1
	OYVdQKhsa93auM7BAbQtb2m1vRokWPnEd8PdBySf1dsDBE2ivi2IKUry3IsPcSkxybLm05oOe0P
	TdKZ6htR+UuMcbRhYo7G+ZB8h2j3za7ySCtW80FcWWGWkzOZPmncCwD9SwnSXS1MUjQRZp65zzZ
	MMAanyCKPgRRc3/sLYzN5Q+Y7sdMaWNoPp/aUTtnRLwafX0FX2xzzI0yvwEe+8QJ+Nx8O7he6CZ
	48T7Be+pdTSrTqe456JB/v9soKriNKsfFvqA09g20zv+feo8Kp0iWOQXekQyQos1hUMDUsXdv3Z
	PWXRPt+bKSrXQtYnrBQPT7b2uik/qSvJaYFbMw7fXCEFSAHCGFSg8Lb5JvntiypBU4mBobI4YrB
	lIxZve74RcXj7mlWvw0IOKIhoN7mvvM34XqSg541OJTe7aAllGlxnTFMvDVg1st59VFOE53cGkt
	C5M0wYuDUsw==
X-Received: by 2002:a17:907:5cb:b0:c50:95b7:d189 with SMTP id a640c23a62f3a-c5095dd72f4mr610171066b.0.1794733124625;
        Sun, 15 Nov 2026 00:58:44 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Sun, 15 Nov 2026 10:58:25 +0200
Message-ID: <20261115085826.89641-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT2870 supports a dedicated main power supply input alongside parent
power supply for its internal regulators.

Add support for retrieving and managing these supply regulators
(vin-supply and in-ldo-supply) using the regulator framework to ensure
proper power supply dependencies and power-up sequencing.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/aat2870-core.c            | 5 +++++
 drivers/regulator/aat2870-regulator.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
index f5409dd91efb3..9017960ee73b1 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -307,6 +308,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 73b6d06858cff..896f39e345379 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -105,6 +105,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 #define AAT2870_LDO(ids, match, vsel, vmask) {		\
 	.name = #ids,					\
 	.of_match = (match),				\
+	.supply_name = "in-ldo",			\
 	.id = AAT2870_ID_##ids,				\
 	.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 	.volt_table = aat2870_ldo_voltages,		\
-- 
2.53.0

