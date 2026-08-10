Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C3928033B
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369075; cv=none; b=TADZJBzn5mCEJgY/Q0DGu/B5plngCKRF4vQKCMPWAaQtSW+u9qDyMtNvhsw/oxiH/SbtNzThyU81wXnW/OpCHx71Z337kK4ctxOht8d6rC3gmpyJ3S9dGcCOL5d4zgwcaL+CX8vpfQNRXsDZqmhcHTJhINgP7Kmvy/uBnTulpww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369075; c=relaxed/simple;
	bh=5mBIFq4WdkTfQej+x9NYGE8PaJ7Sruspy6JJVsmg3+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FHrEj3LI6pui/SsATPE3Mpfvfu0g1LjJvxrKy05pQjzD5BC3hj9CqjsFDu/h+FdLmRb71fqXr9CrqHjbTTnAI2ubL6VJzDdw6a16i0cFWk/8vV0UL/Yx6cBO9R4xSz1wuPyqACzmOlUEOPz1/Z2kA0DGfbFPUzFH3bQyq/2KsOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SstWAxRC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SstWAxRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D1B1F000E9;
	Mon, 10 Aug 2026 13:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786369073;
	bh=UrlDVZB5MpWOby4XL3wqKGV7ZS3w4Pz8nOv85+9Klig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SstWAxRC9oy1VcdM2+WXqZTHPzboa8tW16dVIee72INPlrwLxyRjaI1DQjSPXHb/w
	 0ADb+uhzV9wZ+0ytVjW9D++3zEmQ0kptnaMai1rXUGIJ3qfOKzRBORLh7UZ0hT64Xj
	 gntaymHYYOrlE1veZ6EWeZ0GhSU6r6Kk1t2zy7D80+wUSG78MhBejvzn66ajRrndKM
	 k0ITwY/Ivk5AjBDJFQsxgF5Mt+uYOct7OrI9hCyKxuTberroKD5nwZRvVxWcHRqsU0
	 WK/mMFdBoI2YJwlRd7Lovwv8MBRqF4+2ewd/YPBmlL8x7kzA/OKXvBCVjt1jNJVyDR
	 YYe1rzE32TsPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v8 2/8] mfd: ls2kbmc: Sanity check for the connected
 pci port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260810-ls2kbmc-mod-v8-2-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <20260810-ls2kbmc-mod-v8-2-16e44f7322f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 13:37:53 +0000
Message-Id: <20260810133753.97D1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] System stall for 10+ seconds with interrupts disabled due to `=
stop_machine` delay.
- [Critical] Unconditional remapping of hardcoded physical address allows a=
rbitrary physical memory corruption.
- [High] Dynamic mutation of global static MFD cell array leaving a danglin=
g pointer.
- [High] GPIO GSI mapping is unconditionally destroyed immediately after be=
ing successfully requested.
- [Medium] Flawed rate limiting logic ignores interrupts for the first 5 mi=
nutes of system uptime and incorrectly shares state.
--

--- Patch [2]: [PATCH RFC v8 2/8] mfd: ls2kbmc: Sanity check for the connec=
ted pci port ---
commit 9113421fc798a2bad757ae8e5bd2b98d1ed9d8bb
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Sanity check for the connected pci port

When the bmc resets, the recovery procedure require to reconfigure the
parent device. The driver assumes that the parent device should be LS7A.
Add a sanity check on initialization to ensure this and prevent from
accidentally operating on non-LS7A ports.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 335590392240b..434db99ee501b 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -35,6 +35,15 @@
>  #define LS2K_IPMI3_RES_START		(LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZE)
>  #define LS2K_IPMI4_RES_START		(LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZE)
> =20
> +/* LS7A port Device IDs */
> +#define DEV_LS7A1K_PCIE_PORT0	0x7a09
> +#define DEV_LS7A1K_PCIE_PORT1	0x7a19
> +#define DEV_LS7A1K_PCIE_PORT2	0x7a29
> +#define DEV_LS7A2K_PCIE_PORT0	0x7a39
> +#define DEV_LS7A2K_PCIE_PORT1	0x7a49
> +#define DEV_LS7A2K_PCIE_PORT2	0x7a59
> +#define DEV_LS7A2K_PCIE_PORT3	0x7a69
> +
>  #define LS7A_PCI_CFG_SIZE		0x100
> =20
>  /* LS7A bridge registers */

[ ... ]

> @@ -501,6 +528,11 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const=
 struct pci_device_id *id)
>  	if (ret)
>  		return ret;
> =20
> +	if (!ls2k_check_parent(dev)) {
> +		dev_err(&dev->dev, "Expected to be connected to LS7A PCI-E port\n");
> +		return -ENODEV;
> +	}
> +
>  	ddata =3D devm_kzalloc(&dev->dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
>  		return -ENOMEM;

[Severity: High]
This isn't a bug introduced by this patch, but looking at ls2k_bmc_probe()
further down, is it safe to assign a local stack variable to the global
MFD cell array?

ls2k_bmc_probe() {
...
    struct simplefb_platform_data pd;
...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
...
}

This leaves a dangling pointer in the global ls2k_bmc_cells array when the
function returns. Additionally, the ls2k_bmc_cells array is dynamically
mutated but not defined as static const, which violates MFD subsystem
guidelines. Can this cause memory corruption if the pointer is reused or
if multiple devices are probed?

[Severity: Critical]
This is a pre-existing issue, but I noticed a potentially severe stall in
the reset recovery path. Does this code stall the system with interrupts
disabled for over 10 seconds?

ls2k_bmc_events_fn() {
...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
...
}

Inside the callback:

ls2k_bmc_recover_pci_data() {
...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
...
}

Since stop_machine() halts all CPUs with local interrupts disabled, wouldn't
a 10-second delay (10,000 ms) trigger NMI hard lockups, RCU stalls, and
system watchdog resets?

[Severity: Critical]
This isn't a bug introduced by this patch, but is it safe to hardcode and
unconditionally map a physical address during initialization?

ls2k_bmc_init() {
...
    gpio_base =3D ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
...
}

Where LOONGSON_GPIO_REG_BASE is 0x1FE00500. Even with the new PCI ID check,
could an attacker with a spoofed PCIe device trigger this init function
and overwrite host physical memory at this hardcoded address?

[Severity: High]
This is a pre-existing issue, but does this cleanup logic incorrectly destr=
oy
the GSI mapping on the probe success path?

ls2k_bmc_init() {
...
    gpio_irq =3D acpi_register_gsi(NULL, LS2K_BMC_RESET_GPIO_GSI, ...);
...
    ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt, ...);
...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    return ret;
}

Since acpi_unregister_gsi() is called unconditionally, won't this silence
the GPIO interrupt entirely even when initialization succeeds?

[Severity: Medium]
This isn't a bug introduced by this patch, but could this rate limiting log=
ic
ignore interrupts for the first 5 minutes of system uptime?

ls2k_bmc_interrupt() {
...
    static unsigned long last_jiffies;
...
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }
...
}

Since last_jiffies is initialized to 0, and jiffies initializes to -300*HZ,
time_after() will evaluate to false for the first ~5 minutes. Also, does
using a static variable incorrectly share this state across all potential
device instances?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v8-0-16e44f7322f4@gmail.com?part=3D2
