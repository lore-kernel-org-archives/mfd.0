Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0F34AA3FA
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189292; cv=none; b=Uppyf2I8226xzOr5//GzZMsap8lihkv2i6gKTwH6F/L6CMoC76xbHtTD7lM8duTJq4CeSsahbtA1fkiSYmtxh0ZmPhN79TMX03kpoWzvjcWnL4+Ak3yUgEW+z0qyFX7njBQlN7qOVVNOmZ9CsZijveHI3s4atlOlEqYtlbvviJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189292; c=relaxed/simple;
	bh=VEkkjpZzHLU/ilGmUzRlEmBOi4ChvvBVpdQ08e04AnY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DA+l6sJ6GMqgsiPb5jIXYJU97znQ5Vzh6KDTXiFHkfMaFDDXxJVleF8Hb/wjBph1MfN8uQK9nJ3Jw5DAUp8KIqbeG+3BxQnjNfXJ+iYgofKGER+WP86KClAuIo4WhWvo7fLUoAqKYwu8SbqyK/Oibor6fdg3aGQbZClg1/mPTJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqXSPSSd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqXSPSSd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E4B1F000E9;
	Mon, 31 Aug 2026 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788189291;
	bh=P6a3zEdIzmiWGiY/kirVkORYconUyWtAoIb+5LWiDG4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CqXSPSSdInNR6mrq0ZLLJ3Ub6Ophy8wMEeaZt7cgBm/3U7BbWVTJn5tNMueWMjUwB
	 BLgarAWtYv2Ojv4i8jJ+m6rzcP5rmoENfwo4ObJEP2iuK2Yg25ua+/af6hwogbCbBs
	 EjEvkbVVoZ4qfUQw6+moqIHePNB7VbZWYU4DU/wA1m5JmcWYfJJWt5WlRYEv5oOB7C
	 s5MnpY1BbpxYQ0Fn8tdVst/PRDa/Vs+TtfdiRlfqGJVXdB8WWIXNKmjnS2VPxegf0+
	 2iPpodNXGwMbR46p/D1uzjl0INVn6dQpofkHDm81ZIJwjLonqU8LGhjdOhK7CpV8yg
	 YMmi6wPcigckQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.15] mfd: rsmu: Add 8a34002 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260831133314.4125787-260-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-260-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 15:14:50 +0000
Message-Id: <20260831151451.68E4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] New element in i2c_device_id array does not use named initializers.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but stack-allocated =
buffers are passed to spi_sync(), violating SPI DMA constraints.
--

commit ec3d6d4936bc82d1b3b26e38040e2e51c546784d
Author: Matthew Bystrin <dev.mbstr@gmail.com>

mfd: rsmu: Add 8a34002 support

This patch adds the compatible string and device IDs to support the 8a34002
device in the rsmu driver.

Link: https://patch.msgid.link/20260429072047.1111427-3-dev.mbstr@gmail.com

> diff --git a/drivers/mfd/rsmu_i2c.c b/drivers/mfd/rsmu_i2c.c
> index cba64f107a2fd..ff7462f8de3a7 100644
> --- a/drivers/mfd/rsmu_i2c.c
> +++ b/drivers/mfd/rsmu_i2c.c
> @@ -334,6 +334,7 @@ static void rsmu_i2c_remove(struct i2c_client *client)
>  static const struct i2c_device_id rsmu_i2c_id[] =3D {
>  	{ "8a34000",  RSMU_CM },
>  	{ "8a34001",  RSMU_CM },
> +	{ "8a34002",  RSMU_CM },

[Severity: Low]
Does this new element in the i2c_device_id array need to use designated
initializers?

The I2C subsystem coding style guidelines explicitly require initialized ar=
rays
of type struct i2c_device_id to use named initializers.

[ ... ]

> diff --git a/drivers/mfd/rsmu_spi.c b/drivers/mfd/rsmu_spi.c
> index 39d9be1e141fb..34f853907e51f 100644
> --- a/drivers/mfd/rsmu_spi.c
> +++ b/drivers/mfd/rsmu_spi.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does the driver pass
stack-allocated buffers to spi_sync() during routine regmap access?

Looking at rsmu_read_device() and rsmu_write_device() in this file:

drivers/mfd/rsmu_spi.c:rsmu_read_device() {
    ...
    ret =3D spi_sync(client, &msg);
    ...
}

drivers/mfd/rsmu_spi.c:rsmu_write_device() {
    ...
    return spi_sync(client, &msg);
}

The msg structure points to cmd and rsp buffers which are allocated locally
on the stack.=20

SPI transfer functions might map buffers for direct DMA. Passing
stack-allocated memory violates DMA API rules. When a SPI controller attemp=
ts
DMA mapping on stack addresses, it can cause memory corruption due to
cache-line sharing, or trigger kernel panics on systems where
CONFIG_DMA_API_DEBUG is enabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-260-sashal@kernel.org?part=3D1
