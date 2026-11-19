Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082685;
	b=ctyXSgPKmBoFp2n/LdOwWFHNjPHWJNTr7utIMiQ8GyhHvbBF/HCwkbU9VZdoujbPM171
	 Pxeyc4TeFA7RHpXRILPhi7JsXfgezASgNhCG56CLJkdinW8FfOOfF4tZSCvPtEol0IYGw
	 7teJgc7cNmMRZVHKpEvsa1s77zmubuFW2fTbVVwWx3/OnhmTblodfyniQk9atLrzrSrWz
	 m4jJkCDlt07+mItpg5YA02iQY/KmoKiz2s5Vk+mu3BskKVHaeKTg7n5BPVrfAKOgPpI2S
	 GUNt2FUck9LnT/onQFGWgeV8JV25KElPJdyGF+SdBwb6WuaIxugo7AosJgvMi9V2pyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082685;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0QdpCfRBB81o+QZ8mV5MmB9YhYqPRbFe5O2X5vUaak8=;
	b=RnxBJVVBTqO7Ci2SwK2bGgHwoT+eGsyRANIC6ikLfrS8D4m1Rq41XGVPkYMK1E2cjKQD
	 hocpNnQmJYISnCrjg3Fj8NBL52MgEeOMTrI1fCmkxCDh8RjJhGSjb8hSOHqWHVgSLVn2q
	 iQISLTjhTMlTvwonOYJ8AzSQcBEmZIGBl3neqhNOT9N5KjYLgIYGR5ZvdOtGHN0uqqr0E
	 5T4ibGaj1NrI+/aehRSqiBFAIaTi05ZJ45oSr8gn8rRrHdJjBWx4gFAe4FuNq3G2yZ68A
	 TPa5Y/Rs4MZ2uFi6eRtZrOV2wHrLbc9M9W/huEUKaPGo/8QKWMcFMANAKms2C/8yRyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOe+aPg7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C5F606A320
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOe+aPg7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9273E1F000C6;
	Thu, 19 Nov 2026 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082684;
	bh=0QdpCfRBB81o+QZ8mV5MmB9YhYqPRbFe5O2X5vUaak8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XOe+aPg70S9ySHTRidrQ+lse+QO+oeDfxxefnn/e0s3HxE7nsX8MD7oP4zZUomBHU
	 83RsWCPzXu2UuF8zWOWBBAgQEW1udT4msE2YZLJY/SArfyh4KxMg1jtP3alXRvNO9t
	 lV2e3YdJI6RqZ7toO1ihUvHwS2s6hOjIFr2kgBYC/7C+ps07WcB7LahDgJKaSAV5bx
	 oz3wVsuuo8DLskRM1SUm8Bbca9EWSXwspmoOPHPp/tVe+ZDBcG/k1cRINqqTVqJCFP
	 gxOllr4OqHman8DGLVyR1Aqcgmh52J0z7BusuctBsBrggf2qel8hLA2s+KYQcaWVuv
	 3VzzEQpmDpV6Q==
Message-ID: <sashiko-outbox-222906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 4/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261119095449.555593-5-lakshay.piplani@nxp.com>
References: <20261119095449.555593-1-lakshay.piplani@nxp.com>
 <20261119095449.555593-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:04:44 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>=20
> Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
> These devices support downstream target ports that can be configured
> as I3C or SMBus.
>=20
> This driver enables:
> - I3C/I2C communication between host and hub
> - Transparent communication with downstream devices
> - Target port configuration (I3C/SMBus)
>=20
> P3H2440/P3H2441 support 4 target ports.
> P3H2840/P3H2841 support 8 target ports.
>=20
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119095449.5555=
93-1-lakshay.piplani@nxp.com?part=3D4

