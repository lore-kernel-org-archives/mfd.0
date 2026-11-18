Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022444;
	b=c8qtdBRQHg91d3Z3yaLXe4HMqioisLEVjCD7y2QXkBHyMEU8uJ5PKbExJwGy3Ccn32qo
	 sBXPpIEomeRvHtJ/Ez/IebhBgfXVyAIfix1hGY6oX/UYhz1dktcvzpZBDCcqJgpgwh4Bx
	 9XrImVSqrVk4WSkwW5AiNZ9r5gpkQRJP+Vi8z4BSZxT9e1vF4Siq1p4UQBfDnpS+tevG3
	 7K1jkD5N3it9mU1PguUKSASU1W2HneV8dUjJIXhvggKOmM3nMO0ZqbzXa1RUHxWr/VUv8
	 XafQwSxZAa4dvcUSjjjy4JcnKjN3CwuCqI8gEY3S+ncoRYDLOs/4mXYPRorOooP1ucA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SRfc3jO8hm18W0szPkGpvbbiPNrnIxXO2mcSwqeDpDU=;
	b=32P+6YAnQ2W/BXMZAVOT3x2FM24Rj7+kdy+nOgrx67gq2tu4Dnb9tfM687mkNuiYXD4k
	 gR5GY6rofiAz8namqI/vG6PHnloduPi6hnd0ImaL9/SEDNNU77COmWXEjlcPTcEb4l0EG
	 fyGvYc4wH/nYquD7siNufeOqsbNP3nV7KUkLwUIifK6QLOyTbmebcfX0v0y2SdaLE5xv4
	 NfBzHEmbutnX+JbNNjeExEoqwKOHBJosSkT9Cd2V12msUw0LzXzrIx0fema+SzbyO3rwJ
	 vCf7b/xFZVI1+sggxBjfPNkTSkZVH46QZwtEzbuDCUVzQBN/ZO9MLoi+jgntCPDZdHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YaR1eG00;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A247B606A334
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 17:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A247B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YaR1eG00
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9e53d011eso10421955ad.1
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 09:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795022443; x=1795627243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SRfc3jO8hm18W0szPkGpvbbiPNrnIxXO2mcSwqeDpDU=;
        b=YaR1eG00yoL6I8auClVx9u+h/uSeGcYEUkdGPqX3u8d7WSTMkATwcM4sWWCC6Kl3sd
         LNF2YEAXS2ngbVtInA7fN9m0+mepDP9F/Fa/5kd8cJrgXXDW8iVqxwhMdu5cbWKhRIrr
         0pgtf03pLwFND1f0i9BuosPXqaWgWcQlQ3l3Ygm3kYlDzo4ME1cKpgtqzIUpXeCVgpvi
         qX1gAgxeJCZwrqcLBmcm5EL+d3egtZW6Csi/hbE4fTi4q3pzBQN/rWCLlZPTlOn2skNQ
         uFwWut2s3UWU3y+4dMWsfmabEh5S7tmKSOokxl86upfXFuNFGf/WFQk0GYsU9CEbnit7
         QqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022443; x=1795627243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRfc3jO8hm18W0szPkGpvbbiPNrnIxXO2mcSwqeDpDU=;
        b=IaNvyIzQOhcnhViWp8Jyx9ezzQwIUkTGNNs2SDIhgw6pwYI8596qCfwDy0uPZm/CRz
         s7cz3UFUPXHWQt50uGq0ayRQcFeA4gqqrquGZ/Ewrklpe9et6KTy6sqB/iQYGziTzF7b
         61BRoVsW9xVVoIj4FpAY30mScQmz4/GZXrpu7tWDxrwVXLwkz3iHyoxd0Q5U13oPoJpP
         Tkrgnr4xDqwguk/IbZPeEWvFi8xDP8LIrYqXxjRoOUkYpilz+ifnUs5JcaXVyNGGieYR
         Eupjm6hpAx2659z9ASJWHaTjYvKW7c+BTMBA4XKav+H84MQlzKBmf9USruxtQrU0grNb
         QxBg==
X-Forwarded-Encrypted: i=1; AL+hErERKfF0wPqekmh6B3r8E8IgF1PEzF3wVVxqDRtyv9LNmw5JoolwaA1/KApS3lIWaPZxa3g=@lists.linux.dev
X-Gm-Message-State: APuU4Z8tJSFjLfSmKN1Z9r7OKmPCs1TOZQMAgg+KNPqeIIar68n0Ug32
	/wHxghVWbjbbwLjq3S97mBP2LKhRA1e1Lg4Q/lMbGFN21XAwMGLyaZYNANIvvbXKOg==
