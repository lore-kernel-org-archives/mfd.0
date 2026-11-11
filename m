Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428578;
	b=ALlmVepXd82Ls5nHfbe1qiPheRqn/X7AhA43AaV6/j19svz0+6ibjBv6+jZFO0u8v676
	 H4i4pFBoUVrX+uEL0vd+uG1/6k4W9YR2Q3oTaGDJ6gZZN0Xipj/fkL3wXnTwD4ZL1G15t
	 qHxAW/N+Jsg5W+CPt3OY0U681aHzj1bRIV/5KRJLwH3Zu2baVGKaK/WV8x3Lo1u6Gxt+v
	 MEADI1Ho5E2QCPoL8tM3qbEljXbaCXIcvsIpIUtNL65vGbOaXqQe8O7cueetZqmDPDLWO
	 twpuqvM8AZcLcr452rjw0CoMm8q88TwudOIEwf14GoXANBJRT9ZGlTlRpNN8mJweJFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428578;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4jbDueM5m308by8S2jO5TTXikNSDs+2dtmttejgS8Qg=;
	b=CxY7CO8j6pkmBVqRchvCdySNLQP93zMQeTIpGioDh++pSVxb3rJk02g6NJ2/BqaSaEmq
	 k7QlZcrInvf+9S67CHz46MwTSQ1NOmKb7AN3t2QEKNT1M2CABzYuFlGM/oSrYQKpDgT/C
	 hf9kQifan0CbsdOTkZj4kUUV1sv2EF1piBHSlmxFLh5N1jH+Tmhn8wzT9a7kfUWndhvGh
	 pSeAdlkx+92owpQLa1N942wWRF6z6milYQRzxmcg8E9vT1SeRD5/zR/8SONzk+dYb/9pO
	 Vxj9eYBGVQhtTT8bHokh/pcQJHGSvDmXVSPdck55vtLQ0qeU97rztGksOxwO498yzQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AiZzQJQO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C77606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AiZzQJQO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D551F00A05;
	Wed, 11 Nov 2026 20:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428577;
	bh=4jbDueM5m308by8S2jO5TTXikNSDs+2dtmttejgS8Qg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AiZzQJQO3Bk6tbFUj22DlhlaLYajFuoN5PJ6p+ujuPb3MuwCBWC5k5zY3zu/qaHhA
	 VtrMASUQpCwxkRjpuocYAv3F0F2Xd2dwQFvuDXjzGhHlUB2TcVYBP55Gu0DK4qxvmA
	 UxeKf+Ude2PcTbqB9QIVITszvRIRJdAjNGMswhjEaaWOhvThRNVX4m6HsdbTCCpn7a
	 g3X/X0NXj43HFC3r9L4DY0zBtr2vmzL2ThD64/njNW6uyxD6PgfAkEfdj2VBz6Pdg6
	 T6h5+f0utDI9o8LI3QolqKfrhNmkoDPKAtSBhy3hPFB7oD8Qfyx3EqcXi8MFb/a95Y
	 HDowXviktPqhQ==
Message-ID: <sashiko-outbox-209646@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/12] arm64: dts: hisilicon: Move non-MMIO nodes out of
 simple-bus nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-8-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-8-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:22:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Move non-MMIO provider nodes out of the soc simple-bus nodes.
> This includes HiKey GPIO range helpers, Hi3660 and Hi3670
> reset controllers, Hi3660 and Hi6220 thermal zones, Hi6220
> stub clock and USB PHY providers, and static CoreSight funnel
> and replicator graph helpers.
>=20
> These nodes do not have register ranges of their own, so they
> don't belong under an MMIO "simple-bus".
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D8

