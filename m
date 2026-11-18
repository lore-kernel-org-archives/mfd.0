Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990139;
	b=RcuWRXr3pnwugdgtF4DwJ5b4p3BKoJVDEBC77qVYrIk8G2ZnIE8m4IvdfjcD9zvqLMsJ
	 WzsUZ/LvDdioxR/wPL53aKkskmNqp/ljijn6LOrV8EjS6M/Y3gLRBv0KsDQMsx9jIiEp2
	 Yz6SWcas1i54TtceQNzqGIiQJ/9bhPk6UyoLExJnvzuhC9tyILGKkUeW1wtyqeoXQh/r6
	 snsFTM0VLdgInDGW4YLUHkRzez7/2pg0Vhu+oxVs1GAGCV6shbPmgT+3Vx3TgymsBVP8T
	 6DSiJ/6WKcwjSVcb+6XNBGrvHuf2l67ZuM/mxKHCOZeEVJMSXx7bT30TN6SDfD3eM5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990139;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mLRNRFGdlipCBAyA3JXLkhajdi/IJeKGDV80uZLYJtQ=;
	b=djZj6DBHjRnP5gOLvUM+qQjskB6jqa1CJQiaxS8yUHsejLwLSmLYgTZ9HpRxvBXxrZ9D
	 XJEknOwiSEOUowRNyLIGxThub9RCJbY+dnXf84tM35w4rzffCRQXNQ0ZPjdBFU+z5QIig
	 TkQlYtGkwgSehGnmiGiF1AY9s56hGtCh9NzBtFecBf2skQl5OVsplT8oDdFGVALNgQhay
	 KKN8utc1rFGUy8UR+pnvJ6m84WtbAt8D7OqSt5lx/rAjP5uRVPqvyiM5vgLWkHP0tuo5j
	 ZGPvgPtG5L918hK/6+ecQD6CtMHgu8YRMBD5FTYuznYCk+FtbOcHxtxt5opFPTA1P9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHnay8S1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B20606A31C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHnay8S1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED4A1F000C4;
	Wed, 18 Nov 2026 08:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990139;
	bh=mLRNRFGdlipCBAyA3JXLkhajdi/IJeKGDV80uZLYJtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHnay8S1xmDLvXmG1/75YjkSaVXG611BX8AoqdwwK0+QDaJK19s2bG+VAedVApEE7
	 CnglyAA89XHfXVmIbFKLN62SAmH8jZ9QY2cC2sEB7sRyGmknZ2PBxMe3xx+VzZYkmo
	 bcXegA+BosJR2C4dKXdhme1kuasyk6td7aqm8In8JzWbZwIp8tkDuukKDrhu6HNsQN
	 5N9ml1K0utwiHhEoQoB3RFPhS8rIkQHAZqvuB0uoSLYBvJJvFY/VbqhJOapfYL/Oms
	 07435cKuCR2ac9LHQloaKa5nH2Bedxqn7yEk2IPvD6jv3eT5S6gEwrL6n+XyH+Z8ph
	 Q/+v35KhA0MNQ==
Message-ID: <sashiko-outbox-220430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 02/13] mfd: nct6694: Check the length of received
 USB packets
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-3-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-3-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:22:18 +0000
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
> The response status and the interrupt status are parsed without
> checking how many bytes were actually received. A short or zero-length
> packet leaves stale data in the buffer, which is then taken as a valid
> status and may repeatedly dispatch the same interrupts.
>=20
> Reject short response packets and ignore short interrupt packets.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D2

