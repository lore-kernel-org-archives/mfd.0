Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3399F39FCCC
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304483; cv=none; b=K63X1QRCcAIJqcadwrlV2D1w/AFhVbgsDigS7tfIwRQAh5DVhZ++Lcz949G9Nvt8Xty3vrWn7At9XvQZ4Bv0x4Y2+f+dHk5S1oTpHpcao/rwCewzdghjYjKg7e6SNrCPZI0K1bE2wjkoT6tqrkve1ttjg6PpkQYPgVbKMfRjqPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304483; c=relaxed/simple;
	bh=CCMKB+bhbOTtg6tyKGulscAVbachWMMn6JL3Y+WT0Ak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XP8wkZJ4phsPQVXwe+lnCstEfZ5mBoOqHIt0tbFWfGIl9dfwnkS2Jxx39iINm1JlG2Z7vUAh4c8HEHOi6IHz1Ml93Wpo6pJpaRb0Z0QEwHz+DSHeUODZj2CH/tnDI39tM3zZ9tMVACD93c45tKRq/V9t72/Xv9GuqPWIGG4Eczk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3UKwprx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3UKwprx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9641F000FF;
	Sun, 13 Sep 2026 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789304481;
	bh=rC+Jdc59oFe77stTGv6GadtNXzhMtPiDfSdURSQ7qgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V3UKwprxR0hXP+N0V2kzO9VfmgvnFX/ZqMGXRJQBUCHqW5pi2fuYqlR3D1DAJ9NiQ
	 q30Q4rz1UYecpubZTRMY7VtXJwp+YDcctv7egGwYfc2FXkjEHHSCQe6VEyzOcZHal0
	 jRbHi0ha5GK7jcMPPPEhrgkDL3QNKnr2/6qmt4gUPNAkHQ2bzn81zRadrWZxbefOmU
	 oTtyuvP1C3zvVBJsi+uoRKgAm40L1eTcRK0Tp+wuVksA30qz/Oi4+k/9KJu/Jxu23j
	 J35YAz3yVelcW6gEJDD76S061JFV+Ph3ql+hNZLvA0Bj5w3OwJsEjh8RNfdsj/Dq5C
	 XxdpN4ff5FPqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd/intel-lpss: Fix DebugFS initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc63@gmail.com>
References: <20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc63@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 13:01:21 +0000
Message-Id: <20260913130121.8F9641F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message inaccurately claims to add checks to `intel_l=
pss_exit()`, whereas the patch actually modifies `intel_lpss_init()`.
- [Low] The commit message uses a non-standard prefix format that violates =
MFD subsystem guidelines.

Pre-existing issues:
- [High] The `intel_lpss_probe()` error path fails to call `mfd_remove_devi=
ces()`, leaving the previously added IDMA child device permanently register=
ed if the main MFD cell registration fails, causing a resource leak and use=
-after-free.
- [High] Leaked clock gate resource on the error path of `intel_lpss_regist=
er_clock_divider()`.
--

commit 268d7b5a570b7b03f10365238994919c9ea9264b
Author: Maria Lisina <sekoohaka.sarisan@gmail.com>

    mfd/intel-lpss: Fix DebugFS initialization

This commit fixes a spammy warning message in dmesg when DebugFS is disable=
d.
It removes the warning from the probe path and adds checks to handle a disa=
bled
DebugFS gracefully.

>     mfd/intel-lpss: Fix DebugFS initialization

[Severity: Low]
This isn't a bug, but does this commit prefix violate the MFD subsystem
guidelines which require "mfd: intel-lpss:" instead of "mfd/intel-lpss:"?

>     This patch adds proper checks to intel_lpss_exit() and
>     intel_lpss_debugfs_add() functions and removes warning message.

[Severity: Medium]
Is this description accurate? The patch actually applies the check to
intel_lpss_init() and does not touch intel_lpss_exit(). Could the commit
message be more precise about the modified functions?

> diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
> index 63d6694f71457..c2cb58c0f98a9 100644
> --- a/drivers/mfd/intel-lpss.c
> +++ b/drivers/mfd/intel-lpss.c
>
> [ ... ]
>
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
This is a pre-existing issue, but does intel_lpss_probe() in
drivers/mfd/intel-lpss.c leak the IDMA child device if the second
mfd_add_devices() call fails?

If the first mfd_add_devices() call above succeeds, but the second one fail=
s:

	ret =3D mfd_add_devices(dev, lpss->devid, lpss->cell,
			      1, info->mem, info->irq, NULL);
	if (ret)
		goto err_remove_ltr;

The error path skips unwinding the first child device:

err_remove_ltr:
	intel_lpss_debugfs_remove(lpss);
	intel_lpss_ltr_hide(lpss);
	intel_lpss_unregister_clock(lpss);

This seems to lack the required mfd_remove_devices(dev) call, leaving the
previously added IDMA child device permanently registered. Could this cause=
 a
use-after-free when devres frees the parent driver structures?

[Severity: High]
This is a pre-existing issue, but can a clock gate resource be leaked on the
error path of intel_lpss_register_clock_divider() in drivers/mfd/intel-lpss=
.c?

When registering the clock divider, the gate clock is successfully register=
ed:

	tmp =3D clk_register_gate(NULL, name, __clk_get_name(tmp), 0,
				lpss->priv, 0, 0, NULL);
	if (IS_ERR(tmp))
		return PTR_ERR(tmp);

If the subsequent fractional divider registration fails:

	tmp =3D clk_register_fractional_divider(NULL, name, __clk_get_name(tmp),
					      0, lpss->priv, 1, 15, 16, 15,
					      CLK_FRAC_DIVIDER_POWER_OF_TWO_PS,
					      NULL);
	if (IS_ERR(tmp))
		return PTR_ERR(tmp);

The tmp pointer is overwritten with an error pointer, and the previously
registered gate clock is lost and permanently leaked. Since the clock was
registered without devres (NULL device pointer) and the error path
unregistration function only walks up the clock tree from an unassigned poi=
nter,
the child gate clock cannot be unregistered.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-intel-lpss=
-debugfs-v2-1-a1a4faf5cc63@gmail.com?part=3D1
