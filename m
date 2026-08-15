Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F66219E8;
	Sat, 15 Aug 2026 19:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786820442; cv=none; b=tJW5qX4OatD1G97v06jQ7D5m3jEfjLvzVFIi6HPPTKUDtpZmFE7XB8k4rp143A+8mntPRUDLyJmiUyj01ZBqnlMFssqkwU4FCy5138IcefgwTE1YCGsOTNmsJT4IhYNX3/UAsxKK2/YimYfnW1tCgrpiDXQbbXCfHEY9O45UC/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786820442; c=relaxed/simple;
	bh=Vx6ZhKe+ctxkS5aHpdd/psFmc3NVHhpudCsAuuoBwjI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CVCFfjs5O3BF+PLNb95pcWgGQ2Mmt7fSmE7tqubczz4RO5vNCzAhHJGLjeFxnv4tHv57FI0RqsDiKnrKCWuGqxsjqoZQBXIA/PVn1wMuNQRmN/MWKl6ihVapZqlJ6daXVQ64Hy7z32yzF7UTD/eIc/ST1zZv5oRag8ymY+sleMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXPnl1cA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXPnl1cA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7973A1F00A3A;
	Sat, 15 Aug 2026 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786820440;
	bh=k6Bgk8wE8d16nrgyWmoM4W2o3jEkPRAmYmUfYexrtew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TXPnl1cAVSO1VN5oI7tWIv6x696/MaRJd7+3QrlCQwAlSWvCeawyVHBIaqMRfrvH5
	 18YJTR+LLL/FXtAqFi7fTTEaHkrqhTLn5OQFUp3PkivmaqoR9zQGm7Zn4Qh5k5+qlP
	 Ifyy+fAIxbayOHDNvcdqenfdvKiOd6XteCE4lsl3Ej3krQZSpBs8rqmKdrVWBbAxfH
	 7CGtsEXVoIlzQeRMWyLwlY1HXSzHkyoHDSLdidRyd+0iCbqAYGqWiUep6Rf46DDWM+
	 Z3GZTeRQbcIFlvdnJcYh1O89p6MbRL6l12j2Zmvf8JNLsN5TrdoxGD999/4PWd8IYo
	 kTbvPcwzJ+JSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
References: <20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com>
 <20260816-ti-keystone-devctrl-v2-2-5ab1e13c15c1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 19:00:40 +0000
Message-Id: <20260815190040.7973A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unresolved phandle references in the YAML example cause `dt_binding=
_check` failures.
--

--- Patch [2]: [PATCH v2 2/2] dt-bindings: mfd: ti,keystone-devctrl: Conver=
t to DT schema ---
commit 48184e73993f7287e1c95f939a5d488075736de6
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

This commit converts the Texas Instruments Keystone Device State Control
binding from the legacy text format to a DT schema. It also adds simple-mfd
and missing bus properties while documenting child nodes.

> diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.ya=
ml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    device-state-control@2620000 {
> +        compatible =3D "ti,keystone-devctrl", "syscon", "simple-mfd";
> +        reg =3D <0x02620000 0x1000>;
[ ... ]
> +        interrupt-controller@2a0 {
> +            compatible =3D "ti,keystone-irq";
> +            reg =3D <0x2a0 0x4>;
> +            interrupts =3D <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <1>;
> +            ti,syscon-dev =3D <&devctrl 0x2a0>;

[Severity: Low]
Will dtc fail to compile this example due to an unresolved phandle referenc=
e?
The previous text binding defined a devctrl: label for the parent node, but
it appears to have been dropped during the conversion.

> +        };
> +
> +        reset-controller@328 {
> +            compatible =3D "ti,keystone-reset";
> +            reg =3D <0x328 0x10>;
> +            ti,syscon-pll =3D <&pllctrl 0xe4>;

[Severity: Low]
Does the example need a dummy pllctrl node or label to avoid validation
failures? It looks like &pllctrl is referenced here but not defined anywhere
in the example block.

> +            ti,syscon-dev =3D <&devctrl 0x328>;
> +            ti,wdt-list =3D <0>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816-ti-keyston=
e-devctrl-v2-0-5ab1e13c15c1@gmail.com?part=3D2
