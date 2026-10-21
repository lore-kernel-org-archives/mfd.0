Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585300;
	b=lr3WF/v8vg7KxRZ6apse0mx5uc7rUCqx2uO0fGqZgEtOknnF5Fn5+Zgh+Dvpat8OLdq4
	 ZTodHrJQGD4yV8P1vv9M/pGXv8pwIzMPlmq0aXSc8J/v/GfwFkWGOG2gTDvpnohV4uxQx
	 YbqX0/D2y7jP96yKpeXzYsEyCyz6KElEi75pSPBBYHAhzWrQXrsUsYdufsKd0rLgWmhm4
	 LJuiOjGe7yf3zJwNWbc9AKsGnUlY4tfuglxclRsK2tUkBv5qXOOn3SK/alYYh07k+PX1f
	 74rRO2NEeX6nYtQENrShOSY/Oi2qLh37l9Ac/WWDZ+fPlOlIDdFvXEdrnVrnO6NYitA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585300;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vE9Jcq4uoZfjEuEFZ9t/Ygy9bqnMlNDau4sF5s4hY+Y=;
	b=A0hhlgIXgxxPJrXAPRXnRz6/KXUess13QwEZJWWu8jPBDVWFXUedZvLMgGkJj5k3HmAS
	 lv/wGvU5DP+tAym7+NhJ7hJ3kGeNxLk2UR1ZacGpKMXvrIfacDM44eA7NmTlTB6e2xfJ7
	 4WkRQgaQUsn4OSGI/N/h+w7p0NWJLvk0PclKrQfONR3ECVjLGcq1yZ5hdFbcbmP3xqIYj
	 Z9GxtR+rDGDwxsNDzvLQ1ouASzz/xeiyzwrh1UsTk49auX31ZrdA2Yet7vZfecHn/RsB7
	 TqMY5RX7SMKBDAt4tOQktx20oKJxjfGFOYx5pgyKCxHawlRVTQJsWysyIvzt+c2yWjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IDka3V/Y";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA0606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IDka3V/Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05FB91F000C4;
	Wed, 21 Oct 2026 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585300;
	bh=vE9Jcq4uoZfjEuEFZ9t/Ygy9bqnMlNDau4sF5s4hY+Y=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=IDka3V/YyxfNL6hkvM6CouX81e+eMcWjxQnBx3QkQojgV/DNIAbn1trXGQOt7gCS/
	 zRJ7xGHIHzZ7FZHd9b7Be3AewY9vnh8RydDAeOxT9bwj9/8gPH6w1gcXDslCG/0ZMo
	 oTYTuOGzDMdQ/0RGVProcX1xHAWCHZv16RqcpMcffC9yEopZf9h1kvMTUDJ50UxWq7
	 SpHtlcddAgDJg41sqxzAc4Ay41GN+19sqyFWY8tEpeeKLtU9lal9nTCEbLtfyE3etA
	 BUzF2KnpDEEYR/j5i4fUy72mnp1XX1W/aA38TTWG7+EfQgpxhowIVrcv3NK+8KR/2+
	 5cBeU31wxCKIQ==
Message-ID: <sashiko-outbox-180232@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/28] mfd: ti_am335x_tscadc: Retrieve parent driver
 data via dev_get_drvdata()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-6-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-6-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:21:39 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> ti_tscadc_probe() stores the address of the local pointer variable
> tscadc (&tscadc) into cell->platform_data so child devices can retrieve
> the parent struct ti_tscadc_dev pointer via ti_tscadc_dev_get().
> Although mfd_add_device() deep-copies platform_data before
> ti_tscadc_probe() returns, both tscadc->cells[].platform_data and the
> shallow MFD cell copy attached to the child platform devices retain a
> stale pointer to the expired stack frame.
>=20
> Set the parent platform driver data before registering the MFD child
> devices, update ti_tscadc_dev_get() to retrieve the parent driver data
> via dev_get_drvdata(p->dev.parent), and drop the redundant cell
> platform_data assignment.
>=20
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D6

