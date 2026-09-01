Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D5D4A2A58;
	Tue,  1 Sep 2026 20:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294071; cv=none; b=hmSandAel1WQL05W0EnsGU1PmiNf39SQbJkXtwfMFQRoOAJvV6FkJMhMOt/nZqBUy4NxpSnx4GXX1T7qAombNJ0NSUoTdL2/V6YFG29SOWZiJTTrQcn9gsTwmt0/GCK2X+/aoc/I5F7GzsKinRbKYODZlA+dzb+wk+84nO5Dv88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294071; c=relaxed/simple;
	bh=mRl+WWx8UYWnZ3C239CRjigD7zeQJYKbEvBR3Z4kWDI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aEIlTwlGblV4426o0wrkRp6K9OfpS5hf2x+G5/SYgDrtePLF7IBCu/ZYnzQcrVMjhQ6DqsF27kzN6LIrx16iXpnOAIxSPnjrWH3E44xfq39KaZ08df8SxZ0yZLTG44+AVGTBsusYFNJ25oYWw1QHpIJAIIPfdDb3YPrs23zOPlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQtp+ADO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQtp+ADO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1999E1F00A3F;
	Tue,  1 Sep 2026 20:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294069;
	bh=mRl+WWx8UYWnZ3C239CRjigD7zeQJYKbEvBR3Z4kWDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OQtp+ADOaK1ml8RPN55FcVDxccZVYG8ttyQdVothqA6vwToLkGDPX+bhYBkKX3y66
	 KPfCqLjdwSQONqxPR+HtNMYFUGlVjwu85xi7HCmKXNpC1emGZVhJdsaLli/mlTJoxg
	 ijsZINV4cY3mbDls4rnz+VsTJsA4CTXFYpAqPPnCJndpr6G+s9Xo2madsd11F/4WpI
	 aLoF+vdiyXh1QgDnv9M/12bKFq4uZUtCVQgb9/LCZPk9Q355IF9Kfj/tJUkmiUwKOp
	 VoW5iI9ykj/DgRX0GsPLOICW3kzXUbwbS+WONL0SPXKdJdRqJQLBKku6WOjnjObYCu
	 XprTj51VgCC8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/13] regulator: ab8500: Test dedicated enable bits
 only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-5-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-5-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:21:08 +0000
Message-Id: <20260901202109.1999E1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Some regulator control registers have independent enable and low-power
> bits. is_enabled() currently tests their combined update mask, so an
> off regulator with its low-power bit set is incorrectly reported as
> enabled.
>=20
> Add an optional enable mask and use it for VINTCORE, AB8500 TVOUT,
> AB8505 ADC, and AB8505 VAUX5/6. Regulators whose two-bit field encodes
> the complete operating state continue to test the full update mask.
>=20
> References: AB8500 User Manual, UM0836 Rev 3, p. 214;
> AB8505 User Manual, DM00046744 Rev 3, pp. 171-172 and 223
>=20
> Fixes: 65e03ed2d0cd ("regulators: Fixed errors in ab8500 register mapping=
")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D5

