Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3803F58DB
	for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547485; cv=none; b=PMVHEEgI3HuUe76aIG0Ve3WYs9i0M+k4HVgnwUklF9ukOnsi2fB/PRTVpifKHGv4KNHijszGK3Iq4+0H+bFk/toxt6VPczriTgHWgtsWx03kW2fsaNJtYQmVuu9hYD+fezCa3OcIYOcW2hiDRDDQ8P6Zwx1e/ylpzyZLbhBzA1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547485; c=relaxed/simple;
	bh=3yRkGqdrI7KrG41KEABug6EEi6VXhcHYjXclfxW0zB4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ekvwLi2r9pK97RCEmJ6aw63dXwW3FJcTCQn4FLFu8UQvHKKTe4yoSBwkh4sy7lPyBP2E3T7N0JpGH5shZB086Q4FmyoE3ruCwrZt1ySBiXeMEh03KCqyH+1+PdrWLnTE4kY3/O9PjxoFmdxM4ja54IeeJ6qK+yYsLRVlf6cfGr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaAUcWXw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaAUcWXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD601F000E9;
	Mon, 20 Jul 2026 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784547483;
	bh=g1w7s3Yz6+7oo51KSMD3xmIq0R6YtdiSJkWW2irLWtc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YaAUcWXwBOykuWUTx0Zg9/aUWRUDVnhe5VK4aftu/EZwlFq20yAD2latty1f5jv/7
	 zq2UhIzwolOLb4b3z1EzBucyOXf+df08VbPpSD06hL0vyg9zoR6Y6Z0VPEmwkE3AAk
	 cz2FBj4zdJXJSKWy/8bRVmd7VPf0dYQQWkXS3jKIz7teoaPf51/je5T3Xp/yQQD3yD
	 Gdih97Mncawc5+sAky5oGHErUYAmaqeLj4c9K/Tr04l+VP8ClRHG1HbYZKsMyQsuxT
	 d8H9SqrMHA37NjPHDgxPG9vigWInwh8b+pF5t0PKsPGPp5dOh67bCr7JFPAfvVILVo
	 dkqXbI7sd5Q3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: sm501: Fix potential memory leak in
 sm501_register_gpio_i2c_instance()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdun Nihaal" <nihaal@cse.iitm.ac.in>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260720112533.70538-1-nihaal@cse.iitm.ac.in>
References: <20260720112533.70538-1-nihaal@cse.iitm.ac.in>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:38:03 +0000
Message-Id: <20260720113803.9BD601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The patch attempts to fix a memory leak by calling `platform_dev=
ice_put(pdev)`, but `pdev->dev` is uninitialized, so this call triggers ker=
nel warnings and fails to free the memory.

Pre-existing issues:
- [High] Calling `devm_kzalloc()` on an uninitialized device causes a NULL =
pointer dereference due to an uninitialized `devres_head` list.
- [High] Child device registration failures are ignored and do not unwind p=
reviously registered children, violating MFD subsystem guidelines.
- [High] The gpiod_lookup_table is leaked into a global list on device tear=
down or registration failure, leading to a system-wide use-after-free.
--

--- Patch [1]: [PATCH] mfd: sm501: Fix potential memory leak in sm501_regis=
ter_gpio_i2c_instance() ---
commit f652b0e65b80462f6ec3c55b8327bfdfcd49d805
Author: Abdun Nihaal <nihaal@cse.iitm.ac.in>

mfd: sm501: Fix potential memory leak in sm501_register_gpio_i2c_instance()

The memory allocated for pdev in sm501_create_subdev() is not freed in
an error path in sm501_register_gpio_i2c_instance(). Fix that by
releasing the platform dev in the error path.

> diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> index b5bda477ebfc2..49c6b21a44e8e 100644
> --- a/drivers/mfd/sm501.c
> +++ b/drivers/mfd/sm501.c
> @@ -1103,8 +1103,10 @@ static int sm501_register_gpio_i2c_instance(struct=
 sm501_devdata *sm,
>  	/* Create a gpiod lookup using gpiochip-local offsets */
>  	lookup =3D devm_kzalloc(&pdev->dev, struct_size(lookup, table, 3),
>  			      GFP_KERNEL);

[Severity: High]
This isn't a bug introduced by this patch, but does calling devm_kzalloc()
here cause a NULL pointer dereference?

In sm501_create_subdev(), the pdev is allocated using kzalloc():

sm501_create_subdev() {
    ...
    smdev =3D kzalloc(sizeof(struct sm501_device) + ...
    ...
}

However, device_initialize() is never called before the device is returned.
This means pdev->dev.devres_head is zero-initialized. When devm_kzalloc()
calls devres_add(), it uses list_add_tail() which will unconditionally
dereference the NULL prev pointer.

> -	if (!lookup)
> +	if (!lookup) {
> +		platform_device_put(pdev);

[Severity: Medium]
Since pdev was only allocated with kzalloc() and lacks a device_initialize()
call, will platform_device_put() fail to actually free the memory?

Because the kobject state is uninitialized and the refcount is zero,
kobject_put() will emit a warning, and kref_put() operating on a zero
refcount prevents the release function from executing. Would it be safer
to use kfree() directly on pdev here, or properly initialize the device
in sm501_create_subdev() first?

>  		return -ENOMEM;
> +	}
> =20
>  	lookup->dev_id =3D "i2c-gpio";
>  	lookup->table[0] =3D (struct gpiod_lookup)

[ ... ]

>  	lookup->table[1] =3D (struct gpiod_lookup)
>  		GPIO_LOOKUP_IDX(iic->pin_scl < 32 ? "SM501-LOW" : "SM501-HIGH",
>  				iic->pin_scl % 32, NULL, 1,
>  				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN);
>  	gpiod_add_lookup_table(lookup);

[Severity: High]
This is a pre-existing issue, but does adding this lookup table to the glob=
al
gpio_lookup_list create a system-wide use-after-free risk?

When the device is unregistered during driver unbind (e.g., in
sm501_dev_remove()), devres will automatically free the lookup table memory.
However, since gpiod_remove_lookup_table() is never called in the teardown
path, the freed memory remains linked in the global list, which could
corrupt traversals during subsequent device probes or module removals.

> =20
>  	icd =3D dev_get_platdata(&pdev->dev);

[ ... ]

>  	pdev->id =3D iic->bus_num;
> =20
>  	dev_info(sm->dev, "registering i2c-%d: sda=3D%d, scl=3D%d\n",
>  		 iic->bus_num,
>  		 iic->pin_sda, iic->pin_scl);
> =20
>  	return sm501_register_device(sm, pdev);
>  }

[Severity: High]
This is a pre-existing issue, but does the error handling in sm501_init_dev=
()
properly unwind child devices when registration fails?

Currently, child registration failures are ignored:

sm501_init_dev() {
    ...
    sm501_register_gpio_i2c(sm, pdata);
   =20
    ret =3D sm501_check_clocks(sm);
    if (ret) {
        ...
        return ret;
    }
}
   =20
If a failure occurs during sm501_check_clocks(), the parent probe will
exit with an error and free the parent sm501_devdata context. Since the
previously registered children are never unregistered, will this leave
them active with dangling pointers to the freed parent context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720112533.7053=
8-1-nihaal@cse.iitm.ac.in?part=3D1
