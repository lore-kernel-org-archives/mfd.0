Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13BE3FD132;
	Wed, 30 Sep 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777531; cv=none; b=cAdnEiDU5/cAqoQ7j8byDJHBzaSQtj5k5tXfR/w7RytHsgsoruiAkm1xIPoctQEhs1AIktohu/WZQxTwHEpRl1h53V/Yv7ZBLqMO/uibiYe1RVkcJb/IkE2viR3UWctgCqIYL9sonpyfrAmmD2+1FEzgtBId+XviZeT2ynKgYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777531; c=relaxed/simple;
	bh=jqaZ8ZEiZcgz4966tfJBT3hVOLy8rY8vy6TqqWDgKLY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pRXx36xT2YbpY71whn0nXHecdyNO9HBTIyMnLNYKCObXcMvhb/IZhZsklbUSMBw82UFpoA7XATV0vVtF7efh57I7YDX88wW3Q0jim9wjH7wGYS0qeaeeeTLpyUFZn1Jbeu4E6tlmScEHBha/HuMF9n8zSIi1ZGCFGjC4KbbsDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtQ6q8om; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtQ6q8om"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EF51F00898;
	Wed, 30 Sep 2026 14:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790777521;
	bh=Ddp1Moo6lzDzDSK0+1MMkmEzxAI5WOAf4Bx8FgJwHmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dtQ6q8omldAqcNoKyaGOvuCZXxRUp1a+E934ME0pkvQPkbXoTZqONq5EpJJuUc6Kd
	 ZYOSt3KAgzUANyeFbSM+Y/wu6Twsy20neaDaiNkzAK9zb+/4CNg1SvMFTNmsrt8zSK
	 7mG1xj7E5gh8kkLXjHYu0zN6Q8tiv+GaOB5F2TNVPX21OXeqZ0+ur9aiRrVEmCp0Kw
	 AuCi1f7W+mUbsrBqoUPTPDFHRdqilNdznqHfrbae43l85LgSKShLzym5h6ARAWf3i/
	 N3pZjhm1hBNJSeCWSQSt1pv42t1oOVMMJy6dmEf42oJNvxg7p/SEN3WlRp1w+sq7cq
	 DIdBOO++9saSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: as3722: Convert to json-schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260930-as3722-bindings-v2-1-a3bba649ebf9@nvidia.com>
References: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
 <20260930-as3722-bindings-v2-1-a3bba649ebf9@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 14:12:00 +0000
Message-Id: <20260930141200.E3EF51F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: mfd: as3722 strict 'pinmux' property name prevents =
multiple pinctrl states
- [Medium] dt-bindings: mfd: as3722 pinmux child node regex incorrectly rej=
ects hyphens
--

commit b7aefbb600a8c4a41917fc0749a39bff2e1a88d7
Author: Thierry Reding <treding@nvidia.com>

dt-bindings: mfd: as3722: Convert to json-schema

This commit converts the AMS AS3722 PMIC bindings from the free-form text
format to json-schema.

> diff --git a/Documentation/devicetree/bindings/mfd/ams,as3722.yaml b/Docu=
mentation/devicetree/bindings/mfd/ams,as3722.yaml
> new file mode 100644
> index 0000000000000..51910042c6216
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ams,as3722.yaml
[ ... ]
> +  pinmux:
> +    description:
> +      Device has 8 GPIO pins which can be configured as GPIO as well as =
the
> +      special IO functions.
> +
> +    type: object
> +    additionalProperties: false

[Severity: Medium]
Does strictly naming this property "pinmux" prevent device trees from
declaring multiple unique pinctrl child nodes?

The original text binding supported pinctrl[0...n], but this strict naming =
and
additionalProperties: false will reject secondary pinctrl states like
pinmux-sleep since sibling nodes must have unique names. Should this be a
pattern property like "^(pinmux|pinctrl)(-[0-9a-z]+)?$" instead?

> +
> +    patternProperties:
> +      "^gpio[0-7_]+$":

[Severity: Medium]
Does this regex incorrectly reject hyphens in node names?

Existing device tree configurations such as gpio0-1-3-4-5-6 in
arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi use hyphens to group pins. Si=
nce
additionalProperties is set to false for the pinmux object, this regex will
cause valid existing nodes to fail schema validation.

> +        description:
> +          Child nodes of the pinmux node represent some desired configur=
ation
> +          for a list of pins. This configuration can include the mux fun=
ction
> +          to select on those pin(s), and various pin configuration param=
eters,
> +          such as pull-up, open drain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-as3722-bin=
dings-v2-0-a3bba649ebf9@nvidia.com?part=3D1
