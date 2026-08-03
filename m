Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BCA6BB5B
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777014; cv=none; b=aKEHbL5chJ4TcsLryRZU2Lt/BiojDrnjR+sAccYU0KRNG2NAZMehS7leHuUyj5qZKNAFolRyZXMi/HGsh27rk5/ykdFw5aH+yrn6oHAZsVkpX+pvn3AgU5AU+HS/RnKQJ4wbfpCS07pfTMQjzodPog4oFr42yJWDv7twe2Y6rFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777014; c=relaxed/simple;
	bh=jS5lGd9MtWtmxZH2RZQLEZIBcPitBqzkm4U0+RIxzoQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z4kTs0mN75LCWVfsLe6NFlo9Jv4Kg4Md2qJe5ftcohMb68Xgu/hluou6LTSaMIgvpWY6c2ed1fDgZvrKoLKiyCge6e8IO8oiiwffM1ivqomsDah95HmwtsL7mkt9m4okmxJfYI8C3/ZTgC+yKL8J/KO+5vJtK3uYRW7bZe8/RBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqKvYJdf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqKvYJdf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E961F000E9;
	Mon,  3 Aug 2026 17:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777013;
	bh=Un+h6VhaCnp5ojGXyjZR/Q9HGYTlgbLPhG9VWfyCmjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iqKvYJdf30GNtYGLr9Ds0EjKTIbxTd9cNy6Hvyfsfhn/FmZIfdK/RTU/mOTG1B9Pg
	 IvxeNMMG6Nj2syBPtarFgLhocJG+xEp4luhqZ9+3n+RZcdCL6CWivondlNJ4U1YWOS
	 r+qcaCt+CLlDffrD4ThR/9LRGvuBZ3bVwEt835lHbtdfZTv4QfnguuBIBUBVi3Zfps
	 tAaXx18d/bSINLlNbVjNpJauQizxwYD9TxTvZEfmHW0TgrYuPdAa0J59V6KO9rYijs
	 prVt/y4cPl2I+i8zI40Nmux2NbDXpnXdevDlqIuJ5is8twpns9CysAZvMyiPEDQGCY
	 RZX6Kt+Mcm9xw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260804-ls2kbmc-mod-v5-1-e6bc5cdd9a93@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-1-e6bc5cdd9a93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 17:10:11 +0000
Message-Id: <20260803171012.C6E961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver illegally modifies a shared static `mfd_cell` array (`l=
s2k_bmc_cells`) during probe, assigning a pointer to a stack-allocated vari=
able.
- [High] Massive `mdelay` (10+ seconds) inside a `stop_machine` callback wi=
ll freeze the system and trigger hard lockups.
- [High] Video mode dimensions parsed from untrusted BMC memory are not bou=
nds-checked, causing an out-of-bounds write in the DRM subsystem.
--

--- Patch [1]: [PATCH RFC v5 1/7] mfd: ls2kbmc: Make a copy when parsing mo=
de string ---
commit 04a85f9ac065d47d2e55cbd8e495ab417bf78739
Author: Miao Wang <shankerwangmiao@gmail.com>
Subject: mfd: ls2kbmc: Make a copy when parsing mode string

This commit resolves an issue where the resolution string mapped from
the BMC was being manipulated in-place by strsep(). It creates a copy
of the string to parse instead.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe7..fc9695eedd366 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
[ ... ]
> @@ -427,34 +427,54 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
[ ... ]
> -	ret =3D kstrtoint(strsep(&mode, "x"), 10, &pd->width);
> +	ret =3D kstrtouint(strsep(&mode, "x"), 10, &pd->width);
>  	if (ret)
> -		return ret;
> +		goto invalid_mode;
> =20
> -	ret =3D kstrtoint(strsep(&mode, "-"), 10, &pd->height);
> +	if (mode =3D=3D NULL) {
> +		ret =3D -EINVAL;
> +		goto invalid_mode;
> +	}
> +	ret =3D kstrtouint(strsep(&mode, "-"), 10, &pd->height);
>  	if (ret)
> -		return ret;
> +		goto invalid_mode;
> =20
> +	if (mode =3D=3D NULL) {
> +		ret =3D -EINVAL;
> +		goto invalid_mode;
> +	}
>  	ret =3D kstrtoint(strsep(&mode, "@"), 10, &depth);
>  	if (ret)
> -		return ret;
> +		goto invalid_mode;
> =20
>  	pd->stride =3D pd->width * depth / 8;
>  	pd->format =3D depth =3D=3D 32 ? "a8r8g8b8" : "r5g6b5";
> =20
>  	return 0;

[Severity: High]
This isn't a bug introduced by this patch, but does this parsing logic need
bounds checking for the dimensions provided by the BMC?

The parsed width, height, and stride are used to configure the framebuffer.
However, the backing memory is capped at a fixed 4MB size:

static struct resource ls2k_display_resources[] =3D {
        DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "simpledrm-res"=
),
};

If a compromised or misconfigured BMC provides abnormally large dimensions,
could this lead to out-of-bounds writes past the 4MB limit when the
framebuffer is cleared or rendered?

> +
> +invalid_mode:
> +	dev_err(&pdev->dev, "Invalid resolution string: %s\n", mode_buf_orig);
> +	return ret;
>  }
> =20
>  static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_i=
d *id)

[Severity: High]
This is a pre-existing issue, but does ls2k_bmc_probe() leave a dangling
pointer by assigning a stack variable to a global array?

The driver modifies the global static array ls2k_bmc_cells during probe:

ls2k_bmc_probe() {
        ...
        ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
        ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
        ...
}

Since pd is local to the stack during probe, the global array is left with a
dangling pointer once the function returns. Could this cause a stack
use-after-free if another device instance probes concurrently or accesses
the array later? Additionally, shouldn't MFD cell arrays be static const?

[Severity: High]
This is another pre-existing issue, but does ls2k_bmc_events_fn() trigger
hard lockups by sleeping inside stop_machine()?

When a BMC reset occurs, the driver executes ls2k_bmc_events_fn(), which
calls stop_machine() to freeze all CPUs with local interrupts disabled:

ls2k_bmc_events_fn() {
        ...
        stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
        ...
}

Inside ls2k_bmc_recover_pci_data(), the code waits for the BMC to become
ready using a 10-second busy loop:

ls2k_bmc_recover_pci_data() {
        ...
        mdelay(LS2K_BMC_RESET_WAIT_TIME);
        ...
}

Does holding all CPUs with interrupts disabled for 10 seconds
unconditionally trigger NMI watchdogs and RCU stall panics?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-ls2kbmc-mo=
d-v5-0-e6bc5cdd9a93@gmail.com?part=3D1
