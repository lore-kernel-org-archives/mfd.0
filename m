Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CD137106E;
	Mon,  3 Aug 2026 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751225; cv=none; b=KJzYX4mfpTmKoh7q7OUqoZmSbx3eMTa5UrBKt/UrqG7drM/xGZuVKBsJzyrrTkEn7GJE7Nf94ojSLDIxct6eoVSMmzaySGvSzLec7QfPKcvl6a3z1p2XH/kuN3P2tKW5kUGoAU00Ge8jDq6qMIQWEOQbmHI8S7llAk388n7QuN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751225; c=relaxed/simple;
	bh=9N86zhQ4eHlwVu8ONQ1O47axnKpFnkJHgYFuLWcPJuE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t7+v8ytTUCgGYT9Lmz2tNtnpSFDCirPuhYUFzq7SFgk2+a9wFefMAltNi99gm5+R1W+WUc5We2mLe0M/fFAvVSGMTknhJ3IW6k5NiJlhdB+NdYw3446dZA9+QD2ZD2JWtG/b3yW7SNTjcOmmX+ErezAMvhbEMQnT7RlO95QcsQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jL748+hq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jL748+hq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA1C1F00A3A;
	Mon,  3 Aug 2026 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751223;
	bh=sSi+Cog5FLF2MAZzsQBbDzybhZsCaSzUjja3124AXNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jL748+hqF8D0VA9CnJLwDvtkvsPx02MDYfN0lGsFk7yzAaOZKqZ9Xr19jXStoJLd+
	 dIMuatL0flXaQVQ/q5bmynSG3GdvVcRJ15MLAhum1Di/22WLTiDuCyvGcfZ+ds7glv
	 3ir1RT8U/IK1vP4bmFLg0ijrzY+tgJLTFCvVpKJLrbQ3TL6wHequOxBiaK2gIhWr0B
	 TJ6KWgxycErzj81OF3dEOpKgPapKa4xgf1hi/Vmig5lqST9psZxaJO6x8qAGAOQHvu
	 YepmWtkfjVIB++11ByosmDHuBGfLfhbCBZ9YnZhhlWG9/12gxdt2WmD4tSpDyHLgNz
	 N9vm5w6STLjsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:00:22 +0000
Message-Id: <20260803100023.7AA1C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The new `psci-mfd` driver lacks a `.remove` callback and does no=
t set `.suppress_bind_attrs =3D true`, allowing manual unbinding via sysfs =
which leads to resource leaks.
- [Low] The newly introduced MFD driver, its file, and its structures inclu=
de the string 'mfd' in their names, violating subsystem conventions.
--

--- Patch [4]: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for cpu=
idle-psci-domain cell ---
commit 26907aee3ff3e0a5d7112a9be25ebbebb10e94c7
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell

This commit introduces a new PSCI MFD driver to manage multiple consumers of
the PSCI device node. It registers the cpuidle-psci-domain as a child cell
and updates the cpuidle driver to probe as an MFD child.

> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> new file mode 100644
> index 0000000000000..7affd6bb09dd8
> --- /dev/null
> +++ b/drivers/mfd/psci-mfd.c
[ ... ]
> +static struct platform_driver psci_mfd_driver =3D {
> +	.probe =3D psci_mfd_probe,
> +	.driver =3D {
> +		.name =3D "psci-mfd",

[Severity: Low]
This isn't a bug, but does naming the driver and struct with the "mfd"
string violate the MFD subsystem guidelines?

The MFD guidelines state not to hard-code implementation details in driver,
struct, or device names, and to specifically avoid including the string
"mfd" or the driver's own filename in names.

[Severity: Medium]
Since there is no .remove callback provided in psci_mfd_driver, does this
allow manual sysfs unbinding that could leak resources?

If a user unbinds the driver via sysfs, devres will destroy the child
devices. Because the child driver (psci-cpuidle-domain) lacks proper
cleanup for non-devm resources like generic PM domains, those resources
might leak or leave dangling pointers on this administrative path.

Should .suppress_bind_attrs =3D true be set in the driver struct to prevent
unsupported sysfs unbinding?

> +		.of_match_table =3D psci_mfd_of_match,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D4
