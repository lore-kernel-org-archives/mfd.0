Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB3C4399E6
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 21:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786399012; cv=none; b=svey2xfTlsLZN+4rZytVDBd/7ZiezEizQDDK5HACi+obdLJgAK++DRmGUlrK0QQy1kZZd51uGAS7tSXhiWuGGiYZ9o3K8p10geluiGIZ2q1Ni+2bD0blmIIjEuegoMnJw9xoUF1wUSWCRSMoSqLM7z2OSQ80hoR6yM+f3I+UQuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786399012; c=relaxed/simple;
	bh=1yPTIt0b4BM+FRqxri0sGdnKO5wnpGcCLCMOm+9mPME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IpoO31HFsl+b0E+mit5xnpGDCbZiRE8w/faOAIXyvZxZNiYGwx8dA2DOPvyKitD7mnPbAxRnly3OTScr6lAUk7VibxLLv/F6FkaVFV/x7eEn0kaNoJ/e/Mh5xnY2q6Yx6pKF/5yDFepG+9/BOT6ZIj6O6m9v50IfF28zsuTGyoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ddFV+rIg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ddFV+rIg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JdhqvhUcr1W0MkN2QpMBn/xk4YqCH8LdA5a/dItKdWE=;
	b=ddFV+rIgeazlbtIlxF/s9946cxeQPcAqehEcG0MGGz4qtxDlNlwGDM6oGOnouMx3j1FEIE
	8dx8BO6/LBbJfLlOE4Y4ZhoIPHJQb7wVQiBL6GQGQj5YveviXMQluazUv+d78AZCJyBoZO
	3arDfdOS7dJLPaH9rWPM5UT9iSx6GZw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-f1ETJ07KMlaLz3fDdfJ_-Q-1; Mon, 10 Aug 2026 17:56:46 -0400
X-MC-Unique: f1ETJ07KMlaLz3fDdfJ_-Q-1
X-Mimecast-MFC-AGG-ID: f1ETJ07KMlaLz3fDdfJ_-Q_1786399005
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e85096e65so49026517b3.2
        for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399005; x=1787003805;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JdhqvhUcr1W0MkN2QpMBn/xk4YqCH8LdA5a/dItKdWE=;
        b=UZyi9ZMg5DMN84X7v8HKSUaRjV+izHhZStV/TFfzm8VKVDHVVCb3kF3SfHdUhGnk60
         q3ED26jIFSUdNyn5g9FAvkPQxSv7gwHIauL1d+M5CgAsiLEj+SOqkpaTx85SFjmt3Bnq
         0fbh1MbjGe5cRrAOMB3s3k9Sjl/hKvV/RlHO0m25mBHWQ6UMsGHBgh6tJidlL0pxel7+
         OMvM6Z4GwEizXReK6jJFioEFSKLBccgObP1VzRIBnTgN0MeT34EpUTQFID8Lhz75ZOye
         hrXgKCfVbRirZPxhkpmRct3QZtwGv53uGvxfrCH0VbFQl2M9Tks+JGovtcZaUA7HGxG8
         o2/A==
X-Forwarded-Encrypted: i=1; AHgh+RqPcoEp0wBvjv18kkKzepdOYuQEo39bVqZGGY8B/dc51yIn7/47EOQM9WgAssjN4fmlCkg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoAdsvrDN4jvU4c40yM5ilE/dtKGxkmSnpTlP/b3GR86PKF6x6
	8u82hFwjPm2QKDP3anNmmy9g4xJUC4rnVEgaSaDYB56wx0b6ogn+8eQ3FaZ9MAH/Xctai6MXwHe
	Oz9IBpGFxYjD8ounW7p4XHl17YudBOuAClKlHYnrjoQXYvrAK9qWb6g==
X-Gm-Gg: AR+sD11E1HEZF77/cBjUD3sqJdOEPqyG0+ebV3dApWYCWK0Pdry6rPF8g4jnGJmCeld
	uTFrrE9sMUqbPYhN2keTPTB9GBV+SMxaIWri8qaO68nHxSWqanQizEKbh4lHhsI67lZGCD9uI5O
	B8G2TxfdzupAG+45qO0JSRYRqH0UkPnzkL+AJVW79yql31M171LJl2Z6rTcdEaC1EjR9nU+6NH3
	GTUZkv0E/33fkMaZ+rsXEzTxWwJeu+L9Se37kqoh2c4cMIh3lthdosirQnZ+CUW3cB0S7dlvui0
	TJ1Zbd6+7CzgUQTPBK1GQXx4aRh+DYIia/uwHCNHAyc9z0WfMybcozG3pcQ0Lsl+j5GVMFdZMIw
	CPD/HC+dk233nsmk345NOR/KdKzcsp/A55UY=
