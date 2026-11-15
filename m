Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794734270;
	b=IgEq4MZ9pq4KviQX5D4u/c4FbGpZ/C1jaee67yGuAaVsYek/rshi5JifE9KLg+nX68oP
	 SiIHpQDUhqAK/iq2bH0Ya0ClBL8fxay292sdzQV0FEu2GmVTuK3wlZ+h5HVr+8dH8zF6n
	 vqbECyk8Prhf63FkjoRenJLkidyOr7cJtLtmwRzHpqCLYK6GcBCphzbdzQ3TwBcKiCcB6
	 btcZZT9DvyjW0uksNbn66YhlRPIoNC+8e1CpF98xQJoUQVZp9ZvJZcoaK2QKinHpmAVrz
	 Z9+RglErBIjAfdk1pqP8wWzFV/bBKzYZybxaOS1S+vXbp9V01YU2xBTkkImJ0/nL8NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794734270;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aGCIKUobK8WZJ0qlGUDAx7Vg1OY1x//U+6BuorCXjr0=;
	b=Nt7/HiI8dsnmAun8fL1kTHzjnJc9BN0s2SVWWA1Fq2DfX5JRvgbQP6yDsmwQKk7a94i3
	 PoTs4bi0y66xWlwLoo86dDZCdsjJmye1cLUfU3G7C/9xvmWadb+nIVKirtHl/IMw6xtxK
	 Fnz1YUw51QBQ6KT3szSHKZj+KIJZJtwoHF9gApjatz7ujvH66YMZODi88UDyW/4wOajQl
	 AGu+Ki8pdM1QFPPJcdkseKTBg8R07UIzl+BBNlEHY1w6llqvQrBeC4qNpWssTjMvMU2mI
	 AyYsuuhMzLImO050kdmz5WhyK9Hr2byOr5A3ehooPUFqakJTTlyQCszxhtLn1A7Yu5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSzrry5Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFEE606A31A
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSzrry5Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D2F1F000C4;
	Sun, 15 Nov 2026 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794734269;
	bh=aGCIKUobK8WZJ0qlGUDAx7Vg1OY1x//U+6BuorCXjr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DSzrry5YIxf1RlXF8kwirNyPi3eWLL0zESHQNk+dvAc/ms7MA3Wd9utDmdDQed5uc
	 VgBmxozq9x/D0HvcbDABg2JXq9pg0BgDSpYa8YUEjDXKLxAjqozRnI4nyPLaw1dlHs
	 gbbtXCBoMLXxX8nzR8bJn3TRRIYe24GTft25gWAltswTjUX7BrOqlpRu6uARhNkKl7
	 CLZVYb++v7D4VF+Ln6LBxibClK4WN/t/79EupihUj8foFbO2dUpd5r5LdefdLbk0C3
	 6a9Zi/+y6dkZpXS7zqKkFt9+RzufczWf2S+e4nTOXtoPDSzMKGkA8v8LztJo63fdzs
	 RCFPI2RQ/mfBA==
Message-ID: <sashiko-outbox-215338@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] regulator: dt-bindings: maxim,max8907: Convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261115090147.95337-2-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
 <20261115090147.95337-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:17:49 +0000
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
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115090147.9533=
7-1-clamor95@gmail.com?part=3D1

