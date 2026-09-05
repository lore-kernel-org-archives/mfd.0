Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061E63B059C;
	Sat,  5 Sep 2026 22:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788646018; cv=none; b=iylqV/aiWkYujuXxF4P3U2OV5fYLGLjxmroYI3HN2dnLkdSPku7RWS8+3833Eko4VuTg7oTjFcPttZmh4ElxnL5yTlqk4iJErKJsu/SVa0C+0/6LvbINRm0ff3qrZc6agvvC6Jt0l/RQibqHGeM32p3DF9neA3/kjZXuBKNzF6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788646018; c=relaxed/simple;
	bh=NY8YwCDOwZbJeDd3aLTsr0drGL8t/zfsEpgw4htOtVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jq8beHf1nZXPHV4oZ4SskUzLW65pVW32OA4NoGQ/1GQ5ah1HINTERTne0rIPRydm1bhAddGUXEOmirS+63Tvm/lRMrMnViQrzLYOpQ8a0yGnTlq9JK54XOicrKduuK5nEjjJgfoOt0rrTyczKOh4Sepxg8y0Ep4yHN4wgFYdRhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4AxBQyC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4AxBQyC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8AC1F00A3A;
	Sat,  5 Sep 2026 22:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788646016;
	bh=MIlCF6o9WcZLMM9lvzcVADoiYgfaKcKIQxiDdnXVuxE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c4AxBQyCCAd2IcSJHIxXp6oAbJD/lI/qPV8cmlbJ4OachelUSiYMTbpEjkdxIoQQs
	 PN2olnM61evgVSW+FbCoZ/tz/mQlsOcpUWR8u/Tzftq9EpFlIpKE83gphZ4jVva5+S
	 F5GyyoGRnmutchfzkAi4s+DaSBBPNF0HHyxOIT6d/htz85Dnf8Mjfhas0ipwF5S7Lb
	 WNN+f1jnpv1CvSpF0S5qo6C6a6hDF5ECQ5A2wNCofWMhO/OiiyMBA6IeFNKAoSpcod
	 Kb0s5yHAALK3l9Z0MoN/Z/4h5+y13/XaTyYd5GfrXr32a7bmUBSAUHACHEce1ZKypi
	 Bw6DxWv5X8AfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260905215234.454266-1-egbostina@gmail.com>
References: <20260905215234.454266-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 22:06:55 +0000
Message-Id: <20260905220656.2F8AC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] IRQ domain destroyed before devm-managed threaded IRQs are freed a=
nd before child devices are removed, causing Use-After-Free.
- [High] The child driver twl6040-vibra allocates regulator devres actions =
on the parent device using a pointer allocated on the child, leading to a U=
se-After-Free.
--

commit 0404bd7a83f494396c387e5f75dbf3991d0ac035
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: mfd: Convert TI TWL6040 to DT schema

Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
schema. It updates naming and optional parameters for modern platforms while
maintaining hardware requirements for the vibra child node.

Link to v3: https://lore.kernel.org/all/20260817100207.2970303-1-egbostina@=
gmail.com/
Link to v2: https://lore.kernel.org/all/20260816092847.2522994-1-egbostina@=
gmail.com/
Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbostina@=
gmail.com/

> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Docu=
mentation/devicetree/bindings/mfd/ti,twl6040.yaml
> new file mode 100644
> index 0000000000000..5efcd79b527c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
[ ... ]

While reviewing this dt-bindings conversion, I noticed a few pre-existing
issues in the related C drivers for this hardware family.

In drivers/mfd/twl6040.c:

> static void twl6040_remove(struct i2c_client *client)
> {
> 	struct twl6040 *twl6040 =3D i2c_get_clientdata(client);
>=20
> 	if (twl6040->power_count)
> 		twl6040_power(twl6040, 0);
>=20
> 	regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);
>=20
> 	mfd_remove_devices(&client->dev);

[Severity: High]
This isn't a bug introduced by this patch, but does this sequence lead to a
use-after-free during teardown?

It looks like twl6040_remove() destroys the IRQ domain via
regmap_del_irq_chip() before the child devices are removed via
mfd_remove_devices(). When the children unbind and attempt to free their
IRQs, won't they access the already-destroyed IRQ domain and descriptors?

A similar sequence seems to occur in the twl6040_probe() error path:

drivers/mfd/twl6040.c:twl6040_probe() {
[ ... ]
> 	ret =3D mfd_add_devices(&client->dev, -1, twl6040->cells, children,
> 			      NULL, 0, NULL);
> 	if (ret)
> 		goto readyirq_err;
>=20
> 	return 0;
>=20
> readyirq_err:
> 	regmap_del_irq_chip(twl6040->irq, twl6040->irq_data);

[Severity: High]
This is a pre-existing issue, but does this error path similarly destroy the
IRQ domain before the devm-managed threaded IRQs are automatically freed by
devres? This appears to cause a use-after-free when probe fails.


In drivers/input/misc/twl6040-vibra.c:

> 	info->supplies[0].supply =3D "vddvibl";
> 	info->supplies[1].supply =3D "vddvibr";
> 	/*
> 	 * When booted with Device tree the regulators are attached to the
> 	 * parent device (twl6040 MFD core)
> 	 */
> 	error =3D devm_regulator_bulk_get(twl6040_core_dev,
> 					ARRAY_SIZE(info->supplies),
> 					info->supplies);

[Severity: High]
This is a pre-existing issue, but does this devres attachment cause a
use-after-free if the parent device unbinds after the child device?

The info structure is allocated via devm_kzalloc() on the child device. By
passing info->supplies to devm_regulator_bulk_get() for the parent device
(twl6040_core_dev), the parent's devres context stores this child-managed
pointer. If the child unbinds, info is freed, and when the parent later
unbinds, won't its devres call regulator_bulk_free() on the now-dangling
info->supplies pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905215234.4542=
66-1-egbostina@gmail.com?part=3D1
