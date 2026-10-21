Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585246;
	b=TGzfadskg90/AqYxrOyaEaOVsvQCTabRGvEUUJeuLrAVu7BIXzR5RBn1HhTLImqNz2CX
	 uftIL44uOP2TZEUI0Ya5UQzsoGvcuiJVtRZ2ITLBt9zOo0jXA80Yy1eJD8FwmF4RPK63J
	 cX47RSfxcwnQu5xDNqLo9t2mGr6O5Pp4UaHJZc0LkYQhV49UBpD1k0dJR5DfqsEhV7gjv
	 cNJsQXJ12nMILxYNfMCMQskCa097g0FN1CFODv5fE0BIcu1bF8DSbBntrnm+JVV2505vZ
	 RF5k65iDSVR6GdK+0lsLRivbEQE9Z8/nTzHb4Fk4Ltgc2hiKnhaCTF8izX8dJErEREQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585246;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZCMeywydXIDnyRo+GaiiEVT4q50uO2drzEDHNFM/aRc=;
	b=f5e2lOHxaBunnW/Q8/w6IDnrW3aSlAu3nJwOhvmWAXyd/2k7psBkSAKdERTAQW+6xj2M
	 fQ/Hlho+KG1ur1/Ac14aDVIxuEwOg43CsrZFvwsJNZYE5OqQO3yrVwaKxYMwBT1UtU35M
	 gaOXgMNqf7R1pDygZniI67IkeCII82i9g1llPFxaE33Q9fmm4BJxWwatPIzSzDHS21kGu
	 o7RPYEjMBQlNekd8Svdyb6NyqmHu7uDO5AePsMQQhsz3r9kL3Cp/SifrAV0CPDcctKMgP
	 OGLfFPOdYVW0OkZOCstost76EOE/s0AD11d9xmZAZmlqIsMjA0GnxI+pEneXU/ZFhMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxWH6GOH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C4E606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxWH6GOH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D46B1F000C4;
	Wed, 21 Oct 2026 12:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585245;
	bh=ZCMeywydXIDnyRo+GaiiEVT4q50uO2drzEDHNFM/aRc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=bxWH6GOHF3zIMTJZ/rcGUl1gaIfrjOVvUlSjq8G7Tg1RUOuVQXW3wZIIhd4FZaqgW
	 lg4Fi5cnCFlE9b9CPbGdjtQPgdojjcyUQb5mkCMNr5lu+2Hpp7eljvdMdSodxXiHZR
	 vWfNjK0D6yP2edWJQooQyYsXhUh9iwtN/9cGHx4gfCW3W3dPvjnuy3BlBKKyg10ves
	 /CJ5x95alrsV4KbWJSl3bE2Mnh362Fyy8GifIBKir5yp1hJQKoo7KK3brRbiNA+QiW
	 sBw4c8rqm1D5pAm1Are5BGcsT0HpdFYMGEzYRS1Ma1MJ2mNyfDHrNTNYZOMe7TrkOJ
	 ugO55nAfxKCog==
Message-ID: <sashiko-outbox-180227@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/28] mfd: nct6694: Do not resubmit interrupt URB on
 endpoint stall (-EPIPE)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-8-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-8-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:20:44 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> If the USB interrupt IN endpoint stalls (-EPIPE), usb_int_callback()
> falls through to the default case and immediately resubmits the URB from
> atomic completion context.  Because a stalled endpoint completes newly
> submitted URBs immediately with -EPIPE, this triggers a tight infinite
> resubmission loop.
>=20
> Treat -EPIPE as a terminal URB status in usb_int_callback() alongside
> the existing teardown status codes, matching other USB MFD drivers.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Closes: https://sashiko.dev/#/bug/linux-9d8d1902-140d-4559-b604-76ba76e77=
8a2
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D8

