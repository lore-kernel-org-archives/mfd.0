Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585355;
	b=h8AaGIoZpVSx9qPNiv3g8eF3eshhex4T5cMcGjWCMJ8DMjT/ESvpIBb7awZ1LqKyknvy
	 0MUFypZGbmIF32P5ccZLhT42a9RGdzDJSbduNU2dnRsEID1TbWvkzG62/WGnEkghtyy/Y
	 GIwLErA/MXf6GDkJXKm3sVH4XtgN0lBrLKmFJHMZgnPvS0kFCrv7fl7s3hds0dWhH/FQb
	 u3pv8HGLB9Ue8Cbf2MSXpMNe1y/+WElskvoqa+STbL2L73Y0U18Zqv+oj/Q9IU9rEeZeg
	 +h6tni8IkFGCKdTm2iN+7XgXaQq1J3r3kVDMKIV1D5B5AI4PmJYL5s4OyUM9tM7MJOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585355;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IkFKtHNgdsS3iage3MeKT0+Tr/cesK2Cj0wqVos3uoU=;
	b=2VdzNpjf9kJCjtFNU59SOXtdU9ghRoSk2tsfYPyIa4JLp3tLeNTQS2uhO0qNlGEpjXg9
	 8vNojfJbfEWw6M/EyKI9v3uEylAVuDtksRiPTXKrkK7h4wIc3ky3c9hsVnYiHzOSpo88E
	 D4zOr9uXlOSyo7huQQ+5k/6T2rMuQtzdxLZ8278bHUFtF/87cCLI9Fb8S7+KwJEx7w7jX
	 72vxppTw3V/WO5aP0r7q1BIeJXvUN38KBWe5fI3o2p4Fm54NTZueJspI0jyzAlLjnDWG7
	 bondxXHcm8bC+iIKhBaSIFT5LV4HOhEbjJua29ENGwvc6v7HJVo0X0tJQMjMMkmC8cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y78nZhKa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D767606A31D
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y78nZhKa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F29B1F000C5;
	Wed, 21 Oct 2026 12:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585354;
	bh=IkFKtHNgdsS3iage3MeKT0+Tr/cesK2Cj0wqVos3uoU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Y78nZhKa5oIV6bXfgqRU4rcq+qULnp7bStC9/REEBFTLoUFFFCsQbdyxV2muQoqCT
	 WYGO5+VO1RQlh2yaV1pagrYZAccv9d4Aryxad0rcLqleSumpmnWhcIMwjhCg/PJVYK
	 Rb1NW7VrCsuC1tatzzaI88YPdh7w8Ww1M+6uVw8fKpI9YLt3vCEdnHE3JLGZgY929R
	 j/Zf8yYS7RdGKwADHMSoK6dhJruhRXz83pVhUv6B2FrkX0y58tCq0OgM7RRhjTIhIq
	 IjnfyfJ7bQN09LeNf9Z7cjr+Qz2Eu64sKC0qp0b6447UeyzWfjKdvUEWbkvX4nu42c
	 p7l1grO7IwnXw==
Message-ID: <sashiko-outbox-180237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/28] mfd: loongson-se: Zero-allocate driver data and
 initialise engine completions in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-18-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-18-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:22:34 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> loongson_se_probe() allocates struct loongson_se using devm_kmalloc(),
> leaving the se->engines array uninitialised until child MFD drivers
> later invoke loongson_se_init_engine().  Meanwhile, hardware interrupts
> are unmasked and se_irq_handler() is registered during probe.  Any
> engine interrupt arriving before loongson_se_init_engine() runs causes
> se_irq_handler() to call complete() on an uninitialised completion
> structure.
>=20
> Allocate struct loongson_se with devm_kzalloc() and initialise all
> engine completion structures in loongson_se_probe() before registering
> interrupt handlers.
>=20
> Fixes: e551fa3159e3 ("mfd: Add support for Loongson Security Engine chip =
controller")
> Closes: https://sashiko.dev/#/bug/linux-ad9310d7-13b2-4a4a-ad7d-78a4c612c=
78c
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D18

