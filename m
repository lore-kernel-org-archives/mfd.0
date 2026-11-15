Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794734096;
	b=wHPyE0fpCYSq9xNsYlodjoxbVzouqhVIgmtclFygM4xdFiPHV2ZH1qv95xu8BYarEa8E
	 2T/SLL/yIn2zSv9W9L4GMGfgq0lhn++tqLDuVUrJ9AHJl1jYJKL3D70y9E5Yv3cqAwUue
	 e/GA2lgANAbns/MsqHrbu+sUq3aNlrSdZwflixN9pKtBUaKpa1ORXrO6urgGfb3Dgo8LA
	 wBQm0j6RJEW2pmJzPxq2+c5P8+H6ES51vWjBnh8gtrtIqQiykoBblrvUyAibqJp/Na/tA
	 +BpFckW64eourIst9Thzxf/2LNhSoL/fcpQ90SMXFFqe4NDJsFdzKHCL4jQnuKMIkiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794734096;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1d11o6ymKcpqY/T38RMFS+n55h/+vXPy0m4BPss5UVk=;
	b=RPSVW+UHZ7Ac6KkVXQxqlSEtz8LzZc/pprdAKVmH1Dxsxn+wHC6VjVRWDGJ3kB+DRNr+
	 b+XTqHU9GrjloqBCW2edk8En3oyypXiX5t05iz0NlOKdCFAtq6nHx9+3TPLi44f0fQhMi
	 fwzNuo36ujyJpJAHQF9cJ1pC+AoIbE5qYERiWsKt7Clp371289N/FhkiUQkOMspLvyxEE
	 iT1UdNW3TCzgPlCcVnumSZkj9gJXYPcHzGCx7iguMzRSMLw7NsLWzSrnCJqvHk4Jb00km
	 pN6XVmpvTCGq0zsGoAiNunsuxbMvO93j5K/Qkj4ETaFfOGu3bfC3eEfqIXyj/g9/wSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G7/lbd5L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC637606A31D;
	Sun, 15 Nov 2026 09:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7/lbd5L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162C61F000C4;
	Sun, 15 Nov 2026 09:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794734096;
	bh=1d11o6ymKcpqY/T38RMFS+n55h/+vXPy0m4BPss5UVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G7/lbd5LI/FMH5N8J+trcQH7geiqcyaYDsjaNzfo9gMSD+FSXLAXuDTr23eBANDnu
	 HC4gnarwKp4Mr6TXgCTdVoD+zpOQxrVYXJ5x+ypxh/q9s6c2Xdqj+ZllBYf2h3vOco
	 IoQaeenHuCCoR3Tfw7TCNApW7pZOzUTRxdkHiaP8VxoCL6AWwIszDDRJb/HjaMcRN0
	 hWlABLAuTUyTlHdjlOMB/63fgxgSZftFpr9JjekEmTCGfPWiRham5kKqiNGIb62FQr
	 o5FDh5OuqFURpBEZyqHLGvn5zApg2kRpPNT1d7oXMrt0rxME5hzwRxqEv0kEHPBqbY
	 9xvw4NiO9l8yw==
Message-ID: <sashiko-outbox-215334@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] mfd: max8907: Convert to use device managed
 poweroff handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261115090147.95337-5-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
 <20261115090147.95337-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:14:55 +0000
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
- [Medium] mfd: max8907: max8907_i2c_probe() drops
  maxim,system-power-controller check
--

commit fb2af9972c7fa309fa63776f15c1fc76c0092afe
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: max8907: Convert to use device managed poweroff handler

This commit replaces the global pm_power_off assignment in max8907 with
devm_register_power_off_handler() and switches the DT property check from
"maxim,system-power-controller" to of_device_is_system_power_controller().

> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index f6d7a4ce9712f..8412dab2133e3 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c

[ ... ]

> @@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
>  	struct device *dev =3D &i2c->dev;
>  	struct max8907 *max8907;
>  	int ret;
> -	bool pm_off =3D of_property_read_bool(dev->of_node,
> -					"maxim,system-power-controller");
> =20
>  	max8907 =3D devm_kzalloc_obj(dev, struct max8907);
>  	if (!max8907)
> @@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
> =20
> -	if (pm_off && !pm_power_off) {
> -		max8907_pm_off =3D max8907;
> -		pm_power_off =3D max8907_power_off;
> +	if (of_device_is_system_power_controller(dev->of_node)) {
> +		ret =3D devm_register_power_off_handler(dev, max8907_power_off, max890=
7);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register power-off handler\=
n");
>  	}
> =20
>  	return 0;

[Severity: Medium]
Should max8907_i2c_probe() still check for "maxim,system-power-controller"
as a fallback alongside of_device_is_system_power_controller()?

of_device_is_system_power_controller() only checks for the standard
"system-power-controller" property.  In commit "regulator: dt-bindings:
maxim,max8907: Convert to DT schema", Documentation/devicetree/bindings/
regulator/maxim,max8907.yaml marks "maxim,system-power-controller" as
deprecated rather than removed, and commit "mfd: max8907: Remove
platform_data based probing" notes that external DTBs may exist for this
driver.  On any system booting with an existing DTB that uses
"maxim,system-power-controller", this regression causes max8907_i2c_probe()
to skip registering the power-off handler, leaving the board unable to
power off via the PMIC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115090147.9533=
7-1-clamor95@gmail.com?part=3D4
