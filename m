Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417229;
	b=JyFcgls/0mG0+SoVtF6Pfj9uMT7fyf4CddXW6J1eos0Gg2SBq/Ty8ord8FB2zsWtj/uB
	 WmsIrEbstX8SMneKs0tEmZtOdgJr4R46wyCu+SyFSJa/bW3P9JSIEgEMQ199LuUyh3Ew9
	 gDGIFFlcPbm6/IHHJ9JDGvaNjtgJudt5lwBpP2IOuFBCaC1t3328EPIAea8zSjA2mHgy0
	 0e2v9QQpf5IZ4kEwisELtlmzf9l0LlcKBnVwxKtJHBxgoKTF+j/PrUGXPnv1VM9uXfzOP
	 5JbtG3gyO5QVu9cIZC47U7IsUzHJtKPtWSN6lURcpwzmP1mTN+a2BaHWIebH0r7enfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417229;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=75H/XjKMsxJJaEqeLv/SnSkMLr6bZ53nt+6bQV1JVYI=;
	b=HR/moQt+LBdjKLw7s+bwzrn5P7w92JpvNny70InTwYDmLBpjIK8C9T6DVavfROuUBCPw
	 srO6rE2KEjEpc5yC3u5oRKa++2fcBk5BOgaIVF9/I1BdnXc1eYcwXziEm+SmGhIlzwUq9
	 ALM9N9tf/64Qvfq6gq1Kq1X7QkDaahFmxto0PU5Im0WqBZSPMqLc+OdtQi3jga+pAcgPO
	 /JTFzJeYHUIREFi8gcZfofmmdJRYgYpKbixfYjJADNUGWFWPx1aYB6jY3L1ZVQmjliinJ
	 TtLCiX+7IspoLfhZ3EFYlRbnKW7lZGk0yJOyr23ZBPUjKOHUqmElfCsKRAY72AhN9Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ItEh6Iix;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7DD606A324
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ItEh6Iix
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56FD1F00A05;
	Wed, 11 Nov 2026 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417229;
	bh=75H/XjKMsxJJaEqeLv/SnSkMLr6bZ53nt+6bQV1JVYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ItEh6IixpzIIQ97Hi1RsfBYQkyDVxHEWrsQ0e7nO+5JRQ088X1hq78UMP1jo2ggXb
	 NZqCiuzCkKUKmo49/Ca9iJdOCO+mBhkHZvY/tSTy8EbUyCtvmKL5/PgUylPyWXUKNv
	 OtuPQlW1CEcebxkbQ2K8aBXOQsKkubCnAHZwoRzJUDhpBYo7/wZn95NsjgurQ+HwLK
	 +9Squr3BCqnh6pA8IT2s/MnF4n7jQ5ZhSAtsuJzOlRiDWaC+0MgEIPgVdTLXnq5pMt
	 /vHHjYFKEQ+bHjSL0LyjiJxRKszY+E/HnTCXUKvSD5AOpiFWvyhMXMS6NnRyP+RjhQ
	 MAOoIg1P4udZA==
Message-ID: <sashiko-outbox-209390@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] mfd: qcom-pm8008: Drop GPIO support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-pm8010_i2c_support-v4-4-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
 <20261111-pm8010_i2c_support-v4-4-4549cab1c8e4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:13:48 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> GPIOs used on PM8008 and also the upcoming PM8010 have fixed
> functions (reset and interrupt input functionality) so it is
> not useful to expose them for general-purpose usage. Drop the
> GPIO MFD cell and associated peripheral definitions.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607=
OA)
> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3=
607OA)
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-pm8010_i2c=
_support-v4-0-4549cab1c8e4@oss.qualcomm.com?part=3D4

