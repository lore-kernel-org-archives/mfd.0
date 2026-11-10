Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347984;
	b=jqxx3QZ8SobGktgxTILi7OsVGr2ULcqJF9cRFxheHLm2282HEebH5HG/Qwk/aq1tjfIa
	 bXYbvIJHQpyZDhIyLiVRezXa58XysJ7U6HAg9dRVyQAd7jC8vVhNvTgtWwmNYWz1rv3gu
	 QphgSAw3o39/nEreA2tBpZUqn4h7FXdFMTLgozHILJFayTsklpgbIC1G0Z43PIwbqGi5B
	 T10At0xdmiV9BcNJPohXrvuyMpi1m14Gx7sha95QWsIh8Y3nj6WoKaJ2EIrEWi9ehj3CZ
	 mOOqaXsKBfBCjiCoaviuqO5KHSnp7bojSxJpssF0V0ZhLPhEBySUTrlEiuz2RlbyDLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347984;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pw6gkRGDZniMl76x418aYrNeYNtM6ZO1GYL0/YHU9gA=;
	b=WJ+feA8ECnVQJEhuy1VK6RBQBz5xoLsIDjy1ZkSgPH8/fndonSt0+pOJ58TstMFquFuG
	 wj6H3zzBVJugNkrLEwczBbQL+lGOnLLMmD5jDMxxUKwaRy5pPYsIsgHcDAsd2miI+r5lG
	 xzvUyeARjQcX1Wr0419k18UYx3jD0bzfuXNaVXYjJzpq3H+49oOB2kP4UncteRkC/HWob
	 zQ7HoKOBse4fXm4WV7mwrtZ6xYl0elbADfTMQx7byUTS8WgPUjhegwOHZdqRVQaGNccyz
	 4kxGXyYb5iK3qngS+eXa7ICnoLZ5BcTd64bxrulgOViodNGfpuxUQkaeklmAXxpNRwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlGEVm4K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66087606A334
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlGEVm4K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8B21F008A4;
	Tue, 10 Nov 2026 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347984;
	bh=pw6gkRGDZniMl76x418aYrNeYNtM6ZO1GYL0/YHU9gA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hlGEVm4K6XiCKMj0hkZ0bo8TY0QSwfEkCR7/YalGz6N4mrzxyYOJ7AKEh0s8IN98H
	 uq/6If0HGbL0JwqWwQmvZ8i2ELJISCaGFqQ0AWAvP0W35RrmrlVxpXhct0708ggVXG
	 QA7d/qtJoLNEKLtcrguHHaOkyTGDxmOoqBJxlTSjdkUzwJOBvjIKrltW28aCJ/2FzX
	 br+rvmeK9k6zDgpYYtvZ0ffe/V0cgqv9Np61RZCOQc1MEp0SXTkiQZ/AIk7b9cQPU0
	 dqj6ZWvZ6wUF6+QO4zSLVIA6D3F4YAcaG0wVTcpsmw81UuDchgFfZVRIKu7EF0Tgjl
	 Xu/CVmBHz+ZHA==
Message-ID: <sashiko-outbox-207795@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/20] mfd: twl6030: Use named initializers for
 of_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <0fe20dd5f0218e5f283f50412bc549b2a37f73bb.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <0fe20dd5f0218e5f283f50412bc549b2a37f73bb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:59:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> For .compatible a named initializer was already used, unify by also
> doing that for the .data member.
>=20
> This is easier readable for a human and more robust against changes to
> the struct definition. This robustness is relevant for a planned change
> to struct of_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled array, only its representation
> in source form benefits.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D13

