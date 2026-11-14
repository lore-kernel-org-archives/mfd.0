Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626772;
	b=F9LLt+3cXiNPSR+F8pyfo2Nte3ck64McqBoPFy7pN477ZslF/wiMBj7o941aDjojOz+E
	 Xn45hPf+/FSUmKZ8tS3yNpVK8F6i+aTuF4BfzeW3LRqjXzZA0HrCfjFjJ0El32iMjTMbb
	 Krc9gteYVjbpsUVCWhvVN8N+OKgVDXOzGfkU16RE7iHZDBseH5Kmc+tTYg480Q1E4ZjMM
	 ZSQsvdBpghOtrcHxI2cOFI8f7I1k7pHypIaPBgeDjcLOZbHQsqpc9H0mvZA4Vy7hLedx0
	 g4JKrGE55Ltba5VX2axb9l60z1HsYV8zhUYw4rd6TvYhHIn0YlT+1OTBAtfD7JrgoUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626772;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=BE6Q7lwOQS+JLVi3m1rKA+wYs4mH0nfmw3zjAxeKYQI=;
	b=XXQYVaohS/XU4WwgOS8QUG1NreO8mi+t8UAu/LfAPPXyYY9anbuofbG94PdAOzvMu6a8
	 PxR8EIicscCvEkX4ZgvUA7kccTasEA74l8m8M8WGMb22CfNFW7KduWd6XquU1EplIluBh
	 dKIXP/Q+Nuvuh4TdOfxVdb/p7qT36dXApjUpbNLvcLtdLNbV8GUm65Vmid6nRa5jyfdVL
	 FI5IgivG8sEafTTDo3t3bQ5M28BaYYbrMRCAx+cFqP4YlDpxhoR6KlaaoxIlEA7jBEJ1J
	 Dm4MirekqOBDqBP+bxRl37afw7eCbPGgnIkl4sQ3yB+sh6KBucWmXspdMOlziosmOeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=pEsp9+R3;
	arc=none smtp.remote-ip=198.54.127.87
Received: from out-zbxj-a87.jellyfish.systems (out-zbxj-a87.jellyfish.systems [198.54.127.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7CA606A882
	for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 03:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB7CA606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=pEsp9+R3
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jRKJn6TNJzyNf;
	Sat, 14 Nov 2026 03:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794626753;
	bh=BE6Q7lwOQS+JLVi3m1rKA+wYs4mH0nfmw3zjAxeKYQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pEsp9+R3n7npaw6OVTgEubZQ2Qk47YlPKtzFjn29EguNpMuOEnPdUSTnt/JwUXDQU
	 +5OllUSS21O8hq5mcgfJWiknF9QrTM+PP7gp5ttxap1AtK86Cvqlr7Z9LfvEPSL2O6
	 if0k/JPVd6gWK5/FgJUsPgsd5AxJPb6JsMpwSEyBHUsN8yF4RXAy3kFW+NM0JSUCxM
	 pzqa91/7/xN4ZzjWeXeQzAPeFIW2tC1htsbLVAUt+obfIIfwf++qpOAD+s1Uf/j3mc
	 vTHrH/E12EJQoprMtatr4Fs9z0NmeVtPs9O9/3ZRPXFfnnF7+lu0f/aqKXQQ39m+lP
	 KuXgAg4X0lc+g==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH 3/3] mfd: tps65219: Keep running past the warm threshold when asked
Date: Sat, 14 Nov 2026 06:24:56 +0300
Message-ID: <20261114032457.3434248-4-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114032457.3434248-1-dev@chrispinetinega.com>
References: <20261114032457.3434248-1-dev@chrispinetinega.com>
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
X-Envelope-From: dev@chrispinetinega.com

When the devicetree sets ti,no-warm-shutdown on a TPS65219, set the
four SENSOR_x_WARM_MASK bits in MASK_CONFIG at probe. The PMIC then
reports a warm die instead of powering the board down, and powers off
only at its hot threshold.

The masks are loaded from the PMIC's NVM at every power-up, so they are
set on every probe.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
 drivers/mfd/tps65219.c       | 15 +++++++++++++++
 include/linux/mfd/tps65219.h |  6 +++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index e52fbf148..d8e352f35 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -507,6 +507,21 @@ static int tps65219_probe(struct i2c_client *client)
 		}
 	}
 
+	/*
+	 * The warm masks are loaded from NVM at every power-up, so they are set
+	 * again on every probe. With a sensor unmasked, the PMIC powers down at
+	 * the warm threshold; with all masked, only at the hot threshold.
+	 */
+	if (chip_id == TPS65219 &&
+	    of_property_read_bool(tps->dev->of_node, "ti,no-warm-shutdown")) {
+		ret = regmap_set_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
+				      TPS65219_REG_MASK_SENSOR_WARM_MASK);
+		if (ret) {
+			dev_err(tps->dev, "Failed to mask warm shutdown: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = devm_regmap_add_irq_chip(tps->dev, tps->regmap, client->irq,
 				       IRQF_ONESHOT, 0, pmic->irq_chip,
 				       &tps->irq_data);
diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 5a6be84e2..688173044 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -196,7 +196,11 @@ enum pmic_id {
 #define TPS65219_REG_MASK_UV_BUCK3_UV_MASK		BIT(6)
 #define TPS65219_REG_MASK_UV_RETRY_MASK			BIT(7)
 /* MASK Config */
-// SENSOR_N_WARM_MASK already defined in Thermal
+#define TPS65219_REG_MASK_SENSOR_3_WARM_MASK		BIT(0)
+#define TPS65219_REG_MASK_SENSOR_2_WARM_MASK		BIT(1)
+#define TPS65219_REG_MASK_SENSOR_1_WARM_MASK		BIT(2)
+#define TPS65219_REG_MASK_SENSOR_0_WARM_MASK		BIT(3)
+#define TPS65219_REG_MASK_SENSOR_WARM_MASK		GENMASK(3, 0)
 #define TPS65219_REG_MASK_INT_FOR_RV_MASK		BIT(4)
 #define TPS65219_REG_MASK_EFFECT_MASK			GENMASK(6, 5)
 #define TPS65219_REG_MASK_INT_FOR_PB_MASK		BIT(7)
-- 
2.53.0

