Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF6047F2EE
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 11:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151397; cv=none; b=s9WeJGLe0y2HMtVoIwIOme9TX/ZO1OCzl67z5x2NxGiCFoP7mYYcNWzMfYkp8qaIbUrfh6qSgU6kl3xUu6GmD98nGkykCbn07MOQZKgjTqkZK/FLNZM5ZAY8/CFh7qBvfE/Mn3pz5U4aNU6oJS6d9SGTzDAwx8mJyI90D5+osDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151397; c=relaxed/simple;
	bh=DMmDMpKAI/ji0hl7NIcGuGCUjVNkb+ncLZQSEW3WTOg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dxaOTt+y1nNCvz/ZUa2i2XuEgBQa+vhPg4VWqY8uqoAP1u+0AeCISXtFggt9/e09C+XvGcKtwKvBm/cd/CVpwsC5tAEvLjKHphWvnu/CsPdSFjr9yhiUSB785TWVluJhmjLEJ7DWmWOllv83LwPWB2DyP2N8VK95+Lf2btkkLA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyrWl/7G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyrWl/7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D551F000C4;
	Fri, 16 Oct 2026 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792151395;
	bh=0aVxGAyqYlH7nbta5vSTp958W9O9mbv15u7Zb1lIzqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UyrWl/7GlFvT7k65CcdFAzIwRWx/O6tnS3twFFdweii4sUfq5kCH//kUCkFTvDEHT
	 fhAtA4z9qJge7RWgcL9S6KjAgfDsV4dmsDzBxrRi9AwJIzwBxuKy/nBcgqCCW6HnyH
	 Z9I6GQ5LSt4NHl15meL6TxXw+EyYICQl11Fe/xsncBCh0qXIRorN5eluSbfKyMjiI9
	 91bfX7AQjGFRlNcgs12qIFpCFQT/pZ8V6sONxdr4wvAn/sn4OkqXnjYhd6hRdLuWIE
	 y0HAiPtrtvR8dXO5YGu+B1OGSmGSmVS8EJvgwbHRpUUBWh5RQ6nVaUyQN8Pmuzkc85
	 OIRrEOPoaqiQg==
Message-ID: <sashiko-outbox-174255@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] mfd: intel-lpss: Set d3hot_delay to 0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navon John Lukose" <navonjohnlukose@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261016114347.23633-1-navonjohnlukose@gmail.com>
References: <20261016114347.23633-1-navonjohnlukose@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 11:49:54 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mfd: unconditional d3hot_delay=3D0 breaks D3hot->D0 on older LPSS
--

commit 14a3fb20622240f2507d7dc10a344de95347f94a
Author: Navon John Lukose <navonjohnlukose@gmail.com>

mfd: intel-lpss: Set d3hot_delay to 0

This commit unconditionally sets the D3hot delay to 0 for all Intel LPSS
devices to optimize runtime resume times. It has been tested on Arrow Lake-H
where it significantly reduces the delay before the first touchpad report.

> diff --git a/drivers/mfd/intel-lpss-pci.c b/drivers/mfd/intel-lpss-pci.c
> index 63a3fb58566eb..5672f033e5c0e 100644
> --- a/drivers/mfd/intel-lpss-pci.c
> +++ b/drivers/mfd/intel-lpss-pci.c
> @@ -70,6 +70,7 @@ static int intel_lpss_pci_probe(struct pci_dev *pdev,
>  		info->quirks =3D quirk_pci_info->driver_data;
> =20
>  	pdev->d3cold_delay =3D 0;
> +	pdev->d3hot_delay =3D 0;

[Severity: High]
Does unconditionally clearing the standard PCI D3hot delay break D3hot to D0
transitions on older LPSS hardware?

Setting d3hot_delay =3D 0 universally across all LPSS generations (including
Broxton, Sunrise Point, Apollo Lake, etc.) skips the standard 10ms PCI PM
delay.

If older hardware controllers do not stabilize fast enough upon runtime
resume, could subsequent I2C or SPI transfers fail or time out? This might
result in unresponsive touchpads, sensors, or TPMs.

Would it be safer to restrict this 0 delay to newer verified IDs via driver
quirks?

> =20
>  	/* Probably it is enough to set this for iDMA capable devices only */
>  	pci_set_master(pdev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016114347.2363=
3-1-navonjohnlukose@gmail.com?part=3D1
