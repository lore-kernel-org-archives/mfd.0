Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442799;
	b=OKpfuUyjfjTYOhpjgVWnmxsHrPZ/Xs4MPkURKtEB2EyPm48gRiGL2zSVsx5y9h6X8odY
	 S5YTSduP2vXPDl0TvsfcCmunqmn56qNlpGW/mYTewb4rNTNdQLxuDpCNoks63nOS2u55R
	 T9gow8KGhO5Kfaf9NB/qyl0L5NYrHBH8M4w47REq06BDbx3UwKxcdpexSfz14V946rMg/
	 rvjDumK7meR3KiORwXD10PeT390NlUDtqfkomtTQYvIKxWL5otfqxFeuGxQ4sjiQ0dPEA
	 VHpKmjJWSOzjtZqqU0J42btyzMuxnwIZAPP/JFvdMgrbJPXD9JOZBXnRfmR/40Z/Jiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442799;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JPC9UF56affPFNHhe1UsqnSmIneSTHafu2VK2hnsmCQ=;
	b=nJqAwdbivD+0et8Tfr5JVVuBLMdNAdPqq/o17RdY3hFCykdQPk3Kn7qPrR8JV7o144w3
	 FFWai8VuGYOfjvbwsAAZm7VxET5Dwg2moT8Fp5TcdIoNmE7NcuNUB3LTCmJMog+0Aydo4
	 vGVEAAzeOqPalt343fcaBMqy1b+mUGZ5QM57KJV4g752ANAfdsUsUWD6/+g8+Wi+o6YXs
	 caOgEWzdbpWk3b7Y4BtaIDz9MyrmpNBpymAiUog78UL0izuwoaRp4xVE+WoA6klteL6Aj
	 PXNN2736J5tj/+oVxmQPZvGIAp8fQWIhxpztfnOjdZIQGmL8LTlfSlbGyE9/Ym3hgUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BckSTyvu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4029F606A321;
	Thu, 12 Nov 2026 00:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BckSTyvu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8835F1F00A05;
	Thu, 12 Nov 2026 00:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442798;
	bh=JPC9UF56affPFNHhe1UsqnSmIneSTHafu2VK2hnsmCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BckSTyvuCBXECqo/fNZlShtLKfVwWsjm4FEi5e4FAbl6ZmnsntLJ6g38lLU1kWZJ9
	 LfjooJZjoWhKC0vcMOXfx7xfHzk1JQKwvAXzq+VbFwL/gFiLW+droshhHAMXl3PzcH
	 gOqkuvNJelqnuHzTIft9QTFJsyLu5HZpNW9k8TGfly/Wy/OQ2/8IabKmQrGQ2yXxdb
	 dx83yfCjMVDY6jnjvb2y49p7Nts5wjYoDs4L3eIFOylzN+OQ9WdvpX1f2UnH2VYDiF
	 SvMoqvxSkXSGNPiVEJxhc1UAT8B3topEBTPcUrNlBJM1IVItN8xQBnzMSM9mvvMSwY
	 boKhf7h+IiWDg==
Message-ID: <sashiko-outbox-209900@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/9] arm64: dts: marvell: Drop unused USB connector PHY
 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261111-dtbs-marvell-v1-3-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-3-938788aff3ae@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:19:58 +0000
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
- [High] arm64: dts: marvell: broken USB VBUS power after dropping
  phy-supply
--

commit 79bdb6a1206b7da32a160f289517e10fea0f4702
Author: Rob Herring (Arm) <robh@kernel.org>

arm64: dts: marvell: Drop unused USB connector PHY supplies

This commit removes the phy-supply properties from the usb-a-connector child
nodes of the Marvell COMPHY lane nodes across six Armada 3720, 7040, and 80=
40
device trees.

> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arc=
h/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> index bd00e7df87c67..1ef4689d5f18e 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
> @@ -284,7 +284,6 @@ &usb2 {
>  &comphy2 {
>  	connector {
>  		compatible =3D "usb-a-connector";
> -		phy-supply =3D <&exp_usb3_vbus>;
>  	};
>  };
> =20
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-7040-db.dts
> index 3add6506ff20e..f5a53fad66e67 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> @@ -224,7 +224,6 @@ &cp0_utmi {
>  &cp0_comphy1 {
>  	cp0_usbh0_con: connector {
>  		compatible =3D "usb-a-connector";
> -		phy-supply =3D <&cp0_reg_usb3_0_vbus>;
>  	};
>  };
> =20
> @@ -238,7 +237,6 @@ &cp0_usb3_0 {
>  &cp0_comphy4 {
>  	cp0_usbh1_con: connector {
>  		compatible =3D "usb-a-connector";
> -		phy-supply =3D <&cp0_reg_usb3_1_vbus>;
>  	};
>  };
> =20
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b=
/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> index 90ae93274a160..4efa2a1dbda7c 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
> @@ -599,7 +599,6 @@ flash@0 {
>  &cp1_comphy2 {
>  	cp1_usbh0_con: connector {
>  		compatible =3D "usb-a-connector";
> -		phy-supply =3D <&v_5v0_usb3_hst_vbus>;
>  	};
>  };
> =20
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-8040-db.dts
> index c7102f74d4d54..89e6f35f310dd 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> @@ -170,7 +170,6 @@ &cp0_usb3_0 {
>  &cp0_comphy4 {
>  	cp0_usbh1_con: connector {
>  		compatible =3D "usb-a-connector";
> -		phy-supply =3D <&cp0_reg_usb3_1_vbus>;
>  	};
>  };
> =20
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/ar=
m64/boot/dts/marvell/armada-8040-mcbin.dtsi
> index f2d278d171eb1..006293931c782 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> @@ -370,7 +370,6 @@ flash@0 {
>  &cp1_comphy2 {
>  	cp1_usbh0_con: connector {
>  		compatible =3D "usb-a-connector";
> -		phy-supply =3D <&v_5v0_usb3_hst_vbus>;
>  	};
>  };
> =20
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/ar=
ch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
> index def25d51c4bf9..06a861f83ad87 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
> @@ -491,7 +491,6 @@ &cp1_uart0 {
>  &cp1_comphy2 {
>  	cp1_usbh0_con: connector {
>  		compatible =3D "usb-a-connector";
> -		phy-supply =3D <&v_5v0_usb3_hst_vbus>;
>  	};
>  };

[Severity: High]
Does dropping phy-supply here without moving the supply to the parent COMPHY
lane node (or vbus-supply on the connector) leave the USB3 VBUS regulators
disabled on these boards?

When mvebu_comphy_probe() and mvebu_a3700_comphy_probe() create a PHY for
each lane node, phy_create() calls regulator_get_optional(&phy->dev, "phy").
In of_get_regulator(), if phy-supply is not present on the lane node itself,
it falls back to searching child nodes:

drivers/regulator/of_regulator.c:of_get_regulator() {
	...
	snprintf(prop_name, 64, "%s-supply", supply);
	regnode =3D of_parse_phandle(node, prop_name, 0);
	if (regnode)
		return regnode;

	regnode =3D of_get_child_regulator(dev->of_node, prop_name);
	if (regnode)
		return regnode;
	...
}

Because of_get_child_regulator() finds phy-supply in the connector child
node, phy_power_on() currently enables these VBUS regulators when the xHCI
roothub powers on its PHYs. Removing phy-supply without moving it to the
parent lane node leaves cp0_reg_usb3_0_vbus, cp0_reg_usb3_1_vbus, and
v_5v0_usb3_hst_vbus (which are GPIO-controlled regulators without
regulator-always-on) with no consumer, so 5V VBUS power to the USB3 host
ports is never turned on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-marve=
ll-v1-0-938788aff3ae@kernel.org?part=3D3
