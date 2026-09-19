Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CC730B521;
	Sat, 19 Sep 2026 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821319; cv=none; b=pb1XV404ExlqSK15zQQRZF6vZVDzinmsxr7M95biUlYDpf7UCuoJLpL7tEXerK2StU+CRIXJaEvWRSPQtzL4UCoHPlfsEjGYPQv1dKTiHLBfUn9Xk7LyWNqFrNIx8Fh9hdPN4cI9Ep7MbYa5S7+R3i52gtRe50V9IoiokicL/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821319; c=relaxed/simple;
	bh=3AYYNKVhH6BUyo4Kb5WH7HJR8Q7iXLKyN1HZHIMjpok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R4uFJ6M/izP/l4fA0lVC8/HIeMXo9FY3u116ExUBIIrmVClg7Nkl1gLL3xCg3aJmRUQCqO69hEwXRTO/c34v/+Cw6vmgMUePmWL+mxBrl9PpE++8oQMZXAqFdu4ckTyL8GM9Mry5kFOUk41QMjCMGqnp7zN4uNdJrrY8z/9jlb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mH/o1W1l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mH/o1W1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FD71F000FF;
	Sat, 19 Sep 2026 12:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789821318;
	bh=OxZWcPWseoPfJ/fVZOR0qpCjsfpdn8Frw5lgFcuFxRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mH/o1W1lqbFH0MCcdtUP7t/dFTjSO4KL753ZG4PNd12a7LauADf8XUvL9DOebdlIP
	 ZWOqaWMES4aej1EefncSjyhvMOJcIhjVZSmiMgZqKSuZ3srFP/NLWUPyO/MhV+gWTW
	 s+N3j/ASCHqTyNHYwX4WKTQW6Up0FiHccpkEjnvnMcwZ+dhYBtLNmhOOA5eK376tP1
	 Djv1J2UQnL9MZovABGVKdRZBNP+LGMU8jWrwu1ZOYvAdM6KcccvGyLvV15BT+50jRm
	 fQTw6SAe6ayQsH3C/XJC8wDQV0xumQgD5dFDbZSGA1PHdz1O4y+5h9h/bV9TLRuQds
	 Yd1mvgjKwMiIQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 1/3] dt-bindings: mfd: rk808: add board level
 power hold GPIOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260919122930.1418-2-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
 <20260919122930.1418-2-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 12:35:17 +0000
Message-Id: <20260919123517.C0FD71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: mfd: rk808: missing dependency constraint for power-ho=
ld-gpios
--

commit d0bbedcd800c9f7a3be4e2c8731dfd10b907acc4
Author: Yaozhong Li <yaozhonguwl@gmail.com>

dt-bindings: mfd: rk808: add board level power hold GPIOs

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written. Add
power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time.

> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/=
Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
> index 50dfffac8fbf5..d59f6baf502a2 100644
> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml

[ ... ]

> @@ -113,6 +131,9 @@ properties:
>          unevaluatedProperties: false
>      unevaluatedProperties: false
> =20
> +dependencies:
> +  power-hold-delay-ms: [ power-hold-gpios ]
> +

[Severity: Low]
Does this also need a dependency constraint enforcing that power-hold-gpios
requires system-power-controller?

The documentation states it is "Only meaningful together with
system-power-controller". Without the constraint, a device tree could define
power-hold-gpios without configuring the PMIC as the system-power-controller
(or using the legacy rockchip,system-power-controller property).

This misconfiguration would silently pass schema validation but fail at run=
time
because the driver ignores the GPIOs in that configuration.

>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919122930.1418=
-1-yaozhonguwl@gmail.com?part=3D1
