Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910173;
	b=IaEOdR32fz0Zgfw6t/AUYL565FDdBkhpOC7mdqzo0qXcG/OM/3dL69OGWg9ufNXU1SEf
	 bPclfemlW76vmgkV4KN2nx48Ty7U3fJGkNIupNgLh5eO43p2gNrVTJwDkkjQCygYzbW6i
	 1qe9TCY69aHV4onXT/yryJZst/FxK+nDPegapw9IIQcaoL27aelK3CZUOsDlV4IJgxcsW
	 OfRpPXqd3j7goGvY16+H1xOy/CeqsgOfyR0zIuVwosXgTu2DkwM225mzshMom9YgdzK2W
	 rxWDsl3Dc3OHJKcs6YL8R1Xgh9dc/37j5lWJZ0bVeQdPaRiAsXOL1umNRF7c61h08gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910173;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zK+rV0JPX8phIQRCRlHP7ms5V5qY83H+DtoDfZkvHcU=;
	b=qbzxIgRdmcmfkr4Rq69puXxg0UoBL1JBlCkDRGaX6ry51tgwwO0WpXn4ahSUF8jD2plR
	 wsCFF6LXjjKCiloaOCSCXrerp4aA9JV7aSx/mmMfKY16FP6jFxevENt3Eq+EhajLMF6Vw
	 uxsyvc3yHP8+dBuzjhSVdUeKT5+HoghiyV3vCL4nEwJCsBFXuTtStaabDn+ZuW6POwAVi
	 u3IqtqmH9EcfL9ldbAZDe94tQYBlF1g8+FFfuz/G87nIZZ/o23LErKf3kWXllGWcy68Tk
	 wQ36x48nOT9Lf41qD5NUjRBGC10lKIiuZ/IUWylTlTxoxnV6Q4y0qmFzgrXr+6D4rRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=leT91CWg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D9D606A323
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=leT91CWg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBE51F000C4;
	Tue, 17 Nov 2026 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910173;
	bh=zK+rV0JPX8phIQRCRlHP7ms5V5qY83H+DtoDfZkvHcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=leT91CWgl86P3ZDmfkk1bBeLHQG0x53sdL90dPZf6gEr/4b3nGp9Rdk0Dg1KcStcH
	 g3E6IeSyuBE8+3bn9hqtvb2NVH9lAC2IRKXHyNPcRkn12+eLivWEEeE/4JLqZ+ztTD
	 Unm+q3zl0/Y5UY4kTsrut2qcVYR15O71TL+VgcgHhvzILIdY2qhxW5FyOPPmGh28Dl
	 upfMoloL6NPoCQsCTPx/mZQDr2zT8c0mcgSnY7fi7nvEx7J1+tMC4km6hYeUQU0uVj
	 +tjHsbgNXrDKtscpQVuTlkTlczT7HTQiFqQMD+tU2JyZkXuHIWknIc/7ZkixAs6wxo
	 r+xmFwYgW71oA==
Message-ID: <sashiko-outbox-218572@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/10] mfd: cgbc: Use PLATFORM_DEVID_AUTO for child
 device registration
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-6-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-6-bb070ad3e9aa@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:09:32 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Since parameters are now passed to the i2c-cgbc driver via platform
> data, the I2C driver no longer depends on the platform device ID to probe
> the correct I2C buses. Drop the hardcoded cell ID in favor of
> PLATFORM_DEVID_AUTO.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cgbc-i2c-s=
torage-devices-support-v6-0-bb070ad3e9aa@bootlin.com?part=3D6

