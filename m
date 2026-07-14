Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688111AA797
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 08:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102440; cv=none; b=Bn9MBISpw3ozeLKWdgqh7GmGB8AvZlEFufdW7yj/FCSfx5/dchuebVW9bW+ofjY7gOHnoIdzvpxpHkTGbzNw5ZaLuE7ArsgCYEKZxmd1NO5sYzi3xWvYtMZ4LIxvP/gvdG74pSgSkkwijcNhACHfGBAc8Dt81jyuFz0KkXf376M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102440; c=relaxed/simple;
	bh=0puFGrZ1bzugF2iwQzkqWYUclPV3sCgyrEBkPyJ2SgE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZuKVLhq+0OEku+WzX6rsNMZrIHng2xtiIWR7DZ+afU/Lw2VvIgLjXA1tvwpNFhhyLfDmkbrJkx9aCqCVQ04Zgwk2SLs050+ONfImVY5Ku2TiRh3xWDCzagVjkjM3OO/n/x8wqx7ipOreX9LNMrDxQp2/uzKGrrn/wdakbkDXX5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=RsyFXgIv; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="RsyFXgIv"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wjuXj-00000000JAp-3RfE;
	Wed, 15 Jul 2026 10:00:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=87clj23hFfpt9QBNepHjfZoYycZtPvLMabqLFhkG2z0=; t=1784102436; x=1785312036; 
	b=RsyFXgIvGOTCX/yqiNcaBjqIj+fCdVGWcTb/kL2Y92Ur6flwfGY4hY1Ejb0rXsx3ux7iF4qSkKJ
	KV8MvDC2aI9qEELZmO8GZrhOeFKtG+RYg30wm9Cs2DBhIuLAdrtlHmPZWJZpObrJS9WUcupLO92yF
	kvj7SQqLSxUf5GMgZAJ5eC+LQpuEmt/kxmAv6urE7uBHEsfJ0cvQbo4VuMcSnqIu2XEVC2bsEgD0z
	ijBNJoQFdW+h1xl4eQRrXAhD+y43O91tyluUH2lFECbl24Ai34/x0+LgOIgYTL5RNcgOhGa9mX661
	60XHN7VHKBtS/Pmhyj+Drn4jKpso0ZeV6jFg==;
Date: Tue, 14 Jul 2026 20:46:36 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Grond <grond66@riseup.net>, Stefan Leichter <sle85276@gmx.de>, Grazvydas
 Ignotas <notasas@gmail.com>, Tony Lindgren <tony@atomide.com>, Ethan
 Nelson-Moore <enelsonmoore@gmail.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Sascha Hauer <s.hauer@pengutronix.de>, Lee
 Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Daniel Thompson
 <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Sen Wang <sen@ti.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, Srinivas
 Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>,
 letux-kernel@openphoenux.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 kernel@pyra-handheld.com, mfd@lists.linux.dev
Subject: Re: [PATCH 16/16] arm: omap2: remove remaining pdata-quirks for
 pandora legacy devices
Message-ID: <20260714204630.0fd6bcb1@kemnade.info>
In-Reply-To: <d380941287c655a3d205ee8b08516d364c0ddec9.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
	<d380941287c655a3d205ee8b08516d364c0ddec9.1783749722.git.hns@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Jul 2026 08:02:03 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> After updating the pandora-backligt setup and removing the
> omap3pandora sound system and defining related gpios by device tree,
> we can remove omap3_pandora_legacy_init() and the related legacy
> devices completely.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

regarding bisectabily: Do we create mess, if the platform devices via
quirks are disabled?

I am wondering how we handle this. If this patch goes together with the
removal of the legacy drivers, then there might be a situation where
neither the new one nor the old one is available? Split this all up?

If sound discussion takes longer, maybe do the backlight thing alone?

Regards,
Andreas
> ---
>  arch/arm/mach-omap2/pdata-quirks.c | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/pdata-quirks.c
> b/arch/arm/mach-omap2/pdata-quirks.c index
> b947bacf23a37..aca7097a692ed 100644 ---
> a/arch/arm/mach-omap2/pdata-quirks.c +++
> b/arch/arm/mach-omap2/pdata-quirks.c @@ -268,27 +268,6 @@ static void
> __init omap3_logicpd_torpedo_init(void) omap3_gpio126_127_129();
>  }
>  
> -/* omap3pandora legacy devices */
> -
> -static struct platform_device pandora_backlight = {
> -	.name	= "pandora-backlight",
> -	.id	= -1,
> -};
> -
> -static struct gpiod_lookup_table pandora_soc_audio_gpios = {
> -	.dev_id = "soc-audio",
> -	.table = {
> -		GPIO_LOOKUP("gpio-112-127", 6, "dac",
> GPIO_ACTIVE_HIGH),
> -		GPIO_LOOKUP("gpio-0-15", 14, "amp",
> GPIO_ACTIVE_HIGH),
> -		{ }
> -	},
> -};
> -
> -static void __init omap3_pandora_legacy_init(void)
> -{
> -	platform_device_register(&pandora_backlight);
> -	gpiod_add_lookup_table(&pandora_soc_audio_gpios);
> -}
>  #endif /* CONFIG_ARCH_OMAP3 */
>  
>  #ifdef CONFIG_SOC_DRA7XX
> @@ -514,8 +493,6 @@ static struct pdata_init pdata_quirks[]
> __initdata = { { "ti,omap3-evm-37xx", omap3_evm_legacy_init, },
>  	{ "ti,am3517-evm", am3517_evm_legacy_init, },
>  	{ "technexion,omap3-tao3530", omap3_tao3530_legacy_init, },
> -	{ "openpandora,omap3-pandora-600mhz",
> omap3_pandora_legacy_init, },
> -	{ "openpandora,omap3-pandora-1ghz",
> omap3_pandora_legacy_init, }, #endif
>  	{ /* sentinel */ },
>  };

