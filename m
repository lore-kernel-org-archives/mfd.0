Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A5D490BE2
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340034; cv=none; b=b85OUhE8YczB7eEaqUd0HN5yBdW2XUi8uCFrb3wZk6u0bcJQG3TFem2pphmdVvv1a61UDb8Zp4BHSMu1Eduuffcuro1qjEea038YZiJMzX5+OgewLUV8Y2yIMZIc0keUh6AkS90zGthJVa+uCpuyCErgDzVXCwp7uvGcnpKbrd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340034; c=relaxed/simple;
	bh=AKeRdIoNVpRehXoMiNGoq6QRcf1DMmRhstv/KG/Zn/U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=g54ADQjlIFsHVTdHG+UwwMwlO6DQD9qSXq1H8iD2tuX9whbHX3ZvUtF6E1Bb/DRj+DejcA7ZQBIG2sn+uuYqR8E3KnxequRj/+aQfvXzEe84kJWw6Shc6Cl/lL7wNRI0NCtZW60jyeDCajyjttZOaXAITtkzJ//k7VaI9dFrQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUUpg/dx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUUpg/dx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0601F000C5;
	Sun, 18 Oct 2026 16:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792340033;
	bh=AKeRdIoNVpRehXoMiNGoq6QRcf1DMmRhstv/KG/Zn/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VUUpg/dxtvQeC14rZvnI0fVX8PRpdkVWEPrCEpw6dulfreOk4pIi0AKGXIULKbuft
	 3LeyuBRvTxgw4csbb9SqeAI8xll4oYzv26CrwlMH5Cp09T9NdF9Ez6urEyL2/3I48B
	 RTwu2b2hYS0zyCqg3jLJ3ckC8XgxABaNonwFYomt8x2gzSqEM4bdp8qxtoGSXuWR6n
	 1IoV+0IM8VaBX+FleSbI20BlOpsNHqym0f58d+U8QpfR4iuEA416lkr/7JEqr/i2vv
	 i1nAEkQQmRnwaBs9cDZjijEjbjpf0C5HqrpdB96vmC3SbWD8gaA5j5tog0DLAlQJQa
	 VsKM1mYgBYEPw==
Message-ID: <sashiko-outbox-176269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/8] dt-bindings: mfd: realtek,rtd1xxx: Add interrupt
 controller child node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261018160653.3940371-4-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-4-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:13:52 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Allow an interrupt controller as a child node by referencing the
> rtd1319-intc-iso schema, update additionalProperties to
> unevaluatedProperties, and append a usage example.
>=20
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018160653.3940=
371-1-eleanor.lin@realtek.com?part=3D3

