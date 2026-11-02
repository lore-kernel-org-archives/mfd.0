Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638713;
	b=Yb46kFL7DmE+RRifDMklSI1X8Fl74w9/kOzAWTGS5LmXzNsg7O/ZxbovkPkx56rysueh
	 QgQ+dzOqoExFBGIYKhx/ntYvWrTw9vUbqO9GgWl4LPzxb1oby3pz5VwxLQnLJnNCTO8o3
	 BdIS4wrM3QfA3RbgxRO1ELUqZLI77mQOXNAgq3bDIBcn0C3NhWvfYncTUs8H10lVxstnQ
	 PCNl/k8vE1YTuLaXmOl0fWihmUJwh58JX4eZLC9W7KF9Jd09awQ3GSGyI/R8SRrp5h/iI
	 Od3wWzB9n9xZ3/HoLK+qwstdD1vENJ66fbP0ovuhISUett8E/0RiG6uibsHfQNI3h5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638713;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ip0MufSsY/NJAUesMAKIo5pe/74IdWNRJCVzv9gnhTI=;
	b=NO09PgSgxGqHBWowjG1mYc0vkLf2er6a15qUinl1lHFl5g8CtC3BATMgK4828T3c8gRl
	 6nUG4OyCIRfXdgBClbuiwEkYbxeCMO0hhe0Hxgw4wBKRMZEm0I/rLvZmpnH1tefJsxnjw
	 s60z59f6dY1kZBdsyhuIs9mZFUMJ3AiMvj40QAKlEG3cxckEmAO+zFtoJPdN3AOYjsxwi
	 yDzY+5XDXEK9MskTGSDm0Fhcr76BA7YuwTjl5ZpUsHuXmDjrYLggsKjx3uCe6XeD07RpG
	 zyOPVJwvG+6RhZmBo6kRW10GmkLjKBaYbx7cl09L+EU5OKWW9hFme/WhIXEktCLLLYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mf6pjXVg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A3160A8C3D
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mf6pjXVg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF2F1F00A16;
	Mon,  2 Nov 2026 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793638713;
	bh=Ip0MufSsY/NJAUesMAKIo5pe/74IdWNRJCVzv9gnhTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mf6pjXVgqbbozUASEx7FwX8nIqaWZ0eEm4kg0bQ70wumJB76/08J02I3xW+uplamq
	 OlC9K87BMpZYNBKUVJzaJLczjZbn+6oAlpZFkpCV96sFUhU7rebhcjelVIToVEqthj
	 AB5G9298oPtgwCWXZeacReZ8rJWijZkhhMcz0niALh6Ww+ZS3ZwOzxQgnvqt+UFh/u
	 /GHSsquKaRBdCn/BOqxO/bHGAxySGwFaIn61/7OF7+sRsUFuQqkMqub55XN5XoF3ZY
	 Nlb0xOxBk4Nsg6KP05Tuy+3kvPoeDgTaA5a7xBH2ztc1WepozagHaxiZwyghLEsoAm
	 W0ef8Rkm8ZrFw==
Message-ID: <sashiko-outbox-193789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 1/2] soundwire: Add a helper function to
 indicate a device will detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261102164157.4010002-2-ckeepax@opensource.cirrus.com>
References: <20261102164157.4010002-1-ckeepax@opensource.cirrus.com>
 <20261102164157.4010002-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 16:58:32 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> SoundWire devices will sometimes need to reset themselves,
> typical times might include when taking over the device to ensure
> a consistent state or after downloading a firmware update to boot
> into the new version. Often such a reset will also result in the
> device detaching from the SoundWire bus, in this case the driver
> has to be careful. Naively calling sdw_slave_wait_for_init()
> after doing the reset could immediately succeed if the bus hasn't
> seen the detach yet, causing the driver to proceed attempting
> to communicate with the device whilst it is detached.
>=20
> Add a helper function that a driver can call to indicate it is
> about to initiate an action that will cause the device to detach
> from the bus. This will reinit the completions in the peripheral
> for device attach, ensuring that the next sdw_slave_wait_for_init()
> will not complete before the detach has been seen by the core.
>=20
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102164157.4010=
002-1-ckeepax@opensource.cirrus.com?part=3D1

