Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB16648F851
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995946; cv=none; b=aaj2bKEkqcW3JX4DSuedFEsYmJTIb0JNE4Aui7hMeQa30PJtEJTU/W4G0Xe76R9IT0QtobTuLdxi1Vmw/xj/e4wzXW/lgtMMRGcV1XNeg+3Jm7eDRLpwHgBpjDIxQl/752B5sGdPy5bEG/tFy7Gwc9FbkZcYRPOPoX0HFeOE4PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995946; c=relaxed/simple;
	bh=eqL1+pxbQbl2lD+yMbd0BnhFooll2P4VKDlpZNXroxA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUuHMNlOjpxj1imN+eaEillybfE3rjvi7LwU8Oi3pnpwCM4/tBUkFdkZig/Fh2tRa2th+FJzvTw5L9pNvr+TGmarY4vCdtshuDpYbGk4WKvD3WswOPigSV6zZN67I7dvfpdbaNSfJCUyJo06nit62A96H3qgFFF+2SFu2Y3uKDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GytY8D3g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GytY8D3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD771F0089C
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 13:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789995945;
	bh=eqL1+pxbQbl2lD+yMbd0BnhFooll2P4VKDlpZNXroxA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GytY8D3g9KdWyEtZtKTjUOE80hf8ad6hTWTO7J8PIUu0jHamYH88cX4PcpnIU4nuX
	 Fb8JSRH3Z0LaZ3h+Pgb3AsvbFcuues6Bk5RIOba2lut9pliLRttQMlHxKmbOKAH2Yb
	 Nh31eBZsWGEI2G7idQAW6xUecITXNq9iS7i2sMvQYIN8j20/cjTTq0TQ6EdLNUZCxP
	 brZjpAm9BYFp8WBMt10OoutEA4CgYr68ypEaveyMCAvHgvpTrPjaxrgg+a+wjsUKDl
	 ZZdNaF8bHTM+FswX6m4wAozccXVphUzMTrQ9GpTxAviLX5rpXaGuogEyWTAZoGR6sv
	 p4hlu95urNk3Q==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a60e33d456so13098681fa.1
        for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 06:05:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwE1QodginirKwuMMAF1bl5+Lme29DHY0Pc+RuK2asRbz9XgDsIjzgsoq3LAodwXW28YzU=@lists.linux.dev
X-Gm-Message-State: AFuF++n5t1+sDh2XsBwZmRC7F4hlqlY+ZlHE3cq5x/cVhdFt3Rgzqm1f
	jlb1P83U6aTwYpMUys9RvPD2L1dbKzE4V2gCbpNqModR2inzH0iTKFbpOr2/5oUCwZ3zRcdZXV3
	pD5ON5HgCaSDoRVlNnYQlKy0GSuDvnHO+EwVk0vs3Aw==
X-Received: by 2002:a05:651c:b13:b0:3a5:fb20:4e63 with SMTP id
 38308e7fff4ca-3a5fbf54e10mr22033851fa.17.1789995943840; Mon, 21 Sep 2026
 06:05:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 09:05:42 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 09:05:42 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <3e3a7197.9e4e.1a0c3e88117.Coremail.zl020895@163.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-9-282ff5d98dda@ambarella.com> <CAMRc=Mf7dtxvxBUF1fOuKw0mxdhCYPj=J4ckySPZUvcZ7a6cbQ@mail.gmail.com>
 <3e3a7197.9e4e.1a0c3e88117.Coremail.zl020895@163.com>
Date: Mon, 21 Sep 2026 09:05:42 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfSSHuPxOrP95aW5HXXE74f5X-yjr-KNavz_=tU__H33w@mail.gmail.com>
X-Gm-Features: AcwNN1XpPns_pQlHseY9Ez4-fOhLH2UhBc-jukWmFLjbznkNpQwaq4oL4Cj_puk
Message-ID: <CAMRc=MfSSHuPxOrP95aW5HXXE74f5X-yjr-KNavz_=tU__H33w@mail.gmail.com>
Subject: Re: Re:Re: [PATCH v8 09/18] gpiolib: regmap: add gpio_regmap_get_chip()
To: zl020895 <zl020895@163.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, longzhao@ambarella.com, 
	Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 14:19:49 +0200, zl020895 <zl020895@163.com> said:
> Hi Bart,
>
> Done, sent as a follow-up:
> https://lore.kernel.org/all/20260921-gpio-doc-followup-v1-1-618738124f4c@ambarella.com/
>

No, don't send follow-ups before anything is picked up. Also: Michael Walle,
who's the maintainer for gpio-regmap was not Cc'ed on this so I'll wait for his
Ack or change requests.

Bart
