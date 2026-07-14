Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A972E35E1AC;
	Tue, 14 Jul 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049885; cv=none; b=Jcn5zkthDKuhShBTFwG8jnmTiAO/HGGQv+5UX5tILfI587gJLo/PpOgJwXE28+z75gYf+OG4JdRajfEBm75NI57idlRuTFhTBgkbSXg8jWwvKzbgdMNQThvP+3IR1LJFHeZS7fzV8+SQr3ruYlHOeqPg+CcChlYW8h83ckab+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049885; c=relaxed/simple;
	bh=A2RXnB6k5hIFxvjAC7nXy+lImuD1tOqqeTSimjiHZLA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iSzzquqNz1maiqbLAiJtDE4BRXZJoa67By18Xu6rkNLYUHy9wEOx3addFY3dFteDUhQ9/0lrliM3Xnm7YujiPFbkQhyHvquMD42iJpRUYwVaKv1rLsCc++YDExl1cVwiVaPpo4v32Wr91EmO7ZyKVz+6Jezbv2h8eFP/VdHtIR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCdHXRIq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCdHXRIq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080241F00A3D;
	Tue, 14 Jul 2026 17:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784049884;
	bh=BK7ySUrlWNos3wbks6fvBjJt3enm7gjfZ58bNHqecpU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eCdHXRIqgJyR73v2s1szpgXWZvFt5IIvwQhnHlaw1Z+wDNtpNmUrKs3ClPCjLhnpU
	 6c13EYPfLLlM2O2AVER14SYMNDGSM/Zq8Usqnf6hgZeonyE2EVZLU1IoZDEKkpOeBo
	 UiKnhXEaLAZcfrvo38VOxxkx3oljluDQdWA4ciL9fFb5GJgiJyoJpDpIg5JwVTC4mw
	 95+XIZJ3QhS3RUFdEAAKTJXV1k+Xe60nEbodojmoHv6vCpfZSQEn0judk91gg7EgEd
	 P3YEgycM2BnrSwgLw9qMVzq33COv1yJBvMHhv5nqLxiaQpfyWnE2/An1wiguFgGDgr
	 IqHe6eBsPn9vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child
 cell
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-9-e7453c548c21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 17:24:42 +0000
Message-Id: <20260714172443.080241F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The probe function `psci_mfd_probe` ignores the return value of `d=
evm_mfd_add_devices()` for the `psci_reboot_mode_cell` child device, violat=
ing the MFD subsystem guideline requiring probe failures to be propagated a=
nd unwound.
--

--- Patch [9]: [PATCH v23 09/13] mfd: psci-mfd: Add psci-reboot-mode child =
cell ---
commit 73724460c58fad980d9dd8ef39b9485acffad30e
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

mfd: psci-mfd: Add psci-reboot-mode child cell

This commit adds the psci-reboot-mode child cell to the psci-mfd driver.=20
It retrieves the reboot-mode firmware node and registers the new cell=20
using devm_mfd_add_devices if the node is present.

> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> index 7affd6bb09dd8..8c6b78ac471bf 100644
> --- a/drivers/mfd/psci-mfd.c
> +++ b/drivers/mfd/psci-mfd.c

[ ... ]

> @@ -14,10 +15,37 @@ static const struct mfd_cell psci_cells[] =3D {
>  	},
>  };
> =20
> +static const struct mfd_cell psci_reboot_mode_cell[] =3D {
> +	{
> +		.name =3D "psci-reboot-mode",
> +		.named_fwnode =3D "reboot-mode",
> +	},
> +};
> +
>  static int psci_mfd_probe(struct platform_device *pdev)
>  {
> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	ret =3D devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cell=
s,
>  				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
> +	if (ret)
> +		return ret;
> +
> +	fwnode =3D device_get_named_child_node(&pdev->dev, "reboot-mode");
> +	if (!fwnode)
> +		return 0;
> +
> +	fwnode_handle_put(fwnode);
> +
> +	ret =3D devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				   psci_reboot_mode_cell,
> +				   ARRAY_SIZE(psci_reboot_mode_cell),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret=
);
> +
> +	return 0;

[Severity: High]
Should this propagate the error code instead of returning 0?

The MFD subsystem guidelines specify that if a child device fails to regist=
er
during probe, the entire probe must fail and unwind previously registered
children. By returning 0 here, the MFD device is left in a partially
initialized state if the psci-reboot-mode cell fails to register.

>  }
> =20
>  static const struct of_device_id psci_mfd_of_match[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-arm-psci-s=
ystem_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com?part=3D9
