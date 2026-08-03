Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454CA366562;
	Mon,  3 Aug 2026 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751145; cv=none; b=oHsi8e/X1sQg1xFJQeejBPaA1POCZradfn7v6GHNTfeWNyKWwV6nMiqjroAgOBwvgLtXNQGiwJ21/2aknUwLyTUC5KGAhk1sdqR0Owf5KbJNBI2jwtkosRAlXYKQBXN/4yCBCXBHq5rNtE/OSFxDOfBFrJr66VZD5v7GW01zAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751145; c=relaxed/simple;
	bh=z9ePozt5hbXewtobOAzuGq0qGTIC/zsH5NBuDxHqFno=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zgn3z8qor3ISF4iuDSu/HoAIjFlLSybIGkh92bcRelaKnWPLpRNBIto7B894twcEippIvmAyrtlrMBfHAdHGOmRJxiD8icU88qMQdQygQF9x7Ht2D9GD119uPY+oQK4QnvShjyE1EtZkuVKKOuqxxgsvLlSxhfv4JDCu47c4kJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPFvZQUO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPFvZQUO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAA21F000E9;
	Mon,  3 Aug 2026 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751144;
	bh=kWWIcEh7Vp8/p7sal5ICu1bVpLyvSXZFleyePq9n/7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UPFvZQUOtdj5/yzRphN4WCfXlo1y2TI5GK+qJq+idVMroS/b1BMcflnzVGhuXBwOi
	 zlQj+5gE7rmOP9xGdqqKE3LzafLIkI6yqxm4B8c5hd1K9B0mzCVzD1/uGXd0frDsWw
	 8KWSu9mxbcuR/CflTrBnSqbPXrE4qdFZhG9O0sq98w1HtbwRPNC57QEeFlTCmE0SjP
	 Qxb5TH8E22cwM6/TkVNlVsDRpLUun+HJMCcQVtF/jb1Ea1kS0pSPDuj3oBXdVxIeXv
	 E3louNrAEOuPHUcwZx1Ui2DkDpJn+R1Qaja9uhrvABwc4jW/XNqi2mzXyDNSFa93EM
	 HV3plpWd2ZVdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 02/12] power: reset: reboot-mode: Add support for
 predefined reboot modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-2-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-2-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 09:59:02 +0000
Message-Id: <20260803095903.CFAA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Duplicate predefined reboot modes are not properly deduplicated aga=
inst DT-defined modes, violating precedence rules and causing duplicate sys=
fs entries.
- [Low] The patch silently changes how device tree arrays are parsed, skipp=
ing valid properties with more than 3 elements.

Pre-existing issues:
- [High] Memory leak of `struct device` in `reboot_mode_unregister_device` =
due to a missing `put_device()`.
- [High] Multiple instances of the same reboot-mode driver cause sysfs name=
 collisions and incorrect device unregistration, leading to a Use-After-Fre=
e.
--

--- Patch [2]: [PATCH v24 02/12] power: reset: reboot-mode: Add support for=
 predefined reboot modes ---
commit a1dab4a1d45dc9572ca3952f97f12675bbb17e32
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

power: reset: reboot-mode: Add support for predefined reboot modes

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Extend the reboot-mode framework to support driver-defined predefined
reboot modes. Add a centralized initcall to initialize driver state
along with predefined modes.

> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index c7e9285c64e92..cf8978c0ce222 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
[ ... ]
> @@ -160,11 +234,38 @@ static int reboot_mode_create_device(struct reboot_=
mode_driver *reboot)
[ ... ]
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

[Severity: Low]
Does this code append predefined modes to the list unconditionally without
checking if a mode with the same name was already populated from the DT?

If a predefined mode has the same name as a mode from the Device Tree, both
entries will be added to the list. When reboot_mode_create_device() iterates
the list, it will create duplicate sysfs entries. Should we check for exist=
ing
modes and deduplicate them to honor the DT precedence rules mentioned in the
commit message?

> +	}
> +
> +	return 0;
> +}
[ ... ]
> @@ -183,52 +284,36 @@ int reboot_mode_register(struct reboot_mode_driver =
*reboot)
> =20
>  	INIT_LIST_HEAD(&reboot->head);
> =20
> -	for_each_property_of_node(np, prop) {
> -		memset(magic, 0, sizeof(magic));
[ ... ]
> +	if (np) {
> +		for_each_property_of_node(np, prop) {
> +			memset(magic, 0, sizeof(magic));
> +			if (strncmp(prop->name, PREFIX, len))
> +				continue;
> +
> +			count =3D device_property_count_u32(reboot->dev, prop->name);
> +
> +			if (count <=3D 0 || count > ARRAY_SIZE(magic) ||
> +			    device_property_read_u32_array(reboot->dev, prop->name, magic, co=
unt)) {

[Severity: Low]
Does this condition strictly reject properties with more than 3 elements
instead of reading up to the maximum supported count?

If a DT configuration defines a reboot mode property with more than 3 items,
it appears this would skip the valid properties entirely. Previously, would
device_property_read_u32_array() have successfully read the first element
and functioned correctly while ignoring extra elements?

> +				dev_dbg(reboot->dev, "reboot mode %s without magic number\n",
> +					prop->name);
> +				continue;
> +			}
[ ... ]
> @@ -272,7 +356,7 @@ static inline void reboot_mode_unregister_device(stru=
ct reboot_mode_driver *rebo
>  	if (!priv)
>  		return;
> =20
> -	reboot_mode_release_list(priv);
> +	reboot_mode_release_list(&priv->head);
>  	kfree(priv);

[Severity: High]
This is a pre-existing issue, but does reboot_mode_unregister_device() leak=
 a
struct device here?

When finding the device, class_find_device() internally increments the
reference count of the returned device:

reboot_mode_unregister_device() {
    reboot_mode_device =3D class_find_device(&reboot_mode_class, NULL,
                                           reboot->dev->driver->name,
                                           reboot_mode_match_by_name);
    ...
    device_unregister(reboot_mode_device);
}

However, device_unregister() only drops the reference count incremented dur=
ing
device registration. It does not drop the extra reference acquired by
class_find_device(). Could this lead to a memory leak every time a driver is
unregistered or fails to probe?


[Severity: High]
This is a pre-existing issue, but can having multiple instances of the same
reboot-mode driver cause sysfs name collisions and a Use-After-Free?

In reboot_mode_create_device(), the sysfs device is uniquely named after the
driver name:

reboot_mode_create_device() {
    priv->reboot_mode_device =3D device_create(&reboot_mode_class, NULL, 0,
                                             (void *)priv, "%s",
                                             reboot->dev->driver->name);
}

If multiple instances of the driver exist (e.g., "qcom-pon"), this guarante=
es
a naming collision. The second instance will fail to probe.

During the error path, reboot_mode_unregister_device() matches the device
purely by the shared driver name:

reboot_mode_unregister_device() {
    reboot_mode_device =3D class_find_device(&reboot_mode_class, NULL,
                                           reboot->dev->driver->name,
                                           reboot_mode_match_by_name);
}

This incorrectly finds and unregisters the first successfully initialized
instance's device instead of the failed instance's device, and frees its
private data. Subsequent sysfs operations on the first instance could then
trigger a Use-After-Free.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D2
