Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159013BBFC5;
	Tue,  1 Sep 2026 20:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292946; cv=none; b=GINU4YRzyVa524LYD6rF+i8CMvpse0eOGSKCX1yT0+XNEqwnBY8WLrzhNJ9izGwIMyAxHC7qqvBBNCm6196W+iVB/muLkVDqZlaHoTPSSPjvzbsvud6ZyoAvXSMJRWHCJ03WtC1pv5YTSzzgPUWjCGd+fj547gdpRNXvRpMprtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292946; c=relaxed/simple;
	bh=ef+oXwxcVa8FKk7hEmWZPLiJFVo/qq/f25Yz8mXsKCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmM10b3e3Oxm6D/BjSfDFQTnE+3FtoxecdQdCnLv6r04dEem7oCS0ZZHjNQ/eh87CHrq5CxiWHadaupAC7MA97WXrCod/Kh2b557yK383eQets0RpfCzh4JHeY+vG6uCyOGYugHdeR05gPKxqoy6qjZ/ylH7RwclpDCMu7QfSHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLx656p9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLx656p9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316AC1F00A3D;
	Tue,  1 Sep 2026 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292937;
	bh=Fr64MGYLyhfXI/VcMfbC/lq4kwHH2zRzUBhtquow60k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kLx656p9YIUKvuucofBaW1UPYGP4BGcalEeQ5jPB0boIGpBc8+xUzCRy1DXiGW2Yq
	 maZHakdKLAbgalDittYeDninZyWvE5Hpr7kQg8Sb1erXyDbnb377QlretbXEZKgeRP
	 6LtUZBYiSprHlNY8iH4zBgShUZZpYyTjht3d/rfWrXJVFlzecBNsJXquiDtSC0rq5K
	 Tq47wK8SEmyaLhCBXGcSyJy85+7Km3wt/V4dYjt09+QWB/tu0kNexn1sdk18FkHgGA
	 KNZZfW3AtgB/Uknca6ftT9H03AKC5iySbQEb+hUTFaSUbNpFjElWhI4YVJCiZlHgLN
	 TQwxQpthWhsYw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 01 Sep 2026 22:02:07 +0200
Subject: [PATCH v2 02/13] regulator: ab8500: Add AB8505 VAUX3 3.05 V
 setting
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-2-fe88b01829bf@kernel.org>
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

AB8505 has an additional VAUX3 voltage setting which is not encoded
in the normal three-bit selector. ArmRegu2.Vaux3Sel3 overrides that
selector and selects 3.05 V.

Add the missing voltage and use the override bit as an extended
selector. Program the ordinary selector before clearing the override
so VAUX3 does not briefly switch to a stale voltage.

Reference: AB8505 User Manual, DM00046744 Rev 3, pp. 229 and 254

