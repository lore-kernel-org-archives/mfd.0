Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0621246D2C3
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 19:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871425; cv=none; b=YHc+kIQCIhpMIVUe6l6/Baqu/RJsRN2n/HETn+yb4Y9E4K4ZoWyIQSbBRe9wZi+9gKokYexmStYTZHiJ8xmMdlKt9WNXXCtFgblmLwcRXLWBDlecd1oX4oVtaMObkU5liLn4OQBchLCJyAwEsYDA5G8Nr75PbTcRD7AV/D8QmWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871425; c=relaxed/simple;
	bh=beclfDZkxZQ8jBXBgKTm5s8kCjaaT3gt/TnL1SfHdSI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EzIiMjJ6WRAlf9Gd1FZn+NyYt1bEt7iezOYTlN2C0QIVyG6kYY6sV4Q5dabUsuHfLYkEfJB9WXoaZ1EhqBrkaOaUD0jUKAHkstTwJei1BGK/8K9ijzi0s0bXuKKmnWNB0tKuG75MwZn+p8rV4BGF/bu5Z6K4STD12CN1K2lCnNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ep2GNLgr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ep2GNLgr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD581F000E9;
	Tue,  4 Aug 2026 19:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785871423;
	bh=dL7oPTI/cRcFmOM1P9SXUuywRGLsqnh1gedgqltkBSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ep2GNLgrzA4DXa0CSPGqUQavniojoS7wMPE955D4f1tJoiKZzghjxgM0OCTyaut60
	 vpkAzO7yBTLY6aFEbLIi/8a8CsXYtq6mIENkzXqVhlPi+46DDZRVYrKUjX63v7em7Q
	 cSODzJqIMtNNpxIiD8cTWBvSBAeauwFAqbdQc5IkklV6SsT9blTVq+DHD8kl2EjpjE
	 7g+HOKlFojQnTp6d5W5NCKVlT9LiEiW4fJk0mkHh8U0qY5D3PTZRnB+GXDJgnt2AtT
	 hfF5WyxRHju8ZiMFd9oreaa1z/0nVSYfCZpZhrPBisHDYtsHQfz/9V4pKkglOfwGIE
	 /8JeE+06YsL4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 2/7] mfd: ls2kbmc: Sanity check for the connected
 pci port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260805-ls2kbmc-mod-v6-2-16ccde412d86@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-2-16ccde412d86@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 19:23:42 +0000
Message-Id: <20260804192343.4DD581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The global `mfd_cell` array `ls2k_bmc_cells` is dynamically mutate=
d during probe with a stack-allocated variable pointer, violating MFD rules=
 and causing a data race.
- [High] Missing cancellation of `bmc_reset_work` on device unbind or probe=
 failure leads to Use-After-Free.
- [High] The `stop_machine()` callback performs highly illegal blocking ope=
rations, including a 10-second busy wait and dynamic memory mapping, leadin=
g to a system freeze.
--

--- Patch [2]: [PATCH RFC v6 2/7] mfd: ls2kbmc: Sanity check for the connec=
ted pci port ---
commit 69486e003cb1f9b1540028b60b63bfa488d9ed41
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Sanity check for the connected pci port

This commit adds a sanity check to ensure the parent device of the BMC
is an LS7A port during initialization. This prevents the driver from
accidentally operating on non-LS7A ports when attempting recovery
procedures.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index fc9695eedd366..a9a30611dde9e 100644
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

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this probe
function I noticed that it dynamically mutates a global mfd_cell array:

ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

Could this cause a dangling pointer and data race? When the probe function
returns, the local stack variable pd goes out of scope, leaving a dangling
pointer in the global state. This also appears to violate the MFD subsystem
guidelines which require mfd_cell arrays to be static const.

[Severity: High]
This is also a pre-existing issue, but since the commit message mentions
the recovery procedure, I wanted to ask about the reset implementation.
The driver executes ls2k_bmc_recover_pci_data() inside stop_machine() via
ls2k_bmc_events_fn():

ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

Inside ls2k_bmc_recover_pci_data(), the code calls mdelay() and pci_iomap()
which can sleep:

ls2k_bmc_recover_pci_data() {
    ...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
    base =3D pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
    ...
}

Since stop_machine() executes its callback in an atomic context with local
IRQs disabled, wouldn't these blocking and sleeping operations cause a
deadlock or trigger the NMI watchdog?

>  	ddata =3D devm_kzalloc(&dev->dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
>  		return -ENOMEM;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ls2kbmc-mo=
d-v6-0-16ccde412d86@gmail.com?part=3D2
