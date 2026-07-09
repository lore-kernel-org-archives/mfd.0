Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D532396D14
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617498; cv=none; b=e8VgF24b1IYIHgjZXWWcaPMEsqeoJ7EJ+sa8DpCqGSdx2gLKZkhWYWMXtUqRnrJmpB18QtvydgNV6MBZ/qJ8nkeGWu69sWpQ33/UmEtGLZIYKxeA6OQNEcEF1Jg4zyW6EAOWsETCCQA1vq61tneux2lW/bZqTGmmN6aExRh8BGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617498; c=relaxed/simple;
	bh=vKiD02uFQx09704sQEDdzQxL8tL6ynOcfa+5DxBvftU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f8Sae7dXnjH45lGq+5UZtIGCeGY6icCbDGGM6FRHEc4/7h+3RiyBPSCiAddIc2mukSCFsFv2pqJ5lAFBpwOMTh3mkhuMHu9Knh4bQaAKfbfzQdk37vqpbxX9YURYzE05Bb9tG+ADcLTwiMERAADQKCZfHCEGe1cTfNg84Mx9OnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QT+jOZm2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QT+jOZm2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1B21F00A3A;
	Thu,  9 Jul 2026 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617497;
	bh=WTN+/dbg70lMK2WhvOAWiKpdTWWaTRXmBsAZxlckC6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QT+jOZm23eNEQzck6WyBPZ6peymxv/icA6Eb2IaA2Btklbmcf5IuSr6RRRfuF5oJz
	 XCpfX/ln5j7R/IGsmLYz40IhEbCOcyFwu3XMp81XDCaZAcRHU84iNMhMa9NzeqOQ5X
	 5yLGs6pUqUkA3ytLprKigx4nMkEUCHI0xME1aosh1FWDR1Dm6zOQV8wAB/gZUXQ5S8
	 97AlI2r1TaR36VLXMl7g1tXjKrrgqSiJPVSs7/4ycQ5A+JQWJZ7XtJWhu/ST48/kwJ
	 cnc2CEX+yd8c/ZWw9siZDMr0ns+HBNmJH+k/Uk36IsJETNX3PmgOoeD5aW+Qlcdyuj
	 X8btB6PI9/9tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 18/23] mfd: Unify style of acpi_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <5b32d03de8e0e3293f625e9886e0ee849ed4e511.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <5b32d03de8e0e3293f625e9886e0ee849ed4e511.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:18:16 +0000
Message-Id: <20260709171816.CF1B21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] MFD subsystem guideline violation: Passing complex pointers throug=
h match data tables.
- [High] MFD subsystem guideline violation: Dynamically building mfd_cell a=
rray on the stack.
- [High] Out-of-bounds read due to using sizeof() on a pointer instead of t=
he struct.
--

--- Patch [18]: [PATCH v3 18/23] mfd: Unify style of acpi_device_id arrays =
---
commit 72f79bce0303bfad96f182c30e01fadb7cbc3793
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Unify style of acpi_device_id arrays

This commit updates various acpi_device_id arrays across MFD drivers to use
a consistent styling. It ensures no comma after the list terminator and a
single space inside the terminator braces.

[ ... ]

> diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
> index 3370a13d581b1..4c1e7a0ab0ee1 100644
> --- a/drivers/mfd/kempld-core.c
> +++ b/drivers/mfd/kempld-core.c
> @@ -440,7 +440,7 @@ static void kempld_remove(struct platform_device *pde=
v)
>  static const struct acpi_device_id kempld_acpi_table[] =3D {
>  	{ .id =3D "KEM0000" },
>  	{ .id =3D "KEM0001" },
> -	{}
> +	{ }
>  };

[Severity: High]
This is a pre-existing issue, but does kempld_register_cells_generic()
dynamically allocate its mfd_cell array on the stack?

drivers/mfd/kempld-core.c:kempld_register_cells_generic() {
    struct mfd_cell devs[KEMPLD_MAX_DEVS] =3D {};
    int i =3D 0;

    if (pld->feature_mask & KEMPLD_FEATURE_BIT_I2C)
        devs[i++].name =3D kempld_dev_names[KEMPLD_I2C];
    ...
}

The MFD subsystem guidelines state that mfd_cell arrays must be static
references. Dynamically allocating these arrays on the stack can lead
to memory safety hazards if the subsystem core retains references.

[Severity: High]
This is another pre-existing issue in this file, but does kempld_probe()
contain an out-of-bounds read?

drivers/mfd/kempld-core.c:kempld_probe() {
    ...
    ret =3D platform_device_add_data(pdev, pdata, sizeof(pdata));
    ...
}

Using sizeof(pdata) evaluates to the size of the pointer rather than the
size of the struct it points to, which can cause an out-of-bounds read
during kmemdup.

[ ... ]

> diff --git a/drivers/mfd/upboard-fpga.c b/drivers/mfd/upboard-fpga.c
> index 6674f4a1d2fe5..37c3c50aa6e47 100644
> --- a/drivers/mfd/upboard-fpga.c
> +++ b/drivers/mfd/upboard-fpga.c
> @@ -302,7 +302,7 @@ static int upboard_fpga_probe(struct platform_device =
*pdev)
>  static const struct acpi_device_id upboard_fpga_acpi_match[] =3D {
>  	{ .id =3D "AANT0F01", .driver_data =3D (kernel_ulong_t)&upboard_up2_fpg=
a_data },
>  	{ .id =3D "AANT0F04", .driver_data =3D (kernel_ulong_t)&upboard_up_fpga=
_data },

[Severity: High]
This isn't a bug introduced by this patch, but does this ACPI match table
violate MFD subsystem guidelines by passing complex pointers in the
.driver_data field?

The guidelines explicitly prohibit passing complex pointers through match
data tables because it can cause memory safety hazards and initialization
ordering races. They recommend storing an enum or integer ID instead.

> -	{}
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, upboard_fpga_acpi_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D18
