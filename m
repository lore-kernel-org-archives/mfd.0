Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793063234;
	b=3eVNjHSdlWOMHFYFX0k4XPe9Th/YOR1UIlvnaQWcs5s6u/VnfcuR23+s5zr0WFjVFxH3
	 UyCo6aCLhmthocmN35oJPWXK65igJSmJDemW/qrjbcsxcuWKm6WRZIE45DtX1E8Bd5YXP
	 v9gXOiIVek3oVc4a1WScK5Sk31ia5F9f1CGqW63C5uWUpk2DDKCP3iSolCEVe5fYF2D5c
	 RbGPMSufb+vtqzY1afd3g2HObcdlDpUhv1yLMHMJQxdmvw1bsF58sRENAqEuLTeVVXq6g
	 hN8FAmQv1VhWXvPvmIvSsmOotFdRmqcqxA0cJmvdRWkx/ctNvOG8Nn/nPLKrQcv3WSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793063234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
	b=VQmu0qReheSf3Hscw4SB1yU7a2fC+YVd6mIHBGiVr9HYa/mWmgjUV1056AB8hwmHQBSd
	 KCk3hz8RWOe28QvrsN4hBJDO3/rOGG/V99Kx3LIycp9fbp8xO+hfB1avr2qyW72aYKE3D
	 nI24fWNyhHi1wmDQcP1wnVNRAlmfYA6dWeRC22zoK0JKkRdf2QVL2KMPejDbP//V8XwNJ
	 AbJg+YB0lzxf9jBj7B4I+z1NWd7kwNCFDqIghxxleZlPIYzPT+UFSiTRtyFsjJWgqm05k
	 g7PVAQB82xUMOE1wZs7QgFcpkn+oVfWf9irSAN9Fg9g79pJrbzRKaugEQBSw3uJIAAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="VjDjj/TO";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEB9606A31B
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 01:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBEB9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VjDjj/TO
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35d0be18c71so579770eec.1
        for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 18:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793063233; x=1793668033; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
        b=VjDjj/TOVp35nfZHOz7sWfvEKUgDdoVRhhdrPqMLCt0YCmHdKWqBQBJqqgS5sWk6W9
         gjWH9tutkaFiLzNefwTedb8gJCUW/rTvkrZQEFp68H96ldtc/KahVp960lmdrUkPnNLo
         QsHz6qE9Sy6mTfvLCK/SixqAGn+h7WFg8BLcPkb5YgYUhrlbtsP9RransuZdci8yfjk6
         KcToltzj0uX3FNwR53QwKMNvn1y1wtVYX9itGmuwCttCEcWOo4YSjtI5bW99lMFVe1yI
         WXBDtQfqSa/JpxYRHr0FhUi45ulU/MfD08wjGORPxBJ4kCW0Sl/84ICM1aoqYak0ni46
         5iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793063233; x=1793668033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBhaO6Es9PKt4idPNg62EPh8XgJdwaGm+jmpwXvFRC8=;
        b=eLIflvJPUgUJfQAnkjCz4EJ7JQCZlKnYXJt7pkawZl/RFV4uSTTd5eVUdiMwxD0YI4
         bOt1l3DurTxQAEiuOfRsGtNOUJhxe3FBMabOcuUzBcD8gkv2WlukT/X9QYssaUVmz5h1
         jKDw0Aifby5CS3xqSbqY97yWEcYO1qmiI5N7hPiN37vY4pCCxr07rBeCbbKCgzdw9LIF
         FDcw8svPfklhamSglp0RU93PblszIEx86gZVux7TXEaFH9GCMISiZP9jmvy8fdg7jE7B
         ekzkAZq+vA0B6nVH9LmTkmzu9jfUNvukb8UzLgn2Mlqh2JykDmlEk5cARi1X0+OccC5V
         Bx7g==
X-Forwarded-Encrypted: i=1; AKwUvBwY5WRW8JtnmRlcwyR8Qtopo1G8F7j8ytynXq/faarv5anw3l8gidunBdKu2j5lQ+Ljs1Q=@lists.linux.dev
X-Gm-Message-State: AFq9FYKeywjE5eKGERFml1HN7y1GLVkjIRzmbigRBE1ATP1LXDMlhbx1
	aD3BJuPkwgMa2mDuihhRGvZTQCtBPQsaGEFKzxQlaoC7go06Rfg3IySg
