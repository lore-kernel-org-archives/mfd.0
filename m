Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC435678F5
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872886; cv=none; b=dKNppu8NMqpCfaexYGDAyLUiXp5DBwdjdWTESQKnbfRcPbV6RkXXysjsM8dFym8srjbetUaLJ7Plak0OqMDunGD+fIEHFXEj8LL0zPnSqC0WM0fTqr14BEWd2nM06fFjK2PkWz8bjlbpIVDjxy1Os66CQ0aNsGam32ywJKpXVIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872886; c=relaxed/simple;
	bh=+OIWRe3YDSSSfno1aUGzUXI4pqYdomv36H08zvrEp/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRJmFLhZzKrQMjvULqxVw0oDU6trNSUoENPqSUIDI6hsWZOxLzv6Vz0kogx52TpC2NjbR8R5mUbnsERvGFG6A/ON6twq8maf1QYhVOH3qWvBv+ZswmVwESvCxTdTh+bXUG2cr++Fy9dQQCYWOKALEsbFFdepJoDgadjn18YJdEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtVUxfPM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtVUxfPM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0d2d37ceso14434145e9.0
        for <mfd@lists.linux.dev>; Tue, 08 Sep 2026 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872882; x=1789477682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RugyRWGWsjHVr0AiFzCDOt1qK0c+eaQP2Q1JnZpRYIo=;
        b=QtVUxfPMNX3V1mJeUUjk4Plpi8LBcNGa9M89UOvzPNbVcVW+2MfIuhqfks7kJvpMGB
         0F3dw3u6R0LExi3vIFMp9LDCSX3pPckZZk0BFowmDtoIMfPNGQMBVfMOYOHXYhpjbLW/
         7rpJB/KvRG4y/JmIxg7bIwnoH2uxC37ln52PSUgXd60FQecN/GPgE/3bEb9OVUFbPUH+
         CrZwltTaxycKFG3vnfoc/rfUQM4AU0I90EU31Jnvo7O0w3RqUvXH/CNXapv8aE984xuh
         F5ryjsCmC5kMdUlKpaR/gdlfes+kgEHIzkghCftpN8TEgU5XusjCbybcsEo1SFHWH2aV
         9/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872882; x=1789477682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RugyRWGWsjHVr0AiFzCDOt1qK0c+eaQP2Q1JnZpRYIo=;
        b=mkEgbfootkt7zBK/Sh0z8eRI5b1CInAseHKpbcGFNtBTVEI+sh4HQ6j1xrmiJhsbjK
         082mmKp3zj96Gxww4/I6bGng1g/lr1lP5Lh+5vpztTCcibgv/5cADWW5FBfLN572ZAXl
         GAiuOZTs6V67FqBeoaRsBxaV0PsU0iXGoLmAhuNmBY6fq1jT6rjWo04VjJaDivTKbQxN
         SPA1H7FthBYInaXXjfwn0GfSxOPFro69Rth9HTbpycIjDb0WczL6lYgwVbCxtvD2+PAH
         RkOlHE++wGOZx7W6QvSrdK4O4tEqpl7CtCyclteX+Q0TeIfv/8urZr/RnVR+Bb87SFjf
         OdkA==
X-Forwarded-Encrypted: i=1; AKwUvBwzEInLJ5C3R5Zt1uJHCvv77Pctb/wyiDwj6AfkELJ78q/yjfK5COEOY208pC9dhtYJLnM=@lists.linux.dev
X-Gm-Message-State: AFuF++lt9sI8/xDHJl7M/90cEltV+HYyNYIKT1oXj9xEA/2MjMkHTFgE
	ybCn8k0Jvxllcz4F5hFalNqHvL2dl5iSxfAAJn8gAhvsL7B9qwnhFCjGrwxjYu32XJkprQ==
