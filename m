Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3E483809
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 10:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987993; cv=none; b=E6Ac7316tuBn737Syv0mMn1bucqjgTdKWaaaMROq7DC8Cf4YNUeiFEh/JUaPTMSNxbG4y51pqHAZbdD+3EGWy7EtltB6e5xbBh6cbmLSeAzU059+6XVt7Fv7UjRrms7CwAMbPgkDSdXPuXid73tXu1by9ys5jieGkNzWiyeYAec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987993; c=relaxed/simple;
	bh=giwwLwxIYphrWLwcl6PVn1BQJssg9o1aVvdoP7fHhfI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tJKoPEZrGhW8WRtdEiIwJuBU1JsQeNdrlLtmUBpl6N9tVH37Sfl9aoDV+NvbeuKSY1UE6E5V6msQ8XI/HbcPA83H1+yYjbDgZOxt1aomSkX9pIh9NNBJEUkg3y5zFNVzSHCqghx5tVefpMnUsCaOQVPh+JQiLBf5eNF+AJ6opgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4Sn/XMm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4Sn/XMm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2701F000FF;
	Mon, 21 Sep 2026 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789987992;
	bh=giwwLwxIYphrWLwcl6PVn1BQJssg9o1aVvdoP7fHhfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z4Sn/XMmAtCaAO6kr4B8VLGMozW7sSj4xKz2vvUuK19Y6D3YNDB7i+v1lo2HSE9rD
	 UP+MdR2O8e3hoFCCBONFq70JWkadok6QkOxOyh9dX/Dg1wQlX1eo+VKHmowxsxPeNA
	 xPefndWzy6ClpVbWF4bO80S/mdAVjzGlpyV7u1iAWArvbCFmZtB5vZc6BaJ4U+c0B0
	 sLv6wyzRJKWhyd9A90E+ChLEMHPSfOxay/itDT4ND0nZuhjipYLADxUXT9BE7wbNcB
	 wdjzBxtSpdkVa/WEwKEtwWTGGRcZMJx7USydNhAJuzqqkjLJ3cLhiD3WUsTu/OSV/P
	 7uAQLglom3Fuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: tc3589x: fix GPIO child device leak on probe
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260921104730.354304-1-lgs201920130244@gmail.com>
References: <20260921104730.354304-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 10:53:11 +0000
Message-Id: <20260921105311.CA2701F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> tc3589x_device_init() may register the GPIO MFD child before
> registering the keypad child. If the GPIO child is registered
> successfully but the subsequent mfd_add_devices() call for the keypad
> fails, the function returns without removing the already registered
> GPIO device.
>=20
> Since tc3589x_remove() is not called after a failed probe, the GPIO
> platform device remains registered and is never released.
>=20
> Remove the MFD children when keypad registration fails so that any
> GPIO child registered by the earlier mfd_add_devices() call is properly
> unregistered.
>=20
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>=20
> Fixes: 09c730a488c3 ("input/tc3589x: add tc3589x keypad support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921104730.3543=
04-1-lgs201920130244@gmail.com?part=3D1

