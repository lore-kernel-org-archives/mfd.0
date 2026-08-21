Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242F37C11C
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 08:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299476; cv=none; b=XgBsLPkdik1oK7QDG95aPuqiopCRiAqW2rERbgHb+AYq3SSOTV6J3gWFtZK+c/9qR+/SkH1F9tBb3PO6joefFgpPIMFbqq9KyadOv0kNg7PgZ2WVE27GGNXbfUEUsJ45xlYBcafFrh0z3zG1zKMVWIcHTqXeFmyNbzJzSDDPkAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299476; c=relaxed/simple;
	bh=tlmDHUeqmiSjduFkndWnVxjBkTBaudYbsBKxAK7j6D8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u8gacLoRCKtvkKqhuuozxQtcNs93aClY8OIcUqLXTto/XP+I2RxQ3EI1mR9passFE/MlH1Oqj7DJv0lI2YourEydUJanXovpTjkHxV0tDLCBGIlEl/rgsfmlaHtfIalzx5VOc6ENq1YKPlkuhGNkDQm7FzLF7aTXwWsakZy7XhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eL+5R7Q+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eL+5R7Q+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F861F000E9;
	Fri, 21 Aug 2026 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787299472;
	bh=PTy/BxVOMLfIsvFLXie+L83W8BFD9i1UugMHMm2ZNRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eL+5R7Q+zGom+k347PAexJVWVEGtwfFbgvDj/Le8ZZPqhi0acANrsMnDHlWr1EdEl
	 Tnx9DSmIJqweYygXKUZA0Q/fzk8MTtoDlbK9cN0+OXK53NkKOFPzdZN/8mArnytXPF
	 haphvl2UOLDUvUeycpKS8MGw9kr3EFL/UFjqhoDWJk+T3pziSCfdQA8YGCQo4R5BsX
	 HHmuaOc3KicNBtV00oVomWrlurXTcd+UxH2d94sFRpTvMz1BOGwgOE4Tv9WVCy4vBX
	 uRWQXz3BfZdt4gUMUgWcs02c+DxuljujGDIwFJLT8HKsAXxrnDF95TIUg/TGbH7+Ds
	 AvBxxHEbXV2ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mfd: tps65217: Check return value when masking
 interrupt sources
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821075331.131315-3-r.zhambakiev@prosoftsystems.ru>
References: <20260821075331.131315-1-r.zhambakiev@prosoftsystems.ru>
 <20260821075331.131315-3-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 08:04:31 +0000
Message-Id: <20260821080431.E2F861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The irq_domain created with `irq_domain_create_linear()` is perman=
ently leaked and causes a Use-After-Free on probe error paths.
- [High] `tps65217_remove` unconditionally unmaps IRQs and removes a potent=
ially NULL `irq_domain`, which leads to a kernel crash and unintended unmap=
ping of interrupts.
- [High] Race condition in the driver remove path between IRQ handler execu=
tion and devres IRQ destruction.
- [High] Unprotected read-modify-write sequence in `tps65217_update_bits()`=
 leads to concurrent register clobbering.
- [High] Global MFD cell array `tps65217s` is dynamically modified in probe=
, violating MFD subsystem rules and causing cross-device state corruption.
- [High] Potential NULL pointer dereference passing 0 to `handle_nested_irq=
()` if an unmapped interrupt fires.
- [Medium] Exporting bespoke accessors and helper functions from the parent=
 MFD driver for child devices.
- [Medium] Child driver stores devm-managed allocations in the shared paren=
t MFD structure, risking use-after-free.
- [Medium] Unbalanced `enable_irq_wake()` call leaves the IRQ wake count pe=
rmanently elevated.
--

--- Patch [2]: [PATCH 2/2] mfd: tps65217: Check return value when masking i=
nterrupt sources ---
commit e10be08c9a9bd32edea69f81193bf8c5fe853293
Author: =D0=96=D0=B0=D0=BC=D0=B1=D0=B0=D0=BA=D0=B8=D0=B5=D0=B2 =D0=A0=D0=B0=
=D0=B4=D0=B8=D0=B9 =D0=A0=D0=B8=D0=BA=D0=B0=D1=80=D0=B4=D0=B8=D0=BD=D0=BE=
=D0=B2=D0=B8=D1=87 <r.zhambakiev@prosoftsystems.ru>
Subject: mfd: tps65217: Check return value when masking interrupt sources

