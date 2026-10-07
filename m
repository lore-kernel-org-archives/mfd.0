Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A9A48033F
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365887; cv=none; b=Kjqs3TCzOQE5XSIZlLErhg2vRfuQIvW0RUwky5IkM3kIDEcGphLhJPWn3RV6yr3CORCu5owAGlyFbQxeYFT1CF9bD2BAcDfl4wddbXw0CzlQqt3fshWRh/WKDIzVVdpz3c68ELUtbckH6i72X5I+v5o2oe6/MkFEc9OcbYliI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365887; c=relaxed/simple;
	bh=f6ENVH2LedDbxUIZJTDo+OI2ZOLZ2RTQSOHqikXayR8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=m0mRtDaLiXjlkCuorsbEUR81gV/83lQYIRPz0wO7uLsAK+Cocuz8tnCwBKGJf+xkKkO/8RqNmeXXVaI7e73o0KUREOn7TnTgM4vI+yMNKl9d/+8Ps0Lv85FBaan51UXXccs0HO6Q+mh0OcwLpt5Qa7SbdKRtUgDQ8swUNeXs8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSEOugWB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSEOugWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060161F0089B;
	Wed,  7 Oct 2026 09:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365877;
	bh=f6ENVH2LedDbxUIZJTDo+OI2ZOLZ2RTQSOHqikXayR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oSEOugWBiv82M+fXO5sPirjf1NOGWrLWeMUUDod3cdWw38guVd5qn6Q46DDzmjXyp
	 FnKX/xThKeBsR0lf8UTC3Zykks5yMZgdu+BHent6b4Yej759ha/jTSZTRw1hPSXmOi
	 +JexMt0fwpcbaOun3wu4Zsd65I8kWsZgUN9tb84LayyxlA0/ZPn40epIwJOa2Pmihp
	 UKnxxnQRqiUi68D2UV05fkjNOi1hCfqliYVF7jasIn2zmWwcO1A/YJPBRD8Hnw53Pe
	 /09woM/AxnF8HxVHIVLgaHRWIwSx5QB6Ynds8ZXwdEn9C3YaPEGxXYShTJ6kkvGeY8
	 L/9SxP7iwoRwg==
Message-ID: <sashiko-outbox-162808@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/13] mfd: nct6694: Validate the USB endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261007092102.3768818-3-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-3-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:37:56 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

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

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D2

