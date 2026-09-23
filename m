Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5411A23A561;
	Wed, 23 Sep 2026 03:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132531; cv=none; b=fgdDaK3ZoSkIcecfD7fEtOgGdvLNmgWC47AUtdmouBgGEP1cFCBsnLYrKA0Hqffpv40Xby0Gk2EBo+Ytul3WNhEzaWZFvT1wECMU/Tr6/NCk0nZ7cQkn9qGIxv0sTevogPxJ2Jik+qEQTfShLgmzwGvaQxOfbMi5z+7U+wk5xCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132531; c=relaxed/simple;
	bh=wTpfdpzownhQR6qzvURPJ1CVE/LkBzMfXkm3CpJemiU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Av+T4nUJbGREEUAp0r/kGQPMG+Th+X+fQEcrRJE5MYIvq9IBq+gP9OJv+uISA9TwhWQSb6xW3ZNDgjKVxUOe3/cIPup061c8X2oadaB3aMGW/7Wv5q9xXjc3mpIXQXZDPND4YK7YqExPESPs2hIcOWeIY9i1VpN4fEfaBSdnRx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bj3BsvQX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bj3BsvQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E861F000FF;
	Wed, 23 Sep 2026 03:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790132530;
	bh=c5Jdc52pbKHhGVDNF80z6ad86uu4NAyzh4rLRaTvDJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bj3BsvQXQevi/KyGsvhA5AGkHn5qu7rLd/lIOo4kpfwxLQXct6eR2yz6J04VUEroW
	 QPg1Vg2qzjrax0gJUIRBSvReBjRNX1Sv/ptCHwy+PNjxqIIuwSZxDfr44UD/T5sblD
	 Zy+6agOBfWR3nlTDbjl6nwSBl/oWRiYWdiMn28xPR19OIlvPrDdIteBYvTdWtaf6lZ
	 mHBgA4Dq29Bj2Gg+c4jv3TypdkXz+Q7DqYZmhGeqG705sgjvR5J1/Tvun5MgjMBRl0
	 pithxdxnGln8b7qgX22fnbTzjriWPQ4Sxm0COzmk8jcRfq477TKGdWzlg1MUBuzz28
	 aiRNUTC1ZnomQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: convert rk805 pinctrl to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260923025302.374919-1-quchaosheng000406@163.com>
References: <20260923025302.374919-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 03:02:09 +0000
Message-Id: <20260923030209.98E861F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: mfd: rk805: missing required pins property in schema
--

commit 4d34a5e42e890c7b86f9784a47518ab08b74d070
Author: Quchaosheng <quchaosheng000406@163.com>

dt-bindings: mfd: convert rk805 pinctrl to DT schema

This commit converts the pinctrl-rk805.txt binding to device tree schema by
folding the pinmux description directly into rockchip,rk805.yaml. It also
adds the missing -pins$ child node pattern property to correctly validate
pin configuration nodes.

> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml
> @@ -86,6 +86,31 @@ properties:
>          unevaluatedProperties: false
>      unevaluatedProperties: false
> =20
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      The RK805 has two output-only GPIOs which can be muxed to the GPIO
> +      function and driven low or high at boot.
> +    additionalProperties: false
> +
> +    properties:
> +      pins:
> +        description:
> +          List of GPIO pins to configure.
> +        items:
> +          enum: [gpio0, gpio1]
> +        minItems: 1
> +        maxItems: 2
> +
> +      function:
> +        description:
> +          The RK805 only supports the GPIO function.
> +        enum: [gpio]
> +
> +      output-low: true
> +      output-high: true
> +

[Severity: Medium]
Does this new patternProperties.-pins$ schema block allow empty or malformed
pin configuration nodes to pass validation?

If a device tree author creates an empty or malformed pinctrl node matching
the -pins$ pattern, it will silently pass dt_binding_check and dtbs_check
validation because there is no constraint mandating the pins property. The
older text binding previously documented this property as required.

Should a required: [ pins ] constraint be added to the -pins$ object
definition to ensure the schema strictly enforces valid pin configurations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923025302.3749=
19-1-quchaosheng000406@163.com?part=3D1
