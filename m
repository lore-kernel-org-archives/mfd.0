Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102519;
	b=MF/u98g7aRAhqeILLPLJ07Y39KPjAgIrwhu7N4EggLRwYZCxip3APVy16h3t0ZqvEbvx
	 j3dSGqIA4Xlyg0SO5wdqb7Ib2GJ2VJG1ba4c2ruMnguk0cLjkzZxYYjwFUD0otzoEFPxv
	 frg7SRuTtFyBcMP32M7RGwkrNn0rkOs+WU2FsOpXVP65ui5z46nX3dYR7V3mauQ0D3dAF
	 wNLUah42e72mvnjyONYKPQaycr2XY9PMIjmUqSg4ZT9hr9FcDZyEEEfJ3ByFdOgnER3oB
	 eRMLp+4gdHS08y9E4kJbkdlh6tB0XwfNFwSR/17jNK6gC5uJiLM/ZXBXJ2vZMgRipkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102519;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3Gjz1jUGyIG0bSaaBsaJ/g0SPnUUbN/xAGVKycObgC8=;
	b=feXCRKYrsRdrcfsrns82SnFbXGFBwbRIZYf8ogfrw0MTbOmv3dwX0F+3nvMWQtO621ks
	 3NJWIn7+FybEc6ujncoXGfaC5oMjN1Tdb3uJS0i0PnZwsI6ioYxUnRic0zQqKW0Zwc/qX
	 H2hwz7oI4bzLtB/1708D54elxccGyj7HNbKv1UOkReBguEfxN8vegZ7LtCuQtuOZvR/ts
	 IBg21nrnQZqBOBPJgzIsYf2JLLzCB2EZ9B/bs787ya3fvKcL6O/HFPlAl6e1COUfMuULv
	 jkK/4ShgZicLuEf65maAKkQPj/B+lqfyxaSdKVQ1Wvg24WvvQcvIV7wA7xzhMEbi2ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HkKnYGYX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315760A3836
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HkKnYGYX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0E61F0124A;
	Tue, 27 Oct 2026 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102518;
	bh=3Gjz1jUGyIG0bSaaBsaJ/g0SPnUUbN/xAGVKycObgC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HkKnYGYXE4FkuKBeFvWyQ+9dFANjx71XTchxf7Gu0KGrfJYc6SE+DbIIZTxZTABGY
	 8D2F+VH6UzGpk/w1rJELihsIKeIF54LpLCTkt4RSv/c77uxEXfdPnP3qv7axYZWZDr
	 jlPGONu6XVIw9XPbXCBwxGfDRZFM7UXpEgyXf9+VqaOaE9j/DunnotSREbeGS0IEk0
	 LMkXzU/JPMw/mkDewnt+1UV7vBZ3m+JFW8O6/U+4a72uhgWAwZBjk+EqyN/QoUxEaR
	 ykgEglZm9T094nA7CtAy58C8oKVfquCpdlWt2XYPloMx3exc5kKeTtRmurq0TihvX+
	 kcKqPAzhPsG4A==
Message-ID: <sashiko-outbox-186494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] regulator: dt-bindings: maxim,max8907: Convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027114634.79706-2-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
 <20261027114634.79706-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 12:01:58 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
> to nvidia,tegra-regulators-coupling in child regulator nodes.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027114634.7970=
6-1-clamor95@gmail.com?part=3D1

