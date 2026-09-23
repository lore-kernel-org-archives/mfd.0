Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E89443E52
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153807; cv=none; b=SliHSSbYlcsY3020DCW4Jlx5PtxF6dOXPiOeBGTMkdadnLb5hStgyWieT103HASe93btj2UEDObocg4UQKjsjtCQisbGgGg5dgIBwhRxedxEmGj44PJivRPLpEGBBKkcvjZqCRMUqStOg2foKcQUOO8gb7UQLWNtPSSTZupaEQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153807; c=relaxed/simple;
	bh=y9Su9jq5v5fpwjcttaOOplO97B6QT7i3kInTiVL9bIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ab321j94jRmzSVqhWWJeDimIH4xQj6pY1jOcSYiGmiqQYMCwzYnBs1pXcFwaMdZsFDZlZzDiC3eX627yysbeq4Ix7FvQ4ugCJmqhgBTNTnB+SG8hrcqXyDJYMgRhNZcwEnPisO57ZppNcYOdkPv2X0ViMb+u9q8sm+NaKUZyzVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bw7TZwqL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bw7TZwqL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4CF1F00893;
	Wed, 23 Sep 2026 08:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153806;
	bh=y9Su9jq5v5fpwjcttaOOplO97B6QT7i3kInTiVL9bIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bw7TZwqLsBDRO8r9H7+6vN/a+vU2ejnSEVT4NU7ad8ezUQDKVRtkh9MoM8ad7Zobq
	 avgK1TXA8fwcki8UUZMB1vJtguGVAHUP4Bc175reecUslhPlDh1uDtoa9sOZe0TEna
	 oK8u2A6MKir7V/SU9lP6nWKP8mKlKF0MbdgVYYUbUJkCYgFLl4csrPRAodmnPxLG2x
	 DYb9muEyqbZQQ0uUfGXthPAj5pKu7APUL/te4wu4bFWts9V2+3xuMLgaM2wStdlumH
	 JQ0kuqwXRE4mY5SV5738DTL2z65FIWMEXftVOr1JawaeblPha+XhJXUG6wkDLy8WyY
	 mF0mF/ya46USQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] mfd: loongson-se: Add multi-node support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qunqin Zhao" <zhaoqunqin@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260923084802.29508-2-zhaoqunqin@163.com>
References: <20260923084802.29508-1-zhaoqunqin@163.com>
 <20260923084802.29508-2-zhaoqunqin@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 08:56:45 +0000
Message-Id: <20260923085646.0C4CF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
>=20
> On the Loongson platform, each node is equipped with a security engine
> device. However, due to a hardware flaw, only the device on node 0 can
> trigger interrupts. Therefore, interrupts from other nodes are forwarded
> by node 0. We need to check in the interrupt handler of node 0 whether
> this interrupt is intended for other nodes, this can be accomplished via
> shared interrupt handling.
>=20
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923084802.2950=
8-1-zhaoqunqin@163.com?part=3D1

