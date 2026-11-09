Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236572;
	b=NigQb0jSblj7Xpq1SIgIA7m5ATqk7Rme+GuR36+zx/Tvy2OWcG9ERLxwIOhctkU/GsHs
	 hMlHQs0NuPGDXQUjtrJE1d2Ogw9TIbzVUg3ADAAlyxr82kREHqvJn0wTorZCpb0z/6iOx
	 LYKcessR4fiXGtRBo7eGH0rp9FHhUKay/XD2rKv6zFfJoZIJ93zrfOhVWjhnFRtZyGpnx
	 iCntMJGEusISsvUJ01+7jMOrvIeeL1/+L2vMBCFU+wQ6b33/8yrEVstB3FZfUtKnF3h6S
	 RD12UCpRs8m9FlDBxO166YBQhDVOFdooXINPYzVQCjpKM9tjJdian/GYdAZMk0IbsuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236572;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ryv3HUxJiWlog2XJORXsW8CmiuRRwaOcJMLcTPJbSEY=;
	b=x5qXt5YXvjo8fXyMdY7F5KHZ+i6LhcQoYPcLo3LoH6Tz7ZGypR7IFZDyYuyYNwMZlnBh
	 kAZA72rzglXYwA4UIZcXCAm0agoEvN/UB6ZIvDAQoPyXT0kJZhaJ9+ohymnit6Tz79qzn
	 DMHuA2jxettAFiaJYkCYJyLYXltG9ATtofTxUQ8rvOyPgqGpGUZKd2grII/2y3Cyj6HJ1
	 vW3Qa62XOpXK4RcfYA+oaskv9rQsEvqr5jUaE3uXdMbhkYjWTCyN6KCIXXJ2bTRaOJ69a
	 auPxcbiQbKSFSU16jDdeEBlWniSz82lWkXD69+x2z1EFPoCDawi2BOnygfnFmBvFoKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JkK2Gw9A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F029606A33D
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 15:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JkK2Gw9A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E90F1F008A2;
	Mon,  9 Nov 2026 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236572;
	bh=ryv3HUxJiWlog2XJORXsW8CmiuRRwaOcJMLcTPJbSEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JkK2Gw9AYnRcmVbcnayxDAVFch1LJ5n5Un0CdV9ngk9KInaqffHEeIRiwM7lZx6z9
	 lXIoifs6VZ4HBCF/IVPG1YAm596l7Ws1ZqTmaOqzRZtWyvkJ9usr3sxSrYgJ3ISYTC
	 T7WjYiNPDsZGxvnyswjJvM9OVB91GWHnF53BOSrMDrgOZ83YoS0I1tL4qczfpFyO4H
	 rh++VmeSRIkwKck43Qrc4xkOrSZPc79wf9djX/rkISwxoWj7RY/SPAJzOgnlrjLSlB
	 6lZJMNPpaO6TgD2YU23euloAIsV2FPtCA/0/v+TIzmWU5Cu4wJDtaPc27r+USLavyK
	 LHPYdfsrUOQhg==
Message-ID: <sashiko-outbox-205143@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 6/7] power: supply: rk817-charger: Clear SYS_CAN_SD
 reg by default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261109145833.1363319-7-macroalpha82@gmail.com>
References: <20261109145833.1363319-1-macroalpha82@gmail.com>
 <20261109145833.1363319-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 15:02:51 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> The BSP driver for the rk817 charger by default clears the SYS_CAN_SD.
> This register tells the PMIC that the system voltage can be shut down in
> battery off mode. Though the BSP driver also included a way to bypass
> this behavior, no boards have been observed using the override.
>=20
> When this register is not cleared, it can result in a persistent power
> drain on certain devices while the device is off, as observed by users.
>=20
> Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK81=
7")
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109145833.1363=
319-1-macroalpha82@gmail.com?part=3D6

