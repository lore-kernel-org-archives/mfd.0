Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794754842;
	b=QzsvN6VGjT8Qwqe/yK+F5h+GcoGTA9FF1n0WjBQhHoKnyElDyYLJyxtNppOPFKYwozCx
	 t6rYY4E0Vc3gZgJFwTyPAd1BfbDmVeHxiUZHMr+EtlyY39Y9APiNrX1HtjTI6hdgVhc5J
	 W+czBBtnrhl5IJG0OdSlDFEyZlEwTfqLw5sgP30/VMI/UxUvu6W5nBb9LbDrBxPKCMmU9
	 uiFB7vlwW7twR1pCwgK/knaxjMsBdAeK+JwFwBWx1+1R0TbICRJw2zvwYfb12A7FP2bBF
	 8Nd8vPiwsxpWEX+QdH6ju+S6GBIaRoABdmtYZhh2S5+NrFft+Fw0kb+aNPvbmSkbdQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754842;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i0JHjPU+ucbAj1Ard3zLUa6YdAeUDkILidk97Xo8LUY=;
	b=dyTPeCvwCRDIhA5xeMVut72ML0rPpo9ZGj9+rBG1PXqjLpuvGYZm8UwlZHzAZ/pqnG2Z
	 111iMsJQYgVHplFIRn1IsecVjlmz+fyD76SEqkp6L29iV1T8JbSVbIOhrkcBr+GG2ZjUC
	 VffiI+m6uqF5ll1MT+TDihfjb5fLrcPWhKd5qyPUtyfzwZ1byE384aV5n6NLynsu0ENQx
	 U0MFWCMlmKIWHUVgOQe8Ty031CyL14xlBFCG9koySNo6X0o8Rb1NvqOahDK1ucEBfBsGB
	 Frq89QRCSZii5tOXKvMFDvy8zBsLaoXMAWOJwp2Kl4hYzb6BCqoyMM7S5HwRgaAQcjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m3fvSGVP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82DC606A31F
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m3fvSGVP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185361F000C4;
	Sun, 15 Nov 2026 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794754842;
	bh=i0JHjPU+ucbAj1Ard3zLUa6YdAeUDkILidk97Xo8LUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m3fvSGVP/JieFMBYWPobgj8n8AX28swucuLM2c3l7enXJ6/pWUTBR0ZRSOKXzAxl8
	 PKJm/bFSB4er3/fb68tiA9yVLDi4lGOFiHS8/o+nHxgxD/6PQoL50cFHAAMQMUdBeO
	 Nzo9Gvs2LOL7JFQ0D967RyiDpbV5E7XyHgx5z7LhHzKkyphh8EmzUHJxR4Zh874n4I
	 nHmPdmVfPjFuwmYCkewDiyXNovCLvZYZj+rGZkoz4RVLWAVRi6gCzKqYVEO9FElAxc
	 WlJINSC8PsVKVTyHSumMNIiMx7oNB5TvvytHRXEInOqa6PN/+/QFE3fF0nlAJN+VVi
	 zTrId689squgA==
Message-ID: <sashiko-outbox-215599@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd/regulator: db8500-prcmu: Remove EPOD regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261115-ux500-epod-regulator-removal-v1-1-f550c95dfa9c@kernel.org>
References: <20261115-ux500-epod-regulator-removal-v1-1-f550c95dfa9c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 15:00:41 +0000
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
- [High] mfd: db8500-prcmu: premature regulator removal breaks consumer
  probe
--

commit cae2fc77226e666a72e1600ee70a3edc055eb51c
Author: Linus Walleij <linusw@kernel.org>

mfd/regulator: db8500-prcmu: Remove EPOD regulators

This commit removes the DB8500 PRCMU regulator driver, its Kconfig and
Makefile entries, and the db8500-prcmu-regulators MFD cell.

> diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
> index 6672c55f2ebcc..687bbf79559e8 100644
> --- a/drivers/mfd/db8500-prcmu.c
> +++ b/drivers/mfd/db8500-prcmu.c

[ ... ]

> -static const struct mfd_cell common_prcmu_devs[] =3D {
>  	MFD_CELL_NAME("db8500_wdt"),
>  	MFD_CELL_NAME("db8500-cpuidle"),
>  };
> =20
>  static const struct mfd_cell db8500_prcmu_devs[] =3D {
> -	MFD_CELL_OF("db8500-prcmu-regulators", NULL,
> -		    &db8500_regulators, sizeof(db8500_regulators), 0,
> -		    "stericsson,db8500-prcmu-regulator"),
>  	MFD_CELL_OF("db8500-thermal",
>  		    NULL, NULL, 0, 0, "stericsson,db8500-thermal"),
>  };

[Severity: High]
Does removing the db8500-prcmu-regulators MFD cell and regulator driver
cause a probe regression for in-tree DB8500 consumers that have not been
converted to power domains yet?

arch/arm/boot/dts/st/ste-dbx5x0.dtsi still defines the
db8500-prcmu-regulators node and wires its child regulators to active
peripherals:

arch/arm/boot/dts/st/ste-dbx5x0.dtsi {
    ...
		gpu@a0300000 {
			compatible =3D "stericsson,db8500-mali", "arm,mali-400";
    ...
			mali-supply =3D <&db8500_sga_reg>;
			power-domains =3D <&pm_domains DOMAIN_VAPE>;
		};

		mcde@a0350000 {
			compatible =3D "ste,mcde";
			reg =3D <0xa0350000 0x1000>;
			interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
			epod-supply =3D <&db8500_b2r2_mcde_reg>;
    ...
}

msp0..msp3 also still specify v-ape-supply =3D <&db8500_vape_reg>.  Because
those regulator DT nodes remain present while no driver binds to
db8500-prcmu-regulators, of_regulator_dev_lookup() finds the DT node, sees
no registered regulator device, and returns -EPROBE_DEFER permanently
without falling back to a dummy regulator.

As a result, mcde_probe() (which still uses devm_regulator_get(dev, "epod")
rather than runtime PM / genpd to control EPOD_ID_B2R2_MCDE),
ux500_msp_drv_probe(), and lima_regulator_init() all fail to probe with
-EPROBE_DEFER, and d40_probe() loses the lcla_esram supply mapping that was
provided by db8500_esram34_consumers[].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-ux500-epod=
-regulator-removal-v1-1-f550c95dfa9c@kernel.org?part=3D1
