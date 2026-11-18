Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990282;
	b=C8nmKkK+Cjq/B7yiCv1CT4znem+flKoVS57E7JkuNgGz06vDKM1LaMz/9YcPHeNhgdqF
	 A8zKSdpesFXMkjZiNsiGcswwcMQiGyg5Bu5vs3vkZCA0cf0SS6feom57bErTidwm4jbox
	 zu4whahpNsW4NkMOqRyF/UnzMQWUqT4VPsCP+FJMmVoXDLm3dTsDjU3eAcU4IUFki5v3Z
	 j1tPhclx5jZlaberBBvkXcKGfQvDja0O9pfZ7KrVz3lpQlW+o3636LpcN6AAln6l0Vcbq
	 hZXtqaZUsg1WMFBtNfgCPIwyTJq6aWxAef2zd4XS1QA6+tj2yuf09CLB1Lw/TN5+xLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990282;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k232mX4GZKUKGa65sNItUuaN5bupCuwVz8HXEs1BBxQ=;
	b=MxGff8gKQJ0BZ7qnNHlsMUnhqss6WvltoQuG5HslpfjRl7jAN08AxWoDUq3MyGSL0sIy
	 Ei6EMiTRGbLm9gxIWitV2T2cLAJDcGU3E2S2+ovrbvDC7FsUK/bKr+UNTOEYQ5CzxfUj6
	 GP4CYtRP6dQLdbTLYWtsaDwA1Qcoou0cBz2A50OsVtIxeN9XgEnFapifQ5wjpSW67gyh8
	 ETyrl4GTuosmtBR882Yo2klViXzNKX9nINn6VXOiyftLgDuf9WmtvnSJghx0COvvHF0Zo
	 puXJc7FTygTZiX5mg4jD6ts/uk1pc79f1EAfVSBkHTpQEBD/aHPSGNcQT1IwMaeqAwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmpzVC6m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D61606A336
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gmpzVC6m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198911F000C8;
	Wed, 18 Nov 2026 08:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990282;
	bh=k232mX4GZKUKGa65sNItUuaN5bupCuwVz8HXEs1BBxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gmpzVC6mXBAhoEtRfSwMGJrMNRmZZrJV4WKuXQMgb47REMl+h/S2I9S/4q5l/0tZx
	 /sEP9enm1NJvQ768+xLMa9udYeFhf9AXPoCh71l0PfQgQ07G6vbEi0n9e7nh/L7CMW
	 uTjn0cm7bw83QNvkVq3QgVk95MJ/aOnlYCqt9MzN8ViJkmPFWpXiAgf73DTHyp6+Cp
	 GkI4ma4AXBJ8YCDjcQrC+yP2A84/L84H6VcgZEpzQeU5I+xrLl162rNdeXGzggzcQz
	 x5tz8tEqdl+KRWzLZCjQkuvrD0Anj0dnvx0jNND2ZDZ7pRPi2qPB/PRL78E1lTPCOv
	 JbdmQ5K0GUaag==
Message-ID: <sashiko-outbox-220437@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/13] mfd: nct6694: Transfer data packets via a
 dedicated buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-5-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-5-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:24:41 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Ming Yu <a0282524688@gmail.com>
>=20
> The caller's buffer is passed straight to usb_bulk_msg(). Sub-device
> drivers embed those buffers in their private data, so they are neither
> cacheline aligned nor exclusively owned by the transfer, and mapping
> them for DMA can corrupt adjacent fields on non-coherent architectures.
>=20
> Transfer the data packets through a buffer owned by the transport, and
> reject commands exceeding the maximum data length.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D4

