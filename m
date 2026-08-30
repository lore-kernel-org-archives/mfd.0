Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192D1299920;
	Sun, 30 Aug 2026 22:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130177; cv=none; b=tH+5zOgahCuNR0UoIBgG+4JwxVXtcq533kTZrhFBCHeGYbCAdygYEfvk/4AxgVlttjM3bOEU6eRHk6G1dYZdNMaqSDFeB4TtyqduiWghAfGaxepDpElmLvPiNl9e1MXRz/WA6JJ9KEtFkeEASDQs5evU0Ywz8FGSvABEbOzBp9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130177; c=relaxed/simple;
	bh=0et3YMxqhFArYcxiKM94IhApruzU7YM2aO7Buxp0asI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CulbJy+zW0pVxjmLiS1aOheIsbvBbWzy2GvCloKznHjnz9gbXOgih4SZnV58NrlN1uUDEQDEZyd0XPo8m0z84SZK3a8LIb0EAZUl3yDI+iDTU64+wkg6jTLCrw75RC5mrraUnqnt67nq2INgoxNBXVbRc/xBzlPFaZNlO9Ov6C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3XeC+lU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3XeC+lU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4575E1F000E9;
	Sun, 30 Aug 2026 22:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130175;
	bh=0et3YMxqhFArYcxiKM94IhApruzU7YM2aO7Buxp0asI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S3XeC+lUwrq1SiaqQY0Sq19S6/jMGCc1OVV2COEKSr0PPK4/MNEdeGeolrFypj0ZF
	 NE7RBWrwIZnktJHKy1ANP7amA6q/gq2EpEjVbx0O8p1rtHaKXCCXQ6SOrhgiVG9HzN
	 17eeiyheFKi1D1RC/QjTydkdLrV3A6rTbedd5bkwKFAI7UF2IMHiPLpvGf+ehTYyTB
	 DbD2RI33itiIJN797r+6s/DgKiRV0nY92sCy1UVNSNJJeXdVBdUBoLgCAR8rQ4YRqz
	 0h6WKxcKMNPSCW0PLroJst/Fwx4m/1oGsT/vBtBNw6HUzWUjezkeTa2gslZv22RRaU
	 MQ9ffMU+HmkOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/13] regulator: ab8500: Add AB8505 VAUX3 3.05 V
 setting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-2-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-2-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:49:34 +0000
Message-Id: <20260830224935.4575E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> AB8505 has an additional VAUX3 voltage setting which is not encoded
> in the normal three-bit selector. ArmRegu2.Vaux3Sel3 overrides that
> selector and selects 3.05 V.
>=20
> Add the missing voltage and use the override bit as an extended
> selector. Program the ordinary selector before clearing the override
> so VAUX3 does not briefly switch to a stale voltage.
>=20
> Reference: AB8505 User Manual, DM00046744 Rev 3, pp. 229 and 254
>=20
> Fixes: 547f384f33db ("regulator: ab8500: add support for ab8505")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D2

