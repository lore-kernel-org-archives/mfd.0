Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095854;
	b=t32sg1iAr7g+WyU6oCDFds3tERrDncRH3YQYVJVJCtpgL9XZOOBR+6pooa3ocCmHl03r
	 DSiDtSg73Lvj+EQJ2iTTTL8WVqutkf/ema6bXhEttAh4xjrIV8tGeGYYkVvj+39++h1KF
	 BTCxCA3rfbP46xseI1b2m1sbhUK+afzB8y4odJxiV2H9RJJOqIE9E07TxDkFUbciuYdFE
	 umQ5PBhVDnd+uuI/D2uUpCYjD++mJ/hg9ueIlIChzZvrtLb0j5ElFwJqe140NTh8W34Mo
	 5vMxGGZSr65NOo6NK6TswjPyj1OdbK7lFKniMb6/mtyYwSLqwcJR3CewdfBv9S/xvrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095854;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EkQ083xnw/zdCw32RxfVQydEGMLyOU0/LGBPpE1A6+s=;
	b=VirKG04Kgyq6SdsR2PhhjGQomQHYgoYFu0wd3vHJfGxLjqVXXOYVD1lR/5aowk97C3tE
	 JwmD7HGP03l3Fy7O+99eqlrrZgh9yLyY6Cr4EgpPVv3wpOonhkLQ0sgXdpD4Z4XAAihtM
	 LcfqKnqAdK4IHSytEudgxr3VKlHncBmJsWF9zjloncqyyV4IOXzf5Mv8qIxT71appm1hl
	 c4W7Z2WCSffyTn+TCqjMt/3ffk3kfCTBEo1A0yp+8m/CvmejucQuq1XRx9QsuPLN7CaGo
	 NdH+Hg49fZaaYjvzrkdkIXRSenE+OTh3Xp3LpQXPauEOz3qSQMxcuGF9R6h8t51iqcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyClNSuI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AC2606A320
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyClNSuI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A39F1F000C5;
	Thu, 19 Nov 2026 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095854;
	bh=EkQ083xnw/zdCw32RxfVQydEGMLyOU0/LGBPpE1A6+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NyClNSuIeHAPe/+ivBqlpysyOl+KjxvzZqqJR2LHrmCGdMgwJ4v/vmgs+VgtqcLyp
	 TIBy/YwrDFNmgwiIhUuAbGLcfCSb8dWY1sLtL8CXuYM4xYcFLkfJndFAsZP8shws+V
	 sZYCbnsHi4qdci53I1J4BfYw4Vvg+RgT50Q2pJ2N07gPnWB6DsYIt0OlHYc2sowuzR
	 jlAXsNmT7hZBQQ20jXIp8jLjUTe1tzUN0I12J43ksG+DSy9ijhekqLNxCtde9tusC5
	 jccbgIgLLJIxhEXKS3Pltmk0kvVpqtA7vDsyuf0VbqFvLz/3IZ2o5kLxJU354Cmgx0
	 37YDUFue2XRUg==
Message-ID: <sashiko-outbox-223197@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] mfd: mxs-lradc: Convert to
 devm_clk_get_enabled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261119134041.16611-4-festevam@gmail.com>
References: <20261119134041.16611-1-festevam@gmail.com>
 <20261119134041.16611-4-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:44:13 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The LRADC clock is acquired with a managed helper but enabled and
> disabled manually.
>=20
> Acquire the LRADC clock with devm_clk_get_enabled() instead of a bare
> devm_clk_get() followed by a manual clk_prepare_enable(), so it is
> prepared/enabled for the device lifetime and released on unbind.
>=20
> This conversion makes the code simpler.
>=20
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119134041.1661=
1-1-festevam@gmail.com?part=3D4

