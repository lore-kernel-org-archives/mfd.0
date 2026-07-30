Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C782489894
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431480; cv=none; b=SynAlams/3XXGeCMY5e6AkBd70QFRCXF/pQBoNdu8Qq+TUVvEdnrWCBXPV47sr2RQcvUbSdk7TSfKH2X2FTiV4X/awcqWTiwh14b+yYRSlTL89Z8MdKskYYjNo8LehdTCxM74CL0fAWGHnLFkQ67WKC23dihvvBm91NzzueE/tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431480; c=relaxed/simple;
	bh=UfC2Thwt+GMMQv4reYaGAKkdK1MRitSYkh48+/r23ak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l32BSmk6s1XuPVhdsCdEWrOmHq4mtFWZp2BnzJ53HEjRQZj3ErQmdYEL+h3uWh0CJyJCSD6IpXLgyAp8Apbx2t9ZI6+VzHnNpflDCDOwSMBj+HGwx3Ql4j2q/7h+I4fGWb9mJI6QLA+wuux/U1/lWqfNq9PPsXDI1ra2vT7hE1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHb7uDFI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHb7uDFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963111F000E9;
	Thu, 30 Jul 2026 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785431478;
	bh=zP7Q1PGuG52qiqsAh2sn9zJJfTq8pH/rR+z9v6O6Af4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RHb7uDFIveE9uiRcq0oj7UgeTTsNu17SYveSyoWuc2Ij0cOMxMiPwXMTEh1Zo1Vny
	 kRrEQ1bZzB0c1ypGn4LEOLpHWrrPYdgc57f2/wWlrmkps8pZFkI/E/K+jCYSPSN5la
	 II+oEztfk94K4QnBegyHBGqyBVdqIwsVD+F1KofhWZCgFf03Wb3ggw5Z/ubSOmWFGZ
	 K2SdxySzlunZGADMhau7mElBybWbF/Dr7w2VxcPKVdokZXpSV5iqE2FJhnZtumnHdB
	 8Etrrd5F8dc5/yf/CaGJ9WTlLSBuAy7JpSTtBRK321WnKqiCfUbyDakV7blKrRjUgQ
	 bNEafI8cy5Gwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 2/7] mfd: ls2kbmc: Sanity check for the connected
 pci port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260731-ls2kbmc-mod-v4-2-d201502ba239@gmail.com>
References: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
 <20260731-ls2kbmc-mod-v4-2-d201502ba239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 17:11:18 +0000
Message-Id: <20260730171118.963111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The driver executes a 10-second busy wait (`mdelay`) inside a =
`stop_machine` context, stalling all CPUs and likely triggering the NMI wat=
chdog.
- [High] The driver dynamically modifies a global non-const `mfd_cell` arra=
y and assigns a pointer to a local stack variable to its `platform_data` fi=
eld.
--

--- Patch [2]: [PATCH RFC v4 2/7] mfd: ls2kbmc: Sanity check for the connec=
ted pci port ---
commit ec9f316b181d1a4fc9b0daee3548a4f8a40ef766
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Sanity check for the connected pci port

When the bmc resets, the recovery procedure require to reconfigure the
parent device. Add a sanity check on initialization to ensure this and
prevent from accidentally operating on non-LS7A ports.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 27f6e096404d6..b02e4955e9b04 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
[ ... ]
> @@ -488,6 +515,11 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const=
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

[Severity: High]
This isn't a bug introduced by this patch, but looking further down in
ls2k_bmc_probe(), does assigning a pointer to a local stack variable to the
platform_data field of a global mfd_cell array create a dangling pointer on=
ce
the probe function returns?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

This modifies a global non-const mfd_cell array, which violates MFD subsyst=
em
guidelines requiring mfd_cell arrays to be static const. If multiple devices
bind to this driver, could concurrent probes race to modify this global arr=
ay
and cause the wrong platform data to be copied?

[Severity: Critical]
This is a pre-existing issue, but since the commit message mentions the
recovery procedure, does the 10-second mdelay() inside the recovery
procedure's stop_machine callback stall all CPUs and trigger the NMI
hardlockup watchdog?

The hardware triggers a BMC reset, which queues the work that calls
stop_machine():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

Inside the callback, the code executes a 10-second busy wait:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

Because stop_machine() halts all other CPUs with interrupts disabled, and t=
he
executing CPU also runs with local interrupts disabled, will this 10-second
delay cause a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-ls2kbmc-mo=
d-v4-0-d201502ba239@gmail.com?part=3D2
