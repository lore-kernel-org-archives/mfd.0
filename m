Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433518;
	b=ZsC5dO5p3NuR7WqovE6z692liMTNkvG9Z2b1xHTX19F/KqpZk3YuW5AWBFLhuX1+lQaJ
	 L9F4Q4S2l0oqPdONOG5X2/4khXsPz86s1D9Koow/YksN3s4ugR/PwQpCav1eT44WvqSoi
	 cUoZ9yZk9WtIFRmCyjyRQSzLNhy1S0fK9cDkWd8jaVW4GRFb/kDD7LyOkdLmrF3fxqNTp
	 x6OJDQ00B3BaMB51GcRQMHWDNAZ0YCvQCUl2svj37eJbDzZ0dsrard7v6N3isVnHACd4c
	 gMTbImYD3BmVipfj6lVy2yMPMe9tigJuisRnXMGYvyGlCtvFpdk2D+3DDyU0x1lWtbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433518;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GxbRnGoF6hK4T9nKkA6qRiF4gFNTgkj5dbfa7M0dtJo=;
	b=YIrNcDSQrudg6z6J+5LS8ZJ+AGgi9QzhvH9GrrXXNAslRxZ5S5NKgYWDRlStcS0AGMZr
	 bspKtJMx/1WY7J/7U3xRhCTkn9oX3ipBFKdd2XRy1P73nlJZv9saBSoUSQx7/up2rqBqD
	 QB5SnmA4AWNGQgsgOn+c8I7m1P/FM7Fatf1Q9LuwBu+jOg2SeH5rAyLUW8+zxJJ/vW/ra
	 zqus1hstNSl4PaosJEnFGPE/uaYOwOMF9lLI4e7PAUB9l6wHAEQRs0tx1NxaS/N7hw9QF
	 kWmDfoVQIUBpMC8dW9trPePZjrwWbn1hG0vonLpw7+eN6LmUdt/aoQDdA+St1dTZfbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJ9JZZ4L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A725606A31A
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJ9JZZ4L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C107B1F000C6;
	Mon, 23 Nov 2026 11:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795433517;
	bh=GxbRnGoF6hK4T9nKkA6qRiF4gFNTgkj5dbfa7M0dtJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TJ9JZZ4LzpkfGn8e/dhX9g/kjcrqVsmRZMhzkI1AYwPlTBuwrDF0buUNGqIJUpL4F
	 XuI2w1PZE5J1O3VsYTNXHUQulZhoEpi7yaINS47iioo4u7s/P9gBWCjHGN6u141t22
	 kOMznPGLCat5HpO7pxgl/HKYGtz6ftoA1rj/LRzVKAKmALWtSd4fFQaAKyq+C/GiMD
	 RwUV7yfX6ScmeuVFltsn/h73CW16vzmtKid7TnmT9MauZqK+ya8xqiT9zCMvgbJdi4
	 vuLTT4DqZgZj6PTNKPavvX/MYgs+eBDa0QFBSvBtJ33tRUV2NeI1pRRDNfXn6/7C/X
	 1jR5SBCKfIOaw==
Message-ID: <sashiko-outbox-229147@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 00/17] mfd: Use named initializers for arrays of
 *_device_data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:31:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 17-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795431460.gi=
t.u.kleine-koenig@baylibre.com
