Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5839330DD1B
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316636; cv=none; b=jjOVbQdbeyZLb3lidCWQtKvVH3GFwV4bzFclLwlNLlqxPbHtxnq+Qw3W0g+pTWytdWZoISvArUbkwlXgT3E+Fkc++wq3QsN82H0Swd6Fje3udZP9iXtXITqlfMu04QS46qFOpSamcipxDhwaar02IEm31/zwPG4C20MXSo2QJhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316636; c=relaxed/simple;
	bh=gLS5rhmaQ1JCOod16un8hniU91qbfFNC8g6slLPM+3Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E109XHsS8o8QzbVctW+YMHLJwJP+Y9GxBNcXCa3PTfydhVWRbyaZ4lr4fdPB6OTtHHNWdaBVfyf2Yf/KewTgzcIGN+2gk+vhRJmI7RocTDnwjEP4Eaf2W5zIFBgSCo7k5Vim2ekyPQCa/AGMGPyThXh59N4ZflhCkX4T1z/37zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gzm0s52s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gzm0s52s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907E81F000E9;
	Fri, 21 Aug 2026 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787316633;
	bh=hxBbefRnZHahEGQ4tQytidXbjQBIld5bIfK7hhKrQgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gzm0s52skvGsGUdTXgpEGQHGRfyM1zKnYSWCJsQFXM2bLGgqBtRaJaVC9cIfyjEXA
	 iXEDZdwCv2DgC3iqRGYZftrWam21yv7NeNMaHcW1ytjJsorDf8XtJ8EY6A14KTCeYE
	 /3E8s7nC9+dkwNGOqIG24JMBAZCWtW2VNrq75wMXihmklZ3AbCfq0Ke7hnaM72rCPV
	 7ya4NIxJ4VyzA1g2U6S4tEBrG4RFY8dr1Hxx/jLbq5P1eWp/IB6OTHsnR3nq4hHKI7
	 WQAflIAj7qvRKZk6zyFnkQltT5KrKMfUe0jGAjXYI/iarI+a9WZ2RIPHD5fpgu5RNc
	 BgTG2cgjpcCsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] mfd: tps65217: Check return value when masking
 interrupt sources
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821123712.260443-3-r.zhambakiev@prosoftsystems.ru>
References: <20260821123712.260443-1-r.zhambakiev@prosoftsystems.ru>
 <20260821123712.260443-3-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:50:33 +0000
Message-Id: <20260821125033.907E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The global `mfd_cell` array `tps65217s` is not defined as `static =
const` and is dynamically mutated during probe, breaking subsequent device =
instances.
- [High] The driver hardcodes `-1` (`PLATFORM_DEVID_NONE`) for cell indexin=
g in `devm_mfd_add_devices()`, causing sysfs device naming collisions.
- [High] Unchecked return value of `irq_find_mapping()` is passed directly =
to `handle_nested_irq()`, potentially causing a NULL pointer dereference or=
 invalid IRQ execution.
- [High] Read-modify-write operations on the clear-on-read `TPS65217_REG_IN=
T` register silently drop pending hardware interrupts.
- [Medium] The IRQ wake count is unbalanced due to a missing `disable_irq_w=
ake()` call on probe error paths.
--

--- Patch [2]: [PATCH v2 2/4] mfd: tps65217: Check return value when maskin=
g interrupt sources ---
commit 07181fdc30db713af1912813b5a67b5c8d55e141
Author: =D0=96=D0=B0=D0=BC=D0=B1=D0=B0=D0=BA=D0=B8=D0=B5=D0=B2 =D0=A0=D0=B0=
=D0=B4=D0=B8=D0=B9 =D0=A0=D0=B8=D0=BA=D0=B0=D1=80=D0=B4=D0=B8=D0=BD=D0=BE=
=D0=B2=D0=B8=D1=87 <r.zhambakiev@prosoftsystems.ru>

mfd: tps65217: Check return value when masking interrupt sources

This commit modifies tps65217_irq_init() to check the return value of
tps65217_set_bits() when masking interrupt sources. It propagates the error
if the register write fails, preventing the software mask from going out of
sync with the hardware.

> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index 2d04d9e0ae29c..9a1528456ffc2 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -155,8 +155,13 @@ static int tps65217_irq_init(struct tps65217 *tps, i=
nt irq)
> =20
>  	/* Mask all interrupt sources */
>  	tps->irq_mask =3D TPS65217_INT_MASK;
> -	tps65217_set_bits(tps, TPS65217_REG_INT, TPS65217_INT_MASK,
> -			  TPS65217_INT_MASK, TPS65217_PROTECT_NONE);
> +	ret =3D tps65217_set_bits(tps, TPS65217_REG_INT, TPS65217_INT_MASK,
> +				TPS65217_INT_MASK, TPS65217_PROTECT_NONE);
> +	if (ret) {
> +		dev_err(tps->dev, "Failed to mask interrupt sources: %d\n",
> +			ret);
> +		return ret;
> +	}
> =20
>  	tps->irq_domain =3D irq_domain_create_linear(dev_fwnode(tps->dev), TPS6=
5217_NUM_IRQ,
>  						   &tps65217_irq_domain_ops, tps);

[ ... ]

> static void tps65217_irq_sync_unlock(struct irq_data *data)
> {
> 	struct tps65217 *tps =3D irq_data_get_irq_chip_data(data);
> 	int ret;
>=20
> 	ret =3D tps65217_set_bits(tps, TPS65217_REG_INT, TPS65217_INT_MASK,
> 				tps->irq_mask, TPS65217_PROTECT_NONE);

[Severity: High]
This is a pre-existing issue, but does performing a read-modify-write via
tps65217_set_bits() on the clear-on-read TPS65217_REG_INT register silently
drop pending hardware interrupts?=20

[ ... ]

> static struct mfd_cell tps65217s[] =3D {

[Severity: High]
This isn't a bug introduced by this patch, but does the tps65217s array lac=
k a
const qualifier?

> 	{
> 		.name =3D "tps65217-pmic",
> 		.of_compatible =3D "ti,tps65217-pmic",
> 	},

[ ... ]

> static irqreturn_t tps65217_irq_thread(int irq, void *data)
> {

[ ... ]

> 	for (i =3D 0; i < TPS65217_NUM_IRQ; i++) {
> 		if (status & BIT(i)) {
> 			handle_nested_irq(irq_find_mapping(tps->irq_domain, i));

[Severity: High]
This is a pre-existing issue, but does this code unconditionally pass the
result of irq_find_mapping() to handle_nested_irq() without verifying it is
non-zero?

Since irq_find_mapping() returns 0 if an interrupt is unmapped, could passi=
ng
0 to handle_nested_irq() lead to a NULL pointer dereference in irq_to_desc(=
0)
or falsely trigger the system timer interrupt handler if an unmapped bit is
set?

> 			handled =3D true;
> 		}
> 	}

[ ... ]

> static int tps65217_probe(struct i2c_client *client)
> {

[ ... ]

> 	if (client->irq) {
> 		ret =3D tps65217_irq_init(tps, client->irq);
> 		if (ret)
> 			return ret;
> 	} else {
> 		int i;
>=20
> 		/* Don't tell children about IRQ resources which won't fire */
> 		for (i =3D 0; i < ARRAY_SIZE(tps65217s); i++)
> 			tps65217s[i].num_resources =3D 0;

[Severity: High]
This isn't a bug introduced by this patch, but does modifying
tps65217s[i].num_resources permanently corrupt this shared global template?

If a TPS65217 device is probed without an IRQ, wouldn't subsequent instances
or deferred probes observe the corrupted zeroed resources?

> 	}
>=20
> 	ret =3D devm_mfd_add_devices(tps->dev, -1, tps65217s,
> 				   ARRAY_SIZE(tps65217s), NULL, 0,
> 				   tps->irq_domain);

[Severity: High]
This is a pre-existing issue, but doesn't hardcoding -1 (PLATFORM_DEVID_NON=
E)
for cell indexing prevent the MFD core from appending unique instance IDs to
child devices?

Should PLATFORM_DEVID_AUTO be used instead to avoid duplicate sysfs device
naming collisions if multiple chips are present?

> 	if (ret < 0) {
> 		dev_err(tps->dev, "mfd_add_devices failed: %d\n", ret);
> 		return ret;

[Severity: Medium]
This isn't a bug introduced by this patch, but if tps65217_irq_init() succe=
eds
and enables IRQ wake, does this error path leave the IRQ wake count unbalan=
ced
since it misses a disable_irq_wake() call before returning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821123712.2604=
43-1-r.zhambakiev@prosoftsystems.ru?part=3D2
