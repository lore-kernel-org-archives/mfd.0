Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E364D9577
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068657; cv=none; b=L4PD6tmHtX70OGzYqJ6DSHTWpqmJydJ1SKGkI+wQdsxj32KaLjRsTPCItRwGWZBYtfSKqdYICmL5yMpJ9+5575xFP8W/hJM3PTkVaTqvT7PGjZIj9HR6tjF5YV/q2kB08vMWTPntHugAnneMY5nOOotW0kdSCMVq2Q5V7rjZRO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068657; c=relaxed/simple;
	bh=tOvPwYS1wytLFIpDRqveBcKWtOdLR54pK0SYxy88/FM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kSDELkyyIwg6hACdFsZm8Ea+B/t5MrSKeoJnEgub2mz75n5C0+vkijbQ6TFWbYts0BmIvD9n86UZvvQLxwjBUq0XbjJwG33YbGYT5CDqZzsPmYP6oEZGUS3FNwS/51/3IJWRH9+1KFWSrLSg4QOY95IVY2/gvTR1VXBTeEQx//M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHJa8SvD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHJa8SvD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA731F000C4;
	Thu, 15 Oct 2026 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068655;
	bh=mtVQclDEP7xY4d0Xydr/x3p1jumKugPROuhksh0w5Ec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NHJa8SvDwsLI8bwRLpvb4u90NwSn3422UYCzlIqOGeZnPk/NV6d5y+9o0eQdSb9MW
	 XbnjzhscuSRbLpjLwEW1vayNuCO9MGOSERQSzprqrze97yLGCLmWRD04JqNRTKh213
	 2rY/PxykXv5BIaRc/IiUJsW+JhO607TJKvKacwkdmCLJWf/GTNGu5yWJYEvzSWKg4t
	 PQJ/frchUPKFarJSWmoyFXIHYvxcc4ErUVDHupdiCc9cOJ8HPebb7K0gcBs5/R2Dp1
	 Xt2v94jIDcRt0B80EVfrXVyGG+ClI3H3kNYY/wikMEOc6ZVPfOEBLZT2RzftNUWq57
	 3BfS3ggGMT5Fw==
Message-ID: <sashiko-outbox-172870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] spi: sprd-adi: enforce the exact transfer length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Weibin Liu" <liuwb@xiaopeng.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261015-spi-sprd-adi-exactlen-v2-2-13203b6aef7e@xiaopeng.com>
References: <20261014-spi-sprd-adi-minlen-v1-1-77fee7e64259@xiaopeng.com>
 <5e662ac5-efea-46dc-bd09-88a5a4841851@sirena.org.uk>
 <20261015-spi-sprd-adi-exactlen-v2-0-13203b6aef7e@xiaopeng.com>
 <20261015-spi-sprd-adi-exactlen-v2-2-13203b6aef7e@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:50:54 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] spi: sprd-adi: uninitialized stack var written to rx_buf on error
- [Low] spi: sprd-adi: unratelimited dev_err enables log spam
--

commit 5b17080bc75be2e35432ef8094a3cf212f461e3a
Author: Weibin Liu <liuwb@xiaopeng.com>

spi: sprd-adi: enforce the exact transfer length

Reject reads whose length is not exactly sizeof(u32) and writes whose
length is not exactly 2 * sizeof(u32) with -EINVAL before touching the
buffers. This prevents out-of-bounds accesses and silent truncations
since sprd_adi_transfer_one() previously ignored the transfer length.

> diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
> index a6baaf02b3c86..ecec1da3ca7a7 100644
> --- a/drivers/spi/spi-sprd-adi.c
> +++ b/drivers/spi/spi-sprd-adi.c
> @@ -339,10 +339,20 @@ static int sprd_adi_transfer_one(struct spi_control=
ler *ctlr,
>  	int ret;
> =20
>  	if (t->rx_buf) {
> +		/* ADI reads consume exactly one u32: reg in, value out. */
> +		if (t->len !=3D sizeof(u32)) {
> +			dev_err(sadi->dev, "invalid read length %u\n", t->len);
> +			return -EINVAL;
> +		}

[Severity: Low]
Could untrusted userspace applications with access to spidev submit a high
volume of invalid transfers, flooding the kernel log and causing a localized
denial of service? Using dev_dbg() or dev_err_ratelimited() might be a safer
approach.

>  		reg =3D *(u32 *)t->rx_buf;
>  		ret =3D sprd_adi_read(sadi, reg, &val);
>  		*(u32 *)t->rx_buf =3D val;

[Severity: Medium]
If sprd_adi_read() fails (e.g., due to a timeout or hardware lock failure),=
 it
can return an error without initializing val.

Doesn't this unconditionally write an uninitialized kernel stack variable i=
nto
the caller's receive buffer? This might leak uninitialized kernel memory to
callers or trigger KMSAN violations if the error code isn't properly checke=
d.

>  	} else if (t->tx_buf) {
> +		/* ADI writes consume exactly two u32: reg and value. */
> +		if (t->len !=3D 2 * sizeof(u32)) {
> +			dev_err(sadi->dev, "invalid write length %u\n", t->len);
> +			return -EINVAL;
> +		}

[Severity: Low]
Similar to the read path above, could this lead to log spam if a user progr=
am
repeatedly submits invalid write lengths via spidev?

>  		u32 *p =3D (u32 *)t->tx_buf;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-spi-sprd-a=
di-exactlen-v2-0-13203b6aef7e@xiaopeng.com?part=3D2
