Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E635C4DE72E
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061040; cv=none; b=X0Usd0K1fge1eG1NpwO095PP4gZhw29zGNneKsVFr7s7XhJou/GTvMNnYHGzdZht8GQxfv0dKGwIhBC6ClnxoXoeUp4tOSGiyo4KZuGchu9LQ8iewgWBM9+gD8n7ZyoPAJ8/pVkOL4PFkweTNqvGe1sUVMpYZNmyccBvlEwiiq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061040; c=relaxed/simple;
	bh=sWK/mKIhsWPiTViHU5mJ6UJFB8N0ocH7H3wdxv2b8Z4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KmiWa1fluiOBTM5Jn6i8v8HvokCgyh6p2J8KVaIbEETSN7M1keXU6/CO+W70WDUDIwfOz8HOpPBcPIAO/kxrT5dcZoUHdlXiPkblsvUxS84rKdFl57ZGOj84UImmMvIYcTm6WId6lm0ThUVb+2Qq9c5TLT4r9WFzcq4VuykqjMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJeNxywP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJeNxywP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA0F1F000C4;
	Thu, 15 Oct 2026 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792061038;
	bh=sWK/mKIhsWPiTViHU5mJ6UJFB8N0ocH7H3wdxv2b8Z4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJeNxywPbK2pFcCb8NYRiscwPH8filfTqyb+pYAMPD/3D8dPAq0jkNlJZNG7RyVU8
	 yJ8P+HxyUZ3K6cA4tvmIpVU2OP312NzKHHd0z9C8YtWvaQsfqFRj5zyVHY6Q79kiWb
	 o0Gzqv3wwpSrqpbGKQ/CcdJbSGvJZF4hjojKwkUYXui3q2llE4IIpV0Fi0Iqxmh8S4
	 tp/VChXEezlstc85Yr5UClcL5VeFAmznOqV28fUqzOA0p/dW2C1BZCq/N/EqrXYIck
	 LrJbc3vkvRFWzxojUrryl+YrKcAuhrJZW8Fe5kGiQJYgw3j8UrAPjDo42VjIZA90cs
	 WOHXzgDOJuz8w==
Message-ID: <sashiko-outbox-172664@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] mfd: tps65910: Use
 devm_register_power_off_handler()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261015102320.23760-2-clamor95@gmail.com>
References: <20261015102320.23760-1-clamor95@gmail.com>
 <20261015102320.23760-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 10:43:57 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Dmitry Osipenko <digetx@gmail.com>
>=20
> Use devm_register_power_off_handler() that replaces global pm_power_off
> variable and allows to register multiple power-off handlers.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015102320.2376=
0-1-clamor95@gmail.com?part=3D1

