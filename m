Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855893;
	b=TdkdhEWJfkX6J6rTzSmF9bcXzcxq7n6UBklFrK7skVX2ON2De7oYc2/lwBDROm2G5auk
	 71i0LplZlEPG6HyhgMK2WL/VktpFDytHHu1OI7G2Ks6Iq26ydpTBF2GFRvComKMwu4zlY
	 VW5+/TF3xEbX94URu/G0dmn76Gm7k1Dyftw33/X/k5TCwk70+viSEFG0SbTdXdFnh6cTi
	 4yQzu9TU+A3SbZ0TldV+Pbu7A3ixdz7VANhh1xeIm92NnrZ+rNu0S90NIVge/vFf0H6pF
	 Bzv7LnzjZHWJENef7b1lg6/mLHdzaqQpODkT1Rql26jDSPYru4eYvqtPzdl4U054x9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855893;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=agSRodQKSPDqAZyViiZvq3s4I+gqJB7b6ciVe8/uN18=;
	b=UltlAITzsjwIJh+oABSre6clq0Sem1qV9q31JPcre5HZAmhmUSQuF1vir7tDmW1rMGHZ
	 Ri0n61Bf9AlcARsROFdv2WInwQVX/fG1B9XGlWdnZ5+yB4hoEINYKBGpjWMtVFHX0ph3+
	 RCpRtVN24nF3k5D+26GXt0DEe5oIgdwnvxgK6NKYVo9aJRAZfyDYqe2Tk08awBi+eMp60
	 oN6XAJo8UaMpAqE9hIzLQK9A0kLmB7e97LynPzANFXIq5I5jmyQVBVdB74LVmKxe4AN6z
	 H9iWhlHmtmviHIzdwJcXFLNk13p5jygb7BXdvD3t2WyEdETiV6KgYO74Lxv2Gf9NylQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAEyLs4T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0022606A33B
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAEyLs4T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289741F000C4;
	Mon, 16 Nov 2026 19:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855893;
	bh=agSRodQKSPDqAZyViiZvq3s4I+gqJB7b6ciVe8/uN18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kAEyLs4TSZ0mooKL2si4rysevtJCGLjDEnIyUKL5ssMLJAS6Op6YuTqG2sjjh20cp
	 nH2PIjyVmrS5eJecubUYLwZLFVEMxioQqGwFDsyIS9EbSTl3/TIq1TTlJggcBEgJUj
	 l/OSXIH97mGix1NUR1UTvG6nFGhU/fPnNcIY1dmRYBSxhJvCVd0f9LZkIyH8kht/hK
	 Wrnj6hcKizttDO+nYIvdNsnc0WEpfJALMcqyHN0XgsBjx1Ao1tCR/ole0h38mjV588
	 +gJzPxf/y4OWNFpbO3YKyKDg+ShsL0xuu7qi0scvNAFmy5lXEtfL6StiXGXZUiPfry
	 Q1NpEYOcXdrwA==
Message-ID: <sashiko-outbox-217524@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mfd: tps65219: Keep running past the warm
 threshold when asked
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chrispine Tinega" <dev@chrispinetinega.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116185811.1907811-4-dev@chrispinetinega.com>
References: <20261116185811.1907811-1-dev@chrispinetinega.com>
 <20261116185811.1907811-4-dev@chrispinetinega.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 19:04:52 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> When the devicetree sets ti,no-warm-shutdown on a TPS65219, set the
> four SENSOR_x_WARM_MASK bits in MASK_CONFIG at probe. The PMIC then
> reports a warm die instead of powering the board down, and powers off
> only at its hot threshold.
>=20
> The masks are loaded from the PMIC's NVM at every power-up, so they are
> set on every probe.
>=20
> Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116185811.1907=
811-1-dev@chrispinetinega.com?part=3D3

