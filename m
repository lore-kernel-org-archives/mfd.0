Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B7E3C5857;
	Mon, 31 Aug 2026 23:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788220254; cv=none; b=RzrBGNepUZzZg/gHh5Db9zes932Vl9IUpv5qkRHnuVbg0EFgKv0yh0STA/jGvYg6Lp9s44U4ggDk2YMAeeKrjoXeJL7jVCRlbHeLB9Gw+X/J7uhbv5L9xFFDj2wrGLRmXAm2pN4rPZNuHenjFCeqMPLRQlo1hOBa3gV02j/ehgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788220254; c=relaxed/simple;
	bh=eG4qalLYL3gY7aaO6rUiZw5LWpaX2u7n0DSeTaDDv+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VDlAJxT1Jo48nOjwT56lZ4p7SXyMLfhRJXJPzb9Z/NBdZxIeKYQUghpKRsfpoeyOkxQT28SfmATrNAztdHnbNX18JU81eLOYtR+tI90gn684PZZOmP116FNg/AQtU9Xmh+KoNwdYEHBE/X/IESg3fGVPL/rOyq4AiTCgghskCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5IYeQKE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5IYeQKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338CD1F000E9;
	Mon, 31 Aug 2026 23:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788220252;
	bh=XwxzOwupvyZ4QOrQqHtWPNDd1nyQBHmTFR2nQzOQ8hY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a5IYeQKECG9Qvm782NecRx1+F5sSYzzXQTTaznmaqu4Bus8BvaeNrftRvHRjPsLPl
	 NRtBPtx2QUUELSOrwY/+x88Mu5OnOiKcIUDDa9+jLntlRl0JqWgImUhBQY2rZQ7sSp
	 oYldfFXu/tYqq8oyx73hKQSv3vLLMS2OeVyhFWseL3l0GqMsJEcZCsi52et/oo3RpS
	 RDYGXNefSxO/oxWKV1NJtXiZATqACBSCTZn8Bp2qyXewmxbTYztlVXpramGXPFf5c7
	 JIFTUEXd5w/DEsaoFlsWmQri/4Q7r+dKMFI8YAujtbJSNNaJAFuARJ6cMSpANoeB5w
	 DoSfZ4PvqlXJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
References: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
 <20260901-ti-keystone-devctrl-v4-2-2922f2a44792@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 23:50:51 +0000
Message-Id: <20260831235052.338CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The YAML example block contains phandle references to labels that a=
re not defined, causing `dt_binding_check` to fail compilation.
--

commit afa65fa8e16c9a7e5fce2efb40236086a0eed689
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

Convert the Texas Instruments Keystone Device State Control binding from
legacy text format to DT schema.

> diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.ya=
ml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> new file mode 100644
> index 0000000000000..564dfc8a731f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    device-state-control@2620000 {

[Severity: Low]
Does omitting the devctrl: label from this node cause compilation to fail?

When make dt_binding_check is run, it extracts the examples block in
Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml into a
standalone .dts file and compiles it. Without the label, subsequent
references to &devctrl in the child nodes cannot be resolved by dtc.

> +        compatible =3D "ti,keystone-devctrl", "syscon", "simple-mfd";
> +        reg =3D <0x02620000 0x1000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges =3D <0x0 0x02620000 0x1000>;
> +
> +        interrupt-controller@2a0 {
> +            compatible =3D "ti,keystone-irq";
> +            reg =3D <0x2a0 0x4>;
> +            interrupts =3D <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <1>;
> +            ti,syscon-dev =3D <&devctrl 0x2a0>;

[Severity: Low]
Can this use the &devctrl phandle since the label wasn't defined on the
parent node?

> +        };
> +
> +        reset-controller@328 {
> +            compatible =3D "ti,keystone-reset";
> +            reg =3D <0x328 0x10>;
> +            ti,syscon-pll =3D <&pllctrl 0xe4>;

[Severity: Low]
Is the &pllctrl phandle defined anywhere in this example?

Because the examples block is compiled independently during dt_binding_chec=
k,
referencing an undefined &pllctrl phandle will cause dtc compilation to fai=
l.
A dummy pllctrl node might be required here.

> +            ti,syscon-dev =3D <&devctrl 0x328>;
> +            ti,wdt-list =3D <0>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ti-keyston=
e-devctrl-v4-0-2922f2a44792@gmail.com?part=3D2
