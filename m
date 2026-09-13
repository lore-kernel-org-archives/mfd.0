Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F5C14AD0D
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304832; cv=none; b=SPn86ifz4E8hiElVBYVj/HjYIeviPTxqjoEmkTKeuo3PObhtmqw7HPN9C6GPvyrLulO6KgM+3NlseQe6XNAR6hWRykGu3hIUPRaFP8EY83vb7rUStVuMuFm4aPvfXslSoJSie4DDPnZ0ej+c3CzYLzqH53S48amorlyPzG+OKSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304832; c=relaxed/simple;
	bh=6N76gpgu5Q3bN0HZpXQaPKF5QMNR4YYMV/gYwhVxCpo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TUo4/BFYBgfFDZmTZTSD95KO/9cs3ynAx131dSRBb7I5+RSihDEPE3yKEtDiipUZ0isTRlToXBZ0Z7ZlBrDlUTwbTDGLi8/E+ClTEVtzMW0ueWlVdq9eEwciXWZSgesBGGdCx78HLjNtyJGofMP6b73q2Z4QbjV9jOZ1glIig+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCGI4UeS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCGI4UeS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F5F1F000FF;
	Sun, 13 Sep 2026 13:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789304830;
	bh=TLAGRLYwADjJdd1fLhWAPP8dSWosQVU+qpa6fnHyjJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oCGI4UeS3my7bMLkuRVV53X29Dyv9tJNZJcF6DwL+IEDZj+PhtR62co5+kx+jjWyT
	 Ki4n3BP6Vw7FZa0p/YCJpIheB878ewODXMkbyjtU4Tx5B/TpDv2qTslZvqCa13j7zb
	 y+DPXm6u1j7nxr+9VtH/B+TLSIBtpl0g9Shr5/OxohEnS+1daEXpOnvGBr19ozQl9+
	 LK4h7V/XSQXF4biA1yuKikvHA+DPROa+Aj5zMJqFLyJpPROixWmefj7nFaMUpgWxTy
	 zOERTSJdnlJh9WF9MLS5BXlJxkeRYddENAoW6UXVoqm6o2aOUZoK/vsW6N9NPI2MDu
	 4c72sttSx6vsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mfd: intel-lpss: Fix DebugFS initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Lisina" <sekoohaka.sarisan@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com>
References: <20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 13:07:09 +0000
Message-Id: <20260913130710.63F5F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing unwinding of successfully registered MFD child devices on =
probe failure.
--

commit c27fe2681171dc4bc688bb38beb6968be3f1b34d
Author: Maria Lisina <sekoohaka.sarisan@gmail.com>

mfd: intel-lpss: Fix DebugFS initialization

This commit updates intel_lpss_init() and intel_lpss_debugfs_add() to
gracefully handle the case where DebugFS is disabled. This prevents the dri=
ver
from spamming the kernel log with unnecessary warning messages during probe.

> diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
> index 63d6694f71457..c2cb58c0f98a9 100644
> --- a/drivers/mfd/intel-lpss.c
> +++ b/drivers/mfd/intel-lpss.c
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
This is a pre-existing issue, but looking at the rest of intel_lpss_probe(),
is it possible that we are missing a call to unregister the iDMA child devi=
ce
if the main cell registration fails?

If the first mfd_add_devices() call for the iDMA cell succeeds, but the sec=
ond
mfd_add_devices() call for the main cell fails, the code jumps to the
err_remove_ltr error path:

	ret =3D mfd_add_devices(dev, lpss->devid, lpss->cell,
			      1, info->mem, info->irq, NULL);
	if (ret)
		goto err_remove_ltr;

...

err_remove_ltr:
	intel_lpss_debugfs_remove(lpss);
	intel_lpss_ltr_hide(lpss);
	intel_lpss_unregister_clock(lpss);

Since err_remove_ltr does not call mfd_remove_devices(dev), does this leave
the successfully registered iDMA device active while its parent structures
are freed, potentially leading to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-intel-lpss=
-debugfs-v3-1-1b8e2b1f0992@gmail.com?part=3D1
