Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442304;
	b=j4NehQG4sjpsHaJTr1d24X0GMxOKlCH/crrgUbL8QfhspkG19ZownzxscEF4M2CL48/m
	 8H90VSjTBJ1eO+5RNCmPf1dXbDF1lH560inqi5Axkqwu5KcK8FRgvPeqMGbHDo281YvUr
	 ZQyUPd1PaY1Zy/vai4HJszCuG3z5LoY81NcTpBWki8bHsR2Yl3xjoEsE9fPIBbYOcIyas
	 HpBzHzf3x9oJxRluwGNKpCuUAQX5N69XzPrjwG/qzG+E527afSuDmG3ZMLOsle4K3emNh
	 FIAvOAEecC+zQwkY+h5vMJr66cp49JAxz9HlbIin8MhFRQpVfPvSDdr6ZDoDXtX7YIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442304;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kX5vIXldifpvMxecdI0iMyVawWDf0aOSMiz+IghnPxs=;
	b=eVTf07KmIUXh8jaEOiESkwnRJ/KFPKrEX2FMU/l5kFWMdHZ1mJPhTuyz/atMYFIYNzp+
	 ColQ236OapyhIbjpEozye9mt+fGh5qTwt/tMOsJD36JcYCSo8gY92OtBhjeZlJLGBvP78
	 fJJKIkNtSC9urgndZSggemxGxoJ63UanUN5WvgRExroqVcuICAsQ4EO0gxS6EawlFsAPv
	 ba8kaLZCEa9xIziWH3j868qGwZB9qFoLLqXUrFpY8kudoovuIjUrHQimF3MUq0/gdxiy3
	 ookARzagUoVyJPVsBfpjSP6zPFfg10Qu/QIuc/37heJuKUmBDdgtfcF81JC4s13a70w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luxsk1rX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4E606A31C
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 00:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luxsk1rX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DEF1F00A05;
	Thu, 12 Nov 2026 00:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442303;
	bh=kX5vIXldifpvMxecdI0iMyVawWDf0aOSMiz+IghnPxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=luxsk1rXUM9AC3ULOXoMF1bOnQV7qcfndbJgH7VWSH6SaSnZtr8jV5rEKl48rr/26
	 SJIgaehLLugrT3AUPA2MPc7frv6pVWkSs96JTFLO4lgh9XmnQFo9/7GGHmePqB9arB
	 du3yzPchAoa1D0NsmgmPlJOgCkwSUmPdCfNOTfheV1Ynzty89MH5l1eHSVWWFZrXgr
	 wLI7exSSE396B9YOFDddiA9u6uzyQTf7sQPBikmlf4FoOfADgy9qDOzIJYeo9elZO7
	 R67Brn/7fDcK6IwIc7e663mLqy3E77rXKnWHYMdVTFOmgkJ7wA9Rj3LZcWcBeZW4Y/
	 7z9HVpeMxckyg==
Message-ID: <sashiko-outbox-209887@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] arm64: dts: marvell: Drop SPI max frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-marvell-v1-4-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-4-938788aff3ae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:11:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Remove spi-max-frequency from the CP0 SPI controller node on the
> CN9130 SolidRun SOM. The property belongs on SPI devices, and the
> flash child already has its own maximum frequency. Plus, pretty
> sure 1.8GHz is not a possible SPI bus frequency.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-marve=
ll-v1-0-938788aff3ae@kernel.org?part=3D4

