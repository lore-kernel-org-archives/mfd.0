Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990207;
	b=f+KH6gR9npXPL1K7UyuoaKY4oPD3CBA+VVScqC8ma27kL8enXwPwyXG7qsanO9cF3mUv
	 JpKl61WMTPsYL+IVG+U9GeOWSsNmFWXf6IZg0ZCFdMTKJAMtu2p9IIvUteNpB2LjKIeA7
	 a9FCBQm+cksqYmippS+CbbY8clTSMpWr1B71fP0Ok9vOWBCZ+O7GDUFr2xyRoWzXIeek+
	 AXAuqZFY64osjj1IwB4LT/3eWaG8t2ms8GH0A9ldmCn36PF6mhtWFiIYYdAvvezG7olX4
	 sRPDJfzblYLRtbTLRqWWwv/eZHSfeau4+rMNTJJGQ3wO11DgogvPCyFNw9VDI2faaDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990207;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vMOgqQsaARtkdoauJMlN+ukNc4ZoV4xFLWVxHXSoS80=;
	b=060UmgCSspBGpOo2zsrVfoa8zesJLvGsy2uMeFV6hv2+udYArqkVqWnjYX4ZGrgfgI8v
	 RrCVOQmFgvGPfAdjB1s/xSFHLAzaiP6j/iGl6JcdYCd+kPyBz1atr1Ku2k+ZRuuVhjhde
	 V9VLTUkqB6bF0iQkCbgeR+51V2IclgXotr8vXBZhj2qNl4goCw3wMbESKOWeEP4Hbjlrs
	 FCbxFsucuUDIF+v8UeIw28p4dqdbhw7oGkgx2Y62p3nqqulO0YUi2ivXsjHW19wyKt+Jl
	 7QRkZ2CKxgIaYVUVc+UcXuAsjWSULTUyfm6yn276OOvfijwV6j5IS6s2VZJWb7YLC3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T58GqEQE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C71606A32C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T58GqEQE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D4A1F000C4;
	Wed, 18 Nov 2026 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990206;
	bh=vMOgqQsaARtkdoauJMlN+ukNc4ZoV4xFLWVxHXSoS80=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T58GqEQEMHu+FW6iePWuGhRvnIkscj0uciSAN6QRxps9mB7fC3OYts3BYGIujE1cO
	 vX5YSsEInk6lzlcLAmUcelTAONMsGNNoDf7eVLmlqx5Cf6D2ESQl+aeQMLFl9+bEQC
	 aaVXEzEd2wfDHdiytJFyv3n/+4Y3UdRCYr20Iy9pMsNqh1f+WXHrVMlr/LJx3K0F1e
	 bPAJ2vM71GLDTnuh5Kk1qFv0HkwLdb+boZkjlLXDkx5eWbHPFFz2sSnSLKTjyeJofK
	 bT9/coEz8uyAaK5z/QodqZpnO2rYS+QrMZsJ06BItrWki/bvrJXbXzjUEk/p407GnV
	 L5rmUZuypvZew==
Message-ID: <sashiko-outbox-220435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 01/13] mfd: nct6694: Validate the USB endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-2-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-2-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:23:25 +0000
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
> The probe reads endpoint[0] of the current altsetting without checking
> that the interface describes any endpoint, and the bulk endpoints used
> for the command transfers are never validated. A malformed device can
> make the driver read past the endpoint array or submit URBs to
> endpoints of the wrong type.
>=20
> The interface exposes several interrupt and bulk endpoints, of which
> only EP1 IN, EP2 IN and EP3 OUT carry the command interface, so the
> endpoints cannot be looked up by type. Check that the expected
> endpoints are present with usb_check_{bulk,int}_endpoints(), and take
> the polling interval from the interrupt endpoint actually used.
>=20
> Define the interrupt endpoint by its number, like the bulk endpoints,
> as the pipe macros expect an endpoint number rather than an address.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D1

