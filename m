Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339FB37F010;
	Wed, 23 Sep 2026 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150092; cv=none; b=SpDftV5t1dsmpz/Bn0dDNhcCEp2gDXJvmfoLbU16gW1CHh6MymY78GH+gPbYPyVHkDPipqaLNy3vA6QYGBOFLbh5WrXk0B3+6SlzKAtIr7TBDk9vejq3YKDrBizm/8MI9q/dDNZwRMYuBlr2GsBsWMlvpaNs0V2QpCWxZVVr02g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150092; c=relaxed/simple;
	bh=DDVkWDIUbcPAASx6ufsrEijQnlAUIlOvmOp1HEYpghI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W4I4Kmu1CC9AxU5PzJRpK+dgx8l/6AUr5GybSzmCPk94IbL54txajk+cZUQkMeBzRmclesrMQtRNpvmWWEgN36nV/Dmg1qYwT1xesJCmrkNPGJYoq812MoXtXybaX8JzWH9ujTZqc9oiKH9/cNnB2LNa7swtBcqJfEfdGvZf5Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9KO2af0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9KO2af0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11531F000FF;
	Wed, 23 Sep 2026 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790150091;
	bh=hHHKYkcxDaojKT/Txey/xwgcDBs9pzNZcH1T62JQDKA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S9KO2af0UBfGnnPP0guLijIEvC07heX5L/POb7qWKgo8oH+0P26RPHa6P0ZE2/TR9
	 IGsU5FtmFQwp42HHmEwEcSKuFwA8sCINyf11mW5XZMXHBapKF3WunKM3YfUxnCnw64
	 nKug7UX2EWDg/g+30HZ5CieDku/ybmGAu8m3LmZb6saZ3gtX9o5ysmSJ2ZNitCm7MW
	 gbtt5+vcDXd1nP28nPnxQQp9PPwqnpBERQ39xfPmMFCPlgzPbiBzxTE6db2lqT3jZA
	 uiB7hvIVOI0a68xIKqkQSWq/6Lgwtm5fAi2Eek6f82yJzhZbqUG4Y6kNaAYMMygbon
	 sdOuuoHhY0XzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: mfd: rockchip,rk805: Convert pinctrl to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260923074503.575956-1-quchaosheng000406@163.com>
References: <20260923074503.575956-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:54:50 +0000
Message-Id: <20260923075450.B11531F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: schema validation bypass in pinmux node
--

commit 23fc579859b9d9440daa6190b6669884929fe260
Author: Quchaosheng <quchaosheng000406@163.com>

dt-bindings: mfd: rockchip,rk805: Convert pinctrl to DT schema

This commit folds the pinmux description from a text binding into the
rockchip,rk805.yaml schema. It adds child node schema definitions to descri=
be
pin configuration nodes, supporting both flat and grouped layouts.

Link: https://sashiko.dev/#/patchset/20260923034245.396417-1-quchaosheng000=
406@163.com?part=3D1
Link: https://sashiko.dev/#/patchset/20260923062746.516666-1-quchaosheng000=
406@163.com?part=3D1

> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> index da2391530c16c..aafc80212c485 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> @@ -77,6 +77,21 @@ properties:
>      description:
>        The input supply for LDO_REG3.
> =20
> +  # pinctrl-bindings.txt allows the pin configuration nodes to be grandc=
hildren
> +  # of the pin controller, and the text binding this replaces used that =
layout:
> +  # a "pinmux" node holding the nodes that carry "pins". The driver reac=
hes both
> +  # layouts, because pinconf_generic_dt_node_to_map() parses the referen=
ced node
> +  # and then walks its children.
> +  pinmux:
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      '^.+$':
> +        if:
> +          type: object
> +        then:
> +          $ref: '#/$defs/rk805-pin-config'

[Severity: Medium]
Does this schema allow arbitrary non-object properties to silently pass
validation?

Because the if: type: object condition lacks an else: false clause, any
property matching the '^.+$' regex that is not an object will evaluate as
valid. Since the property matched patternProperties, it bypasses the
additionalProperties: false check.

Should an else: false clause be added to ensure non-object properties are
properly rejected?

> +
>    regulators:
>      type: object
>      patternProperties:
> @@ -86,6 +101,38 @@ properties:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923074503.5759=
56-1-quchaosheng000406@163.com?part=3D1
