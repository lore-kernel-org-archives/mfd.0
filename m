Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC11244687;
	Wed, 29 Jul 2026 17:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345397; cv=none; b=pmX/3rtNMKBwhv6u73LhVjSJEUFh6BoK67b4O6ERLeW6dCloL4rTYHjVI+Z+urwNqibLN3IyQMazOUA+Y61bI1b91lJtLX5C8DHH1aFwVfPZfzC5XFWkxQoqKjmM58jJoKGQYrNpx6FvhoF8ovbTCI4aLedNrBdUoBZkvmZwp2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345397; c=relaxed/simple;
	bh=CDHXIDwy2KusC9yF2Lp2VRbBp4GP92eL+X/Zw6UGjgQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cWcFvwcGt82isAPBVfDbKVxFcQwJmBJ9WWPBzDvYn8bK3kuttlhmZ2nAeOHBXwtyxnG5oUlOK3cav/S+3C7/NgMfduTiWNIJOVHRyEanLvK3Ae+tyQp04UTG/wP7OVdSlzq7h/4jDR0TNIGxKha+RcCTHk4FZy7eT2RfOEaifmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqJtoeoM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqJtoeoM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5261F000E9;
	Wed, 29 Jul 2026 17:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345396;
	bh=nGIFS3ocTuVLQDx9DZpRD1FgQJXDRYSIHgalkxs89mk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JqJtoeoMyOFuYppAMxxGbXdLvU9MmSj96vf4aTO/DtNnjE83az31L9NrvjENtqTV8
	 RwruVooN9ndSHxIGlk1zNJ+gIGeqxT+uksdklnoe8fkKhuzdLhj2NbwvLc9aKJTRd/
	 tWtZbF7TD1U2J8YfqR57sXsK5U9/Ni+5921AESCTcLsvyL+eCuO0/E98per/sRiKqK
	 GtOAoi+oXvVzZGOZPBos52Vh13IMxm5A8tBrOJ8Az+zqFbr3FTyOPJLR6+HxwN2crN
	 FhqZn2T5OHaNJki75UPHu3pU2AvPKoQZ4sah9NzzhKZhJWtjMHyZgYp8oQ4ZzwN4xh
	 tdHOFKxx/gzGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 03/10] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728154846.1828945-4-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 17:16:35 +0000
Message-Id: <20260729171635.CC5261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The `reset-gpios` property is defined as `true` without a `maxItems=
` constraint.
- [Low] The `mdio` child node property is missing the `type: object` declar=
ation.
- [Low] The example includes a DT binding header for GPIO flags but uses a =
magic number instead of the appropriate macro.
--

--- Patch [3]: [PATCH net-next v19 03/10] dt-bindings: mfd: Document suppor=
t for Airoha AN8855 Switch SoC ---
commit bdb9e8bcc1f2530430cfc54469b92361f09d65cd
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC

This commit adds device tree bindings documentation for the Airoha AN8855
Switch SoC. It defines the constraints for peripherals including an Ethernet
switch, NVMEM provider, and Ethernet PHYs.

> diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/D=
ocumentation/devicetree/bindings/mfd/airoha,an8855.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> @@ -0,0 +1,173 @@
[ ... ]
> +properties:
> +  compatible:
> +    const: airoha,an8855
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios: true

[Severity: Low]
Should this define a maxItems constraint?=20

Since it doesn't reference a common schema that enforces a limit (like
panel-common.yaml), device trees defining multiple GPIOs might silently pass
validation, even if the hardware only supports a single reset line.

> +
> +  efuse:
> +    type: object
> +    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
> +    description: EFUSE exposed by the Airoha AN8855 SoC
> +
> +  ethernet-switch:
> +    type: object
> +    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
> +    description: Switch exposed by the Airoha AN8855 SoC
> +
> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +    description: MDIO exposed by the Airoha AN8855 SoC

[Severity: Low]
Is type: object missing here?

The standard mdio.yaml does not enforce type: object at its root. If a
malformed device tree defines mdio as a scalar value, object-related
validation rules might be bypassed. The sibling efuse and ethernet-switch
declarations correctly specify it for their respective nodes.

> +
> +required:
> +  - compatible
> +  - reg
> +  - mdio
> +  - ethernet-switch
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    mdio {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        soc@1 {
> +            compatible =3D "airoha,an8855";
> +            reg =3D <1>;
> +
> +            reset-gpios =3D <&pio 39 0>;

[Severity: Low]
Since the dt-bindings/gpio/gpio.h header is included at the top of the
example, would it be better to use GPIO_ACTIVE_HIGH instead of the raw
integer 0 for the flags parameter?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728154846.1828=
945-1-ansuelsmth@gmail.com?part=3D3
