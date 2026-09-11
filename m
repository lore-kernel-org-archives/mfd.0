Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50A386576
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153188; cv=none; b=JghH07skQa6R0VK4ZoAjND01CcBaQKVLN8e0c79o5qo+SWwuR2vRbsnz2kOWpOg9F24nspQAX0TgbNYTOIM6vxl2abH0wQuNCPxEOvInA1CKlMRgBW//z0CpCu3FpccYaOGHcJTraQzYsSgwhWR2vpw+OSuywKcRDqpDUoCZYvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153188; c=relaxed/simple;
	bh=b11Hk5DWib9PKcuvtIPr7KVbleyIevgJS6QapO0HXM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eSMt4Wz8CxnwlHHfciUshFaTfGc403ifA0xNV5nDuhqqC2IUXr5qX0SipkNct5KeqV67kp3nOTU2XCI5xC8efx+TqIhYUmun9IeaCwaMHSZM6ZjbSrAQMn/oiFtlXFTrPizdrulBI1XDm9WjAr5qlT80pxIS5KQq8s6R6RpoV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWqOq4WP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWqOq4WP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6AA1F000FF;
	Fri, 11 Sep 2026 18:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789153187;
	bh=ksHUjAWSwSz/NlthkCMLlt2cCOee/rF9GfSDLSpmARg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AWqOq4WPbxxByqFfmZHY/4gOWNLAU5yP/YRqACthVg2nnmFKL2LCpFaXdUvIkDv6y
	 VuMPW/OrV0Y+qIpXn+KpVgwyeBnGKYPwnlIh9/yiqaEBs0Ok1Xv8gN1wrC0MCsqLdf
	 Vy+v4jjqVo9FajKqd5jx9xifg1FY199L/04twxzb7FDwqYWsioT8V+9RMMiBTE+QWx
	 9kCAQk1V1EOxc46Kn60w72lOYpgWzboO/ZaQUhbx1otbWOkMf8PHWEZ9JiVUUxaChg
	 OXd6DIMdSK4BXeRExa/FHPFZgxYH22GC2gfRNq9FQq2fzMaabnOQgl8YWssak33Tt9
	 itHn0mX/tNMSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/9] i2c: cgbc: Use plateform data to get bus ID and
 adapter name
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260911-cgbc-i2c-storage-devices-support-v3-3-594b53fbc5ea@bootlin.com>
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-3-594b53fbc5ea@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 18:59:46 +0000
Message-Id: <20260911185946.DC6AA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Division by zero kernel panic requires a check on bus_frequency.
--

commit bc2e06b4057fc8a794acb4315cdceedbc968e9c4
Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

i2c: cgbc: Use plateform data to get bus ID and adapter name

Obtain the bus ID (from the BC point of view) and adapter name from
platform data. This allows the specific definitions to be removed, leaving
only a generic adapter definition.

> diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
> index 25a74fa51aa00..d388e07aad84a 100644
> --- a/drivers/i2c/busses/i2c-cgbc.c
> +++ b/drivers/i2c/busses/i2c-cgbc.c

[ ... ]

> @@ -170,7 +163,7 @@ static int cgbc_i2c_set_frequency(struct i2c_adapter =
*adap,
>  	 * can be read by a command is CGBC_I2C_READ_MAX_LEN.
>  	 * Therefore, calculate the max time to properly size the timeout.
>  	 */
> -	algo_data->read_maxtime_us =3D (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_=
LEN
> +	i2c->read_maxtime_us =3D (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_LEN
>  		* USEC_PER_SEC / bus_frequency;

[Severity: High]
This is a pre-existing issue, but does this calculation need a check to
prevent a division by zero kernel panic?

If the hardware responds to the CGBC_I2C_CMD_SPEED query with a byte where
the lower 6 bits are zero, cgbc_i2c_reg_to_freq() will return 0 for
bus_frequency.

When that result is used as the divisor here, it causes a kernel panic
during device probe due to a division by zero.

Could we add a sanity check on bus_frequency before calculating
read_maxtime_us?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-i2c-s=
torage-devices-support-v3-0-594b53fbc5ea@bootlin.com?part=3D3
