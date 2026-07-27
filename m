Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254A44322F5;
	Mon, 27 Jul 2026 18:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177717; cv=none; b=Ybp2KUtEtLybVzt0l72gCgc3aGAIi1qFwM27zj4p5PmcGvlzlq4aJkK3sHLSTNSFr6uVjp/9cwSIDd4xssLo4GIm/PV6MwWdG6RZhdUaWLy6k8cG68BKhuilB99xyuLdZxVQn0dkEAXoyJ6jK5Bo249O6u9kF7tS1laTZ8WLIPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177717; c=relaxed/simple;
	bh=0waXHSCkdc6qGkQn0Rfbge2g3yHCPz5zX/LnQCiCMu4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WFbZ9ItJKkSbHg/Gm60ygZZUmDx/74xxr2wZzIC6mpARfHn6lKNGc+4v0Dj5lY/qbl6u1GW8rr8E9pbtmaLv1VLHJ0e7olRCXj7N58bUToDNGaD1pGD8H8r/IYefK/GXaxDmeLMcr6Lz/h2wK806S+4lsg4iIPwzAQAf7cphvNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxsBMgah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxsBMgah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0A61F000E9;
	Mon, 27 Jul 2026 18:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785177715;
	bh=TSVobNmrXXu+kac7ZH9ObOxx67WPbQQXF2FB/eSluCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bxsBMgahd0Kr4buxlH0w4fb3Tetr+pDy2p9gwZgD/3pEIvy6xss5qY1XFPCxupI0O
	 nWOuYiUyTXzz00DZCGJSMSNmLU1p06Lt8DGPWKcsqy9ImxHtLm6odTUwHxUlS62jr3
	 qt5JHkMLHyLn74XWh0o1ly5vsdQkKckJFElnChhfcr8bk6DzyLeHIhI7qHKeKIrVk8
	 8uAMi+rRMSbIJyN9JLJmicbvuTf40euklLQ5Ta1Bp81ZNhoRLAfOriY6A1qSf18Szg
	 lzrYTXz/f95GN+Lvro+8atnof/f4s8Tfh5vA5jOA6hOizwKFpVzpvkIvMaaPw7Ye9e
	 shFKn4xpjeybg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, olteanv@gmail.com, conor+dt@kernel.org, lee@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260727-zx29clk-v8-4-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-4-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:41:54 +0000
Message-Id: <20260727184155.2F0A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Platform data for child devices (`mfd_cell` arrays) is improperl=
y passed as complex pointers via the `.data` field of the `of_device_id` ma=
tch table.
--

--- Patch [4]: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD =
driver ---
commit 997b3ee44abc6ec239c36327d1c3fd90393542dd
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

mfd: zx297520v3: Add a clock and reset MFD driver

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

> diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v=
3-crm.c
> new file mode 100644
> index 0000000000000..3a4f6cd0756e3
> --- /dev/null
> +++ b/drivers/mfd/zte-zx297520v3-crm.c

[ ... ]

> +static int zx297520v3_crm_probe(struct platform_device *pdev)
> +{
> +	const struct zx297520v3_crm_data *data;
> +
> +	data =3D of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, data->cell=
s,
> +				    data->num_cells, NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id of_match_zx297520v3_crm[] =3D {
> +	{ .compatible =3D "zte,zx297520v3-topcrm", .data =3D &zx297520v3_topcrm=
_data },
> +	{ .compatible =3D "zte,zx297520v3-matrixcrm", .data =3D &zx297520v3_mat=
rixcrm_data },
> +	{ .compatible =3D "zte,zx297520v3-lspcrm", .data =3D &zx297520v3_lspcrm=
_data },

[Severity: Medium]
Does passing platform data for child devices via the .data field as complex
pointers violate MFD subsystem architecture guidelines?

Instead of mapping compatible strings directly to zx297520v3_crm_data point=
ers
via the .data field, should this use an ID enum or integer ID, and have
zx297520v3_crm_probe() switch on the ID to select the correct static const
mfd_cell array?

> +	{ }
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D4
