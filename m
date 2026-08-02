Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5C433710F;
	Sun,  2 Aug 2026 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785703371; cv=none; b=s7AHpeg9iX+13e6bk3Bxm2mKR7S6DduOiS2bRsJTXXdiJuUTKr4dtuA+yozM2k6yfUf6Br7oFzaJ7BfjPGyzF+O9QQJvOI1b3LevwjPZD2r+ciiWwchtrPKvT1HZ1IFeF1cy0mj9sI5moM984mBXOQAWAyJAAUICrrsTkkxLZkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785703371; c=relaxed/simple;
	bh=irrM4P20jRR2a5XztiFV8Zn4/Vk1jZL1GWtnT6EmxEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lpVDLEvqQsH/4gfyGat+4iLExGffda51pZ+tckkPNL8LRdszEJqyncGDgcIqB8M6PkiZuylt8icd1lqKlJRMvJEO3C4WOb/IN3dASDeWY2PB0VF5LWpbX/KFe4JVcIjo6IzZLM0A6yyjcTUjyPvUNzktFbyWCKwhwhEIkZ+GXBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYnYnTn0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYnYnTn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3716E1F000E9;
	Sun,  2 Aug 2026 20:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785703369;
	bh=05d7tOGLEKQPje/tDKoASPNLvNopohLv9tFUdBtQjlk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PYnYnTn0d2wRkFW1Bv9Eh4zqnIKWiD9UolO+PNai7U6OMibFOCV7UsofSQ5E/09Fu
	 gdr/DTGJIoWoHlcs6ZE6LJrgjgE8OeOwfgGcKE41GG1FrCZZ5auXr8gM/gcD1Ct+6E
	 IxDkRlrlszHs5WWsd8KZiQqOJUBJWwndXheVwnQQR3mWCfAngh8gTS/C6RqbZVrvAU
	 EuIddC1/3oBGN+QSE4G78wToSZNKCzWOJhP9beo05fr1rMA2X0XtP4TVG6Tu4SSUdx
	 oKAXgmVuljNLEqVfc/6s8sxAFjyn86wCHbbtpW9Dge6WBjUrZwppRt1egUnSKDRTNa
	 EkZ8KASpwmPGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260802-zx29clk-v9-1-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-1-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 20:42:48 +0000
Message-Id: <20260802204249.3716E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema omits the `resets` property while restricting additio=
nal properties, which will cause DT validation failures.
--

--- Patch [1]: [PATCH v9 01/12] dt-bindings: clk: zte: Add zx297520v3 top c=
lock and reset controller ---
commit aac89094dd71d6499e06c62f3e14a6df6d5efac5
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller

This commit adds the device tree binding schema for the ZTE zx297520v3 top
clock and reset controller. It defines clocks, resets, and PHY properties
for the topcrm node, as well as a syscon reboot child node.

> diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcr=
m.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - const: zte,zx297520v3-topcrm
> +      - const: syscon
[ ... ]
> +  "#reset-cells":
> +    const: 1
> +
> +  reboot:
> +    type: object
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Reboot method for the SoC.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - reboot
> +  - "#clock-cells"
> +  - "#phy-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false

[Severity: Medium]
Should the resets property be explicitly added to the properties block?

The commit message mentions a self-referencing reset property being used on
this node, but because additionalProperties is set to false, omitting resets
from the schema will cause dtbs_check to fail when validating device trees
that include it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D1
