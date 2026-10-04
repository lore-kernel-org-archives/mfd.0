Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74007472F9D
	for <mfd@lists.linux.dev>; Sun,  4 Oct 2026 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791136189; cv=none; b=ilJuDbycrmnVPFNSu/mspLlx2I3z8YntspSEfX/7cf+m8bCYbVq+xRfKEhfQGw7L84z8a8crJcbtaTDuCbwbrNzwRTUthBgckT2LNotGM5BQMzaaKSAv1nU3TSVzJcDemILYoPmtYUbm6+tHTNAzMnorKRJh/uu74HcDCU0VadI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791136189; c=relaxed/simple;
	bh=DkFQdKOHZXzAmQhZE4UVbeFeXXQ2cjN70YDOwbxSI0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lAJJXAxWKFniheeA2vqwPPrWxlZGEWctcEr+mdZGyQ9qlceuK5Tqms0gNkqB6DVNE8XBaRqBejWHBrzrXQ6NSZ8PuCuH7RGj7HcF8IVkvWCNMlFBQI86pMrzT8ezb+M2xSF9VGiERlQTtFCW87mcYghhu224yxCLDBaJ49Cvruw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4f5dKxn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4f5dKxn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8831F00898;
	Sun,  4 Oct 2026 17:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791136178;
	bh=KaEBMRwGemmXkF3zezjf+S9ccVOhIvDSmJJ1/pHM4O4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j4f5dKxn9/u+j2gZCXbvUV15ubWRL3YLBLr/4q7qLo7IjIwhyx03J+9vFM6jhSfoq
	 gMi0FmfRh0I6jTISTTggc5AuwgnC+Crm1Vvy9oe472PCitlfUW4rxfKE4wmTabcaSy
	 xqM/tv1wm7tHdVhJ2JADXgibaGUo9KRp6vb8V9cCvdeAjb85Dwcd1TPl31P4Nq3FQC
	 /PUVKC+j+oa3VSPqPlcjfhnxSjk3kALaKmR9Q8Wmw7sU9JvszYoYhAPAtHM66d1k4t
	 82oz1bnmJxlAllQVJE+FHds+R5iT5VqmMIGdDCeUafYsbIHQA3UoKWSzlHM9i6/jFn
	 wnE6jJBQnQh/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] mfd: rz-mtu3: Do not use struct
 rz_mtu3_channel::dev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261004174024.502949-2-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20261004174024.502949-2-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 17:49:38 +0000
Message-Id: <20261004174938.9F8831F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mfd: rz-mtu3: introduces forbidden parent-child data sharing via=
 intermediate structure
--

commit 4212c1766ca715fc3ce07b2855bbb23c7d2c3f39
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

mfd: rz-mtu3: Do not use struct rz_mtu3_channel::dev

This commit adds a priv pointer to struct rz_mtu3_channel populated by the
MFD driver at probe time. It replaces the use of ch->dev->parent with this
priv pointer in MFD core helpers to retrieve parent driver data, removing
the core driver's dependency on subdriver-assigned state for shared channel=
s.

> diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> index 0a254e61ec0a5..0fca16aaa5669 100644
> --- a/drivers/mfd/rz-mtu3.c
> +++ b/drivers/mfd/rz-mtu3.c
> @@ -62,8 +62,7 @@ static bool rz_mtu3_is_16bit_shared_reg(u16 offset)
> =20
>  u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 offset)
>  {
> -	struct rz_mtu3 *mtu =3D dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv =3D mtu->priv_data;
> +	struct rz_mtu3_priv *priv =3D ch->priv;

[Severity: Medium]
Does using this back-pointer inside a bespoke accessor bypass standard API
data retrieval?

MFD guidelines mandate that child drivers should retrieve parent driver data
using standard APIs like dev_get_drvdata(pdev->dev.parent) rather than
relying on custom accessors that use parent-initialized intermediate
structures.

[ ... ]

> @@ -344,6 +331,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
>  	for (i =3D 0; i < RZ_MTU_NUM_CHANNELS; i++) {
>  		ddata->channels[i].channel_number =3D i;
>  		ddata->channels[i].is_busy =3D false;
> +		ddata->channels[i].priv =3D priv;

[Severity: Medium]
Does populating the back-pointer here create a tight coupling between the
parent and child drivers?

This could make refactoring fragile by tying the child state directly to the
parent's private resources.

>  		mutex_init(&ddata->channels[i].lock);
>  	}
> =20
> diff --git a/include/linux/mfd/rz-mtu3.h b/include/linux/mfd/rz-mtu3.h
> index 8421d49500bf4..3884ae5b008cf 100644
> --- a/include/linux/mfd/rz-mtu3.h
> +++ b/include/linux/mfd/rz-mtu3.h
> @@ -129,12 +131,14 @@ enum rz_mtu3_channels {
>   * @channel_number: channel number
>   * @lock: Lock to protect channel state
>   * @is_busy: channel state
> + * @priv: MFD private data
>   */
>  struct rz_mtu3_channel {
>  	struct device *dev;
>  	unsigned int channel_number;
>  	struct mutex lock;
>  	bool is_busy;
> +	struct rz_mtu3_priv *priv;

[Severity: Medium]
Does adding this back-pointer violate MFD subsystem design rules against
intermediate structure layering?

The MFD guidelines explicitly forbid storing a parent context pointer in a
child-accessed structure to share state between the parent and child.

>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004174024.5029=
49-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D1
