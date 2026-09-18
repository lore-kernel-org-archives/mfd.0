Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25E51AEDC;
	Fri, 18 Sep 2026 16:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750385; cv=none; b=EOj0j3wwc8Q62v9GgvnqE9AN8FmYXvZOI44tSYxpXLHxHuGdDqEs2OYLUWqgeSOxPUIgcsC3ScUm1VuXQVlMS+lsw93DziU3FkULCmJDpSdfEtbUV2LVgg9GgmkSzVt8NPfDKV/9V9CHUGusZ1tEujJOAsGXiPwCettQPG/Kmjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750385; c=relaxed/simple;
	bh=R+vWOsytoF5+RV7i1Y8eOHHp3UKhmCrJIsF+44nZJkk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lyHp8bBsv9SBlXVVTRr89/iUWgfQfnPAtqLOMHT8UEnmG9rXPFTITGIvMp0Kk0q8+s+1BzY74zudjyAs3OCU+FunOdPW8ZQJW0UQrD3m7ZsGFzQOJk5+b38KfUPk9C7kAisRJW/ZYyQjy6Sj8/gx+2X31ZrnVvc32kWP7RH9Y18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJklTVf0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJklTVf0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC791F000FF;
	Fri, 18 Sep 2026 16:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750379;
	bh=TdiY8zcFiqxYnXEs7MT8tK3462MWY0Wntd3f9RpUeZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WJklTVf0Z5NSykTLq6ddD6Ta0CaRJJuxljeiVO5Q17W1H0MPvlIEnz7ruG4aNip44
	 8/WyO5shl+BD18oUvf2DzrhKp7YmeiOuL/GyRuf1VULRT+9BdS647n9VTJT4xP3Fk0
	 W4vg8bgQDNEwx78ljxzcSqGd15oB841ySqBCXz5sSSNzuRfWO0udSkBm92XuaDR25Q
	 3LmkfHbZng79E8g2nSlzxk9m/klVhurf+e1vdZFSLwgWcTqgUdc1cMnEZB92zfDdXE
	 0pWjHwTrBQjujVo+92kJ0VBbbo5i4RQ+jwxQFe4k0zXHXOfEYcDTpuIc+MRq0kbgs0
	 Z8CfIlyoNE/yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] regulator: qcom-pm8008: Add PM8010 mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260918-pm8010_i2c_support-v1-3-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-3-de33d78fad9d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 16:52:58 +0000
Message-Id: <20260918165258.9FC791F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] redundant use of to_i2c_client() when accessing of_node
--

commit f34c6623337a92a1f38e24ae60d1ae6ced8eed2d
Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

regulator: qcom-pm8008: Add PM8010 mode support

Implement set_mode/get_mode support for PM8010 LDOs using the mode
control and status registers to allow clients to vote for LDO modes.
Mode voting is not supported in the PM8008 LDOs.

> diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulato=
r/qcom-pm8008-regulator.c
> index b484c0f73eeac..9758809a6322d 100644
> --- a/drivers/regulator/qcom-pm8008-regulator.c
> +++ b/drivers/regulator/qcom-pm8008-regulator.c

[ ... ]

> @@ -169,6 +237,9 @@ static int pm8008_regulator_probe(struct platform_dev=
ice *pdev)
>  	if (!regmap)
>  		return -EINVAL;
> =20
> +	is_pm8010 =3D of_device_is_compatible(to_i2c_client(dev->parent)->dev.o=
f_node,
> +					    "qcom,pm8010-i2c");
> +

[Severity: Low]
Is there a reason to use to_i2c_client() when accessing of_node in
pm8008_regulator_probe()?

Since to_i2c_client() is defined as container_of(d, struct i2c_client, dev),
accessing the dev member of the resulting structure evaluates back to the
exact original pointer (dev->parent).

The expression to_i2c_client(dev->parent)->dev.of_node is functionally
identical to simply using dev->parent->of_node, making the macro usage
entirely redundant.

>  	for (i =3D 0; i < match_data->num_regulators; i++) {
>  		data =3D &match_data->regulator_data[i];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-pm8010_i2c=
_support-v1-0-de33d78fad9d@oss.qualcomm.com?part=3D3
