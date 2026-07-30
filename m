Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B2B3F076E
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 17:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432237; cv=none; b=LzMw0NXs0Uyu87nAkEWlZJUkDdSyrKbkrQeR5B35d1ordG1ngkuaQlgI+jKPegfHxrigGxbv0c6hvQ6zK/NGrdSNCbJXH/xL6YYwK0DO7pxrT0EKNrY0BmrMabPeVy0Rygo04e9pw+5BQ5esFEx5VwRTItma0tDUoAq4hPvGuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432237; c=relaxed/simple;
	bh=lwaLaNPHpaHUoVQAogEkEVxsMbre5xd4AIoRO+mesc0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RIB8jNGJII+nImD/pcDVjNMF1yqeyn/BssnFxSxOp5TAvDo3fgeu4HSMV1oJZBNNUltYDuZmzSijqs59AQMs60uTrsgXEDTzzVc2x8go5STEv+J8kvXzw0Jz6xLUZJoN83UPYGw7QAJeKVg2NinJUCJnGbeYrVwkBqZRHjleYpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NT1m8T1o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT1m8T1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C411F000E9;
	Thu, 30 Jul 2026 17:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785432235;
	bh=L3XQC9WDU+3aydugtJzmuEtB9DzHGbprlNjaACKW1XM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NT1m8T1oOR+SrEvm4a/Z3DVZFRjXK8VTsb3YVDfszBQIqI6ybe+eLM7s1HGWIQkcw
	 RyQ8VVAFU9o9PIA2CCMYdIYcLGk8Pq28nXpJBm3tShF3QGvd6K9wXQiEIdAOP3et4i
	 rtdll6sOLiDl9Rvf+Y5YVoh4kmvc9W18TVkO7t7HrXQntZWNNzeedMiRM8cjfwYtBJ
	 Xea7Ez5U31vMOHGSwXT8MAYb9USKcRRWBTGNMDpZGnm/omS3sy4Y6oVgjIm08Ig1hK
	 pm4Bh2iBHxC262PCd62HoVAavGt65YxHUqw1cVJ6xCzTIXQd2y6NvBRAAdeaiJCue/
	 557YJXnEKJECA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260731-ls2kbmc-mod-v4-7-d201502ba239@gmail.com>
References: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
 <20260731-ls2kbmc-mod-v4-7-d201502ba239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 17:23:55 +0000
Message-Id: <20260730172355.A0C411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dynamic platform data pointer assigned to a shared static MFD cell=
 array.
- [High] Data race and cross-device interference on static `last_jiffies` v=
ariable in the interrupt handler.
--

--- Patch [7]: [PATCH RFC v4 7/7] mfd: ls2kbmc: Capture the reset event of =
BMC through GPIO ---
commit a8353dcca0807b3f06c4230ec30411f5eac5f0e8
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Capture the reset event of BMC through GPIO

This commit updates the driver to capture the BMC reset event through the
GPIO framework instead of bypassing it. It attempts to find the GPIO pin via
ACPI resources, and falls back to a hardcoded controller and pin if an ACPI
declaration is not found.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 1466b314fc4e5..48ce7197c7744 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but assigning dynamic platform
data to a statically allocated global MFD cell array in ls2k_bmc_probe()
seems unsafe:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
	...
	struct simplefb_platform_data pd;
	...
	ret =3D ls2k_bmc_parse_mode(dev, &pd);
	if (ret)
		return ret;

	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
	...
}

This violates the MFD subsystem API contract which requires mfd_cell arrays
to be static const. Since ls2k_bmc_cells is shared across all instances
of the driver, concurrent probing of multiple PCI devices will cause a data
race where one thread overwrites the platform_data pointer of the other.

Furthermore, pd is a local stack variable, meaning the global array retains
a dangling pointer after ls2k_bmc_probe() returns.

Should the cells array be defined as static const and the platform data be
passed using a dynamically allocated copy or another mechanism?

[Severity: High]
This is a pre-existing issue, but I noticed a data race in how
last_jiffies is defined in ls2k_bmc_interrupt():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
	...
	static unsigned long last_jiffies;

	if (system_state !=3D SYSTEM_RUNNING)
		return IRQ_HANDLED;

	/* Skip interrupt in LS2K_BMC_INT_INTERVAL */
	if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
		schedule_work(&ddata->bmc_reset_work);
		last_jiffies =3D jiffies;
	}
	...
}

Because this interrupt handler is registered with IRQF_SHARED and
last_jiffies is a shared static variable, concurrent interrupts on
different CPUs or multiple BMC devices will cause a data race.

Could this static state be moved to the per-device struct ls2k_bmc_ddata
structure to prevent cross-device interference and ensure proper isolation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-ls2kbmc-mo=
d-v4-0-d201502ba239@gmail.com?part=3D7
