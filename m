Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D810547066
	for <mfd@lists.linux.dev>; Thu,  8 Oct 2026 00:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791418000; cv=none; b=aAGxrlEyIdV6Lr3sfMaqi0cWzpMHpGJEaub0ALYPZtCxyb1zhYYT84PCraX2WR5N1kv9H4/glfjxbgD0/0lLVuhzVMpc0fgZhW7LF2qooly+R3YQaohzHFGylBBSNs8VU3fMhGFFGJC+yJ96ouhEtvXx5oZs9jy9xFLlLb6sOkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791418000; c=relaxed/simple;
	bh=0R7HamVOTL1HpHbMytRiO+NENG0FUF+SEe2JtHQ7Q/0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ytb2DSGuN8lnivsyrj/90AZp06buGhErgVJKols2hS2Bh1kaSdoCOy+g8GbeHj1dbLn0IjmIo4wDEUK1sXUL8oopDluQeH/FzAPUx/M0VUbAJfPbDJODEEqQiFcby/uFGHt73Wmr0lLwdto/4/KtzXAUqj0Qdw/hlyHo4pmns0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQZCLMiq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQZCLMiq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85A21F000FF;
	Thu,  8 Oct 2026 00:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791417999;
	bh=GnNUNbE0y2q20rqvNprDTzalK/Blsf9AGC7acO3pI0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JQZCLMiqCu2zVxd/xuniwjkbP1HACCmTDU9impg3XdcnQdHmPh958ku7IED99ktk6
	 7DLcsWqIfc2bHHoEUPRXkLqEpwe8J7kYcMHnikfACS1wpvJKPIY7lMZqoe5MvVNO6r
	 8qcyY1t4JmZIocN/3/EO5G62thpshZFz/UIMZI59ALVwlwGnCftEYG0XEPvBZEZYsG
	 MRAdCKfuhJ7Nq++RpH+T2l3TSI1MgcwVcHJ9na8e+l56UsJMWO151r4ZahJiaGl6TV
	 TtKkvDvvd9mgrMByPHa79Mtlz7XF0mSougrGRN6xl+L3rO86gfQJ6GC9KXgSIl7swM
	 6ogk8qMIt4kuA==
Message-ID: <sashiko-outbox-163448@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] mfd: ls2kbmc: Fix stop_machine() function's retvals
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Qm9yaXNsYXYgUGV0a292IChBTUQp?= <bp@alien8.de>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261007235635.GAasbcM53RNcTVfnu3@fat_crate.local>
References: <20261007235635.GAasbcM53RNcTVfnu3@fat_crate.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 00:06:38 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mfd: ls2k-bmc: unhandled stop_machine() return value hides recov=
ery errors
--

commit 35e3836fd584a9475fdd4e4f63d584c98d5c1f04
Author: Borislav Petkov (AMD) <bp@alien8.de>

    mfd: ls2kbmc: Fix stop_machine() function's retvals

This commit updates ls2k_bmc_recover_pci_data() to return proper negative
error codes (-ETIMEDOUT, -EINVAL) instead of false upon failure.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe7..306e444a592ae 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -268,18 +268,18 @@ static int ls2k_bmc_recover_pci_data(void *data)
>  	}
> =20
>  	if (i =3D=3D 0)
> -		return false;
> +		return -ETIMEDOUT;
> =20
>  	ls2k_bmc_restore_bridge_pci_data(parent, ddata);
> =20
>  	/* Check if PCI-E is connected */
>  	if (!ls2k_bmc_pcie_is_connected(parent, ddata))
> -		return false;
> +		return -EINVAL;
> =20
>  	/* Waiting for U-Boot and DDR ready */
>  	mdelay(LS2K_BMC_RESET_WAIT_TIME);
>  	if (!ls2k_bmc_bar0_addr_is_set(parent))
> -		return false;
> +		return -EINVAL;
> =20
>  	/* Restore LS2K BMC PCI-E config data */
>  	pci_write_config_dword(pdev, PCI_COMMAND, ddata->bmc_pci_data.pci_comma=
nd);

[Severity: Medium]
Since ls2k_bmc_events_fn() calls stop_machine(ls2k_bmc_recover_pci_data, ..=
.)
and doesn't check the return value, are these new error codes actually hand=
led?

Looking at ls2k_bmc_events_fn() in drivers/mfd/ls2k-bmc-core.c:

ls2k_bmc_events_fn() {
    ...
	stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);

	if (IS_ENABLED(CONFIG_VT)) {
		/* Re-push the display due to previous PCI-E loss. */
		set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
	}
    ...
}

When a hardware BMC reset interrupt triggers ls2k_bmc_events_fn(), it calls
stop_machine(). If ls2k_bmc_recover_pci_data() times out waiting for BAR0
or PCIe training, it will return an error that stop_machine() bubbles up,
but that error is completely discarded here.

Because the failure is unhandled, the driver silently proceeds to re-push
the display via set_console(), which may attempt to access a dead PCIe link.

Should the return value of stop_machine() be checked or logged to ensure
the PCIe recovery failure doesn't silently persist and cause a crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007235635.GAas=
bcM53RNcTVfnu3@fat_crate.local?part=3D1