X-Received: by 2002:a05:690c:698f:b0:81c:eca8:dbaf with SMTP id 00721157ae682-825786414a3mr153450317b3.31.1786399005266;
        Mon, 10 Aug 2026 14:56:45 -0700 (PDT)
X-Received: by 2002:a05:690c:698f:b0:81c:eca8:dbaf with SMTP id 00721157ae682-825786414a3mr153449847b3.31.1786399004708;
        Mon, 10 Aug 2026 14:56:44 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f098ec15sm64438397b3.15.2026.08.10.14.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:56:43 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:56:40 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 07/12] clk: zte: Add zx PLL support infrastructure
Message-ID: <anpJGFCv4vTftY0M@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-7-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260810-zx29clk-v10-7-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -cdg9ZHwEgUt3y0_efDsKQ_7zhlISvM-bfI1Z5YaeCk_1786399005
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Stefan,

Two minor suggestions.

On Mon, Aug 10, 2026 at 12:28:26AM +0300, Stefan Dösinger wrote:
> I am guessing how much of this is reusable among other zx chips or even
> differently named ZTE platforms (if there are any). From reading the old
> zx2967 code, I think the PLL code would be reusable there, maybe with
> platform-specific bitmasks but otherwise the same logic.

Please put a more detailed changelog about exactly what is going on here
because this is what's going to go in the commit log. Describe what this
patch does. Think about this may help someone looking at this code 5
years from now.

> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Version 9:
> *) Take req->min_rate and req->max_rate into account when looking for
> possible PLL configurations (sashiko). In practice the code will still
> only ever encounter a fixed request to set dpll to 491.52 MHz.
> 
> *) The same code style changes Brian requested on the other clk patches.
> 
> Version 8:
> *) Document the behavior of unlocked PLLs better: They don't pass
> through their reference/parent, but pass through the fixed clock-26m
> oscillator, even if their reference clock is something else.
> *) dpll has working fractionals. Add this in the comment, but there is
> no actual code support for it - the LTE hardware doesn't need it.
> 
> As for Sashiko's comments on the .set_rate implementation: In practice
> .set_rate will only ever set one rate, 491.52 MHz for dpll. All other
> PLLs are bootloader configured. Dpll could be handled by writing a magic
> constant into its config.
> 
> I want to have the rate finding code as documentation, and maybe there
> is more elaborate future use for it (e.g. more flexible underclocking),
> but attempts to handle eventualities like rate searches or misconfigured
> bootloader values would be dead code.
> 
> Version 7:
> *) Always keep unknownpll enabled when prepared so dpll can acquire a
> lock in its prepare() function.
> *) Clean up error reporting a bit (Sashiko)
> 
> Version 6:
> *) Use abs_diff to compare target and candidate PLL rate (Sashiko).
> *) Use req->best_parent_rate in zx29_pll_determine_rate. Add a TODO
> comment about the parent rate flexibility.
> 
> Version 5: Fix some issues pointed out by Sashiko: NULL dev,
> zx29_pll_recalc_rate error handling, disable PLL again on enable error.
> ---
>  drivers/clk/zte/pll-zx.c | 568 ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 565 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
> index fc76c6524a16..e8d57dd1386f 100644
> --- a/drivers/clk/zte/pll-zx.c
> +++ b/drivers/clk/zte/pll-zx.c
> @@ -4,15 +4,577 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
>  #include <linux/device.h>
> +#include <linux/err.h>
>  #include <linux/errno.h>
> +#include <linux/math.h>
> +#include <linux/rational.h>
>  #include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
>  
>  #include "clk-zx.h"
>  
> +/*
> + * This code has only been tested with zx297520v3 PLLs, but from reading the zx296718 clock code it
> + * looks like PLL registers are similar. ZTE's sources explain the PLL register contents only in a
> + * .cmm file (A Lauterbach TRACE32 script) and some unused headers in their U-Boot code dump, which
> + * may not be accurate. When calculating the frequencies from the default PLL configuration the
> + * results match the fixed rate clocks from their clock driver.
> + *
> + * The 26 MHz and 32 kHz clocks can be easily observed with the timers. The 104 MHz output can be
> + * observed through the UART. One 122.88 MHz clock can be observed through the TDM device. All
> + * others can only be indirectly inferred, e.g. by comparing CPU speed or SDIO transfer rate between
> + * the fixed 26 MHz oscillator and the provided PLL frequency.
> + *
> + * The formula to calculate the clock is ((ref / refdiv) * fbdiv) / postdiv1 / postdiv2. The masks
> + * are given below. There are a few control flags:
> + *
> + * Bit 31: Disables the PLL, but passes clock-26m through unmodified. Whether POSTDIV_OUT_DISABLE
> + *         still matters is different between PLLs.
> + * Bit 30: Returns if the PLL is locked
> + * Bit 29: Not named in ZTE's code, but can be set. There is no obvious impact. Lock times are
> + *         unchanged, so it doesn't influence or bypass lock detection. It doesn't raise any IRQs or
> + *         influence GPIOs.
> + * Bit 27: Given its name it likely disables the Delta-Sigma Modulator, if one exists at all. The
> + *         boot ROM sets it on every PLL. Unsetting it marginally decreases the time it takes to
> + *         lock to the reference clock (from ~400 us to ~300 us).
> + * Bit 24: Bypasses the VCO, but still applies refdiv and postdiv. Doesn't matter if PLL_DISABLE=1.
> + *
> + * NB: Some PLLs have an automatic bypass logic that forwards clock-26m (REGARDLESS of reference)
> + * when they don't have a lock, regardless of reason. This can be triggered by disabling the PLL,
> + * setting an out-of-spec VCO frequency or disabling the parent. This shouldn't matter in regular
> + * operation, but caused me some confusion when reverse engineering the clock tree. E.g. clock-26m->
> + * unknownpll(disabled) -> dpll(enabled) counterintuitively results in a 26 MHz output clock.
> + */
> +
> +#define ZX29_PLL_DISABLE			BIT(31)
> +#define ZX29_PLL_LOCKED				BIT(30)
> +#define ZX29_PLL_LOCK_FILTER			BIT(29)
> +#define ZX29_PLL_DSM_DISABLE			BIT(27)
> +#define ZX29_PLL_PARENT_MASK			GENMASK(26, 25)
> +#define ZX29_PLL_PARENT_SHIFT			25
> +#define ZX29_PLL_BYPASS				BIT(24)
> +#define ZX29_PLL_REFDIV_MASK			GENMASK(23, 18)
> +#define ZX29_PLL_REFDIV_SHIFT			18
> +#define ZX29_PLL_FBDIV_MASK			GENMASK(17, 6)
> +#define ZX29_PLL_FBDIV_SHIFT			6
> +#define ZX29_PLL_POSTDIV1_MASK			GENMASK(5, 3)
> +#define ZX29_PLL_POSTDIV1_SHIFT			3
> +#define ZX29_PLL_POSTDIV2_MASK			GENMASK(2, 0)
> +#define ZX29_PLL_POSTDIV2_SHIFT			0
> +
> +/*
> + * The second register has a 24 bit fractional value, which only matters when ZX29_PLL_DSM_DISABLE
> + * is not set, and only seems to matter for dpll. ZTE's firmware does not make use of the fractional
> + * and it is unimplemented in this driver. Experimental testing confirms that it has an impact on
> + * dpll.
> + *
> + * Bits 27:24 contain more flags:
> + *
> + * Bit 27: Setting ZX29_PLL_DACAP slows down the lock time and obviates the speed gained from
> + *         !DSM_DISABLE. No other effect observed.
> + *
> + * Bit 26: ZX29_PLL_4PHASE_OUT_DISABLE is set on some PLLs on boot but not on others. It is set on
> + *         boot on mpll and upll, but not gpll, dpll or unknownpll. I am not sure what it does
> + *         either. The SDIO devices break if they are fed from gpll with this flag set, but they
> + *         work OK if they are fed from mpll without this flag set.
> + *
> + * Bit 25: ZX29_PLL_POSTDIV_OUT_DISABLE seems to disable the PLL output entirely. Whether it is
> + *         bypassed by PLL_DISABLE differs between PLLs. gpll still produces an output clock if
> + *         PLL_DISABLE = 1 and POSTDIV_DISABLE = 1, but produces no output if PLL_DISABLE = 0 and
> + *         POSTDIV_DISABLE = 1. The dpll feeder ("unknownpll") at 0x100 produces no output clock if
> + *         both PLL_DISABLE and POSTDIV_DISABLE are set to 1.
> + *
> + * Bit 24: ZX29_PLL_VCO_OUT_DISABLE probably disables the output of the VCO clock without
> + *         post-VCO-dividers, but the raw VCO output is not a possible parent of any consumer clock,
> + *         so I could not confirm this. It does not disable the VCO entirely - that's what
> + *         PLL_DISABLE does.
> + *
> + * A spinlock should not be needed. PLLs don't share their registers with anything else and the
> + * global prepare mutex and enable spinlock should be enough. Beware of conflicts in reg2 between
> + * POSTDIV_OUT_DISABLE and the fractional value in case you find out how fractional dividers work
> + * and add support for them.
> + */
> +#define ZX29_PLL_REG2_OFFSET			4
> +#define ZX29_PLL_DACAP				BIT(27)
> +#define ZX29_PLL_4PHASE_OUT_DISABLE		BIT(26)
> +#define ZX29_PLL_POSTDIV_OUT_DISABLE		BIT(25)
> +#define ZX29_PLL_VCO_OUT_DISABLE		BIT(24)
> +#define ZX29_PLL_FRACT				GENMASK(23, 0)
> +
> +/*
> + * The VCO's frequency range is limited. The stock settings run the VCO between 960 and 1248 MHz.
> + * Ad-hoc testing with gpll suggests that at least this PLL remains stable down to about 7 MHz and
> + * up to 2 GHz and produces a clock that can be used by the SDIO controller. Attempting to run the
> + * mpll VCO at 624 MHz and setting postdiv1 = postdiv2 = 1 - which should result in the same output
> + * frequency - or running it at 1872 MHz with an effective post divider of 3 crashes the CPU. Most
> + * likely the PLLs become unstable outside their core range and the SDIO controller is much more
> + * forgiving than CPU and DRAM are.
> + */
> +#define ZX29_PLL_VCO_MAX_FREQ			(1300 * HZ_PER_MHZ)
> +#define ZX29_PLL_VCO_MIN_FREQ			(900 * HZ_PER_MHZ)
> +
> +struct zx29_clk_pll {
> +	struct clk_hw	hw;
> +	struct device	*dev;
> +	struct regmap	*map;
> +	u16		reg;
> +};
> +
> +static inline struct zx29_clk_pll *to_zx29_clk_pll(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct zx29_clk_pll, hw);
> +}
> +
> +static int zx29_pll_is_prepared(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	int res;
> +
> +	res = regmap_test_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +	if (res < 0)
> +		return res;
> +
> +	return !res;
> +}
> +
> +static int zx29_pll_prepare(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	u32 val = 0;
> +	int res;
> +
> +	res = regmap_clear_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +	if (res < 0)
> +		return res;
> +
> +	/* Lock duration is usually between 300 us and 500 us */
> +	res = regmap_read_poll_timeout(pll->map, pll->reg, val, val & ZX29_PLL_LOCKED, 50, 2000);
> +	if (res) {
> +		regmap_set_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +		dev_err(pll->dev, "%s: PLL prepare failed: %d. Config value 0x%08x\n",
> +			clk_hw_get_name(&pll->hw), res, val);
> +	}
> +	return res;
> +}
> +
> +static void zx29_pll_unprepare(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +
> +	regmap_set_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +}
> +
> +static int zx29_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	int res;
> +
> +	res = regmap_test_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
> +			       ZX29_PLL_POSTDIV_OUT_DISABLE);
> +	if (res < 0)
> +		return res;
> +
> +	return !res;
> +}
> +
> +static int zx29_pll_enable(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +
> +	return regmap_clear_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
> +				 ZX29_PLL_POSTDIV_OUT_DISABLE);
> +}
> +
> +static void zx29_pll_disable(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +
> +	regmap_set_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
> +			ZX29_PLL_POSTDIV_OUT_DISABLE);
> +}
> +
> +static unsigned long zx29_pll_get_rate(const struct zx29_clk_pll *pll, unsigned long parent_rate,
> +				       u32 setting)
> +{
> +	unsigned long refdiv, fbdiv, postdiv1, postdiv2, freq;
> +	const char *name = clk_hw_get_name(&pll->hw);
> +	u64 vco;
> +
> +	refdiv = (setting & ZX29_PLL_REFDIV_MASK) >> ZX29_PLL_REFDIV_SHIFT;
> +	fbdiv = (setting & ZX29_PLL_FBDIV_MASK) >> ZX29_PLL_FBDIV_SHIFT;
> +	postdiv1 = (setting & ZX29_PLL_POSTDIV1_MASK) >> ZX29_PLL_POSTDIV1_SHIFT;
> +	postdiv2 = (setting & ZX29_PLL_POSTDIV2_MASK) >> ZX29_PLL_POSTDIV2_SHIFT;

You can use FIELD_GET() + friends to simplify this further.

With those two issues fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

