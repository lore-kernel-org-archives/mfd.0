Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875A3430CD4
	for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246137; cv=none; b=iPK1IdvUm0MkEoT8B+AcG0umarOpgdM7AOKk/vJOxzzY4TyyW+x6LK/tfoIs+tLp1TEnZ//oukD4qNvpFkFM0tLq0fhjx+ECux8hKcmnqBGxb/C0bgOVdFYl7NbMgRAQNQHJjaKy0yl+/0b32iHtOCDKfUQBl6EU2dELX9lrQV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246137; c=relaxed/simple;
	bh=o5hmn0o1eJi1oPcTIaRKtd4EVqB0u40I4yA2PmjGyek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CB0AJl56znwiamcLAUQONHmTXxgwSpggNyPmBcWudPZwW0N7uNLuk8/jpxPhcYRY4JYctn6s0javUm/sfQPuUJV0ek/VWCK5PTFFaOgxyIM+hMvB63mMmoTVzYWkp2NmMt2f7c6G8qWBGkCY9Qbvn6nc+/r20nsBO+h07UgxvAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gzbgq9pX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gzbgq9pX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785246133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkiuYMKfTZUCAQyXJDsyAYrYbc3+oqsrPiHuKHrbdH4=;
	b=Gzbgq9pXtRTUVEbubo49Fge7jRipokeMLlzRmQlS77D5l1HSMH6iut6IQe8yx5+f6nRf6S
	+7qZNOQYKEm1eD9wKQ+rxPnB43RzIX3vMcysJSE79IoCQZ3O3AHu8oVQOcODkfWDPaooRs
	YanHLswsYyapL2ZWPmbZBqa4/Gioyxw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-a7GlYPctOguPXEoyq4I73A-1; Tue, 28 Jul 2026 09:42:12 -0400
X-MC-Unique: a7GlYPctOguPXEoyq4I73A-1
X-Mimecast-MFC-AGG-ID: a7GlYPctOguPXEoyq4I73A_1785246130
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8fdace20927so41822476d6.2
        for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 06:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246130; x=1785850930;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zkiuYMKfTZUCAQyXJDsyAYrYbc3+oqsrPiHuKHrbdH4=;
        b=VM8MZUWV9U3cIQke8Z2JMcjpCeszwehr6nzSwe+eTRzkcxoDVYxAFaKsM2Nu3xFW5f
         0qEh01K5ngS27GSkh3fACAhL8pX4b1Jj0WmkHfU7cIdP9aSe4zsZ+wPr4LeHzooVBTQN
         1YDrWVykXoSluLdWyA8smcY5unULKzDa3yReyWo//5zvVWysinGDaY6agjpDjkKwzZsv
         7z4G7n/1HRJMQZVzqJbeAMXVWEPoCWVjkMZM1ZTt8IRICS2dNnLkOMVkD0NUpR9UzbWu
         O8Fd7aLk3nzga6hA9bjhNAmjMP7+kMDpyBWQLNhI/vYj7c6PXzAv16++P8g29NSGWKy4
         aO0g==
X-Forwarded-Encrypted: i=1; AHgh+RqdjTPA+5kcy8v11/2U24pCjLfFZk5wHR7FiiU1tYPflikFR4DRChsFj8zQJ9RM+cBbJ2Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeGD+7mKR2ru8hoNZSfzJFsyXd90PPx/qlKqspkbvx7EvGVgwq
	67lQrO6+xAWlLi0zJiLeUDVA6YrGZQ5kQN9nCzo2xf2ija/SaqggG+rtcCLlB2Ax2GJ0p9DJjEr
	Ok+BHOWO6cs4Yw2n+LrBUDIdYYrmd/66uV+ndJgQeY8XkJ4738XuUqA==
