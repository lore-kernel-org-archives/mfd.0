Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FF948CD54
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046688; cv=none; b=db/btxj9euHwNY9CP6KlabDR0rsgT6KNUWPYKvwmyPjPM6rkPlkMC5SnqegGacVafyZbeR4e1MQWijejuAGn7i5kwtteIX+Vwr0Ls8DOO8oAHCgTJtvvZ4noqK13m/JovIfO+tVWyKYxFg9Yw2CwX6O8x0a1CfWiw3kmLGQGM0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046688; c=relaxed/simple;
	bh=Cx8Rm5Qe/SzknEobdXLKbnjVyKPxDYcYhYcHLbHHdMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJsoUqx9AAqsTIQn+V17+2WII8Mae1c0Ncn3p3Qzp50l6QmPz6zMVhY6KMshXc1CdcmMp2QEfhpTSqkyO8qZO8Hpp4Jg0rudD365QpEtshTzKGh9K3Qk+OdoygksMcGJxjzBHxJM7Naue1pDdg4BvCRqJEfDJUdnrP9XrQqnMhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4Z2h6cn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4Z2h6cn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B641F00893;
	Thu, 10 Sep 2026 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789046686;
	bh=XUXhqGZAGjTosuygYOcnl7SsqLilMt1RYl5sKmqY3xA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D4Z2h6cni/8G8ZQuTTC+Z5od+ebAx6kvZ62sKcvKGe8UVTRHT7wvZCNVq3zaj8RTr
	 Nz5e3voPMyvQ5vKxbIJaCfDv/vAnw6UEZo5Ql66jl2pEmZXA5jsnSVWhOA9og+8/xu
	 9A5xRAF5hMhDLk0K1LgKF/h4qppLuaDYAiYaK4NOfn79arwcX/nYEIVXOHNmXlfv6L
	 SuxiJhLkeUo2kcNjRIaaLA266MdfLRBAPDWmH5e/uU+Fb9qEsXI2ojDnxVSQcS8Rh/
	 aM03SjV/G/4pLQQuXEvCMcJonaAA64/3DHJpTTlqIGOKzieAmR3/KW7Je5+8jrdGI7
	 AJ9/Cc2QSsamQ==
Date: Thu, 10 Sep 2026 14:24:43 +0100
From: Lee Jones <lee@kernel.org>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: mfd@lists.linux.dev
Subject: Re: [PATCH v2] mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20260910132443.GB1051768@google.com>
References: <20260829050228.42638-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829050228.42638-1-triet.hoang.dev@gmail.com>

On Sat, 29 Aug 2026, Triet Hoang wrote:

> Convert the deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
> and pm_sleep_ptr().
> 
> This allows us to drop the __maybe_unused annotations from PM callbacks.
> This is a straightforward cleanup with no functional change intended.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> ---
> Changes in v2:
> - Change commit message prefix from "drivers/mfd: " to "mfd: ".
> - Wrap to 75 ish chars for commit messages.
> ---
>  drivers/mfd/iqs62x.c           | 8 ++++----
>  drivers/mfd/max77843.c         | 8 ++++----
>  drivers/mfd/mt6360-core.c      | 8 ++++----
>  drivers/mfd/rk8xx-i2c.c        | 4 ++--
>  drivers/mfd/rn5t618.c          | 8 ++++----
>  drivers/mfd/ti_am335x_tscadc.c | 8 ++++----
>  drivers/mfd/tps6586x.c         | 8 ++++----
>  drivers/mfd/twl-core.c         | 8 ++++----
>  8 files changed, 30 insertions(+), 30 deletions(-)

I have no issue with the patch, but I think that it's impolite not to
include the other owners / contributors of these drivers:

  % git show | ./scripts/get_maintainer.pl --file-emails --git-min-percent 75
  Lee Jones <lee@kernel.org> (maintainer:MULTIFUNCTION DEVICES (MFD))
  Chanwoo Choi <cw00.choi@samsung.com> (maintainer:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...)
  Krzysztof Kozlowski <krzk@kernel.org> (maintainer:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...)
  Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC support)
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> (maintainer:ARM/Mediatek SoC support)
  Aaro Koskinen <aaro.koskinen@iki.fi> (maintainer:OMAP2+ SUPPORT)
  Andreas Kemnade <andreas@kemnade.info> (maintainer:OMAP2+ SUPPORT)
  Kevin Hilman <khilman@baylibre.com> (maintainer:OMAP2+ SUPPORT)
  Roger Quadros <rogerq@kernel.org> (maintainer:OMAP2+ SUPPORT)
  Tony Lindgren <tony@atomide.com> (maintainer:OMAP2+ SUPPORT)
  Jeff LaBundy <jeff@labundy.com> (in file)
  Jaewon Kim <jaewon02.kim@samsung.com> (in file)
  Beomho Seo <beomho.seo@samsung.com> (in file)
  Gene Chen <gene_chen@richtek.com> (in file)
  Chris Zhong <zyw@rock-chips.com> (in file)
  Zhang Qing <zhangqing@rock-chips.com> (in file)
  Wadim Egorov <w.egorov@phytec.de> (in file)
  Beniamino Galvani <b.galvani@gmail.com> (in file)
  Rachna Patil <rachna@ti.com> (in file)
  Mike Rapoport <rppt@kernel.org> (in file)
  Eric Miao <eric.miao@marvell.com> (in file)
  Kai Svahn <kai.svahn@nokia.com> (in file)
  syed khasim <x0khasim@ti.com> (in file)
  mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD))
  linux-kernel@vger.kernel.org (open list)
  linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
  linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
  linux-omap@vger.kernel.org (open list:OMAP2+ SUPPORT)

You can be more selective than this, but you get the idea.

Please resubmit as a [RESEND].

-- 
Lee Jones
