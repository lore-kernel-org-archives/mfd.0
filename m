Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332935;
	b=GfB0Ct8o/l3vW1fw6FMlaTwL3n8L+1mvJxUIpC+vXkK1GDN8YiDhx6FgANVHXng6Mllb
	 2JxMOPFNjhRBlLxpZW684iOLL6++qTVTwgXC+VFESEtSjJkqeizXfuFoWbQpQbXMYxOj/
	 uy3mx+e6VDwhK0WSbevO6jW0VBFqCUq7E6rM/1ti0iPZVF47hWt4JAHNad7MmTvT1ooYI
	 dFiyNRm0HjKLnqL7HCQ1tU3PS0/L31dSE2zeHqf9kULeRkqKqIETjVPTk7YcJUM39izHt
	 sVO7LkHFiw3aPMthqoW6NXb+UpylndPR017FkSsQ2ohe4vlFojkPIXhGXoLwpfFZ9AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332935;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F/koDt2K3K6BZUHZZCqJj7tJh9tctbhpPbDPTbRpAW4=;
	b=nEDfwRdIr7/mP6HmXXgCsdK90FvZXNZjVpmTIhb6AlFUosgU/DAHWHfUX6YizMUx24FA
	 8Ed6UAdvszRognWUTu4KX+Be7pXSJojxE+oGBW6psPjZXW+DUXlXje0XvJklHUBLIb38W
	 TNUF0ELy0Z107hS2pbIUI3Qvp2qku1vE5Gl+9HeGIDfLdN+pBbi52YdQzmSVKFx5eYGFc
	 3AlIusUGSDEbbEpsEnNf4RZ8tDtE3siPo8r2i5ci803S0fzB7HCL8EDqwkX3/H1NuLEUo
	 1YhdOqNu9MN1lzPafJaa9EQTbyhp1h7QQp+48MX08lrsJgHnjxpXnXpqyNdWl/QRdXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W/BIhodQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACCA606A325
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W/BIhodQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90831F0089F;
	Tue, 10 Nov 2026 17:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332934;
	bh=F/koDt2K3K6BZUHZZCqJj7tJh9tctbhpPbDPTbRpAW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W/BIhodQBVd2G67nFK//i/ihf/ubZiq0B1CUC+9+3/2WjFhYbZ1icQYHIWiwcIHgu
	 0TJqXmPHk83Pphk/1n5+EIG5I3tee4vncIVMDTVfn+I7o282oSOiHZWeHFujqqZQzK
	 zr3KUXSiOKYtRm59jPFpeFrVP3XAeLvQQ/9egxLu6KeM4IuncAXXBfN7NI4vHOjIXd
	 dHyVqbQYArIlF+K6LayYTACdpn0/UTE6wxHr6BsB3Za+45W31h0lV7yFMC+pTZbSAg
	 mKEm9cp3rvNDuTAQygYLeUO+GlMzKr2z3RZ1bp8myK2K6cB/hbg+aD5Nhq3pjy4XXr
	 Z48cDicq701Sg==
Message-ID: <sashiko-outbox-207517@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: mt6397: Use PMIC specific interrupt count for
 domain creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Grisdale" <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110-mt6397-irq-num-fix-v1-1-81d17454194e@protonmail.ch>
References: <20261110-mt6397-irq-num-fix-v1-1-81d17454194e@protonmail.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:48:54 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] mfd: mt6397: missing PM notifier cleanup on probe error and
  driver unbind [1]
--

commit 480f1419d4a2b566e7d2f2170ec4ccedc20463c7
Author: Ben Grisdale <bengris32@protonmail.ch>

mfd: mt6397: Use PMIC specific interrupt count for domain creation

This commit passes the PMIC-specific interrupt count to
irq_domain_create_linear() in mt6397_irq_init() instead of hardcoding
MT6397_IRQ_NR, and defines MT6328_IRQ_STATUS_NR for MT6328.

> diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
> index 5d2e5459f7444..783be9f5c9c36 100644
> --- a/drivers/mfd/mt6397-irq.c
> +++ b/drivers/mfd/mt6397-irq.c

[ ... ]

> @@ -216,7 +221,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
>  		regmap_write(chip->regmap, chip->int_con[2], 0x0);
> =20
>  	chip->pm_nb.notifier_call =3D mt6397_irq_pm_notifier;
> -	chip->irq_domain =3D irq_domain_create_linear(dev_fwnode(chip->dev), MT=
6397_IRQ_NR,
> +	chip->irq_domain =3D irq_domain_create_linear(dev_fwnode(chip->dev), ir=
q_num,
>  						    &mt6397_irq_domain_ops, chip);
>  	if (!chip->irq_domain) {
>  		dev_err(chip->dev, "could not create irq domain\n");

[Severity: Critical]
This problem wasn't introduced by this patch, but does mt6397_irq_init()
leave chip->pm_nb registered in the global PM notifier chain [1] on
probe error or driver unbind?

mt6397_irq_init() registers chip->pm_nb via the unmanaged
register_pm_notifier() while chip itself is allocated with devm_kzalloc() in
mt6397_probe().  If devm_mfd_add_devices() fails in mt6397_probe(), only
pmic->irq_domain is removed, and mt6397_driver has no .remove callback:

drivers/mfd/mt6397-core.c:mt6397_probe() {
    ...
	ret =3D devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
				   pmic_core->cells, pmic_core->cell_size,
				   NULL, 0, pmic->irq_domain);
	if (ret) {
		irq_domain_remove(pmic->irq_domain);
		dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);
	}

	return ret;
}

When devres frees pmic after a failed probe or device unbind, a subsequent
suspend or resume transition dereferences the freed chip->pm_nb block,
causing a use-after-free.

[1] https://sashiko.dev/#/bug/linux-edb62fbc-213a-49a2-be55-c002e234e554

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-mt6397-irq=
-num-fix-v1-1-81d17454194e@protonmail.ch?part=3D1