X-Gm-Gg: AYBFou0cVdo7BjsKbiN5yCTIj8NBIj9TNtxeeKdauBT10ymoCii67hx5k5b24mFTBGx
	wOIxDySzmHmp/4VCpVOUfw7CrCEmA3GaVRrAa9dJQXpV/M9yzv3tK0jDCcML9rLo9C4atyC8L7R
	7DMdhTWjPd0Eewuw4oyxIbpD+wWg6gA99fG6FLoO0RZMsDiJ5dNVTHWsNP9h38aRb6D96FPqbnX
	za4YeSFgjTGa0SIOkf1e/X+v3DkQ2dfIlYALJGTlzR45VvHmgntvUu70wZxcoX4CRyYKT63nVhh
	2bjkY5nVJu+TZ0QR7gVOIUbJXTOtspjjqD+niNt8r0orfV3wP/hchHy4WrTFHrjLwLFzue44zxS
	6crsUrHYS+IwHbdXk8oveVCSHaw4tR4TU3qToXsxX4VsU7f911DI4gqyQrd1LU2U3eLbhOmMf18
	ENWoR0A+HtSswXeaA5VlM8dnPa6PC8Vh4PS8HVnhMuAznKzYWs2A9QMetK+FqJPBMw0kISUEbGa
	U8uuE9nPn4ref7A0m0IyKCc5oaEYr6P
X-Received: by 2002:a05:600c:c1c8:10b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-49cfa21e8f3mr187137995e9.31.1788872881636;
        Tue, 08 Sep 2026 06:08:01 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm28884165f8f.20.2026.09.08.06.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:08:01 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Tue,  8 Sep 2026 15:07:45 +0200
Message-ID: <20260908130745.2545-3-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908130745.2545-1-okerixx@gmail.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt is only needed for the temperature alarm and the two GPIOs.
Where the pin is not routed the regulators are still perfectly usable, but
probe fails: client->irq is 0 and request_threaded_irq() rejects it.

Skip the IRQ chip in that case and register the regulator cell alone. The
temperature alarm cannot be registered without a domain either, because
its IORESOURCE_IRQ would be handed to the platform device as a raw number
rather than being mapped, and the GPIO cell needs the domain for the same
reason.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/mfd/qcom-pm8008.c | 63 +++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..b51a9657ee56 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -183,6 +183,10 @@ static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-gpio"),
 };
 
+static const struct mfd_cell pm8008_regulator_cells[] = {
+	MFD_CELL_NAME("pm8008-regulator"),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -195,9 +199,12 @@ static int pm8008_probe(struct i2c_client *client)
 	struct regmap_irq_chip_data *irq_data;
 	struct device *dev = &client->dev;
 	struct regmap *regmap, *regmap2;
+	const struct mfd_cell *cells;
 	struct fwnode_handle *fwnode;
+	struct irq_domain *domain;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
+	int num_cells;
 	char *name;
 	int ret;
 
@@ -231,33 +238,43 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
-
-	name = strreplace(name, '/', ':');
-
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
-
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
-
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
+	if (client->irq > 0) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+		if (!name)
+			return -ENOMEM;
+
+		name = strreplace(name, '/', ':');
+
+		fwnode = irq_domain_alloc_named_fwnode(name);
+		if (!fwnode)
+			return -ENOMEM;
+
+		ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+		if (ret)
+			return ret;
+
+		ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap,
+						      client->irq, IRQF_SHARED, 0,
+						      &pm8008_irq_chip, &irq_data);
+		if (ret) {
+			dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+			return ret;
+		}
+
+		domain = regmap_irq_get_domain(irq_data);
+		cells = pm8008_cells;
+		num_cells = ARRAY_SIZE(pm8008_cells);
+	} else {
+		domain = NULL;
+		cells = pm8008_regulator_cells;
+		num_cells = ARRAY_SIZE(pm8008_regulator_cells);
 	}
 
 	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
+	dev_set_drvdata(dev, domain);
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
-				ARRAY_SIZE(pm8008_cells), NULL, 0,
-				regmap_irq_get_domain(irq_data));
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells,
+				num_cells, NULL, 0, domain);
 }
 
 static const struct of_device_id pm8008_match[] = {
-- 
2.55.0

