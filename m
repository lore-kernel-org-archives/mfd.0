Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1E63E171B
	for <mfd@lists.linux.dev>; Thu,  8 Oct 2026 07:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445191; cv=none; b=RJJtmfdU9zru2/m6nT53IHKga1ctECRnE0pjEdyoZcCtiLhjVwle5jJdFg10BA9+yxAWohP0FvjctwABPqqzpWDoItTZEoUMEDYdaZszjy0TTV/jmeRaomwCLyFdnnhzkjxb57c1Mk9KfdUuc/1EC7algBBtLODGWvsCo/d6Nac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445191; c=relaxed/simple;
	bh=Ko5g4YRpdpHZiEcXfvYXrPGk0Nka/hJ/uBoRo9YTtFI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bAj4LIy8nKpgoJl314XjcNXMfYNA09953dY7OWa3IyNhpbX1gk82ZNS2BoxQAlG+2AMV6m2j0XuMl7E/MltQ3EjHE/MivrI10Efd92qgZDxEpgsNQclnWVRitrdTaCi+iBJUtMQnSUtM/7yegi5MIXhAahKt+IJJqFqgNgo0Txw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRPrRAlz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRPrRAlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9B71F000FF;
	Thu,  8 Oct 2026 07:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791445189;
	bh=Ko5g4YRpdpHZiEcXfvYXrPGk0Nka/hJ/uBoRo9YTtFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kRPrRAlzrHbl4V+mMkpViCmTCkxdNOjosIRsaZ3mtTVsXH2ugFR8275xbBQ45JmKo
	 JwVQ7wrTO76ewWVy0jP+cNyjNSHc4THcZmaFPErnhvf9qOHNca9QisY0uo5IJsWD+y
	 BA9oiGd5brEnaZGAP3nc2Ie6PUPxl8QE6vDovXNKArfGK/UzPHXC9bnnVqXpMLyPl7
	 6umQGQiIARLmlZ+nZ4l4N/j9ioGZW4OM0hMInz2wZqgNVP3vb5Hr3KONUXK3R8/8ON
	 I9JRlVVofaNyHofI7rO0yCSazl+rhogggbxfP9Ney1O0hFK/XMMdpsSbM3xDI180jZ
	 HFNE7KWLCE25Q==
Message-ID: <sashiko-outbox-163774@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] mfd: loongson-se: Add multi-node support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qunqin Zhao" <zhaoqunqin@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261008073151.15808-2-zhaoqunqin@163.com>
References: <20261008073151.15808-1-zhaoqunqin@163.com>
 <20261008073151.15808-2-zhaoqunqin@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 07:39:48 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
>=20
> On the Loongson platform, each node is equipped with a security engine
> device. However, due to a hardware flaw, only the device on node 0 can
> trigger interrupts. Therefore, interrupts from other nodes are forwarded
> by node 0. We need to check in the interrupt handler of node 0 whether
> this interrupt is intended for other nodes, this can be accomplished via
> shared interrupt handling.
>=20
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008073151.1580=
8-1-zhaoqunqin@163.com?part=3D1

