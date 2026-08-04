Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034D3480DE3
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 19:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871668; cv=none; b=aMWvvC/sSFMZZOLhUVLDN2aD+QCy8ZdL55hrdrlKrfX1Q2RtLY+MI9cMBpElWLhmZeSmEMvz/BVtwWqq5yARuY1BJbOZ/0vQU2PExCshALOLVVaSqyWRKOU1VnGd/7Sgec3S5t8n4rid003vBx0s8c8Zc1fmrdyZVQ1PBs/iXYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871668; c=relaxed/simple;
	bh=Ar/AYs9/aafX0wmjj/msFT/J+P/7z/c1W+0W6Wq5AG4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cQRx44UHG522tIrFWm6KfjlExGPlhlmVAmIotYTX/xbkYF/st+rSU3k/UEEmid9thT4v2fSg7UqCNLJGkzmR5JZO9MUm9xERwuDqTRWTQfSvwZC6ByYdt3D94+1dJSaSFkPELwuEEqZn0l0J9R3dQ+p5LswCjR2Y2I8ltOr+FhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LL7eBioe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LL7eBioe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8AB1F000E9;
	Tue,  4 Aug 2026 19:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785871666;
	bh=+76Ace9u0D9DoazS/zdyFIKXOVXaBrUpXFPL+7cj9Qc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LL7eBioeHPvKdL4mwfkY5mpJ1f7jDenNDLiPJ17573Yi0JQyIWvpaAJMsiHoqmwAP
	 J5aWqzbLDQ57JUohs0mdVQWMlQfkEykZ3NOzsn3VkP0UeDAFIwAQSogdi+9j1yIj3z
	 MwF6efMGe86evkuwbt2aBtl8jzn9w8vfG+vLyO4sAGwXpWL8+jbN860aDaxHoxML0r
	 YRk1QpLLpE7bzKffBhj83rl+auLhcs7boMEppS69Jj2oekzO+ujr6VkgbASp7eMSh6
	 TdpXnZUgMUoQjyRl1avi9wtvPDli6KwZ4SgQtfQAqGY3JkRm24TelZENmy76nIXOUs
	 krx78cGkfWQtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 3/7] mfd: ls2kbmc: Redraw using exported
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260805-ls2kbmc-mod-v6-3-16ccde412d86@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-3-16ccde412d86@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 19:27:45 +0000
Message-Id: <20260804192746.4B8AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Excessive busy-waiting with IRQs disabled in `stop_machine` ca=
llback causes hard lockups.
- [High] Global `mfd_cell` array is dynamically mutated using a local stack=
 pointer during probe.
- [High] Missing `cancel_work_sync` on driver unbind leads to use-after-fre=
e of `ddata` by the workqueue.
- [High] Ignored failure of PCI recovery leads to kernel crash when updatin=
g screen.
--

--- Patch [3]: [PATCH RFC v6 3/7] mfd: ls2kbmc: Redraw using exported funct=
ions ---
commit 9d8a26242ae07ab2514af3ffede82d5bccaaf8a9
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Redraw using exported functions

This commit replaces the manual virtual terminal relocation with a call to
update_screen() to trigger a redraw of the current VT after a BMC reset.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index a9a30611dde9e..e12f2ca2fbef3 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -25,6 +25,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/stop_machine.h>
>  #include <linux/vt_kern.h>
> +#include <linux/console.h>
> =20
>  /* LS2K BMC resources */
>  #define LS2K_DISPLAY_RES_START		(SZ_16M + SZ_2M)
> @@ -310,7 +311,9 @@ static void ls2k_bmc_events_fn(struct work_struct *wo=
rk)
> =20
>  	if (IS_ENABLED(CONFIG_VT)) {
>  		/* Re-push the display due to previous PCI-E loss. */

[Severity: Critical]
This is a pre-existing issue, but can the stop_machine() call that precedes=
=20
this block cause a hard lockup?

In ls2k_bmc_events_fn(), stop_machine() is called to execute=20
ls2k_bmc_recover_pci_data():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
...
	stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
...
}

During stop_machine(), local interrupts are disabled. However,=20
ls2k_bmc_recover_pci_data() performs massive busy waits:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
		mdelay(1);
	}
...
	mdelay(LS2K_BMC_RESET_WAIT_TIME);
}

With mdelay() loops of up to 12 seconds total while interrupts are disabled=
,=20
could this trigger an nmi watchdog timeout panic?


[Severity: High]
This isn't a bug introduced by this patch, but does this code handle PCI=20
recovery failures correctly?

Looking at ls2k_bmc_recover_pci_data(), it returns 0 both on success and wh=
en=20
it fails:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
	if (i =3D=3D 0)
		return false;
...
	return 0;
}

Because stop_machine() masks the error by propagating this 0,=20
update_screen() will be called here unconditionally.

If the PCI link fails to recover, could writing to the unmapped framebuffer=
=20
trigger a synchronous external bus error and crash the system?

> -		set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
> +		console_lock();
> +		update_screen(vc_cons[fg_console].d);
> +		console_unlock();
>  	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is there a data race when=20
setting up the mfd_cell array during probe?

In ls2k_bmc_probe(), the global ls2k_bmc_cells array is dynamically mutated=
=20
using a pointer to a local stack variable:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
...
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
...
}

Since ls2k_bmc_cells is a global static array without a const qualifier:

drivers/mfd/ls2k-bmc-core.c {
static struct mfd_cell ls2k_bmc_cells[] =3D {
...
}

Does this leave a dangling stack pointer in a global array if multiple=20
devices are probed or if the array is referenced later?


[Severity: High]
This is a pre-existing issue, but does this driver safely tear down the=20
reset workqueue on unbind?

The bmc_reset_work is initialized in ls2k_bmc_init(), but the driver lacks=
=20
a remove hook to cancel it:

drivers/mfd/ls2k-bmc-core.c {
static struct pci_driver ls2k_bmc_driver =3D {
	.name =3D "ls2k-bmc",
	.id_table =3D ls2k_bmc_devices,
	.probe =3D ls2k_bmc_probe,
};
...

If the driver unbinds or probe fails, devres frees the irq and ddata.

If the work is already scheduled or executing when this happens, could the=
=20
workqueue dereference the freed ddata memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ls2kbmc-mo=
d-v6-0-16ccde412d86@gmail.com?part=3D3
