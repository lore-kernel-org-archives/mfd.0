Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC80D31A56C;
	Sun, 30 Aug 2026 22:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130514; cv=none; b=jNA2k+frzNFr7IRl8+X77h3EcDwuvw97wCSNHPvlMT7F/68mopP6fl+hrsQd7/8CtWteypMbgVG8wxmwriLkTkvfaZWxGt5ryvj2fT6H121AA7HDC42E9L4FgPXUBmeDzUbqQtNOugbb2IGrkuh1IGKqjMKNwBtHRnrcHEtRS9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130514; c=relaxed/simple;
	bh=mQpvQ1VtuXex7xIfTF8Dt4KXKbVnFuVs1pSqqurMiGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y1GeDfhB4iGwC+WMYD/NjnvPUgTUXTYWjv8qr1PWJ+xUORKTV9lDyl0E+LkOVvBF3AawgxGGXOTwbb+0excFeg1LANViAdRZZFzy15c8Yrx8Xoewb6PW/Q75Z98C3KbOZQCCbqx+ekGospxa2X4DfoYXAzzvId/KZ+afftndiYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4GzQxBy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4GzQxBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75CC1F000E9;
	Sun, 30 Aug 2026 22:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130513;
	bh=mQpvQ1VtuXex7xIfTF8Dt4KXKbVnFuVs1pSqqurMiGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q4GzQxByvsO/+uC7cLDBTgEmnub0qpj7Tk8sT0m+GAVmqH11JZvcV64FsQdy5gIbC
	 Earn3i109Q1Q+By27yYRPbmRsKNk5uwPO2EwIVXbbqgC3qw1lOWN/svtJFSvn5x7jg
	 6bD+AFmbcqHKbR2cUZPPzgQ3wTyU0Fl5m8+y0ECMENdTNTOlzNVr4tMZf6KN0qkjdo
	 eMI2d0ontNcYkTnwgV+lmrTLKRprsGKf2s+B+8S3du+a4SMVvqf2mqv5wcK+V1IJui
	 sWvbQRxRDSxEC3FOkLWvSM2FACC7tR2QpO9ku/Ggm0wlnEpxcwLRUWLL9MP2SXbPeT
	 3NfN3TMZK8sDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/13] ARM: dts: ux500: Fix up regulator assignments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-13-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-13-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:55:12 +0000
Message-Id: <20260830225512.C75CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Several Ux500 device trees use DB8500 power-domain regulator nodes for
> supplies which actually come from buck converters in the AB8500 or
> AB8505 PMIC.
>=20
> Assign AB8500 consumers to VSMPS2 and VAPE and AB8505 consumers to the
> native VSMPSB and VSMPSC nodes. Use the common 1.8 V I/O label throughout
> the reusable HREF board descriptions shared by both PMIC variants.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D13

