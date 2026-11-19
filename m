Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095833;
	b=tb/ZQhec06Pbpse/3nFKoH5YQzmMaFNDZ+GyJFZkBOYSAIY+hP6Zs/BaBQy0kDvtiSZM
	 NpBf/B9erDMitb6vwgFv3GmGeLUEWtXY27PNisj6BCAdi/eqiHdq1S5N4Kruq1Ih7ViuB
	 kQkndP1dCFBrqY9ZhSRxlYjI6wdvGEUZaGXxjdvF+e8JzL6j4DDxJo8FktY9SdCjsbjUF
	 iFyk9hp41Fipkn8L0UiA6zEG6F/VpZyYwcyPL/SW9VknuqbWiyuKzts3MPegbn+icySrS
	 Wwn60UcEe4DLG6uTBJZYAM7sSnkZL1dBY0NbCAFXjiw2Jvzby7w/nyqfibQCLIhDhUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095833;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hLLONxzGKfrCz1Gwylx7RzmqDPdA8NDXhL5dEKexxSI=;
	b=KCVH+4zoRxcNb9w7o+FpX5+T0gl0PoP2/MB/licfjJvvkD0z58o/5t3C+12s9suIJ431
	 R4tAFN+zMxzof4x8prrZv/eMKvulTS++vjRgD/WiyHjiTztdtPyBUW2rq9N8VubWtABNG
	 DlEaWPhH/s8xLqXzBVePNfPlHiMjpfDQlhR7cDSTcgVoWKi9WxVha0ul4lZR7/yb7frZV
	 7TlokUyAkOg9OHp5vqFMFSfvsw0OXzdP03vNnRMyIOzTcEwy3kB9A45mJ/Ta/nAuWV+Bt
	 wWUHxuEPK8ZhM+PiSKWZtuIpP0KOHC1VqVG2QnldVn5fE+EJMjJG2YUtXT19UpEskPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=clw7kqd1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186F5606A320
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=clw7kqd1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D451F000C6;
	Thu, 19 Nov 2026 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095832;
	bh=hLLONxzGKfrCz1Gwylx7RzmqDPdA8NDXhL5dEKexxSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=clw7kqd1bm0NPmKGjAGM9dnhLbYatMAZBf24fE8XaQDY2+AP6GqjVc5mjEs+gsuTl
	 fGYwPdQrw4aQNr96sVLMKRN5DKlYTtfi1SIeB99+/kzqVLZqVbw7Duv//ziicJjlHt
	 X2fyoJxUKC2tJmQ/QCPfjhcPQs84c27gNWWzdEn9jtwQijYcSnlfkkl0xs5S1PrTC4
	 24ULdgptizXX2uf3/+9MUl9I7YrQS6ZFTkxjusamT2IefYdA7+ulJxbDHIpUKM/qJ3
	 r/C+LnLDa8M6cYBTYzIUSrfSsw/C7jL+0ZwmLanySbmKrm2X0QU7C8A83J4jDjWlVw
	 9yDRPN0Z6OBHA==
Message-ID: <sashiko-outbox-223196@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] iio: adc: mxs-lradc: Fix trigger use-after-free
 on removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261119134041.16611-2-festevam@gmail.com>
References: <20261119134041.16611-1-festevam@gmail.com>
 <20261119134041.16611-2-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:43:52 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119134041.1661=
1-1-festevam@gmail.com?part=3D2

