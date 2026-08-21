Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694422A817
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787284226; cv=none; b=CCzFzalo1bJsqw6ZE+/B1CcVlUqFb6JI8u2Pf/I/wXY8oC9h9arYh7H4UMLvVCyHvjwvQyeNLwMYkSmchaZRdH3Muy0Hf5bvKGczs5YCMEgzfKnvF0LC46f3gOZlFMubGkK0D794fcWcTuiXt34j8U0PX7mgFp+WE2WyRKNQJqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787284226; c=relaxed/simple;
	bh=tCyvVJ+grNPADWm/P9E/gIj7FoUShVv7XaCX3IRGuRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X4BzRkJueWl5k/VmxlSXxXR7E0OxoN4udesjmwp4cEOGWrdAUbml6pejka2iFAA8d1l8QlK34uhFJJoP5KlJiaEKa6Ou9tK9a5jQT5mddjVCOogsZWKtmvazr/X9kvJ7JLXy5FdydtvcuhRvdpkMh85uAhsKnnIsS4cL8MXAxzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMfDJZU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMfDJZU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5EC1F000E9;
	Fri, 21 Aug 2026 03:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787284225;
	bh=7ByZ7XF93PmJ9jTFGppmK4x2wB7RD47Cx92VDr3NSC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iMfDJZU2I6npwJ52M4He2Za9mo6ok2gclL01e0Lt07CqDOW32I/00ROPHUWbCPg2g
	 msGKyhvkO+NWyFZAsXEKpi///Ca0JUFo3qXCmnKSfTRRTnOGnRUWCSbqNSspuEkkys
	 6XPtgruSGLAMXyieCYmPDBxdJyLITeLenDYu0fBFL4e1a4jiYU+mgE/OVm7My47cUQ
	 tMKKE4hT8ZBex1h0RH6gBfE/L+oOhY9prMOSkXnzqosB/W6zrkOp2rkxFuaLWU1rzl
	 7p0RyJtSRr7/pjI/3EMXkiNeOBl+5ARDxsHKEV4Hv23yCHrJt6/GqyDV2iC5FpV4PQ
	 KO3TpIG6p8/2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/10] mfd: nct6694: Add Host Interface (HIF) eSPI
 transport driver
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821033505.4017901-11-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-11-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 03:50:24 +0000
Message-Id: <20260821035025.3E5EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Requesting a shared, oneshot threaded IRQ without a primary handle=
r will be rejected by the IRQ core and degrade system performance if bypass=
ed.
- [High] The IRQ handler is unregistered after the IRQ domain is destroyed,=
 creating a window for a Use-After-Free of the domain pointer during teardo=
wn.
--

--- Patch [10]: [PATCH v7 10/10] mfd: nct6694: Add Host Interface (HIF) eSP=
I transport driver ---
commit fca991565f4ea259d4b5653b4e67f56e5a45bdd9
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Add Host Interface (HIF) eSPI transport driver

This commit adds support for the Host Interface (HIF) transport via eSPI
for the Nuvoton NCT6694 peripheral expander. It initializes the Super-I/O
and provides a regmap_bus implementation.

> diff --git a/drivers/mfd/nct6694-hif.c b/drivers/mfd/nct6694-hif.c
> new file mode 100644
> index 0000000000000..198838d3e7d87
> --- /dev/null
> +++ b/drivers/mfd/nct6694-hif.c
[ ... ]
> @@ -546,12 +546,12 @@ static int nct6694_hif_probe(struct platform_device=
 *pdev)
>  	platform_set_drvdata(pdev, nct6694);
> =20
>  	/* Request the interrupt first so that devres releases it last */
>  	ret =3D devm_request_threaded_irq(dev, irq, NULL, nct6694_hif_irq_handl=
er,
>  					IRQF_ONESHOT | IRQF_SHARED,
>  					dev_name(dev), nct6694);

[Severity: High]
Will this probe unconditionally fail with -EINVAL?

The IRQ subsystem typically rejects devm_request_threaded_irq() with
IRQF_SHARED | IRQF_ONESHOT if there is no primary handler, because it cannot
determine if the interrupt originated from this device before masking the
shared line.

[Severity: High]
Can this devres ordering lead to a use-after-free of nct6694->domain
during driver unbind?

Because the threaded IRQ is requested before the core is probed, devres will
release it last. During unbind, devres will execute actions in reverse orde=
r:

1. nct6694_hif_irq_disable() executes, masking the interrupt but not cleari=
ng
   pending status.
2. nct6694_hif_core_remove_action() executes, destroying the IRQ domain:

drivers/mfd/nct6694-core.c:nct6694_core_remove() {
    ...
    irq_domain_remove(nct6694->domain);
    ...
}

If another device sharing this IRQ line triggers an interrupt before devres
finally unregisters this handler, won't nct6694_hif_irq_handler() execute,
see a pending status, and dereference the freed nct6694->domain in
irq_find_mapping()?

>  	if (ret)
>  		return ret;
> =20
>  	ret =3D nct6694_core_probe(dev, nct6694, nct6694_hif_devs,
>  				 ARRAY_SIZE(nct6694_hif_devs));
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821033505.4017=
901-1-a0282524688@gmail.com?part=3D10
