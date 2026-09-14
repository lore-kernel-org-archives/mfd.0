Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8540E4457A3
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386161; cv=none; b=Ia0JY7uRzUZ922piBvRwn2ltatUbUQr6wNgWEj8E2qanNVZ8O+Lbqub1/pkP1Z1VLRwoNbVAIT2B0ts4NgcvM5SJlu+ifwICufhzidPmU/m2/UcK9AIoSurKS8CZb+3AhrODz+ZW7OmOmkMmlYZyd1JQ0CcyYqoQ/x6OfChoX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386161; c=relaxed/simple;
	bh=2cH4ay4MQaDPvD9bde1FasQ2383Npig/fwC85bW2mL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KVuEih+hYVpG5gAvQzviFfIhp2iprDipl1C8QA9ZzRsZbtPyYipe87hzKW27cm8cK3bHCeoWFEGWLkMxTAZYwHAnH/O3gCFVpjHrO2dAr9MVAFc01JWwS0Q1zrDCVlOGtJsgT+fz698rG1rEe2Ze6QjVjGUFDFWAB/rgaPxSWTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hY1tZFdL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hY1tZFdL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F961F00899;
	Mon, 14 Sep 2026 11:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386159;
	bh=4WAbhgTDiHwwabTfNva179ZYIV5fPiMenTMwrgSWQ5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hY1tZFdLF940qK8X+G13SS/LXPO93zaDbXfyc/WxPYqfKRkczN+8azxe5dAvDv0co
	 axq1/nrCweEov/7s4Z3JSWcjxnYqri1m3vWFWDJCImasMpA2DzYaQWcqYo7G3YMqxc
	 qM3Ox+vF149BeeZu0t/3lwtFNjgGgKCDCrM0BjwFpshqJ0ExGq0wyUmuL7ZW2C5rBG
	 QRehiD1+GI/FUu2ww0IZW9CJshIEVpZoXre7DbYFpsgObDu/aM6LHG+94xPlpFnr0e
	 dUOC9Y6QXdrnP7cpDKIYQqvQ2KgXXq+wS+QHdhM74UH2trBJuqdEPmNu3X8Njt3KE+
	 +Y537wZB9CsqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] mfd: intel-lpss: Prevent DebugFS messages if it is
 not initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260914-intel-lpss-debugfs-v4-1-0eb82ea7c1e3@gmail.com>
References: <20260914-intel-lpss-debugfs-v4-1-0eb82ea7c1e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 11:42:38 +0000
Message-Id: <20260914114238.C8F961F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Returning early when DebugFS is disabled skips intel_lpss_cache_lt=
r(), leaving lpss->active_ltr uninitialized and breaking hardware latency t=
olerance updates.
- [Medium] The patch uses debugfs_initialized() and conditional NULL assign=
ments to skip debugfs creation, failing to fix the root cause of the warnin=
g which is the driver improperly checking debugfs return values.

Pre-existing issues:
- [High] Missing mfd_remove_devices() in the error path of intel_lpss_probe=
() fails to unregister the successfully added 'idma64' child device, leadin=
g to a leaked zombie device and a potential Use-After-Free.
--

commit 77999f12a7abfc9e74b87cc4f64a8d0ea8d2571f
Author: Maria Lisina <sekoohaka.sarisan@gmail.com>

mfd: intel-lpss: Prevent DebugFS messages if it is not initialized

The original code expects DebugFS to be always initialized which
causes unwanted warnings when DebugFS is simply disabled. This patch
adds checks to intel_lpss_init() and intel_lpss_debugfs_add() to
prevent writing to uninitialized DebugFS.

Link: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v3-1-1b8e2b1f09=
92@gmail.com
Link: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc=
63@gmail.com
Link: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v1-1-833cbb6fff=
c9@gmail.com

> diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
> index 63d6694f71457..d45728f46c499 100644
> --- a/drivers/mfd/intel-lpss.c
> +++ b/drivers/mfd/intel-lpss.c
> @@ -146,6 +146,12 @@ static int intel_lpss_debugfs_add(struct intel_lpss =
*lpss)
>  {
>  	struct dentry *dir;
> =20
> +	/* Exit if DebugFS is not initialized */
> +	if (!intel_lpss_debugfs) {
> +		lpss->debugfs =3D NULL;
> +		return 0;
> +	}
> +

[Severity: High]
Does this early return completely bypass intel_lpss_cache_ltr() leaving the
cached hardware state uninitialized?

If intel_lpss_debugfs is NULL, this function returns early, leaving
lpss->active_ltr and lpss->idle_ltr uninitialized (defaulted to 0 by
devm_kzalloc).

Later, when intel_lpss_ltr_set() attempts to set the hardware state to 0:

drivers/mfd/intel-lpss.c:intel_lpss_ltr_set() {
    ...
	if (ltr =3D=3D lpss->active_ltr)
		return;
    ...
}

Will this optimization check incorrectly evaluate to true, comparing the
target state to the uninitialized 0 value instead of the actual hardware
state, and return early without updating the hardware?

>  	dir =3D debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
>  	if (IS_ERR(dir))
>  		return PTR_ERR(dir);

[ ... ]

> @@ -538,7 +544,15 @@ EXPORT_NS_GPL_DEV_PM_OPS(intel_lpss_pm_ops, INTEL_LP=
SS) =3D {
> =20
>  static int __init intel_lpss_init(void)
>  {
> -	intel_lpss_debugfs =3D debugfs_create_dir("intel_lpss", NULL);
> +	/*
> +	 * Check whether DebugFS is initialized to
> +	 * prevent unwanted dmesg messages.
> +	 */
> +	if (debugfs_initialized())
> +		intel_lpss_debugfs =3D debugfs_create_dir("intel_lpss", NULL);
> +	else
> +		intel_lpss_debugfs =3D NULL;
> +

[Severity: Medium]
Is using debugfs_initialized() an anti-pattern here?

If debugfs_create_dir() fails (e.g., with -ENOMEM) when CONFIG_DEBUG_FS is
enabled, it returns ERR_PTR(-ENOMEM).

If this happens, intel_lpss_debugfs will contain an error pointer, so the
!intel_lpss_debugfs check in intel_lpss_debugfs_add() will evaluate to fals=
e.
The subsequent debugfs_create_dir() call will then be executed with an inva=
lid
parent. This call will fail, and IS_ERR(dir) will still be true, propagating
the error and triggering the dev_warn() in the probe path anyway, which
defeats the purpose of the patch.

Would it be better to unconditionally call debugfs functions and remove the
return value checks entirely, as they gracefully handle the disabled state =
by
returning ERR_PTR(-ENODEV)?

>  	return 0;
>  }
>  module_init(intel_lpss_init);

[Severity: High]
This is a pre-existing issue, but missing mfd_remove_devices() in the error
path of intel_lpss_probe() fails to unregister the successfully added 'idma=
64'
child device.

If mfd_add_devices() successfully registers the 'idma64' child device:

drivers/mfd/intel-lpss.c:intel_lpss_probe() {
    ...
	if (intel_lpss_has_idma(lpss)) {
		ret =3D mfd_add_devices(dev, lpss->devid, &intel_lpss_idma64_cell,
				      1, info->mem, info->irq, NULL);
    ...
	}

	ret =3D mfd_add_devices(dev, lpss->devid, lpss->cell,
			      1, info->mem, info->irq, NULL);
	if (ret)
		goto err_remove_ltr;
    ...
}

And the subsequent mfd_add_devices() call for lpss->cell fails, it jumps to
err_remove_ltr:

err_remove_ltr:
	intel_lpss_debugfs_remove(lpss);
	intel_lpss_ltr_hide(lpss);
	intel_lpss_unregister_clock(lpss);

This error path omits mfd_remove_devices(), leaving the 'idma64' child
registered. Since the driver core frees devres allocations (like lpss and i=
ts
memory mapping) on probe failure, does this lead to a leaked zombie device
and a potential Use-After-Free if the orphaned child is probed or accessed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-intel-lpss=
-debugfs-v4-1-0eb82ea7c1e3@gmail.com?part=3D1
