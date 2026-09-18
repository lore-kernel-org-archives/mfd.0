Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD5749365C;
	Fri, 18 Sep 2026 21:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765833; cv=none; b=JePjOGTi5AzsGWL94OHg0GqEnVQFRCTPqRaOxbtXy9wbHsklnWy6GzKh95Vgj4IvLzs5iCD9p9xCH8HdXBOPSniV1SPBPgf7bJomiK9kYSXGbzSJmm28AnegTDplpzUgSkjaY+WGiriU/1uhKfj1ok+O7XeuDZ1n6RqucFk/QVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765833; c=relaxed/simple;
	bh=JS+hhAzzWCaEBfCGeWet3WsN7+hOjXJru9zTCBdG8v8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k1ERh9bzHNPk0tulbUUXL6S9RbjxtYJLf+ZlufmiPrLMOEuL/ULDGB/4z85tT8KfyclWm9vjZ6gpAy9fEFId8I0v1XxeCbt3SBX7WkmUNJ4mlxvAEPPNHl+vxlvFv/9JGRlmUOSzyK1yCTzXsXVe1UlQookbDLkVXh0LVlqUs5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/8+3Rim; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/8+3Rim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5711F000FF;
	Fri, 18 Sep 2026 21:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789765832;
	bh=v15JxROMxSMF2uUIy+UKJbrV0+JUbVoOUlzNEuejMQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B/8+3RimWvb8f1N2WpmMA1V2k3gRoQMUG/UmnV95OkwRJp+VtLeBCGcIkneEaC4Jl
	 C0LSvevg1alwbHjxj3aK3fuZ2kstant4QJGeuEWhJJcvk+G1mC7CRk2fZ8ADCik6Xd
	 UWejPzVClYjJhe6FvClIGy6AW9psPEpKTImsymS8ljjPSKNofhifCN0gaDhUCvrsEY
	 /7QxX/U6RZI/yFp+qqZPx03jZkrrMnLQ7GZ7J5VxR4nqNsL6gscioy8qfan4ermc1p
	 i5EVtFlCZvfRS8UMUoZguDH4ClQ4/X50z7V1EepRgQuJGtyJ4d2Xu0OK2bnpKQkBta
	 VRlll+ISXKKXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260919-ti-tps6586x-v3-2-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
 <20260919-ti-tps6586x-v3-2-63dd240f4684@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 21:10:31 +0000
Message-Id: <20260918211031.BC5711F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: example properties are bypassed during schema validati=
on
--

commit 6fc294a8a0e1ff8d45fed563be8b2e544b6e1cc3
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT sch=
ema
   =20
Convert NVIDIA Tegra Regulators Coupling from legacy text to DT schema.
Set additionalProperties true as this is shared schema.

> diff --git a/Documentation/devicetree/bindings/regulator/nvidia,tegra-reg=
ulators-coupling.yaml b/Documentation/devicetree/bindings/regulator/nvidia,=
tegra-regulators-coupling.yaml
> new file mode 100644
> index 0000000000000..aae951cdce8ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators=
-coupling.yaml
[ ... ]
> +examples:
> +  - |
> +    pmic {
> +        regulators {

[Severity: Low]
Since the example encapsulates the regulator nodes inside 'pmic' and
'regulators' parent nodes, and the schema lacks a selection mechanism for t=
hese
subnodes while allowing 'additionalProperties: true', will the validation t=
ool
only check the root 'pmic' node?

This causes the actual 'nvidia,tegra-*-regulator' properties defined in
the subnodes to be ignored by dt_binding_check. Wrapping the nodes prevents
the root-level schema from validating the properties within the specific
regulator nodes.

> +            core_vdd_reg: core {
> +                regulator-name =3D "vdd_core";
> +                regulator-min-microvolt =3D <950000>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-ti-tps6586=
x-v3-0-63dd240f4684@gmail.com?part=3D2
