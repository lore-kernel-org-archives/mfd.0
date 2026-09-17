Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12C63EEADE;
	Thu, 17 Sep 2026 23:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686411; cv=none; b=Dm0XL3MoJ3UokKQ8lklIkxzXX/vjYGVFJqvM2I9FaoXOpudrs71PPdMHudKHhU50AacOL7x+5A/ZNskttbh7co3IpkFKTs5BsSCAppJEdFWjrdh1lHoNcgnSCHL41rOaSd8pFkR+fOSJiFpzjvJwTo/7LhxAVLlLyGwFhu8puKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686411; c=relaxed/simple;
	bh=vA1IzEUjUivjgKBXcJXB6ExeLhvlovxAWV2R33cvRHw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n1FLKd2/+kIcrqZaRUCv0bP+aewduWQUz5pToOGC/zhhhzC7z7ohztITYOAl3lpmqWEQ9dTHQWElYbl+I9xl6uUziN4ZTQpFpnCpGkmuKoP7GZPndXfuvoIOIHLfUXUxiVJrwpB+ccH/RyNSRbJJZdgmnyC9+cI2FVnzE3QXcR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DA94zwtr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DA94zwtr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDD81F000FF;
	Thu, 17 Sep 2026 23:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686407;
	bh=1PVsjou8loSS0KAG+MqdBz/2YRGNJ5cIq8kvNlqbs2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DA94zwtrARbzOEEcJOry/L+Ir5dj1Oc/my6rurhXe7y/pOpPDfq81fjQchpr3vtAK
	 9G+4bctZoMHKo1nAQ84xSAX9fNTZV8IANGvyrS1zRNRzCVRemt9DrXiSqBokTlepa6
	 rAEnGeQKKhd5sAPS8ytWfHTeDXsBi+rlvEuE8Jw7op/pxzJk44k45pPYlJ2DPWJdhH
	 F99uy18cp9E5a7FD7bMP++R1uN14VyZLS/UbdwRKprtZ1VIyal+UU76mn+jnA7/CMf
	 DAMFPHWJEuCyDsAlOh7EHE6d7zmoLjX4qUAHTiYoPPTkJk2OLT1nxJMaJUf6jCcJLg
	 Kq0gIiyK48T3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/9] ARM: dts: ux500: Convert HREF audio to
 audio-graph-card2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260918-ux500-simple-sound-v2-7-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-7-88d29416e3c3@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:06:46 +0000
Message-Id: <20260917230646.AFDD81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] sound: ux500: hardcoded TDM slots break dynamic channel support
- [High] sound: ux500: ABI regression causing loss of DAPM pin switches
--

commit 3bce354bbefb3531701f651af445996e9f8ba398
Author: Linus Walleij <linusw@kernel.org>

ARM: dts: ux500: Convert HREF audio to audio-graph-card2

This commit converts the HREF500 and HREF520 sound hardware to use
audio-graph-card2 in their device trees, replacing the legacy machine drive=
r.
It establishes links between MSP1/MSP3 and the audio codec, along with
defining the TDM frame properties and endpoints.

> diff --git a/arch/arm/boot/dts/st/ste-href-ab8500.dtsi b/arch/arm/boot/dt=
s/st/ste-href-ab8500.dtsi
> index 5eeb44c5e9323..ff72f5f6d6525 100644
> --- a/arch/arm/boot/dts/st/ste-href-ab8500.dtsi
> +++ b/arch/arm/boot/dts/st/ste-href-ab8500.dtsi
> @@ -6,6 +6,48 @@
>  #include "ste-ab8500.dtsi"
> =20
>  / {
> +	href_sound: sound {
> +		compatible =3D "audio-graph-card2";
[Severity: High]
Does this transition to audio-graph-card2 omit the creation of DAPM pin
switches that were explicitly created by the legacy machine driver?

The audio-graph-card2 driver fundamentally lacks support for generating the=
se
switches because it does not parse a 'pin-switches' DT property (unlike
simple-audio-card), nor are they specified in the DT.

Could this lead to the loss of 20 userspace ALSA mixer controls (such as
'Headset Left Switch' and 'Mic 1 Switch'), breaking ALSA UCM profiles,
PulseAudio, and scripts that attempt to route audio or toggle endpoints?

> +		label =3D "HREF-500";
> +		widgets =3D

[ ... ]

> +&codec {
> +	assigned-clocks =3D <&ab8500_clock AB8500_SYSCLK_INT>;
> +	assigned-clock-parents =3D <&ab8500_clock AB8500_SYSCLK_ULP>;
> +
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		port@0 {
> +			reg =3D <0>;
> +
> +			href_codec_playback: endpoint {
> +				remote-endpoint =3D <&href_msp1_endpoint>;
> +				bitclock-master;
> +				frame-master;
> +				dai-tdm-slot-num =3D <16>;
> +				dai-tdm-slot-width =3D <16>;
> +				dai-tdm-slot-tx-mask =3D <0 1 0 1>;
[Severity: High]
Can statically setting dai-tdm-slot-tx-mask limit playback to exactly 2
channels (bits 1 and 3), permanently forcing stereo playback and breaking
previously supported mono playback?

Looking at ux500_msp_dai_hw_params(), the backend CPU DAI driver rigidly
enforces that the runtime ALSA channel count matches the active slots defin=
ed
statically in the DT:

sound/soc/ux500/ux500_msp_dai.c:ux500_msp_dai_hw_params() {
    ...
    if (!slots_active || params_channels(params) !=3D slots_active)
        return -EINVAL;
    ...
}

Will userspace audio applications playing mono or capturing stereo directly=
 via
hw: fail with -EINVAL, causing a functional regression from the legacy mach=
ine
driver?

> +			};
> +		};
> +
> +		port@1 {
> +			reg =3D <1>;
> +
> +			href_codec_capture: endpoint {
> +				remote-endpoint =3D <&href_msp3_endpoint>;
> +				bitclock-master;
> +				frame-master;
> +				dai-tdm-slot-num =3D <16>;
> +				dai-tdm-slot-width =3D <16>;
> +				dai-tdm-slot-rx-mask =3D <1>;
> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-ux500-simp=
le-sound-v2-0-88d29416e3c3@kernel.org?part=3D7
