Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944191;
	b=Cuh9nVi7zKj68eS9AQIC5wZzxBkfkIPMYFT15QSkyUho9AAYYbTPsajiqcFZwzQRjr1C
	 2RIqirwoThT2uk59/sxZyPEJQHTEfYRlTBbMZ8ssUjJaQChwa8a6+ENzkmw0jyjO4n8ep
	 mA9p5zHb3B4hBQLeNBHeJm/3LH1gLN5YMan7oZrL8mHb5ZqBLBuoIVXNun7bDJk4CzCUA
	 Qk2t9w2Zym3Xvs0zh0nMQWDa4NvhIij0zLdsqET+TsqWJoM8KC+A9MR7xW3Sz/MqzoEKV
	 4Zy0jMl67Y90z/HkQs6VJkTHsqhFe1Dyatg+vz0a0th+ClLicHQvH6z3otEzyJO4lmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944191;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HThExhz6ffXC1h0YiAazURdA2e9ZKPDsgnXXhfEuQb4=;
	b=K7J0ExsK1OLgDxbikL0XBc9Qv8TQLDmKs9taBL23D76BXC8ovPJuWMxPBp/SwzkXMvKu
	 b1Ns8DVb/eVwIeVGNuA8QKGh9HPDDwb/QuddxjqmpOQAMzofy9WEkGUn4y8pwqOiT/soe
	 /54B2wVuw217EMkr7u6MbSSVkYS/zpRMf/pWdpY7NdWQvioNTa8mEEGLc640Rbg4pysVq
	 pB+UmbAN59aVFbochY5/5PZl37y6Bj1K6lQsK8B8o/tFmH7ByMJzcNHdGdqqXqBvdX/VQ
	 vFUHKCobHZM/zj7TXs98Vt38OpMP51mxT9bNw3EhC1tcgXSqyjUuuLKbauiekuyJrHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQO0t1NX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CED2606A326
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 05:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQO0t1NX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07BF1F0089F;
	Fri,  6 Nov 2026 05:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793944190;
	bh=HThExhz6ffXC1h0YiAazURdA2e9ZKPDsgnXXhfEuQb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eQO0t1NX3oWpp6YxNb1f7AHlWUnIHHqWEclM5fFto6uKcq+GP2yXbGyD/lxtEgv0t
	 R6OW0s1a1A34m5I0sDQqvZa/1bWQPtY5YTpkWcY73yWUp67eop5giLqx6IBpfEN+rn
	 M6mDg6bcXEaHVDdIx+l3kFyjOGE9+swfOL1/o8WiLnqZLuXVgMK/PKpEZhWKsahxaC
	 I2uokrT3xBih3vuA3MdfsrYnko2U7lRaG7bDXnp3kOQCm0Y+HFsmG7nNJH0a3k8giK
	 hBn1kyhprGbxmTNLes8miR17d+Hsrc1e2LidwV2ormk26t7aEa6OaPa5nnI8Plgsmg
	 GN3gxELhCuf7Q==
Message-ID: <sashiko-outbox-200862@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ASoC: arizona: always parse device properties
 regardless of platform data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105-arizona-asoc-v1-2-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
 <20261105-arizona-asoc-v1-2-25ec7338446e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 05:49:50 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Always parse device properties in the Arizona jack detection driver and
> codec drivers even when platform data is provided, allowing DT, ACPI,
> or software node properties to augment platform data configurations.
>=20
> In the jack detection driver, initialize the headphone detect channel
> from existing platform data before querying device properties so an
> absent property does not clobber it with the default channel. Preserve
> existing boolean platform data flags using bitwise OR assignments.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-arizona-as=
oc-v1-0-25ec7338446e@gmail.com?part=3D2

