Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1DA3D811E
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365479; cv=none; b=lWN/URKTJ6rAGFbRP7EjHcI27aqXR3VB06koAZdtxa1/eczrklrUo8quiSNL6zlrhcelklCCHVYgKqBXAUVugviZQs1DYSVrlCfTZSi5CYz5XWakS1AdsyMFVOxYZZZmVib6OyMxJXmPt6zJIS5HFaEOB+xRc5vgvXk0y1sT4kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365479; c=relaxed/simple;
	bh=XJ7UrIXiNBrCaq5f2hlRzTWGTu7QLAAHdly+4FiXAiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E7tblgqjhkI8uDa9jxu1vMZSPXvMahK536uQLTrNCdwOY2w9ygqa2fDIc6fKKvt6m4Yuf+NlQKIoIoUZQiO4pNYicuORvTGCRV62vXVlXUT387PVUzKXSkNFEb2VRTJgdBWilxcJi1cwA2oW5SO8fPpQpf0kI/fO4OIAr0z60VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnFCTluu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnFCTluu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9529A1F000E9;
	Mon, 10 Aug 2026 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786365477;
	bh=U20psO+4CNhMbhCA9IfjjCEpKbjsThajyVZbGdYyd6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RnFCTluuthbwvhshThrbK8xH5jLF/RY4ybVcYjp3Ftd7lAeyrEndpHC+FctPOpI1l
	 wz0z0on9LY6RoC1R1mIdP7v8dZuWKFdqPw+3MUGN+k1Kg603Qlb3o4sGdshCAb7LBG
	 Bny6RmbGuLCNltSkPRvKje9aHdd5I2WK15N9DSH3BhHhfDm/9Bt9Ca5YaE+m+ZE1Mx
	 8JQvDfkdbMs5dBD6m4pRCAczOWw7d8h3s0lutgM2Vn3haCn8dNchAxgJJgtGlfY2u7
	 U2zJhsmQlD4aDY5kBipqc862qdfRN6PNAzGUGI5yC62GZK03IZ5Z7cReEZMrJaTEnd
	 jMbuHx2Kw3fsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 3/8] mfd: ls2kbmc: Redraw using exported
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260810-ls2kbmc-mod-v7-3-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
 <20260810-ls2kbmc-mod-v7-3-8aa0fb5a5462@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 12:37:56 +0000
Message-Id: <20260810123757.9529A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Lack of upper bound validation on framebuffer height allows ar=
bitrary out-of-bounds MMIO writes.
- [High] Missing workqueue cancellation causes a Use-After-Free of `ddata` =
on driver unbind.
- [High] Execution of a 10-second busy-loop and sleeping functions while lo=
cal interrupts are disabled via `stop_machine()`, causing system lockups.
- [High] The `mfd_cell` array is not `static const` and is dynamically muta=
ted during probe, violating MFD guidelines and creating data races.
- [High] Unsynchronized static IRQ throttling state causes a total loss of =
interrupts for 5 minutes after boot.
--

--- Patch [3]: [PATCH RFC v7 3/8] mfd: ls2kbmc: Redraw using exported funct=
ions ---
commit 531ceb3081c670493fc8de461efa630fc7f4d2e5
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Redraw using exported functions

This commit updates the ls2kbmc driver to use standard console functions.
It replaces the manual virtual terminal manipulation with console locking
and the update_screen() function.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 434db99ee501b..06ec8143d8cdb 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -25,6 +25,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/stop_machine.h>
>  #include <linux/vt_kern.h>
> +#include <linux/console.h>
> =20
[ ... ]
> @@ -310,7 +311,9 @@ static void ls2k_bmc_events_fn(struct work_struct *wo=
rk)
> =20
>  	if (IS_ENABLED(CONFIG_VT)) {
>  		/* Re-push the display due to previous PCI-E loss. */
> -		set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
> +		console_lock();
> +		update_screen(vc_cons[fg_console].d);
> +		console_unlock();
>  	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for
bmc_reset_work to execute after the ddata structure is freed?

The driver initializes bmc_reset_work without a corresponding unbind
cancellation step:

ls2k_bmc_init() {
    ...
    INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
    ...
}

Since there is no driver remove callback or managed action to cancel the
work, devres will free the IRQ and then ddata on unbind. If the work is
concurrently executing, can it access the freed ddata here in
ls2k_bmc_events_fn()?

ls2k_bmc_events_fn() {
    struct ls2k_bmc_ddata *ddata =3D container_of(work, ...);
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
}

[Severity: High]
This is a pre-existing issue, but does executing stop_machine() here
cause system lockups?

ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

The callback runs with local interrupts disabled across all CPUs.
Inside this atomic context, the callback spins for 10 seconds:

ls2k_bmc_recover_pci_data() {
    ...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

It also invokes mapping operations that can sleep:

ls2k_bmc_pcie_is_connected() {
    ...
    base =3D pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
    ...
}

Can this combination of mdelay and sleeping functions inside
stop_machine() lead to deadlocks or watchdog panics?

[Severity: High]
This is a pre-existing issue, but does mutating ls2k_bmc_cells during
probe create a data race and a dangling pointer?

ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

Since ls2k_bmc_cells is a shared global array and missing the const
qualifier:

static struct mfd_cell ls2k_bmc_cells[] =3D { ... };

Assigning the address of a local stack variable (&pd) to platform_data
leaves a dangling pointer once probe returns. Concurrent probes could
also overwrite this shared global state. Could this be updated to use
static const cell definitions to follow MFD guidelines?

[Severity: High]
This is a pre-existing issue, but does the interrupt handler drop events
for the first 5 minutes after boot?

ls2k_bmc_interrupt() {
    static unsigned long last_jiffies;
    ...
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }
    ...
}

At boot, jiffies initializes to a large negative number. Since
last_jiffies is zero-initialized, time_after() evaluates to false
until jiffies crosses zero, which takes about 5 minutes.

Additionally, since last_jiffies is static and unsynchronized, could
multiple device instances corrupt this shared throttling state?

[Severity: Critical]
This is a pre-existing issue, but does the lack of upper bound
validation on the framebuffer height allow arbitrary out-of-bounds
memory writes?

ls2k_bmc_parse_mode() {
    ...
    ret =3D kstrtouint(strsep(&mode, "-"), 10, &pd->height);
    if (ret)
        goto invalid_mode;
    ...
    pd->stride =3D pd->width * depth / 8;
    pd->format =3D depth =3D=3D 32 ? "a8r8g8b8" : "r5g6b5";
    ...
}

The height is parsed from an untrusted string without an upper limit
check against the 4MB maximum resource size.

Since stride and height remain unbounded, the simplefb driver will
configure a framebuffer using this huge geometry.

When fbcon writes text to the console, can this calculate memory offsets
that write far beyond the 4MB ioremap region?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v7-0-8aa0fb5a5462@gmail.com?part=3D3
