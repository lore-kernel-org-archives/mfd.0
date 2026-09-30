Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EC330E853;
	Wed, 30 Sep 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773301; cv=none; b=hIgYCsNuq32yS8MYXHGA8lm0DVmlDQ/Ys58QHSPVEa5KB7DCO8JBTOdLGmKPHS2dAQHkAfux2ZXd0lNhvppdanbJRNBiDZ7MLv7FLR4+ESUhDMDUz/nqmricAbtwoLF5deen1qNSq0s1dc5JS6jTgVU1KXPAYWBDCprHnBn2G+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773301; c=relaxed/simple;
	bh=c+JuntSWma6DBEmAJRjtJasLspJME7cGwHpNUIORnRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A337ozvkOUHmlJ4qlKZWd5tjo6rlNZCbHHfYWF2DY/nkmOjF+jPa9971FwKa/T5UNHUEDlJ5S5222nnG8VpdV92NKb8E0yE/64nWFZFWP3ugTI7lwk3x+hRQT/uBdQBuBYd+ccC1khSEQ+b5yLM3JjBSe4Tx/CG5GzHH3O8mVYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrqcXUMh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrqcXUMh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DFD1F000FF;
	Wed, 30 Sep 2026 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790773294;
	bh=Ezqwak9mWotGU9ViiQ+bNtjX+Ku24BZzX7AxIEMIE0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UrqcXUMhm7SPAl7hGfRvKotialytYTyAuKRFioGpF1GVjW7O2rYEvo5tANyBagK8p
	 vpDtjqx+886pY8crPxj1/ReICwqSlfM4uy6KuUAmCCPpKe0sKt1EV4wC6IznA8UPrQ
	 +avi9OEFbNh/jJSWPikulnqQdBJFH5ElH0GB1kZgK40JueakngCbGCBpmu98iJxJeP
	 7QR1BLrz2tdknOJDkzMcvO4nxPsG6LuC1/MmW2pwAbF/ZZHQdgUuHH6FWzQ91DN2yX
	 KE9EVS/v9zhqkTXppivqcQDLsFCUYIR7edbB4FO2hXnzCNn2jqv5fxWiBGI62fhoRz
	 SRYvjWhhatALQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: arduino-imola: add support for sound
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 13:01:33 +0000
Message-Id: <20260930130134.75DFD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ASoC: qrb2210-sndcard: duplicate BE DAI links for RX_CODEC_DMA_RX_0
--

commit d222aeffc646b4d2645c81200f3c926432d5d57b
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: arduino-imola: add support for sound

This commit adds sound support for the Arduino UNO Q board, enabling headset
playback and record, lineout, and ear out functionalities. It updates the
pm4125 device tree include and introduces audio routing and DAI links in the
arduino-imola device tree.

> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/ar=
m64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index c472e13fceca4..e99d2a56dc287 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
[ ... ]
> +		ear-playback-dai-link {
> +			link-name =3D "Ear Out Playback";
> +
> +			codec {
> +				sound-dai =3D <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};
[ ... ]
> +		hph-playback-dai-link {
> +			link-name =3D "Headphones Playback";
> +
> +			codec {
> +				sound-dai =3D <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};
[ ... ]
> +		lo-playback-dai-link {
> +			link-name =3D "Line Out Playback";
> +
> +			codec {
> +				sound-dai =3D <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};

[Severity: Low]
Are we creating redundant backend DAI links for the exact same physical CPU
DAI (RX_CODEC_DMA_RX_0) here?

In ASoC DPCM, dpcm_get_be() returns only the first RTD it matches for a giv=
en
widget. Because of this, it appears DPCM will strictly only use the=20
ear-playback-dai-link, while the hph-playback-dai-link and=20
lo-playback-dai-link will be ignored and their hardware operations will=20
never execute concurrently.

Could these be consolidated into a single backend DAI link, relying on the
pm4125 codec's internal DAPM graph to handle multiplexing the single backend
stream to the Ear, Headphone, and Lineout pins?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930124607.1109=
167-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3
