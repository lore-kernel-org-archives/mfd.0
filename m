Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392515;
	b=wz4m8E3rg8YSvEW9v6YBhhN20dEegt3hukJPjFGrTUpTd/UW87CKaoy2qfMN7gMotrq0
	 3/joxq8kB4yQe57bjAEX9j8/hAcx7XGxLHR3oQ77NgQTq+LR7o/1fbs+6LeBzPuhQ/+RW
	 ZNp4C56t0clJNqTwASV1iI/r5Y2KshSH8WkTSrt3vz7hND0r+oaHIh3jK2lbdHyk9kvud
	 W4UOyTURPc7m7Y1ypACbwTTLEqwhjnDLl0MaSg0wfiiF+EVw4tXDt0Nlpo1FhaMoXVlDC
	 tS+Ov7QTMnFVXWRqnFZ1Z4EbGeaGMRB7i+NnUFGCOCXa/CWVUIz2z0Y90xjYZluQIXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392515;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=IHAJ9cUkaGN2FveJz7xOzh7H5WecsPhTKQF1RWuJHWA=;
	b=eukMcpaSO3dyjezLSfWC/19ZllS15rztHC06bHqliXDY5C5qCs/Y3VxFZwirMEROEAM8
	 IryRP3hOzVVakRI/gTwtQrVQHeljdsxcRGFIfPZLR6i6y8EO4MAd1thod5rydfmCEqXii
	 152QhSAv5nx/mfC/A6Sjf8J9mxm9OiGoP52duzf6m8rzjkJkQ/Z5fc8RMONkjy+2YbU2d
	 VSeUReqpkaKemL28UpAkYALg9/Bp3JiacWnDJlif2trQHyxwl6TURhJZAKRw24fmedEfg
	 VJ+CHJxj5ZQe37ewLPmp2IBwf0d6BEhK+O/C5KJzqWua1sf/TZZTrNc2m/3jx4ngYnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.ch;
	spf=pass smtp.mailfrom=protonmail.ch;
	dkim=pass header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=o8LQq9ub;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BAB606A324
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 10:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6BAB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=o8LQq9ub
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1794392512; x=1794651712;
	bh=IHAJ9cUkaGN2FveJz7xOzh7H5WecsPhTKQF1RWuJHWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=o8LQq9ubpri/Y2Qjv1C1uK9ykuOfToXwAtssQ+VDqhP7mmgXzJwKy+DvDeHFS+42e
	 lIhP5uRzFZ61cl07qEbB2CmXBrHLWH7XVXyeQkokuwghPfxOzSH4WA0kBu1oJQygGK
	 whfFQmKBmz4bhmS9jeMaOr2Fuoe8MTTYOQUPqdYkX4DVw5FIC2kXL1XL0I4qCu+EpR
	 oP9lhE+uyWtukJBQA9uqUV7k3MaDX4+qFabOlxwC6EJVOOmOjlKuC0qPZ4Zq/b2kMI
	 5v3eAT7l+AwHtzkYpW3HRrhJCIEseLVgTrq/+wvv+rtGovzCKJ+SVl8FltuWf9Z0LF
	 JWZY0Txhrqkgw==
Date: Wed, 11 Nov 2026 10:21:48 +0000
To: Chen-Yu Tsai <wenst@chromium.org>
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for domain creation
Message-ID: <20261111102143.16afb567@ben-desktop>
In-Reply-To: <CAGXv+5FgXESTgZ4hNyPP1Cdd4BfnV8dVTNpitKKpNAuWY-gYMQ@mail.gmail.com>
References: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch> <CAGXv+5FgXESTgZ4hNyPP1Cdd4BfnV8dVTNpitKKpNAuWY-gYMQ@mail.gmail.com>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: 269b96da12c9779b1ea33301a5cd0b8c5acfc692
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Thanks for the review!

This v2 was sent by accident while I was testing my mail setup, which
is why the changelog was left unfilled. My follow-up saying so is still
stuck in the moderation queue on the mailing lists.

The patch itself is identical to v1, so I assume v2 can be applied
as-is with your tag. If a v3 is needed, I'll carry your tag over.

Best regards,
Ben Grisdale

