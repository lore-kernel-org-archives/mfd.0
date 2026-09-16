Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57293D9DD6;
	Wed, 16 Sep 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565036; cv=none; b=ZV0uPxoEwnxqz7RCl88phtv79v083r0GbPGwY+9QvuPc/IuaKdzw13ZJBXOWKzN6K2Mn/60HZ2OrsgCcMNS3ycJDQnxBijfS/maAQCCaAsinlIKL2Ldm9FKaStHbjh8EpaUo0Bhddxalt/y8y6liW6PIxqmzUVWZmao2+9JF6r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565036; c=relaxed/simple;
	bh=KKdUQ3pRp5Bws2/KjNWqsTQIgqRakrl2l3TW8OaOV+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fbynknXsS908pVY+dKzBXQcW0j3G37P/7kHQPw3MHU7hh4E4A/3mola02bnQ6tD+VyaE9eKek1PUMX5um4d2/sxILy3mklBU37GZ1ODtABQNONWo8fQKH2MB4JIGOdfuc8PMZZWGgQZZjUQAerXBBHIEsVfMi2IUzP8dKWgavrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLjbjRvP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLjbjRvP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA431F000FF;
	Wed, 16 Sep 2026 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789565031;
	bh=tOB4yDutDeKv4unLVnR8U7XJtQgqKPXuHsEO5mbZpwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KLjbjRvPhEwF4o8vz6M2V8JjH4l92ACgvpXBKZlDzRywAPDK/hyuCDm4F/U0ZBMgB
	 /sRd8mkX5Hp9PwF4/NZwZ8fdjV70RBSxNOmOh63tHS+RVraIYVHpvRlkVWhrLvivKP
	 iV4Dz1jm9r5Sk2rSIxF7hq4JJX3PgYlQeQTbV1pBDialI9vhuVZRmhAm8ri0B+uOrx
	 vXIef51FYRgY8jzYgKyfFiiOOL+EZzhMsFTdIJDWfS4xdImr0p0sMrTyzBdmyNWIuv
	 d/K4hLzm+jqgPR2d6v3h7OyTxdj3tgcbmpTDlOiQdytpU8qEvMNfT+ggY7NhrINRhl
	 +yMXrfMj4sBZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] regulator: dt-bindings:
 nvidia,tegra-regulators-coupling: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260916-ti-tps6586x-v2-2-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
 <20260916-ti-tps6586x-v2-2-f12cfdfb446c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 13:23:50 +0000
Message-Id: <20260916132350.DEA431F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] regulator: dt-bindings: merged headers and missing spaces in descri=
ption
--

commit c698037c054c9372f8a8e2ee437ab89f8f0611c7
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
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators=
-coupling.yaml
> @@ -0,0 +1,76 @@

[ ... ]

> +description:
> +  NVIDIA Tegra SoC's have a mandatory voltage-coupling between regulator=
s. Thus
> +  on Tegra20 there are 3 coupled regulators and on NVIDIA Tegra30 there =
are 2.
> +
> +  Tegra20 voltage coupling On Tegra20 SoC's - there are 3 coupled
> +  regulators:CORE, RTC and CPU. The CORE and RTC voltages shall be in a =
range
> +  of 170mV from each other and they both shall be higher than the CPU vo=
ltage
> +  by at least 120mV.
> +
> +  Tegra30 voltage coupling On Tegra30 SoC's - there are 2 coupled
> +  regulators:CORE and CPU. The CORE and CPU voltages shall be in a range=
 of

[Severity: Low]
Could the formatting in this description be adjusted to better reflect the=
=20
original text binding?

Currently, the old section headers like "Tegra20 voltage coupling" and=20
"Tegra30 voltage coupling" are merged directly into the sentences, creating=
=20
awkward phrasing like "Tegra20 voltage coupling On Tegra20 SoC's".=20

Additionally, is it possible to add a space after "regulators:" in both the=
=20
Tegra20 and Tegra30 paragraphs to improve readability?

> +  300mV from each other and CORE voltage shall be higher than the CPU by=
 N mV,
> +  where N depends on the CPU voltage.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-ti-tps6586=
x-v2-0-f12cfdfb446c@gmail.com?part=3D2
