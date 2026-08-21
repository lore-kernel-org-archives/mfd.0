Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF778175A9C
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283951; cv=none; b=XP010SQEtEkn4LZqYCFev0mwnlEzxJog4DIzx3VQCgYNyn5v6P0nomyxEcyvqeQqUrq1dltDfT+Qupc8CJvBRvjbfJXRVSRhyIpqtFtvajIkvJPJcaVzyadmh1m8XXOoxu4MJkKciLdzKrvKIlumDkmrSVeHANClV2kOfWBj/6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283951; c=relaxed/simple;
	bh=vWIqTcItXBL4FtiCGrq+WpRVj0Jgm+yEzBHxzWJBGjE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H++qTeyy7O0EQXrRA7f4jeMAoOqTnhJJd+sGtzBcu2sJBSV7MqqV1ZFrKOGyexXbs62Oy1h7eJvWGahyERKIELVDcDf13O7mqr7AqrmxbdBII3g5E9wVL93yWcWWMqYvBxrnEqDVOtz8eXP7FQNrf9bwJE5oybrpXJJcRHTMBms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7sq6VqA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7sq6VqA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAD01F000E9;
	Fri, 21 Aug 2026 03:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787283950;
	bh=vWIqTcItXBL4FtiCGrq+WpRVj0Jgm+yEzBHxzWJBGjE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a7sq6VqAxxpO6AAULrlDoacdazyDp1DzuG8xplhmnq5TEOZezqIDipPSYVYWq9CsQ
	 T4D7au32I+groQy4ZO1623IEMMra4hHm6E9tVl5zBH6rtYtoaMIPwSBYEvohpllqnE
	 XnxvWCMtsIiSbA20OcndIRUMcSdzHj2cNYs9Ygwk0cO9hEINuUyIeQNfyLqZrZVKGX
	 G45Ckd9g6p88+Bq67wlHe3ulT4DVQS8PmFYwmkjbH8PAZq6/FO4TQYnQGU7AuT3Kpr
	 BgbAguR6Mmt9Qgwx/BBCYqZ25Qzqba+sPScqJNk4PnRnVUELEr8CjWTjwbdiEEGAzt
	 5sEbAaLLyLDQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/10] mfd: nct6694: Extract core device management
 into a separate module
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821033505.4017901-6-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
 <20260821033505.4017901-6-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 03:45:49 +0000
Message-Id: <20260821034550.1BAD01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Extract the transport-agnostic core logic, including IRQ domain setup,
> IDA initialization, and MFD sub-device registration, from the USB driver
> into a new nct6694-core.c module.
>=20
> The core routines are exported as nct6694_core_probe() and
> nct6694_core_remove() to be consumed by the transport drivers. The USB
> driver is updated to pass its specific MFD cells to the core probe
> routine.
>=20
> This completes the transport abstraction, ensuring that the shared
> device management logic is cleanly separated from the underlying I/O
> implementation, and is fully ready for new transport backends
> (e.g., HIF).
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821033505.4017=
901-1-a0282524688@gmail.com?part=3D5

