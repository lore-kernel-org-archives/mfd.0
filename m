Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6323D2F0661;
	Sun, 30 Aug 2026 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788129863; cv=none; b=S/AIYUulD1d++eiieKcuII+77YGwrf7GJMDPifIdq9fk1faWNZGDfCPPWBWvDAboVnd/Z445/p3BjwqRkfDipPSRrVX11jZ00JkCfzLoDt7F3jzddBM5SJzYuYeSGWcO9zGNcj/D6xpUKcAP7sHTZHLq7ap3LU1PYwrj4simF00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788129863; c=relaxed/simple;
	bh=o2g5BJsdLmgKohvdPEwdQASKwo6XZOlBHx9JkteNmOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3eXRA+tV2ApqaiqRV43WmrIddXPQW07qT/Sy5Q1ZuTEKVNJsEEENV99ahta1sALjH0H9fMc14R75aOHon3bIW52EG5BhMcNJ6Ay6Zm1uqozxSDlykmWerQc6KrWvW/CpiYn4SsZzb2RROIjsW1Sx2YxHSoX1hFPrx4MYiBgXfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEoclyZH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEoclyZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92121F000E9;
	Sun, 30 Aug 2026 22:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788129862;
	bh=XgsPq9RhCd3/kciawcNEGIUOwsxaXN47MCNNBD2JLps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VEoclyZHd8UmMk8ybTBL+W69joc46qjvGE4xd/8ywcrHlo2k5BTdHk1Y6qyTUJrCz
	 /Q6nfu4J5SAt8DjKJ1GvXQmYzJZoQ0fTIIXmdArQv9sZNUEQUT4otAR/ISLeg/pvHO
	 JnKzr+nXTrS9OQpRyXvVFaNHKAXqt7fLoeaPd5oNt4LpxW2tV6bG/BE8fEZaKVJtou
	 4zBYIhV0Rp1rYpIxj9YizfDwn1t1FWKItICeeAF56rXUnWmzBWIDXmOrByHG9JGHkh
	 U9zCqN1gLNi9aZ9yBgNoNRDP3Lh0nS/pZ312tyZa/CUAHiFVnY+202xkr5TbyzUR4g
	 ABqrgiDw6MZDw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 00:43:36 +0200
Subject: [PATCH 07/13] regulator: ab8500: Use linear ranges for LDO
 voltages
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ux500-dts-snowball-regulator-v1-7-fe279fff5e18@kernel.org>
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

