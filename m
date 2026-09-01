Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9245A2B9;
	Tue,  1 Sep 2026 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292939; cv=none; b=GsQK7fSDO3Xvw0NMJNQRleyxRTDqf7R5cHtNMw/uF9lvVWtaeqiXRULqBgIfTbY830TbdVTn4w9cvi4YetNZNfDq6Dyq/qP73xonmlKlis6CvqvJsFjnFkLXOg6vEfarxzx4aMrA20dzY9nf4tL9OKGPw4xvi5p2eeGMJ3+fIIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292939; c=relaxed/simple;
	bh=zwEor6K8yGoFURlxDvbOjCkK1oLF41ASBn1v919rW7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0NRHWot06XuCh/ejIz3K0sznk53MsD14uMFxzdLwgra9QaIWO0BjzjnJRcZDq4/wSpaYQ1Wg6dijzJPPHiK4/wBd5HXakCMuCgPuBiizlHJYWXIlsiMOXa8t2CUNyNxFPH9dilygDINYRGtD7WlI2nypi4L45gd5zYivKbqGpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RA+cd+gG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RA+cd+gG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981C51F00A3A;
	Tue,  1 Sep 2026 20:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292934;
	bh=S6FY7ZetqMty4OJBLyaiR50VfGzmS5JdgvQQAtmW5og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RA+cd+gGlx/AbcFuVMqDNC2IVFEfJ4kK+/OIJ/4iwLxHrev8yBKHs2CFd1dpi0Tys
	 I6b6dCk89nl1EvD9wgu7frD1lNj6AgqjfSaLW8tfeoIX4mL21hG5OYNknVlbrAGbcY
	 w/0bCK2wgMnnzm0Rcg409cRkRyU7tpzrkX/YzfA2HhHF3dn4ZZcwnEsIVoB4fwe49R
	 gLf7+akQujaFNHGJNehR2oDxDPBWbeRHMad1Tfg7+ftV03E3vyZr4Ga42TfqVpjG9Q
	 iHP5tDc5zgA0GBJmbavyljTgnWVQq6ImS8WPBmga+xAO8gf8NIHbDvOi254trb3q+g
	 J8yGy34ajeGIA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 01 Sep 2026 22:02:06 +0200
Subject: [PATCH v2 01/13] regulator: ab8500: Fix AB8505 VANA voltage
 selectors
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-1-fe88b01829bf@kernel.org>
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

