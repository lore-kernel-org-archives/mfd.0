Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506033;
	b=CGgh7V8xnhp+DJzkqJG4s63GHlxQDDDg/FopSZeBfQsIjizUCZ7uE/tSAsyuY+g6oR0c
	 ozkxyUn4uSC2YiIZCFuB1poxI8IKbSzGOfS/OMOLBmI8G1A3dz0wDIZITHVDEOBpEWFhO
	 G9HYmtzenaIs6JxhvpVEvoGGDf8UUtu2l0dFJJNvjiMAXjRgB0zqWRrt89YNhQXYhg+N/
	 qQXYM0ssgWf84FHCNfS8gVdsk0PzXdfAMz5nA6ghrXgfN2/H5zhOpDsuVZ1kKbXNVlSX0
	 8IZpafo6Hc9Sv9bbn4n2j4jJPKTtCmISLkXMl9l41lEoVCFT8lBedfvqyMpAi9HclOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506033;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xXOWuXMk1uEFJ2TbjFT7ldfrebjLA6J7tp9q2JvUf90=;
	b=Z8hMOp/qK/+TG6IiCgEF5/Y8sJJBUDEwb+OtNpl/nngrIGZkV44cnZXDQxAtZwd99xbn
	 3fJs0Ybiese6DGOyhAQtKUsccaC55NTEG9aXWPYLdgfYXnvw2/qEXGlYj77LhEF2FrQ2L
	 oQsTXwD4ngPnTDdOjYTTiAEuNbPOFQt0RHi+7BomTN4jJcmamtV5rFp7P3lD18j59n+NL
	 7H9rG3Whx7AT4eqTJ3k7zvja6/+oecqP0HwJ1CwAXvAFPLgXDDySe3oXKaLsttys8S13U
	 uDNHtNNomN96nHiWxzi3nNwGYo04BPQQt2Y2XO9DgTz+HJ6yk5/lKhME0IGEr54+MBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VR2yT/Yt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92B606A31B;
	Tue, 20 Oct 2026 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VR2yT/Yt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998761F000C4;
	Tue, 20 Oct 2026 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792506033;
	bh=xXOWuXMk1uEFJ2TbjFT7ldfrebjLA6J7tp9q2JvUf90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VR2yT/YtbRxqjWW9o8A9V4lDIfa/+Wa4CQWRyNkzEsDMzxSQ6AeVeCbjU0GGvTCt4
	 mIGK/3uia6FpqSPt6msBc67/B1Lf4thlh/RDv68sICRKtftsa5wvpY02AWeUy1dVOH
	 1zLfnclO8XGOufOuaBZMtLlYMWj+/xE1rZ9zWlid6xdMfTJf/5cihyrNxQNY9IhA0y
	 h99foMU5AVg6auQYHB/ul9U4tN8eF+fBWGxSRrSOqjL5eoSqktIpFlUgGkwugnhXfx
	 7wZIKosdCqZrylLijD+iPuCuY2TNnSkaa3t8EvmFfPy/C22fvvQIqRpexJQh8Qbkch
	 b42liCfeTkyww==
Message-ID: <sashiko-outbox-179114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: rk8xx: add board level power
 hold GPIOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261020140127.720-2-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
 <20261020140127.720-2-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:20:32 +0000
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

commit f8b9688233f1d3f9facd6db797983e937aae95db
Author: Yaozhong Li <yaozhonguwl@gmail.com>

dt-bindings: mfd: rk8xx: add board level power hold GPIOs

This commit adds power-hold-gpios and power-hold-delay-ms properties to
all seven RK8xx PMIC device tree schemas to describe board-level power
hold lines that must be released before a PMIC shutdown request.

> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
> index 7c71447200ba4..2f9554d0052ae 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
> @@ -29,6 +29,25 @@ properties:
>      description:
>        Telling whether or not this PMIC is controlling the system power.
> =20
> +  power-hold-gpios:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Board level power hold lines driven by the SoC. They have to be he=
ld
> +      asserted while the system is running and released before the PMIC
> +      shutdown request is written, otherwise the rails can drop and come
> +      back up instead of staying off. Only meaningful when this PMIC is =
the
> +      system power controller, as the lines are released as part of its
> +      power-off path.
> +      The lines are released in the order listed, and power-hold-delay-ms
> +      elapses once, after the last of them.
> +
> +  power-hold-delay-ms:
> +    default: 0
> +    description:
> +      Time to wait after releasing power-hold-gpios before the shutdown
> +      request is written, to let the lines settle.

[Severity: Medium]
Should external board-level power circuitry and Linux shutdown sequencing
be modeled as properties on the RK8xx PMIC nodes?

As noted in Documentation/devicetree/bindings/writing-bindings.rst,
bindings should be based on what the hardware has rather than what an OS
and driver currently support. Unlike dvs-gpios in rockchip,rk808.yaml
(which describes actual DVS input pins on the RK808), none of the RK8xx
PMICs have dedicated SoC-driven power-hold pins; the commit message and
property descriptions state that these are board-level lines routed from
the SoC into the board's power circuitry.

Furthermore, power-hold-gpios (with maxItems: 2 derived from the Firefly
vendor BSP pmic,hold-gpio and pmic,stby-gpio properties) and
power-hold-delay-ms are added to all seven RK8xx schemas (rockchip,rk801,
rockchip,rk805, rockchip,rk806, rockchip,rk808, rockchip,rk816,
rockchip,rk817, and rockchip,rk818) because rk8xx_probe() in
drivers/mfd/rk8xx-core.c reads them in shared code when
system-power-controller is present.

Would it be more appropriate to model the board's power hold/latch
circuitry or upstream supply rails as separate board-level DT nodes (such
as a regulator or dedicated board power controller node) sequenced via
sys_off_handler priorities, rather than placing procedural GPIO arrays and
settle delays on the PMIC MFD node?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020140127.720-=
1-yaozhonguwl@gmail.com?part=3D1
