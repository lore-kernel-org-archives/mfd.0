Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751BA26461F;
	Wed, 16 Sep 2026 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564918; cv=none; b=RcTJEXuyda5W5Gg18kCzNXsDWWLsDzWWCHluCngymq4TIzFF+MPNi9ueHikvqEX9zHyw6GaRtR46Mt/2tsVwwPPG3+X4L4JiyveT6gp+hKuPiXO9CEg21EqUli7Y3+gt7zzKDbyEklnxqSFt0TIQ3Nly7OOC3ofIvlloMC7MjrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564918; c=relaxed/simple;
	bh=i211Lfp2Rwxz5CVhw+D7Drz6OKalbaGG45BUi3/sjlw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uyqsuj3bi3TNIr5jjePRblGRTYIaT0zxgX8WfNQTSmSaq2tKZCCiuRw+eQ5M6hzMTuAcZKwopyqvumY9HZR2P8+1b+DiMrVx031jxeMRDS1a2ktbXU64R34sp1kXKFgYN8eHJBJud8hrnt8NmJ8qERqKbBIDCxSB0X91TBVHlLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqcLAhia; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqcLAhia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5ED1F00893;
	Wed, 16 Sep 2026 13:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564915;
	bh=rsirf8XjbNy1n5L5dmB0tJYIapMS9w0JyL/0gc8GTzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OqcLAhiatty/v1Bo96Q6Ssmo9jyuWUjjm6UTSkXpMRNyUW9tGHQZoMKsZ4BdXoSKY
	 sNHkRdhKH2nLUMaJg+KS4Knyt2YoLhbah05SZasvn+GQ6VvVq3X/NqyHsASjUq4nCs
	 OcFNII9v2et6Lz9segb2HGkr12m7CkWR6sjMRGgfg1e0v8ht/E0Zs+gsyWETfJEe0C
	 NHnZ6QNfUUhtYpq/KtJU+UpbMmYkqEHfSlyv0tDZRK3GkkXwjWF4lTLGMdioHD75H2
	 X0yFpXHEOn1PQudiTTQJAfcHN8Er1XCsKGmPcUuDsoz79ZRbvem/GhQt3Ih9ysHM7l
	 /3X8WPV78asww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] regulator: dt-bindings: ti,tps6586x: Convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260916-ti-tps6586x-v2-4-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
 <20260916-ti-tps6586x-v2-4-f12cfdfb446c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 13:21:54 +0000
Message-Id: <20260916132154.DC5ED1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing labels for phandle references in example
--

commit 2ba7135b970f955684609cafbc16f7eead707402
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

regulator: dt-bindings: ti,tps6586x: Convert to DT schema

Convert Texas Instruments tps6586x regulator binding from text to DT schema
and add tegra-regulators-coupling reference in child regulator nodes.

> diff --git a/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml=
 b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
> new file mode 100644
> index 0000000000000..1f7c7b35066f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml

[ ... ]

> +          sys-supply =3D <&vdd_5v0_sys>;
> +          vin-sm0-supply =3D <&sys_reg>;
> +          vin-sm1-supply =3D <&sys_reg>;
> +          vin-sm2-supply =3D <&sys_reg>;
> +          vinldo01-supply =3D <&sm2_reg>;
> +          vinldo23-supply =3D <&sm2_reg>;
> +          vinldo4-supply =3D <&sm2_reg>;
> +          vinldo678-supply =3D <&sm2_reg>;
> +          vinldo9-supply =3D <&sm2_reg>;
> +
> +          regulators {
> +              sys {

[Severity: Low]
Does this example have missing labels for the phandle references?

The properties above reference &sys_reg and &sm2_reg, but the labels were
removed from the sys and sm2 nodes during the text to YAML conversion. Will
this leave the example structurally incomplete when compiled?

> +                  regulator-name =3D "vdd_sys";
> +                  regulator-boot-on;
> +                  regulator-always-on;
> +              };

[ ... ]

> +              sm2 {

[Severity: Low]
Could the sm2_reg label be restored here?

The earlier properties like vinldo01-supply expect it to exist to complete
the phandle reference.

> +                  regulator-min-microvolt =3D <3000000>;
> +                  regulator-max-microvolt =3D <4550000>;
> +                  regulator-boot-on;
> +                  regulator-always-on;
> +              };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-ti-tps6586=
x-v2-0-f12cfdfb446c@gmail.com?part=3D4
