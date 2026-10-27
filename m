Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100781;
	b=WEIWZvl0WRsUbvHP45rEqIpI4hcLEqixhIdHijC9wPN8ga3gNx8GeZBwz/yd1+krBpAw
	 vDXaiHq0djs/sC4Waq+VKILcy0rN3Tdwx2vAia0h+aV5mr2nwqP1QT7Mu09H69QDUTJQc
	 xXk65R3syXr3WTbnHkGEXCCwaUJcE8l7R3JMvETsiC+Hjo1Nez/8Dk/yBg/eJKcNryKHf
	 wKGf8uo88Mn7Y17DdVeVlJsuKLxf0ih+OAiWPPsHv0lAX6Gx4aZjl4ra9k1/eLnBuAXLE
	 5JQSGdKHTYk0jA1VLsKsHT2EmXS8LwXuSo0Pl/Pwr2Ql3yp7XPb4NS7Vw2imZzaee/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
	b=XMlKFb9xM4M8BG6Xm7cyENxY+j7JsWDFBj2XpS/KTE5dCzCoMMM+DMHRFtyY7lfZ5o33
	 fii514ZzR+jRS0kd8f+sQq5qS8Vdof2yPs2TR5pqrKlFdYuG4HWciiYYEOCSntk/KqZRx
	 05f991I5j6wSMN2YYRGuoA78RZ8Ukf3rq10caIyumNrIJumluRyaVZ30ifEJnQkj+ZT5D
	 YsDm3atETQr7F/Vcsg9WLPiESazQH1RhdoOdsNaLVGJJA+b6uWUyAfRxmMWUJLO7chknt
	 OheixOYfXr/iXYgZnEuSLWWfb60Ih0xtoFg14K2r21UcYNJXbN10NFGhqFl5raU2K/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dYCbNOfw;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8246760A3836
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8246760A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dYCbNOfw
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c445c95d553so525793166b.1
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100779; x=1793705579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=dYCbNOfwNDutbrnT1xUcWluxZkJWaa5K9H26dZ5pXF87E/0sq98Lf1PEGeg7GLZuIE
         NGhNY+9H/jxSmC9O1LRw1lcB1TA9UYm0marcsQ5IcHQvaIfPNTxm3Zx/EB1FH34DYuwQ
         kb7Oi6SR1esnJZ+RPZSfWTyygsmAeB55pJhfgtucZ0P7Nn740Fai79Y0bpjcX0sGRBH6
         pa617Ys5m2ER4r7UivV/yR21126esHPjidRz8d3sVRacFVyg2cacxITwXQhL3OCZN/K8
         Vreiz9zp+perNRrUKuaKN2sku2J+KyCYWtWxwa1qmgep8wJpw9NE3Qqf7fk57offdM63
         ShGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100779; x=1793705579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlABjifCqSqzPKHch40gU1r/EoFeoTHIM67lGBUV2nM=;
        b=xounp87HwK3O/VNutVv61QtfhAl3GP+M9rYyZEowXnA9fvLb2izhR62l+hjjwqJcyF
         +EOCBi0djn7xSQr3OMN1+EgHh1/bNlcfXVf6B4qRBCMEnESIRC62DmJSBTWg8YjkR3VN
         8MhxrVmUxyBxdRTrpr0lVtojP4L2f5KwyVAcghFeamDUNGpaqQkLLBieIAjkdW3cuuHz
         ivbW8HN9FKuDVaFj5MiFQK5y+RyIt7MGBfSiSqm4NztWdhCqhZZNZwxS7T0/AasPLzfW
         QeR7KyAAy+GSAlGF5pybiJv6SXzuc5cQ6PzA1yxLGY4vCJ1zjtqYh9XL+XzCWeVX6jp6
         a/9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxes7XyXuRba6q4CCIIp5ka+2egQGlPpaUN5uX41G8J4ImpPaHcm/VPZbpQpZcZRSaSm/g=@lists.linux.dev
X-Gm-Message-State: AFq9FYLFSUg0oYx9Ny4AcNJl59LvqXwGCLN+f096ArUPFpP2SMVDkI62
	q7bNJ64k/mngoC03mBCX/ps7RChtZ+BSWebFoW1eHn/22ci5Xaw+5xih
X-Gm-Gg: AYBFou0e49LFHAYIIkBi07BIQcibvtKLTgH4s51ugsF82ltEmE+HDnBEjH5TtS/cAIu
	Xtq/jiTPsxFqm8NFooTGT46KVAp6T0V6ThxRMphGsiHuAuOvyLRxgiV2fxiQLfz4Vf3Wcxf7TzI
	LB4jU8eCOl4K5mm29pM88k/7jVuafKg4aOd3e7PGyF8lCdnU8HmQXpHHppIZWGHmUHWKYxC+nzF
	jDMWPYogoScf73YX81AQAoz9GjFJc/rRubo2lMXug87qLIMA0bR63Qsk+u+l75U24DF5iFIhbkp
	OC5ZH+UmZYBijL1E4i1hKcB4ssSGSq8q2Sn4HxwmzcQ6oJtR9DdtA0xpy7xrV4kT3hLTqz3CRlR
	KpODsyDiH9OGGzmIq5otmxGbMMxLrTlv283iJd/4BTpyyr2ePLMFTLmAho9QM9f8uxrBvLiwAJH
	IwWPL8BokR7nrVXePUXFotLUoLUN7GKfe6NRQAGv5Sl+EJ1bp1kady7W/VrvpJLKNuuSRTj1mex
	YblSCfdBiWJosSKiFiB7efMt/oDynRGzJKO05lYE7htT3dVWHEoCWGSI3Tf+Qu0RVIZ0SmCUPto
X-Received: by 2002:a17:907:6092:b0:c31:7495:e57 with SMTP id a640c23a62f3a-c46bde9a0eamr971176066b.44.1793100778881;
        Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
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
Subject: [PATCH v5 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Tue, 27 Oct 2026 13:32:30 +0200
Message-ID: <20261027113230.47538-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
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
index 6b1040c65373f..657ccbb9a9dc5 100644
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
@@ -308,6 +309,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
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

