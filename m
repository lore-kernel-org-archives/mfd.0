Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CFC347DD
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616899; cv=none; b=mv+VSVAQYy0ivRnDOjwWL8PNMvF8BH+KNXjziMHgwAa2rrQmzvYi7c6rqH13EXN2i5hTYT6K4jbJKnQ6KhWQFBx+78PeT9xOzJvhUVmi5lt1a638gxxJSqrn0yi45qMAm+AWweNwHuJzey3bhtxizN3yDZusPtyFh/g5j2/BrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616899; c=relaxed/simple;
	bh=txxicC9DmeXmEavNy8MfCCsV3F5R8Osz4+gnlfq67Vo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=opBZyGF4uwpXtlc5OMxSQ9NmVwBEGLQcApxmTXJ4rs3IrbYYNA9E+IgngjuN99LPtDUR1ORwo1x8uxQcqoED77nvfCLcOJWtnmLeL9j+AzEpAWRcLvmRdvU69O1/aZP5qf1HxBM60p6UKDLx8JncejEzTuDdquaSlRmc7Fsar+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0cvY7Jk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0cvY7Jk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B039B1F000E9;
	Thu,  9 Jul 2026 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616897;
	bh=U+4N7MEZZZmDdn+rXlfjwjFUNSX2F3NvgIEnCk+ZUNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M0cvY7Jk+VGZPsbb0C9wvEYBZOipYqpBftVubkr/8I0QF1hqZAn9GI11yjua7x8fe
	 /kcVhUyhQM+f6kTdNzkwFZS3+dQm7KDrgbD4xoQsa1AhGUMxwXgKb1tQHx1pgGX6VZ
	 XgptXTIL75RSn/JhoW4A/xptphAaa+SmzykYLmfu4FDOrGt69SAu/0eUV9dMR0aGiM
	 lWCZwyQc8qlgxUoJCoXhnQn4e6/LoaGCmpticw0+Rm3smgQbd6HGDXwUf+T55D4zCi
	 SVYGY0nG5YXnH432i3bYQ3kerRwG3wubKpz0O4cFEIcr02Mrpo2PcJOKBaenNVeHbq
	 vi5nJugkAGnzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/23] mfd: Use named initializers for acpi_device_id
 arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <84158ad2bfe67169913c42fe132307362330a6d9.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <84158ad2bfe67169913c42fe132307362330a6d9.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:08:17 +0000
Message-Id: <20260709170817.B039B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing mfd_remove_devices() on the probe error path leaves a succ=
essfully registered child device dangling if a subsequent mfd_add_devices()=
 call fails.
--

--- Patch [11]: [PATCH v3 11/23] mfd: Use named initializers for acpi_devic=
e_id arrays ---
commit f4fe216ebf71baeca7bb6a54cbffad4936018a53
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Use named initializers for acpi_device_id arrays

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
acpi_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

> diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
> index d4b24a7178484..19fc36164d890 100644
> --- a/drivers/mfd/intel-lpss-acpi.c
> +++ b/drivers/mfd/intel-lpss-acpi.c

[ ... ]

drivers/mfd/intel-lpss.c:intel_lpss_probe() {
    ...
	if (intel_lpss_has_idma(lpss)) {
		info =3D &lpss->info->dma_info;
		ret =3D mfd_add_devices(dev, lpss->devid, info->cell,
				      1, info->mem, info->irq, NULL);
		if (ret)
			dev_warn(dev, "Failed to register %s device\n",
				 LPSS_IDMA64_DRIVER_NAME);
	}

	ret =3D mfd_add_devices(dev, lpss->devid, lpss->cell,
			      1, info->mem, info->irq, NULL);
	if (ret)
		goto err_remove_ltr;
    ...
err_remove_ltr:
	intel_lpss_debugfs_remove(lpss);
	intel_lpss_ltr_hide(lpss);
	intel_lpss_unregister_clock(lpss);
    ...
}

[Severity: High]
This is a pre-existing issue, but I noticed a potential missing cleanup in =
the
intel-lpss probe error path.

If the first mfd_add_devices() successfully registers the IDMA64 child, and=
 the
second mfd_add_devices() for lpss->cell fails, the code jumps to
err_remove_ltr.

Since mfd_remove_devices() is not called on this error path, does this leave
the successfully registered IDMA64 cell active but orphaned?

Because the parent probe fails here, devres will free the parent's resource=
s.
Could this lead to a use-after-free and a potential crash if the active chi=
ld
device attempts to access the freed devres memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D11
