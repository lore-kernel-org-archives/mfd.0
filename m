Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BDD371D01
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 04:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756783; cv=none; b=f1BAJxRoZ8vyHSTh6b6MOBah6xgXqJYY50h7cjQSEyhLFB1cSuw6WWWdW2naaYOKJTe9lOO43D4kFb3mPpibRbd9NhZqiYGSmjFS0ZTOlt3Oad43X0UcnMI98DorC9JpouHuYaNraSEAoT60QvBhz+6CcArpogVCwLlw4aORN5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756783; c=relaxed/simple;
	bh=SJ/ald2t4pLskzyRTbJVIi0l/PkbgljgHlY+1DomVY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MVaKhmyG/HMYwErMv16/2iYUbNPZt87iH3V0WDDSRiBaKHS92/c8JFnl8UXXgHldJjiYpzxPaj/dkK6Q5AMgeUVp/zKmJueyyxqt+MuO0l9dqt5NZFj/IEcJv8Ar9l5+ERo9c5DyHvkmrmdTmMgNo4qNO+YPFOLhSgHQ2nnPxYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VODwk9UV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VODwk9UV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F24B1F00A3A;
	Mon,  7 Sep 2026 04:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788756782;
	bh=SJ/ald2t4pLskzyRTbJVIi0l/PkbgljgHlY+1DomVY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VODwk9UVDp5fAyrkiqTpTiKni91RzpK/9HSWc/rpesElbY5IVd/pnRbnsi5AY+xkI
	 A4ZScTHbXEZxw127+nr0uSZh0nkOs/ny3PKNHUKLGvrbWqA55QpNetZVK+Zajwgl8C
	 QISgPSuBtrkUREDXtvm+XcAO243tuWjxTDZof2SsRX5k1sqpGomUszo96E1q0GXy9w
	 6wwsaYotOYgg7jpzvKNzQ51MCMznihqgUr/B0U8FxMFa9Fqe5TmryNZTF/63XbuF8H
	 6IICVWZujg5d9hr4ehjvpbtNF6eiNngxmf2M2JEMEFWcza4FUi64YjTH5DUeJGpbk/
	 DT1LXtgY0n7MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: Fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260907045044.12457-1-hemanth.selam@gmail.com>
References: <20260907045044.12457-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 04:53:01 +0000
Message-Id: <20260907045302.2F24B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Fix misspellings in comments across the MFD drivers and headers, found
> with scripts/checkpatch.pl using the list in scripts/spelling.txt.
>=20
> Since v1 this also corrects "wainting" and "comapletion" in
> include/linux/mfd/si476x-core.h, which checkpatch did not flag; Matti
> Vaittinen asked for "wainting" and "comapletion" is on the same line.
> The subject is also capitalised to match the MFD convention.
>=20
> Only touches comments, no code changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907045044.1245=
7-1-hemanth.selam@gmail.com?part=3D1