This commit adds a return value check to tps65217_set_bits() in
tps65217_irq_init(). If the register write fails, it now propagates the err=
or
to the caller to prevent the software mask from going out of sync with the
hardware.

> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index 2d04d9e0ae29c..9a1528456ffc2 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -155,8 +155,13 @@ static int tps65217_irq_init(struct tps65217 *tps, i=
nt irq)
> =20
>  	/* Mask all interrupt sources */
>  	tps->irq_mask =3D TPS65217_INT_MASK;
> -	tps65217_set_bits(tps, TPS65217_REG_INT, TPS65217_INT_MASK,
> -			  TPS65217_INT_MASK, TPS65217_PROTECT_NONE);
> +	ret =3D tps65217_set_bits(tps, TPS65217_REG_INT, TPS65217_INT_MASK,
> +				TPS65217_INT_MASK, TPS65217_PROTECT_NONE);
> +	if (ret) {
> +		dev_err(tps->dev, "Failed to mask interrupt sources: %d\n",
> +			ret);
> +		return ret;
> +	}
> =20
>  	tps->irq_domain =3D irq_domain_create_linear(dev_fwnode(tps->dev), TPS6=
5217_NUM_IRQ,
>  						   &tps65217_irq_domain_ops, tps);

[Severity: High]
This isn't a regression introduced by this patch, but does this create a
permanently leaked irq_domain on probe error paths?

If a subsequent step in tps65217_irq_init() or tps65217_probe() fails, the
function returns an error without calling irq_domain_remove().

The devm-managed tps structure is automatically freed, leaving the globally
registered irq_domain with its host_data pointing to freed memory. Accessing
this domain would then trigger a use-after-free.

For example, in tps65217_probe():

drivers/mfd/tps65217.c:tps65217_probe() {
...
	ret =3D devm_mfd_add_devices(tps->dev, -1, tps65217s,
				   ARRAY_SIZE(tps65217s), NULL, 0,
				   tps->irq_domain);
	if (ret < 0) {
		dev_err(tps->dev, "mfd_add_devices failed: %d\n", ret);
		return ret;
	}
...
}

[Severity: High]
This isn't a regression introduced by this patch, but does tps65217_remove()
unconditionally unmap IRQs and remove a potentially NULL irq_domain?

drivers/mfd/tps65217.c:tps65217_remove() {
...
	for (i =3D 0; i < TPS65217_NUM_IRQ; i++) {
		virq =3D irq_find_mapping(tps->irq_domain, i);
		if (virq)
			irq_dispose_mapping(virq);
	}

	irq_domain_remove(tps->irq_domain);
...
}

If the device is probed without an interrupt, tps65217_irq_init() is not ca=
lled
and tps->irq_domain remains NULL. Unbinding the driver unconditionally trig=
gers
tps65217_remove().

The loop then calls irq_find_mapping(NULL, i), searching the system's
irq_default_domain and inadvertently unmapping interrupts from other device=
s.

It then calls irq_domain_remove(NULL), which dereferences the NULL pointer =
and
triggers a kernel panic.

[Severity: High]
This isn't a regression introduced by this patch, but is there a race condi=
tion
in the driver remove path between IRQ handler execution and devres IRQ
destruction?

drivers/mfd/tps65217.c:tps65217_remove() {
...
	irq_domain_remove(tps->irq_domain);
	tps->irq_domain =3D NULL;
...
}

The driver uses devm_request_threaded_irq(), meaning the hardware IRQ is ke=
pt
active until devres unwinds it after remove() completes.

tps65217_remove() manually destroys tps->irq_domain and sets it to NULL.

If an interrupt fires in the window between irq_domain_remove() and devres
cleanup, the active thread will execute
handle_nested_irq(irq_find_mapping(NULL, i)), which can cause system crashe=
s.

[Severity: High]
This isn't a regression introduced by this patch, but does the unprotected
read-modify-write sequence in tps65217_update_bits() lead to concurrent
register clobbering?

