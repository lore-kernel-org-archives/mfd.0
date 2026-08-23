Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792622D7398
	for <mfd@lists.linux.dev>; Sun, 23 Aug 2026 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787480897; cv=none; b=RXm3MPab7NiVw04+ztW2HMc5xW2BEu/R6LsDyanSn4MCxdWBMNV5M544SvYGPe2+IkEy6Ts8mhsORDJKFIJbgu6z9xVC1GvWgz5b9XC2/kwXaKbakUTdReRnPlT7Nr92+mZ9qdO8OYoleF+ktiSSAzTQqQCjqFmgH9rA2Zj9hXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787480897; c=relaxed/simple;
	bh=kqUa0LyKpfNrM8W/OwOi2hJS9ARBYayQ2jbFHtzQE7g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y6wttg/DSOG5hF4RKG/nwM8fu18ATj7j/OKwTNIX8H6WQN49Uq5woqTfhYTsJXWvl11lAqdWMfoS4FUOKtDQFxaWIjZaHtQ6QKNJol0bGjWtGdDG9jdvIyh8HIaEKaewiAoFM1wnca8dsWMVdWanPKPmBux3ZyJdzD2BjZ9ReNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4gkATmB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4gkATmB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE321F000E9;
	Sun, 23 Aug 2026 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787480896;
	bh=mCXoOUGt/lUI/kgwrRBM1j2tphLXNUgcdJLEr0FVumU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z4gkATmBbke3Ref4AHFg4kRZZxtaEQiREuZdCV/Jfu4f7Hn6ZsjdRqJVZt2QSvBVl
	 63GHqtwo3/S+3yNAOv2edlfu3EG8D9TkKT6BajOjB4PSd558lu9/vQyJlZfve3rRbg
	 IET5bV8FRwHzaIUF8Oab0T7VqVTWN0ivXjkqI7jQ7eZZxnUKTryoGdHRs2M5mFypFa
	 AJLekk+vMRaVfxA8MEZaC5FilTjvPSmszHalYC/Gz88mMVt8GBiE2MZYQPpMIUurm3
	 t4AppVoFC03ZFyuZt5A+2wh6YTw1uUd8O6AFpBG3nPfbiAMSrsmWr9l401uuvBPSrt
	 U5XScMF7oQnRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: wcd934x: set DMA mask on parent to silence "DMA
 mask not set"
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260823-wcd-dma-v1-1-95e44a315ccf@ixit.cz>
References: <20260823-wcd-dma-v1-1-95e44a315ccf@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 10:28:15 +0000
Message-Id: <20260823102815.BEE321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] NULL pointer dereference in error path when of_irq_get() fails.
- [High] Memory and resource leak during SLIMbus status transitions.
- [High] Regulator references are permanently leaked on unbind and probe er=
rors.
- [High] Regulators are disabled before child devices are removed, risking =
bus timeouts and crashes.
--

--- Patch [1]: [PATCH] mfd: wcd934x: set DMA mask on parent to silence "DMA=
 mask not set" ---
commit 37f997595db7b92153ec4714307685274e9c64de
Author: David Heidelberg <david@ixit.cz>

mfd: wcd934x: set DMA mask on parent to silence "DMA mask not set"

The wcd934x MFD parent (a slim_device) never initializes its
dma_mask/coherent_dma_mask. When the DT-aware children pass through
of_dma_configure() this triggers the "DMA mask not set" warning for
each child.

Cc: stable@vger.kernel.org
Fixes: f959dcd6ddfd ("dma-direct: Fix potential NULL pointer dereference")
Assisted-by: tencent:hy3

> diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> index 3c3080e8c8cf7..70ee13791d52b 100644
> --- a/drivers/mfd/wcd934x.c
> +++ b/drivers/mfd/wcd934x.c

[ ... ]

> @@ -217,6 +218,11 @@ static int wcd934x_slim_probe(struct slim_device *sd=
ev)
>  	struct gpio_desc *reset_gpio;
>  	int ret;
> =20
> +	if (!dev->dma_mask) {
> +		dev->dma_mask =3D &dev->coherent_dma_mask;
> +		dev->coherent_dma_mask =3D DMA_BIT_MASK(32);
> +	}
> +
>  	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
>  		return	-ENOMEM;

[Severity: High]
This is a pre-existing issue, but can this lead to a NULL pointer dereferen=
ce
if of_irq_get() fails?

When ddata is allocated here, ddata->dev is not yet initialized (it is
assigned later in the probe function). If the immediate next step fails:

wcd934x_slim_probe() {
    ...
    ddata->irq =3D of_irq_get(np, 0);
    if (ddata->irq < 0)
        return dev_err_probe(ddata->dev, ddata->irq,
                             "Failed to get IRQ\n");
    ...
}

Would passing the NULL ddata->dev to dev_err_probe() cause a crash when it
attempts to record the deferred probe reason?

[Severity: High]
This is a pre-existing issue, but does this code permanently leak regulator
references on probe failure or device unbind?

The regulators are acquired manually without a managed devres API:

wcd934x_slim_probe() {
    ...
    ret =3D regulator_bulk_get(dev, WCD934X_MAX_SUPPLY, ddata->supplies);
    if (ret)
        return dev_err_probe(dev, ret, "Failed to get supplies\n");
    ...
}

However, the error path and wcd934x_slim_remove() only call
regulator_bulk_disable(). Should there be a matching regulator_bulk_free()
call, or should regulator_bulk_get() be replaced with
devm_regulator_bulk_get()?

[Severity: High]
This is a pre-existing issue, but is there a risk of bus timeouts during
driver unbind?

In the remove callback, regulators are disabled before the child devices
are removed:

wcd934x_slim_remove() {
    ...
    regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
    mfd_remove_devices(&sdev->dev);
    ...
}

If active child devices (like the codec or SoundWire) attempt to cleanly sh=
ut
down by writing to hardware registers during their own remove callbacks,
will they hang or time out because the power has already been cut?

[Severity: High]
This is a pre-existing issue, but does the SLIMbus status handling leak mem=
ory
and stack devres allocations?

When the device transitions to SLIM_DEVICE_STATUS_UP, a regmap is manually
allocated and a managed IRQ chip is registered:

wcd934x_slim_status_up() {
    ...
    ddata->regmap =3D regmap_init_slimbus(sdev, &wcd934x_regmap_config);
    ...
}

On transition to SLIM_DEVICE_STATUS_DOWN, mfd_remove_devices() is called, b=
ut
regmap_exit() is never called to free the regmap:

wcd934x_slim_status() {
    ...
    case SLIM_DEVICE_STATUS_DOWN:
        mfd_remove_devices(&sdev->dev);
        break;
    ...
}

Furthermore, since devm_regmap_add_irq_chip() is used during the UP
transition, will repeated UP/DOWN toggles continually accumulate IRQ chip
allocations on the device's devres list without freeing them?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823-wcd-dma-v1=
-1-95e44a315ccf@ixit.cz?part=3D1
