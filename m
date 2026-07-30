Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4818E443E4A
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431659; cv=none; b=YRIWsE2RSRQV7u/oHltTOVgQKfwMKn1sfJGwsTtudJSa0ZT3WBV0imiMyXd0P/CvhXVys6Ks0jAtnYvD3WE8sjgBbGaMoOmyCxX8yLN2E+ULWHLXdGslZp+KEdnlRFTwQk0YZsXO+LrgApG/jDsyuWHAv2hsQbUo0NAyuLlUADc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431659; c=relaxed/simple;
	bh=jTFN96m7cg8A15j7bcSUiU9MT9GgpwBDyhaFtdjKBAU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fYABesCq72xv/uP0NAv89XB42GWkmqiQHfuuDKH+HJyy5JOIwiziVnBSZKfTMvQXp5epQlQUQUqlrI4BTIrB8kvLV4oQyzzApwDzhPUNVAOJO8iw+d4hQ7dgNCzQCW+5/VQKcEvY09smrZ9T0PvtgSbAld56oGRs9fk4iOW3JNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLUtwgt/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLUtwgt/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB49F1F000E9;
	Thu, 30 Jul 2026 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785431657;
	bh=aqQZe+THOGO8zXVNC20Uk7oATB4XCCZyBrgkA4ayyp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DLUtwgt/uZf/eFmt2wjj5XS3a150idHA/4vfVCI9YF37M5YAidtpqr/AaAq3t9kuP
	 qiEYeSijpcB+5s4pyV/EEsUuGv3x8n9HzU2ih5CR9br0PwFX9ojL/SEo0j7FyW2IAH
	 cnv+lcebEeWcRlSzmJVKG5Bi3J+bjwMrAUUM38OE8LQcv4DBzl12fm6ZaJwzIBQrMn
	 JKV4B2e4HJF1YhvgLGkbn4JRwTFutAoTuc2sOp8D6PScZkUQqayqE+TSiWx196AAw6
	 CYzb7lZKAfRttnvGiCjz26YLcFc1zJm6vP7uvGS0o4qHlIOK+8s5DG0Mly0A62FMAa
	 vZUQCT/xVaO5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 3/7] mfd: ls2kbmc: Redraw using exported
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260731-ls2kbmc-mod-v4-3-d201502ba239@gmail.com>
References: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
 <20260731-ls2kbmc-mod-v4-3-d201502ba239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 17:14:17 +0000
Message-Id: <20260730171417.BB49F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The global static `mfd_cell` array is dynamically mutated with a s=
tack pointer, violating MFD rules and introducing a data race.
- [High] The `bmc_reset_work` workqueue item is never canceled on driver un=
bind, leading to a Use-After-Free.
- [High] `acpi_unregister_gsi()` is unconditionally called immediately afte=
r successfully requesting the GPIO IRQ, destroying the mapping.
- [High] The workqueue ignores the failure of PCI-E recovery and proceeds t=
o update the screen unconditionally, which can cause a kernel crash.
- [Medium] Untrusted resolution parameters read from the BMC PCI memory can=
 cause an integer overflow when calculating the framebuffer stride.
--

--- Patch [3]: [PATCH RFC v4 3/7] mfd: ls2kbmc: Redraw using exported funct=
ions ---
commit 8920bccc1429d53315723d84c6b17a6efd535a5b
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Redraw using exported functions
   =20
Use update_screen, i.e. redraw_screen() to trigger the redraw of the
current vt.

Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function supp=
ort")

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index b02e4955e9b04..a5465c42a77b8 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> @@ -310,7 +311,9 @@ static void ls2k_bmc_events_fn(struct work_struct *wo=
rk)
> =20
>  	if (IS_ENABLED(CONFIG_VT)) {
>  		/* Re-push the display due to previous PCI-E loss. */
> -		set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
> +		console_lock();
> +		update_screen(vc_cons[fg_console].d);

[Severity: High]
This isn't a bug introduced by this patch, but does this blindly access the
framebuffer without ensuring the pcie link is actually connected?

Looking at ls2k_bmc_recover_pci_data() in drivers/mfd/ls2k-bmc-core.c, the
failure paths return false (which evaluates to 0, or success). This masks t=
he
failure from stop_machine(). Then in ls2k_bmc_events_fn(), the return value
of stop_machine() is entirely ignored.

If the pcie link recovery fails, won't calling update_screen() here access
device memory over a disconnected pcie link, triggering a master abort and
leading to a fatal kernel panic?

> +		console_unlock();
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but does this driver mutate a global mfd_cell
array with a stack pointer?

In drivers/mfd/ls2k-bmc-core.c, ls2k_bmc_probe() modifies the shared global
array:

ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

If multiple device instances are probed concurrently, won't they corrupt ea=
ch
other's pointers in the global array ls2k_bmc_cells? Furthermore, after the
probe function returns, doesn't the global array retain a dangling pointer =
to
the destroyed stack frame? The mfd subsystem also requires that mfd_cell
arrays must be declared as static const.

[Severity: High]
This isn't a bug introduced by this patch, but is the bmc_reset_work workqu=
eue
item ever canceled on driver unbind?

The work struct is initialized in ls2k_bmc_init() in
drivers/mfd/ls2k-bmc-core.c:

    INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);

However, the pci_driver struct ls2k_bmc_driver lacks a .remove callback, and
there is no devm_add_action() hook to call cancel_work_sync().

If the work is scheduled just before the interrupt is freed during device
unbind, wouldn't the workqueue execute ls2k_bmc_events_fn() and dereference
the already freed ddata, causing a use-after-free?

[Severity: High]
This is a pre-existing issue, but is the active interrupt mapping
unconditionally destroyed during initialization?

In ls2k_bmc_init() in drivers/mfd/ls2k-bmc-core.c, acpi_unregister_gsi() is
called unconditionally after requesting the interrupt:

    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    return ret;

Does this execute irq_dispose_mapping() and tear down the interrupt mapping
while the interrupt is still actively requested, rendering it completely
non-functional?

[Severity: Medium]
This isn't a bug introduced by this patch, but could untrusted resolution
parameters read from the bmc pci memory cause an integer overflow?

In ls2k_bmc_parse_mode() in drivers/mfd/ls2k-bmc-core.c, the parameters are
read and used in 32-bit arithmetic:

    pd->stride =3D pd->width * depth / 8;

Since the resolution string is parsed using kstrtouint() without bounds
checking, couldn't large input values (such as width =3D 0x40000000) overfl=
ow
the multiplication? This would result in a tiny or zero stride being passed
to the simplefb driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-ls2kbmc-mo=
d-v4-0-d201502ba239@gmail.com?part=3D3
