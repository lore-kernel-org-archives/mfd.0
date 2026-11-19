Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118008;
	b=BYgTpBgp9yWeV7JokRSU/D6SW7uGoGcf5D7c8qCLsYQp6h3asQWeSIIl1sb88FoXhhbm
	 giK2MeUTrt2ygkn8j6fje0vKewEx1YZMxYRzMkHmrtjwtv1BMpK+aj5FjbkXE2tCLS9Me
	 2TXSCamrWRIsyTAaVfA9vlTlHp0qpnGv6jPDT6iGon8wKp6VyUV08c6jmk+tR5oPDuTvT
	 fMiwfLhy0jZDsUDN92YSDy5qRtp6khgNebZ9OguK+km93FmxVefpLziZK9SLuLWDJuE4t
	 GCJi3jSxZfRK3sOQu6NdTxLvczn5mhDfEqB0eWvdlBBKmA3lKcU00XsyT+3jHeSwXSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118008;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SduzFjqslYLLUeYcHIrlYVTvXappQ79cZbtGqkFOzsY=;
	b=yDnNfXYUT+IUUetVqnwyO0vRpqydbE3tHQtE4lCm7gM8I16en/tMt/cLY1LixznQTKjZ
	 YwEmziJNGtSoE7TgBGymptzrMxpbrm6z+HPG9nrCk4xwXlxHee5Q7Enj1ISh8UC0LX0W7
	 kFZXn+VX1vTEQitC/POO6OYG203DGfUksfiF1079RbVkouTCDEeDz7b4Utg6kY5xKUzab
	 1bBWRjUf+aOuE+dli3yCAMoYAsAwb8mQ8G0/npPqEssDy08j4DJYUNTgX8DjSq4yPSRe7
	 iz+VymUhuBJ/lBkyfw9VlT4COfpTRMXBhF5SXe5yfyxCS9NM3C8K0ExRTf1a70IC0qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AvA8w9C/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E719D606A320
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 19:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvA8w9C/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9261F000C4;
	Thu, 19 Nov 2026 19:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795118007;
	bh=SduzFjqslYLLUeYcHIrlYVTvXappQ79cZbtGqkFOzsY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=AvA8w9C/Vl+4/S2BOY3ia3BkHE0IlUkCaAYBQYIgfq2AwTMMnYLN5zFmVAlpArrBh
	 4aeKDyw11rcspxnMgsfGnvpwyYTdTh/eZpkccJ5sPM7Gqy/tOX2jwxQ+Tqkh8n9spo
	 somsd5ulsg+pMrqB69c/BYCb4foIu/Z3sBl0KvAqdFZTj7UCBgt5xbmNvOiwnTy/08
	 dFVgqa+TfbEuSWXAfw6GxcQDNZfN2CiGW2SgL7Mhmosve8id1ok6o+kYkpkM1j4aEd
	 T7EEQkP47Uv1S6ylYeI1N0Hr5+fvgxC0M+7l+ENv+7PCch9PRzHWKVEPJVeWoPHlen
	 muyp0dGg9sMPw==
Message-ID: <sashiko-outbox-223980@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] mfd: twl-core: Reset twl_priv using
 devm_add_action_or_reset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261119194939.2436337-3-lee@kernel.org>
References: <20261119194939.2436337-1-lee@kernel.org>
 <20261119194939.2436337-3-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:53:27 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Register a devres cleanup action immediately after allocating twl_priv
> with devm_kzalloc() so that twl_priv is automatically reset to NULL just
> before its underlying memory is released on probe failure or driver
> unbind.  This removes the need to manually clear twl_priv in both
> twl_remove() and the probe error unwind path.
>=20
> Suggested-by: Andreas Kemnade <andreas@kemnade.info>
> Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119194939.2436=
337-1-lee@kernel.org?part=3D2

