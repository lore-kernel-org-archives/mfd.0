Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4F5371067
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 20:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417679; cv=none; b=M/x0F7bxjrSmck3jZX7e3KgAUm7IkjDC+x0U+vXSAM+yBABC666UdR/xe4KBW74Rb265zVMEhJez1+km1k7Phv+pxY6o/BukvQF3saThYv/kRvMBxCKyE2ju5eP9oqAV2frPY8HabFTrKKNVkxuSAQMEYWLzzhoek91cyMp9mx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417679; c=relaxed/simple;
	bh=/eV30aWArLNaWjH7GEZU4SBqtuoeT8CedmjmUXGmki0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KQOEWqbxFpEUBuxbIwZy03iGsCfdVOpPn+hi2NjiFJtyUMZVyZuRVcg2g9wBWANXLHzbHYlujVHXiD0hmP8Syt7I3+29Wq9cCVmwed+33nPNPOWGsBnmI9gj6swM2p1HBiQgHBQPwPTYfhbwRjjMupGjLQkBAulNKGB2XznsnqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ir2y/ZmG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ir2y/ZmG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774AF1F000FF;
	Mon, 14 Sep 2026 20:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789417677;
	bh=VzhiORhVpcV4Hp3ui1gLk2ZXpnrPXYdnAIFBRGuwl7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ir2y/ZmGU7VEp2jMhRbJgM1FaYaeHeC0n6L2es6xB0pyNx+QLh6N3j6uZim2aO7PR
	 GmVMhAYOLo25z47YigumWwNsuml7xlv1l2AGEhHvs856tpKEPSNXKgcA3GipNhL6qJ
	 764MRnJgIGycGhPTHdu4uRNJTWK1yEmwg4IQW8MCwswJ+NNOAI3fMN1DJcMRU//K+q
	 yz2fDYWLy5xTgCdFTPiGWPJOcYHIq02Cpcl7FwQhU6uKcbMTnkfe6N92lHL++m0Eln
	 buxuQT/8fgz64OLhi580zi+c559fkYXCghHyX8DbmRwtJ+jgmjY0UIE+yq3MvkeOt1
	 hybaPegE8bwUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] mfd: rz-mtu3: enable runtime PM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260914201456.2018403-4-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260914201456.2018403-4-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 20:27:56 +0000
Message-Id: <20260914202757.774AF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Parent device runtime PM is enabled without setting it to active, =
causing child devices' probe to fail PM activation and permanently leak the=
ir clocks.
- [Low] The commit message description is not capitalized.
--

commit e5d000ec993dddaf773352525f11aae34e95a812
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

mfd: rz-mtu3: enable runtime PM

This commit enables runtime PM on the rz-mtu3 parent device. This allows
child devices to correctly propagate their runtime PM usage to the parent's
PM domain, replacing the open-coded clock handling within the child devices
themselves.

> mfd: rz-mtu3: enable runtime PM

[Severity: Low]
This isn't a bug, but the commit message subject violates the MFD subsystem
formatting rules which mandate capitalizing the description after the
subsystem prefix. Should it be "mfd: rz-mtu3: Enable runtime PM"?

> diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> index 88aa1fedf1ef5..e24e67e7a66cb 100644
> --- a/drivers/mfd/rz-mtu3.c
> +++ b/drivers/mfd/rz-mtu3.c
[ ... ]
> @@ -330,6 +332,10 @@ static int rz_mtu3_probe(struct platform_device *pde=
v)
>  		mutex_init(&ddata->channels[i].lock);
>  	}
> =20
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
Does enabling runtime PM on the parent without calling
pm_runtime_set_active() leave the parent device in the RPM_SUSPENDED state?

During child driver probe, if a child calls pm_runtime_set_active(), it
would receive -EBUSY because the parent is suspended and ignore_children is
false. If the child driver ignores this error, its runtime PM status would
remain RPM_SUSPENDED.

Since the child considers itself already suspended, will subsequent calls to
pm_runtime_idle() or pm_runtime_put() in the child driver be ignored by the
PM core? If the runtime_suspend callback is never invoked to balance the
clk_prepare_enable() called during probe, could this result in a permanent
clock leak?

>  	return devm_mfd_add_devices(dev, 0, rz_mtu3_devs,
>  				    ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914201456.2018=
403-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D3
