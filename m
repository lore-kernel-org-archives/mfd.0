Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A104B0483;
	Sat, 15 Aug 2026 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786783239; cv=none; b=JxpfdhWH7DqiDZkrXDrpYUz5f4VrmHZi6rZGBJPMG11Bl7puClKGderjFyWaxVhjVwIbIXTTcFs4QJIhgNfBXuQjTCvmqihmKCj+4ph4nT9ejUEuLu80ZIGM0GLjS7NWGj2ODTz1N1UThmVHyLNWZEdtZ4cE+7mD5HYho5MrIMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786783239; c=relaxed/simple;
	bh=XK2o/HW4dEejXjXUmGHqDzCDJ3oqiOnQPl0CLGIzl0g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OV4FDOlCuoKuQysSPZ3q68jnaQx9qlp3id9fY9IT3GbyTk4brM1C2CWcXzsI8CMxBsPESW3LeDBBpRV+TftZL++eDfirD9u06mT3NKfZ/GOMrUf5w1Ov0blrYn98S/7wNBwiuNWrFINeKGjQDMREp0T62wgfhxUXEcWRF6SMYfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSvAiXlK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSvAiXlK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E1B1F000E9;
	Sat, 15 Aug 2026 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786783238;
	bh=2SSgdrDDYv7GVDNdv24V4UepTEXEhtdgkVn0onfcx7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gSvAiXlK8DN4A8CIYkFUf7Ag9vu2BjkLfKudYLFHSQYLGprM0L5uty9MGgCJhxDva
	 55Z4DNdFmIDPdJ62wII11qCswbUfq7c/N3d1g3AkPkrOMnAT38fehWHXPDiDfK/FbU
	 YzGoxU/3aFwqgCWngQIFc042+nQX9QiDxdsAEClGs7OemyHn507OXI3rYrvXnxfkRP
	 pQOLn8pXF/jGMW9rQt9uSb2JlbncpBdNzrD4jYVRL+4323IBZ4PuzGFEa6fHTZtbYK
	 j9GZcLrkEUgwzKwVDCd4hRkmAuwURqnRzY2C6Xg76Q+eT8CtEO5bkm99jHO7Gj9KKk
	 J1J0I02XcufoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: Convert TPS61050 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260815083145.2145984-1-egbostina@gmail.com>
References: <20260815083145.2145984-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 08:40:37 +0000
Message-Id: <20260815084037.E9E1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The MFD core driver dynamically mutates static `mfd_cell` structur=
es to pass custom parent data via `platform_data`, violating MFD guidelines=
 and introducing a race condition.
--

--- Patch [1]: [PATCH] dt-bindings: mfd: Convert TPS61050 to DT schema ---
commit c3b0af0c4f22b90e8d39db54cb33489eff5b078e
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: mfd: Convert TPS61050 to DT schema
   =20
Convert the Texas Instruments TPS61050/TPS61052 boost converters bindings
to DT schema.

> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps61050.yaml b/Doc=
umentation/devicetree/bindings/mfd/ti,tps61050.yaml
> new file mode 100644
> index 0000000000000..974ef78d6e26e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,tps61050.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,tps61050.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TPS61050/TPS61052 Boost Converter

[Severity: High]
This isn't a bug introduced by this patch, but the core driver for these
devices dynamically mutates static mfd_cell structures.

Looking at tps6105x_add_device() in drivers/mfd/tps6105x.c, the function
modifies the shared static mfd_cell's platform_data field with a pointer to
the newly allocated parent data:

drivers/mfd/tps6105x.c:tps6105x_add_device() {
    ...
	cell->platform_data =3D tps6105x;
	cell->pdata_size =3D sizeof(*tps6105x);
    ...
}

Because the cell is declared as static but not const:

drivers/mfd/tps6105x.c:
static struct mfd_cell tps6105x_gpio_cell =3D {
	.name =3D "tps6105x-gpio",
};

Could this create a data race if multiple I2C adapter initialization threads
concurrently call tps6105x_probe()?

Additionally, the child driver incorrectly reads the duplicated platform_da=
ta
instead of using dev_get_drvdata() on the parent device as mandated by MFD
rules:

drivers/leds/leds-tps6105x.c:tps6105x_led_probe() {
    ...
	struct tps6105x *tps6105x =3D dev_get_platdata(&pdev->dev);
    ...
}

Because platform_device_add_data() makes a kmemdup copy of the struct passed
via platform_data, if device B unbinds, device A's child may hold a copy of
pointers that were freed, leading to a Use-After-Free.

Could the child driver be updated to retrieve parent data via
dev_get_drvdata(pdev->dev.parent), allowing the mfd_cell arrays to be static
const?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815083145.2145=
984-1-egbostina@gmail.com?part=3D1
