Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793302354;
	b=r6jZEQXcQkPGLXHyerOUHYxxzxw0/nspOG4PEubVPwmPAM/rfDh56haHGTO9WNfvm9Oo
	 6Vgroq6sYQiWep5VkT9Hzmx6H0wCO82E7RW/qNfN068j/h7f7/knS3ZeWGWRNdLC58LrP
	 JwtSu3naOxBdakv4up1nvCSgtjlzPz1+GFdo9LNv21zumnoVU7pLbOltsGCxkIPkJumeq
	 8Ffsggtue9bXjetasX7TwurZCRU4b8OFti+bbK1h1piCll7vW3bEkQPUNE34cMgX04GYZ
	 PORwoODs0FmmHRxs6X3pdgpwLgyjsWfAI9XHbHo8msJ230EhoLhC+Cs0Wkep78EqWNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302354;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iKP3zrtZkWzokPn2ZIVwLA9WkL08gDT3I8Fj2iEpFVI=;
	b=XYJypWRf9Ba9OWQr+8Z9PVEBus1q8nx2jE06Ny8AWAUhMQ6cxbzqbpzwMZPnqE3i2q48
	 D8QjywrGaVFhXdMF17YWOzM7SurYDyfPImEnE9/sx4FkISr3Y8ikGVGBIEmAVUAVLpFxW
	 ivMymIYpdO4/aj6KvhNcb360V4j+SF6Yb0k2/jd9q1iOB68vXSlXpFuAapj4uj6JaccpW
	 FlC7BngatsxFr0glZCv+/PcmNfLkjEtevceDic+h1BH9JbwzfmaRYJ9ScPhHMbYRyP589
	 W2rVjOJfRJrDV99gHJgTlauq21WHaf+kMEtJqqR10V3XPH/raTkdQQFnXEoEuAUQhXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4p8ZuG7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521E606A31A
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 19:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4p8ZuG7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823451F01816;
	Thu, 29 Oct 2026 19:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793302353;
	bh=iKP3zrtZkWzokPn2ZIVwLA9WkL08gDT3I8Fj2iEpFVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N4p8ZuG7Ic5wxKjAV+InYMVyoQNw4xKqcSOvzRY4BGIF5KmYYUGBAbCt+MVFY0bHx
	 prSE2lmRtxrRhrR2PvoP3VEK7Qmbsyk95VwYJCI399yhH4+kIWC6g/PCbpxYRM8YCa
	 dGKg7WwRcEOLPhHZi8Ns/uKRrf0xOGVGtuZdCnMBaj6PuNLB/nqX5xjsg/jJiGK7w0
	 +5YRn/NliQoijsAHGUjZKIyPIoa8q6gBsTK7P5P3HMWvh0Ct/zzhbQS4HJ1htljKdc
	 rh8UVEndfLSaFKAUCWij+JNwaOKu1ubaRffpt3u9PkVfR7t9BelTV9ctV431N25GBg
	 r0W+qdKdil4+A==
Message-ID: <sashiko-outbox-189881@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd/rk8xx: fix sleep during RCU read side critical
 section
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavel Skripkin" <paskripkin@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261029192223.462367-1-paskripkin@gmail.com>
References: <20261029192223.462367-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 19:32:33 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> SPI does not support atomic transfers, so it's dangerous to call from
> atomic notif chains, since it can cause stall during reboot on
> orangepi5 (see trace below).
>=20
> Commit 128115b520c6 ("mfd: rk8xx: Register poweroff handler in atomic pha=
se")
> moved shutdown methods to atomic notif chain, since i2c transfer didn't
> work during PREPARE step. I don't have an access to rk3288 based boards a=
nd
> patch reasoning is not completely clear.
>=20
> That's why this patch hacks notifier registration only for SPI based
> PMICs.
>=20
> 66.145226] reboot: Power down
> [  266.145581] ------------[ cut here ]------------
> [  266.145986] Voluntary context switch within RCU read-side critical sec=
tion!
> [ ... ]
> [  266.167528] ---[ end trace 0000000000000000 ]---
>=20
> CC: Eric Anderson <ejona86@gmail.com>
> Fixes: 128115b520c6 ("mfd: rk8xx: Register poweroff handler in atomic pha=
se")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029192223.4623=
67-1-paskripkin@gmail.com?part=3D1

