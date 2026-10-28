Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180306;
	b=oSLyQXEocjdvF2Cck2zB47epuYYFjpFpf0nzt5uSSGDPvljRZDEiO8hRMCuQJzOvP4ih
	 uvYaIAgkDnvJucijGFB2Yty5MD4KR54ejVAlOgdmJU6nYiHmixgsFoQKbzJ9Jgpv8SAPF
	 F9Y37AL4dTnzf+jvawgxa6UAeTJulwr0ztOvP8++86E3yVu7yj58sRyUtfwEZD2F9/Hxu
	 +WrdMSnVfgS1SOXFviulFDYo4FX0LhbaMm/iLwsRyDvfMrkWayFckVIeKM5XDzvBAlZxA
	 XuJBlGmKL5GfN20iIb2E3dguR5d2UHWC2z+noYfZ5yTqg0G5DidgoXbtN9AGq9X8qDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180306;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 Received:Received:From:In-Reply-To:MIME-Version:References:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=wOpo207OEwIctZbL0yPki45XtYqA5r1JdptjDpx6mIo=;
	b=pDpntYai9th4AY/3EdUZhD9Ze/JLpHpOPPKTkSwLnf6XrqHr1sNp6s2TPQepriv1MbAF
	 5zo/EbUkYyHYrVKelky5WseJvBM24HE9Euuo6n+yCQ0zlbCuq/yJRyvGVMGPOSex0M0IR
	 JHqFUn93trpEtpFAOcylktCnDcSmkFZ6ykmu+SM9+lCYP2y04h6ZfFjDnOWqnEQbJOxX4
	 eYWZsr/sUJ/Bm8PqNYxhknKkk79HL9fKRqSb0UquAl0Gwgds9/K5Mzab9Ts/Hg+cHr/k1
	 y4aqScM2RZttamuWUTLLqU8kva0Vmlm9gCqdN5Yic1/Mf6BZp9nRVutdIyY0Em+08xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTz4ccFy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D67A606A321
	for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTz4ccFy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF38C1F031EC
	for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180305;
	bh=wOpo207OEwIctZbL0yPki45XtYqA5r1JdptjDpx6mIo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fTz4ccFygFqrLoGtnIUHOqwYAG6fYE83eAzaKKKFTGrFdbqiyeG/xOdDlpbWljBj5
	 5V6xdBINwYU5kocYciXsQsl86nG4vrMADyaBoGICOH5SM52l6lMFMVsUuePcwpd0nk
	 dqsLjl1bgVEXkSKvvBlyt/4fvoEGoZPymlRX6HulIa2tbiCQvsXUeYPp4K3IUVrqRU
	 pYkgAmPxiymSttYf90sD3iHqe3+rcjhblkBwBr3nhPmk5/7ostKSP2aFHP8Aoo6ME5
	 BA5mvwUjZk8wNBLra4DsKT3qmgjZC2uJF2DNqeQ9/eHo66ETgnyVIkVrdJ4CTpoy8c
	 oOvJG1pWVoFTA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a75f960be4so5503331fa.2
        for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 02:38:25 -0700 (PDT)
X-Gm-Message-State: AFq9FYJ9P0XP+6OYTEQKdmingPjC1kjEkj6CpClta663aUI3s0z0fAOz
	7poT0m/aRirbIJoMSIvjJyWmCLGueH0W9Y8Vosrm+9ZhrvSu2g46vI/abBdBDv1qsL0i71nhexE
	DVz5I+WxtNQRLFyfcrAmTbfY/Lh6RhJrb1NtTINOa5g==
X-Received: by 2002:a05:651c:1593:b0:3a6:95a:52a6 with SMTP id
 38308e7fff4ca-3ac9cf82d06mr3952511fa.20.1793180304502; Wed, 28 Oct 2026
 02:38:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:38:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:38:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
Date: Wed, 28 Oct 2026 05:38:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mf9fcYRZcqGnNeg+sz4bo8n7AngbWkb8jPBXKwzUqpE5g@mail.gmail.com>
X-Gm-Features: AclHuK-0IY-K4Sj4xF2g0AMS5-uqQjH_1YFYYyMfdx08al6vG1--BGlVHEhA67A
Message-ID: <CAMRc=Mf9fcYRZcqGnNeg+sz4bo8n7AngbWkb8jPBXKwzUqpE5g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC regulators
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Oct 2026 06:03:12 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Allow passing software nodes to wm831x DCDC regulators via PMIC platform
> data. This is useful for non-DT/non-ACPI platforms that want to
> associate device properties (like DVS GPIOs) with the regulator devices
> using software nodes.
>
> Add software node pointers to the PMIC platform data and have the MFD
> core assign them to the buckv cells.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
