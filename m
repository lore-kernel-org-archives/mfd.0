Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039939;
	b=drsOpsFgdyAXlrxJ8EraXRcJO8hdrMZu4O9P5xJ/UZm4XzRxBWKCmd9Appaj9n3KQdN4
	 Zd6HZ6BwH6OInwWrzZpwroZTgaKRsJbfzuLR63agqWFx0GQjUYsHBes4cFgXiQ3A/Jx3l
	 OQJo4YjTbEClVk1m5t0IkU1TmmJ0AfxfXSqQE95PttFc+ihEzVDuSa9aaAkZUXqa2ZL2n
	 og6dzO2kYUWZCARC1jbgUqb2PEye6ywbeSNaodR3HFAgI3X3gdQqq/+SBzqAfXgDhYtck
	 m/DYN5kzAlQCJ/z0lqEgUknRAcnilI0lqP1Za28vT5394MTqInExIO9a6onAzfZCbmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039939;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hVXduncBys9Nq6qjcKoat3TFvq3428NT2e6Z7DX8Xc4=;
	b=U21c2QwaO9BSm9D4h/KyN2Hw5qbdUNrDPwULZhgeEUDDLV04eO6K3W0R9qosvvD3Sg1w
	 Pu+hT5eFl9cNoMlH/vSGJe6vq3xeAVQCXir/8ooy0EkXGpigEN++UkHaV13zmfZCL5/7i
	 RCy2i1lsQjUnaPDfK+bs755Lg6F8sa9FmS2tS6Y8IiQ09G27gN0C0wTi5ZwS1/SU59Njw
	 wWvKLi/DICLvfSDoXGmnCTHScQ0+EBL60n6t5dnmn/xh9qFz7rwaY3wBlxPwhhPhtaYh3
	 esmgAri5CIfPxBVBocIZKkmFMxf/7C2M6nUr0ruqJGKkHg2Gz8X2t8fepNLT7gZK4zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tok7XuMZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576C4606A326
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tok7XuMZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E855F1F008A1;
	Sat,  7 Nov 2026 08:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794039939;
	bh=hVXduncBys9Nq6qjcKoat3TFvq3428NT2e6Z7DX8Xc4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tok7XuMZVUD8T19JdMdDifRohaRO8Tz8BJq76DHsaIM5Hje092w9mCAitHvjC2HVS
	 f7h8ziXorU0kiLnt0bE+WnDm7SiMEgaBDb/zBHR6MxVQEonDp0/l8oVpziPMpzPJFy
	 ZU2QnWD010o5k+usdLv2zKV/8k/li/z3JQFb8SNFuJ1LB6h8onEZhAm/JXLUevk5/m
	 hEDWe65rL1ZXvDi7/PoFueF1B/UDIeZMwrGjdHbr6hd8Ab+Sp2oaH2NoTHhPxbjrMV
	 iKRxU0lP/X1IVFPrvKIlcFBNt5fL/spSxoJ7DYG0V4CzA25CDmIOPnjHHvGd6ZKLxG
	 wwtbLeA7KsWVg==
Message-ID: <sashiko-outbox-202740@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 1/5] mfd: tps65219: Fix out-of-bounds access in
 tps65214 IRQ map
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261107162119836VR3jHjgaOF-Np7Cmm0nl3@zte.com.cn>
References: <202611071621143491uRwluLhxYsUHx2V3qhm_@zte.com.cn>
 <20261107162119836VR3jHjgaOF-Np7Cmm0nl3@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 08:25:38 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>=20
> The tps65214_sub_irq_offsets[] array has only seven entries (bits 0-5
> and 7; INT_SOURCE bit 6 is reserved) while the corresponding IRQ chip
> advertises num_main_status_bits =3D 8.  regmap-irq's read_irq_data()
> indexes sub_reg_offsets with the main-status bit number, so whenever
> bit 7 of INT_SOURCE is set (the power-button interrupt) it reads past
> the end of the seven-element array and uses garbage offset/num_regs
> values to compute status_buf indices, which can also lead to an
> out-of-bounds status_buf access.
>=20
> Add an empty placeholder entry for the reserved bit 6 so that the array
> lines up with the bit numbering and bit 7 hits the power-button entry.
>=20
> Fixes: 7947219ab1a2 ("mfd: tps65219: Add support for TI TPS65214 PMIC")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202611071621143491u=
RwluLhxYsUHx2V3qhm_@zte.com.cn?part=3D1

