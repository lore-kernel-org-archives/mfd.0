Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122897;
	b=IdpqO6piP47cS2ZGrbWHpye1KqpOK0dz12eN6wthbJRHUGWHf3vLOYC98jrEKzCZn0DI
	 8kso2Y57iAm6M+qic+zCryvnLXyvxyrSTEedtkkDQJsZc6OixsDboHJxSDOC4xWAS+JiA
	 /nSCR5UD1HrPEReJbbcLOlio1DIbrgAoFRHZq75E++ewBnOtOC6nBvX2xaBQReM6eyNzS
	 bKz36qDUxoTcrkqig+1oJ9aURng02eMblfax20hhZZwflr4HsvlwtV5Jo9Oqyg8+Tdt+E
	 kwmymOaw0tK4L9ioTPcVrfXFf6f8wD66HuhKPvRukr01yWsXn+hOjYg4daIVXO3LiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122897;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r4B2rFgu/n5cUIaLIEb2rK+WQwNCtURJ55d5psoApTo=;
	b=fKLanzA1XpuAVcF+PphkH+HquxzQlSrnFwTExfcb2syDpaVcWp9lHsdzgR4XHkIVnrMl
	 SN6aZsU8oCAZqUeofGkgpVcksdqOdZcZROtcp7IF63OTsOmh3faSripRf00NesVfYeLR4
	 vpd3yrrEINHpwgfGyCMVNspq/LT3rIeyjzbTDxi3TACg7U2Mh218zWi5GrnBOnfHp+RLN
	 YsOi7TwDfFjhJ8FBQowuINi611h+ToUTtojO3dlCQ1QN1m6884nwTEAdScuWyktvbAvD+
	 CFkjqCTwDH+7oMzEJk7HwsiqkGbjF1L7ept+06ZlleU2PzA8SfKFQy7g7OdDLweeXFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx2GtRLX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E71606A31C
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 07:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx2GtRLX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A331F0089F;
	Sun,  8 Nov 2026 07:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794122896;
	bh=r4B2rFgu/n5cUIaLIEb2rK+WQwNCtURJ55d5psoApTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gx2GtRLX17gfhMV5vstKTaUsppm+ZUynPHRp3cHmQaL8sjB2N+kFw8GeS7izAoZAw
	 9sB/snRimXApvcETP3W5Z4nAeYVWgAeMIidI+zqIukHky1FucLqyZEYMlmLR4DmRRY
	 zQux/PWca5Lr1tPtZ+s4JYdsjD4CR+TznODqEdy0jLnVK/pmGnB5FKjgWM7XuzWcOZ
	 VZE+D1aeXtKkxSxLiSXF7jZb8LsIjgCXeo7x2aMm9jm8wTVkgugLshkVvA5n2uIlvT
	 7c6a5pgSkpJXC2v1zm7nMczKsrjOYk3algQWFzZz/kSCRbJ5sl4vkmxB7r7J5nMyne
	 aUw83A450VQpw==
Message-ID: <sashiko-outbox-203620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mfd: gateworks-gsc: Propagate errors from
 gsc_store()
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261108151849390eWkZBJaNgwJDsb5MuOMLo@zte.com.cn>
References: <20261108151842879F_ON2AUBnuh5imOx8oZ1w@zte.com.cn>
 <20261108151849390eWkZBJaNgwJDsb5MuOMLo@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 07:28:15 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>=20
> gsc_store() ignores both the kstrtol() result and the value returned by
> gsc_powerdown(), so an invalid argument or a failed I2C write is reported
> to userspace as a successful sysfs store.
>=20
> Return both errors to the caller.  The gsc_powerdown() error only became
> reachable with the preceding patch, which makes gsc_write() report I2C
> failures.
>=20
> Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108151842879F_=
ON2AUBnuh5imOx8oZ1w@zte.com.cn?part=3D2

