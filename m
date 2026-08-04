Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D2247CC83
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871558; cv=none; b=CgtdizkQpc4dphz87Jj7/sudtFAN7rJ7Ga5jHY18Cd0vNbDgkpSB8qG8k6fZCiKzCvnwHr6mkbsgMkS4tVHEHhD7JvgQdsNd60C2JANEB4grY/2C2hmpVdUEkyDo+u3lRVuHB/0yGi8OAWWyo//63DRwCNLGbFxXsIIgr0rUr/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871558; c=relaxed/simple;
	bh=6LAkwlCyNpDulis8vHRd/Eozfw+bRdU4F00rxuG7PlM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Thhe8zeA3v/sc5NB3W0f7oYa9YVU6s+9SD+ui5R4oih+NRgoCovlAhyahrik4kvzQSCcJTl6mzg42hxSNUjQUYFa066Fmtsp3+37ughA1cvRNH4y0KjvoVeJmz7B0CHaYb1qg2sS/HyIP62luofFg08zHAQFKMKZ0Os2N11e5/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hmiw8zQs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hmiw8zQs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4791D1F000E9;
	Tue,  4 Aug 2026 19:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785871555;
	bh=6LAkwlCyNpDulis8vHRd/Eozfw+bRdU4F00rxuG7PlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hmiw8zQsmSf0SWnUFvH5ErE8wOCk5msB0bZAVj8Vt7ffI6gqMVfkb9Lv2qDS/jQqh
	 VPpE2bso4urLA7ARvsw+rEWKOROmJlw0kx6g7ZtepRCywBwGEZFc4HA/jaEVIABcB4
	 NLNtesJfht9hYf7ZxuKvb/YNNjO7PDl/EwgQHqminohm6AC+GnX2m8HMSG3r2BFwX1
	 AkX/SZmJPzffV6DyScCe0y8YCOGxUmIqyffyomF1JgpRAHcet2RCIuugV8isFJ15Oz
	 kcV95VCTEgHanbfj0gRMLYlJGDyfkjioBP537h/6SlTNZUPLXYuyAsyqi5Tmpt/2EW
	 RbV3vCBBQJreA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 5/7] ipmi: ls2k: adjust dependency to its mfd
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260805-ls2kbmc-mod-v6-5-16ccde412d86@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-5-16ccde412d86@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 19:25:54 +0000
Message-Id: <20260804192555.4791D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Miao Wang <shankerwangmiao@gmail.com>
>=20
> There is functional dependency between the IPMI driver and its mfd
> driver. Previously, the dependency was set to "select" from
> IPMI_LS2K to MFD_LS2K_BMC_CORE. However, the ipmi driver is actually
> compiled as a part of the ipmi_si module, and IPMI_LS2K is a bool
> option. Therefore, the dependency "select" will force the mfd driver
> to be compiled built-in when the ipmi driver is built as a module. This
> is not desirable. This patch fixes this by declaring a conditional
> dependency from IPMI_SI to MFD_LS2K_BMC_CORE if IPMI_LS2K is selected.
> This will allow the mfd driver to be compiled as a module if the ipmi
> driver is built as a module. The adjustment to Kconfig for the mfd
> driver will be introduced in the later patch in this series.
>=20
> Fixes: d46651d4e3c0 ("ipmi: Add Loongson-2K BMC support")
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ls2kbmc-mo=
d-v6-0-16ccde412d86@gmail.com?part=3D5

