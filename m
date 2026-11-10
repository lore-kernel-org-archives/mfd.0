Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348060;
	b=iRTez/WmLYUky2niixKerjxATdpPYCxorJEbfHDy2nm8NOcDD2/mY7KeT0dnafjuxdDe
	 yL1ApHPgLqn6srClfqzNnqskH31lXTrLQ243YNWzRgaYxP3cdsWqm5B7uycuQO6PuOfqw
	 ++0bXYZGeFZRqEh2t9iztLRMTmrLV72jHq6df49Ge3iY+N3PFfy732AZ+E6ETNXSPIknk
	 pYn2OJdTyWyNkoNc+vBAfFcHuglIrx1pMBsDfZX02RS9rNi8K3XQojK39M3hQ97HI5+pu
	 bfTEQ9V1XMagDEmmGv9alFKuR6Fj44T5FScep1c7YrLUQfdeRzlfPTxDQXznM6HdnOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348060;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Uuqhgr7vCL4+GSuSn/nVZyXzUdgmAyUG5JOUd4d8Yq4=;
	b=wVAkLSb5QU0HZ9fmFQl6udvdJXeJOT2Zd+BzkACY3YMf1exppuHkJWo5vpaTTkFbX3xy
	 RdG5/kL/1wLkSN9ibS9Q2t4D4T0cXHGYuce92g3Es5asb4L2ZjiW2tyJK/AiXVPK8jlRA
	 iAe/yiiIaEFlk2yZ76pV99rYmasLCgJU1HeMx2ST7Ru9eaO7R6SQq50gpK6pLs978lp+d
	 h84G+3ueSnRz7HfX82YIZWGxWWK9m3qyKOZUtVb+L9LxYTna5jAiGuluheFJuGmUSfkcG
	 1ZNrB72+/gNzrOzt/YEMPHQ+3KRb5jG3gGMiFZ2ZJNAcZ6v6Vsisxu6De0yZAFbAq+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CWuAC1uH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60D606A338
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CWuAC1uH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE711F008A2;
	Tue, 10 Nov 2026 22:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348059;
	bh=Uuqhgr7vCL4+GSuSn/nVZyXzUdgmAyUG5JOUd4d8Yq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CWuAC1uHczR67r4YkSoA9dsuuW4prG7DeZVdtGG++GKLggYsv96LVOw4+4MFdXc9n
	 j4SawYDCX2GlUyY2wWhGs8HH5IcVkYWrn+FQfPx/l6lPwaja20bpKi2rgRpzhCcHWD
	 oAdduuJwgddPQwkNwmoFeUcld0oReyledyOQnUwdV1Z58Djo71Nc+YvT5KI1q5Cyvx
	 tCRjesfFenik1xmXqBrPqKRJlpxxss/NSipk0pTkvPIhLGsJ1U9PQcrtx2X1TVZw7E
	 7XLyeoQkHohkcNOMFgvddudGbZoXILss656soIiNigfbD8v9YuwKzhZ7cAMN6GeE32
	 ycnamX6hO/V4A==
Message-ID: <sashiko-outbox-207803@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 18/20] mfd: Unify style of i2c_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <9d0e23458e847372a4ba9a4f582d36f0ff5b0edb.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <9d0e23458e847372a4ba9a4f582d36f0ff5b0edb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:00:58 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Most of these arrays already mostly match the most used and
> generally recommended coding style. That is:
>=20
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>=20
> Adapt the few offenders accordingly and also use tabs for indention for
> two drivers.
>=20
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D18