X-Gm-Gg: AYBFou1QKmuWmt6wys1X2JKEgxBsADLecWPKc7WLpmgQE7lMvanK9Ogza1NIvGV6fnU
	OiWoHlGBf+8d5xt8qStQBniGDDMeujkVjYPle1Fn+Pc290ZL7AGyG1BN906dtOBscRuScItWWUz
	fQXIv2RGw3MLCN4L2Tht3dRJ6NlIVp5h38KqwrtL2rWxAupAObF4muAntbAiS6Se/3SCBQgY3lj
	U3Edm2c0cL9vZQcXJh/711LV/bApiH/nnohDzlWMAF3kdtlzU6eHdMq1nCJdtA8jiTl0CTYDNYB
	jIRdD9VgJW4hxZHlEF+xAmxoRkVB8LQjNKAxIVjGHXuj7qmLdWbXmKjkmWMSkyXZ6tfQoHKM0h8
	chC7dBC+jFn7fPMlDpltnb4G2jgTa34DhylzILWR2MMAQO5llFRWNCOCZgyq32CHVoU0LZMP0MD
	RDpgPtvm1hCDgIYOzSuWJoYdiZB/5RbUjR9Gwaw9vf4ns3mH4CO7qjIUXEjd7jFKakQG4QuVRbp
	5Rbt+iUom1zJitxLcTlCwzJlXIijXYQCzPAgpHcHJ1IoghpnbGWA/QLEL5fzBPiiwaqyUl2dXLX
	ZD7ZgFRaX0i2oxjJdatbBsM=
X-Received: by 2002:a05:7023:c013:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1a3c485419amr1593552c88.12.1793063232714;
        Mon, 26 Oct 2026 18:07:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2dc1:2e1d:6b4d:5a9a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm27239759c88.3.2026.10.26.18.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:07:12 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:07:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/4] ARM: s3c: crag6410: Convert to software nodes and
 properties
Message-ID: <at_45tVmsWaYAv7W@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <a6df6043-9f0d-4b03-8efc-d3e47a82f096@app.fastmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6df6043-9f0d-4b03-8efc-d3e47a82f096@app.fastmail.com>

On Mon, Oct 26, 2026 at 02:51:16PM +0100, Arnd Bergmann wrote:
> On Sun, Oct 25, 2026, at 06:03, Dmitry Torokhov wrote:
> > Hi,
> >
> > This series converts the Cragganmore 6410 board to generic software nodes
> > and device properties, allowing the removal of legacy GPIO lookup tables.
> >
> > We add software node propagation support to the wm831x MFD core to route
> > DVS GPIOs to the PMIC regulator, and convert the peripherals on the
> > Cragganmore board (PMIC DVS GPIO, basic-mmio-gpio, LEDs, WM1250, and SPI0)
> > from legacy GPIO lookup tables to software nodes and properties. This
> > eliminates the legacy GPIO lookup tables on the board and fixes incorrect
> > GPIO chip names from previous conversions.
> >
> > Hopefully Krzysztof can finish merging the series through the soc tree
> > once Lee acks the MFD part.
> 
> Hi Dmitry,
> 
> This all looks good to me,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> I'm a bit unsure about how this fits into your wider plan, i.e. why it
> is helpful to replace the lookup tables with device properties in
> this file:
> Are you working towards eliminating all gpio lookup tables from
> the ~50 files currently defining them, or is there an immediate
> benefit to doing this one in particular even without the others?

Yes, I would like to eventually remove the lookup tables and rely only
on software nodes. How quickly I can do that is a big question, but
I'll try ;)

> 
> Do you plan to also eliminate the uses of the legacy gpio
> interfaces in mach-s3c, e.g. the hardcoded numbers
> in {pca953x,wm831x}_platform_data, crag6410_lcd_power_set(),
> crag6410_machine_init(), or the pin config in
> s3c64xx_i2s_cfg_gpio()?

Let me take a look.

Thanks.

-- 
Dmitry
