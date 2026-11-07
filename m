Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039899;
	b=Lk+9bKp/yrRiqPju5Nta32137ys1YjPROCZ8E0Y3Vk8G7Rqq1i/Yq4Fe51bikFB0vfKH
	 ZFTzJJBql3W/JqAE5yv99PC8kG1YQibnnRtXiIQbI1LFetELpzqjM+8wADKuaU4ZFAxLb
	 WFnFlbvwD7rUBCeGtfs95p8/RfuUGLujiNhYyHWf8JZ+CK5MPWVYoTfvSRi7IUQSJFI3O
	 9zqIzSgoJ126j59NbYmrW1/a8yhiwpVg3h4XxcjPZds8RM5JyjX/cvmm/s06rdqz8h73S
	 vMRXVNYrYjGK76TbN0KEZpjAYCWjPXSNKOxHtoN7m5rkQ0kE/UdEuScoT1QwrkivDTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039899;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k8sYmidGMGVCGdVVgUODVHviN+GuaehqxH5WubF9+9g=;
	b=LzLCOjkljG4c4ZsXdN4L8L+IDrUI1OOBSsMPHPT68pHQfDNQ4LnRnbZ7GLq7e1ExkrOh
	 A+9xn1Dlp3fqAQoQ2ArXwOj0NQaOsnkhCJrBJ7hIBWGsME4fUF/B+VGk3jX73EriDmwO6
	 9vR7k3PVZM9fwOgJWY5BETrzxY9nIfF2cVnlJPS95fkBkktMQ17K+/dCuIdC3FNG9+UKu
	 f2uT9bkz0n3d7QV27ZwCauTs9RxAhUgebdbxmXBKYGa2P7aTfhTeSFE/BWYYybwD4MFrc
	 YX4i/QCLmRYwszeF4+CgFzcsnQiC0ekp5ZzCGDzmJzfZolb+jzMjJ5wN96+ecNZn6OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q/0jo5EP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9898606A326
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q/0jo5EP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFE41F0089F;
	Sat,  7 Nov 2026 08:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794039898;
	bh=k8sYmidGMGVCGdVVgUODVHviN+GuaehqxH5WubF9+9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q/0jo5EPB65qNgQ2goc0C0Vx+eRXk7Rh8CWCaL63MVgzN+tKinxqaRW5FiuwASe9a
	 htvHoKu5ZMuStFMkyNCU4exCuXtnMLi5PU9Y5nNcmzxLLMkPDWLSVQqxasHE75Rg2p
	 KszQl8k8wJCizXVQW5M0RV4ilIPu1u8W/MiHBFZhQ+fucglyGKdt02Wz8qwo7fhq+A
	 8BQR32VuVMZN8ti4y7tot8zkUX8AyCcBZm5SvEsnVdjefS2ybe6mrZzA2a0FOMYEXm
	 Ifc03aSe/xcKvpsVqBt87MIlyvUfiJcKC0Jg6IfSAY91gcq++JBoSz+rLDIYz7RNav
	 u+dGDX1OJyOrQ==
Message-ID: <sashiko-outbox-202739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 2/5] mfd: twl6030-irq: Don't write garbage to
 interrupt mask on read failure
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261107162121178QffEnlezkInAnSMsrwQzA@zte.com.cn>
References: <202611071621143491uRwluLhxYsUHx2V3qhm_@zte.com.cn>
 <20261107162121178QffEnlezkInAnSMsrwQzA@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 08:24:57 +0000
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
> twl6030_interrupt_unmask() and twl6030_interrupt_mask() ignore the return
> value of the twl_i2c_read_u8() that fetches the current mask value.  When
> the read fails, "unmask_value"/"mask_value" hold uninitialized stack data
> which is then masked/unmasked and written back to the INT_MSK_A/B/C
> registers, corrupting the interrupt mask configuration of the whole PMIC.
>=20
> Bail out with the read error before touching the value or writing it back.
>=20
> Fixes: e8deb28ca8e2 ("mfd: Add support for twl6030 irq framework")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202611071621143491u=
RwluLhxYsUHx2V3qhm_@zte.com.cn?part=3D2

