Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CF03D88F6;
	Sun,  4 Oct 2026 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132880; cv=none; b=Ir4QW9Q4OUIsx4BVuw5LwPHiSIDYXRnt7j4NB5+uxMAeuudp+do76UpvMzTeSAwpOH2CLuuQPbbSZa0SNtKiBw3ZsDNPrkXdSCozncrADnLonoq0AEEza5IvkMZfboBLpxjCrm8xCNc0eXiNC7GzVF9/ePw9v/us8jP/9S930Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132880; c=relaxed/simple;
	bh=TlQQivNQDdXhzhtZmgmRKqVxk4tHFDO+j5mCVUIB120=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EvnEmm6x0q38gdByoDXHklwdfkTlUoTHLxDEHvuvatC7qhX4i3qFhIFGDgq5k3ts2jYPGjwcIyLfl2rmiZ0yex3xXBoGKL4ICvAk8psqHYrqZwAPjOafHfhwcDyF5jokuWen/fb/HJh795M9RRa50IFfHPrn7GD/uWq0EZQ14b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVUBecdt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVUBecdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8441F000FF;
	Sun,  4 Oct 2026 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791132870;
	bh=NBCZh0Bbi0e7OowDfnL5q0PlqRgE3kemrckowdtq9m8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RVUBecdtQoxhDpVVn05aAGLQDxcA7HoaSg28Beow6mx8m9+Y6CyVtAFXMTzFv3ssN
	 5Cp9wxtHbsfKv1aLiCmHJi+JtmJ6dHWzif790sQz2AWVNYBqU7ttfMhYq7SGfN/+CJ
	 q3uyglYBIYiEZnlRj96CokbVyUexCtSqvXLUQsECkauA6iFw6MBK+kY4/jvzkJ0h0T
	 tqESAj+4dJtg95mzQAD2blPfDt4BbvajVq5TIpt/M+aBvD3Rrdyyr4hF8svfZu2bgc
	 Al6lBKWvsGQ9KCg2yEAXTi5sfuHG15p5pqIZAamAeOQpDYj/0n0EPYIqSAZR7YIMnm
	 dPYTwx+xqwLuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] regulator: dt-bindings: maxim,max8907: Convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261004164540.198446-2-clamor95@gmail.com>
References: <20261004164540.198446-1-clamor95@gmail.com>
 <20261004164540.198446-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 16:54:29 +0000
Message-Id: <20261004165429.AC8441F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: broken schema reference to non-existent nvidia,tegra-r=
egulators-coupling.yaml
--

commit 299fcba3d236bda6f3824120d17a27592c67f650
Author: Svyatoslav Ryhel <clamor95@gmail.com>

regulator: dt-bindings: maxim,max8907: Convert to DT schema

Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
to nvidia,tegra-regulators-coupling in child regulator nodes.

> diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.ya=
ml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
> new file mode 100644
> index 0000000000000..e4e1390a49b9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
[ ... ]
> +  regulators:
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "^(sd[1-3]|ldo([1-9]|1[0-9]|20)|bbat|mbatt|out(5v|33v)|sdby|vrtc)$=
":
> +        allOf:
> +          - $ref: /schemas/regulator/regulator.yaml#
> +          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.ya=
ml#

[Severity: Low]
Does this schema reference break dtschema device tree validation?

The dt_binding_check validation tool will fail because it cannot resolve the
referenced nvidia,tegra-regulators-coupling.yaml schema, as the target file
has not been converted and still only exists as a .txt binding.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004164540.1984=
46-1-clamor95@gmail.com?part=3D1
