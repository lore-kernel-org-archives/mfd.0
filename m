Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6F92C87F;
	Sat, 19 Sep 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821441; cv=none; b=e7/iBYg2neC66B2qd9Er7vl+b2yv6zsCyilxsRUeYo3O+oMyQ+feeduGmKt/Bupqh/k8RILJxAeWbsJ4nExRUeMluhjLRvrBI8FWpDFYPJuEuPFl6DSG2sfxkUaUPfvI3dkF7R9DRa4cli4s/WFgldI9lC9nvY22xtoBM9cq3fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821441; c=relaxed/simple;
	bh=CudjOoiS0CN5wckAnmUNIAvsvwLoUc3xC2z4gGv7Sas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s78zU6gquoXW7N0oAmLQrJ0PUALCoIfol6MAoS7ipU8datLV6rWl4D/6RCshkTYAmagrwDmduj4nGy8Sfwvi8p3F+HjW44GoLPl6fgOKHNCtEwIVm7L2ukMrVbcPXZbii+ldv5fvpAr1JHp75eDtWVuWezIMsWwTm+ShTnXQNgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8MwJpnx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8MwJpnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806E51F000FF;
	Sat, 19 Sep 2026 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789821439;
	bh=CudjOoiS0CN5wckAnmUNIAvsvwLoUc3xC2z4gGv7Sas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J8MwJpnxpfTMPYQNJ0tPP3AW4WnISpBVuf/zD9hVvBn4URcekWHCPB5jjFvFR8Go+
	 vnmjj1kW2gMk17yGwbgejIvaavqJo4IYFUd6SRIt64B1RW/LblqWzEVS/dW8GCGtYL
	 /bW2pBsLwfddFNfQyKjT6T0+ZG2pQpyn6cVJt8vBaAhouDsp1YH0sUhYxvYgtXM4DW
	 2gr196+DQIq2NH5CrQfifOGGok93eGHQadwFTpg0hyN3f8Y1Yj+eghnkr+v4pP0rTq
	 0JxJ5tPHKLlQA+yeZuwfQHz8dZoIw83MrJxCzGH+thiPYoZWEAdXHwleIQg/uCQNP7
	 pdlRgb88sPVRA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 3/3] arm64: dts: rockchip: fix power-off on
 Firefly-RK3399
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260919122930.1418-4-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
 <20260919122930.1418-4-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 12:37:19 +0000
Message-Id: <20260919123719.806E51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> poweroff on this board drops the rails and immediately brings them back
> up, so it reboots instead of staying off and U-Boot reports a power-on
> reset.
>=20
> Firefly's BSP drives GPIO1_D0 and GPIO1_B5 low during shutdown, before
> writing the RK808's shutdown bit. Mainline does not describe GPIO1_D0 at
> all, and describes GPIO1_B5 as the backlight enable GPIO - the vendor's
> own backlight node has no enable GPIO. Nothing therefore releases either
> line at power-off, and while the backlight owns GPIO1_B5 it can hold it
> asserted, which is enough to make the board come back up on its own.
>=20
> Describe both lines in the PMIC node and drop the backlight enable-gpios,
> with the settle time the vendor uses.
>=20
> Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk339=
9 board")
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919122930.1418=
-1-yaozhonguwl@gmail.com?part=3D3

