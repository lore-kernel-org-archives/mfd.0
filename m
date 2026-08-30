Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA57339378;
	Sun, 30 Aug 2026 22:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788129855; cv=none; b=VicPqBeyAy9hdKXpbGnDWlgVz8iARSE7kcdM9KGyGjgH71jyeyqat0FEZXnE9iyN47HYArlpKDi5l0OOAhj5C1n4rNLmU7iGqXt+LG5tsa4BAKD6Xf8192SRDuG/vAetXuWw9dOPL+xYZhnsFecOhqNzbpS875QVBmKIHo7090c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788129855; c=relaxed/simple;
	bh=5L7BeYhXO/6uJ84EQV5MJCSYczZ7+SYHAwWJcZPwu9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dUPuLPW6Ee7qnHqYwEPMTxZ2Bqknvzwnit0HRbwiad4QbMaS8ZDgoJRCU2eqDjqBHdlzDgNND5KK72ecZPyaTCSWwImmoYfxzrU9aJy2YrFdXUaRSl9NpXO5j8AKmt53r5DtTgzolbDlZcdBfPpWhH7sQGoi2rrLkaBua/cY8ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3PF46VS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3PF46VS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2F11F000E9;
	Sun, 30 Aug 2026 22:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788129854;
	bh=W7I499jooT1wgVBKh3MKxZ2T8LqsKbR+3xzF5b+GSow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y3PF46VSRXBagy0BlgL+QPukqemYocdT7V+GwO+YpEsUml6/8iglJGVBTL52kE4Ye
	 0ExqVF/t1B4rPilxJJPUiSykjPhzP+2CAnnvQZC9XX3Q4L8SOeoOPwNA5HT4LcqlKm
	 uJg3mJZOm6njsn9AOggJcL3+NJi1jnn4GFxrf2rKVofhkoAXgZI42FZFF4L8YODyCD
	 maUaJBKYGirZK+8/TuK9qPEDchW9rrPszaRsMHdIN1IqOD7xOlg3XwdC6T09fPX1zL
	 X75UQMqLxhDUEDhyHUsJFWULzeEvZvrhD/W8CCy2hQcMDnQnOhZsIuQyoJHCBMUDKP
	 ruSugaCw+2cQg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 00:43:33 +0200
Subject: [PATCH 04/13] regulator: ab8500: Treat cut 1.0 VAUX3 as fixed
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ux500-dts-snowball-regulator-v1-4-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
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

