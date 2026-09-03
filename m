Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115BB4BD100
	for <mfd@lists.linux.dev>; Thu,  3 Sep 2026 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447413; cv=none; b=SCSBLbNnzzooMymza9F+V9GCF18/8hYjCmV8GNgb+8suqUFH3TNW+RKEB2b2n+6DGqbEBWba3z49WiZJ/CIc90u3VV48P/Uh51/ukRpU10mWhX3/p6k1u7ibG0nD5A68QeA554Pw6ytfoC1TQUTc8NLsPaWNRjbCnLGELLjA/iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447413; c=relaxed/simple;
	bh=NOufo2U0hrKo/LGmxd89M9w+mECFrApcualCWuqcPAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CCphRw0nNSIkduH4CfpgNvJKedpqhmXElPDO/26l/wUOH2wU1bXYQoBTje30A9fL3hh+wJrDzWTlp5EfM9LNuesazub2znVTf5dhyi/iK/yFQlisKxH9nqGdcIV1LfSrDp9yd8HP9tDYC5gqMZCajkWNatgj4hjT4e33SSAt+z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQw/F0Os; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQw/F0Os"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1311F00ACA;
	Thu,  3 Sep 2026 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788447411;
	bh=3KVzg5ckxwzAcTUTKIQh+VNnbFR8Q4T5ASxf5j1+JFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQw/F0OsSpNIro3lWqxOUcYihsSSeTJL4Bw8f/06ZuTV0fQhZ4mjn6wUAk4Il606k
	 pqXvULkPDtx3bWWRBbkFh9tYIaRkumiSjOQpUS4NHShoAVCe1EmDN+PbvuUPNPKHVz
	 9ALR8+C3BCEGbf7KZERu5ph0moF8bxWqGFgI3EJz21nt5AfieGu2DgJHtfjjyK82VV
	 NEoILqVqKBUSHb3S/FyfuDE7FKKfB7KVYzpfS/yuUbKxqFTY5PuRfX9Fkdkrv04F4E
	 5sBF7Xar4BzhqOvrVQ2VsjTOHthLhYPLeZOuU9wJl3AJN4bb00tvrcpSCbuWE18mVc
	 Qu4sLtrMVxiCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: wcd934x: set DMA mask on parent to silence "DMA
 mask not set"
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260903-wcd-dma-v2-1-189cff560a28@ixit.cz>
References: <20260903-wcd-dma-v2-1-189cff560a28@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:56:51 +0000
Message-Id: <20260903145651.AC1311F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized, violating MFD su=
bsystem guidelines.

Pre-existing issues:
- [High] Passing an uninitialized `ddata->dev` to `dev_err_probe` causes a =
NULL pointer dereference if `of_irq_get` fails.
- [High] Improper usage of `devm_regmap_add_irq_chip()` in a dynamic callba=
ck leads to devres leaks and double registrations.
--

commit 8dc8a0470b92c9050119b56c1d1e8f85a3dcc721
Author: David Heidelberg <david@ixit.cz>

    mfd: wcd934x: set DMA mask on parent to silence "DMA mask not set"
   =20
    The wcd934x MFD parent (a slim_device) never initializes its
    dma_mask/coherent_dma_mask. When the DT-aware children pass through
    of_dma_configure() this triggers the "DMA mask not set" warning for
    each child.

> mfd: wcd934x: set DMA mask on parent to silence "DMA mask not set"

[Severity: Low]
This isn't a bug, but does the commit message follow the MFD subsystem
formatting rules? The guidelines require the description after the subsystem
prefix to be capitalized, but "set" starts with a lowercase letter.

> diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> index 3c3080e8c8cf7..853edda9b6da7 100644
> --- a/drivers/mfd/wcd934x.c
> +++ b/drivers/mfd/wcd934x.c
> @@ -217,6 +218,11 @@ static int wcd934x_slim_probe(struct slim_device *sd=
ev)
>  	struct gpio_desc *reset_gpio;
>  	int ret;
> =20
> +	ret =3D dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to set dma mask\n");
> +
>  	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
>  		return	-ENOMEM;

[Severity: High]
This isn't a bug introduced by this patch, but can this cause a NULL pointer
dereference further down in wcd934x_slim_probe()?

If of_irq_get() fails, the error path passes ddata->dev to dev_err_probe():

drivers/mfd/wcd934x.c:wcd934x_slim_probe() {
    ...
	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
	if (!ddata)
		return	-ENOMEM;

	ddata->irq =3D of_irq_get(np, 0);
	if (ddata->irq < 0)
		return dev_err_probe(ddata->dev, ddata->irq,
				     "Failed to get IRQ\n");
    ...
}

Since ddata was just allocated with devm_kzalloc(), ddata->dev is NULL. When
dev_err_probe() passes this down to __dev_probe_failed(), it dereferences t=
he=20
NULL pointer.


[Severity: High]
This is a pre-existing issue, but does the use of managed devres functions =
in
wcd934x_slim_status_up() cause memory leaks and double registrations?

drivers/mfd/wcd934x.c:wcd934x_slim_status_up() {
    ...
	ret =3D devm_regmap_add_irq_chip(dev, ddata->regmap, ddata->irq,
				       IRQF_TRIGGER_HIGH, 0,
				       &wcd934x_regmap_irq_chip,
				       &ddata->irq_data);
    ...
}

wcd934x_slim_status_up() is called when the SLIMbus transitions to=20
SLIM_DEVICE_STATUS_UP. If the bus goes DOWN, mfd_remove_devices() is called=
,=20
but the IRQ chip added via devm_regmap_add_irq_chip() is not removed becaus=
e=20
devres cleanup only happens on driver unbind, not on bus status changes.=20

When the bus transitions UP again, wouldn't the driver attempt to re-regist=
er
the IRQ chip and fail with -EBUSY, leaving the device in an unusable state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-wcd-dma-v2=
-1-189cff560a28@ixit.cz?part=3D1
