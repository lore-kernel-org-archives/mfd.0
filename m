Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510413;
	b=P3YKRUz0AG68pbj55dzfY6p6u7sf6GXgfp5bXbm/1n5evzujiRJUFm6pJNk3NViNvhUn
	 h4bEMUrnvwqshweIpc1cmR4tVPb6gEuZaay8K7NqKSYSgykThttmLx8fTawhCq/S3X3YG
	 NA5qICcIARh3uO6K/TAkcHsFNUXHoq8zgf2e6T8sVFY790WbhB13uxG13S67/3To6YFrY
	 G646pWLxgCFH0Qg6I8V6NgHJGCbsYEQY81XNieBQVuSB/RkjMoy/1yFgoLWQr2VhGgRnc
	 IOnPPbBli/TdZiUg8eaNdu3VoAmYVOFIiawC+UrdB3ClWAiy44POo48Duq1jRU9YC3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510413;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+1RJTC2M1o7t86bhm9cq6wavppB7odkgwBBUNlKm5tc=;
	b=wKcp6aaBwW3WDnhGLvWfIbXDZtTOd0F+cqN7h2R+gy2svcVx2QbFJq2yxxZcqNs5tUTa
	 ftfqhm6w64pJJjpwtKLOR4y27TI4E3D2ameXy5UnqIEdb8sKSJLYKmaabzFJeFrctOius
	 3h+BYVM8d9APjwx6//iyr8oJYsPWAm3PjGSQBykm9Dnv1BdfvPvXoe9g1U1Euq7HLvp7h
	 lW5ts+IJeDdyZvmFxrbV940SRi475rzT6WqSKL/wvFffmsnrU8RPP2bs0nxIaQOqriuiH
	 rMpEMDomHXA2ADubnG7Khpmzwv6Y6tYF13iVrYYEBZcLlKSS3+kKadxg+tcntS+mNJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXcqTdTr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249FD606A31C
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXcqTdTr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87581F000C4;
	Thu, 12 Nov 2026 19:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510412;
	bh=+1RJTC2M1o7t86bhm9cq6wavppB7odkgwBBUNlKm5tc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZXcqTdTriBfAyiT0FYZJ+5iHmS6mlBgLAU9B9rNYXK5fhnczwVPt9S1Kr9KmTMtYo
	 JxwmPM7FpjByx5oR/nIquFzzn4FP/ILR1h/nTq29kwYFTFg4xI/fGkpTIXv0AVHDSj
	 bTKWiOhmzbRl/Hg2MuF2t11PWpX6OVGUpBBKkvGhxuvU1f7yJ+bGHOkCJMubOiwwz9
	 gOWFJgclf2kZkHGS261Br4/bBbwfVFgJISS2WFLsXUkBB5o4Ov0nveHdMMUrtfMCXv
	 uFXgfVYG5LHMJHpxTYa1aj2CEq/v9PaAjBdGCZCApOT/yHf5BVdbdq3Gkws7oOjEvY
	 BTqr5hpvpOItw==
Message-ID: <sashiko-outbox-211740@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] pinctrl: airoha: add support of an7589 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112185941.1316112-8-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-8-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:06:52 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add pin controller support for the Airoha AN7589. Its GPIO block is
> the EN7581 one with a third bank, giving 74 GPIOs. Pin functions are
> selected through a separate IOMUX block holding a 4 bit mode per pin,
> where mode 0 is GPIO.
>=20
> As on the EN7581, the pwm function is available on GPIO0 to GPIO15
> through the GPIO flash mode register.
>=20
> Unlike on the other SoCs, the pull and drive registers of the AN7589
> are not known, so no pull or drive configuration is provided.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112185941.1316=
112-1-john@phrozen.org?part=3D7

