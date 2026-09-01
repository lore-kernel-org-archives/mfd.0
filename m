Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D905A4562B7;
	Tue,  1 Sep 2026 20:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292961; cv=none; b=MdRp/P3+fZJBHG5jVGIyfqwNP6u4JDUNoyZQrastGxxB7s8se9obsW+4K8gvM1j1WWtdg6scg9jbex57hr0u25tjOj3CzD1XEVbSZ0y8n1uOrU959kzLOXQMAHCwQE2dc/2rU8YlQ1ofqI+fbejvmzqTxjKal3hAzQEixggg0NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292961; c=relaxed/simple;
	bh=o2g5BJsdLmgKohvdPEwdQASKwo6XZOlBHx9JkteNmOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V93Ic8JWxOt8dlgH3Gu4Mqxpov4Me5VMXQI4jC+5DA4MFfQ99cj7a8aEDj4Fif7z4V9mRywRj467tnX2kz/xVkC5QSDu5tSE9DR0oChOpV3lY/2CUmb08L7ekL/og6BzwsNWuJH/4gB2LMvjmGAPgEmKTXH5MMx+QqL6FWxk4dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjDCHAFc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjDCHAFc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207C81F000E9;
	Tue,  1 Sep 2026 20:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292950;
	bh=XgsPq9RhCd3/kciawcNEGIUOwsxaXN47MCNNBD2JLps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kjDCHAFc2tF9r+VTnmlNnmRUYpsU6btS0UCbZBggQsXK9tBhUDA2T6WFLmEoJuqr9
	 RsI/Rhd4NOnpS/8jc51SYU7UhxWCukN93sXdAyay9A6NvbANbCusHCCN53SS/1gj43
	 rZ7L1TJ1ufD7iJ0uU7UGQvclqRSPj9aKRhLiUxyoc3cc2kbshBsqnrgqORBZFa4ylB
	 nenp5KWpz4DM6rBlsor0zjjICdjupjfdF6SILETH3x0O4/Hkvgf9fJWxDZ8HV1UIz6
	 OXqwNsbz0pTnjQjudxihgAf3CqeULCV4v5jvhwmq/oR12N9t+YuDjcPuDo69F5X3sQ
	 baeL0OQuGzzyw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 01 Sep 2026 22:02:12 +0200
Subject: [PATCH v2 07/13] regulator: ab8500: Use linear ranges for LDO
 voltages
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-7-fe88b01829bf@kernel.org>
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

VINTCORE uses consecutive selectors with uniform 25 mV steps, with
AB8505 duplicating the highest voltage at selector 7. AB8505 VAUDIO
likewise has uniform 100 mV steps followed by a duplicate selector for
its highest voltage.

Describe these selector encodings with linear ranges and the matching
regulator helpers instead of enumerated voltage tables. Keep tables for
the irregular and non-monotonic VAUX and VANA selectors.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 74 +++++++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index e4c3502c8dbc..d1540099104c 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -258,25 +258,13 @@ static const unsigned int ldo_vaux56_voltages[] = {
 	2790000,
 };
 
-static const unsigned int ldo_vintcore_voltages[] = {
-	1200000,
-	1225000,
-	1250000,
-	1275000,
-	1300000,
-	1325000,
-	1350000,
+static const struct linear_range ldo_vintcore_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1200000, 0, 6, 25000),
 };
 
