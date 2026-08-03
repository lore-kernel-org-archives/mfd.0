Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E17368D59
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773033; cv=none; b=AG9995+e9yYwNiglNHCJK5GTdHS+1QQD5MqhnC3iUudE2DCiEOWjmzh266yX9E92RbM9Eq9io6B7PcybCH2xsVCV9LSxRJoZzn/FXLHoOuCI/QAh/4BDTuA9S2UL4zD2d+wWLasf1V/9RRIdcU25nbbJ7WO4zdSgt2RVedXLRVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773033; c=relaxed/simple;
	bh=6jclqOKOhjX9T39epJHDKQCYP1HNUlhp9z3RRJ50uOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NpxHeve+xVeFUuSkb1AAvD5a+3Tmus/egk6irurwxKJ0xP7YBRhnqkGBy/+677L+hqYlcJrSmiwySr0miF8vAkrwKfPlW01l8Eugyg1h2e7+uKSngECDMqmpLyYE5VxCSwXCtrpsFDmRQqIF9cFoerJh23ain21xYUn3FlMdc4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GdRPJuy5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GdRPJuy5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3o05UEgOpPrf4lyr749hyVgnBUqxpDlvn19KzqMCcY=;
	b=GdRPJuy5sy4/2gHcoNv5yFjW6E2tkJpCOg/Zv2f4N84v1glXRPA1QoTCjkAQwCruykRHA4
	RJkAqumcMaUKEf8KCamOTEQIutToqG5AB3w/s0AjbBiQ8W2k5yFNucy/tKST8exMPc+7/S
	o0fw91om6Q6/pgkWPtXpzEseb25BS7g=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-R89GQeGjOe6yNPrGwmo4pg-1; Mon, 03 Aug 2026 12:03:44 -0400
X-MC-Unique: R89GQeGjOe6yNPrGwmo4pg-1
X-Mimecast-MFC-AGG-ID: R89GQeGjOe6yNPrGwmo4pg_1785773023
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81aea53d559so83921157b3.0
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773023; x=1786377823;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3o05UEgOpPrf4lyr749hyVgnBUqxpDlvn19KzqMCcY=;
        b=ass1fnzWeoncazd+5iLQpxklmn3vDxN/PzJwu4wzq/mcn5vyWsZGNczHmetQTDFcET
         QMFVl80zmmua9AfVGadTGHz5gKxcaKQF/IndHnpICNyhE2o/Kjufu9W5Q+dNch6/XhU9
         9iehDvB52JEYUfiO+vICKXRD3qMUwBkxFo/HBJGT8VSyx6cPPe/+wbiD77/9QQkfZ4go
         EFXcftlZGVYj9ikqq7Q/iFpJOObTBCS6mnBGlhMnA2FhzJj5088MHtv8LoeTlXqpHG8I
         5xjur3gVIJuVZQOb92IqBAdx6rvKGoxnpnKbRmhwumuunioCqWvXUD5XDRntvQKjWyvc
         Dtzw==
X-Forwarded-Encrypted: i=1; AHgh+RojcoDUDUsdgaG2K1gyURDwOJRUHZD5eCpZB1keBmausqGTMmfGH2YgRpFC8oxaIneRDZU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yym5hxZBTJylypnpuYQvnnAWPw4zldf/aZGyRc1b14xTUHnYSzu
	jenvYWp1F+0cWrlq5q0o7ovGh3Mg8HTeGqXCMNwmFBlpvi+eTC3Qlquhd5bXBB76Ww/PIm86oXp
	mfFeWRp6NJ9nNK6WPKc+nEycsSQRZLjvQXmGkdERgJsQYVNxhD17ACg==
