Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E7525A2DD
	for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246805; cv=none; b=RACsGZ/I4ndecLv4hMm0C/Sp51KviZz7tUDehCYq9bMSvyJ0SF3KIc5iDdoVWJqyoUWC+gHbvzuCF+ZZnTjPeNfKqYySTksshw/bxChSlZzIukJU0X4wN93LT69SSr/uq+aYZBYXcoRPl1jWJbOq1kt3GzuoJug7qWHK1FoF4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246805; c=relaxed/simple;
	bh=booNWem5jjk6LeJxFoDH8LK148KoZb2X4BN0cVG14/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=K4OMXVPtXV5S3/OuqKQgiJm1+JEFuoOQyzYO7wyzZ7oEU2e3810NuVKdZR2EdmbbD13Q6UVHN93lJlYULSRoh4t73gIg6hOEuiVXZ1vmY8GxQyG258G62OLfUyHnH6uWJQ1knFthld7IQ806F7KjreK2HZeNHDE1uPqqTcmd41k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cGfsj+fA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cGfsj+fA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785246803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57/s/XNhO9Wt95H/WMpqEA5nKekp47X7yp5AMK8PfyU=;
	b=cGfsj+fAHrzLbbm3mk5ju02wbaeWyh0DKWriXjhekuJcdFs22jss1l91HS2XFQr0yjoXWI
	Eqm00PoNAAq2vte+YqFV+jSTs2WXzNxB/6SNsG5VDPpVNHnSLpVD5uY0ksoD+1fupkF9sO
	XzUVP8Jzmk6niztIuykZx0/MpOruc50=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-QLi67bGMOB69yZWwXMkEDw-1; Tue, 28 Jul 2026 09:53:21 -0400
X-MC-Unique: QLi67bGMOB69yZWwXMkEDw-1
X-Mimecast-MFC-AGG-ID: QLi67bGMOB69yZWwXMkEDw_1785246801
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8db414c7so57384211cf.0
        for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 06:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246801; x=1785851601;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=57/s/XNhO9Wt95H/WMpqEA5nKekp47X7yp5AMK8PfyU=;
        b=CzEAOBPjH9R6GHXq1wKSGH897J04ya4j5ZUzDfz2NbbO8LNOOVe9KdfzxRF53jFxlH
         u+AABPIAgTSo2tu90OzYFBHUfIcUOh8a1wECi+xixP54xNUERMfcyzAcKtGSSEbjCqzp
         VGo6JPPK45cKMMTAEJ9OfQuTq0JlsbsbaBpvOH8NPtN2e03LxO2CPT/1aVTLywTx956V
         O9cXxZPvQnQPnk22EMwHSGbQ3LMemZCTn6EpTkI1dHup9nXiemyRyj8sNE9Wm1oFdMN+
         o3sR2vwci7YhFlw+nGNzKXzw5LcFQK4/NraUNIlqf6pyPvZWU8Jytl/5ZBj9ajst5PHg
         jdMA==
X-Forwarded-Encrypted: i=1; AHgh+RpqPcWkwq2ivbDwVJK8W0ebReNOXZg//biOfQeXKxI29DvIevEUb+fBOTMobdm9pFzIYxs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKU6g0R3ISXhEeNc7VRr8PJvVyfvcefa8A97O1cIUCpf44AvAN
	m+l+vnisxMCGUVwQwsM4KdNwRb/XIjumvDZpgyxFm69XaBxuqQKAZSrwoyz+ByHQUSsUeIjOfH6
	7vauIgLUlW5pUSOBmDrvF8dVz5i2eWpPcK8WMZtjN1/2IhMU7QwYvcw==
X-Gm-Gg: AR+sD13xpmu0ZgcntbrbbngJt+GifqoZTD++i6y9/oAkT8xDue0BWqMWkcfPFMdql3o
	/m6eAnjCNgxdr0H3OtxEYfC5c4lxiZEn8HutUCZroVnsCYBsMZtAXXg8FttORGUEnLXBGR68qQ+
	l+SHXJQbHRc7/ygI7J46RszaA34aeyZ7FTqGrWMsHq8OK+jOYs+6YMvGwZCYO/JRSDoYEiwdPd9
	fHi1u5KosKfmc9puPfkI1qOuFHVRhPNMj4lhEmZpkJt15jQ0IlWZ5lYiG792ell7HiW6rMzs9GA
	fuFDQqMmOegX0435yjy1ll877iDOmd+xO8hOey7e8fS3LiOTCAuiB1VBQ+G5Isv0+j/LpJSw+fd
	okDay3NCcxtVpwopUNQ/XQFiHhIbL9bOGh14=
X-Received: by 2002:a05:622a:192a:b0:51c:c67:2042 with SMTP id d75a77b69052e-529d71da27dmr20270811cf.53.1785246800554;
        Tue, 28 Jul 2026 06:53:20 -0700 (PDT)
