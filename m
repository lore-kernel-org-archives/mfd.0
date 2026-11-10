Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347939;
	b=R1kU2400v9NG89w684zJiwUZ+vuFikJX3prHg/AS1MKCiRhDLpXC066zUHoDarHEcMUI
	 sUow23w/jWra1v6h6BjYwZlq9nlCrWnq5B/6YQA5YGuQpyvqK4IW4N9LY0zoPfGI3tGAX
	 bF+FCMPSWZMFKLPSDz810Qiai0Oa3nSbQ03qJ/n7zYAl2Af4uZ2ke8lvXpPaMVIv6PlFU
	 cV/S/PyKHidwuVjeGQ0RwzaDCekrHmgKYSfSzo2w4zzwF7dBNgx2mn/5L1DpXDPi0dzWW
	 X9yn5yKQKz2D4OcIIcmq/dE0+Euj4VuZL9d9WkxBH7qdwpKJZH5O9q0pqitm/r2LL+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347939;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8ZTkSa6OOwhX2YqdNmyGej7gsQoUi7w/1o0U7aEl/24=;
	b=e92x9e/dNGMrc4RL2Iy4ZeBzVVUNXlSntjuCBEWgvPl66iFa0GtHkuxLXJ0WSjvPNiAt
	 mlOk4qTZOfEGoYC/cKYoLXKi/PZ0YgQFi7tefS/mC/1uePsqZzK3YAMuye/zuqBRydbe2
	 AesXhkVbTJ00OMtdupc+Ep1jogunpjM17awDWFQLKva8Xojntle+q/mSTV9QLGsaW/rr/
	 GceMiqVl7ReMuLFMK0Raoj/4qnbGkrQ1PrsvOdSOdzMWZmK94NsTegplvcj0dbbViBYoN
	 rGvCQsfGxN50OGz2Nl78PI+jq9Yvm8/GGa7mOspVfGgjDKcTUTv5mytCqwCNsA+O8ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E35jw1Q+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA6606A326
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E35jw1Q+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67F61F008A1;
	Tue, 10 Nov 2026 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347939;
	bh=8ZTkSa6OOwhX2YqdNmyGej7gsQoUi7w/1o0U7aEl/24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E35jw1Q+TeRlslDcsu/NhNgPz6nnlSbtMUHaWGZDDkMiL6MKWZxaqbD9Fs7PtvirR
	 4TgwvnxpKFS/59jFITUKoxStjwJkxLh1g2MUYUj9h/SdUjFr3GII4305XYt1tRI3e4
	 CrZKvjUbGs0e+dFsFSiDzj8H4S8WJKCZt0oktJADao2uzIUviFmZeXtNwVvyMtkT7E
	 y0FR1eS77MX6MPDwkUsi5bB9mi7B691jrnibAAPluLtaRTWqPnUyE3KhHeYgOpQN+j
	 014jycYSvlJA+23QAm7x/JjKm//FOmw+3gFuq1iWdc0OFFrchiRuD99H5tD85U4w3k
	 FUbLWGRqUvc8A==
Message-ID: <sashiko-outbox-207789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/20] mfd: mt6360: Drop irrelevant __maybe_unused
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <f24ff673333c0fe34408abf1a4f013eeeb5b63d2.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <f24ff673333c0fe34408abf1a4f013eeeb5b63d2.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:58:58 +0000
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
> even if the driver is built-in. So mt6360_of_id[] is always used and the
> __maybe_unused marker serves no purpose and can be dropped.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D5

