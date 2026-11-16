Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851582;
	b=P9zpCjr3Pf8GQp0rHVY4obNbV3F8dyF43ODpoM7VJictwIqHwp1ECORqSIXqsx2oPPRJ
	 lA10Ipt+mHtf0JCPwV2SCkKHfFP0cEoZ1b7nzD8WiEmP1SMklLaVcXybSx+yR1i/WvkPY
	 T12az59CdU3OF7Y1w1YAzCWqhZVtBmKn6P20Qp+aZJa4E3f5cgdpQGexjNqZCs9LOMlmR
	 N5gQg7OnBci6iWj+UHRTguOapJF0uRuKQoxMDG7uo7RfAHYrKfkW6Hn1Yvudq14DPitBk
	 AbBH+B6p3sQxcKteVZ8rTzfnbPn2cqeSF6xypcSlcIRuSIT1MlywOV+0azvfsNt4XPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851582;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0q1bQBTknRnpudwX6Bqle3RvtyWMinGIoYpmCvtD/EY=;
	b=qP0yt1maagFJuyslq4rgjrcxVLY65PJ5LMUQLGL5j3PdjsvTIWNn/6Y3c/P4veSnVV5I
	 mOuSks/JASqZ33Y/WrpicRtTIoadO1MnhZBGxHJ3g84ZX+e55rBusNILXyt9urtmUBMlT
	 8UliMk3pVka/0BJ/l31H6Fo+Pbgt2+/DqTDosbztDlfHi9twGuWIk3DtqgCd45QAalF7i
	 1XwdhrVUQjk+4QARNqNij1c+7U/E7GyV8RTQnwOj9k4Y9+gRq/GqIw+X0e7txRzrnUnpF
	 X5CxLgrnm2S1DmKoFSt4yYqGbDmE9u1B07fHp+XpYddACYr0oR9gywJo9ArjYLi49Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMXltg19;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A44606A884
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 17:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMXltg19
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D138B1F000C9;
	Mon, 16 Nov 2026 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851582;
	bh=0q1bQBTknRnpudwX6Bqle3RvtyWMinGIoYpmCvtD/EY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hMXltg19wU+4hNymQok1VwG4D8ruO+E2aslw3WOkLOluLPEaJabtC91qU4RWl+rEN
	 srWJJfNrDLQ8GvSb3yjq9rcHV9vvQiRUog/RZ0MLLGjFRExHG/0WGbJwD6/U82Lug2
	 PrXPs1FWQzpexSelN+5ZxVrYx+DZKJxI2eO2QUFv5DTa5nsp/dPlkznf5Mtq0Z5rOD
	 Ysnjc0w62as5wL1+nfKu8ZyB/tYlxs0aAu2aWpeFLl6RHjWuoz2NY41aQTgEu1K3X3
	 0RR18Rg+O9sqYeuBU0EEcV7v0pDDWARi0Zr9tG3OiA6o+gqNt9QKsnmn6FYzvgrKhS
	 Kp6zo1smjEvHA==
Message-ID: <sashiko-outbox-217451@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/9] pinctrl: airoha: make the chip SCU optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116174854.342912-4-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-4-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 17:53:01 +0000
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
> Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116174854.3429=
12-1-john@phrozen.org?part=3D3

