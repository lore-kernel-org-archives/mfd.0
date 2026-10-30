Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344573;
	b=TwZ5pQz0wxKmA3DyvcYC7E6ydx0j2RNJW+hLydF1l5sACg49fH299VkwCm1TzqL/jYsb
	 k4FqTPUCI3QhBKNKfdvTcUeH3T8AD0ywNdJbimNCeFpSkeXumS9ZmjOETTu9qaJySAz5i
	 IwPK1Qmy9FiOX5pJ8BuaZ3U4ljxahZj6keOEDIZXWCrSYf9LJCOL7Dd7i3XTRBEDAyaeq
	 GopgWCRZ/XhIBHPDFEjOXfkJaQWwFBwZ9d4BnXWe0ceGOA6dH9QBZuIUjpx/B+lFpHQ8W
	 1ue8E8WYdSSVwrtJFmW/IGHdwL9fhryWR7vVgdro3ZVb4i6U/RTS4PGY1D2Hb6lzcDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344573;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uyfDzryNqIZDfrcNuLC77LAaX81qxv6e2sl7vQ+TpOo=;
	b=YbZTTsmlZy8IUtic/LxkC4E5naoMawMnACdoFwp+KCCGNwpu+CT5wh/qSchDqpeNGshk
	 +PNKQQ5YDXYrZJuEACiFp2/BzR0ElFeKs09KyperGPyd80ajifO/jtTdBbQCGTy8mNqQZ
	 XG5K8yPYX7sf9wsD3ZsRizbQ+olfgXZszJEO82E4VYScE5vk1WzYAeCqhZ94tatT/ZsxC
	 eyg8KMH3RNEUhs+QHocnDyWdAcGHk5rYxaEj7FVDdbaKDA6WU/GDDvLFCk2rs4V8MkJGw
	 /1R9FdFAiKXF8GIHiUIJoaU5gEWC3mS8H18LZoDM4IfULxqQ5cR1WXoYjZdv/ZAyQGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QDtgOEFJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C0606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QDtgOEFJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CDC1F000C1;
	Fri, 30 Oct 2026 07:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793344573;
	bh=uyfDzryNqIZDfrcNuLC77LAaX81qxv6e2sl7vQ+TpOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QDtgOEFJJV6UWyNQ0vUNNpGHnYY4xXvgIdDZouGgER6IM9aAhYfTQW8cDEcFfbXWS
	 iliWgfUmOpjoZ+3YCXCzrPoqkvOjGTGaba8aENgBdT3ZdVOk/4tiGq33KmHNDY9A0F
	 PmCpkMPAs1ZGBM70qRgVsxJAEJiuLx8fhInB5PkyMU5LdqbICsgRBh+T9UwVs2KtH9
	 PNKXohuQhFdpd260lqRUMPKtrb/S4gjyBUwe4KfY3wCbekzliLsgDO6PtPtLggOa+4
	 362VVrUYIbjXbm8tXzbMlzMkyHLOobsXbc9FcnCEuFTOAEKi6gIYKIuc62hEdTY2cX
	 hrhBmJFAdTpZA==
Message-ID: <sashiko-outbox-190633@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mfd: cgbc: Allow compile testing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 07:16:12 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> cgbc-core.c driver does not use any X86-specific headers, so looks like
> it can be build tested everywhere for increased build coverage.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030071137.1009=
54-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D2