X-Gm-Gg: AR+sD13XsL33n+qaEbwgbpo/3YKztsUvP265+lW/+anPuIkFTbcs0jac/tk5BjjHukW
	t8hsRvjSQKOyA4aENrfO2avj8+yBFEV7kEr9WPgPMyLfwI7TjAybpwr1Kt3YtNiptKMGaUfIjgp
	jTeiXdoqVsdONy+5I1J0WeYQXgJLxODmoR5JOmm/fq3HTg6Ozdi+LUhwhFkVv7nP/KbBeQs+nG5
	WClw5G5GEVimSz+wPNAweJNuqIIfp9siJVBGJdLZbTBkzJ9DGqwe0SB1sqnABvA5gkwuaEEMDQi
	XLQ241eYDH8MIsx+Ee6KPcWs8G42TOptukB5aC9ebfx5Mu+JlcxjEJsAlTSKMHRNSrorKZu7pje
	mQRDrlGoCENVh0s8U+g6/39cQMpHUVQ8hxyc=
X-Received: by 2002:a05:690c:16:b0:81e:4aa9:d025 with SMTP id 00721157ae682-81fd49f6badmr118627927b3.6.1785773022044;
        Mon, 03 Aug 2026 09:03:42 -0700 (PDT)
X-Received: by 2002:a05:690c:16:b0:81e:4aa9:d025 with SMTP id 00721157ae682-81fd49f6badmr118625467b3.6.1785773019839;
        Mon, 03 Aug 2026 09:03:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf60a76sm57341507b3.13.2026.08.03.09.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:03:38 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:03:36 -0400
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
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anC72Cf1zKcLYWlC@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0V3Hk7-2rdupBYsuiCcRFYIoSGK914gRrR62dgJuKI8_1785773023
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Stefan,

