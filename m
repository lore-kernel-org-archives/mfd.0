Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347939;
	b=U63b3Ih7ePWkpz6i1Obfl1NyBtLPKmUeO+26/bTWhsMXJKCqIZnt7MThROyYdkrW82Ye
	 JajN6bmHnmHhHrlOALwTpqBSPd1qp9kYAxhZUgbNV3KUHRz6WUGSbQhcf6SSOhrupZVGe
	 RbbXWbOX7JUNYyTeuhSajdasYlZ6hy0niHLHcsaALp2jEIze89/bfOHkXdsqS8rHywRvh
	 tOvOEiaT4mTnRzQxop14ON5Pi0izdr/LLf8wY37eiRdeZ2OtPpBlYld/g61tKBfcQVO2E
	 TXCECs/c9XIe/RTzqDaTbdL98A7PUgegPwsKfNFWE9HdvKRdnDoLdhJe7mSVmAMpU5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347939;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a807Zhuv6hYy+4fxLq2/kkiFcyje+b5XmvmTxcFPY9M=;
	b=rX9NbQNpA6neRLGMjQ3EGLZMh6qJIkIelH9vfjYJVn8xvXDbljZtLUcbpbNs6LZ/er1N
	 s/2gwiG0RIYg8uw006T5Q+Y/ofYtmmc6fKDxZW7EU6rfJuoGPlsMwwZjA5fJPy3LJJi/S
	 xBX1xbDN0c5LTAPmiWeqwW75pTPgejff2YeM/sk3GlDLc8wTePYNWk+MDwNOMca71FZvp
	 ZRdhy1rB1smjKi3rfahMXKZK6d63R0m4dZNV0Vpxg5RwNiql6HYXIVEttVH2z+YhPVtLP
	 9J4fkvebKj7+ZheucsLMr4R979xoJ0vG86+xR3gdzxjYNOKeGmn2HYrTTqByZ6hzCng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GdhmixZE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2361606A325
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GdhmixZE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187481F0089F;
	Tue, 10 Nov 2026 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347938;
	bh=a807Zhuv6hYy+4fxLq2/kkiFcyje+b5XmvmTxcFPY9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GdhmixZE6wIcp4i5tmbt1JQDcEQFx72E23ZxkbwdsJ7aykHCdpqDV+1S1uJ8615Nz
	 FHezPf6oe8Y1vICnBSScjaI3HRoTocq4+56ZGyxpXMT1p6vHOAlIzRk4IdZNokVeEj
	 7ANEGd96FlTG0xRqMp1mjh8betCBrATo7395P64OvzUhfNLjXi39fXl/Q6IIbmwFzj
	 p4xZcuPENgmVWNlfMb0YBd1r0CVuy1Ygs2+e4heBhifhbtYRSM07+/UjjwAE7FjqlH
	 lJ3jCvOrtjlEaTasyvSjQkTWlfYHg5H/RRF6rtJWfLQpPFO5f1rLzLRYeJoYetUI12
	 KViVU9HG0qjmw==
Message-ID: <sashiko-outbox-207788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/20] mfd: rt4831: Drop irrelevant __maybe_unused
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <a87d5107217847874288e449d6deaceed75fb4c1.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <a87d5107217847874288e449d6deaceed75fb4c1.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:58:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
> modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
> even if the driver is built-in. So rt4831_of_match[] is always used and t=
he
> __maybe_unused marker serves no purpose and can be dropped.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D6

