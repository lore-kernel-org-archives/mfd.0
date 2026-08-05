Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED71382F10;
	Wed,  5 Aug 2026 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917955; cv=none; b=TNEQk2xYPfD2IMyZbAIAFDXyisVC1TfAxaV5yNrlqFvmY9q4f4QoPaKJRHdAsGHzjYWer1xDAYFEHeJP8JiFo/oPv3AIVYakRSTJrZucoWvsNWZHTnXyKvUgWLAYZhya4Bd1TMAk8yVNCmaIzraiB6lcZD4R4aPQ3DSlcMm41kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917955; c=relaxed/simple;
	bh=jcExCHgs8v7Ae51k9n4oXl4IpKgUdIf80vGBV5j5HJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EnihyIeGgfLYUTE4mBfrDgoWVXNlZGQ53kt3M9YkBfNi2a6dx6XNDPnJjRubGYNv4hWek9IuAFDRwBwXu5P/8pb/DF03Ah0HH/q4LVJKzjLf7gut9POKKdEuTNR0nLkx81s4UHjiJp5/hUtE+CRUHoiZSABFm/w+iF3ENxsvKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRVktW5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRVktW5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272991F00A3A;
	Wed,  5 Aug 2026 08:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917954;
	bh=8vewiNrkoIDQtorfLbzBBsxYkJScQqv+bz/olHZPmig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XRVktW5BOIOHyUpcx0YeJcGxLxInvIm57q2bckybM1IVvF/4fW96ReNsC0y3b8U1/
	 ad9PQ4crURZS9ASjX4Tl2WOBrHdF6xPkKo5tAeJBjMDoe3M9phNcFgILrlHPBH2vKb
	 TcHY7jvIDMcnuwEd6XW4r03tYlaJ9yMB383TNSyCV6ZBsTqDO6ZKKhfZVuvG8mT6jt
	 nP2yp+TgEgcVgpH1yIjAm/RmdxHJ2ZdlxhSgyOcTxerA2WM2hQMX/XzeodplJ9oLpw
	 EENrbjKezu8EfT7Wzb/tFFWKaQu7YAuamphxTPM8yho4PXtXCYqjboNU7Vrsfw4/d9
	 paI5be7QEjK2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/6] mfd: khadas-mcu: Add support for VIM4 MCU
 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-3-75df78710b9e@aliel.fr>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-3-75df78710b9e@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 08:19:12 +0000
Message-Id: <20260805081913.272991F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver unconditionally fails to probe on generic Khadas MCU bo=
ards (VIM1/VIM2/VIM3) due to a NULL pointer check on valid match data.
--

--- Patch [3]: [PATCH v9 3/6] mfd: khadas-mcu: Add support for VIM4 MCU var=
iant ---
commit eab418dac1b5e94bd297b0a14e92e87b2063dc9b
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

mfd: khadas-mcu: Add support for VIM4 MCU variant

This patch refactors the probe function to use per-variant values instead of
hardcoded globals. It adds dedicated regmap configuration, fan control regi=
ster,
and duty-cycle levels for the VIM4 MCU variant. A new compatible string
"khadas,vim4-mcu" is introduced for this new device.

> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index 0e74efe14f367..4cb305ac915e1 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
[ ... ]
> @@ -75,47 +75,138 @@ static const struct regmap_config khadas_mcu_regmap_=
config =3D {
[ ... ]
>  static int khadas_mcu_probe(struct i2c_client *client)
>  {
> +	const struct mfd_cell *cells, *fan_cells;
> +	const struct regmap_config *regmap_cfg;
>  	struct device *dev =3D &client->dev;
> +	int ncells, nfan_cells, ret;
>  	struct khadas_mcu *ddata;
> -	int ret;
> +	const void *match;
> =20
>  	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
>  		return -ENOMEM;
> =20
> +	match =3D i2c_get_match_data(client);
> +	if (!match)
> +		return -ENODEV;

[Severity: High]
Does this code inadvertently break the probe for generic Khadas MCU boards
(VIM1/VIM2/VIM3)?

Because KHADAS_MCU_GENERIC evaluates to 0 in its enum, i2c_get_match_data()=
 will
return a NULL pointer when matching "khadas,mcu" in khadas_mcu_probe() in
drivers/mfd/khadas-mcu.c. This will cause the check here to evaluate to tru=
e and
unconditionally abort the probe with -ENODEV.

[ ... ]
> @@ -123,7 +214,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
> =20
>  #ifdef CONFIG_OF
>  static const struct of_device_id khadas_mcu_of_match[] =3D {
> -	{ .compatible =3D "khadas,mcu", },
> +	{ .compatible =3D "khadas,mcu", .data =3D (void *)KHADAS_MCU_GENERIC },
> +	{ .compatible =3D "khadas,vim4-mcu", .data =3D (void *)KHADAS_MCU_VIM4 =
},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-add-mcu-fa=
n-khadas-vim4-v9-0-75df78710b9e@aliel.fr?part=3D3
