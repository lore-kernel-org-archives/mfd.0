Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336075;
	b=BSdgmOZQCKKyOu5ompIS87IXXYmDB+M3iGKlu4FXqxEUC9SzF9+dFiT8RR4klfBL9Sjk
	 2kMH7+lEvnW4lPJ1TjESZm6A8cdfcmVE0JSKr9RhuZnAPCXSKwL73M7VqjjxR2M/uqN0h
	 QsNwSX6wSnQhrEqTSX5zW/FMeDiFbAMszth3jXse1/MEkD+a4Kq3lX1cYCUSnB5b4yZuo
	 j+Yq1ruE8vyFVloF3ipDox78IiZy4wWKZqGf9uHAk92EKe102o36ge7jN/RzeaMJT2Um4
	 H3/YVO5kDsmpYX073mTLR4Y+i3bm7WG7/iO+q/4D55HVfb+KkZb+CmjStd+kX+1eakQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336075;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nfzTC+9vMgHChJtL5xJ2r7DLPirDLztcAUuyp/Bd+JY=;
	b=mtm2FBLnmynCjK46AOXAFJcaygC4ie7yWdWEBqyX3ul1GttrRplcrmmFvNeFe45qMk+C
	 beqD3BzMRdncUcpIchu8sFBptJqCM8FetbeP+q8YjRf2eDazD9Ln8P39mcdtcK5M1AoVL
	 7PZ9j8I9tLZQ1c0Y5i03PHHwANs7sO45BbZ3NEnbuwtfRO9ZkOxYOidKRbfPblXaIiFep
	 1iE1l4xMz9zLXughHrmjslpvlbtQyoAEd9M/ZftInehYDSKjcToWyufqplIYoi17itb6m
	 747tnxiI2UN1GNo/BL0hJ4k1OyjFdVIFwtVki9e7bCuzkA9dS9Gx1tJO0F+ZovJKiUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m3/7tWD1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B489E606A320
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m3/7tWD1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629E51F000C1;
	Fri, 30 Oct 2026 04:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336074;
	bh=nfzTC+9vMgHChJtL5xJ2r7DLPirDLztcAUuyp/Bd+JY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m3/7tWD17zKA1JYhqldbH1l/tHB4vZruV+4e3fIKHj88KUysIRqzpWnJhoGzCkRI5
	 A/s0MdEToMH6c++eMsbbZzMe8HiL6mRIQ8O14yu5sNqeJM/MBmfN+ZuCRKy1cvMnyJ
	 F5i2Ym9Y5t1lk/9ssegfLwG2lYIZV4SPH5Bzd4Y+pKFetYFEErejGgTudFwc9sQ8ti
	 sKs2EjlIoMjuImV1U0mB4RfYnKC6qH9nWKTPal5/36U7qQX7nu2lYwlKtonZ4q+6WZ
	 kjwSYb5frpkxQX4HY9Nw+U/IYFx/Vec/fnz6YcClRr6sRw8yCLhzHapFFmHIdMz0MR
	 uvu0a/fnv8lHw==
Message-ID: <sashiko-outbox-190511@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 3/9] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20260915123812.14747-4-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
 <20260915123812.14747-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:34 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
>=20
> It does also support i2c and timers but those are not currently
> supported/used.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123812.1474=
7-1-ansuelsmth@gmail.com?part=3D3

