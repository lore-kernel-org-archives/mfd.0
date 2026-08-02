Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5361533F8C6;
	Sun,  2 Aug 2026 20:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785703523; cv=none; b=K2oz0D1NC7rdWvi9x7LxB/4eax5woO2jE7lhdNFfSgXkEyuK9eI7kUKARzxjCNn6DbfJJUA+/2Ki+UgbnFoW0E2llUuWFcpW008Z7mpm6CUU+uhdQ42ITcXUo5he5IZMkqBh0uO1M7NP5zDoaT28b+8JagxcytvX9dWxyy6ceug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785703523; c=relaxed/simple;
	bh=/FP6rpzQVvRkl1yE0K7t9u77FbiZ/exOycxhy1ZF5nc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c7THDgS3k4+CCT+ioePd8iLBpFrHZS10AKj4SBUPW8g9WEYvZBrPmPMyG/9RrkDistfVwb91ALFbx34MVOSS4AcjbP1mFR50Lw2rhGQd1rlDNtK0G9x+iGoin/I2T1ZIrQWHw7Iqa0s9g6ZsBNBpeCY/OjItncZO+3gy2x4HTAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoVBFDOd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoVBFDOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5126D1F000E9;
	Sun,  2 Aug 2026 20:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785703517;
	bh=Ska9k1keGD7n27PxzLEF7PrmAwsraD0YY5Ir1wmOqns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VoVBFDOdFYEUgmLi8R4PjLkv30MBNx0uv9RPRgYIpzpy8LrwnvfEtWW1kacvkgva7
	 CPUKf7pWyogJbewdo9HQiAAjNPv2s52t4p0pOJwJarx5VuCH3kGOLvA5ACmzHs4IR/
	 Lcd7Au7N1OR+xO8/omwJMk0m2t/XZ6HTLh79HHqMNYDKBdDrMXeY8D44b5y1TW23Jr
	 tBTCgJxr2I0CycUKOM7+JUH3PD+j/IHYOLG5nIj5qXKr0QnPtVdB0fvbdKfxw/A2q7
	 xsbw8UQiKm1cQ2HkKd/z+FiPzO5aHVNk1/AFFY0vsxapvc7HfNiSCNoijcg6ef1scp
	 qRbtUzDy9neHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, olteanv@gmail.com, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev
In-Reply-To: <20260802-zx29clk-v9-4-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-4-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 20:45:16 +0000
Message-Id: <20260802204517.5126D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Direct cast from `const void *` to an `enum` triggers a `-Wpointer-=
to-int-cast` compiler warning on 64-bit architectures.
- [Low] The Kconfig symbol `MFD_ZTE_ZX297520V3_CRM` lacks an architecture-s=
pecific dependency, unconditionally exposing a highly SoC-specific driver t=
o all architectures.
- [Low] The enum `zx297520v3_mfd_type` includes the string 'mfd', violating=
 the MFD subsystem naming conventions.
--

--- Patch [4]: [PATCH v9 04/12] mfd: zx297520v3: Add a clock and reset MFD =
driver ---
commit 39c5ccee8d6ebff3fee809871f3a8191107ab75b
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

mfd: zx297520v3: Add a clock and reset MFD driver

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 35f6e9b76d056..c0c7e83487f40 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
[ ... ]
> @@ -2572,5 +2572,16 @@ config MFD_MAX7360
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
> =20
> +config MFD_ZTE_ZX297520V3_CRM
> +	tristate "ZTE zx297520v3 Clock and Reset Manager"
> +	select MFD_CORE
> +	default SOC_ZX297520V3

[Severity: Low]
Should this include an architecture dependency, such as
depends on ARCH_ZTE || COMPILE_TEST? Without it, this highly SoC-specific
driver will be presented in the configuration options for all architectures.

> +	help
> +	  Say yes here to enable the driver for the ZTE zx297520v3 clock and
> +	  reset manager MFD driver. This driver provides the host device for
> +	  the clock and reset drivers and is required to boot the SoC. You
> +	  will also need to enable CLK_ZTE_ZX297520V3 and RESET_ZTE_ZX297520V3
> +	  to build the actual clock and reset child drivers.
> +
>  endmenu
>  endif
> diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v=
3-crm.c
> new file mode 100644
> index 0000000000000..37cd0c14680eb
> --- /dev/null
> +++ b/drivers/mfd/zte-zx297520v3-crm.c
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan D=C3=B6singer
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +enum zx297520v3_mfd_type {
> +	ZX297520V3_MFD_INVALID =3D 0,
> +	ZX297520V3_MFD_TOPCRM,
> +	ZX297520V3_MFD_MATRIXCRM,
> +	ZX297520V3_MFD_LSPCRM,
> +};

[Severity: Low]
This isn't a bug, but does including the string mfd in the enum name violate
the MFD subsystem naming conventions? The guidelines suggest avoiding
hard-coding implementation details like mfd in driver, struct, or device
names.

[ ... ]

> +static int zx297520v3_crm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	enum zx297520v3_mfd_type type;
> +	const struct mfd_cell *cells;
> +	struct reset_control *rst;
> +	unsigned int num_cells;
> +	struct clk *pclk;
> +
> +	type =3D (enum zx297520v3_mfd_type)of_device_get_match_data(dev);

[Severity: Low]
Could this direct cast from a const void * pointer to an enum trigger a
-Wpointer-to-int-cast compiler warning on 64-bit architectures? Often an
intermediate cast to uintptr_t or kernel_ulong_t is used to safely preserve
the size before casting to the enum type.

> +	switch (type) {
> +	case ZX297520V3_MFD_TOPCRM:
> +		cells =3D zx297520v3_topcrm_cells;
> +		num_cells =3D ARRAY_SIZE(zx297520v3_topcrm_cells);
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D4
