Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C20813AF2
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 12:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303571; cv=none; b=YZoXEul3qbJIIhTg92DovuFYoC2ZL528AXqHP7foSGRWLl9UObqVoKZZvcPl6kEJ59FwE9lvdG627sYRt+HNcb6LRBBQm0ruirKjy9vGeVkbxdOH00bczd/kD4+LbmARiucvN5/vRG7306jtCHurcsf69UFsq3SnQWjQZezm52w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303571; c=relaxed/simple;
	bh=PoAGdQbC5LAJzgOr7ItHzrx69rhy49IX3HHkQldHffs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ppf40XRCdVafsJDwjVrHOWYbJUph1x5ZlNRMbgMdeD5m8EKlrT/oP0rXnVf96w7IIpjMB64nqyTE/otGGST7DZmSkZ32qQ/G4eMxTAxkiEQUAtNBROK9rN/5zXETeruCW3KbmFU3cGKfPIXw2a4sUfZQflM740oY6PRIgRnWrqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKljvV2I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKljvV2I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F1E1F000FF;
	Sun, 13 Sep 2026 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789303570;
	bh=oMGvZ3qHVFl7QgG1zoDjMno6gACbuamj6krnHKUXFVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OKljvV2IdEfe5fFK8/MPjqc9jWMdn7swhrnyY19NBPgstmHhKkveLyzfdC+YBR1ec
	 TG53OHUdM95UqIb2ME3Ohfpug0aKUMSfhjxgeHKKTMEq1g3Mz/N5sx1SarrxYbLF+X
	 ambygQMnu88wEj50Msff5UFlgBMfMSHzUozQvS2Xg6bRzrU8QvxQmeLnYBdSIZs+TT
	 E7cNFjQf6pGXSeBcDDalkxQ52LT6TwZ23X1ONvkmHc7Qr/nRC8YwBBoZuTmUJ9t3Bf
	 b0ftJUTupgWCAgql3z8Lz2BFn43/vncIuP7HhFT6f1j/HocRQO2gSalj57uLlv1Cko
	 f+nd623/TMy7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd/intel-lpss: Fix DebugFS initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com>
References: <20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 12:46:09 +0000
Message-Id: <20260913124609.D3F1E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message claims to modify `intel_lpss_exit()`, but it =
actually modifies `intel_lpss_init()`.
- [Low] Non-standard commit message prefix violates MFD subsystem conventio=
ns.

Pre-existing issues:
- [High] Missing `mfd_remove_devices()` in the error path of `intel_lpss_pr=
obe()` causes leaked child devices and a potential Use-After-Free.
- [High] Skipping LTR caching when debugfs is disabled causes incorrect PM =
QoS hardware writes to be skipped.
--

commit 8da79d835d33133ad4b3fd059be5d350a5d246f0
Author: Maria Lisina <sekoohaka.sarisan@gmail.com>

mfd/intel-lpss: Fix DebugFS initialization

This commit fixes DebugFS initialization in the intel-lpss driver by adding
proper checks when debugfs is disabled. It aims to prevent dmesg spam
regarding failed debugfs entries.

> mfd/intel-lpss: Fix DebugFS initialization

[Severity: Low]
Does this commit message prefix violate the MFD subsystem conventions?

The MFD subsystem guidelines enforce a strict commit prefix format:
mfd: <Driver>: <Capitalized description>. Using a slash instead of a colon
after the subsystem name breaks Git history categorization standards.

> This patch adds proper checks to intel_lpss_exit() and
> intel_lpss_debugfs_add() functions and removes warning message.

[Severity: Medium]
Is the reference to intel_lpss_exit() correct here?

The commit message states that this patch modifies intel_lpss_exit(),
but the code changes actually modify intel_lpss_init() to set
intel_lpss_debugfs =3D NULL on error. intel_lpss_exit() is not modified in
the provided diff.

> diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
> index 63d6694f71457..51550c1835c69 100644
> --- a/drivers/mfd/intel-lpss.c
> +++ b/drivers/mfd/intel-lpss.c
> @@ -146,9 +146,12 @@ static int intel_lpss_debugfs_add(struct intel_lpss =
*lpss)
>  {
>  	struct dentry *dir;
> =20
> +	if (!intel_lpss_debugfs) {
> +		lpss->debugfs =3D NULL;
> +		return 0;
> +	}
> +

[Severity: High]
This isn't a bug introduced by this patch, but does skipping
intel_lpss_cache_ltr() here cause incorrect PM QoS hardware writes to be
skipped?

If debugfs is disabled in the kernel, intel_lpss_debugfs_add() returns early
here, skipping the subsequent call to intel_lpss_cache_ltr(). Because lpss =
is
zero-allocated, lpss->active_ltr and lpss->idle_ltr remain 0.

Later, when PM QoS calls intel_lpss_ltr_set(), it checks if the new LTR val=
ue
matches lpss->active_ltr:

drivers/mfd/intel-lpss.c:intel_lpss_ltr_set() {
    ...
    if (ltr =3D=3D lpss->active_ltr)
        return;
    ...
}

If the new calculated LTR value evaluates to 0, this check evaluates to true
and the function returns early without writing to the hardware register,
leaving the LTR incorrectly active.

[ ... ]

> @@ -432,10 +435,7 @@ int intel_lpss_probe(struct device *dev,
>  		goto err_clk_register;
> =20
>  	intel_lpss_ltr_expose(lpss);
> -
> -	ret =3D intel_lpss_debugfs_add(lpss);
> -	if (ret)
> -		dev_warn(dev, "Failed to create debugfs entries\n");
> +	intel_lpss_debugfs_add(lpss);
> =20
>  	if (intel_lpss_has_idma(lpss)) {
>  		ret =3D mfd_add_devices(dev, lpss->devid, &intel_lpss_idma64_cell,

[Severity: High]
This is a pre-existing issue, but is the error path missing a call to
mfd_remove_devices() if the main cell registration fails?

In intel_lpss_probe(), the driver registers the IDMA child device via
mfd_add_devices(). If the subsequent mfd_add_devices() call for the main ce=
ll
fails, the probe function jumps to err_remove_ltr:

drivers/mfd/intel-lpss.c:intel_lpss_probe() {
    ...
    ret =3D mfd_add_devices(dev, lpss->devid, lpss->cell,
                          1, info->mem, info->irq, NULL);
    if (ret)
        goto err_remove_ltr;
    ...
err_remove_ltr:
    intel_lpss_debugfs_remove(lpss);
    intel_lpss_ltr_hide(lpss);
    intel_lpss_unregister_clock(lpss);
}

The err_remove_ltr path unwinds resources but misses a call to
mfd_remove_devices(dev). The previously added IDMA device is left registered
while the parent device's devres frees the memory associated with the parent
(including the intel_lpss struct).

Could this leave dangling IDMA child devices that maintain references to fr=
eed
memory, leading to a use-after-free?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-intel-lpss=
-debugfs-v1-1-833cbb6fffc9@gmail.com?part=3D1
