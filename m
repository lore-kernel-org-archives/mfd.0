Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893279;
	b=nqM+HOK+FccIH8d5IoTJIRF9LUff957AWQ+V8YX7gjDxjERLxyNvnWmZzW6kX3PINn7/
	 Yo+zKqavtMoFQiVyQF4GxAKKqpFUtH4oCkFvFJDh2eNb7ohY5ZunIZMad+KMHvbs77O37
	 y+ozHhWHG0ffwXzGq2B2p4sPUwHytXTrg8/wzodkoGgvagdy7IKDtJsz/N/EqCVW9P3lV
	 meOC6GoVtcteLxMUKFbi1UKVJXsuIbKHAgaLtkusNZ1YWw/bfvuR+w4gnesXnDWiQavyd
	 K6F/S18aJoopKCndxjz2QT5nK/vbwchj25/ovAov1/k1WrLktqUJol0R5TRz/dkGdOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893279;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R/ub1vL4Nr4dClAo7aaSapM8d2mmeVuToeN4pII2/tc=;
	b=1Kh7E14k1K9hulEVCsYjUDA3bWzLOWKEkIoakX55fqG29WzHaeEJ/qQVe+U8hnRRsKp9
	 zEz2Esolw+upSZAJ2imEeeckJ6pE6mGD45TkoQOiRJZwzzInVqCxcG2eBPQmrNZUk0SSL
	 ZVDr4TwbRLtQ8lHiZivijdhIpjRTMD3ha+jLfaWJNjIBgNBBbW8apE2764bud5NuIEQdj
	 8lir1OaMUad/4ylLtBGC5cgXuDHm5SLdxrx6nLBmEZWytAVPtgWRxW3SF431Y6KQBB/sk
	 cFyYDnFL5E15rdEIHZU1+Dh2thpMAfNL2zqYiZDPVkNWO6rXxHqToeUvp+F42kRnpPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPYs9Kpo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE3F606A32A
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 05:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPYs9Kpo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DC81F000C4;
	Tue, 17 Nov 2026 05:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794893279;
	bh=R/ub1vL4Nr4dClAo7aaSapM8d2mmeVuToeN4pII2/tc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SPYs9Kpo5moBBT9ZFtc3syjM7Jap117uLpNOu3os8WK39YCyC6W4FoLh1sWUWPK0X
	 aSM0i7VSZXzRT1iifk8uoKs1ymc7SpX/+wfpwG3e4uwBl4bJVGuW6/rEyQC9+rmnni
	 ambvto4hDjWSrtPRIfSU5G02M7D2CSxb8qb54HAMlFNwOEhRQYzUJUcvX5/rn8iQ0E
	 KpBmEN98UeQhQ1460AZvW1tooHWQl9kBkAPVjALNWDuhDQUnFUZct4+Tk5QS1rYs1D
	 jGbrksk1Sb0DIidEcLgwu00Q7JV5mOU1nr7ujzkBmj1HwHIsp7V5tSvlI98xCFBKbL
	 CZ43T4qf1+ZaA==
Message-ID: <sashiko-outbox-218207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: syscon: add T-Head TH1520
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117052456.3747585-1-zhengxingda@iscas.ac.cn>
References: <20261117052456.3747585-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 05:27:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> T-Head TH1520 has multiple system controllers for the "subsystems" on
> the chip.
>=20
> Add them to the syscon binding.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117052456.3747=
585-1-zhengxingda@iscas.ac.cn?part=3D1

