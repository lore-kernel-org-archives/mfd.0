Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BA33A7F70;
	Mon, 10 Aug 2026 07:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345946; cv=none; b=P2DRLEOEcxst9ofxhbGb4rqftld/YTEwp2yUGbsDTiirzBb+VRHTFKR3uvV9XDvUZoEe1dwUn+JbN+/KpTnnUPC86yechawX1VjUVEJYBT+y0SgsNYqYS/s9jHyBUfUFlSEWwQ3kmRAHfvb2C/qc+qyvj7gRKQ2WJ5oSRLWMnxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345946; c=relaxed/simple;
	bh=vxjn0kstIXphSQ7W/hFJBifcLcOmmYk8j+356HbPZGk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c9QGPT84pdWRS14zU1UkhDYHx4lVN+xOtdIbP4QVUgrLueZULpwAxVFsVYyIYJcLp6rY9Bjxfn3gUWgSieVVZmM/WEa1ewzunMz6UspS+E1LsnV51wRnkpVpvjYKcgfeGzSpcouwJKdRXZHhShU10mi0OC4UVkFhDzwgLLg8RHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObxNGGLD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObxNGGLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA301F00A3A;
	Mon, 10 Aug 2026 07:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345944;
	bh=ukEbMDHXvbvSJkelE8ZUEfN7cPr40c3734omGYGVXMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ObxNGGLD5WKJ4lM8TJgkoU5VvUFFqBYeyq4a5nqYj9EoLJ9dMvg7eavcPGuPzhigo
	 ynGr22TE6i3gtQg6v+iubiWBRDmdMVQQC4ZCWN4rm5oHAs4XyQ4kM4h1+VgtF3Zeso
	 3Bd/xOtqECYiq3rhkHKjcSQ0b32s/K8zN27oeda1y5CqYBnKIbwJ2oRJf5j5ANHbx2
	 CbvtHYUThGqrpgUVgKISpWHvM00wY7jVsMZP3AjzIB4uKNbHDZuo6cDURtxyg20VcP
	 IAnzH1TmTbTDvH9DPuucmdEa+UedTcr/oVga83HdydiNRXQ9QaWFRMEfVG68Rp+KWS
	 eWpg34dQvRgpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260810-zx29clk-v10-1-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-1-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:12:23 +0000
Message-Id: <20260810071224.5AA301F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing `resets` property definition in the YAML schema.
- [Medium] Missing `simple-mfd` in compatible string list for syscon with c=
hildren.
--

--- Patch [1]: [PATCH v10 01/12] dt-bindings: clk: zte: Add zx297520v3 top =
clock and reset controller ---
commit 882e8225886a115922ab8c1c6e5b59390b7d1aa8
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller

This commit adds the device tree binding schema for the zx297520v3 top clock
and reset controller. It details the required oscillators, clock outputs, P=
HY
controls, and includes a child node for syscon-reboot functionality.

> diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcr=
m.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
> new file mode 100644
> index 0000000000000..8510ffde29249
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - const: zte,zx297520v3-topcrm
> +      - const: syscon

[Severity: Medium]
This binding includes a syscon-reboot child node, but restricts the compati=
ble
strings to just the specific topcrm string and "syscon". Without "simple-mf=
d"
in the compatible list, will the kernel's generic platform code fail to
automatically probe the reboot child node?

[Severity: Medium]
The commit message mentions a self-referencing reset property, but the
"resets" property is not explicitly defined in this properties block. Since
the schema later sets additionalProperties: false, will device trees
utilizing this self-referencing reset fail dtbs_check schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D1
