Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794429144;
	b=y1EeB26g2GUbNnXnQGqeW16QaOn+0tpaLuFCDpw51KuESP4aBFI9jtkxg153eEGe6mFR
	 Of05q28XWafGG4e9iA4jGwKJGktFby0KFnDL66Wu9WDM5YKdQO0o0fLa6ZGCc35mKRpyY
	 aAD4IvYmB6i9ptSsBnmJz94JKSBL7wt8IENvxfTfSZhkiva851LYYkJwp20fCD+0WIKmW
	 kGMnec/v9COnjhSKxUFaLuV+4ls5Tdz+KeVR32AqQDJiUjmNCNblmzFY+8XteezZgkggj
	 KTlOpslY7ORbjuc5KF10iyTYaAQiRJhftiDG+it3A6zHHlj1mtNoV0PJODHjUbyHeEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794429144;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1UAUW0BJXze7Lcn557Me7iFrvKj0hHN+9lrL8f4li+E=;
	b=cni6gStKHfGCf40P+iCqJ9ERcARBhqcA5w4JBClA4XW19fmszLlguqfO6Od2Dgf8SG4b
	 4I6O7mRBUVa/T+c2dnruEFnDQ3x/JrYcJ5Rq4GKwwUQ8Ktg5BKclSSyqxhoZWb5PRZ5lC
	 qx3RJAkh+G7/1gbmA+BogFDItXawY0YjXmhIoejksHoz7mmSp7/4GZf7ttlFw6O1owI7o
	 +S8+jYAiCgbgi/FkPNmr4mZEFyfOOCw3rLAVEKGGiI4bep0mQvdcvBgydvl5GN8Vp9woF
	 XiXTxnJlKZepGPRF9rv+k8tYCF820JaU0xIIf5DZ9Qz8gkGTrfEy7C4FEjnPLQfm/XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVsrsxV6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69DE60A3809;
	Wed, 11 Nov 2026 20:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVsrsxV6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9DA1F00A05;
	Wed, 11 Nov 2026 20:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794429144;
	bh=1UAUW0BJXze7Lcn557Me7iFrvKj0hHN+9lrL8f4li+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GVsrsxV6kAsUZTOD7QjM9kpoHabFQocdm67knNeiiHnGSA8EI0QzIMK8PHmWwZfpZ
	 EltiSWa+3J8L8ouH+DrT/n7iismZSTBf60IivVwgAsror9XAHHRbCwq9Yh0g1kKxA1
	 isAFVdKgCck+L4ooa4BYfO94k1NypJaYPcE0vX/KI2LnzI6AzwL6KJBxGhCpB8abwH
	 oHRYa4Bqt5p5PNRnZ5eMxjM4b+bvScK0hdKEO/6gDR5Q3w2b4UMGqYY10UWk4H2aIl
	 JoS9gfN4Etx/5hNjSdG7APnTkM9V+PfxV3M62PegP7FgvpEPS3KKu+z/rMHyMammxN
	 Rbl/kDJckKipQ==
Message-ID: <sashiko-outbox-209668@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/12] arm64: dts: hisilicon: Remove obsolete HiKey970
 PMIC GPIO property
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-11-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-11-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:32:23 +0000
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
- [Medium] arm64: dts: hisilicon: pmic@0 drops gpios without adding
  interrupts
--

commit 7f4bb8b7b2bebe372f2351a8615fe76fad7f61e6
Author: Rob Herring (Arm) <robh@kernel.org>

arm64: dts: hisilicon: Remove obsolete HiKey970 PMIC GPIO property

This commit removes the gpios property from the pmic@0 node in the HiKey970
PMIC device tree.

> diff --git a/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi b/arch/arm6=
4/boot/dts/hisilicon/hikey970-pmic.dtsi
> index 299c4ab630e85..12f1f972ffde6 100644
> --- a/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
> @@ -21,7 +21,6 @@ pmic: pmic@0 {
> =20
>  			#interrupt-cells =3D <2>;
>  			interrupt-controller;
> -			gpios =3D <&gpio28 0 0>;

[Severity: Medium]
Should this replace gpios with interrupt-parent =3D <&gpio28>; and
interrupts =3D <0 0>; instead of just dropping it?

Neither hikey970-pmic.dtsi nor hi3670-hikey970.dts defines interrupt-parent
or interrupts on pmic@0, so removing gpios without adding them drops the
GPIO28 line 0 interrupt connection altogether and leaves
hi6421v600_irq_probe() failing in platform_get_irq() with -ENXIO, matching
how f81d99218257 ("staging: hi6421-spmi-pmic: rename GPIO IRQ OF node")
updated Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.ya=
ml.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D11
