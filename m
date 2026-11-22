Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359266;
	b=VdUZ+utTSDRyMkM5O6tuhW5lcCliDOfDknc2YrnggqmzU65jyKTIkysMHUXiZ3GI2ETZ
	 H+55QoD6gNgoRenlR3Shio5/zxhB/VY/yxiLefbcmISnY0bpOx9z19jIBTdFSbxOExy9H
	 0ZOtJO8MmQ5PZjC8R8uulxPX+/4Zl2faublp7fh2NTAzl3lBYkpI/XgHAMAU0BoC8Dh5X
	 Td6j676/rvLuLdHaqrvimpzkY04ZSdDSJBrqYyfprM8OUi1D7OBWuyN3GwrVCw8M321E7
	 T8Xw3MGcq8udGZbZBElbonlPe9OjP7wpNWo70Csx/P9drQxBXLC+8cNufjaNZtboEwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359266;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iN/nddxdvRMLU2SkW9x6MGgEnBY1rvCW4Vq0IU091oo=;
	b=BKzCrcpsy8nb59VbFmSXMpK8ieN+AfBwUVcDO20wuxSZnVXi/JFbdTsTfVbf6SIf33Cp
	 oqEt4H63EiwxtBtyJ8jxhjDd/XdMiAPeTBHJq6BQDZ7k634l2fNrvX5RF6YgG5ROawNGC
	 hhoqDGQpbuxx+2Sf3qlxuKmS7r3ub6iYuYRW0S/+jtdXrbW4BUA//YE5OZZQAd6xwMfe5
	 k85BIzTFYt26ikm3YxRoe1u9lSJwXvM3z7umNP5zOxCZF/357954NsukHBIhsJLzW7b+n
	 S92qPb/ai8CantnDeIvqjxIrF5LOWt0HRa/LN8qLYptD/oARbRlDMbX9W9uq71u2z/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BREg/BeO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAF4606A331;
	Sun, 22 Nov 2026 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BREg/BeO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C782F1F000D4;
	Sun, 22 Nov 2026 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795359265;
	bh=iN/nddxdvRMLU2SkW9x6MGgEnBY1rvCW4Vq0IU091oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BREg/BeOBdwAJd7clok41drHWisly6ktafnWOSBCuiCCVtqMUhOgRXOEwR38UJAy6
	 SX87epgJP2Eu3/QVf2oEeuJUxQeSoQPUGn+HKOjdaNa9OUPeHjnXQ0YHo60hQ40qld
	 ZGvJcJACjFveYKOAsDYfsen3bCwOmfHTdhQZRIpnjsYR7/Hns1+932ozb3NSbNCzht
	 WtVJ+0jfMxOtPFSTy876LCur3vTSDwZ68zPuQsT6RzZjKwlLt7HL3liB8bAbSFFHRe
	 y1WnG2go3Kv9NPitpZ0YjStNAfPnQ4BP+uk3xqaqzSHqgETH7uoHTR+e7FcaMSc5H4
	 i9dZCAoLIo6jQ==
Date: Sun, 22 Nov 2026 15:54:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vasilij Strassheim <v.strassheim@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Eric Dumazet <edumazet@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	mfd@lists.linux.dev, Martin Kaistra <martin.kaistra@linutronix.de>, 
	Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: [PATCH net-next v5 3/9] dt-bindings: net: dsa: Add SoC-e SWIP
 switch function
Message-ID: <20261122-camouflaged-pretty-camel-79f370@quoll>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
 <20261120-devel-vstrassheim-soce-dsa-ml-v5-3-5de9225715e6@linutronix.de>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-3-5de9225715e6@linutronix.de>

On Fri, Nov 20, 2026 at 03:52:20PM +0100, Vasilij Strassheim wrote:
> +$ref: dsa.yaml#/$defs/ethernet-ports
> +
> +properties:
> +  compatible:
> +    const: soce,swip-switch-00-04-0c-10
> +    description:
> +      This compatible identifies the register layout; its suffix gives
> +      the offsets of the core version and feature identification
> +      registers (0x00, 0x04, 0x0c, and 0x10). Port counts and optional
> +      features depend on the FPGA synthesis configuration and are
> +      detected at runtime using this register layout.
> +
> +  reg:
> +    description:
> +      Register window of the IP core. Switch register blocks are located at
> +      offsets defined by the compatible. The MDIO controller and bus
> +      multiplexer occupy separate subregions described by sibling nodes.
> +    maxItems: 1
> +
> +  ethernet-ports:
> +    type: object

I guess this should follow:
https://lore.kernel.org/r/20261120002549.1908299-7-prabhakar.mahadev-lad.rj@bp.renesas.com/

so: additionalProperties: true

> +    patternProperties:
> +      '^ethernet-port@[0-9a-f]+$':

and:
'^ethernet-port@':

> +        type: object

Best regards,
Krzysztof

