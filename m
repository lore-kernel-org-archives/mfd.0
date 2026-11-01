Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548058;
	b=gCKIAZr6hxBOBi/EEIogSC7KycZXl+5bUhcQYkUwlAjPaWYkeVbc2tFKkuU7ndiWXNIJ
	 wnSIywILBSuKgvX4Qu+rd94o6Lme6V6tDUF+7mUmspZ3mJZ/nK+6x460g2d1x882YPJNT
	 wNz8qxwO85lUojECY4bcrh52esLud5OImbXyWkSrMyvJC9UBopd+Kr/ooZv+X5vog4R+E
	 Xlp3ut6CCZo8+kESF5vtqQ18O3fu+kzAF8b75Eb6g0BLKwIQRSsZwqrOAwER/HUHTtm/p
	 vBvRquniWATpl3VRHbl7PgHh2HU0DAzuyxzxdQKIc8zv6jGrE6eyKJOZU/5iPKVZwGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548058;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=95FOrxvTIEuds2n7MwpMJLnzGAGJk2x/TS1PdOHXS8E=;
	b=3WNxSpi6j/ABm1MU4A5TrG3oQ0/G0RGmwUI8L+vujcVeu3Yr2492wP+OmvdvgvAgHSdi
	 BQK0h06bLb0xOqwhg0kOAVewq66LTnHuK0vmBdWDLvOEqpa0YhM+VrjLL4bf30uVC3wTJ
	 UDfZvyoA15EyD0UmjvCw6OXwBJ/Z8m/79dETBzU+xHsEjprpBDJKz71HNeYj5l6nv5wt8
	 JcpxUYJWmuN9aPWPip04pfPvgmD3AGW4H/LhapXx5RxajmOPehi09kb/CDS1+1I0GsEHw
	 cmr1DBFUD5DFUlMbFQ6Rs+O8dH3Xk4wL3bfxLki7sjmvL+LK/Gxvcub1vTckgwPgD+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3cABjsy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F07606A324;
	Sun,  1 Nov 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3cABjsy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9F91F000C1;
	Sun,  1 Nov 2026 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793548057;
	bh=95FOrxvTIEuds2n7MwpMJLnzGAGJk2x/TS1PdOHXS8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I3cABjsyu0D7EfJAssSQQCxHZ9Y4vN5/XIEKbvDVi7NhAOgWsJZ4gtqLeS+JgFect
	 VVHoEIADWhrQdtqGw1H++EK0032B+WMf/MNyJx+DIhjpbQiwC6tCvhGRzF6PUJd9wY
	 DgavzYcb7BYZ78/KMUCeIk6mYB8zDp2oQVtMoMhvcIsstdLYOBBI6GKacPndjY/OGM
	 JsIGqEzNRu6VcWTz+oKz1RZ1rxNXUDcoqL72KPQbV4rCduU5zo/mCr9BX0k7mUxcpi
	 pcyud0LTy0P/hg9KcU7niYW4BLAfFZKXubxn4ZqmRn7p1Tu/MpiR6cvub1eon+uWTj
	 TY4pFoK8+QszQ==
Message-ID: <sashiko-outbox-192484@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: mfd: rk8xx: add board level power
 hold GPIOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261101154053.3874-2-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
 <20261101154053.3874-2-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 15:47:37 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: mfd: rk8xx: board power-hold GPIOs modeled as PMIC =
properties
--

commit 675c9ae7bda27dce85ec9548a8ac2ba6bdf5bf40
Author: Yaozhong Li <yaozhonguwl@gmail.com>

dt-bindings: mfd: rk8xx: add board level power hold GPIOs

This commit adds a shared schema rockchip,rk8xx-power-hold.yaml defining
power-hold-gpios and power-hold-delay-ms properties for board-level power
hold lines, and references it across all seven Rockchip RK8xx PMIC MFD
bindings.

> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-h=
old.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.=
yaml
> new file mode 100644
> index 0000000000000..6be3e1e119f0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk8xx-power-hold.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/rockchip,rk8xx-power-hold.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK8xx PMIC board level power hold GPIOs
> +
> +maintainers:
> +  - Yaozhong Li <yaozhonguwl@gmail.com>
> +
> +description:
> +  Properties shared by the RK8xx PMIC bindings for boards that route pow=
er
> +  hold lines from the SoC into the board's power circuitry, which have to
> +  be released before the PMIC is asked to power the system off.
> +
> +properties:
> +  power-hold-gpios:
> +    minItems: 1
> +    maxItems: 2
> +    description: >
> +      Board level power hold lines driven by the SoC. They have to be he=
ld
> +      asserted while the system is running and released before the PMIC
> +      shutdown request is written, otherwise the rails can drop and come
> +      back up instead of staying off. Only meaningful when this PMIC is =
the
> +      system power controller, as the lines are released as part of its
> +      power-off path.
> +
> +      The lines are released in the order listed, and power-hold-delay-ms
> +      elapses once, after the last of them.
> +
> +  power-hold-delay-ms:
> +    default: 0
> +    description:
> +      Time to wait after releasing power-hold-gpios before the shutdown
> +      request is written, to let the lines settle.

[Severity: Medium]
As reported by Sashiko on v5 [1], should board-level SoC power circuitry
GPIOs and OS shutdown sequencing delays be modeled as properties on the
RK8xx PMIC nodes across rockchip,rk801.yaml, rockchip,rk805.yaml,
rockchip,rk806.yaml, rockchip,rk808.yaml, rockchip,rk816.yaml,
rockchip,rk817.yaml, and rockchip,rk818.yaml?

None of the Rockchip RK8xx PMIC variants have SoC-driven power-hold input
pins; as noted in the description, these lines are routed from the SoC into
board circuitry outside the PMIC.

Adding power-hold-gpios (bounded at maxItems: 2 after Firefly's vendor
kernel pmic,hold-gpio and pmic,stby-gpio properties, which on boards like
rk3399-firefly.dts and rk3399-roc-pc.dtsi correspond to the pwm-backlight
enable GPIO or the vcc_sys fixed regulator enable GPIO) and
power-hold-delay-ms to all seven PMIC bindings encodes driver-specific OS
shutdown sequencing on the PMIC node rather than describing the board's
actual power switches or regulators in Devicetree.

[1] https://lore.kernel.org/r/20261027084511.1992-2-yaozhonguwl@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101154053.3874=
-1-yaozhonguwl@gmail.com?part=3D1
