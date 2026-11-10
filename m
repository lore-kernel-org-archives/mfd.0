Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352081;
	b=MQaGk5pcvSlm3O7iLZSCYDTBgTEhtGiovQPGS5Nf8eLHoApZwK1pyXf1DR8mRPfkYqDS
	 Qw+RSILJX2tsp6Le8XRps0Alx/mWhnSy78GYglSCRmAlnHEDmYW0TCsay9NKnuqz2YLAl
	 XOdQDSR2++rGLcJJiS696SVY1H7lBUr1Gk/KrwxNYqHP2A5GBARyGzZVAvfWVLG84Wps4
	 PgVxnAyZehmhAyMSNpkLAHxNKz9FKOWidNJ1LfwEZN5PorHfY2zzawYN9RWRgIdgvWEOA
	 c9zr4hColag7W24mbNaj00+bPSYwAbHgBvyHiWHm5QD6tvs59gmOapjJ7yvFe6KiKYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
	b=pl37aWUO9FQiwWdZen9qZzecDDs8MFreTlslDVW2bb9zqohiYBYuDKzLNzRrVVxXjWQ5
	 F3r8K5jFQfK6OBSCn0zyVdFFqKJAdt/JL0KxY+4upwpZGVGt1UXoJCrtQl0Xre42dnfGP
	 c4AIS4YNM01SsHaMrAYHvE12BFvejcGPGGFCt8O73GyvRg8N9OqVNEN8M/eahI3N+WHH9
	 Pp10KjvbI7cJa9D+swJKPN/uuuBY1yfE9QhfyZhl4DbMQRckqWPSEJi1TbMgL/i/s+X/k
	 U96wRYLXepatnTYXm3eE7bLD0oE9gQKB2jd+i/0lu98rfWnbtzIhbzjbqjG4p4n0fpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X0Sn6MsA;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7608606A320
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 23:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7608606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X0Sn6MsA
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a9f9473029so2096185b3a.2
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 15:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794352080; x=1794956880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
        b=X0Sn6MsAWwmjqszIDAmCtwGVRUECCSC9e0EETJtZVVEPGXSxjD8ZPnKD9v2WT5hNLh
         n+pUdA/2lqS2tyu5Ui/DkwSTLEAdOkh7foxUji8IEDlybh4eJNo0bgK1nCTkTyDraTYw
         SxoLrrcry0M/AVOy7dVP0GJlyTum/czP9p/UblAwpQ4vPlomh18L3QArMsvckCbMviN0
         /W1+lPBBTSHJsGfzHyPFKDkZzKJkWLb9B3SsBssAW06cnpCaw/b/E9GRLfsqFi+lpc1U
         qJlIFVcPZMnobwW3Xzh0UCFibVqlFlwC1gEuc+2vFgdbxLQo579pnx/SGRwz8JtqwsO/
         zWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352080; x=1794956880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
        b=MSbHW57H494dz8jjXbO4YRIXpD4baa4gojIEnpvfmgFEgNy63L+L3sxM8gDemyOpy+
         wkiLbT/EzawruNoZDk4H4QMXv4b3GUWEpAVw0+V2of0IF3TRoA3zRlhuzmbk3Fjj1UxB
         yUgaHJjzckVmildVbt9XX/zrrTRlLqb3yuMeyWS+/No1+SZgQYm+knrqErJCIdEefvE/
         rvv/bnxCeoXo30EgXRXxWH0YSNyjHG9NbnNahhykJ5a3/vduK75tkIpTtCJCotrXPrIY
         P2Jt9H0UzA2vTyjPJZLXm7gCfC3whxsbUe01+jiaJr37EPwSQJNUz2vWp9lBNdGpJfND
         5WpQ==
X-Forwarded-Encrypted: i=1; AL+hErHJfjQwFIqqt6VNNYR4M8DAl5OrgRtLE1MmjFS+YhXkaeW54kJDPs2M9y6mCA9SGTq3+U0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8BiPX+sb7ckLen83g3DSTKOLPqhno0Lq5DULT/8gLOVX+DXm0z
	dhQcBJMH6SMkcF2QK3d+aBl7CqP6ZT73MUrydvV0I+6yX+Dk2etFRG7lMv2C7rd3tw==
