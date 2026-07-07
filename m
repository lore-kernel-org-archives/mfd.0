Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DA42EEE85
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 19:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452910; cv=none; b=O73gkf38XEdacNp3/3UHcBc17wTLiY9SwiwVf/dRi1X5ywMkkl5/0FtdREJAdiWB0PZ7Uq6W9ELSEh+Re4qK2sHR+K4iAPhhlgAka1teg+R+986+5Rtd+ugeUIAmU1vBz6f43+3GbVGfZAfSMGmIdmG7UzXMitlbiHwzdcafnLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452910; c=relaxed/simple;
	bh=/EuqnfDm7hFY+GzLz4ntlQ5J1lf9ct2nqKQIjO3Ov5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H81mOvIJ/uAzmdjGRz3L+oBF/sxRn+C/bTQmZrqOz8dESiyh9qsZTY+rbfMIrekwqIuxgqJG5FrsscHV/PaAfvFERb3JvryDaTCbCetMQtvxUd3zYgcPPb6HvdlQTTYiOieCmJXQ8EbuuaiDbdlQIDiKKusZm1cjmk8/KaQgnmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyQxBdiH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyQxBdiH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EF11F000E9;
	Tue,  7 Jul 2026 19:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783452908;
	bh=pBEieUapSINQQrMpQBhwnHkSvLTZiyt7rQ/2MdUc1eY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PyQxBdiHC6Dm2ifDuovbsQ/+ZvpZgMGdNKUYCRjwBhOyDWgSmqc9N0vHq1rBq0mo9
	 POlMy11ooO9XAs+8U6wn9ZPwRb7EJzFXu+5yHlbHhXM+Fnsn3kNhR5W2AoEEAjQ6ON
	 Fs3faXcYV71Ha38KkxhFhzq4w2ZsPhrivVogqYL2Ip4NmdqaLKbOLNqIdAw/okM/O/
	 3rtLDnDwoE+l+YbCQeUIq3EuptOd25sS3tgaeRYpxChMKeIqkDQ2pnGmBw1jPfhu/I
	 IwIdtkU5+ZpNn6GPH7+PkqaLBgqdj8dkvJC4/q+7nSOD8n0kHz+mRnwUWZVP0r83ao
	 AdcbUF+jB4krQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/5] mfd: ls2kbmc: make a copy when parsing mode
 string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260708-ls2kbmc-mod-v1-1-c344bf5defa3@gmail.com>
References: <20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com>
 <20260708-ls2kbmc-mod-v1-1-c344bf5defa3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 19:35:07 +0000
Message-Id: <20260707193508.43EF11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [High] The new mode parsing logic incorrectly rejects valid resolution st=
rings that lack a trailing refresh rate (e.g. strings without an '@').
- [High] Standard `memcpy` is used to read from I/O memory instead of the r=
equired `memcpy_fromio`.
- [Low] Allocating a 1024-byte array on the kernel stack is wasteful and in=
creases the risk of stack overflow.
- [Low] The patch abuses managed `devm_ioremap` and `devm_iounmap` for a te=
mporary, short-lived memory mapping.
- [Low] The newly introduced error log prints a truncated and misleading st=
ring due to in-place modifications by `strsep()`.
- [Low] Printing raw, untrusted memory directly to the kernel log allows fo=
r terminal escape sequence injection.

Pre-existing issues:
- [High] The driver dynamically modifies a shared static `mfd_cell` array a=
nd stores a local stack pointer into it, violating MFD core guidelines.
- [High] The `bmc_reset_work` workqueue is not explicitly cancelled during =
probe failure or device unbind, leading to a potential Use-After-Free.
- [High] Invalid use of `kstrtoint` on `u32` variables combined with untrus=
ted input can lead to an integer overflow when calculating the framebuffer =
stride.
--

--- Patch [1]: [PATCH RFC 1/5] mfd: ls2kbmc: make a copy when parsing mode =
string ---
commit 50370b4ef23f8df41c25e8399d557676642d9cdc
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: make a copy when parsing mode string

This patch modifies the mode string parsing logic to copy the BMC memory
into a local buffer instead of parsing it in-place. This prevents the
original memory from being modified by strsep().

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe7..30b275bc48794 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -427,34 +427,53 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
>   */
>  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_pla=
tform_data *pd)
>  {
> -	char *mode;
> +	/* Assume 1024 bytes is enough for the resolution string */
> +	char mode_buf[1024];

[Severity: Low]
Is allocating a 1024-byte array on the kernel stack necessary here? Standard
video mode strings are usually well under 64 bytes. Large stack allocations
consume limited stack space and can increase the risk of stack overflows.

> +	char *mode =3D mode_buf;
> +	const void __iomem *mode_base;
>  	int depth, ret;
> =20
>  	/* The last 16M of PCI BAR0 is used to store the resolution string. */
> -	mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M,=
 SZ_16M);
