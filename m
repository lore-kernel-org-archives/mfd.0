Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039893;
	b=nCwL5gP0iVAGqdHcSvnicdgbLMioO1e4N0Vj1aCbZqgErJr3XjUin5QyQU29nHsd7XlZ
	 2xzADxu9aJqBWRt+SBjUBje84JRdbZB3VrRpD9Ngo0wc4Td3JlkJq7B0ssHm5Gl2nfVzq
	 DGZLpqutDbpAN0msf3mvCO8CR1D6d4+6scEuifw/tYAYCkIrOmfKmNKIFB+hUIQWv36tf
	 vu2cgAeqq+y0TGCBBhnbfhBwIBNNrWEhcNhNNs5MQYgQTBBmsGkF0utD2ExUXt04wEMmb
	 rGpP2FgWifqFUkwUa51gjl7c8QAVhrUpRQ0rPIKDoAI+8/pLGHkwsm5Qev1a9eqp3zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039893;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5FoTTMGy5MrfLGz88a4ccQzyTLDC4lZPlqqMefB0Ids=;
	b=Mvx3rma3YIbDCgGGupsV548rn7lkShbv/cM3CKNc1cGp/f74PbzFKeKXotR/y8iQGWSY
	 QZq6G3TyMPOUBPbafw8s+wf6YAdDtAu77JXzJYimQYFifyZe7NIY7ev+Hy5734XhKE5hg
	 1JBoVfrUepxSyh8wLBszX49lI4h5NqQinl5Kaq4qipcYOOmQd5Gjjd+y3s8TQczhxP1OV
	 a081wGWvefpcc09STm6voZy00p4JJGEdNzy5L8R6LP+Hav18pVjBAGSCne3dDfA21kJ68
	 oj1S7wfYFreweljxnEyNw9KQk5Zv5H6K6QegFIC5Mey2p77e3jtXmhseM5eBRd+4nIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfIx3SED;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC34606A326
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WfIx3SED
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945721F0089F;
	Sat,  7 Nov 2026 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794039892;
	bh=5FoTTMGy5MrfLGz88a4ccQzyTLDC4lZPlqqMefB0Ids=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WfIx3SEDzJahxDasa0/CQoZ6EVMKCdDFp9hFwWYKqHbhpyLIzQO6RX8I/nOtmycVH
	 0wJ8D6TeHF6D2DypxzfX0RwqYdUE0L0ALwMmJfxskL05ED7Gg9b9PGsSjO3cLgMAXN
	 5VjeqDl8XPlJ+Op7C98UKIYJPdkp4fE4xa0ky4qaDut+N1uiXF80IktpR0qed5b2Cr
	 wnzerny3zrVUVPnC7l9p/PuklcYYvXD9Mm/6vMZxp8m5K3UmDuIyMMylvCqWNqV1sq
	 oNgFl+hYjvbq7MMAcj2qIsAuc9QTvxtM2jowkXf4OLLvFNjmLNS0YIFW+7Ci9Nyl0l
	 M+XxwnEgffB+Q==
Message-ID: <sashiko-outbox-202738@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 3/5] mfd: arizona: Free info IRQs on probe
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261107162122461AuQ94DzIh_R4gD8FWdVlC@zte.com.cn>
References: <202611071621143491uRwluLhxYsUHx2V3qhm_@zte.com.cn>
 <20261107162122461AuQ94DzIh_R4gD8FWdVlC@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 08:24:52 +0000
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
> arizona_dev_init() registers three informational IRQs (CLKGEN error,
> Overclocked and Underclocked) with arizona_request_irq() before adding
> the sub-devices.  If mfd_add_devices() fails the error path only calls
> arizona_irq_exit(), which frees the CTRLIF_ERR/BOOT_DONE IRQs and the
> IRQ chip/domain but leaves these three requested IRQs behind; they are
> freed only in arizona_dev_exit() on the normal removal path.
>=20
> As a result the three threaded IRQ handlers stay registered and
> irq_dispose_mapping()/irq_domain_remove() in arizona_irq_exit() act on
> virtual IRQs that are still in use.  Free them in the probe failure path
> too, in the same order as arizona_dev_exit().
>=20
> Fixes: 3cc729869475 ("mfd: arizona: Core driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202611071621143491u=
RwluLhxYsUHx2V3qhm_@zte.com.cn?part=3D3

