Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186535;
	b=maRydesXK3Em+VI49XwIjxkazRlZ1AbTmspc9IruwjO4lmMX3jMzHGsCzdaXUMv0bFwO
	 8bSyuv3wxcXtWrq7DilLTfCEntYUxjAIdYvb8vZnBAsidKUtZ5sK/ZQb615P/LeXoI6pu
	 UnQeAvxJxEi6dwuqEJrToAPUIaIg6Eh2q5AbmsOSMTO3v43Pj59Q1I0bIHoTVei/z8CgA
	 DdAXq3VD54o+Z331IcdUX+1URfsPeL3Imsvq+Row704C2N3rES0/01qKKGnPghOA8iKuX
	 ThzuuqBnDcg5KnUY3ntXl4rpfIMGEdG8nHaDahZ24jg0HsXkt88SmLKCu2CURHSjmuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186535;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ml80zndT4o41SJMBIV4NpS5qPZZQn9QKqL5NMsDygmA=;
	b=XcbkbTwesuxnPldpBnK7OouADmlr66yrPKNwEaxzjKJnjmpW+t6m6Evzbezr75n7PFQH
	 5IursP2GttI687lkUz4ULkMZBpzDGMX7ck9x5sjg1oDr00MF50r90+oTDCKjywgiUr4dD
	 Bo0aUCGhOL3heUq560ov8szRxAUxVmzFOadyazfcYpGhJxiFSE6d/mjqTVI71ZNfc2PAr
	 t9AV7Xx1Cr+im03hG4PLJDODQVZo3bbDmQsnrFNYXUHh5b73Wnn6HTWS+g4UC9Q7+uc6B
	 gjQxcq3dTl3M5omfUwjcG/sdef8Oceszh23ac6JA9xfeVuQTeBTQ7ubvri3/soSbwIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oggy4Zla;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8017C60A260B
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oggy4Zla
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239421F000EC;
	Fri, 20 Nov 2026 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186535;
	bh=ml80zndT4o41SJMBIV4NpS5qPZZQn9QKqL5NMsDygmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oggy4ZlasynlKyOwkj69Jj1FWirwgf0ylpICuI6nehjc3OULqVVmCTAcucDW+tYu3
	 rcXR/5yCoSldvjiZPAR5p3ToRmBhIMnRUCDxM2qHjKPOZIxw6rhief9e7JC004MbJN
	 UV5xIL6OofRLwbOKUBEK7PJm4ankms5/fc6uHhKmjOwkmFBxg1TB2HFjxF5BGlwKIo
	 sL13br0Wbiovr+1I86oOCB695R637YvAWifJxgBB+wfyhIClJFY6CFApiNZ4lkda7T
	 b3wAbeZ6qtdkZADz8oaZX/TcAo/b9xTxnCXkoxyTi2epHIl/xiibUL+lgm9ZTkQVeC
	 Sf6iHQI6WCHlw==
Message-ID: <sashiko-outbox-225413@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: cs42l43: Stop using legacy SoundWire IRQ
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261120145115.2256537-1-ckeepax@opensource.cirrus.com>
References: <20261120145115.2256537-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:55:34 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> When removing the cs42l43 driver on SoundWire the core will warn of
> too many retries on the SoundWire alert. This is caused by the use
> of the legacy SoundWire IRQ callback to clear INT_STAT_GEN1. This
> implementation defined SoundWire alert bit is used to tie the cs42l43
> internal interrupts into the SoundWire alert mechanism. However,
> the legacy SoundWire IRQ callback is gated by the probed flag inside
> the core and that is cleared before the driver's remove callback
> is called. This means that any IRQs triggered during the driver
> remove process will not clear INT_STAT_GEN1 leading to the device
> being stuck in the alert state until it is removed from the bus.
>=20
> To fix this issue handling is moved to the regmap IRQ handle_post_irq
> callback which ensures that INT_STAT_GEN1 will be cleared right up
> until the IRQ itself is cleaned up.
>=20
> Fixes: ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120145115.2256=
537-1-ckeepax@opensource.cirrus.com?part=3D1

