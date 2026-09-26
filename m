Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484AD37475D;
	Sat, 26 Sep 2026 18:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447123; cv=none; b=QdIVKEA0uIZV+Xn69rLTrXy7ahmXa98RcPyPVarJDnuL1+DO/Y+7WYCxjmERLd8xq3Yhsrp+71pXYa/+jL010wgo29cMkkRDerOdQklVictxbBDor/i/6wwsSDl//1+RDKGbQMqDhZuA7jdbqVfmz1yvkf85dJmH+8QQ3lzMWZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447123; c=relaxed/simple;
	bh=ngQG8R5tsSUQzHuttJFkijrVvuQsZ4JZwj8mxd82QYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KsJBlvW9nnn4I8yV0lfBWViGny0Q2N6dT9+RYioQ6XnMO82N56khdlllB3kdBNRsEJi8BDhio29u03ZRSjqx0ozH5oxbbKLInXtcEjXRtYro1jvH1SSiCDk+PCg4FKfrXYGg7Z6tYh6VJDIVRTdgkecVumSXw6mHSeC8MiY9KlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+BrDjzG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+BrDjzG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB19E1F00893;
	Sat, 26 Sep 2026 18:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790447122;
	bh=y91/M6+S30XB5QBhXkt5qkeu3ScNmE1JmweV6XFfN1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j+BrDjzGg1GkTChscwERTMwJ2ofp0AND4KzheGTI8cw63GDa22LhVVrZLwroQY4Bw
	 LqKV2Leo/EYEFE+mBtOZr2RJcTcJG/V3tHWK7GOZw6tDGNk2Fr0RymWxGfTT3sLlHm
	 3Y4NiCzJUGoPA3/z1v0X9YLYsEmebiQe6NesRnLYDOF0OMOxp7njH05055VXdPVMbO
	 4J+lof2NOTp1JMcWwvSp1UekcdMbGiNKDWOlJ3UZEtDe6L9LuqmPHtogYsUtwrGsMH
	 z59b+cnyJDr6okiNglVx+9Y/yiskMiKQu5hiP3iibw7bKVA83OofRToG3uCrwaiAK3
	 tuY9Ui2oIHWIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v23 1/9] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260925182435.21207-2-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 18:25:21 +0000
Message-Id: <20260926182521.CB19E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: unresolved phandles in example will cause dt_binding_c=
heck to fail
--

commit 149759f83399f8efe1a862e7d0f5637ed4300bbc
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch

This commit introduces a new YAML device tree binding to document support f=
or=20
the Airoha AN8855 5-port Gigabit Switch. It describes the exposed internal=
=20
PHYs on the MDIO bus.

> diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-swit=
ch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.ya=
ml
> new file mode 100644
> index 0000000000000..5ad9b9e139831
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
[ ... ]
> +examples:
> +  - |
> +    ethernet-switch {
> +        compatible =3D "airoha,an8855-switch";
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +                label =3D "lan1";
> +                phy-mode =3D "internal";
> +                phy-handle =3D <&internal_phy1>;

[Severity: Low]
Will this example pass make dt_binding_check? The device tree compiler stri=
ctly
checks for label existence, and it looks like the internal_phy1 label (along
with the other phy labels) is not defined within this example block. This
might cause dtc to report a fatal "Reference to non-existent node or label"
error during the validation build.

> +            };
[ ... ]
> +            port@4 {
> +                reg =3D <4>;
> +                label =3D "wan";
> +                phy-mode =3D "internal";
> +                phy-handle =3D <&internal_phy5>;
> +            };
> +
> +            port@5 {
> +                reg =3D <5>;
> +                label =3D "cpu";
> +                ethernet =3D <&gmac0>;

[Severity: Low]
Similar to the phy-handle references, is the gmac0 label defined in this
example? Leaving this undefined could also trigger a reference compilation
error when the example is extracted and built.

> +                phy-mode =3D "2500base-x";
> +
> +                fixed-link {
> +                    speed =3D <2500>;
> +                    full-duplex;
> +                    pause;
> +                };
> +            };
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925182435.2120=
7-1-ansuelsmth@gmail.com?part=3D1
