Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102070;
	b=QFDRShLnK/WLuiiqgRK/PNejCq0GiiIYqwWALohs8AmOrkp4PB7y2ByoWxDGBBYja3qQ
	 TgwLNUFRiBVwVaV8oJTHCPskUZHaajqF129p/1VIkAdBjwmJcdTg/4qheYAjL9FhdN/Tb
	 hUDz/qAHwnYNl0y5BAu5CulIwGOHyeI4KmGA6DU48oMmFifjdaWrfF/7ee1GnbM7MZSgq
	 HXZBZ2jQLTrs4i3Fdqk+X1f2/q3cAQTUc6LHxo+dE+u188/T3Rw3cGJ96jT5rYn/n/4ll
	 pY0Ahbmj/bcq8/cnOAr2cKXtFlyB6XcTH4n9m6liGGnbyJOO2/f2zPK9y0eWsdcBfdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102070;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9mmGu7sFFwTusBxdD3bXdYSKVgyrCcI50GPEr+HLDG0=;
	b=ky7FhmzrE9Pjg4w5eM9jIVVKLcv6JzmOxJ6ew1pX63jvV61Y8k5/LLidxH4Qg1n601S/
	 mM82VvzkthK87dP8tCl1uB4y/bwNMK7AehkXRbd//1CX+sKgbz5GH40Z0qmikNpBwHiiL
	 +PVPyIzXGgT/eANtu303ztQvV3oL9CcrgbQ1rsTifugdIRduNvr4PGwF+q/GDeAr213+k
	 5ZV15/RS2W/2/UY/BkTyVze4d0KyTQvzKkmvlIAFlvvc+Vv88IvMu+pr9tMlaMHzCoaWG
	 UE1V44BW2Y4n0Gtv0pFf19AEGnqeoLeYiA13y6KlAuCfeZnvsHJUv6xV17UiMmVxcEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cVqYOarR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3BD606A321
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cVqYOarR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509FA1F01829;
	Tue, 27 Oct 2026 11:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102069;
	bh=9mmGu7sFFwTusBxdD3bXdYSKVgyrCcI50GPEr+HLDG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cVqYOarRt/EpyUSgR2UBZcvZ3pcOhebdg8QlVhgLzte2+oAThnt33cwqpyiwi+RWl
	 dEq4rGw2v7cTWtzS0xPru9D8s7R+q5rqwkNpNySFCLhiVZ6VkAJfVId0ziM8wT5Ct1
	 3U4J4qD0MtO7/+QostbZ3K9FvW5xIFDxx16woq7bAC9bUTjMWtgQA2U06yt5SAwf8H
	 D1WW7x/eyRN+1atrk0VNEDpvyqMatHmn5v+glCK8ZlIFDDKhs5EIUWM8XFKGLn6Zzy
	 05Bxz1CKcO2+lS4ci/4t/6/TyPS0ogF0mKN+l/3rhhR+tcAQUwK0ZWSqV6LXBMvY4J
	 4GyNC1K3Ggtuw==
Message-ID: <sashiko-outbox-186483@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] mfd: max8907: Remove platform_data based probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027114634.79706-3-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
 <20261027114634.79706-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:54:28 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> There are no in-tree users of this driver, but it supports devicetree
> based probing, which means external dtb files may exist that work with
> this.
>=20
> Remove the unused legacy code and make this a DT-only driver.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027114634.7970=
6-1-clamor95@gmail.com?part=3D2

