Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333246;
	b=UMmDKUqyInbJEh34PHCEJdP+esZNDZ7w01GKdAmYVWB/OewBiWm+SoNLOuIM/OLyvvji
	 oPjlxiVG5IIrvhTUlFQIgDxX9netRmhyvRNwo9lQ5q18Hf21PpZusJJnbiNVeNO0Cmhj2
	 bkXrmFlpgjVz03ubTwxT6xh54wH6tEZG6u+vbs3IPwS9+8i4hlsUl2tgVlp5AhjxrE9SB
	 eOid/v/HkYrLMKfdhG1vqX7j+bJeNlx0DDLtlqr5lSETpcp5UA3Ggv7w/RlhFth5hXTvP
	 f2Q/ym5cv0QhTsNj2UaSUeg4h7gf5A51t9j43myL+0d8pX/SwlySbhoE14RC3W1yO8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333246;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+yrBxxhDxaMxN7MPqPn+axIiUJgb3VYW9VtP5DlBjRc=;
	b=Qm9DYI6qwG0ajrT1aKdjbVLejPkZxcZ4Sm3PrckbZxaSJBxMjpO+VJLkd8049fS7R2qL
	 3faPvcnjYuPHzMjcpQBI3cY684tCrJ45MOSaFnDKtoKdyJTmKAeMbqdPau4Y+L1cea8vt
	 cAPar1fKp0mKjFHiGqQesYQwWXu7fqR9daUzPsl2h24WntI1Obu7hCJLU4LnQtj3SV4dd
	 00oHHMn1II0Y4HsIU4GzvpRBZ9iA0TU23e4yktoZ1o1T/hdydtHRv9S+IATWq64b1tuje
	 JCoTmoXd2Bl3LDa2SKFmkCr7PVgGa78yAyo1cUIlnOvIlrMLsNZHmy+syD434uglSng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ta3fax5C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B3B606A225
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ta3fax5C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748EE1F0089F;
	Tue, 10 Nov 2026 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333245;
	bh=+yrBxxhDxaMxN7MPqPn+axIiUJgb3VYW9VtP5DlBjRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ta3fax5CCvKBIKYMyM0JKLpjG/TLjO0GXqH56gfJzw/m7IpLGUHUVSBw3JGQ0x7D1
	 Za6TyPP4gH7vMUZZpm/0HGWqNJxvSoXxF4pRs5O/KTd0T3Gd71FfPvdiOZakEt3sOK
	 XZydOPiJfsZdp7aEs5xUFn5pHFS0cKKci+id8IXTG3U2IOnPT7UNr0WaXEinGZrlcj
	 ZGrI2SB7+7CUSAbTekzD67iml7PcOZqfxI7Hun5Oyr5lqHSsUiREnpEUU8Ky9WhPvT
	 1LaIYauibJRYhyallqLmpkGNXk56km8G+I/isnjXyd+9jrtDR2r2j/LvAncTsAQovh
	 +l/+Bpp94Nmjg==
Message-ID: <sashiko-outbox-207530@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] pinctrl: airoha: move the GPIO register offsets to
 the common header
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110173941.301478-7-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-7-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:54:05 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The GPIO register offsets are private to pinctrl-airoha.c, which builds
> the shared 64 pin register table from them. A SoC with more GPIO banks
> needs its own table, built from the same offsets and its own for the
> extra banks.
>=20
> Move the offsets to airoha-common.h so the SoC drivers can use them.
>=20
> No functional change.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173941.3014=
78-1-john@phrozen.org?part=3D6

