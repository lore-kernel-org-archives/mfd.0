Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D94D0CE9
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 16:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339818; cv=none; b=dkKQKiEYANBDAhfnpfPmBXwA3ChGr4qjKz99stK7utYKFk/5kZuj/rUwuxvhj/ftijohgpo85gjX22j5IClsJ/Q23zTjlr1Tb9TmZzmp883SilcSe988Xynev5fUmZj+tZCpSrWGCdI16WJ2sts6io7MUO86/eVL7sXlDaLSKrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339818; c=relaxed/simple;
	bh=eqB9ZmoSwtDK4nKfRfSBkFuYmXUT4sejcrfXBMoJ8PQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=N2cOH/lzMjGwVbfmAFIPykzBx+bhz4sK2gt8aTt/zRrdkkjafF/UMIAeZ8XakJApI+Voo1XozOGgSLKqN9peK/wMzTxAjyw7WHKXOjxMw4o3Twmzn/2uBQilN8vc589vT6nekGa9AX0aCTsNyGHly+4lameI7GVJ1qEBGYjmL5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwhQ80ul; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwhQ80ul"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04DE1F000C4;
	Sun, 18 Oct 2026 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792339815;
	bh=eqB9ZmoSwtDK4nKfRfSBkFuYmXUT4sejcrfXBMoJ8PQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KwhQ80ulZ2K3O2wTe4hPs3hasb4uRQC/MLCCQNqIfZkxm94kuZExLQb9AN6X2Sw8m
	 ZlDg7ytXbROPDLq1fgX7MO6Z0C6msiQT4RpSOaq6Q4cIGkGGiqDyhfMN9zMkvsam4t
	 lVp2oh/zNiqeYvEZPOA4D29Tg0k5+xm6ZZ+NNtJn8pFtEt1heWaoBb/u2Kryb/MdlV
	 rpOoitYKnn3UzArY3acYfqQ0qyfTbf2GbbdNYbCtzjgqg1cMMZL1Y/3nHqr5jwurgo
	 pAEkaA/a+vcTHNLWZu8DJN7Kt6p0yApsp96tZPkuAqwxu/QfSsRCZUlrQAL1usaQT8
	 XAaiend8sfbBg==
Message-ID: <sashiko-outbox-176263@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: mfd: realtek,rtd1xxx: Add new SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261018160653.3940371-3-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:10:14 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add compatible strings for Realtek RTD1619B, RTD1319D, RTD1325, and
> RTD1625 syscon registers
>=20
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018160653.3940=
371-1-eleanor.lin@realtek.com?part=3D2

