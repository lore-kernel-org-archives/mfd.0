Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAF72EEE96;
	Mon, 21 Sep 2026 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033813; cv=none; b=akAFM+aw6jQ1q3kpmCbpVmJEhnMqxX0QtO56Pt4iiLE6e+ixUWxgjPbKCd57PubhKDf/pEuWhtoCU5B0reWGUDziDcUmvy8E1M2+4gNg7wpaqr3yFjTlgl47dyqj0L7Is6vPxbI4s2ikD1wqf1mx6BXuFueMRC4jwjQGdxaNjns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033813; c=relaxed/simple;
	bh=NCJiny0YxzDaQef5tmGSjXYVWIG60ngqt+QkrR6N76w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J/nJbdn9PQ/RlKLdVVHm2Z3Hu9qroBEgSIJAlNcPtQr3H9ZJSPh0IlIgo0/HLvAhSTblClt5Ici+4+3CESYMS32D8McNrLFLiTFQK1hvPHtsXPzyieKsZ4asmetIRvQBmzz1I4VjCjptIj3g2QTtEXflcfJjrR6VfFBYy0oV8EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMfQ1m7Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMfQ1m7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591281F000FF;
	Mon, 21 Sep 2026 23:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033811;
	bh=gVGP+v1WL9YSa+RHgEswfJCA5cILr9D6lGAlD/4OAWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bMfQ1m7Ztgjihyvqx5RNfzCWbhvs5tWj2WoQxjhd12ILDon7xH56AHljE8ktOcepS
	 gNuUO5kZrbYmn759bWqa+hsZ6AP725bAmisp/I9X1lBI7txjU/3vMhilVwelcqywKc
	 sOOxxvP4ClWoVOhf9Vq6Vu2G1qzFWWeWmhu3PWX+/4yh3oHqoJN0mRIx77yzvaIqih
	 6MjWclSBCnHqmurJToNRvIAKcbYXO9xH4UgUldKZjQo26oC90PEsEWNEPSFQD6Zav3
	 H/uyCWHEZBV2m07aKsfPeWrTIEERXBN+4ToWhFVn6h52OyXBysg+/blbSMk7waEybQ
	 kq6iegZRfiFoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260921232625.3131242-1-robh@kernel.org>
References: <20260921232625.3131242-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:36:50 +0000
Message-Id: <20260921233651.591281F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: mfd: hi6421: invalid gpios property for interrupt l=
ine
--

commit 4ce4ba18007f2f81249a1f2307d744174beb3e75
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible

This commit updates the device tree binding for the Hi6421 SPMI PMIC to use
the hisilicon,hi6421-spmi compatible string. It also allows the gpios
property for the GPIO interrupt line used by the HiKey970 PMIC node.

> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-=
pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmi=
c.yaml
> index 6a824351834ee..9275c561e9d49 100644
> --- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.ya=
ml
> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.ya=
ml
[ ... ]
> @@ -32,6 +32,9 @@ properties:
>    '#interrupt-cells':
>      const: 2
> =20
> +  gpios:
> +    maxItems: 1
> +

[Severity: Medium]
Does this property legitimize a broken device tree description by using gpi=
os
for an interrupt line?

Looking at the driver in hi6421v600_irq_probe(), it unconditionally relies =
on
platform_get_irq() to fetch its interrupt:

drivers/misc/hi6421v600-irq.c:hi6421v600_irq_probe() {
	...
	priv->irq =3D platform_get_irq(pmic_pdev, 0);
	if (priv->irq < 0)
		return priv->irq;
	...
}

Because platform_get_irq() only parses the "interrupts" property, it lacks a
fallback to parse "gpios". Will this cause the driver to fail to probe when
using the HiKey970 PMIC node configuration since it cannot find the interru=
pt?

>    interrupt-controller: true
> =20
>    interrupts:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232625.3131=
242-1-robh@kernel.org?part=3D1
