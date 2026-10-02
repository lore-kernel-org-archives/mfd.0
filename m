Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CD477295;
	Fri,  2 Oct 2026 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932480; cv=none; b=VKTm1nh4Xb/ahVc87zcWB6pudLra05kWuthLavUwvMqq/Gm1I9fhtAbc7ms3ENhAUpk0CpPtnoNbBbWKNmo7EvbLGTFwMyBDe4aEc9ZnCBLo/IG4DPDDCiIZSSZ7jpqu/ZLmz9T8VzFroSCQ7KKH1ypkXWqW+y933HNJjSjx3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932480; c=relaxed/simple;
	bh=iHSjyGq/e0iutCNtTcNxMeeliuO4K+/92GD6Vv1maEI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XTUtcsWeFi6wKRH+udLgM/oWifK+ERWS1VpR+/gb+Tt9nqQ/BMK4CsyXp97sI1GKTMs3srR4vdTQAE1uJgTy8JkqmAkvJ869gUAIck3EfxGQpxOgV6QoP3VvKmNfDS2ZLtYmv6Z0cU6Ht3Opd5neR806RXxMqpAayClhujnySDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+nofu8+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+nofu8+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7677B1F000FF;
	Fri,  2 Oct 2026 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932478;
	bh=iHSjyGq/e0iutCNtTcNxMeeliuO4K+/92GD6Vv1maEI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S+nofu8+u+ZtkKIiZZ+KHacEx8Wq5NRKuaUg129XVW+3t60/Dhke0A0ewdybeBOLS
	 ywrYhiNmfl9JYO78s4c6gJK05LT44V1vFmd00CvmimLjnrWw/yAKcmV5ZratmwXX13
	 wpHWSnM/sKxw1RVAFTHuQDFWWbUsVHzR4YXcWgqRrbZkH9H4fLgHImLJrUGBOKjwK+
	 kSmC6rcVjBh6jUbDgH8O5w8VlPjBTOUZ892PM+pN1mlcGcN6Ls3hhnhGKbO7a5FMZk
	 yHXdNuBK0md8kI5Teq8mEsC5pgz2InU60be+R5Xj3pzCVZ4uSbzNBRmypSnJDuaXuc
	 0qX4658ulBGJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: tegra: Add Tegra132 specific compatible
 for AHUB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261002-as3722-bindings-v3-3-21c179b72a95@nvidia.com>
References: <20261002-as3722-bindings-v3-0-21c179b72a95@nvidia.com>
 <20261002-as3722-bindings-v3-3-21c179b72a95@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:37 +0000
Message-Id: <20261002091438.7677B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Thierry Reding <treding@nvidia.com>
>=20
> The AHUB on Tegra132 is backwards-compatible with the one found on
> Tegra124, but it needs a specific compatible string anyway, so add
> one.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-as3722-bin=
dings-v3-0-21c179b72a95@nvidia.com?part=3D3

