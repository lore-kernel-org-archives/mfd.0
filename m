Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351930;
	b=Y4Q0zADxTo2SEF6+Z7R+rN8UKZfisT2L8n/vqXrc/6laTKuEsLnyhtRlp/XOq78ZFtnN
	 Fzk8eZ52ZuKSyF7uoP0+qIv89HwBnUV+gY3YHlw8nhFe+xA8cI1h7vYNSyWCr5hBpbt5A
	 FJDCspHqtRJYWEUZEouyFslMd0McS9kSrueFEqfvO4laRNHkytDvmIQf8yDPQ98QNa6tC
	 bZTb9XZ2+PuboXhzoIABZ+t4vJ3+Gy/tLYGh/Uxp31c/RSuR/SLb73NtL2fCGQnRlWSfh
	 fvoFWnb09P6Q/TpaQF/++qTta34TkkQlg4ZJPHWoHZv3aQdqzVAGTuJIa6DcMkxLv2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
	b=5aoK8+oc/aypYrQOt2KStCrXARSO59WNdkA2KoQQB/g+6eKJobHeyMq+eg6yI9HP7Plu
	 UEB52FDO++4IvgnzGjMQcQbJoQgjBa4p8DYqn8SAOmcMbF9x5zyrv99vhqqH9IXq9W81b
	 GYImdjQ3mH34t7QpEQCiWBKXKX8LGVvHc+HAXfKm4jqO2Cq/inC+dg28yFVubiQBDkMo+
	 z4oipA2mD/icuFWRAB+fo+Fs/kWNCZxajNXREIE4UkoIhSkSWIv8Go2eNjPjuoT9qK1B1
	 LSDIfwnfBIrCsrxNLiNfVYm31cKqb1fr8nk2dyUGH5sD9/UVHNx0Ah5IWXNvtPU7vbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FBYVXY+V;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744D606A321
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 23:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E744D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FBYVXY+V
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1647342a91.0
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 15:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794351929; x=1794956729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
        b=FBYVXY+V1hkoDwpB4vZ/M4sCC9WhUp0etGbiGVwBSzPhaBUjZcDKczap4zwADsjvAp
         mCe1wWr/9MvNhWW/VsLFjI/YQONNv3BbthYHX2wTN2hZ1NKW2FBKqDEH6PWKSzEfMb+A
         rXTojpByyMUW7pALzmBUabHenWHc/TOcEkvVr2zd+t7bUN3C/MQNQaHdcvYYQGijCWUD
         LNiD2zNfiNxflwf706ztvhJteUy9+vPyzWFVOokujzKd9629ZQ270at5dMqgXiaN76+6
         VearkkPz3okjaErfIE3jJq8fh1RZceAjs/OYXXMjqd8UV//+nonZVwIo8k5nonFdHFVa
         NVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351929; x=1794956729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
        b=LZlCUTM/Y/CLeRhO2AOdqxGDztoKhvH02HJ9ylt+i53FED/QNN3aYjxJqdkNOeilCl
         aT1BKWotVqeBCPTgu2R7CbDazc/TsvPes5TGhAnCqCf3zmtJVS9PsKR6e49g+eqaDLCL
         o3zSOfa5zCtkDm9+xy85eZF10hytUmvI+YwAsgUiRdZGiUWZkhSK1lboFb2lrP8ARM7e
         yTPSfFpjM5VnUeht2nH1mg6zQ/jDJ+lRkd4TX38cpMGktzx70GHMgm5zcw4peIboV1QO
         vz0YrA7ff4EOuh1oTX0Z9doExXSoF1bNo1QzccqDAPfWEEKL5O19mdbb5ikbON8vZ1FT
         AyKw==
X-Forwarded-Encrypted: i=1; AL+hErGMD/g7gZfDWswxT5rN//b5I+h334efkWwSHEhxmcS2D4W1qkTtqgytalPJXNHh+E20LbA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/jle1QDwS2J/Belpqse09xv9A1xME4xZsHzlVh7J+zgHzE6SF2
	wPqmVXAtKsA8BS54r/wcWiVd1NX6hnGKJfh9hIKYwU3COnjs67gCzth0HnROtElhww==
X-Gm-Gg: AYBFou3j5rV+e3YX9Ofl9x4G7IYQi7d4JkCuZdCcjHHkLEUZ9bDpw6MOl1PadOPVrg5
	WyvSQwCcAVSznTUClifrX1E2+3VZshyojf6ABCxL/dMIIN17ahjBp5YpL+JviKTOoJX5Hle+KFx
	ldbCD1LmEzflxKZOEWP+4EgLzWq++wBQDPgwfy4FG/sJ4ofhsdmXHDEhtc24sedx3pNtkoDJ70i
	euN6JVYTPbohFiX3HsiehmmzNMNb+0R4N9CD4xu5T8ow8p0xc7YBUmGt1aQU+ngTO3oqlsYn/GJ
	97F4WVqHU8MUtLXqh9VeLsWYF2UEJTm+P0FVZ4M6tL5tnnxbW9S0rk5hvVXUMMB3tNfjIiAUikU
	boWkNlNGY36WAQBiDZqgQOX8mGnd5KfkRxh9G5hA7A4o/xI/MKkxKibEMjbPJI6fa1O59zYxvgM
	EVhwgROjOAMU+N4S/DTQEFIOAgHDyg1YGboTjObX/nrZ5FZP7lb98pQxo8htGr2nW9ttE2pi0o4
	eFZYzxsAbjFYYfl7vh/OwSMAYBIkKEcfgy3C3b/lFqy0c2e8oWizg9+XRrwFgcFE7m00m/1wRGY
	yYjo2JguXOdWCMYBvN512JDAolvrsqzoeY9npSvEezxavwpFMYId4EBwoOJ3fKAwoIAqDUqXg/u
	OTFP2UAI/uF0XGmh4ES1WfC4CrXPcp/Pq024Qp81ebIe8110/doB/pfbih9ZSIeUk9yw3mCdgxD
	chYCNMwmxYi/rU
X-Received: by 2002:a17:90a:d00b:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b182e0c1a7mr350381a91.1.1794351928487;
        Tue, 10 Nov 2026 15:05:28 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm1476956a91.11.2026.11.10.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:05:25 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Tue, 10 Nov 2026 23:05:22 +0000
From: Benson Leung <bleung@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 09/20] mfd: Drop unused assignment of
 platform_device_id driver data
Message-ID: <avOjMhYL-jo5qWnx@google.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="QGZX1VfFPgOu+2d7"
Content-Disposition: inline
In-Reply-To: <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>


--QGZX1VfFPgOu+2d7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:54:34PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The drivers explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop these
> unused assignments
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/mfd/cros_ec_dev.c | 2 +-
>  drivers/mfd/mt6397-core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b804f7..96aac158fd8b 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME, 0 },
> +	{ DRV_NAME },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 5d5f816492aa..e74936ac206f 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -435,7 +435,7 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397", 0 },
> +	{ "mt6397" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, mt6397_id);
> --=20
> 2.56.0.rc1
>=20

--QGZX1VfFPgOu+2d7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavOjMQAKCRBzbaomhzOw
wggAAP4v7fnaGuBxjdQU0SnWBJUfK3YeW/iId1LRt/eBXC0OmQEAioUu55g6cEtn
WOAUBxWTSFHNLgkeLCTw0+Pu3PdU8As=
=e1Q6
-----END PGP SIGNATURE-----

--QGZX1VfFPgOu+2d7--
