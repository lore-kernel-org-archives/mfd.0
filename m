Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776186;
	b=Nx6CuZZUxuYwJwjmAwvQXBOmuADsea42uC2+UUmVqv3vzDEiiBMdPXLKHWS9mPZQ1OwC
	 8TsZTNKzYDvKwXgeKdi8Zip53mqNIRk/euihERdDRhyRCwOs7wR+xDgq2UCrMmLskieFv
	 2yia8kC8NfEAMkDiMHnxNSc8bU1GYOZ2zZRG83jA1LGXlXem/gTsPoZBDdJWaON2p4Lkb
	 GFHOwgKJkVVZNZ9HGRGcWHdogly+rr0itgYHQswVCVAA9RPhrQJ3x8HYjLZFXMuLCcOui
	 LfAb+Fjj5xG/5HZfPQUDGHjQgSQNu36idwmPSuLrMa5py9F1NlZc8lgViIopiFRdWNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776186;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T04P97Rs2F8+DPa8ZfvpK44yWCCSVtNxx8bBrONDQfk=;
	b=Hq9vsw8swNMyjjClbulNFOcQByeFRpJj6vVnCHsrr5c3UGqGS8me1YYJgfyCpw5s4T+v
	 YLv8PLJLWf5wsAVboPicFBITfWfPblIcTcnfstUtmMyMMVupojO3oy3WoUWjNFnOY4J1l
	 WEt0P3eLgTDo8/IgTVWpShCbN7Tv6IiATaD2lzJQNOpfIRqPAURwL3CQgiTztetHDL2o8
	 ARbgOPf4/fbSUeqLrDn91wct9vNpxsUnU0+mslVOmlNK5/R/XVGm0ma7gxQoruUtUajp1
	 a3YyjdWdvqJj/orMkuGYk1SOHWTWwvaWYtlZe+kKDk8ahfEWOEUX3RERyz12YnRM0Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OxdVi9OP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561BF606A31C
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OxdVi9OP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E281F00899;
	Fri, 27 Nov 2026 10:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776186;
	bh=T04P97Rs2F8+DPa8ZfvpK44yWCCSVtNxx8bBrONDQfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OxdVi9OPalJ2CZoG2Kl222CbK3IKvRYo3WbPotSJUYuisrKUf2J3QetO+9Vii9Ch8
	 yZX1U5ygBJWtkGDmHs3ECSlOEjZaCz/i6bDo7s71dWFrBPp/ym8aRnLmRw1efdqSQe
	 qlC2tuTM9EEiRpV7jKRYcaztloppU/l0ZbmJfDLftgkuqzhuvZjgez2LB7W3H+rHfA
	 MfKN1mZEJZWeR0OhRIjXoxaYxrEKH6h2aqq+I/qjuaCjUSD/7/OMy50Ro6f/pLYDDd
	 DsesakDxgxwWyC4Fl/SvT6Nk2Y52ln7IX+PYFaIFGZtgZH31O9B3WnVpj8E1BLZiAp
	 2mXrkhJMcGRzQ==
Message-ID: <sashiko-outbox-237163@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 0/5] regulator: Add X-Powers AXP318W PMIC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 10:43:05 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 5-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-axp318-reg=
ulator-v9-0-986b68f3c4a0@baylibre.com
