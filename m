Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808978;
	b=073rchY7KQnYMh2++dMrrGyuHQKUjmNlJlTFIAhUyb11Itf7np8DMRq6+klQ/UNCqxh1
	 lCY/znCC/pPtp7s9u2/VdR8cvy4tCnphF+lSOs6u/ILEN1upwKfSmP9UwFF2wAY4gI323
	 1r+UyAOgxJM/FgC28lRIiFse7eC9Dw6kKOKCCAOHIt6jS7HbiwLz6aVq/1jd+Xheis4Fp
	 245e9Rmjbzta0WuAicCfatfnv/cktnKvAwkyzz0mwdzd1uVvCC/VuxtS+hA5jU83T7QQR
	 1O/RQCOpq0B5zcsS0AwgU8yjHPy1Ns6P902c1pGLpSWbTSJjvs/kWPyR1LUNEnfRnSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808978;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=H5hKXU/pl5SECHpQwbKsxoZ4iZ+myLDKafmSiX3vuQ8=;
	b=3hcT4pAs/QAxumCrs5+ZxBxm79jXYj4/GlDtK5Kx7ilv1eSWYBbHIDxPfP+pUTmuDsWa
	 bply4ByGb3jAB52CGkVOpHNLmvvrukOtGao2V84wdvaynpkXOVONmRsV2zdgbJXTchtf+
	 /LzjriS4Pa9/AvlfpKzMY9INnP/dlbhkYmtNUqXTMJUfF0AwcWKHBm6Xrfk9V39aFTxWi
	 iBz2E5nhQIvHx+780kG3JFDZX9hPs1Y+nShbmT7DZmC8POphtVw+DFhhYBh8RDe6NpzT2
	 4FWDLYtS799tuWTKIb/9uzXgt8XhUS08yOdJsNc1wTVxjhadxCsZa7jQFABQV0HYlsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcA9J7u7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8E6606A31F
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcA9J7u7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891611F00897;
	Fri, 27 Nov 2026 19:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795808978;
	bh=H5hKXU/pl5SECHpQwbKsxoZ4iZ+myLDKafmSiX3vuQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gcA9J7u7RfHQnHmPgux1WS2uzvpY/s/BAORp7JGhb3Xb4g3Yhj+ns1QLltPqYf0Vo
	 rA9/9o6PJfP5r8ZkflkCayapnxYpqNUgYv9jhEqseOXsWmugmpiNi6HD+O6oA+Xmqd
	 bIDivDphsgNExA5Cklr92tImI2tWAlP8dYlHAvzlxYU16dchTAcnreHvPgHxU9vO5v
	 2J2sPdXSLFJMdlnKvI4zhLc56Z7mMWsdipK/tajh/uFShgUTt8iLURtS7PgWhYtPkM
	 RZpNf+OLwwehJ5SamgWPFtHX+hhmOBJ4Irirv95q9nEVdR3xi/ejQ6JpCe48HY0F7f
	 I7CTgkglrz0YA==
Message-ID: <sashiko-outbox-238182@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd/regulator: db8500-prcmu: Remove EPOD regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127-ux500-epod-regulator-removal-v2-1-0ccab0f430fd@kernel.org>
References: <20261127-ux500-epod-regulator-removal-v2-1-0ccab0f430fd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 19:49:38 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mfd/regulator: db8500-prcmu: dangling select
  REGULATOR_DB8500_PRCMU
--

commit 7f1c7130aab1be1bfd74edd6c57fc9f35b75d19d
Author: Linus Walleij <linusw@kernel.org>

mfd/regulator: db8500-prcmu: Remove EPOD regulators

This commit removes the obsolete DB8500 PRCMU regulator drivers, their
build hooks, and the db8500-prcmu-regulators MFD cell.

> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 83a76b78e58cc..5de063ef7abe6 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -408,17 +408,6 @@ config REGULATOR_DA9211
>  	  step down converter 12A or 16A DC-DC Buck controlled through an I2C
>  	  interface.
> =20
> -config REGULATOR_DBX500_PRCMU
> -	bool
> -
> -config REGULATOR_DB8500_PRCMU
> -	bool "ST-Ericsson DB8500 Voltage Domain Regulators"
> -	depends on MFD_DB8500_PRCMU
> -	select REGULATOR_DBX500_PRCMU
> -	help
> -	  This driver supports the voltage domain regulators controlled by the
> -	  DB8500 PRCMU

[Severity: Low]
Does removing REGULATOR_DB8500_PRCMU leave a dangling select in
arch/arm/mach-ux500/Kconfig?  ARCH_U8500 still has
"select REGULATOR_DB8500_PRCMU".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-ux500-epod=
-regulator-removal-v2-1-0ccab0f430fd@kernel.org?part=3D1
