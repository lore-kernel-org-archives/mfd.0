Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9282E184524;
	Wed, 16 Sep 2026 04:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532684; cv=none; b=s91iuivJt6CGzX/GuG5TQ1JSZrRu0rc7SAj7Wj1TOVhSNIYTgu19z+AhCQ2zKnI5djcSVQ9ta7qsKfP9gj92qAD6QJn8tRB8OpesQEBfF+F0WfsDcJAIH5VEEAPl38bbJ5HLAI5Q5Rg2CZfHg50Ef0SGt8nzjKUdR9ZFov0FXxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532684; c=relaxed/simple;
	bh=2N/lJsz80IJkWoLjIuPNna230gL9AlMzlOmsXFd+ZJk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=reTHyKdV3IGCgwN+srojmx3za2TGWWOIf3kyWuol0iYnWwbPDJOTiobXGrGaRMll1T74Fgvmq27eEwigiTdXq/vZCwPcchlA6Pxe+/6P3dJZpxCkEiVlRryIMIT+KwNAy9itSmJVR2rvbv69iVhgzpDTmyXBiUHygApnHNPAkj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5FHHj1H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5FHHj1H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98F11F000FF;
	Wed, 16 Sep 2026 04:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789532683;
	bh=2N/lJsz80IJkWoLjIuPNna230gL9AlMzlOmsXFd+ZJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N5FHHj1H8tKUoWy5dGCNKYV4OPUAwInpGfKvV9yDuYmCqjQxEEY6knvssP4Sh4JiL
	 GFEdnYBchD8vfOjENRwuoqKPFBdnmyWsU5dLy2uJHedUWiwERTdmy76fSZizGTEdI/
	 Eu8Ys1OFEoIwtWtyb86fGoAdZRJv4u8KU3IaIdMiJSPIOjJ6In0THSIPg9+mUn+LDd
	 9RcGvvXl3Axlb+uuR47b+8jB8uJPMBNTvF+AqQ8sZkG/1Cs8xlrTG2Hv6UUg8EMQZW
	 eQXH1ebu6nHOMZEKhHBebf3cLZTVFvfbFhYebfAK/pNDrzxQzSYzRYYMQJeSEQarlB
	 /w/DEk5ZIg9qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 04:24:42 +0000
Message-Id: <20260916042442.C98F11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
> built around this PMIC it is the only way to read the battery: the SoC's
> AUXADC is wired to board thermistors and the charger ICs these boards use
> have no ADC of their own.
>=20
> Add a driver exposing the battery voltage and battery temperature
> channels. Only those two are described, so a channel ID in the device tree
> is an index into the driver's channel array rather than the PMIC's channel
> number, as mt6323-auxadc does. The ready bit lives in a channel's raw
> result register, but the value comes from the chip's trimmed copy of it,
> which is what the vendor driver reads for a measurement.
>=20
> Both channels need more than that, as the vendor programs them. The
> battery voltage is measured through ISENSE, because a board with a
> switching charger in the power path leaves BATSNS on the charger's system
> rail instead of on the pack. The thermistor only reads correctly with the
> PMIC's battery-detect bias and input buffer enabled, which take 20 ms to
> settle. Both are switched back off afterwards.
>=20
> Reads average sixteen conversions in software; the chip's sample
> accumulator makes no measurable difference at any setting, so it is left
> at one sample per conversion.
>=20
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-rbrue-suez=
-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com?part=3D2

