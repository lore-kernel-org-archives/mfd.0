Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0229033123D;
	Sun, 30 Aug 2026 22:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130267; cv=none; b=ZALA/vxs0x1RQygEEk8C7MoQgxVXXp/svNFYnEZHDl5UlBUeHqLpQKuvIGb8WXmnijTbeBG85Qr6qIOFTRrPPg4BEloNDSFrkVbawfAGqaivfe9wzOExb076yT27o/gVWHrD/V0CdM2AR8K4WsvGTKB/O59yTqBrpP05iE1ZADI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130267; c=relaxed/simple;
	bh=orQJknovEiVqQsGcgm7qqVnRWlJazv6UH84n81+7OBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TU1tyBbneo+AfPYFoCm/IoHW+WrjFAm9OxcGzyLsr8I1QOwFIbYAqjLsRVXmYu+RiYNADN6zLE0x67dxl58jBCOxfBfR8R+I8h470OatBjRQxbbAuXwM+2WJ0n+/Ezy939RZtMgwMulFyUB8mfwb1xgswphufIrVfwuVIQ/IqXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihtztLgT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihtztLgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCDB1F00A3D;
	Sun, 30 Aug 2026 22:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130265;
	bh=orQJknovEiVqQsGcgm7qqVnRWlJazv6UH84n81+7OBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ihtztLgT8boJPKGwAAVULRq9p0OF41eF6z51aQ3FxUd4ZWanVDuxS7+FfSWEmtwE0
	 7t59N9SVmj1OSYZ8tr7+20XxDx26day+gczzaVQC87tmL7l/gTwZjqEfmiqvyU/n6H
	 MIHW3IWtLcJHBnbrsr7tGBbmE5RszdRZcI1603tf9d3eIg6NMzWHX7PExnEpm6+psD
	 g8iQCPhElZbqAxXC5A+TWXJlBGUtffbyPJ9Pd8XmnbQu1LG/BcNAer06e7uTXhQpoN
	 GmTmHW1+lMEzK5iTP22WBsR0bbDKJ6aYB/LFaZcHjyJzU/oxekcKXgelk9ElckjTkS
	 LcSgYhQd22YXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/13] regulator: ab8500: Fix AB8505 VANA voltage
 selectors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-1-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-1-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:51:04 +0000
Message-Id: <20260830225104.ECCDB1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AB8505 VANA voltage table assumes selector 0 represents 1.05 V
> and all eight selectors increase linearly. Selector 0 actually
> represents 1.2 V. Selectors 1 through 6 cover 1.05 V through
> 1.175 V, and selector 7 represents 1.225 V.
>=20
> Correct the table so each selector reports and programs the documented
> voltage.
>=20
> Reference: AB8505 User Manual, DM00046744 Rev 3, p. 257
>=20
> Fixes: 8a3b1b8703fe ("regulator: ab8500: Add voltage selection for AUDIO =
and ANA on AB8505")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D1

