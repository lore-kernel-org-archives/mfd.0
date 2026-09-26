Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C161A683E
	for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 03:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393831; cv=none; b=ggXzIhWBrVuci8yujCTf4SYj4/9YZlX8gmQaarXmw4ZvVJYKfAppsxQ9c86AQAQNfixkxf/ZRslZmbof1JvaoxQK0ETLZ6c4to9t+4zU6UC+mY+WV2iYP1qA+guuSSDs9rwgIehzOX9p/WtLZTn9cxyY0gb6qxAsY9ekOVZAfN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393831; c=relaxed/simple;
	bh=BLv0rRdoWToZOH28vOWENZ07pNp7lKwV0lf3MjaJwMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuZO8SirApy8Qa+ZH1BHq1C2nRJdFeiwQ9GzqhI0skUSg9fWs484ih6gZby3oqSWq96s/tOy0nstDQJyPqIOw/oBq1SVhrPvLc3x4NDL3jOrSrZUxIjePy9eJcCYRj+JX8rxTuvAH7ButRcSFrdGjdSodiTBGk6Hrid75mmVooY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=jo9wQQ7m; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="jo9wQQ7m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Content-ID:Content-Description;
	bh=AQLmCm/9B4mrJDzPpo+c4kOsaksdj2bsxYt/mOLsFQ8=; b=jo9wQQ7mm1/ITjk+ho4Jqb3VQ4
	pZIm1U2kqU9EuqV46lVDXBxtDVqh6mbj/xZCVgKxADk0e2A+hQc6WwZfju0uf/V9QQDHCcacY0TFO
	kvEYBfRRfI7hAG62lVNBjhLw3NdbPvg/A/lUr8mu8Z/uP1+PInYzLX2mvLZidv8ajyiaLyE9N/WXN
	DiWG1A+Y4rYjXLv7HkZsYQ9Fu1lUSzYgN0eO9ym8loXE/rzLtByS5fEFW7wwesxFNYSNy/NVqgAlC
	p5RVlYBoeEHqVbXfwr/vSn+oAcQhe7y0NVmH4v6jfafS+/SH1x4gI3ntSvqjYJyPDFRi/2TfNfFv2
	ozuxqb4A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <domibel@debian.org>)
	id 1xAJDo-005naM-17
	for mfd@lists.linux.dev;
	Sat, 26 Sep 2026 03:37:08 +0000
Received: by mail-pz2-x23.google.com with SMTP id d2e1a72fcca58-8814e797a5bso120962b3a.0
        for <mfd@lists.linux.dev>; Fri, 25 Sep 2026 20:37:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBBt/wjXPC4J4rRfe5IzMBxds8mrYvjr6yXbtWDiUyK4jfx/iy5Fp48NYM5GQg1UtQjUs=@lists.linux.dev
X-Gm-Message-State: AFuF++mKiQ54cWR5jH4Bvhf/UEMr5YEloBxLJuOYKZLFMZtNcTuNSkX1
	M3Thmd7d9dPPs/qF9m99Nzl2ZWG3XAfEJ9/Bd0ygmu5e51Ncsj2Yl5Kmkn0KRU0mpvxieTRkkmk
	xV8SnzkWV4DWjPphqHUzkE13e8h9ONwo=
X-Received: by 2002:aa7:888b:0:b0:880:7e9a:6e56 with SMTP id
 d2e1a72fcca58-8807e9a73a8mr2177107b3a.13.1790393525763; Fri, 25 Sep 2026
 20:32:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CGME20260915153246eucas1p289987fd8757c89ff865c99b6465708a8@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com> <20260915-jh7110-clean-send-v4-18-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-18-f0e4fd6f2cc8@samsung.com>
From: Dominique Belhachemi <domibel@debian.org>
Date: Fri, 25 Sep 2026 23:31:54 -0400
X-Gmail-Original-Message-ID: <CAAvaLCzm1o=m6P88KNeHCG9BuTBu4AQmAec90kN3MMC6ZpALaQ@mail.gmail.com>
X-Gm-Features: AclHuK8_8y3EcFqb3OgZBY9WaeDxyzPMPd1_yK_ekhMIXfr7tAphtd8D7H_5xEI
Message-ID: <CAAvaLCzm1o=m6P88KNeHCG9BuTBu4AQmAec90kN3MMC6ZpALaQ@mail.gmail.com>
Subject: Re: [PATCH v4 18/20] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Joshua Peisach <jpeisach@ubuntu.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Debian-User: domibel

On Tue, Sep 15, 2026 at 11:32=E2=80=AFAM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> +static int starfive_hdmi_phy_probe(struct platform_device *pdev)
> +{
> +       ret =3D clk_set_rate(inno->phyclk, 297000000);
> +       if (ret) {
> +               dev_err(dev, "Failed to set default rate: %d\n", ret);
> +               goto err_del_clk_provider;
> +       }

Hi Michal,

Can we drop these 5 lines?
When my 4K monitor comes up in mode (3840x2160@30, 297 MHz) the screen
stays blank.

When the first real modeset requests a mode whose pixel clock is also 297 M=
Hz,
clk_set_rate(hdmi_pclk, 297000000) then sees cur =3D=3D want and does nothi=
ng.
So the pre-PLL is never actually programmed.

Without these 5 lines inno->pixclock stays 0,
so the first modeset's clk_set_rate() always runs .set_rate() for real.

Together with my forgotten fix from May we can have working 4K@30 on the VF=
2.
https://lore.kernel.org/all/20260528184145.384114-1-domibel@debian.org/

Best
-Dominique
