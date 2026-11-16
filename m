Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851957;
	b=AZ59M8o3+3zwL1+CtmSQqj5/redJRG3M8Jb8Dr7nR13NGeXO59u/G4WQq88TmAHsnlLB
	 DaGdwCkDl5GZEcDEEVZr5N2BAxcBHkWTf89xKhd13Or2k2PoZFRLAIGZgbkD00OIQkvV8
	 fdkmZpjD+2fc6wTIcjlHBkrdl9DOYOVznZswdTmX0UUiF9PKarnHvIPcfVC1+0pJq85Nv
	 Oum9mPEjSynTyYssJ7PRD15MjlObtpFPEuwdM0Bw6ueUwZLUay72Kj4e3UxE62GU0N4z+
	 rGyNDMH+qU6CXHilfl2HU49dm3pj2F3suOFgNdmMz8UqcMi4bsxyONLcLkfYu0IGPgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851957;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xC488XZU6wRgf5UXlmryWfnuD62lmaRWUADMj/rppBs=;
	b=g9U45GFUP0DGYxyLLh7MNWxmXVI8ZAKeE0K1CSFzzOi6be9wKf7IB5AB33PTRfl4AsQe
	 Isbgc9n3gJRxY7g7/S58QJY54lCSxjeNwlF+L8WgH5JCdydiZMLqVBNDg7X6kEK7CGId9
	 Ma12PFcleot/3OQlrlwkw/MUfp79Jec7D6TmXEAFTQDtwBx/4fSLgW9NQ0nKDJWV7uNtD
	 nsF8nN7heB1TcmfJEpC13VqeIDO/uH52XQwfi2Uj4I/DYSX2hLRV8E5bMqiAoBPJiJyRM
	 /qicKSgls42P312XbinPzXDy/AyVlIRsSRjo/KciGbRlrtOAcMt96Aj9i8zNCq3pwBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mVExs8nG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D5F606A338
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 17:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mVExs8nG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB441F000C4;
	Mon, 16 Nov 2026 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851957;
	bh=xC488XZU6wRgf5UXlmryWfnuD62lmaRWUADMj/rppBs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mVExs8nGb/Bup8IjVDrWg46R/bYWYxa+wvXPTAWcwwWP8vXzlFmC2MhfgGyIRJtYO
	 4Ju6Q2n1dhlStZpj0IRMa53BCc9IMAHKKgNu5uVnsG+/519Ke3iLV/8l6MZwJ8TVQT
	 203CIkN/80xXAXahBSCVl6rGeUxRD1LRwjwMm0kN+DypzeeBoKgssgtYdiDqFNj+kr
	 iYU+N6x/5JVXPM4RjGAU4857uX3b89bMZB9txhgn0t3wg68fxxvBlvTltpLgiSKJJA
	 trSwhqyrS/LFZONE+brHuw2elP7LZLO2GK+pndN9L7VfH5eRdtgKMOYD9a0KqeINwk
	 p0F9HiEal6zYQ==
Message-ID: <sashiko-outbox-217472@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 9/9] pinctrl: airoha: add support of an7589 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116174854.342912-10-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-10-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 17:59:16 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add pin controller support for the Airoha AN7589. Its GPIO block is
> the EN7581 one with a third bank, giving 74 GPIOs. Pin functions are
> selected through a separate IOMUX block holding a 4 bit mode per pin,
> where mode 0 is GPIO.
>=20
> As on the EN7581, the pwm function is available on GPIO0 to GPIO15
> through the GPIO flash mode register.
>=20
> Unlike on the other SoCs, the pull and drive registers of the AN7589
> are not known, so no pull or drive configuration is provided.
>=20
> Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116174854.3429=
12-1-john@phrozen.org?part=3D9

