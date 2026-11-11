Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418167;
	b=4Qp84ITKuBUPDFu+Rd+DCc2E88P/MeTNY9eUriDViJWGQkA67NIeHFTLN004z1yMPJDz
	 Wxhp6uMoKgbPsFN17xKTxKEz13RvAolildQ7h4cxX6S6jjjUYN4hHkCra2Nai1pFivQbw
	 Ij6JTvPvlhk9wTvWkfHkRQ35UMbxQTwCQKtM9vvpnjH1uxf1fYF0d8O7qdM3zLbKlruiR
	 C1oa1zh4omclv0qyAbouFSr7iycmeQbFVJvX2Cwi/vXxGJKKL7eY78N0Lyuuz3jc7WRGG
	 lTJdt8sQReKonfc+IAxXrQ2W5dk31uZ5M/SxOOBn90YfOxliwKfxjoMx7uHBeVKhE4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418167;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R0fg1yydiYv91hCUtc7Y3Il5Hh1cfNfAargDXzau1xY=;
	b=AeU73T+aJAS5fibMap2R0aCvLYgDrPtB9Xk5Bg9I96x0CK0jAl4ZQLx4mImztrRcZZtO
	 nUE1evzbWQH360oq6QEMc415dlLxsIlMtQ4WkfoRTKOE7rViTRTfEz+U+j7WVA+G0a76/
	 N6usf/eBEENka7Pma27HawoWLoPFoGBRbGlcpLN3+bgjxe4zqaBYsajQ3xRXZh80+Evh6
	 /12jFVX+RpYgDI6NB3bzPjLabLexhO0m449CZ1nQx6GY9Cc2odjsczbLdiQjtjIVFU80j
	 SFUT96F4CtZRynGPeTtnej2KElMo5h1d4o2YnQuOgXfhYve54tu1iYAo+DdaOrruG+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CokPsro2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A9606A321
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CokPsro2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B871F00A05;
	Wed, 11 Nov 2026 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418167;
	bh=R0fg1yydiYv91hCUtc7Y3Il5Hh1cfNfAargDXzau1xY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CokPsro2okVLQFmJyIAG4+3ZujH1vjgIidcGz15RcBpa/d5hMfwFrlEFdB7X2iT5O
	 OKFk0r9JI5dsbPj9wwLkpN7FPz50kVCPuE7wyVo3PbXgwTHiWaoJJXpkeoPgOKAJAT
	 hks9WhOGytI+UC69bN0chdVOHQmTdwcuq8n0JqyOtkczCOz/YcT+IJcO8Ur3xr2zSv
	 MwbcrkEzKATQb0Sga4nCBBfryHtQYCtuizx7dp36vafUE/sYOGcPf/BBikPjNjC4+X
	 vyRZZW9YiqUBK5TX8rySwdNNqo0jIu40QRrGGnjpeZK35+W9SBQWXHDtMU5EBO/XBa
	 ghJRbWRB99H0A==
Message-ID: <sashiko-outbox-209411@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 6/7] zorro: warp mfd: expose the fan duty cycle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paolo Pisati" <p.pisati@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111163735.227286-7-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
 <20261111163735.227286-7-p.pisati@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:29:26 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The diagnostic frame also reports the fan drive as a percentage.
> Expose it as fanspeedpercent.
>=20
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111163735.2272=
86-1-p.pisati@gmail.com?part=3D6