drivers/mfd/tps65217.c:tps65217_update_bits() {
...
	ret =3D tps65217_reg_read(tps, reg, &data);
...
	data &=3D ~mask;
	data |=3D val & mask;

	ret =3D tps65217_reg_write(tps, reg, data, level);
...
}

tps65217_update_bits() executes unlocked, independent tps65217_reg_read() a=
nd
tps65217_reg_write() calls.

This PMIC serves multiple child devices that can be accessed concurrently.

Concurrent updates could interleave the read-modify-write sequences, silent=
ly
clobbering register writes and putting the hardware into an invalid state.

[Severity: High]
This isn't a regression introduced by this patch, but does modifying the gl=
obal
MFD cell array tps65217s in the probe function violate MFD subsystem rules =
and
cause cross-device state corruption?

drivers/mfd/tps65217.c:tps65217_probe() {
...
	if (client->irq > 0) {
		tps65217_irq_init(tps, client->irq);
	} else {
		for (i =3D 0; i < ARRAY_SIZE(tps65217s); i++)
			tps65217s[i].num_resources =3D 0;
	}
...
}

MFD guidelines demand that mfd_cell arrays be static const.

If the probed device lacks an IRQ, tps65217_probe() permanently mutates the
global static tps65217s array by setting num_resources =3D 0.

This corrupts the array definition globally, breaking IRQ functionality for=
 any
other PMIC instances on the same system or upon rebinding.

[Severity: High]
This isn't a regression introduced by this patch, but is there a potential =
NULL
pointer dereference if an unmapped interrupt fires?

drivers/mfd/tps65217.c:tps65217_irq_thread() {
...
		if (status & BIT(i)) {
			handle_nested_irq(irq_find_mapping(tps->irq_domain, i));
			handled =3D true;
		}
...
}

tps65217_irq_thread() blindly feeds the output of irq_find_mapping() into
handle_nested_irq().

If a spurious or unmapped interrupt fires, irq_find_mapping() returns 0.

Passing 0 to handle_nested_irq() improperly resolves to IRQ 0's descriptor,
causing data corruption or panics.

[Severity: Medium]
This isn't a regression introduced by this patch, but does exporting bespoke
accessors and helper functions bypass the standard API usage enforced by MFD
rules?

drivers/mfd/tps65217.c:tps65217_set_bits() {
	return tps65217_update_bits(tps, reg, mask, val, level);
}
EXPORT_SYMBOL_GPL(tps65217_set_bits);

MFD guidelines strictly dictate avoiding writing bespoke accessors or helper
functions in the parent to pass state to child devices.

The parent driver exports functions like tps65217_set_bits exclusively for =
its
children. This violates MFD architectural layering, creating tightly couple=
d,
non-reusable drivers.

[Severity: Medium]
This isn't a regression introduced by this patch, but does the child driver
store devm-managed allocations in the shared parent MFD structure, risking a
use-after-free?

drivers/regulator/tps65217-regulator.c:tps65217_regulator_probe() {
...
	tps->strobes =3D devm_kcalloc(&pdev->dev,
				    TPS65217_NUM_REGULATOR, sizeof(u8),
				    GFP_KERNEL);
...
}

The child driver allocates strobes memory using devm_kcalloc(&pdev->dev...),
and incorrectly stores this pointer directly into the shared parent structu=
re
tps->strobes.

If the child driver is unbound, devres automatically frees the memory, leav=
ing
a dangling pointer in the parent's structure which violates MFD lifecycle
boundaries.

[Severity: Medium]
This isn't a regression introduced by this patch, but does the unbalanced
enable_irq_wake() call leave the IRQ wake count permanently elevated?

drivers/mfd/tps65217.c:tps65217_irq_init() {
...
	enable_irq_wake(irq);

	return 0;
}

tps65217_irq_init() calls enable_irq_wake(irq) on success.

There is no corresponding disable_irq_wake(irq) in the teardown path
(tps65217_remove()) or in probe error paths.

If the driver is unloaded, the wake count remains incorrectly elevated, whi=
ch
can cause resource imbalance warnings or wake management issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821075331.1313=
15-1-r.zhambakiev@prosoftsystems.ru?part=3D2
