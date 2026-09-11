Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102613630A5
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 18:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153020; cv=none; b=NkiVjFtj9eLdrI3O796J8pXSTNzkNJhh18fvaGFZpUf8TVtd/qwLO0edqiRhxjvGRFDV6kv+ybLEKsBfIL6JYZv+CBUKrsgJBtw8z4cyk9/2N6Sz9zSgvJybO/EUqaLE5VtvlKJzpIDCfNoEuNOyuE2Ya8aPhowS4hGTQdXyyzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153020; c=relaxed/simple;
	bh=7usBYkgtMs4RekHh6xk2dH3WqyRGfpMEfVGOQFduZvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U/0ttQ/AwLc9Bz6U/CUy+HEflaQMj+t1OdOf5js6Nn0Kz/4sSZ+BZ1cKwQguZQf+LGHU+vnJz1yQxohAlsI49l/sObzsqBLr62vNWQezRysJ2HfU3nUjqPXPngFsBGSfiYmrVuNBBH2uZQckSRazpN+XXmhmUY9eFycmut/lkiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Df3VhEdy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Df3VhEdy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DB71F000FF;
	Fri, 11 Sep 2026 18:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789153018;
	bh=w8hETIj7bnVjBrXNsHtn0xRmdn/5s8j5UZTJ069Dq/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Df3VhEdyLcZPDtzk6JeIUu93uEGfu/AyQTtR5KDKkBGLVudeRPTvzxY8STEnE5RmC
	 DAj8OQdXtZ8Vj3qzEALLmBXxH57ziEIEOJ95NdHXuwOlS6tQwlhbYYXrayOoITPKTo
	 M3GV6piPusTdmpQr7K24eBr8SYm81NFZZ6aJtpUpQ0t0038wR2d0z+2aRVScr1gfMl
	 35OmMKrBPW4U7vohfqSOiEswNdWEf8AQAmJKaHZlZKeOiwHDuzNjI2F3R3OdR673iu
	 Ji9XFMr5OxHc/lBLkPprGCbe2NJiURbdP1cySpo62AcrXgtGzWzbKH9J8RRdznmjll
	 xYdWmg+YkcPiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/9] mfd: cgbc: Add I2C platform data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260911-cgbc-i2c-storage-devices-support-v3-2-594b53fbc5ea@bootlin.com>
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-2-594b53fbc5ea@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 18:56:58 +0000
Message-Id: <20260911185658.B5DB71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Kernel-doc struct name mismatch in the new platform data header.
--

commit 1c3aad047a642ea8746e1e0332b0958bb18e2f09
Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

mfd: cgbc: Add I2C platform data

Define I2C platform data for each I2C bus in the cgbc MFD driver. Platform
data passes per-bus parameters to the I2C driver, rather than being defined
inside the i2c-cgbc driver itself. This makes the i2c-cgbc driver more
generic.

[ ... ]

> diff --git a/include/linux/platform_data/i2c-cgbc.h b/include/linux/platf=
orm_data/i2c-cgbc.h
> new file mode 100644
> index 0000000000000..4465e8a7b40e0
> --- /dev/null
> +++ b/include/linux/platform_data/i2c-cgbc.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * i2c-cgbc interface to platform code
> + *
> + * Copyright (C) 2026 congatec GmbH
> + * Author: Thomas Richard <thomas.richard@bootlin.com>
> + */
> +
> +#ifndef _LINUX_I2C_CGBC_H
> +#define _LINUX_I2C_CGBC_H
> +
> +/**
> + * struct cgbc_platform_data - Platform data of the CGBC I2C driver
> + * @name:		I2C adapter name
> + * @cgbc_bus_id:	I2C bus ID (from Board Controller point of view)
> + */
> +struct cgbc_i2c_platform_data {

[Severity: Low]
This isn't a bug, but there appears to be a mismatch between the struct name
in the kernel-doc comment and the actual struct definition.

The comment documents struct cgbc_platform_data, while the struct is named
struct cgbc_i2c_platform_data. Will this trigger a kernel-doc warning
during documentation builds?

> +	const char *name;
> +	int cgbc_bus_id;
> +};
> +
> +#endif /* _LINUX_I2C_CGBC_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-i2c-s=
torage-devices-support-v3-0-594b53fbc5ea@bootlin.com?part=3D2
