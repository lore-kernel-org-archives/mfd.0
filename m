Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091327;
	b=LVEbNhrwi8uLcfaXtfUcuiAO4luqq9gaxqj5/GLD6fVNm4G7eETsLY9xXvvef/BYluC3
	 9c85TxXAIBEm9v+CjCIEG8igohZfzASvuVEk0vNkV/y2F67iseoGcmFGMK7TI+R52S1jQ
	 fA8tVAgWxKnvTYtCB3clq4F17zmi0+ofqLaaTrdAqWBxJaIua6Qn0bWL8rVuZVOFHYK8c
	 fERMWx51pTZi1mLgpmCBJR/BZ/GDcXCcZ0Hb772cCyPQVURWRox9nlNAF1mMHOMNks5mq
	 5BaVh3Nbu0JVV8GjviQ83r6HBRvQtNxZnUgaiLSWQVKXNpzjwSRZHl5hLZMEB04r/4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091327;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rg9IBRAqIGNAot6WIn6+tg7TYZQkmUdtnGTX42kjeUs=;
	b=b/MFOwomXlerzUpIeWbbXc1LFdELtbL8KpkyhYuAsxKrFP8+uq7qG9GXQkViGssmylxI
	 ZYZ7FWTVfG8OQlMCbHsHuHpWY9KhcyyvNBMcIRLJAijti7ZnxPONEt1IZtu+yZ37TribR
	 u7KPD4KfJq1lHBiILPgC4tpO6BJTlmZLS3cWIZvvjOpGj1kHoV370Dz+qIzYNVCNV6mQD
	 yuZi3siGSJq2wh7iQDMeumRYaPSOzbRQxHH0/hjgTPLfkJS3nPfRxxRAgIQiMwzQCFnms
	 bOc6NoKXd5WdFuXre7G5IukCvQ45mFVl2sUP9KqRvuKxmBwUbbaPo9AUOv16QPUfdPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SRwpbVJp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B764606A31F;
	Tue, 27 Oct 2026 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SRwpbVJp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723991F01829;
	Tue, 27 Oct 2026 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793091326;
	bh=Rg9IBRAqIGNAot6WIn6+tg7TYZQkmUdtnGTX42kjeUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SRwpbVJpXeMKYQwoiHFvp6ek174mmHYfcKNuvqLmn3UUDC6pk6Z3vzODNlk94EsID
	 YgzuzI6WvHDXsq7tU0CMLKY56BH9nBdN8fA88zSWm8ptOLSuXfmBXdLQ561tQJ7ZO/
	 hLqKnCWXWGSq7L1zofX8d+MiTq60cm1BRUs8Am+XOQdk5uDxkn9+c3J9do370csR/J
	 EOcPoKVREurcAM2lc6lSVt06UPwUZElGA7KVzclCsK6eVUu8A5fB5gepyA2ysGAppG
	 NGnAntAYsSCYIDFkyg1O9hOvhvjqOP9vEOCuI79Ki2erryjjDDQq72FXaS87ATqsaX
	 hoiSoBOZIk79g==
Message-ID: <sashiko-outbox-186310@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mfd: rk8xx: add board level power
 hold GPIOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261027084511.1992-2-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
 <20261027084511.1992-2-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 08:55:26 +0000
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

commit 2f97d8ee4039bd6ee8ced1ebc89f3ae0764e0214
Author: Yaozhong Li <yaozhonguwl@gmail.com>

dt-bindings: mfd: rk8xx: add board level power hold GPIOs

This commit adds power-hold-gpios and power-hold-delay-ms properties to
all seven Rockchip RK8xx PMIC Devicetree binding schemas (rk801, rk805,
rk806, rk808, rk816, rk817, and rk818) to describe board-level power hold
lines driven by the SoC and released before PMIC shutdown.

> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
> index 7c71447200ba4..bfba394b23f7c 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml
> @@ -29,6 +29,26 @@ properties:
>      description:
>        Telling whether or not this PMIC is controlling the system power.
> =20
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
Should these board-level power circuitry GPIOs and OS shutdown sequencing
delays be modeled as properties on the RK8xx PMIC nodes across
Documentation/devicetree/bindings/mfd/rockchip,rk801.yaml,
rockchip,rk805.yaml, rockchip,rk806.yaml, rockchip,rk808.yaml,
rockchip,rk816.yaml, rockchip,rk817.yaml, and rockchip,rk818.yaml?

As noted in the commit message and the power-hold-gpios description, these
lines are routed from the SoC into external board power circuitry rather
than into pins on the RK801, RK805, RK806, RK808, RK809, RK816, RK817, or
RK818 PMICs themselves.

In addition, adding these properties to all seven schemas because they share
the Linux drivers/mfd/rk8xx-core.c driver, bounding maxItems at 2 to match
the vendor kernel's pmic,hold-gpio and pmic,stby-gpio properties, and
encoding the release order and power-hold-delay-ms settle time prior to the
PMIC shutdown write appear to describe driver-specific shutdown sequencing
rather than the PMIC hardware.

Would it be more appropriate to describe the actual board-level power
switches or regulators in the Devicetree and handle their shutdown ordering
through standard kernel power-off or regulator mechanisms instead of adding
these properties to the PMIC bindings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027084511.1992=
-1-yaozhonguwl@gmail.com?part=3D1
