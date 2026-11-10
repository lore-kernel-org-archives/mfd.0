Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332778;
	b=X0H54Ar9/BqUFC+rptgndZ0F6kIYxgRUvaA5l6MaT4DBR+iTCXDS38Tuk/koFzs//IRS
	 bFcw2r3xixU1nxgA1W8xekA6XPDVbRIaLRDElRlQeazg4m0qaiAFCyTrpdJ6S0q69xIVF
	 dNMqk8xXdVvYyMqoPeI9lRhi6OgvxuxgUMNo9YBVnSvZK45prVvfUkYL+xRC5hk3zGBNM
	 Iy9ZMkP6UzYaf5Ss1wOvts5FNsj3eY9i3fVhglCejgUdYCvxhKC9Tt06TOkqIlV4xH7zx
	 Qia6JD3VUjCyciuFrvaIjnGkqjQ0ggTcVi+mIDqCRe1+JXrvtyzWyK3w3kEM+h66xVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332778;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SUTnH9EevMI8JYNSVJmHllTqvc20/H5fZdrtmj6eTLY=;
	b=ce0Mt4mlBdud3TVF9QZGU57kd7C7d5STtdNkLeAC8BdHuPJAMz0xhQv8HrN08f02KWzH
	 kfRFcPiNY1JU0PGzmW5oqaG82nVsJaMlOR5RDz02fvu0zzYE9o5RH//ngzuHdLu5Uqx7X
	 vwcBXhI3QJvvRqF2rGVlCOANqMXAtI6giSlDXX/OKza9e79iW+cW009q9leMkb845O5AS
	 wMQebY4ZCNDiMyx20bPxjwlKmcEqRYS1nHLQmaOpBGeM9eSv1ytPj2xP1wCkLnvX59Rzd
	 03ddV+i5hHrdLiwIx705JmYgwKh6cm2FJIrP0j8i2tKchakoedwRFqzqZUBtl8SDqSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPAlEoDv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49822606A333
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 17:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPAlEoDv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEDE1F008A2;
	Tue, 10 Nov 2026 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332778;
	bh=SUTnH9EevMI8JYNSVJmHllTqvc20/H5fZdrtmj6eTLY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OPAlEoDvV+GC5GDy8Llr9KO9LAzP7nwph8pger7HhuBHXGkSHNX6aeWWFuih2+96+
	 DL9JooFrsuPWqU3r87fMlhRp1Y7LOcPJy2pl95OyNkhsyhYboQ+Y44hmFyW7eXGTYN
	 znM4iCiAVhwe+BC7fNj0zx/EhSDZ1+5+EgM1w0roRG7q73Rvla8ydgBPGipZExyfgR
	 CL1OjxO9bWpri+H5bI2EK2Pb1EsDAZBnxZkymLJhr+5bQVpNkYclZGsTWnZvAUjH7n
	 UVbHKgF02juyENJIBTSz7aIdwaEwkBhDhD5VIRQQXnTGtln5yGWParN6gQq5XLcMjo
	 UuAmPsXLOJ+nw==
Message-ID: <sashiko-outbox-207508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] pinctrl: airoha: add per pin mode field mux
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110173941.301478-3-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-3-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:46:17 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Newer Airoha SoCs select the function of a pin through a mode field in
> a dedicated IOMUX block instead of through function specific bits in
> the chip SCU. The AN7589 has a 4 bit field per pin, eight pins per 32
> bit register. A group can then need one register write per pin, and
> the two entry regmap[] of a function group cannot carry that.
>=20
> Let a function group supply a pin_modes[] array, parallel to the pins
> of the group. When it is set, set_mux writes each mode into the IOMUX
> regmap and then applies the regmap[] entries of the group, so a group
> can combine its pin modes with a register write in the GPIO block.
>=20
> A SoC with an IOMUX describes it in its match data with struct
> airoha_pinctrl_iomux, which holds the width of the mode field. Probe
> then takes the regmap from the airoha,iomux phandle.
>=20
> No functional change for the existing SoCs.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173941.3014=
78-1-john@phrozen.org?part=3D2

