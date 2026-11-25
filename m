Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605750;
	b=c9Gc7FZ9LkMFEjsCstJ1KLy71kUuInIVY43U7P5K3vMsiKL7l42LoyEreTyfPmVx94/M
	 IhektzLHEpSbla9vJDlK6ocVjjLDgn7bEXux2AN4JUF8e28S6rrubEHgpls0l/5kQJYGi
	 rB8KKmUOy/As0JYctgdN9zMI2uFetY7deIxW+tupRPZ9fYpS9zsRUDjYodVOROlIVQYI2
	 tI4n24bRIVTPGE9XddHSvp2fGRVsmMDyucnG0gR7fWAE7tzwTEfVeTNRQVITtbArVXbWL
	 mO4qvAlAVOyu5OxKu7ZOtSqs6BhJIbHxusgnA+Of5PB/rmLZ98C61/JZhpOAkrCrdnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605750;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7XVOPnCbawuVm2lE6tVS4x24NAqQQYYVAYKg1DG+1IE=;
	b=Q3JMFCSFLqAdibUKUfCkBqtSHi+J316SQ2JRfQ5+WBINEm6UTdn8IHw7ri4qp06knZbp
	 3ekamTSILhFcJzCEhtT/wNt1XNeMSkB0g6ceA4AFgp281mbbxm9AJb9yHn3vLIOANm8ox
	 MWyG98Jh/opoTsaKqYk9nyHdKn5pXHcjG5iIg0q8YTk2zNFj1GRFmZnSsrPM8Rkc+O9JS
	 NFsl17zJKT0chfZv1M8s4qlZ9B95RVPg/Jm3+awtDH3zaG5KpY4htDaFlUiyLiP9ophli
	 8D7pNtR419K0QLzUn/zgmPc0PNNtdGCau1fvFKASoVXfYP947H2VW0mfbAiQnHydkIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blwmeKJq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09963606A6A6
	for <mfd@lists.linux.dev>; Wed, 25 Nov 2026 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blwmeKJq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7FF1F00ADF;
	Wed, 25 Nov 2026 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605749;
	bh=7XVOPnCbawuVm2lE6tVS4x24NAqQQYYVAYKg1DG+1IE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=blwmeKJqtCnNQtcCcKGAP+Fqhyn/4/lPdjwLaiNIHBmqgjd09Zd2voMbtyGCPbY/z
	 YvUlQDLaqRzCsxdzt/M9+QNyAX95d/na7zcunp/en3cQ6v+7jA1dtxKSui572iMAXQ
	 k+VrewsrvIXIiK/tm5ZyRSOZM3CnEzcSUOAO5KSPf5R54SorVM0uHeZD+oW9qucLuU
	 gDrZLqaZ2hB6zNIdmZBk1RA58pOQXaBFjfWLmAadFSAbc0GItZsP+wpB3LDucf9DYL
	 pCHNoYZG5dcIJZ+g1AXlhOgZfCWh7+7AUgE0herVW98ewwiqxC+uxAM4WYlhyNqezG
	 54fMNdPbDDHMA==
Message-ID: <sashiko-outbox-233225@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: cs42l43: Add new register and bits needed for dual
 jack support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261125111850.1380699-1-ckeepax@opensource.cirrus.com>
References: <20261125111850.1380699-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:22:29 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> To support desktop systems sometimes the jack detection is split across
> two separate jacks. To support this internally in the device some new
> control bits are required. Add support for those bits to the MFD driver.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125111850.1380=
699-1-ckeepax@opensource.cirrus.com?part=3D1