X-Gm-Gg: AZFdTZczQ8BmcsdpuihYHNzp3PcwQFf//Ep7W5zE4BKGBceGBav2l/bNoz6UqoaEQEi
	dpDc/N4RNPWPIEWloIp6dpKAr6xme2f7Sk7VHQVF17kVURUNBg/h2frkVySA3ay3oFnZewxD/Ep
	fTS2KS2mUbhtGoqOo8V8CdGqtLf1yayI8B5gOVfMcvl+oYUraLB+K/TPTKBQtX2zs9apyYgkfGL
	w/TIfuGRtp4dEKYHzkWt2OcQDsKBL8qYUHo/uXvyBMhtDFE7we5YRzfwP7CQiLmR0aZk7NiurM+
	HFp0hztK+3CQX3ANT3L6bJEZpzjdrZO+xQJReUPKXOtb/s1Va3W9mtwdPZ9N02mMJuiIx3oiH+G
	Y5exLP6rEcrRe7VqcWoYNLg+1ABgN2yRmGVbivcYOUeH1ZZKbUSJPSaZ2+KtOeE8Yal54qG26Go
	5fuTZh1iTcPNQEVfytaEnr/IGgXAl+f0VspKghP1S9yJAJHQYpv/cYye/lMfW7WweQ+NfuRUuiJ
	f60PO4MRj9i8lcsbA1a5QA4c2YC/vUQdpmmiAgy1czhxjEIfz8gkA1xQPZ19/wFvTl8xdI6qjPu
	H0wmVOuX8KN2jLK14tQ7+3xcUnsqk146wCoiBOPNtYwC7meGJ4O2D9aaKShPkK9H28NKmq+eBlR
	5XxRvJ4pB2jfFrSPV5MOPUd5PqFYsJsqAw4fN80mqVRNW6lsllfDzicxVqvoK8WUD0pF+yeeur3
	2pVmcinC89Zeri
X-Received: by 2002:a17:903:41d1:b0:2ef:f280:40ae with SMTP id d9443c01a7336-2eff73f226amr35872235ad.12.1795022442252;
        Wed, 18 Nov 2026 09:20:42 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6192086sm17258795ad.38.2026.11.18.09.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:20:40 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Wed, 18 Nov 2026 09:20:37 -0800
From: Benson Leung <bleung@chromium.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: bleung@chromium.org, lee@kernel.org, tzungbi@kernel.org,
	groeck@chromium.org, jthies@google.com,
	chrome-platform@lists.linux.dev, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: cros_ec: Drop OF node reference in
 ec_device_probe()
Message-ID: <av3eZZE6BHDuNci0@google.com>
References: <20261118062949.1250-1-laixiangwu@cmss.chinamobile.com>
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
	protocol="application/pgp-signature"; boundary="voQ+Totwkhxp6RIW"
Content-Disposition: inline
In-Reply-To: <20261118062949.1250-1-laixiangwu@cmss.chinamobile.com>


--voQ+Totwkhxp6RIW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Xiangwu,

Thanks for the follow up. Looks good.

On Wed, Nov 18, 2026 at 02:29:48PM +0800, Xiangwu Lai wrote:
> ec_device_probe() calls of_find_compatible_node() only to check
> whether a "google,cros-ec-ucsi" node exists in the device tree, but
> the reference held by the returned node is never dropped.
>=20
> Scope the lookup to the UCSI block and mark the node pointer with
> __free(device_node), so that the reference is released automatically
> when the block is left.  Keeping the lookup inside the block also
> preserves the short-circuit evaluation of the original condition:
> the device tree is only walked when the EC_FEATURE_USB_PD,
> EC_FEATURE_UCSI_PPM and ACPI checks already passed, instead of on
> every probe of every cros_ec device.
>=20
> Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defin=
ed in OF or ACPI")
> Suggested-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v2:
> - Scope the lookup to the UCSI block with __free(device_node) instead
>   of a function-scope variable with a manual of_node_put() before the
>   condition, per Benson's review: the v1 lookup ran on every probe
>   (breaking the short-circuit evaluation) and the node pointer was
>   tested after its reference had already been dropped.
>=20
> Link: https://lore.kernel.org/r/20261118013935.1573-1-laixiangwu@cmss.chi=
namobile.com
>=20
>  drivers/mfd/cros_ec_dev.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b80..b8d363b7a 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -271,14 +271,20 @@ static int ec_device_probe(struct platform_device *=
pdev)
>  	 */
>  	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
>  	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> -	    !acpi_dev_found("GOOG0021") &&
> -	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
> -		retval =3D mfd_add_hotplug_devices(ec->dev,
> -						 cros_ec_ucsi_cells,
> -						 ARRAY_SIZE(cros_ec_ucsi_cells));
> +	    !acpi_dev_found("GOOG0021")) {
> +		struct device_node *np __free(device_node) =3D
> +			of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi");
> =20
> -		if (retval)
> -			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);
> +		if (!np) {
> +			retval =3D mfd_add_hotplug_devices(ec->dev,
> +							  cros_ec_ucsi_cells,
> +							  ARRAY_SIZE(cros_ec_ucsi_cells));
> +
> +			if (retval)
> +				dev_warn(ec->dev,
> +					 "failed to add cros_ec_ucsi: %d\n",
> +					 retval);
> +		}
>  	}
> =20
>  	/*
> --=20
> 2.50.1.windows.1
>=20
>=20
>=20

--voQ+Totwkhxp6RIW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCav3eZQAKCRBzbaomhzOw
wnVSAP9WrAENDjApVabuubZU7RXGbf5xkUu2mC8dIJ42VlH6BwEAy249hyi1G7wN
76T5cX1voG3/ZitraD385Vac7ho9bQk=
=8b3R
-----END PGP SIGNATURE-----

--voQ+Totwkhxp6RIW--