X-Received: by 2002:a05:622a:192a:b0:51c:c67:2042 with SMTP id d75a77b69052e-529d71da27dmr20270051cf.53.1785246799669;
        Tue, 28 Jul 2026 06:53:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a2989b0bsm73997611cf.16.2026.07.28.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:53:18 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:53:17 -0400
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
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <ami0TaY84IslWZyo@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-5-7a107b00f1dd@gmail.com>
 <amiw7mfPfSPjLHLH@redhat.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <amiw7mfPfSPjLHLH@redhat.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BBZximd9aurRuNwpdSINv4ZuzZTKbos1taaAunDLx-s_1785246801
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Stefan,

On Tue, Jul 28, 2026 at 09:38:54AM -0400, Brian Masney wrote:
> On Mon, Jul 27, 2026 at 09:24:20PM +0300, Stefan Dösinger wrote:
> > The next patches will implement the regmap clocks and PLL driver. The
> > actual hardware specific clock listing will live in a separate module.
> > 
> > Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> > 
> > ---
> > 
> > Version 8:
> > Use ZX297520V3_CLK_NO_EXPORT=(~0u) for unexported clocks. While using 0,
> > and starting clock indices at 1, is a common pattern in existing
> > drivers, it exposes a driver implementation detail in the hardware
> > binding interface.
> > 
> > If desired, I can change the special index to a separate field in the
> > structs.
> > 
> > Fix the return value if the ->init() callback fails. (Sashiko)
> > 
> > Version 7:
> > *) Add fixed dividers to handle PLL subdivisions
> > *) Never register PLLs directly as exported clocks - everything on this
> > SoC goes through a gate before it leaves a controller.
> > 
> > Version 6:
> > *) Remove auxdev now that LSP clocks also use MFD
> > *) Error codepath fixes pointed out by Sashiko.
> > 
> > Version 5:
> > 
> > *) Pass the static clk data instead of calling get_match_data to prepare
> > for operating as an MFD child.
> > 
> > *) Don't use devm_kzalloc to allocate the auxiliary_device
> > structure. I guess Sashiko is right, and that's what "Because once the
> > device is placed on the bus the parent driver can not tell what other
> > code may have a reference to this data" is trying to tell me.
> > 
> > *) Fix error check for device_node_to_regmap.
> > ---
> >  MAINTAINERS                  |   1 +
> >  drivers/clk/Kconfig          |   1 +
> >  drivers/clk/Makefile         |   1 +
> >  drivers/clk/zte/Kconfig      |  16 +++++
> >  drivers/clk/zte/Makefile     |   5 ++
> >  drivers/clk/zte/clk-regmap.c |  34 ++++++++++
> >  drivers/clk/zte/clk-zx.c     | 155 +++++++++++++++++++++++++++++++++++++++++++
> >  drivers/clk/zte/clk-zx.h     |  91 +++++++++++++++++++++++++
> >  drivers/clk/zte/pll-zx.c     |  16 +++++
> >  9 files changed, 320 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b04e9d43cfb0..692f005cb2c4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3883,6 +3883,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
> >  F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
> >  F:	arch/arm/boot/dts/zte/
> >  F:	arch/arm/mach-zte/
> > +F:	drivers/clk/zte/
> >  F:	drivers/mfd/zte-zx297520v3-crm.c
> >  F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
> >  F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 1717ce75a907..6f0a863951ca 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -545,6 +545,7 @@ source "drivers/clk/uniphier/Kconfig"
> >  source "drivers/clk/visconti/Kconfig"
> >  source "drivers/clk/x86/Kconfig"
> >  source "drivers/clk/xilinx/Kconfig"
> > +source "drivers/clk/zte/Kconfig"
> >  source "drivers/clk/zynqmp/Kconfig"
> >  
> >  # Kunit test cases
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index cc108a75a900..13a5478f1112 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -167,5 +167,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
> >  obj-$(CONFIG_X86)			+= x86/
> >  endif
> >  obj-y					+= xilinx/
> > +obj-$(CONFIG_COMMON_CLK_ZTE)		+= zte/
> >  obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
> >  obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
> > diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
> > new file mode 100644
> > index 000000000000..0222549dd211
> > --- /dev/null
> > +++ b/drivers/clk/zte/Kconfig
> > @@ -0,0 +1,16 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# ZTE Clock Drivers
> > +#
> > +
> > +config COMMON_CLK_ZTE
> > +	tristate "Clock driver for ZTE SoCs"
> > +	depends on ARCH_ZTE || COMPILE_TEST
> > +	default ARCH_ZTE
> > +	select MFD_SYSCON
> > +	help
> > +	  This option selects common clock infrastructure for ZTE based SoCs.
> > +	  You will need to enable one or more SoC specific drivers to make use
> > +	  of this.
> > +
> > +	  Enable this if you are building a kernel for a ZTE designed board.
> > diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
> > new file mode 100644
> > index 000000000000..27db07293165
> > --- /dev/null
> > +++ b/drivers/clk/zte/Makefile
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +obj-$(CONFIG_COMMON_CLK_ZTE) += clk-zte.o
> > +
> > +clk-zte-y += clk-zx.o pll-zx.o clk-regmap.o
> > diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
> > new file mode 100644
> > index 000000000000..984abeb45ab2
> > --- /dev/null
> > +++ b/drivers/clk/zte/clk-regmap.c
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2014 MediaTek Inc.
> > + * Copyright (c) 2018 BayLibre, SAS.
> > + * Copyright (c) 2026 Stefan Dösinger.
> > + * Author: Stefan Dösinger <stefandoesinger@gmail.com>
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/errno.h>
> 
> Sort the headers.
> 
> > +
> > +#include "clk-zx.h"
> > +
> > +int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
> > +			  const struct zx_gate_desc *desc, unsigned int num,
> > +			  struct clk_hw_onecell_data *clocks)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> > +int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
> > +			     const struct zx_div_desc *desc, unsigned int num)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> > +int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
> > +			  const struct zx_mux_desc *desc, unsigned int num,
> > +			  struct clk_hw_onecell_data *clocks)
> > +{
> > +	return -ENODEV;
> > +}
> > diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> > new file mode 100644
> > index 000000000000..c9e9048d3ade
> > --- /dev/null
> > +++ b/drivers/clk/zte/clk-zx.c
> > @@ -0,0 +1,155 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2026 Stefan Dösinger
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/errno.h>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> 
> Also sort the headers.
> 
> > +
> > +#include "clk-zx.h"
> > +
> > +static int zx_clk_register_fixed_dividers(struct device *dev, struct regmap *regmap,
> > +					  const struct zx_fixed_divider_desc *desc,
> > +					  unsigned int num)
> > +{
> > +	struct clk_hw *clk;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < num; ++i) {
> > +		clk = devm_clk_hw_register_fixed_factor(dev, desc[i].name, desc[i].parent,
> > +							CLK_SET_RATE_PARENT, 1, desc[i].div);
> > +		if (IS_ERR(clk)) {
> 
> The { } is not needed here.
> 
> > +			return dev_err_probe(dev, PTR_ERR(clk), "Failed to register clk %s\n",
> > +					     desc[i].name);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void zx_delete_clk_provider(void *data)
> > +{
> > +	of_clk_del_provider(data);
> > +}
> > +
> > +static void zx_clk_disable_unprepare_put(void *data)
> > +{
> > +	clk_disable_unprepare(data);
> > +	clk_put(data);
> > +}
> > +
> > +int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
> > +			const struct zx_clk_data *data)
> > +{
> > +	unsigned int public_clk_count = 0, highest_id = 0;
> > +	struct clk_hw_onecell_data *clocks;
> > +	struct regmap *map;
> > +	struct clk *clk;
> > +	unsigned int i;
> > +	int res;
> > +
> > +	map = device_node_to_regmap(of_node);
> > +	if (IS_ERR(map))
> > +		return PTR_ERR(map);
> > +
> > +	for (i = 0; i < data->num_muxes; ++i) {
> > +		if (data->muxes[i].id != ZX297520V3_CLK_NO_EXPORT) {
> > +			if (data->muxes[i].id > highest_id)
> > +				highest_id = data->muxes[i].id;
> > +			public_clk_count++;
> > +		}
> > +	}
> > +	for (i = 0; i < data->num_gates; ++i) {
> > +		if (data->gates[i].id != ZX297520V3_CLK_NO_EXPORT) {
> > +			if (data->gates[i].id > highest_id)
> > +				highest_id = data->gates[i].id;
> > +			public_clk_count++;
> > +		}
> > +	}
> > +
> > +	if (WARN_ON(public_clk_count != highest_id + 1))
> > +		return -EINVAL;
> > +
> > +	clocks = devm_kzalloc(dev, struct_size(clocks, hws, public_clk_count), GFP_KERNEL);
> > +	if (!clocks)
> > +		return -ENOMEM;
> > +	clocks->num = public_clk_count;
> > +
> > +	for (i = 0; i < data->num_inputs_enable; ++i) {
> > +		clk = of_clk_get_by_name(of_node, data->inputs_enable[i]);
> > +		if (IS_ERR(clk)) {
> > +			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
> > +					     data->inputs_enable[i]);
> > +		}
> > +
> > +		res = clk_prepare_enable(clk);
> > +		if (res) {
> > +			clk_put(clk);
> > +			return dev_err_probe(dev, res, "Input clk %s enable failure\n",
> > +					     data->inputs_enable[i]);
> > +		}
> > +		res = devm_add_action_or_reset(dev, zx_clk_disable_unprepare_put, clk);
> > +		if (res)
> > +			return res;
> > +	}
> > +	for (i = 0; i < data->num_inputs; ++i) {
> > +		/* FIXME: devm_get_clk_from_child doesn't do any tree traversal, so it works here
> > +		 * whether "of_node" belongs to "dev" or a parent of "dev". Is it supposed to be
> > +		 * used that way though?
> > +		 */
> > +		clk = devm_get_clk_from_child(dev, of_node, data->inputs[i]);
> 
> I don't know the intention of the original function without digging into
> the history. Can you just use of_clk_get_by_name(of_node, data->inputs[i])
> like you do in the for loop above for consistency?

Looking into the other patches. There's more mixing of the clk provider
calling the clk consumer APIs here. It looks like this just takes a
reference and holds them. Would moving to parent_data address this?

Brian

