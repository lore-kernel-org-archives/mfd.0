Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FFB4D90D8
	for <mfd@lists.linux.dev>; Thu,  3 Sep 2026 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449595; cv=none; b=H2fFycE3h13L6LLoUtRb+GUYRTmVLDNQJ3hthhNnlTxg5FiPQNSMHBqp6ODw7Y9MbsZWNvl2Dz/Si3pqS7RdiQ0pEsTig9mtEALiY/jXVA6PytmD2jP2RdDu7Las7TC8z3NkgklWbRdHuXQESP0a5iYoTMpHt79mNBKwXQV3jFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449595; c=relaxed/simple;
	bh=5h9tX+mp60F8Oc6SfAt20IAhJeSlaKq5lTqdU3q1bs0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oKz4qnfOFvqg7ckzhjmVmpdLQfC+APWBTZzlGgyxrvwW8IeuPGSW934ngZIYUpudOO6sLruBe7e5VQ8aRiFy+DxCiN2fmF2cKew6KmM7+e0pqNv3lsIcriLGfkznUrRO7WuMJ8GHKCUWkEnCybWB9AsWFX6LFUAvbJ8sXzZLE7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+SHnmbc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+SHnmbc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D581F00A3A;
	Thu,  3 Sep 2026 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788449594;
	bh=iBfEp+SDZnU4QL8xICg4UXqCuuvUict3dQSxgfw+BpU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n+SHnmbczVNgGSJBCVDtwGdkSyUPE37qQozn8Cr0WjpG+ELk8us0K0VWeLjXFP7KZ
	 WEthuv+np1/u7zWvxj+xkmcLVDWkf+d35/+tBF+s/0HgPcNJEc3Y+ZlVC76g116YrJ
	 GA/sPrfU+qYUcfFyWRsu7kFF/cqC+sPcHnGKT0qGU4DVgUprekPOKJ3Stsv8KIDpq6
	 QbcXkY6rqzFTt4m+CxVDhOKw6AYPhXeRCHm/+gyrU8JHs21q7fcbGo9vT5HhWX0uqW
	 wnh6++pDfRm3Ft3aL181Swt/M33QM8UKBWmevJGIRrLxrjl+JqRD8K5/83BK/iHXbA
	 fNUmhI70SPFWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] mfd: wcd934x: Fix NULL pointer dereference on
 IRQ probe deferral
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260903-wcd-dma-v3-1-d3920c6563c4@ixit.cz>
References: <20260903-wcd-dma-v3-0-d3920c6563c4@ixit.cz>
 <20260903-wcd-dma-v3-1-d3920c6563c4@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:33:13 +0000
Message-Id: <20260903153314.37D581F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `regulator_bulk_free()` causes a memory and resource leak =
of unmanaged regulators.
- [High] The unmanaged regmap allocated via `regmap_init_slimbus()` is perm=
anently leaked due to missing `regmap_exit()`.
- [High] Using `devm_regmap_add_irq_chip()` inside the dynamic `wcd934x_sli=
m_status_up()` callback leads to unbounded devres accumulation and IRQ regi=
stration failures.
- [High] Parent MFD driver initializes a private resource (`extclk`) that i=
s consumed by the child codec driver, violating MFD architecture guidelines.
- [High] `of_irq_get()` returning 0 (mapping failure) is incorrectly treate=
d as a valid IRQ, potentially leading to invalid interrupt requests.
--

commit 8457234c3c110957e7336000a7539e523ac72f34
Author: David Heidelberg <david@ixit.cz>
Subject: mfd: wcd934x: Fix NULL pointer dereference on IRQ probe deferral

This commit fixes a NULL pointer dereference during an IRQ probe deferral
in wcd934x_slim_probe. By using dev instead of ddata->dev, which is still
NULL at this point, it prevents a crash when dev_err_probe is called.

Link: https://lore.kernel.org/mfd/20260903145651.AC1311F00ACA@smtp.kernel.o=
rg/

> diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> index 3c3080e8c8cf7..3a939e7ad3da5 100644
> --- a/drivers/mfd/wcd934x.c
> +++ b/drivers/mfd/wcd934x.c
> @@ -223,7 +223,7 @@ static int wcd934x_slim_probe(struct slim_device *sde=
v)
> =20
>  	ddata->irq =3D of_irq_get(np, 0);
>  	if (ddata->irq < 0)
> -		return dev_err_probe(ddata->dev, ddata->irq,
> +		return dev_err_probe(dev, ddata->irq,
>  				     "Failed to get IRQ\n");

[Severity: High]
This isn't a bug introduced by this patch, but does this incorrectly treat a
return value of 0 as a valid IRQ?

of_irq_get() returns 0 when it explicitly fails to map an interrupt, but the
check here only handles < 0. If the device tree lacks a valid interrupt
mapping, it looks like this could pass 0 as a valid IRQ, potentially leading
to delayed initialization failures or mistakenly requesting a critical syst=
em
interrupt.

> =20
>  	ddata->extclk =3D devm_clk_get(dev, "extclk");

[Severity: High]
This is a pre-existing issue, but does this violate MFD subsystem
architectural guidelines by initializing a private resource in the parent
driver?

The parent MFD driver appears to fetch the extclk clock handle that is
meant entirely for the child codec driver. The MFD guidelines specify that
parent drivers should not initialize private resources consumed by their
child drivers to avoid rigid coupling and potential use-after-free bugs
during refactoring.

[Severity: High]
This isn't a bug introduced by this patch, but does this driver leak the
unmanaged regulators on unbind or probe error?

In wcd934x_slim_probe(), the driver allocates unmanaged regulators:

	ret =3D regulator_bulk_get(dev, WCD934X_MAX_SUPPLY, ddata->supplies);
	if (ret)
		return dev_err_probe(dev, ret, "Failed to get supplies\n");

However, during device teardown in wcd934x_slim_remove(), the regulators are
disabled but never freed:

	regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
	mfd_remove_devices(&sdev->dev);

Since regulator_bulk_get() is used rather than devm_regulator_bulk_get(),
does the missing regulator_bulk_free() cause a direct memory and resource
leak on every device unbind or probe error?

[Severity: High]
This is a pre-existing issue, but is the unmanaged regmap leaked when the
SLIMbus transitions to SLIM_DEVICE_STATUS_DOWN or the driver is unbound?

In wcd934x_slim_status_up(), an unmanaged regmap is manually allocated:

	ddata->regmap =3D regmap_init_slimbus(sdev, &wcd934x_regmap_config);

When the device goes down in wcd934x_slim_status():

	case SLIM_DEVICE_STATUS_DOWN:
		mfd_remove_devices(&sdev->dev);
		break;

The regmap_exit() call appears to be completely omitted. If the SLIMbus
hardware state dynamically cycles UP and DOWN, would a new regmap be
allocated each time wcd934x_slim_status_up() runs, permanently leaking the
previous one?

[Severity: High]
This isn't a bug introduced by this patch, but does using a managed device
resource inside the dynamic wcd934x_slim_status_up() callback lead to
unbounded devres accumulation?

In wcd934x_slim_status_up():

	ret =3D devm_regmap_add_irq_chip(dev, ddata->regmap, ddata->irq,
				       IRQF_TRIGGER_HIGH, 0,
				       &wcd934x_regmap_irq_chip,
				       &ddata->irq_data);

Because devm_regmap_add_irq_chip() ties the IRQ chip lifecycle to the static
device probe rather than the dynamic bus state, the IRQ doesn't get freed
when the bus goes DOWN. On the next UP transition, would a duplicate devres
entry be leaked, causing request_threaded_irq() to fail with -EBUSY since
the old handler is still holding the IRQ line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-wcd-dma-v3=
-0-d3920c6563c4@ixit.cz?part=3D1
