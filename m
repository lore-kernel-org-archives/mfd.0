Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4657951C04C;
	Tue, 22 Sep 2026 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074048; cv=none; b=Uni3bBmeEXhewe/OBcwD+T4HRG2qjhyMaXxpFmD7d7ZDMwPEEWf9thS+X/TbMrf8AJist3PDllF8SiD4T+v+Oy+LgX5xjb9mfhRTM8Fw4O9cQnMTh3qnveAEoeD0xhqlF21KBd08stR9y3Jfb4ClrwqvWzWLzFb+uMGmnv9EUEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074048; c=relaxed/simple;
	bh=D4xt0EQqkbQ4QpGr/rWEfLBSlUeslFGA4wmWm+gy+4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BiEjOB0RB1HU99Qor/1UglL1qAnWuJCef8ZNcnR5DIYYaN7jvWkHM2y6ADpAwrS3w6/N32s+mSsiMwnhQXZWp3vcmMstVtvKKIxW0vIDEpdDqUrOTfX7ogRPyXNYALAPQNtCjzKn9DTmy2IFKcAz1YmhvAR7t9c7lC1I22ZqyvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHBegxnm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHBegxnm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9121F000FF;
	Tue, 22 Sep 2026 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074046;
	bh=D4xt0EQqkbQ4QpGr/rWEfLBSlUeslFGA4wmWm+gy+4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GHBegxnmYqFCdMTEazxdAjbs/5mie58S9/aKqW6Y1JsNdqVg88UYFYvhey1/4SMnh
	 9AMUlF9FtY9Ewi4OuAMcRCbDD+pdLNPTzMgBFICHgYU3qf7H0gFT7Az7pZCYx3qHpp
	 XphNhteU0lhlyYPQPKv0Bxlbp6Wy2+90BVaZoE0LD+Mdjlu5Mjxy/Io0B8Y27xjsnm
	 v7Ol2jpDeiVRqP8kUffH9DLXOFPyixbwkME4izv2b6O54Vh1SPh7p4gTYvURVXECWi
	 aHtLFeXag9xxwX1DF916u/6ZzOEBtojKnNReP0c7blfRDfkqGOocU3QEgNwVEtJshW
	 d2KY86qJlOqgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260922103551.2754613-6-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:47:25 +0000
Message-Id: <20260922104726.6A9121F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: driver-specific header placed in global include directory
--

commit 51d204aed0d51828d1e68a0ac0a10f8c8cac311b
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub

This commit adds a regulator driver for the on-die regulators in the NXP
P3H2x4x i3c hub device, registering them via the regulator subsystem using
the MFD framework.

> diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regu=
lator/p3h2840_i3c_hub_regulator.c
> new file mode 100644
> index 0000000000000..244f2a4f70f38
> --- /dev/null
> +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
> @@ -0,0 +1,289 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025-2026 NXP
> + * NXP P3H2X4X regulator driver file contain functions for enable/disabl=
e regulator
> + * and voltage set/get.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/mfd/p3h2840.h>

[Severity: Low]
Does this include violate the MFD subsystem guidelines for driver-specific
headers?=20

The MFD guidelines state that driver-specific header files used only by the
parent and its immediate children should be kept local to drivers/mfd/
rather than being placed in the global include/linux/mfd/ directory. Since
this header appears to only be used by the p3h2840 parent and children,
could it be moved to the local subsystem directory to avoid polluting the
global include space?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922103551.2754=
613-1-lakshay.piplani@nxp.com?part=3D5