-static const unsigned int ldo_vintcore_ab8505_voltages[] = {
-	1200000,
-	1225000,
-	1250000,
-	1275000,
-	1300000,
-	1325000,
-	1350000,
-	1350000,
+static const struct linear_range ldo_vintcore_ab8505_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1200000, 0, 6, 25000),
+	REGULATOR_LINEAR_RANGE(1350000, 7, 7, 0),
 };
 
 static const unsigned int fixed_1200000_voltage[] = {
@@ -306,15 +294,10 @@ static const unsigned int ldo_vana_voltages[] = {
 	1225000,
 };
 
-static const unsigned int ldo_vaudio_voltages[] = {
-	2000000,
-	2100000,
-	2200000,
-	2300000,
-	2400000,
-	2500000,
-	2600000,
-	2600000,	/* Duplicated in Vaudio and IsoUicc Control register. */
+static const struct linear_range ldo_vaudio_ranges[] = {
+	REGULATOR_LINEAR_RANGE(2000000, 0, 6, 100000),
+	/* Duplicated in Vaudio and IsoUicc Control register. */
+	REGULATOR_LINEAR_RANGE(2600000, 7, 7, 0),
 };
 
 static DEFINE_MUTEX(shared_mode_mutex);
@@ -720,13 +703,27 @@ static const struct regulator_ops ab8500_regulator_volt_mode_expand_ops = {
 	.list_voltage		= regulator_list_voltage_table,
 };
 
-static const struct regulator_ops ab8500_regulator_volt_ops = {
+static const struct regulator_ops ab8500_regulator_linear_range_volt_mode_ops = {
+	.enable			= ab8500_regulator_enable,
+	.disable		= ab8500_regulator_disable,
+	.is_enabled		= ab8500_regulator_is_enabled,
+	.get_optimum_mode	= ab8500_regulator_get_optimum_mode,
+	.set_mode		= ab8500_regulator_set_mode,
+	.get_mode		= ab8500_regulator_get_mode,
+	.get_voltage_sel	= ab8500_regulator_get_voltage_sel,
+	.set_voltage_sel	= ab8500_regulator_set_voltage_sel,
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.map_voltage		= regulator_map_voltage_linear_range,
+};
+
+static const struct regulator_ops ab8500_regulator_linear_range_volt_ops = {
 	.enable		= ab8500_regulator_enable,
 	.disable	= ab8500_regulator_disable,
 	.is_enabled	= ab8500_regulator_is_enabled,
 	.get_voltage_sel = ab8500_regulator_get_voltage_sel,
 	.set_voltage_sel = ab8500_regulator_set_voltage_sel,
-	.list_voltage	= regulator_list_voltage_table,
+	.list_voltage	= regulator_list_voltage_linear_range,
+	.map_voltage	= regulator_map_voltage_linear_range,
 };
 
 static const struct regulator_ops ab8500_regulator_mode_ops = {
@@ -836,12 +833,13 @@ static struct ab8500_regulator_info
 	[AB8500_LDO_INTCORE] = {
 		.desc = {
 			.name		= "LDO-INTCORE",
-			.ops		= &ab8500_regulator_volt_mode_ops,
+			.ops		= &ab8500_regulator_linear_range_volt_mode_ops,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8500_LDO_INTCORE,
 			.owner		= THIS_MODULE,
-			.n_voltages	= ARRAY_SIZE(ldo_vintcore_voltages),
-			.volt_table	= ldo_vintcore_voltages,
+			.n_voltages	= 7,
+			.linear_ranges	= ldo_vintcore_ranges,
+			.n_linear_ranges = ARRAY_SIZE(ldo_vintcore_ranges),
 			.enable_time	= 750,
 		},
 		.load_lp_uA		= 5000,
@@ -1121,12 +1119,13 @@ static struct ab8500_regulator_info
 	[AB8505_LDO_INTCORE] = {
 		.desc = {
 			.name		= "LDO-INTCORE",
-			.ops		= &ab8500_regulator_volt_mode_ops,
+			.ops		= &ab8500_regulator_linear_range_volt_mode_ops,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_LDO_INTCORE,
 			.owner		= THIS_MODULE,
-			.n_voltages	= ARRAY_SIZE(ldo_vintcore_ab8505_voltages),
-			.volt_table	= ldo_vintcore_ab8505_voltages,
+			.n_voltages	= 8,
+			.linear_ranges	= ldo_vintcore_ab8505_ranges,
+			.n_linear_ranges = ARRAY_SIZE(ldo_vintcore_ab8505_ranges),
 		},
 		.load_lp_uA		= 5000,
 		.update_bank		= 0x03,
@@ -1169,12 +1168,13 @@ static struct ab8500_regulator_info
 	[AB8505_LDO_AUDIO] = {
 		.desc = {
 			.name		= "LDO-AUDIO",
-			.ops		= &ab8500_regulator_volt_ops,
+			.ops		= &ab8500_regulator_linear_range_volt_ops,
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_LDO_AUDIO,
 			.owner		= THIS_MODULE,
-			.n_voltages	= ARRAY_SIZE(ldo_vaudio_voltages),
-			.volt_table	= ldo_vaudio_voltages,
+			.n_voltages	= 8,
+			.linear_ranges	= ldo_vaudio_ranges,
+			.n_linear_ranges = ARRAY_SIZE(ldo_vaudio_ranges),
 		},
 		.update_bank		= 0x03,
 		.update_reg		= 0x83,

-- 
2.55.0