X-Gm-Gg: AR+sD111Z05S95sGkcbrRt4YoZlyw5kj1jSx7KjzgLAKYDTJiJN8VDQeoPbqd5ssWey
	70m1RFNjBhu7ZK56DQSDp9EqHFwyUKYe3D3zzhTFniOxJoZlolE35XI2l2HaraLD98OGLYgneyL
	pSYoIebuF0cttthfjW1haaHASltAF+KhOYdZWlVeAfJV8Q6CADSLHCJ4QlQZlYTEPh0feyJUcz6
	8KVuCsijlr91iyFX1GdfvPCIswpJWAqJBEEdjv8ym6mgKWvW/Ozr93+dVLxzXDesxLv6ErSCPlM
	0yVKt35ww9zORBO74bYaU7V25lB+CTJVCl/eopSqFATOfoo1EulHF4y0KPDikpSf0I/kylXr/a1
	AwOrws3N0pG5u6ci8Nsko8I1EPemWe+7P5PM=
X-Received: by 2002:a05:6214:5545:b0:8e8:7de7:ec20 with SMTP id 6a1803df08f44-90816f640a7mr25742486d6.4.1785246130266;
        Tue, 28 Jul 2026 06:42:10 -0700 (PDT)
X-Received: by 2002:a05:6214:5545:b0:8e8:7de7:ec20 with SMTP id 6a1803df08f44-90816f640a7mr25741856d6.4.1785246129549;
        Tue, 28 Jul 2026 06:42:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e86d499dsm87767676d6.42.2026.07.28.06.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:42:07 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:42:06 -0400
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
Subject: Re: [PATCH v8 06/12] clk: zte: Add regmap-based clocks
Message-ID: <amixrkffNj_JuXtU@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-6-7a107b00f1dd@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260727-zx29clk-v8-6-7a107b00f1dd@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: awZYwTZBSBaIqr9giCmRKEMBR1epK79vnVuRWaEsArM_1785246130
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jul 27, 2026 at 09:24:21PM +0300, Stefan Dösinger wrote:
> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
> 
> I see that numerous clock drivers have their own incarnation of regmap-
> based mux/div/gate clocks. If there is any version of it that is likely
> to be elevated to shared code like clk-gate.c I'll copy that and try to
> use it as unmodified as possible.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.
> 
> Version 6: Remove stray regmap (Sashiko)
> 
> Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
> ---
>  drivers/clk/zte/clk-regmap.c | 218 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 215 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
> index 984abeb45ab2..671b81bcda4d 100644
> --- a/drivers/clk/zte/clk-regmap.c
> +++ b/drivers/clk/zte/clk-regmap.c
> @@ -7,28 +7,240 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/container_of.h>
>  #include <linux/device.h>
>  #include <linux/regmap.h>
> +#include <linux/types.h>
>  #include <linux/errno.h>
> +#include <linux/bits.h>
> +#include <linux/err.h>
>  
>  #include "clk-zx.h"
>  
> +struct zte_clk_regmap {
> +	struct clk_hw	hw;
> +	struct regmap	*map;
> +	u16		reg;
> +	u8		shift;
> +	u8		size;
> +};
> +
> +static inline struct zte_clk_regmap *to_zte_clk_regmap(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct zte_clk_regmap, hw);
> +}
> +
> +static int zte_clk_regmap_gate_enable(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	return regmap_set_bits(clk->map, clk->reg, BIT(clk->shift));
> +}
> +
> +static void zte_clk_regmap_gate_disable(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	regmap_clear_bits(clk->map, clk->reg, BIT(clk->shift));
> +}
> +
> +static int zte_clk_regmap_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	return regmap_test_bits(clk->map, clk->reg, BIT(clk->shift));
> +}
> +
> +static const struct clk_ops zte_clk_regmap_gate_ops = {
> +	.enable		= zte_clk_regmap_gate_enable,
> +	.disable	= zte_clk_regmap_gate_disable,
> +	.is_enabled	= zte_clk_regmap_gate_is_enabled,
> +};
> +
>  int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
>  			  const struct zx_gate_desc *desc, unsigned int num,
>  			  struct clk_hw_onecell_data *clocks)
>  {
> -	return -ENODEV;
> +	struct zte_clk_regmap *clk;
> +	unsigned int i;
> +	int res;
> +
> +	for (i = 0; i < num; ++i) {
> +		struct clk_init_data init = {};
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		init.name = desc[i].name;
> +		init.ops = &zte_clk_regmap_gate_ops;
> +		init.parent_names = &desc[i].parent;
> +		init.num_parents = 1;
> +		init.flags = CLK_SET_RATE_PARENT | desc[i].flags;
> +		clk->hw.init = &init;
> +		clk->map = regmap;
> +		clk->reg = desc[i].reg;
> +		clk->shift = desc[i].shift;
> +		clk->size = 1;
> +
> +		res = devm_clk_hw_register(dev, &clk->hw);
> +		if (res)
> +			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
> +
> +		if (desc[i].id != ZX297520V3_CLK_NO_EXPORT)
> +			clocks->hws[desc[i].id] = &clk->hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
> +						    unsigned long prate)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(clk->map, clk->reg, &val);
> +	if (ret)
> +		/* Gives a hint that something is wrong */
> +		return 0;
> +
> +	val >>= clk->shift;
> +	val &= clk_div_mask(clk->size);
> +	return divider_recalc_rate(hw, prate, val, NULL, 0, clk->size);

Newline before the return

> +}
> +
> +static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	return divider_determine_rate(hw, req, NULL, clk->size, 0);
> +}
> +
> +static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +				       unsigned long parent_rate)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = (unsigned int)ret << clk->shift;
> +	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
>  }
>  
> +static const struct clk_ops zte_clk_regmap_divider_ops = {
> +	.recalc_rate = zte_clk_regmap_div_recalc_rate,
> +	.determine_rate = zte_clk_regmap_div_determine_rate,
> +	.set_rate = zte_clk_regmap_div_set_rate,
> +};
> +
>  int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
>  			     const struct zx_div_desc *desc, unsigned int num)
>  {
> -	return -ENODEV;
> +	struct zte_clk_regmap *clk;
> +	unsigned int i;
> +	int res;
> +
> +	for (i = 0; i < num; ++i) {
> +		struct clk_init_data init = {};
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		init.name = desc[i].name;
> +		init.ops = &zte_clk_regmap_divider_ops;
> +		init.parent_names = &desc[i].parent;

Use parent_data instead of parent_names

> +		init.num_parents = 1;
> +		init.flags = CLK_SET_RATE_PARENT;
> +		clk->hw.init = &init;
> +		clk->map = regmap;
> +		clk->reg = desc[i].reg;
> +		clk->shift = desc[i].shift;
> +		clk->size = desc[i].size;
> +
> +		res = devm_clk_hw_register(dev, &clk->hw);
> +		if (res)
> +			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
> +	}
> +
> +	return 0;
>  }
>  
> +static u8 zte_clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(clk->map, clk->reg, &val);
> +	if (ret)
> +		return 0xff;
> +
> +	val >>= clk->shift;
> +	val &= GENMASK(clk->size - 1, 0);
> +	return clk_mux_val_to_index(hw, NULL, 0, val);
> +}
> +
> +static int zte_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val = clk_mux_index_to_val(NULL, 0, index);
> +
> +	return regmap_update_bits(clk->map, clk->reg,
> +				  GENMASK(clk->size - 1, 0) << clk->shift,
> +				  val << clk->shift);
> +}
> +
> +static int zte_clk_regmap_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	return clk_mux_determine_rate_flags(hw, req, 0);
> +}
> +
> +static const struct clk_ops zte_clk_regmap_mux_ops = {
> +	.get_parent = zte_clk_regmap_mux_get_parent,
> +	.set_parent = zte_clk_regmap_mux_set_parent,
> +	.determine_rate = zte_clk_regmap_mux_determine_rate,
> +};
> +
>  int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
>  			  const struct zx_mux_desc *desc, unsigned int num,
>  			  struct clk_hw_onecell_data *clocks)
>  {
> -	return -ENODEV;
> +	struct zte_clk_regmap *clk;
> +	unsigned int i;
> +	int res;
> +
> +	for (i = 0; i < num; ++i) {
> +		struct clk_init_data init = {};
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		init.name = desc[i].name;
> +		init.ops = &zte_clk_regmap_mux_ops;
> +		init.parent_names = desc[i].parents;

Use parent_data instead of parent_names

Brian

