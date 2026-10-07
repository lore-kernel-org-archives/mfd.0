Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1E547D938
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365876; cv=none; b=iYnqrosVYiHYwRaXUC34/jXJQ3b2XKxueD9w0Fdk5EzJjfBc0GdtVx6GaYie5iZJkQ4jdI/o+dbUoonbESnqg90v1o34bBMXBCOltIQVmdVCotpgkgSKCBjj+/xdGBLjxljGrTMlfsBU0r/xD9i2VLWxio9IB4favsjyg7Rhdqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365876; c=relaxed/simple;
	bh=5G/pyjnCePrFfV44Er3HOXAMuNqgdXiTIorSVe3eNk0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=NnHTVwIevmsLXdzoHRznuA3DQhyRzlkvWGdTApTIlgEcPww6GdGlfrbf0y/gqjxgHPAfMiPT2P/QMmhurw6NhDNRPbKudmzhL8N21p4lIgr5SSoIdV1WV6dn34/QKJWWEtiOqOWub7PGhfwHPvBigaH+7lg40DyxyLxJEaSvAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gU48vUek; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gU48vUek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8772F1F0089B;
	Wed,  7 Oct 2026 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365865;
	bh=PNeeXnZGxY5FkWUGnZEh9A3uaAPqYHwHfJD6MJzvKtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gU48vUekCdcl4onxW0DtbBywgw5wTbBOgs4u1irczR93EK26xSQM3XWTqrYnLjNTI
	 NJ7+R55ygSE82w6B+d53/9ofV4XfTYCksrwCPACKNAXaxzBMjGu4b/crVX8FMeNtCs
	 tlnElE4H++phvMckUj+2RjZn6r+3koHEHFNlsYIWsLN8YKZRtkFwDW1WGtJbSmoCY7
	 DwF/gWO+oCLbhB3S6DhNEn+fQ0wD5Fg3VJMJQyFLLFBvxtwka9PwunSJkx319yjp9T
	 +7/86P4IS0OtSKDq+XgH88la7roZYtDNiBikjSqfrML349V4XTYRkPW1aLXsRhGdMY
	 MThsqQNsr6UuA==
Message-ID: <sashiko-outbox-162806@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/13] mfd: nct6694: Rename USB transport functions
 with _usb_ prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261007092102.3768818-9-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-9-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:37:45 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] mfd: commit message and code mismatch regarding bespoke accessors
- [Low] mfd: nct6694: driver-specific header placed in global include direc=
tory
--

commit e54fbe76bc141f2f5c4c0b850b0ed14aa9497ce0
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Rename USB transport functions with _usb_ prefix

Add a _usb_ prefix to the USB transport functions, tables and driver
name to mark them as USB specific, in preparation for the core and HIF
transport added in later patches.

> Keep nct6694_{read,write}_msg() as static inline wrappers in the shared
> header so that the sub-device drivers remain untouched; they are removed
> once the regmap-based transport abstraction is in place.

[Severity: Medium]
The commit message mentions that these inline wrappers will be removed once
the regmap-based transport abstraction is in place. However, it appears that
in later patches (e.g., patch 11), these wrappers are modified to call
regmap APIs instead of being removed, leaving sub-device drivers still using
them.

Since the MFD subsystem guidelines prohibit bespoke accessors and prefer
standard APIs like regmap to be used directly by child drivers, could these
wrappers be fully removed as promised, or should the commit message be upda=
ted
if they are intended to remain?

> diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> index 0ab2bd3bfdc1c..61155f9832b0f 100644
> --- a/include/linux/mfd/nct6694.h
> +++ b/include/linux/mfd/nct6694.h
> @@ -91,7 +91,25 @@ struct nct6694 {
>  	unsigned int irq_enable;
>  };

[Severity: Low]
Does this driver-specific header belong in the global include/linux/mfd/
directory?

The MFD subsystem guidelines state that headers should remain local to
drivers/mfd/ if they are only used by the parent and its immediate children.
Exposing parent-initialized private resources like the ida structures here
promotes tight coupling between the parent and child drivers.

[ ... ]

> +static inline int nct6694_read_msg(struct nct6694 *ddata,
> +				   const struct nct6694_cmd_header *cmd_hd,
> +				   void *buf)
> +{
> +	return nct6694_usb_read_msg(ddata, cmd_hd, buf);
> +}
> +
> +static inline int nct6694_write_msg(struct nct6694 *ddata,
> +				    const struct nct6694_cmd_header *cmd_hd,
> +				    void *buf)
> +{
> +	return nct6694_usb_write_msg(ddata, cmd_hd, buf);
> +}

[Severity: Low]
Is it necessary to provide these bespoke parent-child accessors in a global
header?

The MFD guidelines prefer child drivers to use standard APIs like regmap
directly to avoid tight coupling between the parent and child. Could the
sub-devices be updated to use standard abstractions instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D8
