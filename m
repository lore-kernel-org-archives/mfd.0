Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326104746CC
	for <mfd@lists.linux.dev>; Thu,  1 Oct 2026 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861710; cv=none; b=sxUZJwcU1LmXBbh+bp8VD/PIdg+8CrIrDTJ96ANOIbyG93owJMUGUeQbPKudS24ZQqBxXZFXkMQ5eIzkuFiTUAHObLcfNjQYt8G/LdCN8mVmyJSaV779P1fckNgVl+Nag0vyISWGartQMT2h9+QUgaQtgf/z6jIHcb7itP+4H4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861710; c=relaxed/simple;
	bh=fyztntR+XSLuzUqTFbcrrjyFcnKRJknMfVK6OMFSQ4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NeDiDX8Qu34xSgJovzMl2O9wmgfAetho3dU7JBsHgXhTjIrSS1B2vBETKPqm6Y2XM2kGNQSC8U6UFfhxT8I4eh0qSEvBvxRJEsILLW8uukDKP7DVW7SeSWJ/vBUw4ZniHk2eCjT3GJsPV/2YIuGv1rfjIhVB1Vz16G9RKWZsiJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtgP3ix8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtgP3ix8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8193B1F000FF;
	Thu,  1 Oct 2026 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790861708;
	bh=fyztntR+XSLuzUqTFbcrrjyFcnKRJknMfVK6OMFSQ4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BtgP3ix8UCuTygqMH8QfKBLkaSeDFbUVtZoJJG6SVZew9MYCdxSi2wtgjNxGQI1Jn
	 NlLHkLjKWx6thxeKr9tpaaNVFcIXN+OtJyeBl2lNFBsxEH5ctEJXhLRs/gOz4sI5SA
	 ZzVRMtspbVz1SiAsUgzAEIIC2SBQs+GJtLN8hd5rH88RiWCW5OIyOVy68G5nrX5y79
	 lUjeVXmEOQxgYTRPhCcz+xVvoWJaEOtBLTs+qEcQWqsH1iZARvubQig+YMinUjE3zy
	 n3V6vKiRlEgp8xLTE/AUb5UaAhBmufA1QtPL9lZ3JG7oRD08DQ63vQboSAb17Ponju
	 q9SB52E0FwxsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: bq257xx: Mark self-modifying BQ25792 registers
 volatile
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261001-bq25792-volatile-v1-1-cb3d4ec8a414@flipper.net>
References: <20261001-bq25792-volatile-v1-1-cb3d4ec8a414@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:35:08 +0000
Message-Id: <20261001133508.8193B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Some BQ25792 configuration registers change without being written: input
> source detection sets VINDPM and IINDPM at plug-in, plug-in also clears
> EN_HIZ, the FORCE_* bits clear once their operation starts or completes,
> EN_ACDRV1/2 follow input path changes, and ADC_EN clears after a one-shot
> conversion. Reading them from the cache returns stale values.
>=20
> Mark these registers volatile, keeping the cache for the rest.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 9adbe53e32cd ("mfd: bq257xx: Add BQ25792 support")
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-bq25792-vo=
latile-v1-1-cb3d4ec8a414@flipper.net?part=3D1

