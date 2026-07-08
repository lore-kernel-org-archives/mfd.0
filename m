Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B363033D6
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509817; cv=none; b=kvEhvGh45eW4aH8uKD27fVOoNb2njUJ5AXTYz26CImLguVmiz9qLtaTDb5Ho32UqiSRBkE0FqZvmObvNAXujZQHVGUx5+uiFAVviw00gAEIapnih2gnOArsQknhnb/qrvCdPxT3W4LdEmxQrKXmnBBGf90crBqbhu93ZVmupK0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509817; c=relaxed/simple;
	bh=b6dKzXzZSQkE9DI6P8cz2Nq2uVu+6vAlal/VPd7I7NE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KeOsk95l3a/utjP8Z18I9YEYoMtyYhcxRJjjA5FBywYY7rFuusquDagtRj/W7cRqF0Ok2NuYJfdf8XpEPjPrcRf6bdnC01PRgQuaffi7249bdmmpRLhg/++oBf6O4Zil6ky/3XMm+lufvO9mi/IkCRRSFSwiW7TtmZ/cUIio2Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fywCifHZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fywCifHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE681F000E9;
	Wed,  8 Jul 2026 11:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509816;
	bh=b6dKzXzZSQkE9DI6P8cz2Nq2uVu+6vAlal/VPd7I7NE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fywCifHZYnQBt5ivyY83c5aYVnF9uIpGTYJyBVUdu1oqgufecEYMPcEOOlYHa9P9c
	 lrJ6vZZ1IBBBMATugZ423SMkgoM9S6szB8NRdHzx/3nTVj3ZPz3LMdhxmRyxOL5t3X
	 TlhNYYMfukFQK+XdQ4dHoq1h3scUei/BPmJnQsnxd4W2BDvjFjPURnNKFyaFCIuk9G
	 JtkYlL/W8D4Imwvls7yYr7duhco1rNqtDsRAirwfDHNqLzHjfr/sSW5HxmSD+ZYZU0
	 OvC63M9Unt/j/Y7apNMuB3KppC1WgqSOEUZK5XzKT/V0JP+XGzyffzvQ0LCVg85OE2
	 88Twjp6BUMQRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/23] mfd: Use named initializers for
 platform_device_id array
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <1bc763b0de24d50e83972b5f0dd31ae52dc558b0.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <1bc763b0de24d50e83972b5f0dd31ae52dc558b0.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:23:35 +0000
Message-Id: <20260708112335.DEE681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> platform_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Also drop a tailing comma after a list terminator to match the common
> style for these device-id arrays.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D16

