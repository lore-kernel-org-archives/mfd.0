Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347974;
	b=A/fEK/uzkDXObztdJoG+8RA/BU+VUzIPbtxZtcDh4Zb+cQE1smN/gPGfNciOrZYnYGEa
	 dJ1XySHTcLG2OzEFNcLB9xSn4y5E3/DDVtHvRwlBr3s9Put299H4v1UQqscPFrLTvQ/YN
	 JsTkP0dEIGsyzexJdWW5kWzBgBpY+9W2camjY9ATiB3mwYws/Mf7jenXcnVLAp11UsE9/
	 pRUyuSOFxmmuo3wnIOW+98RVAfWOrbU/3Y5ptAniTq+FIWr3i5Xtk1lrl7jagk4UjYhV/
	 8ZmQ6J+1dUgmBQjGAw1ULZLk9ORi85+++WIKbzzWEfOxXETRYt+nC8l78ZLyZo5klAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347974;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6bPoStpopplVmTMuJCW6IgMYB1t20E7C4tL2GuirdRo=;
	b=rPhdoJE0ZdVCXk2PlUlZqJxS4yf2ow+G/vADIvk/wNTwqvs7cIf4T5kJc2SSlmGBBZRS
	 adOhmrvB5hLOOIpvWVqWWUxXgF2PfhsXTbDQxZImh8Z8YsKlfnSHUtPa42MP3ReRVmHvT
	 SxkIN//8j4jdaXLA6ofjMi4AH7eywaB6LBAKLgs9PTpO8eRKymfiBsNCoSQW5cFrGV0qG
	 2G44/E5wlDX+QmhPeL9u2drpLzC+1/T6QRgHPgjJytii3qbMHoFh6M/P/2O2g1W41AvrA
	 HAnZHLhO0r61OKDrrDw2BNrGc/WiGAs4O5Q+8DYIj784DxI3mI5NwmrgUXwVw2YYZFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwCoW14Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8762606A325
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwCoW14Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9E61F0089F;
	Tue, 10 Nov 2026 21:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347973;
	bh=6bPoStpopplVmTMuJCW6IgMYB1t20E7C4tL2GuirdRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jwCoW14QmsQy6KFzyMjjWC5MrVfvJaM9jni3SzDQa3SGIePvbZZyw5MUu+LlhOusX
	 UfX6cl2NbWnxltFp97FhxfvnoTTDhUM1udbEeisV3Rli7iqjHymjwcEyyP2/dMDpqs
	 T3Z1k05EF/mZXEIDU/KGf/YNT9rL89sQskIazlQS0rGHddvjFF8UMDCFb2S4wprwCe
	 3myncuRDYcdlkAEibTdfXLgWgfU66C1CbQqT3MolLcOTITLE+VihcKMpWwQZMmRgwA
	 zp3ZJYgw4WCqbUwmqfRd+nOk+/6gnxvhywoydYR/LznGm9TJP/mvvFUt7qjd58gRLj
	 jYYD0j7a9oWQA==
Message-ID: <sashiko-outbox-207794@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/20] mfd: bcm2835-pm: Remove member of struct
 bcm2835_pm that is only used locally
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:59:32 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
> replaced by a local variable.
>=20
> With that change enum bcm2835_soc is only used in the mfd core driver and
> so the definition can move there.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D1

