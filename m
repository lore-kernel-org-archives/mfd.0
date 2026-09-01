Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17B4499AA;
	Tue,  1 Sep 2026 20:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292948; cv=none; b=fxZ2zExrlqDGtZ0//zdXBl7OICzEYo17ndauw9q39jB2m7fXBS1HxTEXRGePQfxWGOm0HHgOCTauhAOxNdx2G/ifNAeLtv+8ZQGoNV1z7pPa/Eqk1n81hil/5LB/5ZVtNU2fYddQyGPJfDaI2gK2kemWNU8JbhFL/hgCC9t78Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292948; c=relaxed/simple;
	bh=5L7BeYhXO/6uJ84EQV5MJCSYczZ7+SYHAwWJcZPwu9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2SsXrNHpw21sgEVPluj+CPdKTd3qoT+bzrrDSlRST6eNJCURtqfDldPKc5dBidqtIHo7MpC8wXn0OtPUCNa5aC7HnWW+QSTjtBhRzhECTB/a2zm82fM5hIpe8tPqGl3Tk1nyDxXWvjb7gJQmYdxK2kLnnnltqtMWzKnwBQEbU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcL5q8ZZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcL5q8ZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596D41F00A3A;
	Tue,  1 Sep 2026 20:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292942;
	bh=W7I499jooT1wgVBKh3MKxZ2T8LqsKbR+3xzF5b+GSow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PcL5q8ZZash6mElAsTswVJXRREVXbsh8tLP8cvLeHC8ET8l1a/oLbymtxgSu8iX+D
	 ZolJaslezphQPftNIu9QadoNd/e0m5dg9qg+SNxobbXacm5ACEiKT/+V8WrOvFXeel
	 sGXz0eR7ppj5BqP2C8dUGBSSy/JJBY6U5Qd7NG12Xi+ezxbBUNf2exTpMC0l7Rl+J4
	 SpQpyyIKpBPPBMnr73KKbFgIO7+BNPgbuYiPilF/khRoqwQTdSHWU82O55lqhovesC
	 v4x0yZGqxMRhm6JSKs0ok5th7/GtvAEfLNxqhdSuWYgjXpGWjG3KLQyuaDhqC6fwaQ
	 +uaWDfLDBiH4w==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 01 Sep 2026 22:02:09 +0200
Subject: [PATCH v2 04/13] regulator: ab8500: Treat cut 1.0 VAUX3 as fixed
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-4-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The early-cut workaround currently gives AB8500 cut 1.0 the 16
programmable VAUX3 settings introduced with cut 1.1. On cut 1.0 the
selector is not programmable and VAUX3 is fixed at 1.2 V.

Register VAUX3 as a fixed-voltage regulator on cut 1.0 and retain the
16-value workaround only for cut 1.1.

Reference: AB8500 User Manual, UM0836 Rev 3, p. 240

Fixes: 2b75151a1041 ("regulators: Added ab8500 v2 support")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 5e24e6cdc773..42cb8dfdc7c9 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -1783,9 +1783,14 @@ static int ab8500_regulator_register(struct platform_device *pdev,
 	config.driver_data = info;
 	config.of_node = np;
 
-	/* fix for hardware before ab8500v2.0 */
-	if (is_ab8500_1p1_or_earlier(ab8500)) {
-		if (info->desc.id == AB8500_LDO_AUX3) {
+	/* Handle the different VAUX3 implementations in early AB8500 cuts. */
+	if (info->desc.id == AB8500_LDO_AUX3) {
+		if (is_ab8500_1p0_or_earlier(ab8500)) {
+			info->desc.ops = &ab8500_regulator_mode_ops;
+			info->desc.n_voltages = 1;
+			info->desc.volt_table = fixed_1200000_voltage;
+			info->voltage_mask = 0;
+		} else if (is_ab8500_1p1_or_earlier(ab8500)) {
 			info->desc.n_voltages =
 				ARRAY_SIZE(ldo_vauxn_voltages);
 			info->desc.volt_table = ldo_vauxn_voltages;

-- 
2.55.0

