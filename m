Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC02D3B8BD7;
	Tue,  1 Sep 2026 20:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292951; cv=none; b=Df28yHLQwxNIyXdflttES8VX+L+rw87O236i6/YpWy9OM5d4veqFfAQsQJ9xKxJLqRQDdIWvv3rp+ivS9u9aibg2ng76H5KPqR/Inlc5OtRKUW35fbCyqEtjXpJO2CCPp5Tqe/1crcVLyCJ3qLDgMMa/uu+yZfJasBU/3lVePGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292951; c=relaxed/simple;
	bh=sm7o6cCzp8flppDMwW5Z+rofLj0ey1Q6EInHqIwTGW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F8mUJfhvUKk7qB/ucGiIIdNDWXaoLqiGOWZQ1swT2KSE4dcOHn7ymfgfnnrPEIXXDV9WHjBA7eC7xs4q4rgna6ptrVCA3y8RJvheJ6/vTy1nO9Z2C4vajkdioP+jWCVNC//1PgyeIYfekjbJcqhddkCOoERT6PbJhBNQeWWuvBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQ2P92cE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQ2P92cE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79FF1F00A3E;
	Tue,  1 Sep 2026 20:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292945;
	bh=cYxLvSFl/YWS+JRovkLaSv4pMP7UxSGmiLqc9zYTVx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nQ2P92cEA74qo1xEDpuQ6l1Rj0AxGfj7Z1S7dVdnhH+KEceOFsgC3fsQEaYkvHlre
	 Nqdy9Lp8gJOCi0UUKi5bqujyGcJBbTvgO7bpJ1SIJK+FeNAUGmDSnrHC/53RANrr5X
	 E9Lw0UzPxcDvcOT4oxYNTRlVUqJvBrm3uO1t+zRSDTay35sdVZC1GdoTQmvM/b916d
	 p/Kh7nEHqXC/JrufZn8iXnYEN4YRVADdXX6fGJyh5GAFg8VIOfK4WddO7XJUP8ACe+
	 ux0DmBoP6r4gs9lcMuhWC4ELi8D0M/rhIy/S7zd2fSTv5cjM7H3eqr7OsP/x5P0jVw
	 8C0JuzIoF8jiA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 01 Sep 2026 22:02:10 +0200
Subject: [PATCH v2 05/13] regulator: ab8500: Test dedicated enable bits
 only
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-5-fe88b01829bf@kernel.org>
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

Some regulator control registers have independent enable and low-power
bits. is_enabled() currently tests their combined update mask, so an
off regulator with its low-power bit set is incorrectly reported as
enabled.

Add an optional enable mask and use it for VINTCORE, AB8500 TVOUT,
AB8505 ADC, and AB8505 VAUX5/6. Regulators whose two-bit field encodes
the complete operating state continue to test the full update mask.

References: AB8500 User Manual, UM0836 Rev 3, p. 214;
AB8505 User Manual, DM00046744 Rev 3, pp. 171-172 and 223

Fixes: 65e03ed2d0cd ("regulators: Fixed errors in ab8500 register mapping")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 42cb8dfdc7c9..05c6b9c7af0c 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -162,6 +162,7 @@ struct ab8500_shared_mode {
  * @update_bank: bank to control on/off
  * @update_reg: register to control on/off
  * @update_mask: mask to enable/disable and set mode of regulator
+ * @enable_mask: optional mask for an enable bit separate from the mode bit
  * @update_val: bits holding the regulator current mode
  * @update_val_idle: bits to enable the regulator in idle (low power) mode
  * @update_val_normal: bits to enable the regulator in normal (high power) mode
@@ -183,6 +184,7 @@ struct ab8500_regulator_info {
 	u8 update_bank;
 	u8 update_reg;
 	u8 update_mask;
+	u8 enable_mask;
 	u8 update_val;
 	u8 update_val_idle;
 	u8 update_val_normal;
@@ -377,6 +379,7 @@ static int ab8500_regulator_is_enabled(struct regulator_dev *rdev)
 {
 	int ret;
 	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
+	u8 enable_mask;
 	u8 regval;
 
 	if (info == NULL) {
@@ -392,13 +395,15 @@ static int ab8500_regulator_is_enabled(struct regulator_dev *rdev)
 		return ret;
 	}
 
+	enable_mask = info->enable_mask ? info->enable_mask : info->update_mask;
+
 	dev_vdbg(rdev_get_dev(rdev),
 		"%s-is_enabled (bank, reg, mask, value): 0x%x, 0x%x, 0x%x,"
 		" 0x%x\n",
 		info->desc.name, info->update_bank, info->update_reg,
-		info->update_mask, regval);
+		enable_mask, regval);
 
-	if (regval & info->update_mask)
+	if (regval & enable_mask)
 		return 1;
 	else
 		return 0;
@@ -833,6 +838,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x03,
 		.update_reg		= 0x80,
 		.update_mask		= 0x44,
+		.enable_mask		= 0x04,
 		.update_val		= 0x44,
 		.update_val_idle	= 0x44,
 		.update_val_normal	= 0x04,
@@ -861,6 +867,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x03,
 		.update_reg		= 0x80,
 		.update_mask		= 0x82,
+		.enable_mask		= 0x02,
 		.update_val		= 0x02,
 		.update_val_idle	= 0x82,
 		.update_val_normal	= 0x02,
@@ -1070,6 +1077,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x01,
 		.update_reg		= 0x55,
 		.update_mask		= 0x18,
+		.enable_mask		= 0x10,
 		.update_val		= 0x10,
 		.update_val_idle	= 0x18,
 		.update_val_normal	= 0x10,
@@ -1092,6 +1100,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x01,
 		.update_reg		= 0x56,
 		.update_mask		= 0x18,
+		.enable_mask		= 0x10,
 		.update_val		= 0x10,
 		.update_val_idle	= 0x18,
 		.update_val_normal	= 0x10,
@@ -1113,6 +1122,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x03,
 		.update_reg		= 0x80,
 		.update_mask		= 0x44,
+		.enable_mask		= 0x04,
 		.update_val		= 0x04,
 		.update_val_idle	= 0x44,
 		.update_val_normal	= 0x04,
@@ -1141,6 +1151,7 @@ static struct ab8500_regulator_info
 		.update_bank		= 0x03,
 		.update_reg		= 0x80,
 		.update_mask		= 0x82,
+		.enable_mask		= 0x02,
 		.update_val		= 0x02,
 		.update_val_idle	= 0x82,
 		.update_val_normal	= 0x02,

-- 
2.55.0

