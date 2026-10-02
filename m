Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FAA346782
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940047; cv=none; b=Upgbkca6xBf0ZLH6c7yqfE3CgOtWwJqal8lk4k4YWbTcbDCxWYEsNymFIYJUoRUGqD6oBZatIXGfHbx4chcQ5lbkRec04ZhnqFldlxj0Uze++Qxnp1nETPOy/DnRX4RndwShaohl9aoF6ShGZ927kpQG7L1Lp+gBww2DZMRh71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940047; c=relaxed/simple;
	bh=aVOT42sJ1Yq1AubeZOvW4tDd+u3z56TZ49LvpNRyKz0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T/uTEzEx7V0IrVm2oW3teB8jtVPRCBb1YXUnb8biUN2DXcJGTJUFoNCur+/8J7ni04CKr0COglbn3joZSzWkuoiYjd3R6XzgXJ0WDBxnY8SmEMk/o7A1bYl5VltyY3RqmRo0tpT6TgWgZHt6l9Hu5A7yzdZ8dL0ocdu8ZfML6TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThR70P8A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThR70P8A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAA71F000FF;
	Fri,  2 Oct 2026 11:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940045;
	bh=aVOT42sJ1Yq1AubeZOvW4tDd+u3z56TZ49LvpNRyKz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ThR70P8AB7KV0FHCjYO54UmXasqKoR5KgJ8fYLv4sFJg/wznDTs2bx5SNwEDQF9ZL
	 Q3KNtT2hpn4Ke3Blv9C8V/8s42f9yqyiyDp68ikVpkGWU+BW46yOY4E2weyo542F8y
	 bDIj47bQXuArC7gP++7FjQxn4luMjbKRkxLs0+7/wGoR5xhKN90G+CXalpj7ctrOVY
	 gZ7BlDA5+/QxTFGGISyqoCJ/ekRTmvRz14HkhZM67cThlzmOpVmTpTpnzS3C2zU66J
	 jPSAz4uDfeZs2r0DIk5CvrfnmeFLuazzr0u8Bh5cvbTLUKQmt66adfK/G6UO9hRuXX
	 3LEwwe8IHoSVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/9] mfd: cgbc: Fix use of negative error code as
 valid session handle
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261002-cgbc-i2c-storage-devices-support-v4-1-eb42e0f1df59@bootlin.com>
References: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
 <20261002-cgbc-i2c-storage-devices-support-v4-1-eb42e0f1df59@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:20:45 +0000
Message-Id: <20261002112045.ADAA71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The cgbc_session_command() return value was directly cast to u8 and used
> as session handle without error checking. Casting a negative error to u8
> produces a valid-looking session handle. So check if return value is
> positive before to cast and use it.
>=20
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260713-cgbc-core-fix-cgbc-remove=
-v1-1-79274ad62b3a%40bootlin.com?part=3D1
> Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-cgbc-i2c-s=
torage-devices-support-v4-0-eb42e0f1df59@bootlin.com?part=3D1

