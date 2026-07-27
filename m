Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31B73D16E9;
	Mon, 27 Jul 2026 19:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180566; cv=none; b=BXQNcqPPAgoUzX6HrqW8rgWs97k9X5jMbfeXI+lpYzYmcJWN3siaGVWPy4MSj9V8BKWaG1FTUrCrIwuL6ojb4X3d6Y2L3b7hOKqGKvcyUymhh1EBlc1uIEUaKynF8d7/41NawmrhGj4N66ru1Cd7pcuj+DUdazgzEGr1poxn1aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180566; c=relaxed/simple;
	bh=gXzddojoPrJnDuw7H8OMyrPuFV9T5GvDd6ET52j5IuE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ai14xwOdew7tbchEomHA+WPsbNeq4zJRc4aczAtnBjCR3gyLmClODlLrfaYR+2xH6YgFgqOMz+lwsuGU9lKy+uvLqpOskPNMUyN1NjVrJq/UCPmAqqyrQSDwEfG+Cz0HSPcQuaH0Uhn9eGSzwRmBQ1YVWjiJfDIqor2YOEnBoi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dI+9dVud; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dI+9dVud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1231F000E9;
	Mon, 27 Jul 2026 19:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785180565;
	bh=gXzddojoPrJnDuw7H8OMyrPuFV9T5GvDd6ET52j5IuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dI+9dVudaVf0/1YGqH9Selud6WvKIEf1zuPnsg4x1xtaR6XBaRJtC2QgVzhimrcDm
	 vorSVuPPp7qif9rfqul2TNNxewcMTwFKvNG/QIu6pR2khftAJXTRW9N2EWXYEGO3NV
	 rSre+Y6Ely8LMys39lWJWpaCUTkQcsw0sk4xAosuarO6Yl0QyIi4JcnDI7xR8rKscP
	 xKDlY/Vs74smJ9+GzM9FJPt2bIYYtx57iuGA8GEWTXvdFR8MqvYvTY/JOcDm/CpfDL
	 xDhk4BfLI/cMpt+6fdKW3X8KAP36bCZb81B6K9vr2e3ksDtkKC1l1p3OLs5dLldWoP
	 fTCo6fuaZx+Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, vkoul@kernel.org, conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260727-zx29clk-v8-8-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-8-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 19:29:23 +0000
Message-Id: <20260727192924.5D1231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This register space controls core devices: PLLs, the AHB bus, a lot of
> timers, the USB controller, the Cortex M0 processor that boots the board
> and a few other devices. For some reason the LTE coprocessor is also
> partially controlled by it. The main application processor and DDR
> memory are not found here though.
>=20
> The register to reboot the board is found here, as well as a register to
> control whether watchdog expiries cause a board reset.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D8

