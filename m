Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DAD310651
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940074; cv=none; b=rZFlR+BH3FDdiIt6f87MiBbSJo3MLvOjJiuEQxTsUau56uGxQuwdeoc1/RwHaKU4Uu0+2o7s2ET/00A4tZF8y2mL3dJSJOa0mFOyVawvU0EYyTCXmLKSQEr4PHQCkWpVtvQQNmbAuklXfF3xYDeZ5ZHKLFNPJiB9ctqpvwzJPQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940074; c=relaxed/simple;
	bh=7tfDCb+hH8UExoEUEJuUh8gTif4lM8wEXEZbayHjiB8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g1qHVyuvOfe27RhE9AzsRPza5S6SB2yeCVV7NmmGlc8MgVvYIFljqcrC3nq1+hh4qABRkTOuii0WI9eH0WnIvbeMGgvMEGq1XuBA1er/LG7DpFtVbolB7g0oJxF9LZME23NVtjVhS9FPGboDx/P+RdftxJhNuzqCoQvFmb0uLqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVuWPkWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVuWPkWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA8A1F000FF;
	Fri,  2 Oct 2026 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940071;
	bh=3jNYr1G5XN62Q7qjGwLXOPqWyY+MSLTFE+pjuadsne0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nVuWPkWuY3AF//V7q1+eaI6u+H2uGjW9kXbVFRlOMzK37qtq/ig8a5e+MAR7vc1b/
	 gBwbvC40uaexi2Q3nOCqGMaN4qQFLtWbqWci/Lv9cU447xBEanKbj2oXQ5xi5j2g7K
	 zpCxHeMI0or8K4GnJmB88eqS7NVF+/ii45gqWvGhR1pZ8KqgjRj7wsBAzlJnloqNgt
	 C7bv/Nzu+rla4KXBW/97Rn3VoIzJvhkxjBQdxxF6F/cLhRvnR1uloSITYYw1SK33xJ
	 Ww+gcix9xu2NsfUschqmrQISuEMImat1In6C9ySBqLyLGps1SPQw9jh0zp/Yt/BLNC
	 e6nx5Rz97g9sg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/9] i2c: cgbc: Add support for fixed frequency buses
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261002-cgbc-i2c-storage-devices-support-v4-6-eb42e0f1df59@bootlin.com>
References: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
 <20261002-cgbc-i2c-storage-devices-support-v4-6-eb42e0f1df59@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:21:11 +0000
Message-Id: <20261002112111.6AA8A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Some I2C buses run at a fixed frequency. Add a fixed_freq flag to struct
> cgbc_i2c_platform_data to identify them. But the frequency is still needed
> to compute read_maxtime_us, so split cgbc_i2c_set_frequency() into two
> functions:
> - cgbc_i2c_set_frequency(): sets the bus frequency (skipped for
>   fixed-frequency buses).
> - cgbc_i2c_get_frequency(): reads the bus frequency and computes
>   read_maxtime_us.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-cgbc-i2c-s=
torage-devices-support-v4-0-eb42e0f1df59@bootlin.com?part=3D6

