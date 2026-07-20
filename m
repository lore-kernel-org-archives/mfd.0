Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FAB401A2A
	for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548199; cv=none; b=KZMjN9tvckqYivrq188WP7nYUY3gCxYZX7R3jDTgwQ7N1vomxhJ7s0yU5DEnZ4KcgXPq7x/a4v/aFVwU8DGe1wLll2uvtzNzw2MTt0qbGsOdeifIu4CP0JojaV3mjy85ElkETvKmfTP2TdF+FgDHM9pvabnvtcjDNzwXzWUQopE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548199; c=relaxed/simple;
	bh=dTm624MDnzuMcdL5VnNCU1fLfL4PZ2xT5FC7GtDVmwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dUSF2CmL4BZdHGsm7RHb0n2DMmHg6V+oEbmyigOGSOR2r5Fzr2LrEvysdNbv/w2fcjybESbNJ0r/ROSpwNiDqJz0NlKabK0ZdqCm9kBCDHgWPuMvDnYvDYBRMRXNr+uGWT2gNrcL8TgP5oQaNiXMVJmIrCsvVR7KVG2YEzCk46w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXGQ3zty; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXGQ3zty"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FDA1F00A3A;
	Mon, 20 Jul 2026 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784548197;
	bh=8omcv2oJPzJoO736U0NEKKpdKm5elw1f+5AmolUBfvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oXGQ3ztykXAjdpSt/GgyHex4descF0GoUqUIQXDR4quoqy2ERplPvsJXADmxtJDyY
	 hWQL/qfS00KToCPBwa9W9u3GZuX1cm6ulg/ET81gDFvJ2/NpdqnojQQqxGT2OtU9mi
	 IY+1QGdpyI96shyEYckrtnkqCuC8OG71SNkKmX110cesySAr2uWPddDU+tlY1xKTob
	 8gc0NsfyUk9QB3qhiYk6zWaqPBfiYZ0FeqFG5/9D973aAP8g9DDNwlZQHSaEHryfMF
	 8VHLTvi5XRebV1hFbdYm+l3zuGn1DWFG6NSkr9auF8lf/RlA6x/3M49F7lqtQy2lcI
	 1fHBo8em0ZKPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: sm501: Fix potential memory leaks during remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdun Nihaal" <nihaal@cse.iitm.ac.in>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260720113836.73133-1-nihaal@cse.iitm.ac.in>
References: <20260720113836.73133-1-nihaal@cse.iitm.ac.in>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:49:57 +0000
Message-Id: <20260720114957.78FDA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing unwind on `sm501_init_dev()` failure leads to Use-After-Fr=
ee.
- [High] `sm501_pci_probe()` completely ignores the return value of `sm501_=
init_dev()`, leading to a partially initialized device.
- [High] `devm_kzalloc` is called on an uninitialized `platform_device`, ca=
using a guaranteed NULL pointer dereference.
- [High] Dynamically allocated `gpiod_lookup_table` is never unregistered, =
leading to a Use-After-Free in the global GPIO lookup list.
--

--- Patch [1]: [PATCH] mfd: sm501: Fix potential memory leaks during remove=
 ---
commit 9027636a8f2b645961f4a4f75f1856b59c0a2754
Author: Abdun Nihaal <nihaal@cse.iitm.ac.in>

mfd: sm501: Fix potential memory leaks during remove

This patch fixes potential memory leaks of the sm501_devdata structure
during device removal. It adds missing kfree() calls in both the PCI and
platform remove functions.

> diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> index b5bda477ebfc2..77888965d91ed 100644
> --- a/drivers/mfd/sm501.c
> +++ b/drivers/mfd/sm501.c
> @@ -1627,6 +1627,7 @@ static void sm501_pci_remove(struct pci_dev *dev)
>  	release_mem_region(sm->io_res->start, 0x100);
> =20
>  	pci_disable_device(dev);
> +	kfree(sm);

[Severity: High]
This isn't a bug introduced by this patch, but does sm501_init_dev() lack
proper cleanup unwinding on failure?

In drivers/mfd/sm501.c:sm501_init_dev(), child devices (USB, UART, GPIO)
and a sysfs file (dev_attr_dbg_regs) are registered. If a subsequent step
like sm501_check_clocks() fails, the function returns an error without
unwinding these registrations.

In sm501_plat_probe(), the error path cleans up by calling kfree(sm).
However, the leaked child devices and sysfs entries remain active in the
system and hold pointers to the now-freed sm structure, potentially causing
a use-after-free.

[Severity: High]
This is a pre-existing issue, but is the return value of sm501_init_dev()
being completely ignored in sm501_pci_probe()?

Looking at sm501_pci_probe(), the return value of sm501_init_dev(sm) is
discarded, and the function unconditionally returns 0. If sm501_init_dev()
fails (for example, if the device clocks are misconfigured), the probe
succeeds but leaves the device in a partially initialized, dangerous state.

[Severity: High]
This isn't a bug introduced by this patch, but does
sm501_register_gpio_i2c_instance() call devm_kzalloc() on an uninitialized
platform_device?

In drivers/mfd/sm501.c:sm501_register_gpio_i2c_instance(), a new
platform_device is created using sm501_create_subdev(). Before the device
is initialized via platform_device_register(), devm_kzalloc(&pdev->dev, ...)
is called.

The devres core attempts to add the allocation to the uninitialized
(zeroed) devres_head list, dereferencing a NULL prev pointer in
list_add_tail() during the device probe.

[Severity: High]
This is a pre-existing issue, but is the dynamically allocated
gpiod_lookup_table left unregistered on removal?

In sm501_register_gpio_i2c_instance(), a gpiod_lookup_table is allocated
with devm_kzalloc() and registered globally via gpiod_add_lookup_table().

When the child device is removed during sm501_remove_sub(), the
devm-managed memory is automatically freed, but gpiod_remove_lookup_table()
is never called. This leaves a dangling pointer in the global
gpio_lookup_list, which could lead to a use-after-free when another driver
requests a GPIO.

>  }
> =20
>  static void sm501_plat_remove(struct platform_device *dev)
> @@ -1637,6 +1638,7 @@ static void sm501_plat_remove(struct platform_devic=
e *dev)
>  	iounmap(sm->regs);
> =20
>  	release_mem_region(sm->io_res->start, 0x100);
> +	kfree(sm);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720113836.7313=
3-1-nihaal@cse.iitm.ac.in?part=3D1