On Sun, Aug 02, 2026 at 11:33:37PM +0300, Stefan Dösinger wrote:
> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Version 9:
> Rework parent matching and clock export control. Most of the changes
> will be in the next patches. The visible change here is that the clock
> array is unified with single clocks having a type rather than one array
> per type.
> 
> Depend on HAS_IOMEM, similarly to Sashiko's flagged issue in the Reset
> patch
> 
> ZX297520V3_CLK_NO_EXPORT is gone again.
> 
> The explicit clock input array and enabling of LSP's pclk is removed
> from the clock driver. The MFD parent takes care of this instead. The
> clock driver does some sanity checking on the static clock data though.
> 
> Version 8:
> Use ZX297520V3_CLK_NO_EXPORT=(~0u) for unexported clocks. While using 0,
> and starting clock indices at 1, is a common pattern in existing
> drivers, it exposes a driver implementation detail in the hardware
> binding interface.
> 
> If desired, I can change the special index to a separate field in the
> structs.
> 
> Fix the return value if the ->init() callback fails. (Sashiko)
> 
> Version 7:
> *) Add fixed dividers to handle PLL subdivisions
> *) Never register PLLs directly as exported clocks - everything on this
> SoC goes through a gate before it leaves a controller.
> 
> Version 6:
> *) Remove auxdev now that LSP clocks also use MFD
> *) Error codepath fixes pointed out by Sashiko.
> 
> Version 5:
> 
> *) Pass the static clk data instead of calling get_match_data to prepare
> for operating as an MFD child.
> 
> *) Don't use devm_kzalloc to allocate the auxiliary_device
> structure. I guess Sashiko is right, and that's what "Because once the
> device is placed on the bus the parent driver can not tell what other
> code may have a reference to this data" is trying to tell me.
> 
> *) Fix error check for device_node_to_regmap.
> ---
>  MAINTAINERS                  |   1 +
>  drivers/clk/Kconfig          |   1 +
>  drivers/clk/Makefile         |   1 +
>  drivers/clk/zte/Kconfig      |  17 ++++
>  drivers/clk/zte/Makefile     |   5 ++
>  drivers/clk/zte/clk-regmap.c |  32 ++++++++
>  drivers/clk/zte/clk-zx.c     | 189 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/zte/clk-zx.h     | 142 ++++++++++++++++++++++++++++++++
>  drivers/clk/zte/pll-zx.c     |  18 +++++
>  9 files changed, 406 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b9f96455bca7..77fa86c671b8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3915,6 +3915,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
>  F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
> +F:	drivers/clk/zte/
>  F:	drivers/mfd/zte-zx297520v3-crm.c
>  F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
>  F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 1717ce75a907..6f0a863951ca 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -545,6 +545,7 @@ source "drivers/clk/uniphier/Kconfig"
>  source "drivers/clk/visconti/Kconfig"
>  source "drivers/clk/x86/Kconfig"
>  source "drivers/clk/xilinx/Kconfig"
> +source "drivers/clk/zte/Kconfig"
>  source "drivers/clk/zynqmp/Kconfig"
>  
>  # Kunit test cases
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 6899e32e14aa..651fe866ddad 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -167,5 +167,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
>  obj-$(CONFIG_X86)			+= x86/
>  endif
>  obj-y					+= xilinx/
> +obj-$(CONFIG_COMMON_CLK_ZTE)		+= zte/
>  obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
>  obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
> diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
> new file mode 100644
> index 000000000000..152c2423b8f0
> --- /dev/null
> +++ b/drivers/clk/zte/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# ZTE Clock Drivers
> +#
> +
> +config COMMON_CLK_ZTE
> +	tristate "Clock driver for ZTE SoCs"
> +	depends on HAS_IOMEM
> +	depends on ARCH_ZTE || COMPILE_TEST
> +	default ARCH_ZTE
> +	select MFD_SYSCON
> +	help
> +	  This option selects common clock infrastructure for ZTE based SoCs.
> +	  You will need to enable one or more SoC specific drivers to make use
> +	  of this.
> +
> +	  Enable this if you are building a kernel for a ZTE designed board.
> diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
> new file mode 100644
> index 000000000000..27db07293165
> --- /dev/null
> +++ b/drivers/clk/zte/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_COMMON_CLK_ZTE) += clk-zte.o
> +
> +clk-zte-y += clk-zx.o pll-zx.o clk-regmap.o
> diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
> new file mode 100644
> index 000000000000..80332dba97f6
> --- /dev/null
> +++ b/drivers/clk/zte/clk-regmap.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 Stefan Dösinger
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/regmap.h>
> +
> +#include "clk-zx.h"
> +
> +struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
> +				    const struct zx_gate_desc *desc,
> +				    struct clk_hw * const *clocks)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
> +				       const struct zx_div_desc *desc,
> +				       struct clk_hw * const *clocks)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
> +				   const struct zx_mux_desc *desc,
> +				   struct clk_hw * const *clocks)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> new file mode 100644
> index 000000000000..27bbafd8ce4d
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan Dösinger
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +
> +#include "clk-zx.h"
> +
> +static struct clk_hw *zx_clk_register_fixed_div(struct device *dev,
> +						const struct zx_fixed_divider_desc *desc,
> +						struct clk_hw * const *clocks)
> +{
> +	const struct zx_parent_desc *p = &desc->parent;
> +
> +	switch (p->type) {
> +	case ZX_PARENT_FW:
> +		return devm_clk_hw_register_fixed_factor_fwname(dev, NULL, desc->name, p->fw_name,
> +								CLK_SET_RATE_PARENT, 1, desc->div);
> +
> +	case ZX_PARENT_ID:
> +		return devm_clk_hw_register_fixed_factor_parent_hw(dev, desc->name, clocks[p->id],
> +								   CLK_SET_RATE_PARENT, 1,
> +								   desc->div);
> +	}
> +	WARN_ON_ONCE(1);
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int zx_clk_validate(struct device *dev, struct device_node *of_node,
> +			   const struct zx_clk_data *data)
> +{
> +	const struct zx_parent_desc *parents;
> +	unsigned int i, p, num_parents;
> +	struct clk *clk;
> +
> +	/*
> +	 * Sanity check: Make sure all parents are there and write a clear message rather than
> +	 * leave potential orphans.
> +	 */

It's not common for clk drivers to have a validate function like this.
That said, I know you are reverse engineering what's in the downstream
BSP without documentation, and there is value in having this. I think
it'd be useful to clarify that in the comments because code usually gets
copied and pasted between drivers over time.

That said, once it's verified that the clock tree is correct, can these
checks be eventually dropped so that this validation logic isn't ran on
every boot?

k
> +	for (i = 0; i < data->num_clocks; ++i) {
> +		switch (data->clocks[i].type) {
> +		case ZX_CLOCK_PLL:
> +			parents = data->clocks[i].pll.parents;
> +			num_parents = data->clocks[i].pll.num_parents;
> +			break;
> +
> +		case ZX_CLOCK_FIXED_DIV:
> +			parents = &data->clocks[i].fixed_div.parent;
> +			num_parents = 1;
> +			break;
> +
> +		case ZX_CLOCK_MUX:
> +			parents = data->clocks[i].mux.parents;
> +			num_parents = data->clocks[i].mux.num_parents;
> +			break;
> +
> +		case ZX_CLOCK_DIV:
> +			parents = &data->clocks[i].div.parent;
> +			num_parents = 1;
> +			break;
> +
> +		case ZX_CLOCK_GATE:
> +			parents = &data->clocks[i].gate.parent;
> +			num_parents = 1;
> +			break;
> +
> +		default:
> +			return dev_err_probe(dev, -EINVAL, "Invalid clock entry %u\n", i);
> +		}
> +
> +		for (p = 0; p < num_parents; ++p) {
> +			switch (parents[p].type) {
> +			case ZX_PARENT_FW:
> +				clk = of_clk_get_by_name(of_node, parents[p].fw_name);
> +				if (IS_ERR(clk))
> +					return dev_err_probe(dev, PTR_ERR(clk),
> +							     "Input clk %s failure\n",
> +							     parents[p].fw_name);
> +				clk_put(clk);
> +				break;
> +
> +			case ZX_PARENT_ID:
> +				if (parents[p].id >= i)
> +					return dev_err_probe(dev, -EINVAL,
> +							     "Clock %u has parent %u\n",
> +							     i, parents[p].id);
> +				break;
> +
> +			default:
> +				return dev_err_probe(dev, -EINVAL,
> +						     "Clock %u has unexpected parent of type %u\n",
> +						     i, parents[p].type);
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
> +			const struct zx_clk_data *data)
> +{
> +	struct clk_hw_onecell_data *exports;
> +	struct clk_hw **clocks;
> +	struct regmap *map;
> +	unsigned int i;
> +	int res;
> +
> +	res = zx_clk_validate(dev, of_node, data);
> +	if (res)
> +		return res;
> +
> +	map = device_node_to_regmap(of_node);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	clocks = devm_kcalloc(dev, data->num_clocks, sizeof(*clocks), GFP_KERNEL);
> +	if (!clocks)
> +		return -ENOMEM;
> +
> +	if (data->init) {
> +		res = data->init(map);
> +		if (res)
> +			return res;
> +	}
> +
> +	for (i = 0; i < data->num_clocks; ++i) {
> +		struct clk_hw *hw;
> +
> +		switch (data->clocks[i].type) {
> +		case ZX_CLOCK_PLL:
> +			hw = zx_clk_register_pll(dev, map, &data->clocks[i].pll, clocks);
> +			break;
> +
> +		case ZX_CLOCK_FIXED_DIV:
> +			hw = zx_clk_register_fixed_div(dev, &data->clocks[i].fixed_div, clocks);
> +			break;
> +
> +		case ZX_CLOCK_MUX:
> +			hw = zx_clk_register_mux(dev, map, &data->clocks[i].mux, clocks);
> +			break;
> +
> +		case ZX_CLOCK_DIV:
> +			hw = zx_clk_register_divider(dev, map, &data->clocks[i].div, clocks);
> +			break;
> +
> +		case ZX_CLOCK_GATE:
> +			hw = zx_clk_register_gate(dev, map, &data->clocks[i].gate, clocks);
> +			break;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		if (IS_ERR(hw))
> +			return dev_err_probe(dev, PTR_ERR(hw), "Failed to register clk %u\n", i);
> +
> +		clocks[i] = hw;
> +	}
> +
> +	exports = devm_kzalloc(dev, struct_size(exports, hws, data->num_exports), GFP_KERNEL);
> +	if (!exports)
> +		return -ENOMEM;
> +	exports->num = data->num_exports;
> +
> +	for (i = 0; i < data->num_exports; ++i) {
> +		if (data->exports[i] >= data->num_clocks)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Export %u points to out of range clock %u\n",
> +					     i, data->exports[i]);
> +
> +		exports->hws[i] = clocks[data->exports[i]];
> +	}
> +
> +	devm_kfree(dev, clocks);
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, exports);
> +}
> +EXPORT_SYMBOL_NS_GPL(zx_clk_common_probe, "ZTE_CLK");
> +
> +MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
> +MODULE_DESCRIPTION("ZTE common clock driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
> new file mode 100644
> index 000000000000..175fbba3e0b3
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Stefan Dösinger
> + */
> +
> +#ifndef __DRV_CLK_ZX_H
> +#define __DRV_CLK_ZX_H
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#define CLK_ZX_PLL_PREPARE_IS_ENABLE	1
> +#define CLK_ZX_MAX_PARENTS		8
> +
> +enum zx_parent_type {
> +	ZX_PARENT_FW,
> +	ZX_PARENT_ID,
> +};
> +
> +struct zx_parent_desc {
> +	enum zx_parent_type		type;
> +	union {
> +		const char		*fw_name;
> +		unsigned int		id;
> +	};
> +};
> +
> +#define PARENT_FW(_name) { .type = ZX_PARENT_FW, .fw_name = (_name) }
> +
> +#define PARENT_ID(_id) { .type = ZX_PARENT_ID, .id = (_id) }
> +
> +static inline struct clk_parent_data zx_get_parent(const struct zx_parent_desc *p,
> +						   struct clk_hw * const *clocks)
> +{
> +	struct clk_parent_data ret = {};
> +
> +	switch (p->type) {
> +	case ZX_PARENT_FW:
> +		ret.fw_name = p->fw_name;
> +		ret.index = -1;
> +		return ret;
> +
> +	case ZX_PARENT_ID:
> +		ret.hw = clocks[p->id];
> +		ret.index = -1;
> +		return ret;
> +	};
> +
> +	WARN_ON_ONCE(1);
> +	return ret;
> +}
> +
> +struct zx_pll_desc {
> +	const char			*name;
> +	const struct zx_parent_desc	*parents;
> +	unsigned int			num_parents;
> +	unsigned long			rate;
> +	u16				reg;
> +	u16				flags;
> +};
> +
> +struct zx_fixed_divider_desc {
> +	const char			*name;
> +	struct zx_parent_desc		parent;
> +	unsigned int			div;
> +};
> +
> +struct zx_mux_desc {
> +	const char			*name;
> +	const struct zx_parent_desc	*parents;
> +	unsigned int			num_parents;
> +	u16				reg;
> +	u8				shift, size;
> +};
> +
> +struct zx_div_desc {
> +	const char			*name;
> +	struct zx_parent_desc		parent;
> +	u16				reg;
> +	u8				shift, size;
> +};
> +
> +struct zx_gate_desc {
> +	const char			*name;
> +	struct zx_parent_desc		parent;
> +	unsigned long			flags;
> +	u16				reg;
> +	u8				shift;
> +};
> +
> +enum zx_clock_type {
> +	ZX_CLOCK_INVALID = 0,
> +	ZX_CLOCK_PLL,
> +	ZX_CLOCK_FIXED_DIV,
> +	ZX_CLOCK_MUX,
> +	ZX_CLOCK_DIV,
> +	ZX_CLOCK_GATE,
> +};
> +
> +struct zx_clock {
> +	enum zx_clock_type type;
> +	union {
> +		struct zx_pll_desc pll;
> +		struct zx_fixed_divider_desc fixed_div;
> +		struct zx_mux_desc mux;
> +		struct zx_div_desc div;
> +		struct zx_gate_desc gate;
> +	};
> +};
> +
> +struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *regmap,
> +				   const struct zx_pll_desc *desc,
> +				   struct clk_hw * const *clocks);
> +struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
> +				   const struct zx_mux_desc *desc,
> +				   struct clk_hw * const *clocks);
> +struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
> +				       const struct zx_div_desc *desc,
> +				       struct clk_hw * const *clocks);
> +struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
> +				    const struct zx_gate_desc *desc,
> +				    struct clk_hw * const *clocks);
> +
> +struct zx_clk_export {
> +	unsigned int priv;
> +	unsigned int binding;
> +};

Sashiko flagged this as unused.

Brian

