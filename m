Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793685072;
	b=V+YlZaI0ZPwC4llHkkx1q9t79axiWryttINMLYre9Zh12JKtHBB9HhYluS5plIw2c9w5
	 BL+Krv9TeXAcIu4RDE3GCkKB149dc8gNyMvTmsTRGYQe/WxQGuCABHduYM474484iIpVJ
	 EdFZW9JLICiA5KpiuDQV+Unxedh/lNZYzkU3E4CC4blONEsJBFOnUO9a+VFnHWz28ci8a
	 IhKZASaou3sXevZk0Mk4wZxTo74jN5moBSrUgAgjnOXH1OtySGd6WRmp+OoHvlOFH39XZ
	 TTlek+jh9Q3KeH3k3IiJx/kQbLRQhgjtCV8Ztb0rVzbmIa1A/z8HUeBfb8+EYTgcogA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685072;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0JYr8VapsHChqxc1qx7MW+ridzorQddowBggU51hm9E=;
	b=pM7R2iExDu9p3kfIf1JbqA5xzLkcAialHyFf91ZFsZ3NPjiVHGatlK6cAEQTYmWbTkVh
	 L5MGm3b8H8WeYLtUeJpTP+yeNJbuKc7bTY1jpUPgIGAX40ofu24am2MkZT/P5G/f/w5s5
	 olNk0TYTY2TGScSHPxkPt4AnewfBc8YugRByByqC8VHXzZ8MDsJvYTDVP0neE7/2i/nsy
	 G0Kw/aUSYLTX4b8qFkI7gU16kDNAsbvyoRoPa0Uc3hxyrmd+jFR2WlemNyNQulCcInhbQ
	 Yfp+quolqIT0+zce8CsIvit75Mi4tVYXOU7kxOm/3/vc47R1rcxc7EUNrjNEYzSCjZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GT84Cf5F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C828606A324
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 05:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GT84Cf5F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030661F000C1;
	Tue,  3 Nov 2026 05:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793685072;
	bh=0JYr8VapsHChqxc1qx7MW+ridzorQddowBggU51hm9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GT84Cf5FygrS1OcrVJMCD2Gt2LkuhCG9Tmw66AHuPz3qwp4WQKY0WfM7LpzyTbk9M
	 wFmK+sCitOHreJ8xaR539FSVoThUYMX0Df+kY097tKsECCkmytWBjFtalUmc18jQYk
	 642ptc5MXSCHnl3PnXhj5VrhMPB8uF5p0qYI3PZz0GF1Ww/Gz3ZzZndfqJIle2CWJW
	 SzdzCWmiGOkv6G7wkPAnAUFn+EFSARcQT3opgH/7Yzn0ucL+gQvpi5nhT5xR4jydQG
	 7mNz/C+QwLx8I53l3PJ/DcljGSdnEBQDx6wAVJZysNv5X45AQrOt3BHK72ycPtMbZK
	 rnZXcD8xPrA5Q==
Message-ID: <sashiko-outbox-194599@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: add T-Head TH1520 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>
References: <20261103054716.1767730-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 05:51:11 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> T-Head TH1520 has multiple system controllers for the "subsystems" on
> the chip.
>=20
> Add them to the syscon binding.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103054716.1767=
730-1-zhengxingda@iscas.ac.cn?part=3D1

