Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990424;
	b=K1nmZma2OoGm/KV7hHJkt+jOy1WVoXuTH4m5puHn3CmWkGmKYFwCYyscoPk/90Q23v/O
	 kxLq87irDUAQnw97kyiVztgU2DHrRfFQriKknb8iqM0r3WXj4QlQ7Yoh6t8XvGhr1pecz
	 kgiVIM91cKTRN5q2dAB/U7Lxe+3UGwyJlSu+i9Iy8yvwQFa6j/8Pj89ZUl7oAnPD+L9fx
	 bfonjyx8h7t/hR0jwAiKfhc+B4QMS7XSVtPUzYbuHqH+NEosM9gvb0I/pzJx+wyA53L0s
	 dNGyBJ2m4AcN7h6CGwWXG62d9Ok2BdRyUYU+AT60JT+Ap9BEq/mZd+QvdaMyX6Fy4Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990424;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rBw3psoWMtR8jGrZS1xEmsSBqrxaOBh04PiLz+lft3o=;
	b=xaByu3DqVwkwF4Jr16VE0KrKvRZVDaehqcCljuq1RTGJ9rbG6HRUi9mdQAd+Z8chNHs5
	 DZgC8BDpDgHlOIbvOaPkNuC7ALtCi4yFjNW7MUxYupCs4B8QAKN4+buIGZc2mm/ToAcKg
	 fMK28CcQaT0sMlKrM43Sta4keOpGxU2AWXJyNV+HSW3CN7yIUON9tiD0FS0/uPnLKDcoy
	 d9aX5D9Vwg81owXrgK6XuFBAWw58/qXDdOUjpRR3zEjo5sck1NuMKO3okQWH10hrFlhyi
	 fSAUHvg/SsZoshmsVGRXu410I35rJoL506oFWclCsbF9+VjTk3BFkcYL5vEeBRebXTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OhxNa9At;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F1606A31C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OhxNa9At
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9960F1F000C4;
	Wed, 18 Nov 2026 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990423;
	bh=rBw3psoWMtR8jGrZS1xEmsSBqrxaOBh04PiLz+lft3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OhxNa9AtC/gwyKGXgF6Fdz1y6xiQ5sCNCiFJuW9roak+11gi5RYBk2wg2pNlJggAh
	 B/D7bcTJPEaMazC44s5GOE5iopWOVrVou5UvJKaE8TSOMp2gJVgtilM7rWYnMBJC7G
	 iH69X4K8hV68wi6qBIKPXUMozZpKeDlHx1fXhTP1ACR6/k4jIA6AhgcQbVNcqLFKIS
	 KATrXn5VtohLG5ehjPbRyzdbHYHF409JSrgtTUfICLVrn1HspdSMufxSyU8aOBqAjj
	 A3kuPa5NkZecc7aoEZ9GExDEjEBI9pLVTJTUspkYAu5FynzUcBr162TGCaaQomOgAb
	 DGogZ/zgwyJ2Q==
Message-ID: <sashiko-outbox-220441@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 07/13] mfd: nct6694: Refactor USB-specific data into
 nct6694_usb_data
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-8-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-8-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:27:03 +0000
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
> Separate the USB transport fields from the core nct6694 structure into
> a new nct6694_usb_data structure, which embeds struct nct6694 and is
> retrieved with container_of(). USB-only definitions are moved from the
> shared header into the USB driver.
>=20
> While at it, use consistent names for the USB device, the buffers and
> the core structure.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D7

