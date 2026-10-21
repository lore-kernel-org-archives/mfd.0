Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585528;
	b=HTAau+oSbHnsnHm2mGjcUHud+jBejq/tSDoI7ViEl9MniRu3iVYJr4asW9mzUyo1x/dk
	 SwTOPZ/cDUBqzfscS7GZyCBRpEJ+uYejw9MBzc8ZIC5E5HGbTbz/99nDN8EnCuVqlldco
	 tmWIh/iN0smhN69vZYi0OLyPM8XsKdoF0CUhh+0omLHYBcerapf1yw8aUWeOkqmSXTAs2
	 9T9uCd1d0ml5c1JHlFnOVN00nDTSO1h3e5H8WYZ2vK3KG24JTDGP8Zm3ucyRG9D4f2Psz
	 bBLyGFywgh6hmJLNrj5EyzUMJAMBfAtGbNBBmhzd7BVGy0rcmTlbx4ky3qN5xKint5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585528;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PABLCC2C/zybdpbymfvZkIdE+MK3Ak6XqarfiBr3Cuw=;
	b=dRVyGaoeiHIsusCqupm6ZCNiXUhHkhTgHhjQ3ETxibhhiGIdJVupX8SAdcEf6k1CD23P
	 Nmhl/rM7J7KeLB/14dpLgS5hgANOHjEsgjLHfDEtW42ys9B+n4vwYNbVbqeUvmyaOosKv
	 f21ExNvLC+RaHfdpwUT4Ohn5EIIPZWRPPdjFlGsRJi5InGCamsNleW0eVI8AMuc67AEFu
	 YQLuBGiXx1d8onzsE7M+q9eQUq/FWRGz8Ag+L6PV9Lz1T3DU61syde5ObSo1Pi3qB4o6g
	 79nsGBj1wEVhWiKE7ukWqZ4bWHEPyOPbvWTfnN5yDIDLUpgzAQMoP9xz4XPbQQdpMow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QN9L3GSs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F91606A319
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QN9L3GSs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D351F000C4;
	Wed, 21 Oct 2026 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585527;
	bh=PABLCC2C/zybdpbymfvZkIdE+MK3Ak6XqarfiBr3Cuw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=QN9L3GSsnNT5MYuAOnLHVrzu1jK2qKTlFBLj9Vcq9ao0fHeA4r0sGe/6oJg1S5deP
	 AQIwt/L2QrwhzTTz5z1oPxReCsxTZPbAD2ZeGC+1MwC5Rd9inxi5Z9rrpdNXaO+4G2
	 MkGrmCbsEfcMc4JAoeFgmrDe2JtGAjgtS8PNa4GGIv+WKr1vc9dtWJJz2mFFydg5V2
	 JyaFXGy+yhPsdJxwyKGfODFUjIP8ozSyvbWbh0LEefNY2SamZeDuvexjBcnxjLl3+n
	 WKZIG6wuQ3K2U6XwsZdzA9yevyprtzwjYhcScOmHgXQklILdJsQdk2OtuUI2X6FuKH
	 ZPcEKBV4yq5/Q==
Message-ID: <sashiko-outbox-180248@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/28] mfd: loongson-se: Stop controller and mask
 interrupts on teardown and shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-20-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-20-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:25:27 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> loongson_se_probe() enables hardware interrupts before registering IRQ
> handlers and starts the controller via loongson_se_init(), but provides
> no teardown or shutdown handler to stop the controller and mask
> interrupts.  If probe fails after loongson_se_init(), if the driver is
> unbound, or during a system reboot or kexec transition, the controller
> remains active with DMA configured to memory that is reclaimed.
>=20
> Clear pending interrupts before requesting IRQs, unmask interrupts only
> after IRQ handlers are registered, clean up on failure inside
> loongson_se_init(), register a devres action after loongson_se_init()
> succeeds to issue SE_CMD_STOP and mask interrupts on teardown, and wire
> up the platform driver .shutdown callback.
>=20
> Fixes: e551fa3159e3 ("mfd: Add support for Loongson Security Engine chip =
controller")
> Closes: https://sashiko.dev/#/bug/linux-15511672-7569-4eac-96a0-c08581925=
710
> Closes: https://sashiko.dev/#/bug/linux-e6ed8d33-d641-4969-a5ea-959f21ae3=
696
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D20

