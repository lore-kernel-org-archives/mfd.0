Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBBB306B1B;
	Sun, 30 Aug 2026 22:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788129858; cv=none; b=CJMrrz2f2eB2eLOhjSYAJGraNGNh9Q2VzgOwqNqEvMDqxFIzMYmikrlpxzp+w+Temjmtrnq+02cxXlPI23zxIXDaK/5BAV1z1IiX7qWoVkM08vGH8Gk2aJfzB1Au1KBckHsadUkaqmVo6l/1tiGNtt0Yplc/vlcVLCQY4H5KDbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788129858; c=relaxed/simple;
	bh=sm7o6cCzp8flppDMwW5Z+rofLj0ey1Q6EInHqIwTGW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxVpovfT10oMqwjaNOFTxrYTLXPBdjWSuZkEHRQO7FgdbGz2PSAgIdZ5rns0+y3W4nxFmFGVdE3DY8aH3SgsyMKBa/fKjgSqBBqAoENozoMfMF/r+znX9QKbdxMtV5Y8T2k/MJGbXOU6LAkEvw2JWwQzHJ4WwduPQ2WoV5WQZP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYetFE17; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYetFE17"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA8B1F00A3D;
	Sun, 30 Aug 2026 22:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788129856;
	bh=cYxLvSFl/YWS+JRovkLaSv4pMP7UxSGmiLqc9zYTVx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iYetFE17RlB7YQps7YtX+uHZwjV7pGGxjTWpv/jgi/Fkc65T5ixvHu4wlnI1uwWCG
	 mOHIda8FCDZw+HmxwYpeS+88ELU6ii9mxq4Ul9cgXw67krt89UYv65DeQw4T429pWo
	 cmB5/ElA0Uyosp3ehgp4O/YJiyu7Ga7jbwP2T8O6AyNAWn0n6u2Nd8AziRU7Bsw3XT
	 hpCTyjuH0m3x2COGMRRXSGQQS5VNooJhJthtm1Xn9sqi5FE7CgBu0OqJRVl/vuo+is
	 sGXSGSA3AOp8n4JeqOWHaN7nyYmo6KT3KGOB6kgakJTnwEzLfKZx0r+fhC/gWuTIAM
	 M0vGTG8/uwcsQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 00:43:34 +0200
Subject: [PATCH 05/13] regulator: ab8500: Test dedicated enable bits only
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ux500-dts-snowball-regulator-v1-5-fe279fff5e18@kernel.org>
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

