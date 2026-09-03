Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50454DB565
	for <mfd@lists.linux.dev>; Thu,  3 Sep 2026 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449477; cv=none; b=ts/mqTlqfoMW8vr2raF+MbB+E44uovKM+KGjhlO2ff6n5ieK16QJlGDT+8isQFO+iDxhsELe7peanoUNY2WYn7A2UyxFgkSeDVtVOhHwyaT7L5JzJB1OHG/9CUx6e9pwen87RQmR7YpIEN0z9WGhR334WbI+ON/47JVDvxHXAjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449477; c=relaxed/simple;
	bh=SPuRZ29gZxXDq110SNLSX6yEZhIxcLrnnKTrUCIpdDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dx/DwLYivueQpyEsKoRRbgVyS/Mw0TloMV3ZqU0Be6ATY9b8qV2u1u7vLZZ8seoBvp/NOR3EXnpGAG4+B/UnbfoOw0BJtoOLRMLbZlidEKFBkND21sE3sdIFzdw28WlmtQ4QtwMG89efIEJI3I2i92N4yNKqmf9t8F6oHYMfym0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URArfyu7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URArfyu7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623DB1F000E9;
	Thu,  3 Sep 2026 15:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788449475;
	bh=LsVF1FT60eQmyJda42xOLLtP0t2C/1YwBnIamV0IUcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URArfyu7m5DjR7mwx7MQ+XecO21JtwjHkzbqzO0/f4YTa7Bzozi02f6jPFNmdmSfs
	 sM5XNVcEg5X9UUmE3PcDNzktSTzbTV6kjPvLvlt8MyAKq8zGVMY2jVmWyelpTlS1L6
	 K1GNeKayVPrLANAC1cMkr31KibwxFlmql+GUbi+4Mrjr7ynXT40eYDhC5gEYOgNVcF
	 LMkS4xDgN2nGi0Wu+1U4BGtIV2Opvy5d45+rEnQjIP70RyQCYMzk0XdmpEGsBneTST
	 B8UGQ9HKEFIbe7vMwvc/p28Mx6Yr6cqJ4QpKfC4EFzV8pzj3JcYmFdU1ri7jQm9j2z
	 gkXis6oBVF2Pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] mfd: wcd934x: Set DMA mask on parent to silence
 "DMA mask not set"
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260903-wcd-dma-v3-2-d3920c6563c4@ixit.cz>
References: <20260903-wcd-dma-v3-0-d3920c6563c4@ixit.cz>
 <20260903-wcd-dma-v3-2-d3920c6563c4@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 15:31:14 +0000
Message-Id: <20260903153115.623DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unmanaged regulators acquired via regulator_bulk_get() are never f=
reed, leading to a resource leak on probe failure and device removal.
- [High] Unmanaged regmap allocated via regmap_init_slimbus() is never free=
d, leaking memory on error paths and during device state transitions.
- [High] Using managed (devm_*) APIs in a re-entrant state callback leads t=
o unbound devres memory accumulation and breaks device functionality.
--

commit 1da45a618b15f49de3d1b3200c00bf796b019918
Author: David Heidelberg <david@ixit.cz>

mfd: wcd934x: Set DMA mask on parent to silence "DMA mask not set"

The wcd934x MFD parent never initializes its DMA mask. This commit adds a
call to dma_coerce_mask_and_coherent() to set the DMA mask on the parent MFD
device, preventing "DMA mask not set" warnings for children.

> diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
> index 3a939e7ad3da5..fc17c39791301 100644
> --- a/drivers/mfd/wcd934x.c
> +++ b/drivers/mfd/wcd934x.c
[ ... ]
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
This isn't a bug introduced by this patch, but does wcd934x_slim_probe() le=
ak
the regulators acquired via regulator_bulk_get() on error paths?

In wcd934x_slim_probe():

	ret =3D regulator_bulk_get(dev, WCD934X_MAX_SUPPLY, ddata->supplies);
	if (ret)
		return dev_err_probe(dev, ret, "Failed to get supplies\n");

	ret =3D regulator_bulk_enable(WCD934X_MAX_SUPPLY, ddata->supplies);
	if (ret)
		return dev_err_probe(dev, ret, "Failed to enable supplies\n");

If enable fails, it returns directly without calling regulator_bulk_free() =
to
free the regulators.

And further down in the error path:

err_disable_regulators:
	regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
	return ret;

This disables but fails to free them.

Additionally, during device removal in wcd934x_slim_remove():

static void wcd934x_slim_remove(struct slim_device *sdev)
{
	struct wcd934x_ddata *ddata =3D dev_get_drvdata(&sdev->dev);

	regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
	mfd_remove_devices(&sdev->dev);
}

The driver teardown path lacks a call to regulator_bulk_free(), which can
lead to a resource leak of struct regulator consumers.


[Severity: High]
This is a pre-existing issue, but does wcd934x_slim_status_up() leak the
unmanaged regmap on error paths?

When the SLIMbus status transitions to SLIM_DEVICE_STATUS_UP,
wcd934x_slim_status_up() allocates a regmap:

	ddata->regmap =3D regmap_init_slimbus(sdev, &wcd934x_regmap_config);
	if (IS_ERR(ddata->regmap)) {
		dev_err(dev, "Error allocating slim regmap\n");
		return PTR_ERR(ddata->regmap);
	}

	ret =3D wcd934x_bring_up(ddata);
	if (ret) {
		dev_err(dev, "Failed to bring up WCD934X: err =3D %d\n", ret);
		return ret;
	}

If wcd934x_bring_up() fails, it returns directly without calling
regmap_exit().

Furthermore, when the device state transitions to SLIM_DEVICE_STATUS_DOWN
in wcd934x_slim_status():

	case SLIM_DEVICE_STATUS_DOWN:
		mfd_remove_devices(&sdev->dev);
		break;

The DOWN state handler fails to free the unmanaged regmap, leading to
memory leaks on state transitions.


[Severity: High]
This is another pre-existing issue, but does the use of managed APIs in
wcd934x_slim_status_up() lead to unbounded devres accumulation?

	ret =3D devm_regmap_add_irq_chip(dev, ddata->regmap, ddata->irq,
				       IRQF_TRIGGER_HIGH, 0,
				       &wcd934x_regmap_irq_chip,
				       &ddata->irq_data);

Because devm_regmap_add_irq_chip() is called inside a re-entrant state
callback rather than the structural probe lifecycle, a new devres node is
appended every time the device transitions UP.

When the device transitions to SLIM_DEVICE_STATUS_DOWN:

	case SLIM_DEVICE_STATUS_DOWN:
		mfd_remove_devices(&sdev->dev);
		break;

The handler fails to cleanly deregister the IRQ chip. On the next UP
transition, a secondary attempt is made to register the same IRQ, causing
subsequent UP transitions to fail and breaking device functionality.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-wcd-dma-v3=
-0-d3920c6563c4@ixit.cz?part=3D2
