Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FDE451980
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752538; cv=none; b=es/ddJ+azwifVuyHQj1A4CohRGctR+AWtX4d73iEBVuoc6K/KOLNi9hnFuJup7oCLB0FPQrOQ+B5ZMZgG/zd/OxJ1BIQXRjGAcIdGOkhKT3FRBEFjewgpm0U5U7iv7rySZ4XvGH4whSncxFF/Wsmszxyc1rnCxlGggsV/8QkHGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752538; c=relaxed/simple;
	bh=Uv8673BXW487YhAql7BVA6vApReuaTTxPWI2C9lkqJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srkuNp1+fMEF2wWDAX+edhLOaGp1wHr7elnFoK9+vtg1/R+3R0hIYlQmv4YGfQJM02WckEWtChE46J6iT4/GpdL5h0DAulfh0VBWI2UnWBcPgnrtj560W3Wg8kI38dGCAesr2xpLVcnHbU/VN0YUDiLKWYRC+10uB2VPw4VDOKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShUYTf/m; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShUYTf/m"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-4888598e4f9so3454634f8f.0
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 00:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752528; x=1791357328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91UgRJj2a9cqCekJgIMfhdUvCOQ/1gwR4pNIdWvIxRc=;
        b=ShUYTf/mK3rSH7jYdQ4dPl1Ndd5z548+EFXoBcifsXiNMm1I+fjTlWCkh/ojFJCq5b
         JqMxOPeRJutIUXJyGxqHJCNsVcj7cnhDvP2g8kPC24vLl7VxkUw7E42YK7z9PS3WZEDF
         yQokgSkYFXAbdB61quVTfZyG11M+S1O7GQX5sZ+0PJLjBatJwrIeuVLa0g+3GmRAOM4W
         L+rrhHVKNWKkTE1o9RRRJUVSFfWnAkk9xZ8oD/+VwNlaC8SWGFm3/SY9dp+93Z9ttub0
         4V40AQXsNAfWuB2cOg7xpHtTUsKkZQzIt5MQrtn/ubK0OBhBn42sdGi/MZO1cB4tRCJ+
         lGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752528; x=1791357328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=91UgRJj2a9cqCekJgIMfhdUvCOQ/1gwR4pNIdWvIxRc=;
        b=lh32OB6VeSd2PGpcc8B+R+6Bbeje9t3mlyabKWLGDrM91RCvQuYtxaYZbRqs3DKMhW
         mpRjEVxcru0ir+7t6dXlxiG9vZBtBo4P4oyYvWJdO+zgPaWzYmwFkpiW1OAoD9TNaMX2
         HS6nqYbSeGPcZQ1LAM5wEG/UkJ/dnkUh8ERxfCg1x4OSCH+WSjYBUOx1LuynVtbBnRge
         WmVoCcyT5+N1UUDaWMY1Bu2Frq9mqEgf6+TtKEBSu79qu9U4wgRyNk69fA43TLTwG3Wv
         xlAiYVB/hspVW6D0TRIgCi5AcsIx0BFv3RYGYKhdC15YxJ1IWA6E/WvKgtTjARJbvtli
         XW6w==
X-Forwarded-Encrypted: i=1; AKwUvBw8bdCvkDRs9y9rPbLXOPSB1ermZqP1UwtNPw9uODoM4apZmhR6JaG+rdNcedCAMNZ1N8g=@lists.linux.dev
X-Gm-Message-State: AFuF++mLbCg9gPjQL6leKiU5dniRBfW4EN3H5G0KLzyAp9z00wUEkT94
	8PIUzlJFXZyVh7Hgekt5PFUir9AIQA/4PqgVRV6uAisxIXqIS9PDAxCK
X-Gm-Gg: AYBFou3YI9CzwRT9evMPWOjKBrWMsPPHvjbhny6BSTgBFCnDSUg4EPEzAw47CKyE8ZT
	qW488zWeBOmyo1mr7hgJCA8wYwqicr0m1iwgeep5n+A0EVCz3F0rpAAqgQ4lQwqWyQpCamJvW9i
	zTHplEAuLfQegICGTN/bgkrZMSviTF8aI6ceanGGbcyiFFDeDK8uKXUMZVF2OZ+lnPbl0J/KxWf
	ChIWiggrWyFEp1/faGfPnuN0+tdYX6as44CBIeWWMXmJ96MvhcC6riu+nZqvUlStW1TLFDtS+uA
	Am+9d2wsfBoS5llb6DDDdVLA4u1bzW4SNcF8XskaNY+dIAZb5gZhda6Q1ict8sdQT4EKKGZXXBD
	vKrjgdX+2V7Vla1WEflzqvJ/+wDWpZ4EKnyO9Ai+O5WaSMjhOoJDxQgWl/MfY4OXQLR+7sH7hZ/
	0XDgcHQar8zJly1NdK7VyNiM+jcDQr+zq/5Rl3C6jQtQsz9hMf9Ifwl+X6WtANrDVPkIkXafkFD
	drMglTFCCgx+ERt2pE=
X-Received: by 2002:a05:600c:3b1a:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-4a01b12b310mr5780705e9.29.1790752528575;
        Wed, 30 Sep 2026 00:15:28 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm1256979f8f.12.2026.09.30.00.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:28 -0700 (PDT)
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
Subject: [PATCH v1 3/3] mfd: aat2870: Add support for VIN and IN-LDO power supplies
Date: Wed, 30 Sep 2026 10:15:13 +0300
Message-ID: <20260930071513.54697-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930071513.54697-1-clamor95@gmail.com>
References: <20260930071513.54697-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
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
index 8f6d7956e79b2..a9a11be373916 100644
--- a/drivers/mfd/aat2870-core.c
+++ b/drivers/mfd/aat2870-core.c
@@ -17,6 +17,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/aat2870.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 
 struct aat2870_register {
@@ -309,6 +310,10 @@ static int aat2870_i2c_probe(struct i2c_client *client)
 
 	aat2870->reg_cache = aat2870_regs;
 
+	ret = devm_regulator_get_enable(&client->dev, "vin");
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Failed to enable regulator\n");
+
 	aat2870->en_pin = devm_gpiod_get_optional(&client->dev, "enable",
 						  GPIOD_OUT_HIGH);
 	if (IS_ERR(aat2870->en_pin))
diff --git a/drivers/regulator/aat2870-regulator.c b/drivers/regulator/aat2870-regulator.c
index 4d399d0486d19..4cbcb277ff20d 100644
--- a/drivers/regulator/aat2870-regulator.c
+++ b/drivers/regulator/aat2870-regulator.c
@@ -114,6 +114,7 @@ static const unsigned int aat2870_ldo_voltages[] = {
 	{						\
 		.desc = {				\
 			.name = #ids,			\
+			.supply_name = "in-ldo",	\
 			.id = AAT2870_ID_##ids,		\
 			.n_voltages = ARRAY_SIZE(aat2870_ldo_voltages),	\
 			.volt_table = aat2870_ldo_voltages, \
-- 
2.53.0

