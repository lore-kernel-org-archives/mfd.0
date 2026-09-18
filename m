Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D54C5187E6;
	Fri, 18 Sep 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750644; cv=none; b=u+dyKtcWeqd0staBX3vC0cVjBYotubJ2BFSmQBJW7jcdSpCzQgf+I6QVDVyUdamGzISaESxJfh9bNXakDf107WSLnnEcN+xMaOnxd7NYP8BGY2OatxqFZlF6hNtZLFNha5lpmlkyiuR6J4cEvjooDEtCvnFKL+KJZ+YCZNC4H50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750644; c=relaxed/simple;
	bh=VU4C81zeuIqW+vlB+lovNigETP5XcSzLWiFyVa8oGjs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DbGjrJqXnuba4+UNATBmGh1puQXUpLuyo3z13tU7DLz0WziVRx2OXc6V920Qv4A321C2+AeoJd0bgLFEdWmmVzJGBuVecSb6XQIq0X2jCptloh4bdrUqHWbGu7bSOTAP4QUah9UXw/S5As/0b7i2jhGwK7xNn7CW626UWDIPHa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvdrB9MP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvdrB9MP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA17C1F000FF;
	Fri, 18 Sep 2026 16:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750642;
	bh=lZ1pHAJccpQYYC2Zxu3hnnyIwXBPtE2O0tGSnFfKuKw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RvdrB9MP9l13QHoGXP5lumO/GPZSMqrHX5FUpHpYGQARu6djsrXbKZia+sEEnfE8I
	 vsmBu9pxr05SwFWbUvmZlWxE0vqCUILWbyy+llmMLWcDTpjnJhXxXAr2Xpi+dzTU2G
	 IWfw3zQTQdZh+5Q3xntx1m48cJ4g1mQxv970H2qCqO261tbXZE/B+mibQ4+GUGFF4k
	 hbcPLN/JBoxubKSU/7v8CkzQhnsdoYV/5wy8ZzOpiKp7NWDkLNLPsi23tzAIwucQb2
	 eUOKvUij3Bc2qV3pacXFT/qjchAblFhfilTOnmNAi1GM3jp7IEELuUjjUA199ARz9I
	 35Z+ISvdpGr7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] mfd: qcom-pm8008: Tolerate missing interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 16:57:21 +0000
Message-Id: <20260918165721.CA17C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mfd: qcom-pm8008: bogus IRQ mappings for child cells when client=
->irq is 0
--

commit 2c273914596163e5696becde808ceb33d98f0fe8
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

mfd: qcom-pm8008: Tolerate missing interrupt

This commit modifies pm8008_probe() to only register the IRQ infrastructure
if the parent IRQ is present. This is intended to support devices like PM80=
10
where the interrupt pin is tied to ground.

> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -233,7 +233,7 @@ static void devm_irq_domain_fwnode_release(void *data)
> =20
>  static int pm8008_probe(struct i2c_client *client)
>  {
> -	struct regmap_irq_chip_data *irq_data;
> +	struct regmap_irq_chip_data *irq_data =3D NULL;
>  	const struct pm8008_match_data *data;

[ ... ]

> -	/* Needed by GPIO driver. */
> -	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
> +		/* Needed by GPIO driver. */
> +		dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
> +	}
> =20
>  	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, data->mfd_cells,
> -				data->num_mfd_cells, NULL, 0,
> -				regmap_irq_get_domain(irq_data));
> +				    data->num_mfd_cells, NULL, 0,
> +				    regmap_irq_get_domain(irq_data));

[Severity: Medium]
Will this lead to bogus IRQ mappings for child cells when client->irq is 0?

When the device has no IRQ, irq_data remains NULL, and we pass a NULL domain
to devm_mfd_add_devices() with an irq_base of 0.

The MFD cells (such as pm8008_temp_res for qpnp-temp-alarm) specify IRQ
resources using DEFINE_RES_IRQ() with hardcoded offsets, for example:

static const struct resource pm8008_temp_res[] =3D {
	DEFINE_RES_MEM(PM8008_TEMP_ALARM_ADDR, 0x100),
	DEFINE_RES_IRQ(PM8008_IRQ_TEMP_ALARM),
};

When mfd_add_device() processes these IRQ resources and the domain is NULL,
it falls back to assigning the IRQ as irq_base + start. Since irq_base is 0,
a child device like the temp alarm will be assigned a global physical Linux
IRQ matching its offset (e.g., 0 + 5 =3D 5).

If a child driver requests this IRQ, could it steal an interrupt from anoth=
er
hardware device on the system, leading to unexpected behavior or resource
conflicts? Should the driver dynamically strip or adjust the IRQ resources
from the MFD cells when no parent IRQ is present?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-pm8010_i2c=
_support-v1-0-de33d78fad9d@oss.qualcomm.com?part=3D6
