Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418021;
	b=2xHLJ29H8E4L99+Sn7VQWabQ/ruzR9lArbhkwdnelghv9PNdD6IZODKVAa8Xj5VCXl8Y
	 aMenGFRgJOaXpZAWrU3L1JcmJAckMVxJ1ujtR+wL/uwu4FgwPYcHTzTzI1Sj6PiMt+X6+
	 mTYN4kBExRlxPpBkcnsqaDPrE98l8y/dYtkPGjUEbwJYn2HSOEd2fgPoE2HkjTajQcMLh
	 fdiAwMORtKa8EkhHfVNXb8GbkCglBQe680f53Fi7mhSj+s1Lv1rPhkP2a8nAJcaliCzCP
	 LwaBh0fmV0R9VB6apfyZHfvXvXRW2CLzDEExtOMiJp6Ezzs3wqFutKCqdw9HK2OG8ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418021;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NCphbdEQB+/YvL+7+AdHBChftpWMXAaKtz8ipUStWgk=;
	b=Mq1ORDPKuTE5ybxqCgJZKwCl424/syAJqKP7bwTEOnfXsr2PFeWzwqOaTEy6s76x53yQ
	 j2W8JYE79lJWtmmxrYzzpTGAy0UCGnTw7YfgNRnm9PBViVAMtVQzcTTJrgR5JXwmJG18z
	 GriVI9YgjOjdlipnubE7quxT6DzxmO4oRNSBg3zNEjdSZiu/5HmH2ma6QM6vDZiQEVxRt
	 CGHONTA0BxLR/odSCLXevNGmBQ3F3QJ42qMYR5V80tv3B/XrCOtdYkuzO59SUZ1Cjd/BI
	 sofkY3iP7enROyoHxnEcdlfuDsJCpgnjlmqT9emSwM/vNecAIkNhPsBzT81zdTooBKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OyBxCrLj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E88606A321;
	Wed, 11 Nov 2026 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OyBxCrLj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4AF1F00A05;
	Wed, 11 Nov 2026 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418021;
	bh=NCphbdEQB+/YvL+7+AdHBChftpWMXAaKtz8ipUStWgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OyBxCrLjArNbr4B+NpYYsz+tWD1e6ppJc+J0F19chIr/kGq034wStsBobYJpiccWM
	 eDOOiJFcrceUcnpIgeu0BmxpJkkS5quFBnq1zIPwGwE68Ge6/Zj9Cz2+8suo2eZNmO
	 a72A3Lqa251ImDhwzHqMRgqhXXkEwOHDEG2EsgmFp+fAljI2SXVIsgAhZd9vrhOIUN
	 atVMt8oSOGy4UHny86DtAyLsCeY/K//fp2xlouXHIS8Z6gUlPoE2HCe8FfKQ1SEj+X
	 WYC/0FYSfI2NTAvz8x8MH7HKFwTX+m1/6Pxf7SI5RmnA4G7UzbvpEd98+Ald2FIUvv
	 qAHGYtfzQv1bA==
Message-ID: <sashiko-outbox-209409@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] regulator: pm8008: Add mode voting support for
 PM8010
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261111-pm8010_i2c_support-v4-3-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
 <20261111-pm8010_i2c_support-v4-3-4549cab1c8e4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:27:00 +0000
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
- [Medium] regulator: pm8008: wrong hpm_min_load_uA for PM8010 L1/L2 in
  pm8010_reg_data
--

commit e894320c5a690e879a2556e289265d1ae5f7176f
Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

regulator: pm8008: Add mode voting support for PM8010

This commit adds set_mode, get_mode, and get_optimum_mode support for
PM8010 LDO1 and LDO2 in the pm8008 regulator driver.

> diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulato=
r/qcom-pm8008-regulator.c
> index 0ea4ac016dc22..395d5582f6af0 100644
> --- a/drivers/regulator/qcom-pm8008-regulator.c
> +++ b/drivers/regulator/qcom-pm8008-regulator.c

[ ... ]

> @@ -84,9 +97,10 @@ static const struct pm8008_regulator_data pm8008_reg_d=
ata[] =3D {
>  	PM8008_REGULATOR("ldo7", "vdd-l7",    0x4600, 200000, pm8008_pldo_range=
s),
>  };
> =20
> +/* LPM setting is supported for only N-type LDOs of PM8010 (L1 and L2) */
>  static const struct pm8008_regulator_data pm8010_reg_data[] =3D {
> -	PM8008_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_range=
s),
> -	PM8008_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_range=
s),
> +	PM8010_REGULATOR("ldo1", "vdd-l1-l2", 0x4000, 172000, pm8010_nldo_range=
s, 100000),
> +	PM8010_REGULATOR("ldo2", "vdd-l1-l2", 0x4100, 172000, pm8010_nldo_range=
s, 100000),

[Severity: Medium]
Should hpm_min_load_uA for ldo1 and ldo2 in pm8010_reg_data be 30000
instead of 100000?

In drivers/regulator/qcom-rpmh-regulator.c, pm8010_vreg_data defines the
same PM8010 LDO1 and LDO2 regulators using pmic5_nldo502, which sets
hpm_min_load_uA to 30000 (30 mA):

drivers/regulator/qcom-rpmh-regulator.c:pmic5_nldo502 {
    ...
	.hpm_min_load_uA =3D 30000,
	.pmic_mode_map =3D pmic_mode_map_pmic5_ldo,
    ...
}

With hpm_min_load_uA set to 100000, pm8010_regulator_get_optimum_mode()
keeps LDO1 and LDO2 in REGULATOR_MODE_IDLE (LDO_MODE_LPM) when consumers
request loads between 30000 uA and 99999 uA via regulator_set_load(),
which can cause output droop or brownout under moderate loads.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-pm8010_i2c=
_support-v4-0-4549cab1c8e4@oss.qualcomm.com?part=3D3
