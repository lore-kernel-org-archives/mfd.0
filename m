Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AD3306B1B;
	Sun, 30 Aug 2026 22:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788129847; cv=none; b=ZKQR6bMNzNcRCX7nvET58sxL+vPg996cSvZe4gtC8ZpTYFaIUftAbd6pVY4SO7rDHrQP+Fst9BhmMV0Brl3B2QTzKwcKK3wclG702TZdkO+W2OZAbWGI3lqKonelCkUblEJwu7zz39bzkxDufV+T/2ofUYWq0HUhmBni1qpNGpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788129847; c=relaxed/simple;
	bh=zwEor6K8yGoFURlxDvbOjCkK1oLF41ASBn1v919rW7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gK0CfL5zdcd8jGpRBl5TEq3mDvZynfJEk5UsN/x8OCLYIFHK9cgYsy2W6v76gGYm0qBJrdhpg5V9cNxqQ3bMrOFUvcIiUgyGUff7XXIipfK3baWKJrKN7fgItZqZ530mYdARsLqwT+32hgGbTnr1joxlGEAdmmtA/teAuVxFYYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K02HezOv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K02HezOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5957A1F00A3E;
	Sun, 30 Aug 2026 22:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788129846;
	bh=S6FY7ZetqMty4OJBLyaiR50VfGzmS5JdgvQQAtmW5og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K02HezOvDeZdYiDXYjAWmkf23qSADHrZhwZ3L/tntTNnXqXp97OqcDCnSTXZy98iI
	 /8d4LjOGo7mNl8vjMJVK0q6Q6nFIpTe3RXaXI0h0ELRgOl7bpgno+uDqm+oNwFHNCX
	 NqOiztbYuFqng+fclmP783EllrUVABtpj0hTFWxGW7TbEPFSjxY0Okqs0XTFcFYQ/M
	 hwrVgZDUDfELlQ7aslo5zD91KzqpZLrlYOrgP82rEYCwkOfXPNsW/3JJVC2S5Js5q3
	 GHvU2OeCIdrvsjOMWtTxyk/HjyaM30roY2v7l5+9LPRMMs0c7TYVtz8OI7fVXxqLHY
	 UqacnliVs0+ZQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 00:43:30 +0200
Subject: [PATCH 01/13] regulator: ab8500: Fix AB8505 VANA voltage selectors
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ux500-dts-snowball-regulator-v1-1-fe279fff5e18@kernel.org>
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

The AB8505 VANA voltage table assumes selector 0 represents 1.05 V
and all eight selectors increase linearly. Selector 0 actually
represents 1.2 V. Selectors 1 through 6 cover 1.05 V through
1.175 V, and selector 7 represents 1.225 V.

Correct the table so each selector reports and programs the documented
voltage.

Reference: AB8505 User Manual, DM00046744 Rev 3, p. 257

Fixes: 8a3b1b8703fe ("regulator: ab8500: Add voltage selection for AUDIO and ANA on AB8505")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 3705c98b0713..ca59406d42a8 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -264,13 +264,13 @@ static const unsigned int fixed_2050000_voltage[] = {
 };
 
 static const unsigned int ldo_vana_voltages[] = {
+	1200000,
 	1050000,
 	1075000,
 	1100000,
 	1125000,
 	1150000,
 	1175000,
-	1200000,
 	1225000,
 };
 

-- 
2.55.0

