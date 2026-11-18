Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990803;
	b=x2w7IYFXCFboPdpGzSiIUjwID67VSGPT2fxovnbD4z5LlzfLwjeoPeg5yLc7rvltAfe4
	 xVghR1igswjTL+eYtJGXA+iNqr2WM78mg+R7tWXVFmTE0CVeQQryJ4qa7xbzsJdkE3c0W
	 rfjxAOs+SKCDoSZ2kf5PvHAAPeJgMEpsK17W4EjZLzHYj1SlXxuWOVK92CuYc9NPDWCV9
	 YmFsk/LuVaBcW7z4f/89n0MARAu11l1ONYCfvQ5vv+4nzst3jY09ICoarUUW0N27zoCmd
	 NNDqxfCcVz1bxjeN1hDmY1IqxHJZKN7zwcrnT72JY7b98u/ZNE/Ur6jaPB4xaogDUgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990803;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zBinQzOoW9QuFaw02BHGiWU2DzSSZbYPKJHZgUSjCl8=;
	b=RkJdVwIWwoLOQvAcCxUggzEGYu/dX4xZmZBfDWphx/p7hNps1O8HSVWR94FAJPr9LlbD
	 //MD2cQmZTsiV+x+OTHpXe7k3R3k4JNYP5e8YKq7gscqrOuOAktKdnpGCQsiaYsjQAqZJ
	 UIM/jUU3Sz2rMOAZ7GYOl+wBLriHp51VziH/hHihEfkGGuzHUuaeRjm+lXX2BIHyvG8PO
	 UPPYFAhp4BiBTNWqB0x0F9r7d7rXUVc2kd2qPEztGGA9wrYpDl581r8CPby0YY6TCdJ0V
	 qYbjzx7Ij4S1PGOEwh6vuDpuh7CsIrBDIcUTcgJVT+JyWRZZ3hDqDmjsoSi/vaprh1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GmTY8usI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC63606A31C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GmTY8usI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB6D1F000C6;
	Wed, 18 Nov 2026 08:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990803;
	bh=zBinQzOoW9QuFaw02BHGiWU2DzSSZbYPKJHZgUSjCl8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GmTY8usIFMav6HteaQraH7c4Q7FZ6Td0PVFtTzthaLDivCgU/1Le+qGtpW/g/Tpj+
	 2HzsZAkZP4fMCXuT1wCKXVqFJHVp6J+oAvUN8DGTagijBsEnydmOIkfQmKJB14QLUq
	 rp3olLknvfPrme2NtC4qjA4sAeXggrK3QrYjbSDOaG5GTqoOaj8XkeKZ0PybhP45Cs
	 J67xAUd3s7LL5tExajU8wyMMX/q2bdiMFTo6z9IX+G32p9O0tgqefld2NvxHD+8dcJ
	 5Sjrh1XJRMmtZhy24fN1i5SwyOGL3Evv2QHCphdaE2cgLpfLff1mZAiscQZ6z+yQwY
	 m+c9Ex/5CMCAw==
Message-ID: <sashiko-outbox-220457@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 12/13] mfd: nct6694: Add a Kconfig symbol for the
 USB transport
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-13-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-13-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:33:22 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Now that the sub-device drivers only access the device through regmap,
> the core no longer depends on USB.
>=20
> Build the USB transport under a new MFD_NCT6694_USB symbol and keep
> MFD_NCT6694 for the core. MFD_NCT6694_USB defaults to MFD_NCT6694 so
> that existing configurations keep the USB transport enabled.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D12

