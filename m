Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437464;
	b=5T51Z2DPpT3UMp3e79gZ6WrYnQmmLA2AZTw2bhh9xPxjzcu7GTFHS8Sdle+gignn8R3c
	 lYuWmF6VIO6QVSh3MVRWuKFSKKHcARrGmffW/V5kCixBSQAS+womj4rk/3+r5yaY56dob
	 gBTaIOA/IxpagM5e48woRZuBF7HSW/T2PUX8M3fvxMV6VgTMiYHAdCOwvbYeh9+KBIduY
	 f8sJz27O5e3hpyFaIZtAiHcD1t1v/erR7t4xhZSU1ci9oNF9ddsPVdbSAsQLxL1rvMXmM
	 a7lCZWeN5YIBtvOh+U91raq2hiLWAlJmRfUShdxrzBFHCfhkLRHz5cEcsPkPUnI00hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437464;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1y/SMDdVyx+oiOgkWq/CySvt3utrrInYyfRtaY7o5j4=;
	b=I7q2uXRvBcEQ0bCpFQMcXz8py0nz3HaUZUCXyPGkZPE6gG8s/Km+gpMnJEze5Dekt1QZ
	 w1FixOc2I/WteMzfL9lkIqKsVbvfwi40L+3Nc2XIe1mvyaq/3iKLQcQSgDwmdTWSbCZqH
	 JWi3DAYqkMg5tkwk9B1Z+XWvUL8Rp9OcYkGdWjZIM/N4iYto/AjIXDCNdfwLMCNBTnUXF
	 0p2WcOFb4N/1oSs7gav/I5Zc4rOWnyI9MHqhJH19FMpiyapQiCq5h83ZkW918BU1piZIB
	 rBbXi5ZTSUe9+KVbMkkWdyAsT2H1s41KO7VZ1Un3jyR/pbelWr2FH1nSVlPDNl6VtIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Rf88/SUq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C80606A31A
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 12:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rf88/SUq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918AE1F000CF;
	Mon, 23 Nov 2026 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437463;
	bh=1y/SMDdVyx+oiOgkWq/CySvt3utrrInYyfRtaY7o5j4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rf88/SUqLMyngewf3PSl36c2UYdoCiT2LrWLsoBWSdM+uyUvEhLBTvrJNDTXNgN5B
	 LZ7YJj/sDEveH/WMaYdfr4wKIVztqjYNMRfvY2v7XgNPGdtdyZM5fr0Lmeu86maXzb
	 ge7z6Vg1FjUmkSxoCLNnpqNJ+06EGD5cC+EvQYDqRe2lmjHjuczXjyQzqbb8cg9fmF
	 LideC5/CDco1s/1jHaBBU6GNAfwtU4+/GqEPeJJU/Sc98jaY2v2o+yVZ+o/Fnz3Omq
	 rhn4RYt2fG1uEdvNDH7SJT5Xv/kNngMkHMbxXmpMfG8+6q0UYU/PpS7HddAnLiyGnm
	 qvgPor0QCR6LA==
Message-ID: <sashiko-outbox-229234@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: cgbc: Fetch the status of a write transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Haberlander" <markus.haberlander@rosenberger.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261123-cgbc-i2c-write-status-v1-1-5b0fa0322b57@rosenberger.com>
References: <20261123-cgbc-i2c-write-status-v1-1-5b0fa0322b57@rosenberger.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:37:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Markus Haberlander <markus.haberlander@rosenberger.com>
>=20
> A write transfer sends the I2C command to the board controller and
> returns without reading the controller's I2C status, while a read polls
> the status until the controller is no longer busy. The status of a write
> is therefore never fetched:
>=20
> - the write reports success before the bus transfer has finished, and
>   an error such as a NAK is only reported by the next transfer;
> - the controller keeps the status of the last write pending. On a
>   conga-PA7 (BIOS PA70R026, board controller CGBCP032), a board reset
>   with a write status pending does not power the board up again: after
>   a reboot that follows a write on the general purpose bus, the board
>   stays off until it is power cycled.
>=20
> [ ... ]
> Opus 5.5 and reviewed and tested by me.
>=20
> Fixes: 6894f640b8f3 ("i2c: Congatec Board Controller i2c bus driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Markus Haberlander <markus.haberlander@rosenberger.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-cgbc-i2c-w=
rite-status-v1-1-5b0fa0322b57@rosenberger.com?part=3D1
