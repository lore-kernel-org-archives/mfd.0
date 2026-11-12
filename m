Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510254;
	b=Op30SBal5aDJoibCkBuhEkRwH2zXPpsoP+BerIM2vb6yBXYKKoSVxHmEh4+5vP+pnzB5
	 HlIY9ewDy/+3HqUAi8gmfGN+NdVZeZRohsScSCzWML7YgPvFo58YNcbLQxFV3qFASaXTZ
	 y57KEGM7wumqkHGtXdXUl4dvPSiiQ3EXRQx1635aY50d8Q3bwMkTUg0xKRQaMfz+a8XMH
	 QfgEnLVa0h0JoS6UD6UtAzdUC5VxGiYStSmEb/UHiAe+lMJrkhUAufmOpq8YI4LlWIDhV
	 sGp+vX87sSHPyL5VnyE0hLDToPoI2WiwgatpPG0FSVn+VA2g7qFtJsEvtJqJb1hlEyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510254;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4SQHbSk+dKutyQ8OW3977E9rg1WmN7hENG6hPNbBDRo=;
	b=n7bcowplAdgefFji+gg8zF2xVtBtAnCizKflgBOp24a6s8eloZn/sDkgCdnaHvBt2pm1
	 lTtPAfNc8VM4SbzVDqF4XSt5W6kVQgAzhvZsCLKESGz2hFm/polxQLtrgPbvwDReyMsGj
	 3UNI4oWcbcQuS5md57zchWjcwRfb9khUxEIgRTWZVWxuRktKs9yk+l8DlvbKvbgDLj5si
	 mMT1gKCU4eEyj9SjdzzmJ5N57j5VOpZcht5wxaREkmwPHI0DAVobjRb6DWiTSV0M4kUKr
	 TG3MVw2Rlr9l6Yze05QJBuvgVXPS+XYoLCwU7u0EJ+QV8+xtQNyxphQWvB9UA8O3TZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sbivo1XP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29A7606A31C
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sbivo1XP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1E31F000C4;
	Thu, 12 Nov 2026 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510254;
	bh=4SQHbSk+dKutyQ8OW3977E9rg1WmN7hENG6hPNbBDRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sbivo1XP3TKVqa+/Ednl3BE/0UXScKxVV5P6fO9Ua4uvwdCdn11Ha5qU+X7AcsazR
	 xgmFR2B6M+KTeaim2SNMfmYhUP0WjIZZ5wcr/J+uiK4/NyGGS2BQIexE4Yh9/NH0q3
	 P3XJw2suWJ2gzZwFwvfJHdho+gQQfnqsIUDe8plb4UbJ4L//BXh5DDI+5UoHsJBwf2
	 KJXP6oUMLYWYJcysUMKzcQOg8CfMhOujeLsCPqOUKNYokNruxJ/38Bh9cJ4fyPRfzl
	 vyVDBJ7nSQcz6jxkpn/VgnYta6bxN7j6/xoBVdtYeBMftlgYqD1sh2cwp6QRhj7U2O
	 vAEgMMzlTwNkg==
Message-ID: <sashiko-outbox-211733@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] pinctrl: airoha: make gpio register layout per
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112185941.1316112-2-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-2-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:04:13 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The GPIO register layout is fixed to 64 pins in two 32 pin banks and
> four 16 pin direction banks. Every SoC uses the single static
> airoha_gpiochip_regs and the compile time AIROHA_NUM_PINS.
>=20
> Move the layout into the match data. The gpiochip register table
> carries its own pin count, and the five existing SoCs point at the
> shared 64 pin table.
>=20
> No functional change for the existing SoCs.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112185941.1316=
112-1-john@phrozen.org?part=3D1

