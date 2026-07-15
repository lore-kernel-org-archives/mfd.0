Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C3C35202E
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102105; cv=none; b=HY+QrpgQOSmQNkt5zHt9leL6fJwrK/KKvZG71HHeySSdKixrmuSXFwOwUEriwI246vWB1wDzRbok/H/2XTvwoawH4t3anrb57H9n6RoOTrUdif+7yHjpmOAinaFXOz/z7TlAE4QxY+/Ko35BIdknMbcQZSetwsJbEQXEhEcXh1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102105; c=relaxed/simple;
	bh=0U+nWVesc7Qq2MOUMr7CagXJ3wxgDDFQAsm8x5rDH3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KbNBwi1IXsYK+DO1/VqvAykFCXnOS2TCDqtaiGGT0tK46ejyUMkZ84Zjn8N17ftce6mVLizj9gdj0WE+0FHTfn6esnIdXER+v/jxyZt+mCHSwmazqlkLKqYYgS8ldDuz63Z0YowzH4QkfAEeylaaogXW2QBkVjcHjGxEqvFWhfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AllxoRaZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AllxoRaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2FB1F000E9;
	Wed, 15 Jul 2026 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784102104;
	bh=k/kkWHkVRZDMmxVmicBCDgjSBjf8C5VarBDt1ghFZPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AllxoRaZclLorqQ0roxC9ftRrS12wT8z5U2tnexTJkVZyAzkSbbGIBCYkT8vWsfI7
	 Rxy00Bf1sQw3gjtPOzWwSGkQ4/1TUFVRb0Do1TFuf4yvjSV9Ko4YLBAHBXclpG8nSI
	 HuGcwVMeRboh4yrDquA8PiQCXKP/ARINrDsPD4ZYx9DrSDHaceS3HONMYM/P2/9T9c
	 hoWqq1coEjcEGDDj8aLvwZ9e6OSKXLVQh0qTrZVBEWkml/MAleIiHDrlPQ55ZfmZ9g
	 JTqzx2GHdiqo+33kClKUnDJRSaRaSIng77AszQxWQF0uwXqcVzMFSuO6wYaBmSgdNP
	 zhWCF73UwcqHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] fpga: m10bmc-sec: add image_load sysfs for N3000
 and D5005
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SW9udXQgTmVjaGl0YSAoV2luZCBSaXZlcik=?= <ionut.nechita@windriver.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260715073854.26117-2-ionut.nechita@windriver.com>
References: <20260715073854.26117-1-ionut.nechita@windriver.com>
 <20260715073854.26117-2-ionut.nechita@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:55:03 +0000
Message-Id: <20260715075504.3B2FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Lack of synchronization in the `image_load` sysfs handler allows c=
oncurrent firmware reloads and races with ongoing secure firmware uploads.
- [Medium] The 'control' sysfs group creates an empty directory even when t=
he device does not support image loading, failing to completely hide the gr=
oup.
- [Low] The image load handler arrays and their pointer in `m10bmc_sec_ops`=
 are not declared as `const`, storing function pointers in mutable memory.
--

--- Patch [1]: [PATCH v1 1/1] fpga: m10bmc-sec: add image_load sysfs for N3=
000 and D5005 ---
commit d97d9214f834756bd204bc187982a995a0b7658d
Author: Ionut Nechita <ionut.nechita@windriver.com>

fpga: m10bmc-sec: add image_load sysfs for N3000 and D5005

This commit adds the control/available_images and control/image_load
sysfs attributes to trigger a reload of a BMC or PKVL retimer firmware
image. It handles device-specific configuration for N3000 and D5005 cards.
The control group is intended to be hidden when not supported.

> diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel=
-m10-bmc-sec-update.c
> index 7d23d914df3f2..7a390cd705161 100644
> --- a/drivers/fpga/intel-m10-bmc-sec-update.c
> +++ b/drivers/fpga/intel-m10-bmc-sec-update.c
> @@ -15,8 +15,14 @@
> =20
>  struct m10bmc_sec;
> =20
> +struct image_load {
> +	const char *name;
> +	int (*load_image)(struct m10bmc_sec *sec);
> +};
> +
>  struct m10bmc_sec_ops {
>  	int (*rsu_status)(struct m10bmc_sec *sec);
> +	struct image_load *image_load;		/* terminated with { } member */

[Severity: Low]
Should this pointer be declared as const struct image_load * to ensure the
function pointers remain in read-only memory?

>  };

[ ... ]

> +static struct image_load n3000_image_load_hndlrs[] =3D {
> +	{
> +		.name =3D "bmc_factory",
> +		.load_image =3D m10bmc_sec_bmc_image_load_1,
> +	},
> +	{
> +		.name =3D "bmc_user",
> +		.load_image =3D m10bmc_sec_bmc_image_load_0,
> +	},
> +	{
> +		.name =3D "retimer_fw",
> +		.load_image =3D m10bmc_sec_retimer_eeprom_load,
> +	},
> +	{}
> +};
> +
> +static struct image_load d5005_image_load_hndlrs[] =3D {
> +	{
> +		.name =3D "bmc_factory",
> +		.load_image =3D m10bmc_sec_bmc_image_load_0,
> +	},
> +	{
> +		.name =3D "bmc_user",
> +		.load_image =3D m10bmc_sec_bmc_image_load_1,
> +	},
> +	{}
> +};

[Severity: Low]
Would it be better to mark these arrays as const? Placing executable
function targets in mutable memory increases the kernel's attack surface.

[ ... ]

> +static ssize_t image_load_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct m10bmc_sec *sec =3D dev_get_drvdata(dev);
> +	const struct image_load *hndlr;
> +	int ret =3D -EINVAL;
> +
> +	for (hndlr =3D sec->ops->image_load; hndlr->name; hndlr++) {
> +		if (sysfs_streq(buf, hndlr->name)) {
> +			ret =3D hndlr->load_image(sec);
> +			break;
> +		}
> +	}
> +
> +	return ret ? : count;
> +}
> +static DEVICE_ATTR_WO(image_load);

[Severity: High]
Does this sysfs handler need synchronization (such as acquiring bmcfw_lock)?

Without driver-level locking, concurrent writes to the image_load attribute
could cause multi-step hardware operations to race. This might also race
with ongoing secure firmware uploads in the background.

For example, m10bmc_sec_retimer_eeprom_load() performs a check-then-act
sequence:

m10bmc_sec_retimer_eeprom_load()
    retimer_check_idle(sec);
    trigger_retimer_eeprom_load(sec);
    poll_retimer_eeprom_load_done(sec);

Could concurrent executions silently corrupt the hardware doorbell state?

> +
> +static umode_t
> +m10bmc_control_visible(struct kobject *kobj, struct attribute *attr, int=
 n)
> +{
> +	struct m10bmc_sec *sec =3D dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	if (!sec->ops->image_load)
> +		return 0;
> +
> +	return attr->mode;
> +}

[Severity: Medium]
The commit message states the control group is hidden for the N6000:
"The control group is hidden via its is_visible() callback whenever the
device ops do not provide an image_load table, so N6000 ... is unaffected."

However, does returning 0 here actually hide the group directory?

As per the sysfs API, returning 0 for a named group only suppresses its
internal attributes, leaving an empty directory visible. Should this
return SYSFS_GROUP_INVISIBLE to completely hide the control/ directory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715073854.2611=
7-2-ionut.nechita@windriver.com?part=3D1