> -	if (!mode)
> +	mode_base =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ=
_16M,
> +				 sizeof(mode_buf));

[Severity: Low]
Since this mapping is temporary and is unmapped immediately after copying,
does it make sense to use the managed devres APIs (devm_ioremap)? Using
standard ioremap() and iounmap() avoids allocating unnecessary tracking nod=
es
for a short-lived mapping.

> +	if (!mode_base)
>  		return -ENOMEM;
> +	memcpy(mode_buf, mode_base, sizeof(mode_buf) - 1);

[Severity: High]
Can we safely use standard memcpy() on an I/O mapped pointer (__iomem)? On
architectures like LoongArch and MIPS, accessing memory-mapped I/O with
standard string functions can lead to unaligned access exceptions or kernel
panics. Should this be using memcpy_fromio() instead?

> +	mode_buf[sizeof(mode_buf) - 1] =3D '\0';
> +	devm_iounmap(&pdev->dev, (void __iomem *)mode_base);
> =20
>  	/* The resolution field starts with the flag "video=3D". */
>  	if (!strncmp(mode, "video=3D", 6))
>  		mode =3D mode + 6;
> +	else
> +		goto invalid_mode;
> =20
>  	ret =3D kstrtoint(strsep(&mode, "x"), 10, &pd->width);

[Severity: High]
This is a pre-existing issue, but could passing a negative value in the mode
string bypass the kstrtoint() check?=20

Since pd->width and pd->height are u32, a maliciously constructed string li=
ke
"video=3D-1x1080-32" would be parsed successfully by kstrtoint(), cast to a=
 huge
u32 value, and cause a silent integer overflow later when calculating the
framebuffer stride.

>  	if (ret)
>  		return ret;
> +	if (mode =3D=3D NULL)
> +		goto invalid_mode;
> =20
>  	ret =3D kstrtoint(strsep(&mode, "-"), 10, &pd->height);
>  	if (ret)
>  		return ret;
> +	if (mode =3D=3D NULL)
> +		goto invalid_mode;
> =20
>  	ret =3D kstrtoint(strsep(&mode, "@"), 10, &depth);
>  	if (ret)
>  		return ret;
> +	if (mode =3D=3D NULL)
> +		goto invalid_mode;

[Severity: High]
Does this new check erroneously reject valid resolution strings?=20

If the mode string does not contain a refresh rate (for example,
"video=3D1920x1080-32" with no '@' character), strsep(&mode, "@") will set =
mode
to NULL. This check will then abort the probe, even though the width, heigh=
t,
and depth were successfully parsed.

> =20
>  	pd->stride =3D pd->width * depth / 8;
>  	pd->format =3D depth =3D=3D 32 ? "a8r8g8b8" : "r5g6b5";
> =20
>  	return 0;
> +
> +invalid_mode:
> +	dev_err(&pdev->dev, "Invalid resolution string: %s\n", mode_buf);

[Severity: Low]
Does printing the modified mode_buf obscure the actual error? Because the
preceding strsep() calls modify the string in-place by replacing delimiters
with NUL bytes, this log message will terminate early and only print a
truncated portion of the string.

[Severity: Low]
Additionally, is it safe to print raw, untrusted hardware memory directly to
the kernel log? Embedding non-printable characters or ANSI terminal escape
sequences could spoof log entries or exploit terminal emulator vulnerabilit=
ies.

> +	return -EINVAL;
>  }
> =20
>  static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_i=
d *id)

[Severity: High]
This is a pre-existing issue, but I noticed that during probe, the
ls2k_bmc_cells array is dynamically modified:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    struct simplefb_platform_data pd;
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

Is it safe to store a local stack pointer (&pd) into a global non-const
mfd_cell array? The MFD guidelines explicitly forbid this pattern as it lea=
ves
a dangling stack pointer after the probe function returns and causes a data
race if multiple devices probe concurrently.

[Severity: High]
This is another pre-existing issue, but if ls2k_bmc_parse_mode() fails and
causes the probe to abort, does the driver leave the bmc_reset_work active?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
    ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt, ...=
);
    ...
}

If the IRQ is requested and schedules the work, but a later step in probe
fails, the devres cleanup will free the data structure without synchronously
cancelling the workqueue via cancel_work_sync(). Could this lead to a
use-after-free if the worker thread runs after the data is freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v1-0-c344bf5defa3@gmail.com?part=3D1
