Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E30376BE0
	for <mfd@lists.linux.dev>; Fri, 24 Jul 2026 19:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784921626; cv=none; b=PX6h3d9CYq4pJ0cyYJ0FemCiIXBsqCScnmiihqHdD45F2vZxo3T2/2/FWREel1qcVg3GZ9vAOVLfEL8riqlOAoCLfEu1ag+Bu5keQA9HstsTOFqxqUVwusPEoYW9TLyui4U8IfTmwKv5onaRmCxc4+Wqe97MQ0ddo6hckl1cVtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784921626; c=relaxed/simple;
	bh=IlS+BY3NWCkLm3Ydm0/CJDaOYm47Ppq0anudGwnatB8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gB9obnWZ2OD6rXMqbZkSGkd8ZwtEIwYFNoQmqRwyUfLIVlJaKScullZYAeQz0gKqkRyfumwJClkZM/5WzUJDIlNU/s+CyAL+UTNt3uYJbMXZfRpIwO1pqRmg6Q+eW8JuPfHbV91pW8hiAUzIaIEO5IKDAONCCsnGZs5L7JRE6Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYniMtyu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYniMtyu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026861F000E9;
	Fri, 24 Jul 2026 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784921625;
	bh=clX8UOBgG1nq604gq2V71FYOg8vr5HLvZmUTSuWfNEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SYniMtyuLGBUX9EvX9dyqJXwJfHUS0Hp5jH0rghgC7p5jBE0uJhwSAZ2krzEPlups
	 Ffx099AR971OEQCrkdjxZQ2YziFbClYBEEroNPLyxEXbxbwbs1EeI9YyeXZ3mwuc33
	 0i01MX3gTyD4wnVVwPP2efPrAjlQzA7WAcGKBKEk6TYsFMut+33q04JGTU+qUpGDo9
	 7mw5YVOPQOl2XlSdZJon5T4VJSGJxuCphrDT+/2Gk7RznywvT/4w5yaYFXN2jf9LHj
	 TjP/nL+IDRbChGeLDRz5/y28fAXk/IHXs2UuWodE7CVMUGuY37gDtSkiTunP/OVxoX
	 RoghTBopthc3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] fpga: m10bmc-sec: add image_load sysfs for N3000 and
 D5005
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ionut Nechita" <ionut.nechita@windriver.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260724192117.60493-1-ionut.nechita@windriver.com>
References: <20260724192117.60493-1-ionut.nechita@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 19:33:44 +0000
Message-Id: <20260724193345.026861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `cancel_request` flag is erroneously cleared after acquiring `=
sec->lock` in `m10bmc_sec_prepare()`, causing valid firmware update cancell=
ations to be silently ignored.
- [Medium] The `is_visible` callback for the `control` group returns `0` in=
stead of `SYSFS_GROUP_INVISIBLE` when the device does not support image rel=
oading, leaving an empty directory in sysfs.
--

--- Patch [1]: [PATCH v2] fpga: m10bmc-sec: add image_load sysfs for N3000 =
and D5005 ---
commit d8e9e7daf1e274b64b2638b22b26c8f13aa35b4d
Author: Ionut Nechita <ionut.nechita@windriver.com>

fpga: m10bmc-sec: add image_load sysfs for N3000 and D5005

This commit adds the control/available_images and control/image_load sysfs
attributes for the N3000 and D5005 cards to allow triggering a reload of an
image already present in FLASH or EEPROM. It also introduces a mutex to
serialize image reloads against firmware uploads.

Link: https://lore.kernel.org/lkml/20260715073854.26117-1-ionut.nechita@win=
driver.com/
Link: https://lore.kernel.org/linux-fpga/amGYhCKpesGH%2FyLB@yilunxu-OptiPle=
x-7050/

> diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel=
-m10-bmc-sec-update.c
> index 7d23d914df3f2..06c9f9130c580 100644
> --- a/drivers/fpga/intel-m10-bmc-sec-update.c
> +++ b/drivers/fpga/intel-m10-bmc-sec-update.c
[ ... ]
> +static umode_t
> +m10bmc_control_visible(struct kobject *kobj, struct attribute *attr, int=
 n)
> +{
> +	struct m10bmc_sec *sec =3D dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	if (!sec->ops->image_load)
> +		return 0;

[Severity: Medium]
Will returning 0 here for named groups leave an empty control directory in
sysfs?

If the device does not support image reloading (like N6000), returning 0 hi=
des
the individual attributes but still creates the named group directory. Shou=
ld
this return SYSFS_GROUP_INVISIBLE instead to suppress the entire directory?

> +
> +	return attr->mode;
> +}
> +
> +static struct attribute *m10bmc_control_attrs[] =3D {
> +	&dev_attr_available_images.attr,
> +	&dev_attr_image_load.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group m10bmc_control_attr_group =3D {
> +	.name =3D "control",
> +	.attrs =3D m10bmc_control_attrs,
> +	.is_visible =3D m10bmc_control_visible,
> +};
[ ... ]
> -static enum fw_upload_err m10bmc_sec_prepare(struct fw_upload *fwl,
> -					     const u8 *data, u32 size)
> +static enum fw_upload_err m10bmc_sec_do_prepare(struct fw_upload *fwl,
> +						const u8 *data, u32 size)
>  {
>  	struct m10bmc_sec *sec =3D fwl->dd_handle;
>  	const struct m10bmc_csr_map *csr_map =3D sec->m10bmc->info->csr_map;
[ ... ]
> +static enum fw_upload_err m10bmc_sec_prepare(struct fw_upload *fwl,
> +					     const u8 *data, u32 size)
> +{
> +	struct m10bmc_sec *sec =3D fwl->dd_handle;
> +	enum fw_upload_err ret;
> +
> +	mutex_lock(&sec->lock);
> +
> +	ret =3D m10bmc_sec_do_prepare(fwl, data, size);

[Severity: High]
Does calling m10bmc_sec_do_prepare() overwrite a cancellation requested whi=
le
waiting for the lock?

If a firmware upload starts while an image reload is holding sec->lock,
m10bmc_sec_prepare() blocks. If a user tries to cancel the upload during th=
is
time, it sets sec->cancel_request =3D true asynchronously.

When the lock is finally acquired, m10bmc_sec_do_prepare() unconditionally
sets the flag to false:

static enum fw_upload_err m10bmc_sec_do_prepare(...)
{
    ...
    sec->cancel_request =3D false;

Will this erase the abort state and proceed to flash the device despite the
cancellation request?

> +	if (ret !=3D FW_UPLOAD_ERR_NONE)
> +		mutex_unlock(&sec->lock);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724192117.6049=
3-1-ionut.nechita@windriver.com?part=3D1
