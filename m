Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5EE3A2549;
	Tue,  1 Sep 2026 20:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292946; cv=none; b=C8DQlYaAdOFRH73BfQshqBkczoR6oTnrNy0Vy/zdIIPoL9GvKyKCO8X9gaBAg/Pt0WihNBBeoRMiT6c4VirvUQ/sm4SCdfDd5k/SynSRWXyFZCcPu0btHd4rW7yu0Pr7D9RDbM5tho+Mkr/3yfJ77sd1VzUUFTpwKP9m8okZqoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292946; c=relaxed/simple;
	bh=cB+fFscuIXMfLe/OVF0fbusXR/2htOwHCywwC00gyro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FN2z71XE8IObW4G+7wUdgWyJUCRYhUSkyXNZjsjc4od3QYyWSNTE8NojSBeKf2dydjN9M4bN7zUR4uW5xQpqh6QZX7yUqNPM/c8f64DmWfPteOt0rFfZBQb2QXxuusyiCmyoTxaAmFsWLl2hQV9LZfG+mF5Z3Fl4F+jZ7R4v3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aASAKHa/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aASAKHa/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDC81F000E9;
	Tue,  1 Sep 2026 20:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292939;
	bh=uadjvHfGlhBu4sVq6tllQ+UPTpmDztODzyfXrEERPV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aASAKHa/04lEhh9/nN9f/bjwyztPShTfyBxvAuIFvy/h5hTvqjKYS/FesOIbP9zS9
	 1rF40HL5uAjS9ro3muoYPfcXQv2/5E4DWAz+rJk71D1FpY9rfEpCa2dDCBgShcoozu
	 lvsujz3gNav79j/w5eyXWnmYTkYWio16YV0YNwVc1NJSiAAywXpQKViPKa0leiKVOr
	 xj5a2+yxDkl3Xp7X0FEBEILQVOE6WAXV+YbF76HJ4P61HaxFZYBReGXR2grsZTdX4W
	 SkQzJutM367bWuB32kJXCYWuYcb9yiD12Qlt4RQxNCi3lOtQZDAye5j3T/W+niWNTo
	 rAmGyhggVTR/g==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 01 Sep 2026 22:02:08 +0200
Subject: [PATCH v2 03/13] regulator: ab8500: Handle AB8505 VINTCORE
 selector 7
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-3-fe88b01829bf@kernel.org>
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