X-Gm-Gg: AYBFou36mY4dA1RsVQXwLNyB16kvzCM1fH+AjKlQ8HVZw32+BAexWNFkpoe0bjnzVB2
	jMYrH6Xn7z2Jx4kLtDXiAXKFTDliuFfnGJ5lOzhQCpfEkpNYZQaTc8NLmSNLsxwrRK5GgoHB7dJ
	AuGM2MNxgRJn0O54ybo9588a4h5qYTdw4GCUx5MjZR/6HKKJJi0T8LcGptiwuXgqJgmqSOudXSK
	lcussCUBaLAwWoZ70TrrcJtq5ashbh9xbpn5EEKWHufp84D2cGWoBJQkgQJy+ND834dCRZJ0cH+
	Vh/j0Y1SVjT1ptEJfMph5rQ8KKVO9n5ASjjfAiB2n1QphWFvV/oI4Hb9AQCBToZC8G1TKEDAgrW
	gamFMSEHD9Ynhto0enPm81JaiuRRiA/5JGeV4aXzLHLFSsphHrFY1gq814iKKUKakedQi2uSJwG
	mdvTpeppw0H9AuhNP2ZbSgmVfGP99O9+wqQKUIko4Jw/RvpzukWPYZfx6VmFlXh7IeoiKcF+Bx4
	f4H6RB32GOHzOG4x0JdYm3+VBdseHKmzM6mYgUXNhHDfCP15m4BxxbzRui1Ju6hHYBAEXWYSXDE
	eO5rGquH6Qwt9QUNixNXlfIeAuQr5/bfALO8q/dwhvv2T2S3ZsGvEgEQtNrNYQQh544DucDjUY4
	N6u8BLUQmpBXbRSGsHxUw7tfR51tC/od6ScPLmh/zMFkKQ7eHJ1einf/vguFYZpgKGlDmfFSfOE
	no390Q0wdzucw9tA==
X-Received: by 2002:a05:6a00:2290:b0:891:3e34:e06f with SMTP id d2e1a72fcca58-8bc1c2a9279mr528151b3a.44.1794352079387;
        Tue, 10 Nov 2026 15:07:59 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa506bca4sm1426781b3a.0.2026.11.10.15.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:07:58 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Tue, 10 Nov 2026 23:07:55 +0000
From: Benson Leung <bleung@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 15/20] mfd: Use named initializers for
 platform_device_id array
Message-ID: <avOjy_fN7YtF3qfm@google.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="19MCwox2Lta4/77f"
Content-Disposition: inline
In-Reply-To: <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>


--19MCwox2Lta4/77f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:54:40PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> platform_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Also drop a tailing comma after a list terminator to match the common
> style for these device-id arrays.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/mfd/ab8500-core.c | 8 ++++----
>  drivers/mfd/cros_ec_dev.c | 2 +-
>  drivers/mfd/mt6397-core.c | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> index d5602b2f4a0e..8638fc8472f7 100644
> --- a/drivers/mfd/ab8500-core.c
> +++ b/drivers/mfd/ab8500-core.c
> @@ -1252,10 +1252,10 @@ static int ab8500_probe(struct platform_device *p=
dev)
>  }
> =20
>  static const struct platform_device_id ab8500_id[] =3D {
> -	{ "ab8500-core", AB8500_VERSION_AB8500 },
> -	{ "ab8505-core", AB8500_VERSION_AB8505 },
> -	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
> -	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
> +	{ .name =3D "ab8500-core", .driver_data =3D AB8500_VERSION_AB8500 },
> +	{ .name =3D "ab8505-core", .driver_data =3D AB8500_VERSION_AB8505 },
> +	{ .name =3D "ab9540-i2c", .driver_data =3D AB8500_VERSION_AB9540 },
> +	{ .name =3D "ab8540-i2c", .driver_data =3D AB8500_VERSION_AB8540 },
>  	{ }
>  };
> =20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 96aac158fd8b..3c7e7f1efd0f 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME },
> +	{ .name =3D DRV_NAME },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index e74936ac206f..385121867da5 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -435,8 +435,8 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397" },
> -	{ },
> +	{ .name =3D "mt6397" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, mt6397_id);
> =20
> --=20
> 2.56.0.rc1
>=20

--19MCwox2Lta4/77f
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavOjygAKCRBzbaomhzOw
wvFsAQC87smEjajHkfFGbCeGY6Cj/9mvC0xw3nuIrtpr77YwHgEA6ablXqCzLa70
BlcM4GE7l2ZF2r9VzxPGW7WUD7O+TgI=
=nN+Y
-----END PGP SIGNATURE-----

--19MCwox2Lta4/77f--
