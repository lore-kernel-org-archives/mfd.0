Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442908;
	b=wvQZBZlOaKjxRA8uaCvvlLPMgw68loldcJcXBa1GdcF5bS/yqQVZ9QxIsgXNtbuLfm+d
	 06e9mREcsMhNio339zX4UVh3HlHdzjHr4kE6A6MP1W935zJMWhFbXPup/rnITk27RLcc1
	 B47zW+eIF/wU21OhXqLcIpE3ohQABJq5zfRt5ap1hyoox1hl8hrmhgZoGr7nFc10jz387
	 BOcJbQ6Urfsm4XdfPx8f0UOi3mTqeRAdgNsbzRAlQ4aMEp3vm0h0Tn+9JND8C+v4G6DL9
	 UR1JvFaB/j5nt0ZnAfu7Wj5djmQ4NsCVAI9LBz9M7itDNVNxCEtSDYE9Q+QrhGElNag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442908;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S2SW7DShCsRKcWHleEHx1HVU+FQMpnL3oJEuixRTzq4=;
	b=eEVxCB86Wqz0dXKfzdKIROwX2AQ6IP1OsnxniY0a6Bg4/wLTrs/tU0G9KfT/R2lQIrNo
	 hbq7ObgDouPsBI+OV8YcZeKRg8UiYg53PxSDFFUN4Hqu5MoZtBPNuY0I4nk3Pe8nwNk16
	 hdXDya+RTxFD54ZZpEB3OJIlwVRHi5O+Y0Wisx687WqrU2hrPOXWK9qkG0eSPp07LMElf
	 cw8kpseLCJpUDu1l/YIzFxRN0UDiGSffbYqNIuXHX1gKpQhK61dxI/QUFLiZ8SPRKRT5c
	 Q/y0Dp+rb0uo9mOX90rIRh34kkDRBJbNaWpKlcJvIv23VFlc+ZnB8pMIPW888AFuwUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpaqgxgb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A021606A31C;
	Thu, 12 Nov 2026 00:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jpaqgxgb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E473E1F00A0A;
	Thu, 12 Nov 2026 00:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442908;
	bh=S2SW7DShCsRKcWHleEHx1HVU+FQMpnL3oJEuixRTzq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jpaqgxgbRrMBo5GnF3WRV5An5xMAxmlNsQBNA6+2Kmx7xy5uLWG2prS9iC59cfCvL
	 cput/ecRPa95ZqgAKc60YYcPDcGrwlloKXdBS3XpwR9HSK3rADcuakUA2tYAR3OtMD
	 zvptfBrlhbIH3aLi/lZSphkgCIxovg8v2rj1ZFvApdLLrEWkL3jpUKmazOIgRrcno/
	 h72Nxk79z3HZSVpWIEns3VJWk1JcV5QaSL8AaNyc9pajE9ieiLhqFa3TaF5YUJdtbq
	 ynrUYSa2gAgkk9Sw/YDVo8yQv1Km7aNFvtsGEknDrBdTSULKraliuraMoVjEORe9Sr
	 KgeFjcrjnGsIw==
Message-ID: <sashiko-outbox-209905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/9] arm64: dts: marvell: Add AP806/CP110 syscon
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261111-dtbs-marvell-v1-2-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-2-938788aff3ae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:21:47 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: marvell: ap806-system-controller triggers legacy
  clk probe failure
--

commit d5587b2920b1facc3deb1cff76751746477ff106
Author: Rob Herring (Arm) <robh@kernel.org>

arm64: dts: marvell: Add AP806/CP110 syscon compatibles

This commit adds "marvell,ap806-system-controller" and
"marvell,cp110-system-controller" compatibles to the AP806 and CP110
system-controller syscon nodes.

> diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/b=
oot/dts/marvell/armada-ap80x.dtsi
> index 40e1469829212..0da13b2cd1fc0 100644
> --- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
> @@ -267,7 +267,8 @@ ap_sdhci0: mmc@6e0000 {
>  			};
> =20
>  			ap_syscon0: system-controller@6f4000 {
> -				compatible =3D "syscon", "simple-mfd";
> +				compatible =3D "marvell,ap806-system-controller",
> +					     "syscon", "simple-mfd";
>  				reg =3D <0x6f4000 0x2000>;
> =20
>  				ap_pinctrl: pinctrl {
> @@ -293,7 +294,8 @@ ap_gpio: gpio@1040 {
>  			};
> =20
>  			ap_syscon1: system-controller@6f8000 {
> -				compatible =3D "syscon", "simple-mfd";
> +				compatible =3D "marvell,ap806-system-controller",
> +					     "syscon", "simple-mfd";
>  				reg =3D <0x6f8000 0x1000>;
>  				#address-cells =3D <1>;
>  				#size-cells =3D <1>;

[Severity: Medium]
Does adding "marvell,ap806-system-controller" to ap_syscon0 and ap_syscon1
cause both nodes to bind to ap806_syscon_legacy_driver and fail probe?

drivers/clk/mvebu/ap806-system-controller.c matches
"marvell,ap806-system-controller" for the deprecated flat-node clock
binding:

drivers/clk/mvebu/ap806-system-controller.c:ap806_syscon_legacy_probe() {
	dev_warn(&pdev->dev, FW_WARN "Using legacy device tree binding\n");
	dev_warn(&pdev->dev, FW_WARN "Update your device tree:\n");
	dev_warn(&pdev->dev, FW_WARN
		 "This binding won't be supported in future kernel\n");

	return ap806_syscon_common_probe(pdev, pdev->dev.of_node);
}

ap806_syscon_common_probe() then reads AP806_SAR_REG (offset 0x400) from
each syscon regmap (including System Controller 1 on ap_syscon1) and
checks pdev->dev.of_node against "marvell,ap806-clock" and
"marvell,ap807-clock".  Because pdev->dev.of_node is the parent
system-controller node rather than the clock child node, both devices emit
false FW_WARN messages, log "compatible not supported", and fail probe
with -EINVAL on every boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-marve=
ll-v1-0-938788aff3ae@kernel.org?part=3D2
