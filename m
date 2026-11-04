Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816950;
	b=GVW643jhOnxq7lnvIifdv6xGB1vZEKQMWUhUK2gfOH2431oVI1H6JF4Z+58UC+KlNl4M
	 0NDtRwV7naKzHpDIko3uoV9gm8VYwqvJfACNf1S9UN4s4XRn6axcUo9eBr/xhhhiI1/Sp
	 dtfkE/Q7Rt2EczTBiGrQSv65Ub9LzfIxVzyjssXuEkBHp2DwYjHSc6YI03+zqfi62BWyP
	 mdBVmKUQujjWy9kXPlZJXq24uFjKk8Sl12wTFdX0MfmQnB/Xqxa86vwh8o3WGiHm4j2hi
	 ewqAuop65M0zThlb+FRLFYM62i7erTnQLTN20QU5Xq/8FGoXB4kejFou1Ikwt/dp49A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816950;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SFJwlUyqlnW4DRbVzxxL9VU7f1wu/pDUPInWa0d30zE=;
	b=shDe6bycVcKGJfZFyFy9BIVfITMHV8SCU6SHl9LQZ1BhAi/KOC29N1HUhU5qT1mD0Jox
	 B4lIbWr/2hXqcd4yYFnueClikgvbEFp4OmxGQv4/cvJIaCiX2tkfiTxb30kw3ADjY92bP
	 iZAFbKSIw6KGPIsYKZBqKbWmPYwfxiu80uEyknJvpF1hnXknBmtqTocEetDZ5y+qPYSMu
	 864gAuPYsWrZBqi5xrmkqljqpOPiilfTvp9P5+5iIzYoMY3fkM0vlIe2/0pNEtAuHDL5M
	 JZ+aGbpWcNVo88ysMRWCJiWO7MmudJ/+czYZNLEHVr9ZQG1svnBsvNPCFYp+vRAmxAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=VeZgqkQh;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A83606A31B
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 18:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A83606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=VeZgqkQh
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xOfjJ-000000022oO-21Ik;
	Wed, 04 Nov 2026 19:29:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=SFJwlUyqlnW4DRbVzxxL9VU7f1wu/pDUPInWa0d30zE=; t=1793816941; x=1795026541; 
	b=VeZgqkQhKf5KuTM6IjrnUlvvNLP/i7wBO84ZgfcPGkl28xz1JMnm3odlVKau9r2zNGUHWtAe01y
	nNY6GU8gXC3JzRGo3i7uJzrNafVWKxAIxQqIjphGEFGHtdfQzO/QJQIshUnB/tym3et+XJnG4eyCz
	oyTopQ+rwrz6gMbWMR3hl3nxV11M5xTllyPy9TPHRfAfyA+WmLU6oMPSaz0E7JfdqYOghiIHj5QOW
	MIh+tEjcx7HgujT8u1tDQ1gxOMM7ArYvRlMe4qInWLS9XZ3vi6mQItn4Ie4959aVSHmhUkfT+Ix9V
	gIGSLtImSx/XEv16oB1r3nDg2Voxw38QLurA==;
Date: Wed, 4 Nov 2026 19:28:45 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Alistair
 Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] regulator: sy7636a: bind to the I2C device
 directly
Message-ID: <20261104192845.41b086ea@kemnade.info>
In-Reply-To: <20261101223125.302001-7-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
	<20261101223125.302001-7-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  1 Nov 2026 22:31:24 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

[...]
> -	ret = devm_regulator_get_enable_optional(&pdev->dev, "vin");
> +	ret = devm_regulator_get_enable_optional(dev, "vin");
>  	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> +		return dev_err_probe(dev, ret,
>  				     "failed to get vin regulator\n");
>  
we need that regulator enabled for i2c access, if Patch 5 is merged before
this it will happily try to access the device without it being accessible.

But it then is just another error code than ENODATA.

So if that is considered harmful,  probably this patch needs to be reordered.

[...]
> --- a/include/linux/mfd/sy7636a.h
> +++ /dev/null

but if it goes in first, this part will make trouble.

Regards,
Andreas

> @@ -1,34 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Functions to access SY3686A power management chip.
> - *
> - * Copyright (C) 2021 reMarkable AS - http://www.remarkable.com/
> - */
> -
> -#ifndef __MFD_SY7636A_H
> -#define __MFD_SY7636A_H
> -
> -#define SY7636A_REG_OPERATION_MODE_CRL		0x00
> -/* It is set if a gpio is used to control the regulator */
> -#define SY7636A_OPERATION_MODE_CRL_VCOMCTL	BIT(6)
> -#define SY7636A_OPERATION_MODE_CRL_ONOFF	BIT(7)
> -#define SY7636A_REG_VCOM_ADJUST_CTRL_L		0x01
> -#define SY7636A_REG_VCOM_ADJUST_CTRL_H		0x02
> -#define SY7636A_REG_VCOM_ADJUST_CTRL_MASK	0x01ff
> -#define SY7636A_REG_VLDO_VOLTAGE_ADJULST_CTRL	0x03
> -#define SY7636A_REG_POWER_ON_DELAY_TIME		0x06
> -#define SY7636A_REG_FAULT_FLAG			0x07
> -#define SY7636A_FAULT_FLAG_PG			BIT(0)
> -#define SY7636A_REG_TERMISTOR_READOUT		0x08
> -
> -#define SY7636A_REG_MAX				0x08
> -
> -#define VCOM_ADJUST_CTRL_MASK	0x1ff
> -// Used to shift the high byte
> -#define VCOM_ADJUST_CTRL_SHIFT	8
> -// Used to scale from VCOM_ADJUST_CTRL to mv
> -#define VCOM_ADJUST_CTRL_SCAL	10000
> -
> -#define FAULT_FLAG_SHIFT	1
> -
> -#endif /* __LINUX_MFD_SY7636A_H */

