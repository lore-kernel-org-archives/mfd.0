Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794040341;
	b=5jozfpBkur2xeMOslPod3ic2izgLwmRpnxwke+8628G73BQhT6wPTYn/LKaYuUK+fxKD
	 YNNtatr0YFwQk3zpX3YX0fdrdZdqIzpWhvUjuc+hI3vY2SAOXQbFJk/uhFDEaWAbrwkMy
	 GnMrMyhRiEzMFTy1c7o6Fmu9cWxBOtS5lcXYHQW7KX71zEk0v74sqhsY2eQmlKxxgWDt0
	 qFLnxhCIAx4xDHHVcI+hsj5TRBroVc1w/jm1yi+M2gPNgPgCYjCkfqao37nDetAshibEI
	 cUttmjPGwblBCMEaR/XfdRNpziLNfgdovfh/SNIDQMDY8Gk+52szGrz3QZQbH1XWmXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794040341;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FuFRRndCvwY2aKUjajXhxk47q0BBnEcMDqXk8jjx5UU=;
	b=VvSEZzfMfFWtgrj0WfbDkvFJiOdRk/wtyMyFJkICH+jo7Nafb2HKhnVHpjQVYXfPDUk6
	 wN8AY1KGQXz/K05ialKrTTAfmAo9A4y74KF6IHYQ7WKNmuV55lK0JFkMMqBWTSjWJWdNF
	 mmh3l48iCT5AOBzsLkX4y6YoRlrE6OAHMvllhOBrnj4oLvWzEDIS7c5qCu29UaSmbc00X
	 410UotsoZE0F32W+sKSnzLb+BIaJTw072ImIPvS5jasHvYUICHHBSstydCT3Mw9StpPu7
	 atwlcVB0OTmCalbQ2acdKcO9MAlcQ4sPOfTEQHNLAJ4RdW3wGvPTwgoXkToP2RsopxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HA8Qv+mJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648EF606A32C
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HA8Qv+mJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09DD1F0089F;
	Sat,  7 Nov 2026 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794040341;
	bh=FuFRRndCvwY2aKUjajXhxk47q0BBnEcMDqXk8jjx5UU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HA8Qv+mJQmoLf2VbgLBsXpFhc1Zr8+JIUB+XtUH8go+Vl7djj43oulrXST3dqrtUM
	 pCkihQEw1I0/0KtXZ3FRjEvMhvx/iTbUeogMSUWksgBS4E1tbSfmvE4ztFb8NZ9miJ
	 y1epyxtSinc29tnecmHdbaspnEkj6/WjKb0cHCYY8xQCXPi0YRK1pnAilA/uZCyqVY
	 CuBo2kzBb5DUdgxsHfPM0Iw5tWruA6tru7EOlJ5jmc97kqSyGKdF2pAHO1rZcnFUMQ
	 ICXv6e+mAJeXx10PsyS8GMJ79XUFyA42IuG6QnjhPSnqjOtr8YscmHOWL/9u08iMs2
	 c30wDTbmdABDg==
Message-ID: <sashiko-outbox-202743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 5/5] mfd: gateworks-gsc: Check firmware CRC reads
 for errors
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261107162125044ldKkwYPQxZOTWg6IDe_LX@zte.com.cn>
References: <202611071621143491uRwluLhxYsUHx2V3qhm_@zte.com.cn>
 <20261107162125044ldKkwYPQxZOTWg6IDe_LX@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 08:32:20 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] mfd: gateworks-gsc: regmap_read() checks in gsc_probe() never
  detect errors
--

commit 71f3f63591452e6fdc63faad9070867599874db8
Author: Shao Mingyin <shao.mingyin@zte.com.cn>

mfd: gateworks-gsc: Check firmware CRC reads for errors

This commit adds error checks for the two regmap_read() calls that read
GSC_FW_CRC and GSC_FW_CRC + 1 in gsc_probe().

> diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
> index a3301502ce6a5..1d697e82ea29b 100644
> --- a/drivers/mfd/gateworks-gsc.c
> +++ b/drivers/mfd/gateworks-gsc.c
> @@ -219,9 +219,11 @@ static int gsc_probe(struct i2c_client *client)
>  		return -EIO;
>  	gsc->fwver =3D reg;
> =20
> -	regmap_read(gsc->regmap, GSC_FW_CRC, &reg);
> +	if (regmap_read(gsc->regmap, GSC_FW_CRC, &reg))
> +		return -EIO;
>  	gsc->fwcrc =3D reg;
> -	regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg);
> +	if (regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg))
> +		return -EIO;
>  	gsc->fwcrc |=3D reg << 8;

[Severity: Medium]
Can these regmap_read() checks ever trigger when an I2C read fails?

gsc->regmap uses gsc_regmap_bus, whose .reg_read callback is gsc_read():

drivers/mfd/gateworks-gsc.c:gsc_read() {
	for (retry =3D 0; retry < I2C_RETRIES; retry++) {
		ret =3D i2c_smbus_read_byte_data(client, reg);
		...
		if (ret !=3D -EAGAIN && ret !=3D -EIO)
			break;
	}
	*val =3D ret & 0xff;

	return 0;
}

When i2c_smbus_read_byte_data() fails with a negative error code,
gsc_read() writes ret & 0xff into *val (rather than leaving reg unchanged
as described in the commit message) and unconditionally returns 0.  As a
result, regmap_read() still returns 0 on I2C errors, probe continues
instead of failing with -EIO, and gsc->fwcrc is populated with the low
bits of the negative errno unless gsc_read() propagates errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202611071621143491u=
RwluLhxYsUHx2V3qhm_@zte.com.cn?part=3D5
