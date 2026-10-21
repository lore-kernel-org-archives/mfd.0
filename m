Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585256;
	b=Af3fgOeGOg2TYopPKF7G5ktydWzieTzmChsidtRvHK/xCiNT2YHl4pCIM6er5BbvphIS
	 nGBaGvRzAxLPJyiGSqbZ7+xv9CqglQbZVdGgvI8I3Pa21Z7nVIyrSqkVbhVVEmKz6B8n+
	 lZZFH57DHEzd1V38IvcAhFTNH7mEyvNXZoIjMAhiTcVFaNxyleTzaLBc3KTejgQAbdNFF
	 HKk5LCptl1IueJ54TEU84/reg+Ha77UmDvjTAL2xr7ae6xOY75y7Q3nVKtAgm7A2h1J30
	 EKx5GqFBbclEkTb4BrdMpgrIPKFc85OJGQq0dJ04zelpbGuTH653vGCZuPiko+7SUJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585256;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4IbOKDaoC1N5EtCwI1JPHpR51in5f0u4VjXFVARHOeM=;
	b=v0WVqXIZTcViH8FY20fMpZfx/BAc6LwRW+6MuXoixY5T/Ovt0L/iqdUPjxnuViViwUNT
	 A6FD8m7wz7VSHGaBDPAWyYrU78yRod7rul88qqGrnoLRA0BcHIsbiQDdfYOsiBAHq+l/y
	 YYFXQpbcQR2kji37SEJRCNKSP/E8Kn8q7phtdnCu1c3p5rG+EMRu/QnI47IfNlg3UYvho
	 McENvsJF/RGZUjnzyveiWaXCAxliNPH7snhL0Sn+zBAi29FwH2zpNJ9eqDIhuyylVkcW0
	 Tn0gQ0E4+MepumMoI4gyiNFpT4SLMl9p4D5y89l1pFowmMp+1liW1qExamcBGJRZ+yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUNewm2Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC3B606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OUNewm2Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB9D1F000C4;
	Wed, 21 Oct 2026 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585256;
	bh=4IbOKDaoC1N5EtCwI1JPHpR51in5f0u4VjXFVARHOeM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=OUNewm2ZuEWGKyec2+9UPw9mr0QAE1OvLgB6OJZ1mJXx7cnyeVilmcmPDe+497Cls
	 1FasEyN8RnbNmo/55mU/NQfHhyCherxKJqIe/9s9y+VaN2a8BEQOQFiYNPN4d4X2p5
	 6+LMM+DPhAtQbz4KqoZhFtYeS4dJOJ3Jkxo1c0xwW46RmysxwkSTV1CzKYhJM7v9FM
	 G9uaK5HzTkxZuLrTJ0EWMu1Dpm+NFwMvl27iL9sMTu1R4QrBpi4dmVVPw/rUhe+peF
	 9Vfa3u1aJFHCMN58DHQroGrDI7sVMLMNJ+zLQrt/hcBsxk67DSEbTp5tLJ+OSdRMqU
	 qpJYuiv3Ubprw==
Message-ID: <sashiko-outbox-180228@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/28] mfd: nct6694: Allocate USB DMA buffers with
 kzalloc_obj()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-1-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:20:55 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> nct6694_usb_probe() allocates the USB transfer buffers usb_msg and
> int_buffer using devm_kzalloc().  Because devm_kzalloc() prepends
> internal devres metadata to the allocation, the returned buffer pointers
> are not guaranteed to be ARCH_DMA_MINALIGN cacheline-aligned.  Mapping
> these unaligned buffers for USB bulk and interrupt DMA transfers risks
> cacheline sharing and memory corruption on non-cache-coherent
> architectures.
>=20
> Allocate usb_msg and int_buffer using kzalloc_obj() to guarantee
> DMA-safe alignment, and free them on probe failure and in
> nct6694_usb_disconnect().
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Closes: https://sashiko.dev/#/bug/linux-6f9e5ba3-714e-41ad-b6cd-3a17c665b=
87f
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D1

