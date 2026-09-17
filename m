Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26803DA7F8;
	Thu, 17 Sep 2026 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632794; cv=none; b=R+Qujptwxwwen3+05T3jdEt66tmusHGzNj5BWS/wKLCW35svo5XsGyhnyEmBWnzIEPlbidW9ka+E8wBNzQXtXTSl9ON2SmZgdBZGQkDrIoVxhJ1jn2pPzH1FiYoGd1bI2yRJn2RWxdGJMQcvPWtjc8QaOYYq7OnNwXJCZknbaWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632794; c=relaxed/simple;
	bh=ElTh/sHPHdTaHWU+879Pn0LdStLaQMR8luh/inKTfdY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sq9vXdy6EozLJT4a+uZVdSxF52SzEBW4+coic6BNMcsgoNIwxMX/DH7IQE+TGM1vk1X5a7AO7/Os54wFsSz6YuQPTCEBseSZPjKyRTct0MLpbBW07fJOYMfYroSnTtJHMgo39182PxlMYNo23DIXJ4SDNW/RGfSrtM638DVDwek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wv0HWmbH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wv0HWmbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBD21F000FF;
	Thu, 17 Sep 2026 08:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632790;
	bh=Sdk+GwiMg6X2HAGf1p+c0hsGXa8yOHTezJWVgAivQS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wv0HWmbH0opbo+DqUFX8R6YQ/lV8lz5Tb4ZhORfjjSZePou5rOhgCU7r9xUsUdBxN
	 xl/af5HZn26DFub7cRgTWV8PtKtrORY6ezYDmU6sg9brmD0iRGJP7/T/l0jq593sJz
	 osBrdRXx38AxgexbJ99eNoZNnkM4aghMNmRi89uvqfpURS/0C8ex3rksufkDUUed8d
	 AWE0bspw9Lf9YFNAeMvCWNmoiM76bgSGvacaAeV6jYRT6lj4wlpWEY71ovVxvlvT/c
	 DmFBkDrUZVCz7jcos8zatObBlPSeew5qlL+mRm3MYjYpt3FeomAQeICY0oub3qkF5Z
	 hyxc8SMexLbMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 08:13:09 +0000
Message-Id: <20260917081309.8FBD21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] thermal: khadas-mcu-fan: OF node reference leak in probe
--

commit c3a0644be46518f47124644a90235d26979c4299
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

thermal: khadas-mcu-fan: Add fan config from platform data Add regulator su=
pport

This commit introduces variant-specific platform data including control
registers and duty-cycle levels, while also bumping the maximum level.
It optionally acquires and enables a fan regulator supply at probe time
to handle boards that gate fan power.

> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mc=
u_fan.c
> index 21b3d0a71bd0d..1da639d054971 100644
> --- a/drivers/thermal/khadas_mcu_fan.c
> +++ b/drivers/thermal/khadas_mcu_fan.c
[ ... ]
> @@ -76,22 +82,71 @@ static const struct thermal_cooling_device_ops khadas=
_mcu_fan_cooling_ops =3D {
>  static int khadas_mcu_fan_probe(struct platform_device *pdev)
>  {
> +	const struct platform_device_id *id =3D platform_get_device_id(pdev);
>  	struct khadas_mcu *mcu =3D dev_get_drvdata(pdev->dev.parent);
>  	struct thermal_cooling_device *cdev;
>  	struct device *dev =3D &pdev->dev;
>  	struct khadas_mcu_fan_ctx *ctx;
>  	int ret;
> =20
> +
> +	if (!dev->of_node)
> +		dev->of_node =3D of_node_get(dev->parent->of_node);

[Severity: Medium]
Does this leak the OF node reference? The probe function explicitly
acquires the node with of_node_get() and assigns it to dev->of_node,
but there is no corresponding cleanup mechanism.

Since there is no .remove callback or devm action registered to call
of_node_put(), and the driver core does not automatically drop
references assigned directly to dev->of_node in this manner, the
reference count appears to leak every time the driver is unbound.

> +
> +	if (!id)
> +		return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-add-mcu-fa=
n-khadas-vim4-v12-0-497cd543a148@aliel.fr?part=3D4
