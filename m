Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C8238F93B;
	Wed, 23 Sep 2026 03:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135470; cv=none; b=ipx0g82zv2ylBSTC3JXPc2Km+bq1ZN7XHiLTWAxTetTW7VaYhkQwzZaNKMGY6Pa58f6w1fyqbFu/51tBPl1J08pb3/Wbx9FAo6uJFhA3g6B2bwX3ozJvaUZjkJ3Bt6wZk0eky1KbaJ1+UQ23+VVflqANwNKoAs7rSk12jv45MnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135470; c=relaxed/simple;
	bh=homz0MClvd0iBLTt9ZehMwNed13F6i9NoLtgr2ylbcQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c+NlGV7F8sO+HSLSJDSZvl1eLtvp9QBf1weIZKaCt/2Oe1uSaTo6TLhFqnloK02NTlFYNkO5p6GMW0+/2bnXwk7bcDGxX4dhxSmxuHZdak9douUQeF6TjGgDjIvv5i5+IMzbFivdULwePWivGZdMqMxSuu4FguzsyYEUZIk59B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4ubVWzF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4ubVWzF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9B71F000FF;
	Wed, 23 Sep 2026 03:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790135467;
	bh=Jeo+/COCNhihjZUD6C6IuQ7ImnQjZwreARbrASqN4kQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l4ubVWzFV4VYmckCYR/xH62ywkG99x12rbWUblw2N0CjpkmPCj0EjwX4pWeGtobIP
	 4D9B4X/K0ef5ZitwkZdSSBbSsHXmSWHzXZEjtolNGG9M/GZzUKI/Zf4buC+/ciIVA2
	 JcsA40MRRsXoIeh96vQ0jq0DKlhHZzf+IAuuFLV6DufQthztZku/Bw6jZvC4Brxda+
	 aEFEU6PZbPbRdUPo0a4ubLWZsANmzAO1F9vW5x+GWIF5jZoGuXUcLIF5oSAL9A8D+t
	 huTT+IwGQ2bScvvT0cEQk5t7XLjxsqpTcROJk6RDfFCekyzbFpDfNT4QM/5KoBhcg9
	 uCyKRoWxvWsqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: convert rk805 pinctrl to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260923034245.396417-1-quchaosheng000406@163.com>
References: <20260923034245.396417-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 03:51:06 +0000
Message-Id: <20260923035106.ED9B71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: mfd: missing gpio-controller in required and exampl=
es
- [Low] mfd: commit message description is not capitalized
--

commit e55b5757962f2de0568f1d27e4b5f113a8f4aaad
Author: Quchaosheng <quchaosheng000406@163.com>

dt-bindings: mfd: convert rk805 pinctrl to DT schema

This commit folds the RK805 pinmux text binding into the existing
rockchip,rk805.yaml MFD schema and adds the missing -pins$ child
node schema. It then removes the standalone text binding.

Link: https://sashiko.dev/#/patchset/20260923025302.374919-1-quchaosheng000=
406@163.com?part=3D1

> dt-bindings: mfd: convert rk805 pinctrl to DT schema

[Severity: Low]
The MFD subsystem guidelines require that the description after the subsyst=
em
prefix be capitalized. Should the word convert be capitalized to Convert he=
re
to align with the standard MFD naming conventions?

> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> index da2391530c16c..6353aef3ebe7c 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml

[ ... ]

> @@ -86,6 +86,34 @@ properties:
>          unevaluatedProperties: false
>      unevaluatedProperties: false
> =20
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      The RK805 has two output-only GPIOs which can be muxed to the GPIO
> +      function and driven low or high at boot.

[Severity: Medium]
Since the RK805 PMIC provides GPIO controller capabilities, the device tree
binding guidelines state that the corresponding properties (gpio-controller
and #gpio-cells) must be added to the global required list.=20

The deleted text binding explicitly enforced this requirement. Should
gpio-controller and #gpio-cells be appended to the required list in this
schema to prevent incomplete device tree nodes from silently passing valida=
tion?

[ ... ]

> @@ -137,6 +165,12 @@ examples:
>              vcc5-supply =3D <&vcc_io>;
>              vcc6-supply =3D <&vcc_io>;
> =20
> +            rk805_default: rk805-default-pins {
> +                pins =3D "gpio0", "gpio1";
> +                function =3D "gpio";
> +                output-high;
> +            };

[Severity: Medium]
Does the example PMIC node also need to be updated to include
gpio-controller; and #gpio-cells =3D <2>; to demonstrate a valid and comple=
te
configuration?

Device tree binding guidelines mandate that the examples section must inclu=
de
all required properties for hardware capabilities like GPIO controllers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923034245.3964=
17-1-quchaosheng000406@163.com?part=3D1