Fixes: 547f384f33db ("regulator: ab8500: add support for ab8505")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 101 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index ca59406d42a8..07d96f8ff944 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -173,6 +173,7 @@ struct ab8500_shared_mode {
  * @voltage_bank: bank to control regulator voltage
  * @voltage_reg: register to control regulator voltage
  * @voltage_mask: mask to control regulator voltage
+ * @expand_register: additional register used to select an extra voltage
  */
 struct ab8500_regulator_info {
 	struct device		*dev;
@@ -193,6 +194,12 @@ struct ab8500_regulator_info {
 	u8 voltage_bank;
 	u8 voltage_reg;
 	u8 voltage_mask;
+	struct {
+		u8 voltage_limit;
+		u8 voltage_bank;
+		u8 voltage_reg;
+		u8 voltage_mask;
+	} expand_register;
 };
 
 /* voltage tables for the vauxn/vintcore supplies */
@@ -226,6 +233,18 @@ static const unsigned int ldo_vaux3_voltages[] = {
 	2910000,
 };
 
+static const unsigned int ldo_vaux3_ab8505_voltages[] = {
+	1200000,
+	1500000,
+	1800000,
+	2100000,
+	2500000,
+	2750000,
+	2790000,
+	2910000,
+	3050000,
+};
+
 static const unsigned int ldo_vaux56_voltages[] = {
 	1800000,
 	1050000,
@@ -593,6 +612,64 @@ static int ab8500_regulator_set_voltage_sel(struct regulator_dev *rdev,
 	return ret;
 }
 
+static int ab8500_regulator_get_voltage_sel_expand(struct regulator_dev *rdev)
+{
+	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
+	u8 regval;
+	int ret;
+
+	if (!info)
+		return -EINVAL;
+
+	ret = abx500_get_register_interruptible(info->dev,
+			info->expand_register.voltage_bank,
+			info->expand_register.voltage_reg, &regval);
+	if (ret < 0) {
+		dev_err(rdev_get_dev(rdev),
+			"couldn't read voltage expand reg for regulator\n");
+		return ret;
+	}
+
+	if (regval & info->expand_register.voltage_mask)
+		return info->expand_register.voltage_limit;
+
+	return ab8500_regulator_get_voltage_sel(rdev);
+}
+
+static int ab8500_regulator_set_voltage_sel_expand(struct regulator_dev *rdev,
+						   unsigned int selector)
+{
+	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
+	u8 regval;
+	int ret;
+
+	if (!info)
+		return -EINVAL;
+
+	if (selector > info->expand_register.voltage_limit)
+		return -EINVAL;
+
+	if (selector < info->expand_register.voltage_limit) {
+		ret = ab8500_regulator_set_voltage_sel(rdev, selector);
+		if (ret < 0)
+			return ret;
+
+		regval = 0;
+	} else {
+		regval = info->expand_register.voltage_mask;
+	}
+
+	ret = abx500_mask_and_set_register_interruptible(info->dev,
+			info->expand_register.voltage_bank,
+			info->expand_register.voltage_reg,
+			info->expand_register.voltage_mask, regval);
+	if (ret < 0)
+		dev_err(rdev_get_dev(rdev),
+			"couldn't set voltage expand reg for regulator\n");
+
+	return ret;
+}
+
 static const struct regulator_ops ab8500_regulator_volt_mode_ops = {
 	.enable			= ab8500_regulator_enable,
 	.disable		= ab8500_regulator_disable,
@@ -605,6 +682,18 @@ static const struct regulator_ops ab8500_regulator_volt_mode_ops = {
 	.list_voltage		= regulator_list_voltage_table,
 };
 
+static const struct regulator_ops ab8500_regulator_volt_mode_expand_ops = {
+	.enable			= ab8500_regulator_enable,
+	.disable		= ab8500_regulator_disable,
+	.is_enabled		= ab8500_regulator_is_enabled,
+	.get_optimum_mode	= ab8500_regulator_get_optimum_mode,
+	.set_mode		= ab8500_regulator_set_mode,
+	.get_mode		= ab8500_regulator_get_mode,
+	.get_voltage_sel	= ab8500_regulator_get_voltage_sel_expand,
+	.set_voltage_sel	= ab8500_regulator_set_voltage_sel_expand,
+	.list_voltage		= regulator_list_voltage_table,
+};
+
 static const struct regulator_ops ab8500_regulator_volt_ops = {
 	.enable		= ab8500_regulator_enable,
 	.disable	= ab8500_regulator_disable,
@@ -908,12 +997,12 @@ static struct ab8500_regulator_info
 	[AB8505_LDO_AUX3] = {
 		.desc = {
 			.name		= "LDO-AUX3",
-			.ops		= &ab8500_regulator_volt_mode_ops,
+			.ops		= &ab8500_regulator_volt_mode_expand_ops,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_LDO_AUX3,
 			.owner		= THIS_MODULE,
-			.n_voltages	= ARRAY_SIZE(ldo_vaux3_voltages),
-			.volt_table	= ldo_vaux3_voltages,
+			.n_voltages	= ARRAY_SIZE(ldo_vaux3_ab8505_voltages),
+			.volt_table	= ldo_vaux3_ab8505_voltages,
 		},
 		.load_lp_uA		= 5000,
 		.update_bank		= 0x04,
@@ -925,6 +1014,12 @@ static struct ab8500_regulator_info
 		.voltage_bank		= 0x04,
 		.voltage_reg		= 0x21,
 		.voltage_mask		= 0x07,
+		.expand_register = {
+			.voltage_limit	= 8,
+			.voltage_bank	= 0x04,
+			.voltage_reg	= 0x01,
+			.voltage_mask	= 0x10,
+		},
 	},
 	[AB8505_LDO_AUX4] = {
 		.desc = {

-- 
2.55.0

