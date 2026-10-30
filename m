Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336074;
	b=cFZHvnVBnQ9LZ1wwmkgJbJkktvCFnEHAoZ79iLtqj9jp+ABh31ljpDlqQcVvZAzmPLz/
	 +cM6MikUu/Fj0tfVntqh20XExXJ297Pu349zjFzaVVlrs+7/qICukIcR0/AipM5HedR/e
	 Hny8xjfyTeBWa5N414YU+lmM50ylyZ0YhG93PJaLSZbsNihhe/6r+NYBeBgA/fW4884vY
	 XuwJ0q7iF2s2pGS9HsfJiwbEDeJz1cFIGPiaYfevJbQI2ZfDuq2hr2KipZ5xevwGr3n2H
	 l4DR7ggzdZBxo0vt/6D8wfi6aZIcamFJJ3yj84jSFEUUiy+yPR0P+8PuEPAauMUFpuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336074;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jGd1FjHZ7/cAcyMVNYycy/3KBpM3r2JYVu58GzELF7I=;
	b=BvzOO7aX4gVzqecQsEd9UeQDlMXaNs8tLk8yRetiJ1ZH76HxSA30LRvQIe2CkC3FKsXY
	 Nh0U9sDgs102tNlJzSj9raw90PRgGnm1/GTGG2Yg1pvaQ/i959/sG1jt2+hvXCRjdaV3X
	 PxeA7vKX1fp/ifWcifNKJGTAGC7K1Dea6z00evlPdoOS5MzslND4gpzg7n99JJbJnQN3T
	 TElBhfZ9CTS8PxajBztKYqlsxWne94AJC8Auys8ujonyLXOwNRAmE279U5R+FQnn99csW
	 L7mUuSG/jKodQdd6OkKiPSgK+olPLognvEyMemEk65wq2+3ZBycTVbsDQ0bUPXKrbCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMHlqonk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E025606A327
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMHlqonk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4551F0093A;
	Fri, 30 Oct 2026 04:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336073;
	bh=jGd1FjHZ7/cAcyMVNYycy/3KBpM3r2JYVu58GzELF7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PMHlqonkboD+xaYS1CpIbnEoQk7cTvcUNcmYu6FprQiwl1rP21ngaQXZDY1oPQgyT
	 H0Qtmhkyd8JoOgPm7969l8UuWDu5OazE4zWZc9Iu2/6y6wYrfeqG5+IfuTtUXKJpbt
	 c9WUKgv0fpoA3ixoqTSIbFoxlo8vKG2sfHZED13MMuKvwuNy35ooNvtU7hifO7vbm7
	 zvuaWvkARcXxeY8B3ItPFFJZL9owIzLwEqNDGjjuDjX5WUgKRpiLf9QuutpHsvwjTC
	 P+0eJToZ1iqZwbSZflH+iVnrmge6TMqG2iG0F0dgPrXIs3NXdIyVklbSzY5hbyaRVj
	 tTq6/mqT9Wwqg==
Message-ID: <sashiko-outbox-190510@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 2/9] dt-bindings: net: Document support for
 AN8855 Switch Internal PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20260915123812.14747-3-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
 <20260915123812.14747-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:33 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document support for AN8855 Switch Internal PHY.
>=20
> Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
> PHYs on the MDIO bus.
>=20
> Each PHY might need to be calibrated to correctly work with the
> use of the eFUSE provided by the Switch SoC. This can be enabled by
> defining in the PHY node the NVMEM cell properties.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123812.1474=
7-1-ansuelsmth@gmail.com?part=3D2

