Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55B34C130;
	Sun, 30 Aug 2026 22:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788129853; cv=none; b=L/w7MjCoRmtQcey5Zn8ygka0o6iT0r98ct7vUNJi9hmQlZd3xFPdeYCeXFPl28PBWHik/XoGrQchgAJhXg9raa4GxW7onMyDMkJvvrJpBz4zU1JxKIZQplTUMxNUT5by/gzCmcyp+MQo7HjM/y2z1mUFQ5LWTDeIHdWDUdvTo8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788129853; c=relaxed/simple;
	bh=cB+fFscuIXMfLe/OVF0fbusXR/2htOwHCywwC00gyro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QUROzIHulvk5VV24pnEJCwE5cPxNFL/paAN9c2yMbkkN8KX3PDOKWcP17+NzWDGKucwNpphcaW1t8zEvmq/0U4Hf8tp6CVaob8afjvwetsFQQ6nO2M6ONnl0HqJe1XyX4i7HOSuHIOJ08E2uzB+XMb9I+yU0hGZesusOq182EMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuvH3XN5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuvH3XN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D041F00A3D;
	Sun, 30 Aug 2026 22:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788129851;
	bh=uadjvHfGlhBu4sVq6tllQ+UPTpmDztODzyfXrEERPV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZuvH3XN5qyRwOEEqBEI1WbuHyVjB3uq31C8mPbnUNYgOK+Gyn00s73xgIAnGQrLj1
	 WTN0CstEwe/4oIWpV2/ikneTs85isEk/jndKwbEcb7TR1vY2v9s2tH0PfvOD3WE3IB
	 63b8Br/mL4xd+VwrHlDFfrHYL9nD6rdalj+0cfjcAumhudFJ+6930Wut/Rq1WRcWCd
	 yHlonO4lrEdraCR9Si8HlXiZYTky/NWl9ENCxAOKymM3E3TWLzL+uHokLe275e1p5E
	 nly76uuRJlRoC1fceliT9PC1VUfOie/A2yCKOaDtlm8WD44ApK0nfn7xI7ZuX9gvlF
	 v/s2KTaxYeD4w==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 00:43:32 +0200
Subject: [PATCH 03/13] regulator: ab8500: Handle AB8505 VINTCORE selector 7
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ux500-dts-snowball-regulator-v1-3-fe279fff5e18@kernel.org>
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

The AB8505 VINTCORE table exposes only selectors 0 through 6. The
hardware also accepts selector 7 and maps it to 1.35 V, just like
selector 6. Omitting it can make an OTP-programmed selector 7 appear
invalid to the regulator core.

Give AB8505 its own eight-entry selector table while leaving the
AB8500 table unchanged.

Reference: AB8505 User Manual, DM00046744 Rev 3, p. 223

Fixes: 547f384f33db ("regulator: ab8500: add support for ab8505")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 07d96f8ff944..5e24e6cdc773 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -266,6 +266,17 @@ static const unsigned int ldo_vintcore_voltages[] = {
 	1350000,
 };
 
+static const unsigned int ldo_vintcore_ab8505_voltages[] = {
+	1200000,
+	1225000,
+	1250000,
+	1275000,
+	1300000,
+	1325000,
+	1350000,
+	1350000,
+};
+
 static const unsigned int fixed_1200000_voltage[] = {
 	1200000,
 };
@@ -1095,8 +1106,8 @@ static struct ab8500_regulator_info
 			.type		= REGULATOR_VOLTAGE,
 			.id		= AB8505_LDO_INTCORE,
 			.owner		= THIS_MODULE,
-			.n_voltages	= ARRAY_SIZE(ldo_vintcore_voltages),
-			.volt_table	= ldo_vintcore_voltages,
+			.n_voltages	= ARRAY_SIZE(ldo_vintcore_ab8505_voltages),
+			.volt_table	= ldo_vintcore_ab8505_voltages,
 		},
 		.load_lp_uA		= 5000,
 		.update_bank		= 0x03,

-- 
2.55.0

