Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788845;
	b=VJ8B9FuvrigKIoJhPuX7FoEAUbJpGgpBpp9XMc5OW+F4FcyLoBuOQV8sNUo3yf7aAJoS
	 TzHs9dpP+FVL+mewU1o3Lik31g2WPnRD5S/hhFysCCTz+yzwPQRmeBnoNHzdxx5I46fLO
	 r05E+1qF7riY6Ym/5vc8UlYCxRbtn6c9KGLykAg0FW9qpqX48jdg76Eiw8zg0Sjg/Z1RO
	 p171Kb24giyBi9bopo1f1IDWQ2F3MwzqEahdeCN0FTxNLoKqeDDxQzI8V7Ri/7VF+E6Dq
	 sbr2hH+BKD/EJoQhfebKC9CUCPltb1vKqS3e3B9hZnIwHEWdUYzogC388HibzQGbzwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788845;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6nNJseUpPWduPyQ2LIQ8+03rrWz7xWtDnJFiuZlMSKk=;
	b=WqZLyKe9lfBiiudRMLZSsjQlEAMOJcg2vyXxaxVmQU0sF3SLtyS2sMnFItasQrDqJ+9E
	 Qh0QtWz2RXGxHzTeoctCsmpgL8aT8GUyZKXl6ignhMd/gPNO7N4KhAQERDBLrn0ms/nol
	 7ePtSPEQpb3byucNWKcfDX6X9RSmID8LtQENG52WbnpQ/bwjpJNoC9opRut25VR7o3Ffp
	 saK9MhfAYMiWNQf5yfqvHGcBQ2srMrb00uJH8pEbXYQ4DEMyn+ayuxk9KIshyGrmnnB4O
	 gUS1H0i9Zx7n/R8I4VSuLbW+ItD1LI3nfBemapMdcnLKuelaPC9ZpsHzRrF7IkSfscQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHFVGwv2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6215606A31B
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHFVGwv2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3744E1F000C1;
	Wed,  4 Nov 2026 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793788844;
	bh=6nNJseUpPWduPyQ2LIQ8+03rrWz7xWtDnJFiuZlMSKk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fHFVGwv2EjBiEHC3pwmUz07Pn36mjH81+yDtsP+VCdcjFYAcChkmcycusW8qn1pa8
	 Ln3KYgPbqHLGi0Rc0rv5UHr/s2vKFhXofvqHbjcAgF+wAk9HD8gypORDnPT5ZV3k57
	 mSloIojnRJuy+ukxF/snEKrwGIx2+HH3Ts16qRdTv/pXxmEm/9/Z9ZvdF5z6QjsHdN
	 GL4NCQRupa4I9hMLYmDnxWiZ3DkEmI/MSCfmDiEn0ekh1//Hvacf8UXYCs6NnlJMdF
	 K8NSDbpxxjcwgUNYPbnzWVdN57Bi1a3enKLJ0sByBIBdfTk/SxxmszinIfpMTbpMMC
	 7dLjG0DXjQYtQ==
Message-ID: <sashiko-outbox-197109@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RESEND] dt-bindings: mfd: syscon: add
 aspeed,ast2600-i3c-global compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Glazik" <dawid.glazik@linux.intel.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261104113206.3243865-1-dawid.glazik@linux.intel.com>
References: <20261104113206.3243865-1-dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 10:40:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add aspeed,ast2600-i3c-global to the syscon binding compatible list to
> document the AST2600 I3C global register syscon node, which is already
> used in aspeed-g6.dtsi.
>=20
> Without it, dtbs_check reports this node as failing to match any schema
> on every AST2600-based board.
>=20
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104113206.3243=
865-1-dawid.glazik@linux.intel.com?part=3D1

