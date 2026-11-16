Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851581;
	b=Mv7gbosH262+/ywQzuYkBwlmJezotIK1K546UswH1SjBz8ScEiWy5AQZ/hJ5dzLEO6hQ
	 PLUJ1QbCNX5Os79/Ps4pxv+ez3nP/bEPTtfHp8tbf7kFZur4nUgV6tQsw/NVEFvbOsbVj
	 6zAnI/KmQft1+vO90TyyIpJOvy3ypqnES/Hl6oUauUK6BiCOA6UBrsJKvNDGGL+tx0Nqi
	 vEEwIWOFfqf6FZEPZmNTPu7ZtldknIFyoVsnf4q5nzwtevJqY0mN35pKpgNRe+j1Ddapj
	 IphBslbCQHKIL2NujYMHWQB3KOpujoXDLPb/5ZCNV3slRlSbooInkCMukKqvfnYShHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851581;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8SMbGL4aQrVc4c6XXmj+HmRDpI4SZo+C6XARik1/9bA=;
	b=0nDigy0QbsfYVl7Tz2ctra3qwHd/qeg/dcnfQRSpxV+6KtFMONfoT2xEs7NjnGIO3ylC
	 z1ur8Xu1vz7T8Cu5ZnEDOMyf9tvn/aWpyfZpnqV3zZoH15opnwiyHCYsj6qskR4YdNl4g
	 AmmhN5HruKIV2cJsvrDrCevL4j7zRhlpX8Zg1Xyt7JhtkdiojquS1ndGAlhuAVoJISqmZ
	 gBO2cnbljmzWJZsCIknczWS67rYI0o1we9EXihEzPUiwDO0IMVQwOniaiGoYHw0m1ExoK
	 Nk/yzR0fAKYBwx/jRIwVa9IF2HAMCz+aRBolo8cadky8+FLEC/YhLcEHHuIKtg4ol+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X4/jAMWr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB91606A88A
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 17:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X4/jAMWr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFA51F000C4;
	Mon, 16 Nov 2026 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851581;
	bh=8SMbGL4aQrVc4c6XXmj+HmRDpI4SZo+C6XARik1/9bA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X4/jAMWrsxrquPxHtu4+3ZaZJvV3dDZ8kWTaKnzH5UGmVVL6u3uer6s08vaOQEuL8
	 +k1kqxKZ1JEYiWYWfym5h/XnztikLm1NQFy4UlpDhaeFZeTDtmDFPjSPDJmaSNMJ2H
	 hMZwb12lTbV7qsBkl7Ar+s7RRisfnPblu+nmdBFYnETzrs7p7SMjCBrw6djhaWSDcI
	 zFUIal8szyCgXRdyM/gpQKyU8ZB76P3SIVXR56HBZUzgbzWBVhVUSctIHdVmGbwul4
	 AGMX3oODrtOGjhh9CawQ/YUoxuHt2mOn6N/xwa/Qff8b9HBUTy13RTOct0N8i2SmHo
	 XlPa6V2Xq1zHg==
Message-ID: <sashiko-outbox-217450@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/9] dt-bindings: mfd: airoha: add AN7589 GPIO system
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116174854.342912-8-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-8-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 17:53:00 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document the AN7589 GPIO system controller. It is a syscon with the
> pin controller as its child node. The block also holds the PWM
> controller, which a later series adds as a second child.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116174854.3429=
12-1-john@phrozen.org?part=3D7

