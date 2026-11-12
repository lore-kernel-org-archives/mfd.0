Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442902;
	b=16tYd8MhvNdvIy3ujBoBCqHAVg7J4CqHc8nXrbgqrn+pSH6ABdvr4hbz423uEABGFmWJ
	 dq3yR8Q83TMvwipI7+Ipc/QvKrdYmIrDhprOf7C+nk6oKkiQOh1Qj74hncWgUDvkUtKk9
	 Lak8TeoKcrR5074h2whaTITFm6juGLj86T3ENdZRpU54t+xE4RfSscbrQcltbYCEPAdEL
	 JprgAuBTk6wPe7dwefThRUHamcAMy3dsFjSA3yT58xYhfO0yIFT9g8HK9NBOmM6Kc0r5i
	 uzL5ZgKBtOvTNcM0WM/JYXM5T5G8K5ttz7aHEG8x1aLGkPPs7QEGTo/Uio0wAjvrlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442902;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r7n1S0z5i+ZOhqZ0BvbIFW5HdF+vnPfxYuSwdsHG6po=;
	b=gUUsHpJ1a9+boyckNotbQP0EX5I35Wc5t3gfGczQOvIQqQhUnFLC4B9FswXtad5lFRBN
	 QRnF8uc78E1CPwS0jMWy0k0WhixwStD0erSUeyF0J82nNw4m/E0Qbt3Z3U4mDhX8hi/Ll
	 LvRj6zRhl/ccR4QZ8pOspA8qZ2nBtuCOGa5pcRn/vXQfR4suoRyx05g/J4PfUaBqOu6mY
	 56ZBtA9Q+vhFsci3xXzhTG4IyS0fadble8abr9wn8MIjeTvgeNze6FNdK+UinzvMa/ody
	 Lm8obm7B5Ulqcbpy+Kg3tM7ObMt5Y7FNhKxCklsWH50m3ydxrMrxwCG2ZdS5EJyRtAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SjrDu/OE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C38606A324;
	Thu, 12 Nov 2026 00:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjrDu/OE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCD71F00A05;
	Thu, 12 Nov 2026 00:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442902;
	bh=r7n1S0z5i+ZOhqZ0BvbIFW5HdF+vnPfxYuSwdsHG6po=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SjrDu/OEbQwFO+96boEurWz0V6HGyWkM5yGM3Kh49zwN7O/TuUlq7K6hrqNzhRrRy
	 iswYyrl6/8BMVtxDUxICyhsUzE+40S3pHN5y7NNhMwqJHfw37ssDz55jjQnrzSzA/D
	 Qd7XtApPqjlM1XsXIxCRqqp1w4T9SN3ynYptgk0+7vyO4EOg2tkwKMpSx8eqvpng/G
	 hG7Cm1ErynQ0rYTXehK3nbmXj4vXuIAS04ZTJ2lNWENZK85RzJDWhfH7PQW+MYrBW1
	 ASsbf3w11KwPJXG5BOaVcinLgVTF7uAOMEY9A22Ig2XeHhDMPnAHR6xVsuqkwu8dMj
	 0jH59ZT+Xp66g==
Message-ID: <sashiko-outbox-209904@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] arm64: dts: marvell: Fix node names
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261111-dtbs-marvell-v1-5-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-5-938788aff3ae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:21:41 +0000
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
- [Low] arm64: dts: marvell: ac5: dma-bus@0 unit-address mismatches
  ranges parent addr
--

commit d32f1cd6738013623bd9cd4b37c287a2b69edbf8
Author: Rob Herring (Arm) <robh@kernel.org>

arm64: dts: marvell: Fix node names

This commit updates node names across several Marvell device tree files to
use standard naming conventions.

> diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/b=
oot/dts/marvell/ac5-98dx25xx.dtsi
> index 4878773883c95..814b8a2e8ea93 100644
> --- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> @@ -231,7 +231,7 @@ sdhci: mmc@805c0000 {
>  		 * Dedicated section for devices behind 32bit controllers so we
>  		 * can configure specific DMA mapping for them
>  		 */
> -		behind-32bit-controller@7f000000 {
> +		dma-bus@0 {
>  			compatible =3D "simple-bus";
>  			#address-cells =3D <0x2>;
>  			#size-cells =3D <0x2>;

[Severity: Low]
Should this node be named dma-bus@7f000000 instead of dma-bus@0?

This node has no reg property and defines:

  ranges =3D <0x0 0x0 0x0 0x7f000000 0x0 0x1000000>;

In check_simple_bus_reg(), dtc skips the 2-cell child address (0x0 0x0) and
matches the unit-address against the parent /soc bus address (0x0 0x7f00000=
0),
so building DTBs with W=3D1 warns:

  Warning (simple_bus_reg): /soc/dma-bus@0: simple-bus unit address format =
error, expected "7f000000"

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-marve=
ll-v1-0-938788aff3ae@kernel.org?part=3D5
