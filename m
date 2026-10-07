Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A8646EF9D
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366167; cv=none; b=ESPHOZU72EOkYN8ckxuy2zXn8zH1GAsuwUscP3vjsRwg5Sog1vSeAc5D0Re2yVm0KYk4saob27S85Cy4YOfiEa5bncY05gqwjfZqDBJjdiWq+H22PJI7gfm0Y3cu+j95PbrJc4suvEX0ZhwcAZC6B9VTayaZBvAgLTV5PVEK8JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366167; c=relaxed/simple;
	bh=goYulcyWRsqrWThabDADw/b04w3A5BT+DTTDP9u63x4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iJIgRIPJLByaCsPpeSRB0Y30rabXDnVLkVxzvd2ocCW9Y3IwT2YhA1GF1hV9gbNtdUms3EDUCOVOHj7UPsOx0T3a/FLVOVF4qXXtrIro/qSJPFdixIOKrxBesY5X2Cz+0gXk2SXQ+Kx4bueH2hHvrWzYTFJQH2/BkFjuWB4rdzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcriafyT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcriafyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B561F0089C;
	Wed,  7 Oct 2026 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366158;
	bh=goYulcyWRsqrWThabDADw/b04w3A5BT+DTTDP9u63x4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kcriafyTxOBIKccOLGZ+hXKdqNvJoLZU6mJCj+5cgFPs5xAUQYl1sLDrQYRxVDdqd
	 yj5oZP4eNXwVA/wMWnWXgz05pjVLPGPQnF86BnwMNY5vDfnCrD78FTqRtFE1AjNNTu
	 09Q2s07hptlmiko2INRkTqEg+qKaZAPsM1QD63/SplnESNx6X/Bz9RoZCgd23jWQIH
	 9APEY/gATSP8qDpN+hfmP57Ji60ZwWpxFn83ePbDQbQqdpXftUJDsehytL24BpSOH8
	 WiGavYVq3vxLF3LmOVqq1tcTKcrJipAMatqFmeZr442OsVVJJX0XBa069+QAmT7kcr
	 OWFQWzwPhw7hQ==
Message-ID: <sashiko-outbox-162813@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 13/13] mfd: nct6694: Add Host Interface (HIF) eSPI
 transport driver
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261007092102.3768818-14-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-14-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:42:37 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Add support for the Host Interface (HIF) transport over eSPI for the
> Nuvoton NCT6694.
>=20
> The driver locates the Super-I/O to configure the shared memory base
> address and SIRQ, and implements a regmap_bus that exchanges firmware
> commands through the shared memory window. Report accesses are served
> from a separate MMIO regmap.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D13

