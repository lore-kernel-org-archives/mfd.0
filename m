Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537763C1F;
	Wed, 23 Sep 2026 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150016; cv=none; b=fEzj1eqrOX/+R29P/MN4uKb2z4Vb77+zTaERjkHQdNfC7xszNXQBnVqf3pOgnZYSccD11pYIoIq6nImz3uevcfgqeJWpUqoyo+AWJqBZT7SbO0VPnzIbjlBLoklNnklSfTEFyCLqTP61pg7NNSCMEYVkTYs1QsX0b88JodjLbo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150016; c=relaxed/simple;
	bh=8Z276nq62KVcfr/o/Q1pql0OltZ2EZgdWtBZ9BPWxKc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dUcHjeE1EGk6Gqi5VysXtT2TXDW7KOJ9uDgwVLxbaXzIftgG+UBm/1hM7++FZ3A02o4q4W7HzgRUpFfN5/gOJ0hikMVZcRbXHOF6Z1mhWcs2maTGpjUJVkpUkUm0XP9pkLLWxveA4aeFs/T1wamkn2VCKQ2opo+zyBkfA99zhLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZckJqh5Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZckJqh5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE071F000FF;
	Wed, 23 Sep 2026 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790150015;
	bh=k6MWyhTwJxXqyKw47dlzxQX4zZCBT/rUiSD8A/PK/eE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZckJqh5QD0c5WQDSUvRJYWEYjsM1NAYWQkrGeKrUGfkJuLokukkekJjQWNsngDbeH
	 s9KNA3PPjQzhNnTM6VPxhutSUd9KqU0ox7JIqBOEMDg4kruKKQxyoScUJQMJumMacW
	 f5XYGVfJLJyz2JIpxut+lwuX1KzparFa+DVgzA/iNWAmjbD3+NabpKgtyzJ+PZemz3
	 2s/ppYazOY5ZXWi4pCCS0ShbJu/CTmM2PMYAI8YtWPsF02qs1Tk0hWzHVh42nN1hVA
	 GgvYhbkXDq2+G5Zy7rl5JSELsSAaEvHmWOEqowxg3h7zu8605MQ2AyLvyp3mys4K+U
	 PVdpGw69oRX7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: rockchip,rk805: Convert pinctrl to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260923074337.575122-1-quchaosheng000406@163.com>
References: <20260923074337.575122-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 07:53:34 +0000
Message-Id: <20260923075334.8DE071F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: schema validation bypass in pinmux node
--

commit 3e9f0dec3f740f3763a3ebb688af0f850b47bc2f
Author: Quchaosheng <quchaosheng000406@163.com>

    dt-bindings: mfd: rockchip,rk805: Convert pinctrl to DT schema
   =20
    pinctrl-rk805.txt describes the pinmux controller that is part of the
    Rockchip RK805 PMIC. The PMIC itself is already described by
    rockchip,rk805.yaml, so the pinmux part belongs there as well: the
    pinctrl node is a child of the PMIC node, not a separate device.

    Link: https://sashiko.dev/#/patchset/20260923034245.396417-1-quchaoshen=
g000406@163.com?part=3D1
    Link: https://sashiko.dev/#/patchset/20260923062746.516666-1-quchaoshen=
g000406@163.com?part=3D1

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
Does this catch-all regex bypass schema validation for all non-object
properties within the grouping node?

The pinmux grouping node in the schema attempts to reject invalid properties
using additionalProperties: false, but its patternProperties regex '^.+$'
combined with if: type: object without an else: false clause evaluates to t=
rue
for all non-object properties.

This defeats the strictness of the schema, allowing any arbitrary misspelle=
d or
invalid non-object property (like typo =3D <1>;) to pass validation silentl=
y.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923074337.5751=
22-1-quchaosheng000406@163.com?part=3D1
