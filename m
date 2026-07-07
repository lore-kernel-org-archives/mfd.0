Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F6110785
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 21:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459483; cv=none; b=cecVEGDbX7qLXaM2l75Quk1gF+f7rmfEUWUvOKB+Ai8+4KYZkleobRYXTo/TiL+cYTfCyokTWm3yqa/Xpf9sDw6aMhaj8nj/HmL1F4s/VrMD/znj8kgsGrBD+ddoOGDMPbJr4R9gBFmX2eAmcK7YIAs+ohoJteOD4rnGHRuBN4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459483; c=relaxed/simple;
	bh=J215tCsZHTKE+EHP2aWaIrFpQTpd2n/uewvspDWnmYs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RYlh/VknM1QyaOFDy7SRHXB25luRMSlrhBgKeH+kP4t9zbFEykU+prRVeMPeVj7h2EmUEcGOFPWD9fp/wXcEZocfBWAMTa98z1CzfahkHn/iAdg1T+5T5UpBHMTTaX3vfOtrMALHDAB7cm7oaHI9jSgeO1+xr9rHt4GqmQDxXqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDkxI0wh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDkxI0wh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B391F000E9;
	Tue,  7 Jul 2026 21:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783459481;
	bh=c6uJ9N/dQqFOfdkSGoCnu1SoeMJRoIKotMY8qiqd1qE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WDkxI0whQtNV4cq15FBB8duN1L7qyVgfdw5vMPefYJzW1N2+oYq1F95BGhjhgNpu7
	 Hhbi+oyvWXXHKTrZJOjcAxJcMpwrE6II+uf87x+zpqABe/SPRgr5pRygXYcmgwVUh9
	 /hp1GzQDI01e6hfGR5goiLrnNoAkV0x7S8Fhlxuslm93ETzZ/A9rlBEOeWGGkK9YTb
	 owJoputWjPSL8gOE9oNCdrZWOj4Iuxm2Q01gAiUpzGMFDsu4IU+Sdz1e7LXCV4e2Mn
	 rQEcHiXcMj5mOQ9zMifb9mYbYkDfZjBDXGt2WwNCFAiEUeMb36RwjDd1h4OcI0mTNh
	 B1CBH5fnvdw/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260708-ls2kbmc-mod-v2-1-2afdd1741766@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-1-2afdd1741766@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 21:24:40 +0000
Message-Id: <20260707212441.49B391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Regression: The mode parsing function rejects valid resolution str=
ings that lack an '@' delimiter.

Pre-existing issues:
- [High] Data race and subsystem violation: Mutating global static mfd_cell=
 array during probe.
- [High] Integer overflow in stride calculation leading to out-of-bounds me=
mory write.
- [High] Out-of-bounds MMIO read due to hardcoded 16MB offset without BAR s=
ize validation.
- [High] NULL pointer dereference when device is on a root bus.
--

--- Patch [1]: [PATCH RFC v2 1/7] mfd: ls2kbmc: Make a copy when parsing mo=
de string ---
commit 94d2e8a4058d05742414ee9f80cebb8494e161f9
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Make a copy when parsing mode string

When parsing the mode string from BMC, the string is manipulated
in-place with strsep(), preventing from parsing it again. Make a copy of
the original string and manipulate the copy instead to fix this.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe7..27f6e096404d6 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -427,34 +427,54 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
>   */
>  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_pla=
tform_data *pd)
>  {
> -	char *mode;
> +	/* Assume 64 bytes is enough for the resolution string */
> +	char mode_buf[64], mode_buf_orig[64];
> +	char *mode =3D mode_buf;
> +	const void __iomem *mode_base;
>  	int depth, ret;
> =20
>  	/* The last 16M of PCI BAR0 is used to store the resolution string. */
> -	mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M,=
 SZ_16M);
> -	if (!mode)
> +	mode_base =3D ioremap(pci_resource_start(pdev, 0) + SZ_16M,
> +			    sizeof(mode_buf));
> +	if (!mode_base)
>  		return -ENOMEM;

[Severity: High]
This is a pre-existing issue, but does this ioremap() call safely handle sm=
all
PCI resources?

The code maps memory at a hardcoded offset (SZ_16M) into PCI BAR0, but it
doesn't verify that the BAR size actually spans past 16MB.

If a malicious or misconfigured device advertises a much smaller BAR0 (like
4KB), could this lead to an out-of-bounds MMIO read outside the device's
assigned resources?

[ ... ]

>  	ret =3D kstrtoint(strsep(&mode, "@"), 10, &depth);
>  	if (ret)
>  		return ret;
> +	if (mode =3D=3D NULL)
> +		goto invalid_mode;

[Severity: High]
If the resolution string doesn't contain an '@' delimiter (for example, a
standard string like "video=3D1920x1080-32"), won't strsep() set mode to NU=
LL?

Does this new check erroneously reject valid configuration strings that
previously worked fine, causing the driver to fail during probe?

> =20
>  	pd->stride =3D pd->width * depth / 8;

[Severity: High]
This isn't a bug introduced by this patch, but can this multiplication
overflow?

The values for pd->width and depth are parsed from the untrusted BMC string
without bounds checking.

If a large width is provided, multiplying it by depth could overflow a 32-b=
it
integer, resulting in a small stride. Could this lead to an out-of-bounds
memory write in downstream framebuffer code?

>  	pd->format =3D depth =3D=3D 32 ? "a8r8g8b8" : "r5g6b5";
> =20
>  	return 0;
> +
> +invalid_mode:
> +	dev_err(&pdev->dev, "Invalid resolution string: %s\n", mode_buf_orig);
> +	return -EINVAL;
>  }

[Severity: High]
This is a pre-existing issue, but I noticed a potential data race and MFD
subsystem violation in ls2k_bmc_probe():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
	...
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
	...
}

The driver assigns a local stack pointer (&pd) to the global static mfd_cell
array ls2k_bmc_cells.

If concurrent probes of this driver occur, won't this cause a data race?

Also, doesn't dynamically modifying global static mfd_cell arrays violate M=
FD
architectural guidelines?

[Severity: High]
This is another pre-existing issue, but I noticed a potential NULL pointer
dereference in ls2k_bmc_save_pci_data():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_save_pci_data() {
	struct pci_dev *parent =3D pdev->bus->self;
	...
	pci_read_config_dword(parent, PCI_COMMAND, &ddata->bridge_pci_data.pci_com=
mand);
}

If the device is on a root bus (for example, directly plugged into a root
port or attached via Thunderbolt without an intermediate bridge),
pdev->bus->self will be NULL.

Won't this unconditionally dereference a NULL pointer when reading the
config dword?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v2-0-2afdd1741766@gmail.com?part=3D1
