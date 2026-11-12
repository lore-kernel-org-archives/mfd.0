Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488183;
	b=MYHIaPvx9YDLp1XTD7M4pHxrrk5qsUL3XqDHTmNahJ5EJSrCW4oi9EU9sGOe3r7qBQ3v
	 JIlukFSjn2I6hv7n//gWBZkPgNkQt5mq1wCGkD9DrZs1e0//PSwJlOZ3iIA6cWo8zqyKt
	 6DxYlmC00dPppSXHPnG37m2y2TkFQmxSk+JqyCBdngHQ6FbOgOATgjVSeNbYrneeVKKSM
	 iJM7m6iuMI8K2s63S2otCBLxD7Dvj+RXprApasOdWv7THcjkbY98mx5lAuLEhUFwpZt7R
	 sC5svcMcJiLtewj8x0gTePDsz3EpusFmTrTxYDoOzijlO6TLxWPWzn7nRRJlgXH75Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488183;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r7yyic0ssd9BOT+OJ8UcxW2Pq7XNCgARbsSkcrQ+aKY=;
	b=AhNhMvIjKxTCgRNnOjljxJjmutcMGpnoNrHq2Kcm92hyiCPHtnSUkpG8TxSNuUpKMXEC
	 SELpzOsQdFIjFvFMPecRNRlEKb+AttBBW36r+gu5tEpSkt2IEizE+L+UvCVVEuXpHcOCb
	 +Hl3I13pLHn94dAn01UMe//dMoJApqtvMdGCfXX4bTEsc16oN9Q1rjLeY57I5e5cuu6kj
	 9xgkPwn4PUjzs/H2eObbTPcX7I7q4LCJXVor3mgcsnpdqPD5SeHaDpDJFCNrm/VB7FmWJ
	 uUX+rfVqLJJZr+4Ld7PcK0lqGlNjgHBFpf9zMsTsoojIy60tfbWNPkntbnJp6usApOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VT9m84Uj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB67606A33E
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 12:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VT9m84Uj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24BE1F00A05;
	Thu, 12 Nov 2026 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488183;
	bh=r7yyic0ssd9BOT+OJ8UcxW2Pq7XNCgARbsSkcrQ+aKY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VT9m84UjGxroYhSj0zHqdI7LdbaiWN3e/jmVbSxQBZPdvkhbzSVq9OQDbzI9Wm17R
	 Ibx5d/yPj1MfsLoIbbK3V0vWBJ1Wj8MZYair8HsYAGaolx4nYBR6oXEUSBQtEf8ulY
	 PfiK0XDWR/rx0mWEiTOVUBuDNnAOpquGi6dlV3Hd1WySbsMIo1sK+dl5h3H1nyYKN5
	 pi3+81W63wtvsTmHao1ilBWvH7MHyA9J4NEIZpyLs8X9Ro0YlT4P9HBiWOJW0UmIb2
	 N6DvOB9BSwETps9ysWJpXOsLJWPqqjDp08BZPixSHJwp8teIrFuRGbavpeb+c7wmGH
	 L35v5IlNpTYjQ==
Message-ID: <sashiko-outbox-211123@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 2/4] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, lee@kernel.org
In-Reply-To: <20261112124437.3367252-3-lakshay.piplani@nxp.com>
References: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
 <20261112124437.3367252-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:56:22 +0000
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
- [Medium] regulator: p3h2x4x: OF node leak in p3h2x4x_regulator_probe()
--

commit 0c22fd7becea5c3dad0894cb83a63e3d27c04c45
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub

This commit adds a regulator driver for the four on-die LDOs in the NXP
P3H2x4x I3C hub family, registered as a child of the MFD device.

> diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regu=
lator/p3h2840_i3c_hub_regulator.c
> new file mode 100644
> index 0000000000000..244f2a4f70f38
> --- /dev/null
> +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c

[ ... ]

> +static int p3h2x4x_regulator_probe(struct platform_device *pdev)
> +{
> +	struct p3h2x4x *p3h2x4x =3D dev_get_drvdata(pdev->dev.parent);
> +	struct p3h2x4x_regulator_dev *p3h2x4x_regulator;
> +	struct regulator_config rcfg =3D { };
> +	struct device *dev =3D &pdev->dev;
> +	struct regulator_dev *rdev;
> +	int i;
> +
> +	p3h2x4x_regulator =3D devm_kzalloc(dev, sizeof(*p3h2x4x_regulator), GFP=
_KERNEL);
> +	if (!p3h2x4x_regulator)
> +		return -ENOMEM;
> +
> +	p3h2x4x_regulator->p3h2x4x =3D p3h2x4x;
> +	p3h2x4x_regulator->regmap =3D p3h2x4x->regmap;
> +
> +	platform_set_drvdata(pdev, p3h2x4x_regulator);
> +
> +	device_set_of_node_from_dev(dev, dev->parent);

[Severity: Medium]
Does calling device_set_of_node_from_dev() here leak a reference on
dev->parent->of_node when pdev is unregistered?

The MFD cell for p3h2x4x-regulator does not set of_compatible or swnode, so
mfd_add_device() allocates pdev with dev.fwnode set to NULL.
device_set_of_node_from_dev() takes a reference on dev->parent->of_node and
assigns dev->of_node without updating dev->fwnode, whereas
platform_device_release() drops the firmware node reference via
fwnode_handle_put(pa->pdev.dev.fwnode).

Using platform_device_set_of_node_from_dev(pdev, dev->parent) sets both
dev.of_node and dev.fwnode so platform_device_release() balances the
reference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112124437.3367=
252-1-lakshay.piplani@nxp.com?part=3D2
