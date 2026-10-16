Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD853CA4AB
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179787; cv=none; b=pMUTu98Pnn45sdA5EPdV6OzHUZziQqiv+CSkPGaOrpXpVprEjv6LHv4TpdoK/EDBoB/x7YSB9kEG3UdTDDvpcQuCRtQGAuZmGh3JAMqAYcGceZqeffYS1BkwxrKuP2oTLYwkto/MZ+ZcJsXUGRRk4mhZIO5r9FBtkxJJk0zMH+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179787; c=relaxed/simple;
	bh=6NTtylxNVwXAs3IOR8WUMN38QypHrrqEmyZYxgr+OF8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Zs883ya2No33tuPw31+sxouSnxbzAXDKZ8+KypkIprPc1ln2Obxm41vHqVoDuPXFytusJbiBbPaDb0cxCezdbeV3kvM7lbSefbcvMjast0nRonLGVQpKGoCsID+ZFCg5YSATi1YPn7rBhTjm3mSCqa0adYV1BNYKIS5lyRiMke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWyOYHno; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWyOYHno"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6331F000C4;
	Fri, 16 Oct 2026 19:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792179782;
	bh=6NTtylxNVwXAs3IOR8WUMN38QypHrrqEmyZYxgr+OF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MWyOYHno6w2kK1WJsR4e58k4NXqsNHLArKtN6WAwssQFV9pL2SvhQoXAwztKe3aoz
	 hwmMuANOh/rcz43xGVIgnahmPTw31NoSf8rFM8YoSxKja3D8O+14PFX90qAgyNaHln
	 83DNVYNUDfRdl2CCpRJ3Wr8ylRvJjjgtLdiGWUlop+hK9gkKEPWw9Oowy53czILdAY
	 DhkkAuklt168vUu5YIZEuPlJv6WxtB2/9JyqcXyW1dBxKL0xy5zKakhLuOrGDeqKkh
	 8M5TAChPzIukQmH/3bNdt9VmLHOz5zUSJ3DykclyLDrZiJYDyHaw/s7HDIzhTlgQ0t
	 l50gzZO69prKg==
Message-ID: <sashiko-outbox-174873@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261016194023.235703-1-robh@kernel.org>
References: <20261016194023.235703-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 19:43:02 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Use the hisilicon,hi6421-spmi compatible documented by the in-tree DTS
> and matched by the Hi6421 SPMI PMIC driver.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016194023.2357=
03-1-robh@kernel.org?part=3D1

