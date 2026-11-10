Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332894;
	b=EfaDMmcQ+t3Wiih+MYd8NwmA33EA4akohHVkoFuvjsunJx8DRfLYuN2zyI2YAGzDC/te
	 5+TRt8uFD4qQUf52aXZ0NrfptiBZbr9KB3ttQjSKApDIAYgLVJMwPT2abHEe/3on/vAzv
	 bkluGyRsTdHLVhjZxTPThN/QZ2PzTSN/fFDu4U2/2bc7mLzNBM6iGOvEs4cQ00zc+kTFV
	 +/KHfUlArI8X67Mnr1/VNh4g8oag2qOc/azlQQK2afJvjJMP6E7xK/f39GE/Zo8q/9YxW
	 6wKz7+iR/0i1dnYJxBAzX8dQtl6evnKbJi2CEgXszOI/ie2/TX9MrIyXK9pzfwUY3vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332894;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FPZTkb0rWR3SMwTT3nEayW4LjsP6H81pFe0ZBQISOUQ=;
	b=okpoqSoeBumg7exPCpcc8Ln9WqKDLuTBaW182yGN5sdRM4ovZftoGyGgfNkG1ZN60CP4
	 PXuvG1I1DkBShH9PTZ+QXoV4vTrROFw55ywG34cAJa5X+oXe5Jl3D+At8dWBgH40J2RaX
	 aI23MDkvzYiN+ejA2yIj64BTqSgBS6ZXazZKnlEnQkR3uyGDSI7Yj8gADuWBKTTSFDJMs
	 C9JyvF8FDuCh0ErAGBSj02hQsaaeTKCqOYOL+tfRx1NpNBnkL2liG5y/jYZE7NkLrtKtH
	 /P+Va6LnMk6pcSQUeGF2AvHzmJMplJ1qYTk2HAheRmHvzNia1T5VezUo8udg7rBW19Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QndiostQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E40D606A31C
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QndiostQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1221F008A5;
	Tue, 10 Nov 2026 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332894;
	bh=FPZTkb0rWR3SMwTT3nEayW4LjsP6H81pFe0ZBQISOUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QndiostQWKBRa24EmSHv31KNkyjv0NTpX3k8oHhnplxQbpsOm8NNkW/TJJ/Ph1FPa
	 6bH9kRmwKJoM6mCSdK7we3uIRyVRgzzijU3mlY39604Q0rEFDFrlkusSNGrem8pOAv
	 E5tE/rdnEG6UECDqS877Ov5aUsLXyvRbSHZpgdcxVB+WnDYxajOIMmonj5ppXipTLb
	 QO+F0Uf6hgFZvfuXMsKmeVMLDL5xCwfC3/pDgGyElAwnoWhnrbW2u6NZl8PB2kEYva
	 S8lhn12KnIx60cSJljdG0CgRpYo++qEtzp39xVXtXiOi3/u/cNV3Rw4LVroWNB7/ZQ
	 EaRxTIRmSpvkA==
Message-ID: <sashiko-outbox-207516@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] pinctrl: airoha: make the chip SCU optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110173941.301478-4-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-4-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:48:12 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> A SoC that muxes every pin through the IOMUX block and describes no
> pin configuration has no use for the chip SCU. Skip the lookup when
> the match data names no chip SCU compatible, instead of handing a
> NULL compatible to syscon_regmap_lookup_by_compatible().
>=20
> No functional change for the existing SoCs, which all name one.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173941.3014=
78-1-john@phrozen.org?part=3D3

