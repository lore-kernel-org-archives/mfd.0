Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428531;
	b=oCONuwfMSA8vXXx5XTrDqVdRISxi1JLdy3L5aM1bZx2dDsj2s9BJvj1vlaUQj2KPlaSB
	 M0PXOjASOJToAqHGralNjBhfzb23LR3q/MaaM5pA40Qj7uInB4LzbxGiOqXN4dgwgeM42
	 aa+msSQj9XFoWoknNInkWpzcjd2jhMiVEinruEiNWSRvZidJGQXblTfl5cLyCjX49rsTY
	 MBl5Yg22SPIojw4bF8ESJ+E8rx8UVNoYf1OdN+eBnk28EXdpySKjrAkyCzHeANl0UpD71
	 Wd2r4H8IK3dMqGS5/0KjbeEYcx5lqE/t5N55dYoHTlfxXeQmwbHj2eepet/EC7VQJ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428531;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j/qc8/0NGxSvBUg7a83kYeEn/sg+dGgotuFViXGSFXg=;
	b=qZn1neMV6Loy2YbbEJJYc+cRik1Fa5Nk6EczwGdSi03Yyt8Zbt+akLM9FBrwW9qjnTm/
	 oLecA1JrrbrNxUw9eN+Y+0S8u9GQFVoIbFrJnj1UNJEEomTq0/eO3HqjvwdL7m52xQcCx
	 y3W+Oo9qV+2xJTsWH14h2Jwvk0fW5k5N4vj1mordCkM4JrwpS/pJvD/I8MiqLrmW3JfDl
	 wrpHENL2iKXj2/RhBxpRXTEQ++xYLOzh7b/g1kFT/aem4SoqQg0wPDVTfGZAVDK5Qbzvv
	 nBbu74HVsKbGqI+XcSS6BoaH53S5taMyzKIWRP+SBQwTDUJm9F0FFg9Fl76E5BUGYZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zub73WrG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03839606A324
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zub73WrG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2FA1F00A05;
	Wed, 11 Nov 2026 20:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428530;
	bh=j/qc8/0NGxSvBUg7a83kYeEn/sg+dGgotuFViXGSFXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zub73WrGG6L10eM4OrOJMpf1W+AtsihTKHsdpQ9o5CQg54BTDwNSF48/B4Y4YqyDb
	 zAkrEEtx2YWVqFLIQDjiEOHV/Tx/rPUXNIT+jdKD+eW67N61P/RZ7ZXhMerjh/WHf6
	 hOmesVKWYG9f3gafm/lMPmoE43qLu/0GoMJ3pluLWll3mNDxhnH9Ayb7/iITogsXbr
	 Chbs7o5hz/Ji9prrQCsga66ICxPa6xXSa6xmc8H5W21xa2kq6sbZDmxEAyhvVj8ycd
	 CzPWwFt3YyzusDDWql/N0uqJ99Sh5BGlN9btkcu4dMFkOf4TL3EFUTS8FsmKJej3i2
	 cLVaDe7zaTifw==
Message-ID: <sashiko-outbox-209643@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/12] arm64: dts: hisilicon: Describe ADV7533 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-4-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-4-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:22:10 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add the ADV7533 power supply phandles for HiKey and HiKey960. Both
> boards have a dedicated HDMI 1.8-V supply. HiKey has a 1.2-V PMIC rail,
> while the ADV7533 on HiKey960 uses its HDMI 1.8-V supply for V1P2.
> Describe the respective 3.3-V rails as well.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D4

