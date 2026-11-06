Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974655;
	b=TGom7natwinrWalcsU/KS2VWA82BaB/9FfaS/eBj4ZWkalzZzj0i+dcBKrz1tpxS5gN1
	 qKd1XSTD8r1mphGYG78NrIo1b7/8h7hLQxqXBaI/NX3oCekH4UgKRHFaA0vMB94YAQ8ik
	 jtK8QihClldjsg93sbZMtK2IKfuUR4W/TFxzlJ/+URT02QJCENl4vcBvsPXrWyTSgCx27
	 fS8QYUz7/q3kaf6YigNiHeHNiE4cmxmoaB2dhO+jyA0/bAwD3RMt11EVCI9nQT++aXYHh
	 rd3jF/8tjUFiysuiKmYrQAJ3+9Lks/Clo07DtN0qvyyVrGLiGGTTLz2SHgwVPsboSjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974655;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BonBxNAbqZsdEbvekHMlzJsBoSaMcn/Pn+zQc0GFLuE=;
	b=zlfOdVJzOZD6Wq4AgbmVZu4l3uYtCh4oLkUFjQoor9AyE1glBvaIIsmkxudrda6LdJec
	 /+O0Sr6MG7aPomVsfUJZ8OJSWX3QekSlGJDyP100pMLVmO0EhS07FQ/tN6AW08nAx1PaO
	 XT2xUCbaSpySS0yOA/C8+ZN5BUmpEIKR9K7s3XcEhjhzlSRdFKnfhvULU94Fc65rZ+mfb
	 a4J+H8DOlLViF6+LQu5vgPumbK7Jh648MeZLxNBZ5SsnJ4GPMT1rhy2GoDPcKydhrEbbY
	 FCLAIftc2b+ZA01yPPRJbQDcqzhlvE5s82bJ4XmBv/KiTOurJ6Mir7ljPYvwvW7c36Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NFhQQgam;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD3606D80D
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NFhQQgam
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674121F008A4;
	Fri,  6 Nov 2026 14:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974654;
	bh=BonBxNAbqZsdEbvekHMlzJsBoSaMcn/Pn+zQc0GFLuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NFhQQgam1m4ilrYOZTRxGJJ5BY8FIvrk1nokei13EZR70QMuWHwMJuUCqTGf0dNN4
	 5+KiTUQTqy3FcnWp3fhtHeAb3k87o722WMvuXf3SuG+Mf8qZDuM7cLIiKf+lqYjuKq
	 OlUfj9AAa2cSp3eYsS0Dn2Nb1P++mv9W1u5FvgQc+XZaEf/A2jTtWz5zhcJQ1FFcHH
	 7N20VDwYtabfBxrde9TUf9pCvV7kD8kyCeli5A3z3swROKMs5ZhhfBEI2fdXEGbHSC
	 95Q4Zm/ahBwbFFQzxk3AsGt9XZSQQ7VVef2C4L5d/I3HfC9HNlbDQumtMzEJz+wobF
	 W9ieR6g8VtkSA==
Message-ID: <sashiko-outbox-201558@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 2/8] dt-bindings: net: Add SoC-e SWIP MDIO
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105-devel-vstrassheim-soce-dsa-ml-v4-2-02f3cde2afa1@linutronix.de>
References: <20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
 <20261105-devel-vstrassheim-soce-dsa-ml-v4-2-02f3cde2afa1@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:17:34 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add a binding for the MDIO controller integrated into SoC-e SWIP
> Ethernet switch IP cores.
>=20
> The binding describes the transaction data registers and the lower
> 16-bit half of the control register shared with the external MDIO bus
> selector. A sibling generic MMIO MDIO mux uses the upper half to select
> the external bus.
>=20
> Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-devel-vstr=
assheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de?part=3D2

