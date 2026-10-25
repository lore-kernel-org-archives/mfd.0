Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792905075;
	b=et5JHp4tc505khCi5cM9i4n8r41l7howWX1REBOMLZJdDtw2YGnNdmIcZM81gulcTIAZ
	 oYvsrN+aoNXHSQh3IYVn+HU8wDrlJWayA+9wv+ZEXBSLovQqEdVBQETeAUDIiEdAgP0hw
	 T7QdtPOClfUYYilxyT7UXDB7eZZ5J6wtYQg32lzo3+RU8/lJiEWLxSbCC/1PqgGHH8nfU
	 ThU9xn+U4/srN9SmrFrwwzf851ZQ+ZjoAa9nghglQFY+GMgdhSJ0CIiSfMbw0ciJ8r+zT
	 ZpIsc58Vv7lj+6m/PJZRRYq2zkobM8G8fVVHi6WfXXYNCkEa6zMrJudJ4V+HIbbritw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792905075;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nr6tvDYAPm3aJFIprhIu+HpBI59n04oAwvjuO3iRZQs=;
	b=07Vfjffe7jU/RD7zynRmXsjt6+TyzYld7YQBfhegoZNz0DxMZBndbnULmLuO5Xxi55Ix
	 17mFHAScLsU10CcPDJndKB6g/YMVzt6FySz5B/BdrDG/gTKqceAxBzDTPh4Fk1EwdrLSA
	 N/e8whPuUrLebdieAExwaXNgWgQkLyZWIMzEtb/dJGAN/J2UyLlMrt4Y7QCQ/09VkXSmM
	 YlzlYdHY5T3qiDXkSyPu2Wd6utSRAfS5YfBkpYO4GJIPOQ2waubGfQkKWVR74ZFMPwwJD
	 7gTGvERMCaPL5A29lvaQiBjKhsXDbmI8uSfW9yE/LGN9jRPf/f4FQzRtYulTKCYZsCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bCJgj21Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A86D606A31A
	for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 05:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bCJgj21Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39431F01825;
	Sun, 25 Oct 2026 05:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792905075;
	bh=nr6tvDYAPm3aJFIprhIu+HpBI59n04oAwvjuO3iRZQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bCJgj21QA/T4tlqYacWqVz4A9c6Q7NbxMM518FK4siJN86jXRi1/E2g+WPKnGkZO4
	 CSn55pwbDBmWEcwY9Tk14KZGJsqtXUVWjemVucw978zXoPHXlDrkxmhNz1ctfJqy0E
	 yJf7zEtG01Q+r902RKaBhRBbOjMZqEcoTgxPWyNi9HwmFl+Zbw1q90w+EOUaUNWgsA
	 jbRSX4G9CRJp4npTM+atkgUNg/NZ1cYUrpIJyV/YNAA/MPRBG3t/Ov1DtKRQD/JrVz
	 6sr6M+ZJcBW1IbMoHqQjYFXQQXudYV/rQtTzWLUjEQOcq2ozYlpOUZkwMu8ON5Jar9
	 PFDiKGkyhapJg==
Message-ID: <sashiko-outbox-184080@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 05:11:14 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: wm831x: dynamic local copy of mfd_cell array in wm831x_add_dev=
ices()
--

commit a93c22361318ef092d5fcb25c2702de8014ea89b
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

mfd: wm831x: Support software nodes for DCDC regulators

This commit adds dcdc_swnodes to struct wm831x_pdata and introduces
wm831x_add_devices() to attach software nodes to wm831x-buckv MFD cells
during device initialization.

> diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
> index df8e76e000cc8..c4793be419ba4 100644
> --- a/drivers/mfd/wm831x-core.c
> +++ b/drivers/mfd/wm831x-core.c
[ ... ]
> @@ -1449,6 +1450,32 @@ const struct of_device_id wm831x_of_match[] =3D {
>  };
>  EXPORT_SYMBOL_GPL(wm831x_of_match);
> =20
> +static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
> +			      const struct mfd_cell *cells, int num_cells)
> +{
> +	struct wm831x_pdata *pdata =3D &wm831x->pdata;
> +	int i;
> +
> +	struct mfd_cell *local_cells __free(kfree) =3D
> +		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
> +	if (!local_cells)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < num_cells; i++) {
> +		struct mfd_cell *cell =3D &local_cells[i];
> +
> +		if (strcmp(cell->name, "wm831x-buckv") =3D=3D 0) {
> +			int id =3D cell->id - 1;
> +
> +			if (id >=3D 0 && id < WM831X_MAX_DCDC)
> +				cell->swnode =3D pdata->dcdc_swnodes[id];
> +		}
> +	}

[Severity: Low]
Can we avoid creating a heap-allocated local copy of the mfd_cell array in
wm831x_add_devices() for dynamic runtime amendments?

The MFD subsystem guidelines prefer using static mfd_cell references rather
than duplicating cell arrays to patch fields like cell->swnode at probe
time, especially since mfd_add_device() already duplicates each cell via
kmemdup().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-samsung-kp=
-v4-0-e21253295e68@gmail.com?part=3D1
