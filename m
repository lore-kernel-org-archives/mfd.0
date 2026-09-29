Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397EB35C19B;
	Tue, 29 Sep 2026 19:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711551; cv=none; b=YPUwm4+K7Gi+vmGW4AKNYY81SAaBTTWcrQ4SRbDJDDP5QaHETYYi64AwIF+c992eWNMHqzMgheWO8QeHTOMKDGTWvVaUnpm5PFT65f3y3uP3LtIWC7MfHtGv7GFEDq3fv9Ng5dukTg9oyllaO1kq8IXrqaeH3qDqd0DeUiOM/h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711551; c=relaxed/simple;
	bh=Q5Mq5Fcs44yIgom9x1FynQGRnlSiHjK11IFPyaqomj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cdmR1wUTaU3vL2i6JfEMb7qdtGkXleh4UYjldSaA96gyTTqUM+aztyexYGSyr2sQKHcoY4BFEmY/X7Om6Ofuus6yUyLk4Pr0NglCn0X0Vmcs5GCTNEzIMVd2NezoE1/ehxiS3pJJuOTBx3/QdSf3joEwqIoSagg9M36dpTKSO+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lslxd4hh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lslxd4hh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A981F000FF;
	Tue, 29 Sep 2026 19:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711549;
	bh=+ib7/7QaSwObiq2y771E9V5KCHfFCTzvCU8/1XZFAP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lslxd4hhpR0iR0/gXcM4i6YHZ0DWWmkzOjvQV0ia27s+BRs53qtRJlnuuBUwax3Vg
	 8m5m/aCtvidDJvUnmtVR+s1E8Y6IJKg+DR6T2zzEIl2HnxMydwESXhUu4dH0RROko+
	 94FgLVOD/7AMGwkJ/faqSh67DnMzI4Nxn0A+tRjSI1amWFEA3wUCexGbIgy012ESU4
	 7vFg37yAYTutkJawD5mD019lMpnqFBphvYzBxiBNfw1vpvc0826Dza+FjlHtfvnGra
	 v8J9x4k8+IgYrn3e2EerXr1yS/PeV+oleVpi4VbMd2tsBfAKcUeQORqyS/kF/SvESy
	 +n1r62Jkoza2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v24 01/10] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260928194511.41878-2-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
 <20260928194511.41878-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:52:28 +0000
Message-Id: <20260929195229.80A981F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: unresolved phandles in example break dt_binding_check
--

commit 940a9845cb44d5578faba1549988a5be5ce97b7a
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch

This commit documents the device tree bindings for the Airoha AN8855 5-port
Gigabit Switch. It provides an example configuration demonstrating how the
switch ports map to internal PHYs.

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
Will this examples block fail dt_binding_check compilation?

The examples block in
Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
uses node references like &internal_phy1 through &internal_phy5 for the
phy-handle properties. However, these node labels are never defined anywhere
within the example snippet.

When make dt_binding_check runs, dtc extracts the examples section into
a standalone DTS file and compiles it. Won't these undefined references cau=
se
a fatal reference error during compilation?

> +            };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928194511.4187=
8-1-ansuelsmth@gmail.com?part=3D1
