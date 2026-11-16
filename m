Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855734;
	b=AbVSlCwdmQzdBZeaYWH4n9D4znPV4ICEXNsnMMvNTyCCQaE0UO1ieoy6md/535W9hQvo
	 ymn3Q/VBNWinn3Paw8L/u1RBGFKIm6pYdWnUZJasdqMeXktRLc6QD7CxHmK0iKf7mzKwY
	 CzMawDUkCeNtTF66IMVL2+Vyr/ozjup8dehhflu1Vme8muthKJzKByQLqIhLnWRQHVG0Z
	 tlNwkSLs8Zye//GhWXTJfs2nMgTY5mOAFOumvJypXMPZlwTUgTTIidNwgodtNPgPuCCYz
	 Or1IsiMR7t3lUAvzjugugPtvrzw9mqFFuKItV0k7MIH+Jhfn89pubNZwMJSzZHBispg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855734;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yX9An1IMconAK+cdfHd4Flt8PmhQvJyUq8YiL3DFO50=;
	b=tV4muOHgqASLN+TZihFs+l4FBe3qh4Gu/YiIP1n2216DaDSS7JV4iFg4A8n0otY0I5qk
	 0V+XXHv7mJ0Xg0qaKQq11uTtQZ3vxKgtAmQzg7EH18GiC5T8A5/dM3yUkI/1V9LR9oVy8
	 wNpF8f4XykM6e1tvLQ/T0tdMrUrSmQPL8kN0T5DMRZZ9EJlR+asT5wkb2NQ75gpkBOegr
	 N8H6x1Iw/ruv8BH3KW+QP2rsttactRmThHCh4z/6xPWWgtFAIRp/r7V9rR1ocexJo+GGA
	 sEtZ1tbyiQhpGiXS+I0M1yQkdEoPmDO9yz28dvlmoGC0Yhcg+lfh/fvg+4QMbeLroPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffqOpCWA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002BA606A331
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffqOpCWA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CABA1F000C9;
	Mon, 16 Nov 2026 19:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855733;
	bh=yX9An1IMconAK+cdfHd4Flt8PmhQvJyUq8YiL3DFO50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ffqOpCWArvTCDLSDZy5097WkJ9VOM68js7Pbo8WaqQISj7xQzDjQDwGUPJs/tCYor
	 L2MLDUHVaHM5L8dSvxX4mkY3vnS9L6XKH+sDb9Cy4vZ9+QkxGz7D9ITUQbNM7o1bK8
	 HA3w7C0QlnalT1KKXuP8yjzp2uZIU3wo8ryQ3oJowD/rc81FCGlAhgOzUNmr04DE2H
	 X5nrZJVy1mya3/+/iaK0Ak+1nhVh30TWTZ0UDBKAvQvcRKz8Lcgdgc6tNWcL9ie9ha
	 bgV1rK4m2ngzVASpNgMmo6YWf4gOUzo5SLGuGZ2V1Oe8SMYfrj0oezKsFA0poMIXLG
	 bakNVw7vBDPfA==
Message-ID: <sashiko-outbox-217522@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] regulator: dt-bindings: ti,tps65219: Add
 ti,no-warm-shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chrispine Tinega" <dev@chrispinetinega.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116185811.1907811-3-dev@chrispinetinega.com>
References: <20261116185811.1907811-1-dev@chrispinetinega.com>
 <20261116185811.1907811-3-dev@chrispinetinega.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 19:02:12 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The TPS65219 has four die temperature sensors, each with a warm and a
> hot threshold. A sensor whose warm warning is not masked makes the PMIC
> sequence all its outputs down at the warm threshold, 110 to 130 C.
> Masked, the warning is only reported, and the PMIC powers off at the hot
> threshold, 130 to 150 C. Whether a board can run past the warm threshold
> depends on its thermal design, so the board's devicetree has to say so.
>=20
> Add ti,no-warm-shutdown for that. It is allowed on the TPS65219 only:
> the masks are not described here for the TPS65214 and TPS65215.
>=20
> Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116185811.1907=
811-1-dev@chrispinetinega.com?part=3D2

