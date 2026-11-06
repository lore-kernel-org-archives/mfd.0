Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943764;
	b=uICQGUpUJ7Kk5tdgMH7mHGHc5nnoPEGzQpJN3wPoddu5Cm+TdupsTop2aZMUGGRAhDcE
	 pQq4LHXtTw+jDKBLQHLSOC1OzwDMsWYqADfbyaD0jloB1ccTCWhvNVsvy2TBCPrQaSEW8
	 V4w+65/5n3OOCvuYtpf5xt9TJ8bXQo5Q4RA5zGTFmKs4DxHeSUORx9l2GlKq7lOeBqkM/
	 jdICnqm8HF/4K/mzpJJJEkYbl+dwIOnrpB42QWQlUeA3bijp2nDKB/s8/WUVIt5SlVvzM
	 F2M+DlKSNXSlfY6Rx+B3tCaC2tTHqR8lEmHmBs7MKL5zCFWH7xROKrrpYcmVYtCabFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943764;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MV5jKfRk8O1qwf0ZMdAdvXep+B41orDrNp/ZfPVSnsE=;
	b=bsTh76l6G8eVBvby3vK4fQNY1TNPMIj0yJDX6P3YIGkbq9iMftdhnXfy3zfYBhrIQ/OB
	 rMowmLuHF9McsKhJm2yiEsRr1fLUrSF4bn/xJ3tVWRtbfwLa+QcXEldW+ONOvhzNB9CRq
	 qnsgCCkqZNZFFtpHz8F9i575OfgMuWNA9s+d1IBRsnS1inIvrw1D4xYparZZEtTGjH7Vb
	 BQ0h1BBAuLlOjLec4S/lPSAa0n5n58ULXR8r+PWeyQ3O9/LO4yLZglCyYMeFAojdopiPL
	 vUSvNsGp/6IathNz6Xg7I+aUJSLu/s3H6fc9cReqKssmHjK+o0CMnYKCFlnrr45mOBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aL61QYj6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E83606D809
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 05:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aL61QYj6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA9C1F008A1;
	Fri,  6 Nov 2026 05:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793943763;
	bh=MV5jKfRk8O1qwf0ZMdAdvXep+B41orDrNp/ZfPVSnsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aL61QYj6pdciJdvU+uSgwoE+4tdRHIpzis2K92MNX3OlhpYjz1U48S2r7O5aDmoZ4
	 Lh2OYahpUqPaioGW/W4LE8Yw/v6ZsD6lTzHvAjK+HcmvAXi3hiN5s+qTqLebG7C9G1
	 JVbIxhjxa9MkaCtVm36nGSpKQK9WUkM+yRykx+8htvHDY4zlrGSHJVfprQG4IteRCK
	 F6mngjrcedslnswa7ocubVUHXJ9Fo83tN2sC9IVmc4GnIhtNYC48WfzNjRahFoeJyh
	 KuzH3bmHMF4SLXfunvZEQiwlaDqosJliVJa0hBWv61S8HUCNssXCwsjYf61Sky9PlP
	 mkrQRXZv65djA==
Message-ID: <sashiko-outbox-200848@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] ASoC: arizona: clean up coding style and formatting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105-arizona-asoc-v1-4-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
 <20261105-arizona-asoc-v1-4-25ec7338446e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 05:42:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Clean up minor coding style issues in the Arizona jack detection
> driver, removing redundant parentheses and fixing argument continuation
> alignment.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-arizona-as=
oc-v1-0-25ec7338446e@gmail.com?part=3D4

