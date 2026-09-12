Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6D54A35
	for <mfd@lists.linux.dev>; Sat, 12 Sep 2026 19:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240892; cv=none; b=AdHY6QVLyxMdr/b1hvSKrCQW9kYAdpRfXMhZzHA8SV7S8hmbiDXIAnGXf1hITY7B8Ti87DjnypVJhV0dipm3Tjy5LO3NcJQlcpHdjeJ2NmSUa/Fj67SBOrr/jQUCvWOAHInfPnjsD1XKBFYVDfUkw5YijNWn04s53JlOaQri0GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240892; c=relaxed/simple;
	bh=eNVAkuJUSHayW4brFdae+ZpoSYVIZX6qGOQ53HVNpjc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QppbgNnpYjorGHA8lkekHz1rnRrVL8zoL1d3Lt5MHTrHO2O5dayyuV0CWMxdpdoVgqddNK47Uj6UnxsNxJvoMzfgubK85MT9khZLnpA60+FkQDqtogvvleYAOdFTWssPsSuDIYQROMWKWJuKp3LumsyAdsABmJzt5YrC+TrTFpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOq05LDI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOq05LDI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2912F1F00893;
	Sat, 12 Sep 2026 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789240890;
	bh=Q3FvRxqorX5Zl5sL7fwdVdHPbrfso3XyXeBibXz60RQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mOq05LDIXjvO0tEgYbWWYLq9oNSPsEoUSnioONbxN6ttBc+ltbN2mA9WUZbEd5Kej
	 0McGimGdYof94NAcMxU8n8zPG8QM+S5eghyHy7ZrJQptM2OIgc1iIa2I5JEtaJBP6H
	 rsCK+BrxNIiCKSJBdiYDNXulJ2+o47a88lNhRJ3vA23Qdnnc3Xg4NzRV+r871OHHzm
	 JoBnv1e1LAD5IXi5gtGyN6plFvprm77wbXPtFjmeb/QJTSbV/Qc9DllImnIoH9bZ6G
	 YWV2fDeC4S3/tfHY3+CdeS864Yu0/8kzWsf5Iuo4/KPDPQTTW+/eBlHcHG3UOc8wia
	 VeRGdFIHR57pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: intel_quark_i2c_gpio: manage the fixed-rate clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260912191223.46136-1-mhun512@gmail.com>
References: <20260912191223.46136-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 19:21:29 +0000
Message-Id: <20260912192130.2912F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Commit Message Guideline Violation

Pre-existing issues:
- [High] Data Race / Global State Mutation in PCI probe path
--

commit 963e47fef2beb8ea997a39b28407399109b523e7
Author: Myeonghun Pak <mhun512@gmail.com>

mfd: intel_quark_i2c_gpio: manage the fixed-rate clock

This commit transitions the I2C clock provider to use managed resource
functions like devm_clk_hw_register_fixed_rate. It removes the manual clock
cleanup functions and the private data structure previously used for tracki=
ng.

> mfd: intel_quark_i2c_gpio: manage the fixed-rate clock

[Severity: Low]
This isn't a bug introduced by this patch, but the MFD subsystem guidelines
mandate that the description after the subsystem prefix must be capitalized.

Should the title be "mfd: intel_quark_i2c_gpio: Manage the fixed-rate clock"
to align with subsystem formatting rules?

> diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark=
_i2c_gpio.c
> index 9b9c76bd067b8..443a1a0cf7778 100644
> --- a/drivers/mfd/intel_quark_i2c_gpio.c
> +++ b/drivers/mfd/intel_quark_i2c_gpio.c

[ ... ]

> @@ -260,7 +223,7 @@ static int intel_quark_mfd_probe(struct pci_dev *pdev,
>  	/* This driver only requires 1 IRQ vector */
>  	ret =3D pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
>  	if (ret < 0)
> -		goto err_unregister_i2c_clk;
> +		return ret;
> =20
>  	ret =3D intel_quark_i2c_setup(pdev);

[Severity: High]
This is a pre-existing issue, but intel_quark_i2c_setup() mutates global
arrays during the PCI device probe.

If multiple instances of this PCI device are probed concurrently, will their
probe functions simultaneously overwrite the global static intel_quark_i2c_=
res
and intel_quark_mfd_cells arrays?

drivers/mfd/intel_quark_i2c_gpio.c:intel_quark_i2c_setup() {
    ...
    res[INTEL_QUARK_IORES_MEM].start =3D pci_resource_start(pdev, MFD_I2C_B=
AR);
    ...
    cell->swnode =3D &intel_quark_i2c_controller_standard_node;
    ...
}

Does this data race lead to data corruption of PCI resource mappings and ce=
ll
configurations, causing incorrect hardware memory addresses to be used if t=
he
driver binds to multiple devices?

>  	if (ret)
>  		goto err_free_irq_vectors;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912191223.4613=
6-1-mhun512@gmail.com?part=3D1
