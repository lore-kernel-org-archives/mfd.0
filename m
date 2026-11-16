Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869761;
	b=RSwMVf9cryNC6iO25GJ/0lCphi+wEwF8PJ8qHCHqQ0naz3b02ad5lnp2QvDKvyWERXjJ
	 mZ73d/SCQzLGnCj1/8GqfabDN0hiJ4bqgWrBsj5qKwE8osGSFCzktWbmC5Dynrc1upwxJ
	 XPOc2i6sUoKwBcetCy1EDLOho5KYHVHzpal25KmztZ3voKc/Awex+LEE4fqWiyrlOxz3w
	 c5f+ghTx7XmjPl9Qs+HMXnbKEINs7cI9fzjG1eT59vZ9Y0fIUtBHM7klFxwGz6xwSDgrG
	 2aa/32hGn1UR1d9oVKbuA6uC3c/Oi2yUthQzMxXidMmwXM7YLwpvwmHe3Y6O3ukQzng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869761;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qXXA2dj40/wJ9C9ZRX8PaaFNPm+/mb+Ax6ht5Gf84Qg=;
	b=VY/oupqggRYGgWtEaDOpCCEQjz8/7p5g/5ebKmhSkfxoQ4Iw35ohQ+rsJTsyD+1VmV/f
	 VmmE5bce0xvxKdunqOnZzXNsM9ZHrZYhTxYsA4W95E4HinCbKM+rYlp9U/o0ipw3xYrP8
	 qPiCHOq5UX1BvGjkvexBZDz/ADtd8R6Fhk9R/x3qfy+HNGRvxSwXVX4v5cRvCN2ci+UiY
	 zLiFt+iv86AxDoB7xMzwpsQuj/VFjrGUxJndN0g/xtvbKPUNI5T/bklx3eQ8Qxp/fug/G
	 dD/UAHrCzX4aJnsYX88/9evyHvFqUktEOiskYpMynSJoKFV4vz30TYcZ9/c7h5Q4fUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQh2pXj0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6910F606A32C
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 22:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQh2pXj0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3B61F000C4;
	Mon, 16 Nov 2026 22:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794869761;
	bh=qXXA2dj40/wJ9C9ZRX8PaaFNPm+/mb+Ax6ht5Gf84Qg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RQh2pXj0+DsEe2/tqp1SG0maPMMS4e3Js7HhLANPBcfB7rAIaMmdNYmZ+UTfarB71
	 Kw5oEtGlxy7BVAMAjxR3wysUEAf3YaJhMX3wqavzpSp8xa1TAMobU/OyKpfuY95jYG
	 rFEg4dJGRE2BN30mxVQdL75k0i5mYpnP7V/ErCFJK/Utb+y3ry4fpfJIO+DauDQZxE
	 ml9ufq1OFZvb0srgoPgtRcD9rwD3xN+PPePTvSEXPBpyNTDoQK+x9ArZhjuEdU9Jdc
	 yf3d738QubM+kGTWzIpA9m4+vCA4JGxT5pE375WK//UFUgoPoee6NpbANkRkk8DnCR
	 shR/fgAC2Qn8w==
Message-ID: <sashiko-outbox-217824@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] iio: adc: mxs-lradc: Fix trigger use-after-free
 on removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116224803.61154-2-festevam@gmail.com>
References: <20261116224803.61154-1-festevam@gmail.com>
 <20261116224803.61154-2-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:56:00 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The LRADC trigger is devm-allocated against the IIO device, but it is
> manually unregistered after iio_device_unregister(). The latter deletes
> the IIO device and releases its managed resources, freeing the trigger
> before mxs_lradc_adc_trigger_remove() accesses it.
>=20
> Since commit 699fb50d9903 ("drivers: base: Free devm resources when
> unregistering a device"), device_del() releases managed resources.
> Consequently, iio_device_unregister() drops the trigger's allocation
> reference before the driver unregisters it.
>=20
> On an i.MX28 EVK with KASAN enabled, unbinding the LRADC parent with:
>=20
>   echo 80050000.lradc > /sys/bus/platform/drivers/mxs-lradc/unbind
>=20
> reports a slab-use-after-free in device_release_driver_internal().
>=20
> Allocate the managed trigger against the platform device instead. This
> matches the trigger device's parent and keeps the allocation alive until
> the platform driver's remove callback has unregistered the trigger.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 699fb50d9903 ("drivers: base: Free devm resources when unregisteri=
ng a device")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116224803.6115=
4-1-festevam@gmail.com?part=3D2

