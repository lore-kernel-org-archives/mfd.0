Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D60313543
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283840; cv=none; b=n8NSkGx6x0YavePCq0lG/C7tg26KrOC4LIjCBMM4liPQ8CY3V5TRLMKS5yPq9F9u140ApCeod7lA57P6Qh4m3adUVDBCOkqAPC1QLyVhoAncQTEzCCrzi3CEdpTth4iqL5ZVN4/E7/R0T+IqlO2ltIqRyIAiVnnVpRAS/3elGm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283840; c=relaxed/simple;
	bh=XBWkYqsrGs4B1Ck4wLHngYNQxILcaRSt6ae0LyH9gps=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F1AI5F/TS9xRvUSXzcrpXMXv26a5XZwBrOa2QqT1566aHH+M52XhflM9pvbBKJZ/SmjpbOGgLV/M9nRvv/QD0a4AED2i+aFV/qsLugLfD3uXJeO6AcbvooDRSwJGUqGA/i4b3vX4EWv+XMcIi5qoOrKwCnCOhp/dbFhbnFxpFyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWYd5jUe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWYd5jUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3032F1F000E9;
	Fri, 21 Aug 2026 03:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787283839;
	bh=PMiDR3ykNl31k1sC2TgtEwBYUxrm6mq+ut2agsqT0f4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OWYd5jUeVbAdnHcduI6rspEncSZsOCGWRaX8ArAn9A3crJIvi2dWqGOVVl8nS9+3t
	 A9y0CaOodmTRn5nrUAaPf78IO/ASkzEUke3yZw0YpfFX4ZxUAeY0kWq4tiEWSrF55R
	 mDSMQCzEPOzsRXWgCIkQysVFv4ZBeAlZd3z/8iuIoqhPAWKndq3IuRNmD/VdXSQ/OS
	 2cdLgVlQN8gOJT1dy2dL4LgJtc6Ruq56cy4CPS0dbpoWUx8urjQn5MGM0Mim4UchOp
	 1MKPP5NXVxiPO3jnBaMCJKgT8ePVDRkjmmPGrO2cr+8x/DedHGbqUttyGDYpm262Q6
	 io+FndfYpndPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/10] mfd: nct6694: Rename driver to nct6694-usb and
 update Kconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821033505.4017901-5-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-5-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 03:43:58 +0000
Message-Id: <20260821034359.3032F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Renaming the user-visible Kconfig symbol `MFD_NCT6694` to `MFD_N=
CT6694_USB` without a migration path silently drops the driver from existin=
g kernel configurations.
--

--- Patch [4]: [PATCH v7 04/10] mfd: nct6694: Rename driver to nct6694-usb =
and update Kconfig ---
commit 215b54ed65ccbd40b44ec465fcadf580136e0e2d
Author: Ming Yu <a0282524688@gmail.com>

mfd: nct6694: Rename driver to nct6694-usb and update Kconfig

This commit renames the nct6694 driver to nct6694-usb to reflect its USB
transport backend. It also introduces the MFD_NCT6694_USB option and hides
the original MFD_NCT6694 config, setting it up to be selected by transport
drivers.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 763ce6a34782b..5506a0adf3ec0 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1164,19 +1164,30 @@ config MFD_MENF21BMC
>  	  will be called menf21bmc.
> =20
>  config MFD_NCT6694
> -	tristate "Nuvoton NCT6694 support"
> +	tristate
>  	select MFD_CORE

[Severity: Medium]
Will users upgrading their kernel with an existing .config have the NCT6694
driver silently disabled?

The original symbol loses its prompt here, making it hidden. Because the new
MFD_NCT6694_USB symbol has no default fallback or migration mechanism, it l=
ooks
like running `make olddefconfig` with CONFIG_MFD_NCT6694=3Dy will drop the
driver entirely.

Does it make sense to add a default property to MFD_NCT6694_USB to migrate =
the
previous configuration?

> +	help
> +	  Core MFD support for the Nuvoton NCT6694 peripheral expander.

[ ... ]

> +config MFD_NCT6694_USB
> +	tristate "Nuvoton NCT6694 USB interface support"
> +	select MFD_NCT6694
>  	depends on USB

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821033505.4017=
901-1-a0282524688@gmail.com?part=3D4
