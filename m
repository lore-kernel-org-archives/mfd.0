Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180294;
	b=Reo3VuXmQwSJX2DAAmoeFA6NUe8EFpKAVByuMyVARUg/0qs6GE2wf619mKTD2Wovk1lY
	 ewrkYlQZO/Aq9MaCPHCmKbD5VqnsTPQsjkjQY1Rr20LcR/iMoLyJ+r/UnO3JnNcP8grZn
	 dD3aN70P6l51wSZM866JbwtfDoTDP4u8Qk01VpT8XFTNIf3bjqb/qOkhbKHRdK3oqp6uD
	 0bcOvIAEELx+5QiiWWjx/EKfiTBmaujLYzltTtk/79I6CX76HQfwYGk27vDYnribWNOdi
	 rDB924QPF8B8zCHd+AfzjNjV1dfOfHO1B+NefKGXE4RnpofQNFANPU5q/44OQaPj+2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180294;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=/337IpE5KTxyqcxql/1j4KDMdfOcExSPgOP5KC4FMmQ=;
	b=FooaIeMT0mbNH6tsdtg7MsmkKREgjiVDDAQbh/9eq3fRXXn/UxnRSd+OIxMn0egsZ5Wo
	 b22SV6Oopb1qEy03V06vHrm+oI1fxBFRT0folm2t92bT8lV5bEQVF6zZptkupH7qsqw9j
	 tXxDlBHHwxSPCPyrEnyT6otmqcF1ywbGnjild796WVLYk0EmPS1thU0vRXM9XyhPW1+Np
	 lsnAAFYpqcA3ljGJd8YOChh1plfl0PZ+voYBIgwKWxSOynb5PhSE+fIErXFpToHejt6Kg
	 MlhT9uwD5EXgz5Qqv7/IuHnkkXKHOX/lpfA/4W2trgYt2zxi8Q72/eQxFVvCINaS6LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KMg/f8po";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C624606A31D
	for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMg/f8po
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFC91F031E6
	for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180293;
	bh=/337IpE5KTxyqcxql/1j4KDMdfOcExSPgOP5KC4FMmQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=KMg/f8poVuF+OYYPg2we+k9iKYhNdzzwEXevZXPuMFYAaiLTlZFRzurPDpsiRIA6r
	 qLN1YK2LwoyVaOu7Cdy3S9Htjl0OIBaayZEpGzl8lI4++ZLgj534gb/BgWiIY6iVXG
	 FWGk00+epgjbssmL3PjakXWdSicxCzL+H/TvG+M+6uKZX+AXfuuvdY/9UUxMosk8SQ
	 /fiBgKRohC+iL4XCrhjFTGJ+WoVq5m8oCDJrRcGg68uNTQwsIxovttjBgkYu60BdWo
	 gM+kcfRCO6oKdEmiS8CTEZcPamFqUl041qLLO2EgPF0ajyw3VjptY3FUJHg252a49a
	 jAENpJ3EsZzTg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a595487d43so5596111fa.3
        for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 02:38:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNnjH5fY8PxLeD9so9k5frXUWGqeFWdbbTVZPe8XepvzzN47JryHkPDHItZk4pVc40mDc=@lists.linux.dev
X-Gm-Message-State: AFq9FYIE8gngcm+/35nRYs7/jABFy5K3PnYHB2iZm9MGm9fqBMry+3RR
	Ra+YeZNNyG1kYPFXU+FOa1m16avAFz+H0wXosQl2orVW3gzyU5wOoa0+Zj05iefWpQXZRid6XNb
	TeSvwfsGNtjufHzd9pQ5cbYqkkxbW0tolrZa7S4bzgQ==
X-Received: by 2002:a05:651c:3605:b0:3a8:bd3d:549a with SMTP id
 38308e7fff4ca-3ac9cf08a40mr4333801fa.7.1793180291927; Wed, 28 Oct 2026
 02:38:11 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:38:10 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:38:10 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-2-e21253295e68@gmail.com>
Date: Wed, 28 Oct 2026 02:38:10 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdtxtssfPrwXVGxLe1tyyfUxdOKcNmczn=gzESRNE5+oQ@mail.gmail.com>
X-Gm-Features: AclHuK8XdDJnZKMQhT5pgCqqGCu9vzYOmcLsT73Wl1aen1LlgEEs17VBcSWb8bE
Message-ID: <CAMRc=MdtxtssfPrwXVGxLe1tyyfUxdOKcNmczn=gzESRNE5+oQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM: s3c: crag6410: convert PMIC DVS GPIO to
 software properties
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, mfd@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Oct 2026 06:03:13 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Convert the PMIC DVS GPIO configuration from a legacy lookup table to
> software properties. We use the new 'dcdc_swnodes' field in 'struct
> wm831x_pdata' to pass the software node to the regulator driver.
> We keep the DVS configuration parameters (control source, startup
> state) in the platform data.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
