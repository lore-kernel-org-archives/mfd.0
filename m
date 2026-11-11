Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428481;
	b=nnFLKJFWfl7DS01WN+KDq2BKzDX4WPmzYzWuoJ7HbzkFYDCiwb+ZoiEoCjf4yycQHBSo
	 vTEAmJaMitqjkBsRv3PhvJ64gmeMGXiYtlG90gkFbGI0dXqUcDf3fpOWceQj0KeFgJFFw
	 CmWKlnLbQ4vQTF32KEz80ypiEVvqqQoN00sf4+0BTKOIghBjpJeNuhiDeU2fLb7fNa70c
	 8oNeiQYI/gdp2aKAPFJGKUvRS+rWNYRar4Z2SeqbV+ujyQMHxjc1qarroD0OhCoirn/p2
	 LsF6lZHDhRp92EYLzNEdne4Qh1JFsB92mKe0KqtTWQC7oZx66IC7VUylZ17cEzTxHEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428481;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pHaDosbaSoeiaQ7cqrlVWJIbpJQc7mJxGADaPrIobys=;
	b=MLXKP/EitCdhKT7xTVeKoxjrNEsmpVdD/BzkBImW7eju5eYRuTUB5WnvI0EurjEcCH+7
	 EQq1FhQ4yz1K+EoXtgoo7YU3XLRChx8TseBPo9A/Gnf6BDMkY4ThTmijv4QP/Q5lMs/+V
	 udp7WqyhDki7Y4jOmPxVTF1XWAKvQf5xUdcrRdWLzCa+/9BBAXdCLufCauicKhy/oplUX
	 /PGiQCXRMmagNeA0b+n4X+EQekhz4zFWotx9NpqtLc6xljU//HCYngaXNiJiuqbBKiUWh
	 uFPVaFc9PSEh4vwCApKiHBLyIpTLUZCcEb4M61pCkcsR3x4snKoK7xWmqBoZHPYipyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYGEwbBa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E275606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYGEwbBa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F1C1F00A05;
	Wed, 11 Nov 2026 20:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428481;
	bh=pHaDosbaSoeiaQ7cqrlVWJIbpJQc7mJxGADaPrIobys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TYGEwbBaHvQopLxHm94iLqYcyPjs61AAGIyg51bf/G2hdfjXyltGRlroXw1ipK0CM
	 B1W/yhldMtNDPhb9mKzVd/H9vo8MESVhu/hM1nJab4ixvW5WqjotSLoV6aERlXLoPp
	 /mHhvtZ3ZuzSNXCI6/3egPML+A2FGc7mFjYc8Au3c2Sg6h3epquuc7xuThAKq+aqOt
	 mrL6ezJ+L2k7dAdhcj0Ac0AQcElQxsumNHJYjjd5zpsChh8nKbSHzwF+Fropk3wyUD
	 FyEqCsy7TlBwKtof2GNUq+o8FKtqknNmQ0Wt9rDU/aXfRJILFZgNX239Udk6Fy2U5l
	 rjaHbUue7tWWA==
Message-ID: <sashiko-outbox-209637@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/12] arm64: dts: hisilicon: Drop HiKey DSI endpoint
 unit-address
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-5-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-5-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:21:20 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Rename the DSI output child from endpoint@0 to endpoint because the
> node has no reg property.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D5

