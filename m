Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39BD495043;
	Fri, 18 Sep 2026 21:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765817; cv=none; b=plQWhA+uQ5W3v6LJKPRFiW5z6cz9il/9vyN4ZVRSBZDpIyHyWLc6+FsfP3tjdwKpBXmVgLKumaUB5IiiuNQbCYCNVldjlhaSDhI7+g0Ker+szZOkFz9FVjH3ei6hvHpSXjHMeNT4KwUOuisGT9xgJILGQabX9CG1yv1K8N48CZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765817; c=relaxed/simple;
	bh=IJ8TSt9aZjpOjuX3SllLvuqPGPeMikG3Da6T2wXWetU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CTEPlMq/QNa9YIC6TYaRCBT3/mmonVLn/Almt3e/yMakbFuCd2A2xLvj1AuWX2a561U2q+PmzLTR2clRh+VrgOQhR5lqTNHgcSiGitjdAs6TGvulOlxVRScJFzbuPhp345N/90K/9gzQ7Ln5XYO6U5iy1f6HSmm8Q1sEg/iqNLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpjlEa64; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpjlEa64"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76351F000FF;
	Fri, 18 Sep 2026 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789765816;
	bh=qmeKDgA3jktjoenczMzyOvoKv98sVkVwSn+8uqt6NCc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NpjlEa64ziwklCFzab0HqKG/NIqeSEanCi7zk4Rorip78oSGFm+Z/2DUsg4swJAYF
	 yuQWieMPWs9rwuByJhey61gbdL4eAnoGftzUG7VpDFzlBLiWpl4g1kje/50ins7k/e
	 LSout2uoU8HESSE+2AxdccQ+y1aQn+CvrVNHuVVjTxQ4u2d/SzzhECe3sqWnjtsI2A
	 M4SmQ5bpWhdXqUO/A+qXM3ls3Rk7UBWCB2npgF/cnlsA3tpb6NY2+iGZkqEaJshHcB
	 T9LimNc7YikcF2V0QjQisd/zkE0cxBnAKkj2czfyR+K2IsDhXuu0WHcgZwYAKvbOwL
	 cBAEhjMIBhqDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] regulator: dt-bindings: ti,tps6586x: Convert to
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260919-ti-tps6586x-v3-4-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
 <20260919-ti-tps6586x-v3-4-63dd240f4684@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 21:10:15 +0000
Message-Id: <20260918211015.D76351F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: regulator: ti,tps6586x: dt_binding_check failure
--

commit 73abdb102237b2babb6d5bfccbbceba8f14006bb
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

regulator: dt-bindings: ti,tps6586x: Convert to DT schema

Convert Texas Instruments tps6586x regulator binding from text to DT
schema. Reference to nvidia,tegra-regulators-coupling in child regulator
nodes.

> diff --git a/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml=
 b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
> new file mode 100644
> index 0000000000000..1f7c7b35066f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
> @@ -0,0 +1,196 @@
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

[Severity: Low]
These properties reference phandle labels (&vdd_5v0_sys, &sys_reg, &sm2_reg)
that are not defined anywhere in the example snippet.

dtc throws a fatal 'Reference to non-existent node or label' error for
unresolved phandles during compilation.

Does this regression cause the example to fail make dt_binding_check?

> +
> +          regulators {
> +              sys {
> +                  regulator-name =3D "vdd_sys";
> +                  regulator-boot-on;
> +                  regulator-always-on;
> +              };
> +
> +              sm0 {
> +                  regulator-min-microvolt =3D < 725000>;
> +                  regulator-max-microvolt =3D <1500000>;
> +                  regulator-boot-on;
> +                  regulator-always-on;
> +              };
> +
> +              sm1 {
> +                  regulator-min-microvolt =3D < 725000>;
> +                  regulator-max-microvolt =3D <1500000>;
> +                  regulator-boot-on;
> +                  regulator-always-on;
> +              };
> +
> +              sm2 {
> +                  regulator-min-microvolt =3D <3000000>;

[Severity: Low]
The sys and sm2 child regulator nodes are missing the sys_reg: and sm2_reg:
labels that were present in the original text binding and are required to
resolve the internal phandle references.

Are these labels missing here?

> +                  regulator-max-microvolt =3D <4550000>;
> +                  regulator-boot-on;
> +                  regulator-always-on;
> +              };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-ti-tps6586=
x-v3-0-63dd240f4684@gmail.com?part=3D4
