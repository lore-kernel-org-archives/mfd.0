Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8A44432F8
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431638; cv=none; b=eba5/FVCUfiqT8eiZ3vQ0eOe0TnZvmoaJwgcBFXRCCLZrGzD7BiRN2t1Knl4Drl7Z+pyuClErqTSMRhwNVVk7coiVNoaWTG+VtpoUypY9IANLRQ6gkN41b0SrouSW1DQXqgLqj8+s3CICNcL0OZ0m5kKjhfbHoX8G+HOCfN+2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431638; c=relaxed/simple;
	bh=UxNc1JLWZR13hIcw/JxO/da5JO6VAX+hi5Gw3dyzA3k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y/yVOjKtQiOmYlb7w1zXqnJdkhcOisky+NgqKQFaWbgLwyqTIhsarZPSSJSWNxYW5qm18ZZMxE1AEBT95v9C5qR9Qy1/Vdd4lzpY1ZBX6EeRZNOPxj92yz0hPhFw+XTFFeq+JIrtSPwoh+NBs5shB9l97v4kAm/gZV97f95UNxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMNbCW+U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMNbCW+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EBB1F000E9;
	Thu, 30 Jul 2026 17:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785431636;
	bh=InB002FTvD/W7SwRwUvEj2w1wCcdqccJGMW/TRVuBsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CMNbCW+Uymw/5rAlk+uXJK6m1Ou69Bt9/0nv3LhIiiz3hg2AJ6PNWjaZ9YyiYG7Ye
	 KMKzRF5GxryyL5+HvIX+GcPHNx0Q/uVlgePGlyr9aekdbjlD+tk01IhY5flfdBwFR+
	 3cM1cZIFuMeYBvuVINR9GmJIvJ5PqOWYjBtqCDACzZzRioDCiCVZe16g4mKoRNO4yM
	 eFquDgbwVlX3PZR/L6GVdDtnxnsnj4PdaTRcplrWJuiYZGaPijesz8Ds+44c5TX8Pa
	 sgOyuG8KJPen0VKwQ8BmuWGKNAFgYFDDSB83x8YlHnCT7TfJZ1/bRyW2/IVQYi6z+G
	 Nc+x3oHQYimJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 5/7] ipmi: ls2k: Relax the dependency to its mfd
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260731-ls2kbmc-mod-v4-5-d201502ba239@gmail.com>
References: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
 <20260731-ls2kbmc-mod-v4-5-d201502ba239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 17:13:56 +0000
Message-Id: <20260730171356.A7EBB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message incorrectly claims the Kconfig change allows =
the MFD driver to be compiled as a module, but the target config is a boole=
an.

Pre-existing issues:
- [High] The MFD core driver dynamically modifies a non-const global `mfd_c=
ell` array with a stack-allocated pointer during probe.
--

--- Patch [5]: [PATCH RFC v4 5/7] ipmi: ls2k: Relax the dependency to its m=
fd driver ---
commit df8dbca48cc9588013370bfdb3946a4662d09444
Author: Miao Wang <shankerwangmiao@gmail.com>

ipmi: ls2k: Relax the dependency to its mfd driver

There is no strong dependency between the IPMI driver and its mfd
driver. Although the IPMI driver will not work without the mfd driver,
it is not a hard dependency. The IPMI driver can actually be compiled
without the mfd driver, and it will just fail to probe. When the mfd
driver is loaded, the IPMI driver will probe successfully.

> Therefore,
> the dependency of the IPMI driver on its mfd driver should be relaxed
> to "imply" from "select". This will allow the mfd driver to be compiled
> as a module and the IPMI driver to be compiled as a part of the ipmi_si
> module.

[Severity: Medium]
Is this description accurate regarding the mfd driver being compiled as a
module?

Looking at drivers/mfd/Kconfig, MFD_LS2K_BMC_CORE is defined as a bool
rather than a tristate:

config MFD_LS2K_BMC_CORE
	bool "Loongson-2K Board Management Controller Support"

Since it is a bool, it can only evaluate to built-in or disabled, so it can=
not
be compiled as a module.

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 669f760001974..f456e3e894169 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -87,7 +87,7 @@ config IPMI_IPMB
 config IPMI_LS2K
 	bool 'Loongson-2K IPMI interface'
 	depends on LOONGARCH
-	select MFD_LS2K_BMC_CORE
+	imply MFD_LS2K_BMC_CORE

[Severity: High]
This is a pre-existing issue, but does mutating the global mfd_cell array
during probe create a dangling pointer and potential data race?

Looking at ls2k_bmc_probe() in drivers/mfd/ls2k-bmc-core.c, a local stack
variable is assigned to the platform_data pointer of the global array:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

The array itself is declared as static instead of static const:

static struct mfd_cell ls2k_bmc_cells[] =3D {
    ...
};

While devm_mfd_add_devices() deep-copies the platform data, this leaves a
dangling pointer to a destroyed stack frame in the global array after the p=
robe
function returns.

If multiple such devices are probed concurrently, could this also result in=
 a
data race on the shared global array?

 	help
 	  Provides a driver for Loongson-2K IPMI interfaces.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-ls2kbmc-mo=
d-v4-0-d201502ba239@gmail.com?part=3D5
