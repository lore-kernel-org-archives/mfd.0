Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580359;
	b=QxA+/hEunwqMleA4MKKTAFeDHzcZe+F4uCR1nIgLkaeNNIUgJKi+s6z5KNIH7agLooBL
	 3R1I1A9sdQISkLsYU7x9I5cTUWP/M9GEFdRL06jD68z4S1qCaNyMGa5XThrE8K9m+pJ3/
	 Zlrc+MY4H8muck9NbkEm7vh7h/Jxc0gB5AacZDxmVJH5IWmVOaD9IOnRbfn/ggAib5Wed
	 bCQoOBYMU7VrSzr/kt290OjcJmAi9IuIfKlSi+rzIr9szG2gXe8mILFDcIjIBX5gRQrle
	 CS+gT3aaqxRblgfgDx99tuZx3eYAs8GnFXEW6fjL0HRXTotd244oFIxSgLUrbydj+Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580359;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1kaAtX4zZ/PIHCFZYV6cp0WKLJEgUFtAWwiaGlqrgpI=;
	b=OVVm7pgGZ7pwqUmNAHUiFzc3kJTRk5la3Tplt11yhvfDVd3+j6l8weawVBSeq6kr+vh1
	 rLkuPo7aXUvlQMzw9RlHBJi0LPhSWId1dm3++LD626D1QREIl9xgkiWlC36IlQKEekI+H
	 CIQp9NpzoHeqjFbqdfx6/Ah9u9VhzAiR/+dIH7aqu1KJo1jdIojk0SQ/E4HYotomR0909
	 esCY40Fj12a2hGMgKSFpX/e8dh52gV86Skis9Lc/i1MEIqKJJNyxf8m4vnrf/SswOmnZ5
	 dXsSnOG6jIfqNndAwC4Nu4ZgzCjdIzmeArgmwjn7Fsv/hKfRNVok9zpq/Y8fIu8dLow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NwZtM3JZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F18606A319
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NwZtM3JZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6969A1F000C9;
	Wed, 21 Oct 2026 10:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580358;
	bh=1kaAtX4zZ/PIHCFZYV6cp0WKLJEgUFtAWwiaGlqrgpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NwZtM3JZCrSrkABhWcFXGccytP+AIwLThm48SlwleTuxsUmPV97ussOy7FThNAQfz
	 hovHH2MnfjGZeQTM9sUkV7v62hAuxvNNgaRCOQexJBmw8I3HiljvWKef5w9g/YIgty
	 HUrFcq+pw9yeY0hyoAwrw/6ygAWCGiGjhTV7b5ozrlAcNf8k1XNk+05OsC47CyUcyj
	 cDKC2kZ31RqIgF00R9D5gDOkfqPQ8/ktL4F3vpdVkdEf7LvkN/HpnCEnv6+B0WJNX+
	 Pje7oouux8Gvs5ztpAXj1rNj7xCu1wQhG0x7CsWlj0b3LL2ndctQ3JTcGzHyAEPE1M
	 lt9eV0KPPtO6w==
Message-ID: <sashiko-outbox-180137@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 7/9] pinctrl: mediatek: mt6397: Add MediaTek MT6392
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261021105109.199886-8-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
 <20261021105109.199886-8-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:59:18 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add support for the MT6392 pinctrl device, which is very similar to
> MT6397 with a handful of different property values and its own pins
> definition.
>=20
> Update the MT6397 driver to retrieve device data from the match table and
> use it for driver init.
>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021105109.1998=
86-1-l.scorcia@gmail.com?part=3D7

