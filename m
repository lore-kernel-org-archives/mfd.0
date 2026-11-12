Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442271;
	b=K/TVNahJAtDCVjNn+QgfEw9Tp1XlQjwo74+mJl17bi+KS/rYW9Fkw73OVL+yGd5Z5cAc
	 2iMlAEpDE0h0DRSVpcd0jCTZ3/syf0j4SIwXMeVMyiiFh+qX3KDutrasQQlrMpzkO9jE1
	 Ja7cuW59W3VJhfcGqzRvrs3whTvlPuYnL9uuRFGvvvbETYwGP9KY5S0VRcQWic9kxPJQP
	 9SCCnfLUPBEtpxesvmokAH94AjRb4og9tyVr8e5ssWpOJ2gO7j7IIqpSdeOZrXHv8Xv06
	 ZX8gmhF/Dlsz6sFrjKzGwSqrxZNmbgaXjM3fIr8MQilhU1c2HLO4wQLX1wzu8fjdj3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442271;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SGTuql5Yk8bCgs3jp3APwvFBx2IdynwhG+Rr1SXhCFI=;
	b=Rutf/Lg3++1nxFn7FX6phc1wUX1qQAGUDR5sAiHtmC3wRnYSEb8y7bk+ekG7brtkTdR7
	 C8IZD15Lve18+ot8Pm67C5imBtpKaZvM2lC51UxopwbLPMTiaHUTGFFQmROZuIuP8GhxR
	 qdarPnyWIMfDdUy5o7Sl95gX5P6VFh0x4oxeeJVASdlWvRIc8e9No7iGNFaRRe+kuX5/a
	 AkFGvPOP3kgeVDR7RZAXH2BFrkTMg3FQX96u1ykncI0Ax1nREgdLDfixnfZXCBzfblBX5
	 5Rc5jdQuCCt4lRYA3Jnfevv+OW08+48Z4Y+Id3LEKUr7ixutflwnvsW24baW5JyHuUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NChdvYiS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DB1606A321
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 00:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NChdvYiS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9381F00A05;
	Thu, 12 Nov 2026 00:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442271;
	bh=SGTuql5Yk8bCgs3jp3APwvFBx2IdynwhG+Rr1SXhCFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NChdvYiSnL4KKkIro2OEL5pYbSFYatAhD8arQx+MgAcqvkTe+l4q0jAbwduqBIWeq
	 7jSG7gFSQxeFzOaTjxQiUKFBGgbYlBnHa9SALzNmbZ4tl0J6zSxaYfco9DEqGZ81hA
	 bQYZ772+neWrvaXx+R4Sq/ZHEzJwrpeEx57buUE0i2ZrHp0zGaE2SG+dUaMVMFKrQI
	 fYLYWcgQcvx591uQZfHvDZ2GHuPvnlRmLLWeztNCi5u2jmZOfGSKk3UcXo5zltAXfP
	 cAl3vzOvuNrL8JgaijLhe6rPj2YOdh/fodD804fypTaNk6NzWn6uC1Da8brkExOgib
	 BbneZ5qBZS6fg==
Message-ID: <sashiko-outbox-209884@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/9] arm64: dts: marvell: Fix w25q32 compatible strings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-marvell-v1-6-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-6-938788aff3ae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:11:10 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The w25q32 SPI NOR Flash is a Winbond, not ST, part and is missing the
> "jedec,spi-nor" fallback.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-marve=
ll-v1-0-938788aff3ae@kernel.org?part=3D6

