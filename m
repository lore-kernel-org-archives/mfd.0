Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11DD54763
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616872; cv=none; b=W3nlKO4QXqAaVd45ubrEu4BT0jHV6hnwKZYMLOtdXJu/qGa9/CA05SGLIA3osBF/odmMEEMSaM1zzBczoM036rZSQyfIM+BUAAZPJ180Yv+BwKWuUM0fFyskZ35X2XvL7rzt5SA2WMl1gGwu/VZXENfkHXALFdM7LrQaH1jyWlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616872; c=relaxed/simple;
	bh=bfs8prQvnxMm0VCex3mkIw3+J96dt18wKBVZnDLGlNc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i2g0QNV16rLC+8AqGf/TApuxco3RjLpSK+7hTL9ETmH5dKnZtdOjTU6w5bK+mdW1vwv7FoDRGEiSa6pXr4K2PONE6uD2Yr02y6CNRjnQa7R6YdPzD/Mr3EKJb8M6lZpFw6RAz3L3oaeXJfBuOjcJPPzL2wbyGMT0qdfbn48/340=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q07EudgQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q07EudgQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5154F1F000E9;
	Thu,  9 Jul 2026 17:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616871;
	bh=bfs8prQvnxMm0VCex3mkIw3+J96dt18wKBVZnDLGlNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q07EudgQ3VzHG9Txc42FEDUvMNWQJAP+EcfW7Eo4baKcFoXdk/tB63/O4uBKaqNeV
	 0OU3xiaz8qEdfXhvYUcpwud8JLFu1WklVEL2Y4+Gh5gMtdp5URGBVTxOyLiP370I4o
	 BWFmmx1yVQYvyx8vTSnduQLweb5DUoSxQLWugJ06A4xay77NIkjcsS/019JgFfJfco
	 7oBByarqG+zkO2+Ey2FxgK1ZZEmDp3TqAncQdcJhpsu5QVzgVvUDyiaL/wd61S9uRd
	 6wlQhmmxq5TLVw+sC+Cm070v35I39RxaJjUbgfr2ggfKxk0X7KSoK2ROZBm4Kchrew
	 D5RoajdvlcrXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 15/23] mfd: Use PCI_DEVICE* macros to initialize
 pci_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <c62d0763911de7b0db60600e9649a8c1047b09f6.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <c62d0763911de7b0db60600e9649a8c1047b09f6.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:07:50 +0000
Message-Id: <20260709170751.5154F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> pci_device_id entries are usually initialized using these PCI_DEVICE*
> macros. Adapt to this more usual style.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D15

