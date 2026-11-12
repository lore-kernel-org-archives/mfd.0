Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510285;
	b=Ag0H3DrUK0yCUDklRDN9seagtsEOFg2+hDPCFva2vyApwK0rTnPh81s8od81wPr5p6BU
	 aiJi66RVr2tSh1dsNC+KWIWO/g58B7XeeCBzWv5bqJt0uU955w4OMnZKeOkmTmYmIlF8C
	 0pnqBGfBGMGmiZAXpA1xA2RxYzCOWUlo7X9R6O/3uC3gOvadOA131MoL3FEPgGDH80k7Z
	 WTE7PzlmDnvOFkEP0+6obYRYCM4VMTMe5SDxZVdLDD1g72757eSHxRM6TwgfbMTGpybII
	 gbhviGOhHhn9Clzd02XBm8xibiUfLwbeAHnvpK/UxxlBBWTbpMIwLHFwHY5I0ZGkrvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/PqDsD8RtjdJj9Teg2RWT34W52l+fCac4VGdPg+pB+o=;
	b=Sfe4SigIk7mpfWVhX+A7EumMngLyi72VbQc+G4gLnbRrmxl3kWVQXicVPsxY3Z1MSe8Z
	 3ZJyuSGYrasWk6pV8e9VM8jve6e5KTZ0M5cP8BBsKFwS+y9JV2414tjTOQJqbbAxHHdFk
	 h7aDAluT3wsnOk5c2Le0L4m68dNzrPfTp7LF2Z5Me92kJbpDjuD4RNu78huccBHxvsb/d
	 PUNf6EMoqVBSe0duj4ZK/syqsJbqWPoOmRiCPL6FV7gCZxpCg4zZgpQgKEi0zMF5bAg7j
	 TULKgs9OFd9VF+7TfB6rkeFkfDCgSDyPpm7JnDzmVi9teltttW4BD4ffQu/4HPNzOIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ce0uvfoO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB07B606A321
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 19:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ce0uvfoO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516AC1F000C4;
	Thu, 12 Nov 2026 19:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510285;
	bh=/PqDsD8RtjdJj9Teg2RWT34W52l+fCac4VGdPg+pB+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ce0uvfoOa3Rk4pbEeX8a1z1Gdfdv2UDUGucK7vmd6cerOIa2BSqrPfYerNJxAQ4tQ
	 WnBDcUvkyhHzV3+7jBmc0MXAdnA4+SGBKnqfF8WG8Mbmj8XHMKlxI9v5MQm5TFG88H
	 2f6g21a1j6K9OfPktKUDElYQkR0JoL9iGrVZi1sL0o6o2kSIrjL9aBfyKoxSkms7bG
	 57yw6p04JHn8cvCbRDO/kxh+M2ESR+8wLg0o2bWBUmu1FJcygknKoHYNg3kMyt/egV
	 dP6wEeeLuIrASR1SL5puVzH7pqltfiJ7L6p7zxU8iC3XwzlE7nxbl7gOuGDu/6Qxmf
	 07f/gyV2MZiuQ==
Message-ID: <sashiko-outbox-211736@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] pinctrl: airoha: make the chip SCU optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112185941.1316112-4-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-4-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:04:44 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112185941.1316=
112-1-john@phrozen.org?part=3D3

