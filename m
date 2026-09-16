Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1FD388E7E;
	Wed, 16 Sep 2026 04:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532690; cv=none; b=L16PkqfOp08nu5nMjLn9U/smJ+3WITxEDiJ70dVkqOegDHzS8nH0irnbglh2ZvcGqk9gxmic5fmvacyMvBq+Ks2+OARsGPQ5KibRk8OKbAIS1FF6nbqpLJsjsTQXwHu/DPEBBg4NGRadhZrc+jsZf9ZKKYG6MbwXGruvkuWdbLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532690; c=relaxed/simple;
	bh=YpOnMZfnGp0BfpSuFRJ9zbxoqF1GXbnohn+jibFX94I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HDbxHTtqURWzJ5W5awyi2S3mq11Vz+2fbzWj9aNSDE0Gb/fQVlt7DgBbn594l0u0/yluGux9xH5oIGOMIF91gPcr6aCAajUiVBHM3xgDaVBb7mk5ILTpYZ0U+b5p/VUwqFPVUVpm+Oik0S0s+kOh8r5sKyFwlWJajiIRzkrur+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXwRs+MI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXwRs+MI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40941F000FF;
	Wed, 16 Sep 2026 04:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789532689;
	bh=UzeuAywDY2xfa1vRb2vynAwqdSmehEVw0QcsZQhUZgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KXwRs+MI0ouznF1N9KX4zqCiFrj8JckbctEbyEc3djBSKxaVUvpGMF7x3gVTajZ/N
	 O3NrsLSNCR1jMBi7VRQYsFZUVc0rZ6CDlvZkLApUEiBNuHCrYNQNnx6ZJiJYNuc4WT
	 XMTXG6I+PUI05uMoyKADrORUhzBqjdx0eERcrOCXiUTvGEI/NFP/lBU2DnBCJbXse8
	 gpF22y9nAnwSpKtGIIrfko7HcUHUuHe2p1tAvu0nLO80dM4YIHOdnfiOZkjqVkf8fW
	 vutHzoKCq8hIkd5fyf1GLOLcsuXkJuUQQvc8Zf15p+rl7sHcHp6QMoXCYGOyxCAMdJ
	 JiJHRkpHIkg2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-3-d35d2ac3d6f0@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-3-d35d2ac3d6f0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 04:24:48 +0000
Message-Id: <20260916042448.A40941F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: mt6397-auxadc: hardware state leak on error paths
--

commit e17dd59587f106380c3ede8aa27c118b33350f88
Author: Ryan Brue <ryanbrue.dev@gmail.com>

mfd: mt6397-core: Add mt6397 AUXADC support

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 9ec9519965887..5d5f816492aaa 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] =3D {
> =20
>  static const struct mfd_cell mt6397_devs[] =3D {
>  	{
> +		.name =3D "mt6397-auxadc",
> +		.of_compatible =3D "mediatek,mt6397-auxadc",

[Severity: Medium]
Enabling this device exposes a hardware state leak on error paths in the
mt6397-auxadc driver.

In mt6397_auxadc_isense_enable(), if the second regmap write fails, does the
function return without unwinding the first write, leaving
MT6397_CHR_CON16_ADCIN_VSEN_EN incorrectly enabled?

drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_isense_enable() {
    ...
	ret =3D regmap_update_bits(map, MT6397_CHR_CON16,
				 MT6397_CHR_CON16_ADCIN_SEL,
				 MT6397_CHR_CON16_ADCIN_VSEN_EN);
	if (ret)
		return ret;

	return regmap_set_bits(map, MT6397_AUXADC_CON14,
			       MT6397_AUXADC_CON14_CH0_NORM_SEL |
			       MT6397_AUXADC_CON14_CH0_LBAT_SEL);
}

Similarly, during teardown in mt6397_auxadc_isense_disable(), the use of the
?: operator short-circuits the sequence.

If the first regmap_clear_bits() fails, will it abandon the cleanup and skip
disabling MT6397_CHR_CON16_ADCIN_SEL?

drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_isense_disable() {
    ...
	ret =3D regmap_clear_bits(map, MT6397_AUXADC_CON14,
				MT6397_AUXADC_CON14_CH0_NORM_SEL |
				MT6397_AUXADC_CON14_CH0_LBAT_SEL);

	return ret ?: regmap_clear_bits(map, MT6397_CHR_CON16,
					MT6397_CHR_CON16_ADCIN_SEL);
}

A similar issue appears in mt6397_auxadc_battemp_bias().

Does this function lack a rollback path if the second or third regmap
operation fails, permanently leaking previously modified register states?

drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_battemp_bias() {
    ...
	if (on) {
		ret =3D regmap_set_bits(map, MT6397_AUXADC_CON0,
				      MT6397_AUXADC_CON0_BUF_PWD_ON);
		if (ret)
			return ret;
		ret =3D regmap_set_bits(map, MT6397_AUXADC_CON0,
				      MT6397_AUXADC_CON0_BUF_PWD_B);
		if (ret)
			return ret;
		return regmap_set_bits(map, MT6397_CHR_CON7,
				       MT6397_CHR_CON7_BATON_TDET_EN);
	}
    ...
}

> +	}, {
>  		.name =3D "mt6397-rtc",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-rbrue-suez=
-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com?part=3D3
