Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E603AE706;
	Sun, 20 Sep 2026 05:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789883393; cv=none; b=LZ6cSGT3+rQqPa7TYv5aphOnySUuxnr8Re2xVkKDMaNOiG3z6vs5U+pmRh/jmmnMPLFAV6yfmuxWUYvCNpQSXWGYntggkl2gZcPvVdkljwpy3cU1v+yxgbcJOOXrD1Dp93pQgoHrnFTA1S4TF4Xh/XV2GX12HN60daUdy/XqyV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789883393; c=relaxed/simple;
	bh=PRg30yh/paj0sG4qbPJcP/6xQk59t7uYoqPPFSsMU1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N6t3AtoojeUEk1tqTw3juy2XdiwNxR++TMhhDdsStC+7/amDWklas29cscNdGtG4Lgcrv8nOeHx3Ymakx/PxCjMw5RCj3tt/2Rt6C6AOHQxM0pq9yoMp90pvB024pEZn3FHbFpr2e2n7XPbL+S95wg8rpn9nvImuegYtOeKGtio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djjjVCJm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djjjVCJm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A94E1F000FF;
	Sun, 20 Sep 2026 05:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789883391;
	bh=C8aYHwyoGgEnVMcmsM/OeiYq1QCkwc6fitChj13TuT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=djjjVCJm/vH14/tcZctx/L4POACpAdlZDZdy/cto3hjEde/B3h6uNkSVr6fEMZbRT
	 dSp8Q7rKtvUqpl38ZgADURDM9fxPofgbI65JG8WAKvm2I67ezQSinrq39bo1DkRVGR
	 k8QYgDcDZ/oK1gGb8zDm9kEngdMz36R1OTq9A4wv+BEXN6+rbakm1AN28Hzc3tZnK7
	 olouGMVoSkWJu5ghbB2ERHQtDAOxSZNI9r9Ky/r/+mbaXalJX0KwJcrvDu3ad8+jXs
	 73+EBbLFvQhDtIDwIKVqs8YNHBxVBWjsJw/91TPK8csfgQ8+Y/z9KtT55IjPm9P5kJ
	 LyCW5fv3HwoLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-2-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-2-c00edacbee64@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:49:50 +0000
Message-Id: <20260920054950.9A94E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: adc: early return on regmap error abandons hardware teardown
--

commit 7889b991ac3807eea04917eed3e7986efc9451b3
Author: Ryan Brue <ryanbrue.dev@gmail.com>

iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC driver
   =20
The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
built around this PMIC it is the only way to read the battery. Add a driver
exposing the battery voltage and battery temperature channels.

> diff --git a/drivers/iio/adc/mt6397-auxadc.c b/drivers/iio/adc/mt6397-aux=
adc.c
> new file mode 100644
> index 0000000000000..d860cd3a89227
> --- /dev/null
> +++ b/drivers/iio/adc/mt6397-auxadc.c

[ ... ]

> +static int mt6397_auxadc_battemp_bias_off(struct mt6397_auxadc *adc)
> +{
> +	struct regmap *map =3D adc->regmap;
> +	int ret;
> +
> +	ret =3D regmap_clear_bits(map, MT6397_CHR_CON7, MT6397_CHR_CON7_BATON_T=
DET_EN);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_clear_bits(map, MT6397_AUXADC_CON0, MT6397_AUXADC_CON0_B=
UF_PWD_B);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_clear_bits(map, MT6397_AUXADC_CON0,
> +				 MT6397_AUXADC_CON0_BUF_PWD_ON);
> +}

[Severity: Medium]
Does returning early here abandon the hardware teardown? If clearing
MT6397_CHR_CON7 fails, the MT6397_AUXADC_CON0 bias buffers will remain
enabled. Since the caller relies on this function to provide unconditional
teardown even if earlier steps failed, should this function continue and
attempt to clear the remaining bits regardless of an error?

[ ... ]

> +static int mt6397_auxadc_isense_disable(struct mt6397_auxadc *adc)
> +{
> +	struct regmap *map =3D adc->regmap;
> +	int ret;
> +
> +	ret =3D regmap_clear_bits(map, MT6397_AUXADC_CON14,
> +				MT6397_AUXADC_CON14_CH0_NORM_SEL |
> +				MT6397_AUXADC_CON14_CH0_LBAT_SEL);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_clear_bits(map, MT6397_CHR_CON16,
> +				 MT6397_CHR_CON16_ADCIN_VSEN_EN |
> +				 MT6397_CHR_CON16_ADCIN_VBAT_EN);
> +}

[Severity: Medium]
Similarly, does returning early here prevent MT6397_CHR_CON16 from being
cleared if updating MT6397_AUXADC_CON14 fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-rbrue-suez=
-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com?part=3D2
