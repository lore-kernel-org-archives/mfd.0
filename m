Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442919;
	b=tHsK4UHkZugB+LRuKUegDYUGcMOUzGHgzGAIU6IoJsSnV8Sj0XDdR6lrq93JI4pNoktL
	 0EzViODJiWt7DMVZYMsoa05txwPe4FW/3N4x0vTazCxWFOWJmT2kLs0W+qboqrH+4eKQD
	 9Q9DiI9f/92Dlvp+/Vg8Wj2zdEts5G6EAr82ytJ49T1SJgCQHwFObtDXy6pxXzyLhrWXx
	 W92RoEabwFmP92vtFYh9e/1wsJJVPM7+BiXuKbKS7YG57gF7E08pPccwngANbYn7FAuP5
	 nHLB2l1jvSktDgjXcV3amlrr25MX9Y13C1aiv0QmRzXDCBZduZKHOrfPmdzEE/KYH/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442919;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sZD3EHm+3DOKD8jQC14IYZ0SJMf6df6lTLxnFFd+rAU=;
	b=3H8Uvwz/NGzjtX9rJer3geotm4jsp9Kk6kzn8tgDFSqlD/5+FJ9PM3koUlU4gxSn0k5i
	 7pjH2ACcOOwtByDuzs83eQNYo1WUesnihUTJoAZXQoNYmr++S///a2K3IBAkBIciksObB
	 4pxgGJ8AhSWW3oR7DGGTPPyV9w8SCAL3m/cWgIRZLXB3JiQ1daBPt4CQLc1N8OlyB3u8p
	 khd8fFHYRXpMCAn3mpnPBvu+lurSiXXwwbN2QeBK2i6N5Yq5gITe3LCtK4RYZPDuwUAZD
	 FTwdbBgpXN/huuLa3LPC1pzLPRiCFWdm4uqSSo6tQE49QzdpKxuoBLVgMXhuqbOLo4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tscnn3mb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703B3606A31C;
	Thu, 12 Nov 2026 00:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tscnn3mb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D111F00A05;
	Thu, 12 Nov 2026 00:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442919;
	bh=sZD3EHm+3DOKD8jQC14IYZ0SJMf6df6lTLxnFFd+rAU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tscnn3mb/UC5YQDS83SSLAZYNLzcSBWi72mRAcGmI8WbEY6TAIKw5MeoiTcFJAxSu
	 35Zt+24yvkY1YzJORmrbgSCgwcEIeoP4HKx/OVmFaEcgN0HrUnwWpr5RmXebTPILe7
	 7HbrF5MsSF2m2mslJx54sRp2tpbLcIBIKlXCf1gZyekW7mHpN71GEcL5BHxtappHKc
	 4YX4jICY7bVD4RMSBUVrDmyGOt8uZHvMX8oWMammiu93ohzEKQD5xXMj4iotajDQXv
	 a7bCV/Cn1phRd9MMtVY//EFYIEyBrz5Nwdt5wfc4mCK5f65ET/bBKg5gXHV7+gMSLt
	 JzthvprRbJ4ig==
Message-ID: <sashiko-outbox-209906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: mfd: Add Marvell AP806/CP110 system
 controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261111-dtbs-marvell-v1-1-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-1-938788aff3ae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:21:58 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: mfd: marvell,ap806-system-controller collides
  with legacy driver
--

commit 4cddea2359377a9e6ae88c719cab7c7efc9634bf
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: mfd: Add Marvell AP806/CP110 system controller schema

This commit adds a dedicated Device Tree binding schema for the Marvell
AP806 and CP110 system controllers and their child devices.

> diff --git a/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-sy=
stem-controller.yaml b/Documentation/devicetree/bindings/mfd/marvell,ap806-=
cp110-system-controller.yaml
> new file mode 100644
> index 0000000000000..4c43986c2c0a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-co=
ntroller.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/marvell,ap806-cp110-system-contro=
ller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell AP806 and CP110 system controller
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Gregory Clement <gregory.clement@bootlin.com>
> +  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - marvell,ap806-system-controller
> +          - marvell,cp110-system-controller
> +      - const: syscon
> +      - const: simple-mfd

[Severity: Medium]
Does requiring marvell,ap806-system-controller on the parent simple-mfd
node cause a collision with the built-in legacy clock driver?

Unlike CP110, where cp110_syscon_legacy_of_match matches
marvell,cp110-system-controller0, ap806_syscon_legacy_of_match matches
marvell,ap806-system-controller:

drivers/clk/mvebu/ap806-system-controller.c:
static const struct of_device_id ap806_syscon_legacy_of_match[] =3D {
	{ .compatible =3D "marvell,ap806-system-controller", },
	{ }
};

When a device tree conforms to this schema, ap806_syscon_legacy_driver
binds to the parent MFD platform_device at boot.
ap806_syscon_legacy_probe() then logs three false FW_WARN messages about a
legacy binding, performs an unintended regmap_read() of AP806_SAR_REG
(0x400) in ap806_syscon_common_probe(), and fails probe with -EINVAL and
"compatible not supported" because the parent node is not compatible with
marvell,ap806-clock or marvell,ap807-clock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-marve=
ll-v1-0-938788aff3ae@kernel.org?part=3D1
