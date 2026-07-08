Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145081F5437
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510084; cv=none; b=QpS+jy2lSwOXB/il9chp6znd+A1c7ShnNDcLgupI46N3qkztg1d2gmDH4yHTesGCCTFxLyggWJKqFVHJfs4C/KOhPO9R18TxCCoTHLn2Wb698lLdJ22TLfMxFlH39nFvtvst2McfcZHAHuP+BWlxzNgTGujM2Y1RKXrd8mcFKdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510084; c=relaxed/simple;
	bh=pNeJqgY5Zf2Oifqu8VxUg1ndKVFvssOwXW2COckYtZ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R0SH4S4vB3/Mhy04XfD9zhNb3wT1cMxFZGXSN4KNUKeX490R6mC8BQbUFNbyw0FzeDu56HM/oCTVkPthxqKK93zQyYdzNPHrzMc5Mdzv3//UCmMfHfvxonrl1E849l43+WXHgWzFLFPgg74zj5y7RyvnCKAVzmF1jU5D+8d7Zgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsEEpoHY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsEEpoHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99DE1F00A3A;
	Wed,  8 Jul 2026 11:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510082;
	bh=1KQjDPpCp2HLWDBdoy8owzs99j4aU7XFKXtPnqHEaFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JsEEpoHYocG1EOXpRA8QcVRtXuL8sLDrUlpNmLVSlP2akVaOxEg65dx/lDpgbA1pv
	 Rlonijr2iOd4a9u9f1hlgA+w46KNieJPMf0k7y8jF4dpHl1M6gACVLJmx6LGv6Yu5J
	 Q1Rcn7mQRWYmMEr+8LyD7jaO/u9mXlqxQsnzVNFMblfozA5M5OyPGec35/cdhnTy9O
	 fJj3mXG5iBgUVDi4R9j2FpDe5jb+AInPQ1wtqbtG3AUh7RTS1a+wNE8uVEkIdQrf7H
	 CbX3RdBpb5TG82QXbkiITtV/umFRTQLrE9YMhPp+ByTFKlYMZTlIX8fQ0/4gqggdnR
	 rjvZqM+I/eYjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/23] mfd: Use named initializers for arrays of
 spi_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <005f42dc5bbbd8879edd7fb3cbd62d6ebe38f39f.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <005f42dc5bbbd8879edd7fb3cbd62d6ebe38f39f.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:28:02 +0000
Message-Id: <20260708112802.A99DE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The intel-m10-bmc-spi driver improperly passes pointers to structu=
res containing mfd_cells via the spi_device_id match table's driver_data fi=
eld, and the mfd_cell arrays are not declared as static const.
--

--- Patch [17]: [PATCH v2 17/23] mfd: Use named initializers for arrays of =
spi_device_id ---
commit cfa932dab5cca9437ebac2bf23f56766068cfb6b
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Use named initializers for arrays of spi_device_id

This patch modifies arrays of spi_device_id across various MFD drivers to
use named initializers. This improves readability and prepares for a planned
change to struct spi_device_id where .driver_data becomes an anonymous unio=
n.

> diff --git a/drivers/mfd/intel-m10-bmc-spi.c b/drivers/mfd/intel-m10-bmc-=
spi.c
> index cfa620f0c70e1..94b9c99bb4f86 100644
> --- a/drivers/mfd/intel-m10-bmc-spi.c
> +++ b/drivers/mfd/intel-m10-bmc-spi.c
> @@ -160,9 +160,9 @@ static const struct intel_m10bmc_platform_info m10bmc=
_spi_n5010 =3D {
>  };
> =20
>  static const struct spi_device_id m10bmc_spi_id[] =3D {
> -	{ "m10-n3000", (kernel_ulong_t)&m10bmc_spi_n3000 },
> -	{ "m10-d5005", (kernel_ulong_t)&m10bmc_spi_d5005 },
> -	{ "m10-n5010", (kernel_ulong_t)&m10bmc_spi_n5010 },
> +	{ .name =3D "m10-n3000", .driver_data =3D (kernel_ulong_t)&m10bmc_spi_n=
3000 },
> +	{ .name =3D "m10-d5005", .driver_data =3D (kernel_ulong_t)&m10bmc_spi_d=
5005 },
> +	{ .name =3D "m10-n5010", .driver_data =3D (kernel_ulong_t)&m10bmc_spi_n=
5010 },

[Severity: High]
This isn't a bug introduced by this patch, but should this driver be
refactored to avoid passing complex pointers through the match table?

The MFD architectural guidelines state that passing complex pointers, such =
as
platform data and mfd_cell arrays, through match data tables can cause memo=
ry
safety hazards and initialization ordering races during device probing.

Would it be better to store an enum or integer ID in the .driver_data field
of m10bmc_spi_id, and use a switch statement in the probe function to select
the correct static const mfd_cell array instead?

Additionally, looking at the structures referenced here, such as
m10bmc_d5005_subdevs, it appears the mfd_cell arrays are missing the
mandatory const modifier. Could those arrays be updated to static const?

>  	{ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D17
