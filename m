Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F1549F127;
	Mon, 14 Sep 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398760; cv=none; b=lSGtTUpnr+DXiebEzzKlz91/Bfxtvmqm21thAY+JyYP4NknAoNM1ljtDcIJmj3s7uVbgNcSXQZZ4QD+5B07K3ihEwJdfyy09KJDNs6PKtqy4qmUTVnVZVWkxfn6aF/3Sn2k6g3xCfX6yNnyNs48IBzOixAn0MO65syo82qdMV5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398760; c=relaxed/simple;
	bh=WBlcYe9fynpuMucgZYO7uld8X8Uro+qJnHTHjEx4c+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YJZb6wLUiN7x5JcVLo/DlgSQ92nbQRo/SVpL561lyAYLHGbqEBnd3WeLcAMGh/202nZGLKETU094xeCBDDK5rD4Qe7sPoq1bGnTFkKsI52TZlaHbn6L3bYnR6iRtecyJFNZoRm/J95vHjhSCh7IVFaRLER6UsPzOejq5qrI3k4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUQe/HSO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUQe/HSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911CA1F000FF;
	Mon, 14 Sep 2026 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398758;
	bh=PHchHoSOvylQXS8yo1lGEe+XDhzSO0QNW7HgbcT4pYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TUQe/HSOdIu9qt7437cmC4S73nbB8mfNFEKOrSo7B/HJU1Bh/d/CfSQOn456lEWlH
	 Fk1em3b8Xlj9RP1RemsCkU3c3GQm7I/8PrQd9Ax1c5ZNXuRvNObmRsq7X8ssmAydv+
	 dWRAqK+TpjaxR9vqTXYUHaBbhtYBuryWE154D4PYpeJaPPbhP+Ms/OYP70lDszpZhF
	 E7ZMkau2dvdCs2YsCdfQAyKo4rLGFVA8t0ff8RgPHVXFnt0l96+SekVzrhCubYiz1b
	 TkNkodPpX/27uHDGtgY/gFgoNwueWQmgKiHZPqXu8TyJX6FjBJwjiivnhjWsZmaTkN
	 bpuW2rJSwffAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 02/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-2-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-2-4aaf5c09b5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:12:37 +0000
Message-Id: <20260914151237.911CA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Predefined modes overlapping with DT-defined modes cause duplica=
te entries in the sysfs `reboot_modes` attribute.
--

commit 394fababa44a1d093815c91cc11774a6de1c1f6b
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

power: reset: reboot-mode: Add support for predefined reboot modes
   =20
Extend the reboot-mode framework to support driver-defined predefined reboot
modes. Add a centralized initcall to initialize driver state along with
predefined modes.

> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index 328fa37598df3..fd61de2263836 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c

[ ... ]

> @@ -160,11 +234,38 @@ static int reboot_mode_create_device(struct reboot_=
mode_driver *reboot)
>  	return 0;
> =20
>  error:
> -	reboot_mode_release_list(priv);
> +	reboot_mode_release_list(&priv->head);
>  	kfree(priv);
>  	return ret;
>  }
> =20
> +static int reboot_mode_add_predefined_modes(struct reboot_mode_driver *r=
eboot)
> +{
> +	const struct reboot_mode_entry *modes =3D reboot->predefined_modes;
> +	struct mode_info *info;
> +	size_t i;
> +
> +	if (!modes)
> +		return 0;
> +
> +	for (i =3D 0; i < reboot->predefined_mode_count; i++) {
> +		if (modes[i].name && strpbrk(modes[i].name, "\n ,/"))
> +			return -EINVAL;
> +
> +		if (!modes[i].count || modes[i].count > ARRAY_SIZE(modes[i].magic))
> +			return -EINVAL;
> +
> +		info =3D reboot_mode_create_info(reboot->dev, modes[i].name,
> +					       modes[i].magic, modes[i].count);
> +		if (IS_ERR(info))
> +			return PTR_ERR(info);
> +
> +		list_add_tail(&info->list, &reboot->head);

[Severity: Medium]
Will this lead to duplicate string entries in the sysfs reboot_modes
attribute?

If a reboot mode provided by the Device Tree has the same name as one of the
driver's predefined modes, reboot_mode_register() parses the DT property and
adds it to the reboot->head list first.

Immediately after, reboot_mode_add_predefined_modes() blindly appends the
predefined mode to the same list here without checking if an entry with that
name already exists.

The duplicate entries are unconditionally propagated to the sysfs structure=
 in
reboot_mode_create_device(). This will cause reboot_modes_show() to print
all modes sequentially, resulting in duplicate strings in sysfs when usersp=
ace
reads the /sys/class/reboot-mode/.../reboot_modes file.

> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * reboot_mode_register - register a reboot mode driver
>   * @reboot: reboot mode driver

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-arm-psci-s=
ystem_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com?part=3D2
