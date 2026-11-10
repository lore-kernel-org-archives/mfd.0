Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347957;
	b=SNMMSKJ0CUDOoE2mF9alj+OriH/97lcxr6rxJh5iUhdJyVwYMOus07OyJObCi+SzxsQs
	 7RmAfK4OlYHcg4Euz7RqJMn9bl+YII/Ogogg+RUDBoi+eN4ZBUAuHDhUIAaw+IwOyY5A+
	 6hCMDdnryg0i1A9I82+hKQNKuOnZsFVNyoiYViMi74YZP/ppKjf4V6pKF6YKS7FZysDhP
	 3vi/evXExOAeN56LfOrJaWwAxLhhltrC1vlbc9Gy+miotI20Q5nFNn6MUQ2mM7vvCJGiv
	 sKB8fD1dmagwCkEIDHd9aGwGAb6VGSUmdmM+YutNW3c91NeUGtxnvKNWuQc2JC3FZmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347957;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lBNKnM6R3i3lohkCpt4i9zI32srlHEEUvTbF6O81jCk=;
	b=CCCQYDL8I6mE+F0xC8mWmRKCLL+JFBJSZAOogYlD8I2n77iPlzNug8uyUFmcJVBZGJwf
	 WUQbQvc4ofigUecGC5cdvBIlMK0D6Jz4ung65k/PiGN6BuaPOhapCOrafz1Ygrve5K2l8
	 wiOdUfqmEGwOCRznsLmQFNTaVJ0jbp3zrPXA62fv9daY4lk4W/egins5STrfS5d39MCEd
	 c86pR8Uy1BQ6LQ+l0XOCR1xnAd3W/Yt7pppYVUeeMIM5VC9yMpBhIXlqszormjZ7BN8Uc
	 ZoGcztX0TK7bsD581BGygS6LftyE8o7qdY64ZAlS8ZcLffE2ilNwNUDrUrVWFvmqXqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EANgMAdx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99A606C986
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EANgMAdx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A144E1F008A1;
	Tue, 10 Nov 2026 21:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347956;
	bh=lBNKnM6R3i3lohkCpt4i9zI32srlHEEUvTbF6O81jCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EANgMAdxuD6wSMchxzb+l9Wn7OQVoVw4besg6QemQlZJxnn27wUZpV33WqVTsH+6n
	 AzcZgrl05Bp5NhXlZzL/XBerYKFFN5ArNSJ0rJibHjk8oE5r832OQQxZ0ZeB+QAkBE
	 pnH72bslTRiQXqN+hmgPi47zWsBemdppdU5CQhtnjMVI7tzc1+G9MpPXjovbQLTcvA
	 wDlCur10Xa40tF5B8fNDOlVBYD0XK3vfcA0raMDqA1cO9iqZlEG+d1APBs395B2Fae
	 E42n6FZKgUK+EIc2je1pDAdKcOW601/MP5aKwkU9nG6ajzNOVZyeiwz2Uwy2TXmfwr
	 nmuWomzFUOkbA==
Message-ID: <sashiko-outbox-207793@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/20] mfd: bcm2835-pm: Drop unused header
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <c3dbfde231fd08ec74b875026bd820987934f620.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <c3dbfde231fd08ec74b875026bd820987934f620.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:59:16 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> <linux/mfd/bcm2835-pm.h> doesn't use any symbols provided by
> <linux/regmap.h>, and neither does any of its users (i.e.
> drivers/mfd/bcm2835-pm.c, drivers/pmdomain/bcm/bcm2835-power.c,
> drivers/watchdog/bcm2835_wdt.c).
>=20
> So the header is unused and can be dropped.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D2

