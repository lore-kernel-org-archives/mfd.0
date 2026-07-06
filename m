Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11133A05F2
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 23:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783380195; cv=none; b=NX8apbGjazE0MBiLhnXSWYnsZ24xV83VP9z4NxEv6JBcCib/vMp8aPdOhVjL6OtXwYNaqrAKYbQ5YS3IrL0yaE+zftA1ZWHK4pdfi0VRB2VTPl4DWUKJHV/5PSaA1fhAJGZioCaDgFZ4nu7IKK8sTa8JFCWPDXo6qeoAX+VSWDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783380195; c=relaxed/simple;
	bh=yfXDSJR1yTocaGyfWvtHJJAsHzm7akwdlhpW3fBDu7k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tGzZNKrE+tjiyXcf/NBSV5yJwjljrsxq56M85XknNqEpKJ2W4btWsxorhpU2Fn7aDtdszULadxlMHyI9lP6cG7hnwYZP5k4AmM8o5/lAoiDNS9FolUSWv7zV9UPA+0+Ztggrbbx/wodixA2ZyoHTBweYs42dFJtP3I9YTiK9jlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9JlU0k5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9JlU0k5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4640B1F000E9;
	Mon,  6 Jul 2026 23:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783380194;
	bh=DlhJeuPvhUzxAsn/byGP+B1Kf4cK+mNem4Pwv6ugXfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y9JlU0k54m0M2Sg/mGbCADSAKoQ2zBSWmaZgjoHjBT3NN3pMzIkx5ccsqqocANc1U
	 1l5mM8DzgiB+3F0N5if7IcX9fwzSnQAxYiVjaUHbwcK8ybFkb8taEisyjhp6MWW5ye
	 hU677QNOicnd+bMhRjmlQMpzzbld03xMcVzrlUoGx2RaQhB9+EhKLIrO98VaizH0z7
	 Uzq9nYrTnYwaTqYJ0Llca3pnApJ2xL8/wKuMRlSvTXYJWkBvsnJnObGClbm1hcTiUW
	 EyQeW/4yiPNSnfZvTnBCo2dozkdLO2o/jt/cq4qhd17BmT62CyeMDb4j6Z4oJJPts0
	 O5qMvP3d24MNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mfd: ucb1x00: register software node for GPIO
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v1-1-6102eabd31d0@gmail.com>
References: <20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v1-1-6102eabd31d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 23:23:13 +0000
Message-Id: <20260706232314.4640B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect teardown ordering of software node causes Use-After-Free.
- [Low] Missing EXPORT_SYMBOL for statically defined software_node breaks m=
odule builds.
--

--- Patch [1]: [PATCH 1/2] mfd: ucb1x00: register software node for GPIO co=
ntroller ---
commit a75c0eafc8aaa7b47d15759a689939988f9c92b0
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

mfd: ucb1x00: register software node for GPIO controller
   =20
Define a static software node for the UCB1x00 GPIO controller and attach
it to the core MFD device in ucb1x00_probe(). This allows machine
subdrivers to reference the UCB1x00 GPIO controller in property entries
when converting legacy platform data to software nodes.

> diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
> index 16f64e2b2f77c..8d1c34c53955a 100644
> --- a/drivers/mfd/ucb1x00-core.c
> +++ b/drivers/mfd/ucb1x00-core.c
> @@ -25,8 +25,13 @@
>  #include <linux/mutex.h>
>  #include <linux/mfd/ucb1x00.h>
>  #include <linux/pm.h>
> +#include <linux/property.h>
>  #include <linux/gpio/driver.h>
> =20
> +const struct software_node ucb1x00_gpiochip_node =3D {
> +	.name =3D "ucb1x00-gpio",
> +};
> +

[Severity: Low]
Since ucb1x00_gpiochip_node is declared as extern in the header for use by
machine subdrivers, should it be exported with EXPORT_SYMBOL_GPL()? Without
an export, will subdrivers fail to link if ucb1x00-core is built as a modul=
e?

[ ... ]

> @@ -630,6 +641,7 @@ static void ucb1x00_remove(struct mcp *mcp)
> =20
>  	irq_set_chained_handler(ucb->irq, NULL);
>  	irq_free_descs(ucb->irq_base, 16);
> +	device_remove_software_node(&ucb->dev);
>  	device_unregister(&ucb->dev);
> =20

[Severity: High]
Does removing the software node before unregistering the device create a
use-after-free risk?

If device_remove_software_node() is called first, it clears dev->fwnode.
Then device_unregister() calls device_del(), which skips its back-pointer
cleanup because dev->fwnode is already NULL:

drivers/base/core.c:device_del() {
    ...
	if (dev->fwnode && dev->fwnode->dev =3D=3D dev)
		dev->fwnode->dev =3D NULL;
    ...
}

If the software node outlives the device (e.g. if multiple devices share the
node, or if sysfs holds a reference), its fwnode->dev pointer will continue
to point at the freed ucb device struct.=20

Should device_unregister() be called before device_remove_software_node()
to ensure the fwnode->dev back-pointer is safely cleared?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-ucb1x00-as=
sabet-swnode-v1-0-6102eabd31d0@gmail.com?part=3D1
