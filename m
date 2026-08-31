Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC595390C9E;
	Mon, 31 Aug 2026 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199622; cv=none; b=G2RpOD35Tg4d6pgaCEOaxEr/RJmwb0H+/FxcVuskWRAfow4NauAYRJZZh0mUkqgh7w0swJiq0FU8KKxQFjIfms9VTAEbscx18NUlgQwIrkBy88Gf0zHRv/tmsoBCggHBjt1w14lckxTtm1eBbqfOr6KBjb8mhzUYMFOglzNcV+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199622; c=relaxed/simple;
	bh=KjkbDfQRnSQAOpLTjKSUKeGWyW/Sbx+uziNNJvE2ZDs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FSF1jsuq1JmC/Dwv6zWVTBp2CwExSMIIfk7gf8F3iVsNhOAOnRZHyBY/TWMfrOL/mZNxXZZN92J7ho6hhim2q86nLHsmWxbGaFhDWgbsOKknVlSqZtKihtl/OsPDxggmwefesuLgbOJO/K8GhFzHgG1r7g35fUFCG2I6xZcnDL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Me1RmjBw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Me1RmjBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464411F000E9;
	Mon, 31 Aug 2026 18:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788199621;
	bh=2Mcn32Mjbdsy5YEIRsuIGTXRhTJ/NUn5hagVF7ODQvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Me1RmjBwPVycEy8oJK7CsvLdyOO7EJ0+VsWFtsDbDrexh6CYafB+US4KepVYYXyQJ
	 ffdDD24mlxnxG7bTfyZI5xwMcwgkJ1yPDLkrI45rDBv1RTJ72h6kcrW6DOvNbcnK0y
	 Uyu37PmGIECqAwrKgVSZPAMTVzkzpve+dY1znJ14KpTNRuo/EksNvcLNpMcAv7iD5f
	 tyflGPK4cVSqUqNFmFgUDtcf2Q9ew4xjZCXi++p2cO0G4NvFQoBZOuNCNCkC5RlRRa
	 nC7nnwEMAq+opsYBFj8cRSlok/omL4mPArBc18Pt9Tk2OP++gdmcdQZaaFTw3lsXfj
	 /h1yC4zl83o1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260831-ti-keystone-devctrl-v3-2-0614fceba0f1@gmail.com>
References: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
 <20260831-ti-keystone-devctrl-v3-2-0614fceba0f1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 18:07:00 +0000
Message-Id: <20260831180701.464411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Compilation Error: Unresolved phandles `&devctrl` and `&pllctrl` in=
 DT schema example.
--

commit 739cbb745f8880f754c15be8b7a4abc126a091dc
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

Convert the Texas Instruments Keystone Device State Control binding from
legacy text format to DT schema. During the conversion, bus properties
were added and child nodes were documented.

> diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.ya=
ml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> new file mode 100644
> index 0000000000000..dd73b62357cad
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
Does this reference to &devctrl cause a compilation error during
dt_binding_check? The devctrl label from the original text binding seems to
have been dropped from the parent device-state-control node above.

> +        };
> +
> +        reset-controller@328 {
> +            compatible =3D "ti,keystone-reset";
> +            reg =3D <0x328 0x10>;
> +            ti,syscon-pll =3D <&pllctrl 0xe4>;

[Severity: Low]
Will this reference to &pllctrl also trigger a build error? It looks like
the pllctrl label is completely missing from the example.

> +            ti,syscon-dev =3D <&devctrl 0x328>;
> +            ti,wdt-list =3D <0>;
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ti-keyston=
e-devctrl-v3-0-0614fceba0f1@gmail.com?part=3D2
