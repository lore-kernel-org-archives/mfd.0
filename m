Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828587;
	b=r6zN0eqDBGoSqwoLLyFV+tqLEVqPdy5xNfgNWRpR2AeB49X5vRBYdUOqOGOCqocJAbr2
	 LKvt09klaoPvY89RZ4cGXeI76jb255HkddYcf0tftN9Bw8jYDxsq1TDh3oWvMwqhmoMD5
	 Ohc7vOBNxqGgubTRCF14ZiNchthwfUSkttGsl1OelLbGNBlrsCreZBYlX2iSl/9kKE0k4
	 gAQ6NEWl3NwoMI+f8sR48DyLc99oyt5jUjtI21TlRx8327rhuCO5LHKmtT7FUlzQGMpmK
	 mSJo+KTtnKSnkCxjwOjubdJwNBa5VzynIrz5Mv8Audjafr3BjUAC4fxP7rMLXmVvipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828587;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XGTQrJ+uaOlP6t7soEdo6SQpu+8kK0SPVw13/u+cwvs=;
	b=tShXIDJzxl/Cp5+SJydcYu2t2rLevijLRnkVoWkz9vyXRBTrlBMmKI7XiwPZ/2oxpaKe
	 XsEZ1Yc2rhg4aqmzlWLTRn/ZuAtRUarbdCMytswSxCto2aJUeLdGLfVK5yTF9RMWLCJCJ
	 zuczinKANQ75EkdrIVvb90LIRpgTu36NWz2SNEPt2jAO1E1t7p+Pj95oMEKhWc/bsg6Bd
	 0DwNeCKCPWoQZmwplNDZ14D9xb3cWHsSI3nqdX8PbbXFX61mxG1Xpwa+quyXcX2YF0LCa
	 AooSwl6KWQdXY+/V7sLpxBCsMUgU7QBN40WXiQSr4uvd+e77NEe+cLIzhInBG2MfIyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SvlDRcE3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3461606A337
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SvlDRcE3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D6A1F000C4;
	Mon, 16 Nov 2026 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828586;
	bh=XGTQrJ+uaOlP6t7soEdo6SQpu+8kK0SPVw13/u+cwvs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SvlDRcE3BKdLhu30Q7eLTKkQbevaxv0Fc1soFTOzc6qD0BHyLKXumz3aeYNqeEJ2r
	 dPfPRbmg/FT0VM7YGO1Z/ygiRXPWl7I847Lf/e/MfYqILDH6RRI2p/piUgeXwunYrv
	 SY40A2uZ5dIeisOcTWUwWKS4EBb+nuaFloX4TjVwdKXQBG6xDQcRgKGK2wihcixRxG
	 4s1E4Cnqm+wGin2u7pAX+MlDy6zIGtByWRD9oh99c/pn7R0zNH592UlvIpA2v/9xod
	 zbnHuHEIJ8OECL15PCAkrwZ9gskgn8SwYGjdNiqcjo9Q2mP6G1J7JfHnD78phJNt3P
	 H++Xfxawtes9g==
Message-ID: <sashiko-outbox-216932@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] mfd: cs42l43: Move to core detach helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116110913.3555209-3-ckeepax@opensource.cirrus.com>
References: <20261116110913.3555209-1-ckeepax@opensource.cirrus.com>
 <20261116110913.3555209-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 11:29:45 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Now the core has a helper to signal a device will detach from
> the SoundWire bus, there is no need for the cs42l43 driver code
> to separately track that. Switch to using the new core helper.
>=20
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116110913.3555=
209-1-ckeepax@opensource.cirrus.com?part=3D2

