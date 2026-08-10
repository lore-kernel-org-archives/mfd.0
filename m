Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E791AF0BB
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 12:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365506; cv=none; b=vDrwKCP2bwB99WpYdBNlLz7s0bNUcvEr1zl4Vg1ViTiND8sNxovJ2v57L31ywRLM5YXUKUoZPDtsxnvEmp56wqHAhicb7Hohi49slPTUakh8rfTckYq2XPtLgxxuVuGwgA2caDxlp3+dsKip//x57Fxc9ftd0RPgexxZPyFHf2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365506; c=relaxed/simple;
	bh=nDOHhsoLT0mJc5sRmIawxdOD5yHbsUMrZD3Desux+nQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oVi8mR40IV4orfrl/5I575JRvbEiw0IauuSE48Dq1jQnXK0FjZGskg0XsD7U68KcVX3pGiAnhK1C9NYVM+GmozC8JItHqqRE1OMycDliKCspXSh1WjM+ApTTM+pV2KFzrJLxmB3iHgm+3+j4j2KupApiw4Hfda9eit6LuQPFz34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3eE9esg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3eE9esg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FEC1F00A3A;
	Mon, 10 Aug 2026 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786365504;
	bh=TwC5rJst8h9G9NGMRjnylL2MSc+oZPzKKyZHFzGPcCc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o3eE9esgdIpytPcH6w5kA18U8KlvPiv0gp+b7knCl5DJZ/QLypNwzRn48N7+4LsEo
	 gtI7PHnNHqHGY0GtE3u2x8ll5+z8YROb4FksMLqD0S/3Z8mzqZ5Rha8dp6pSy1cVk8
	 vVrvVATBPHYO3o6r4LDnpRuX8+s2douzccQKpYT3KjlllV2PgvR+KOc2lppuUWiaQm
	 7b3y+yTzJPFoHgbNQwvOi24D6vXn4vvCHGj5xs9JGU0BuO730h1R0+sIRduxywTF8o
	 /gIY9nrKKdlJMAViXnAhLkvuCpjQcbDDNlaS4sIV4NmCUC3E4qJLdrJQVxniLka3fv
	 bskTtfSmC5a/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 1/8] mfd: ls2kbmc: Make a copy when parsing mode
 string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260810-ls2kbmc-mod-v7-1-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
 <20260810-ls2kbmc-mod-v7-1-8aa0fb5a5462@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 12:38:23 +0000
Message-Id: <20260810123824.02FEC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver modifies a static global `mfd_cell` array during probe,=
 violating MFD guidelines and causing data races with potential stack Use-A=
fter-Free.
--

--- Patch [1]: [PATCH RFC v7 1/8] mfd: ls2kbmc: Make a copy when parsing mo=
de string ---
commit 391ef025b41aeef2d29d627c04ca398a1673da60
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Make a copy when parsing mode string
   =20
When parsing the mode string from BMC, the string is manipulated
in-place with strsep(), preventing from parsing it again. Make a copy of
the original string and manipulate the copy instead to fix this.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe7..335590392240b 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -427,34 +427,67 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
[ ... ]
>  static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_i=
d *id)
>  {
>  	struct simplefb_platform_data pd;
>  	struct ls2k_bmc_ddata *ddata;
[ ... ]
>  	ret =3D ls2k_bmc_parse_mode(dev, &pd);
>  	if (ret)
>  		return ret;
> =20
>  	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
>  	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);

[Severity: High]
This isn't a bug introduced by this patch, but does modifying the global=20
ls2k_bmc_cells array with a pointer to the local stack variable pd cause a=
=20
data race?

If multiple PCI devices probe concurrently, one thread could overwrite=20
ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data with a pointer to its stack.

This might result in another thread's devm_mfd_add_devices() call=20
dereferencing a dangling pointer to a destroyed stack frame during its=20
kmemdup() operation.

Could we avoid this by not dynamically modifying the static mfd_cell array=
=20
during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v7-0-8aa0fb5a5462@gmail.com?part=3D1
