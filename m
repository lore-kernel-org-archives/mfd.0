Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446784;
	b=I5PaRTAL4LKNLn24nnEIXgMEQvyUZLIC3dwhfxUSiz4/IT+XSkmgax3BMZe95KKPHMeE
	 489PXlRmCmYJWlaWRZ+JBpANvjTCK0j5xgquePqWXnnPpSHRhnCH1MdBCH0wagVVrdckx
	 KouvBvS1Cly/7Qpl0w6zCbnPmpiOREq+nbI4Q4ERTQSy0FAJlvKKeAgHHq/XcNGg3jhZ8
	 3Sy6ykfe2i7W9rb6zOWqBmAOQRwIZSCgKO34dZLhVxM9R7VL5WhAS/PAkSjDW87ZYMc4+
	 e+zkqF7Z1ovA7L5KDV/8peu9NNnnYKSreyGocHS66/L7TcEY4gpCdGCG7oeiHlvaAcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446784;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ro2Chfw0QFibWaVmiO66cHoHw7YDEXNrQDCYrDP95oE=;
	b=Sj3bAqnNALQeAOkPYcY70pkQxup0q+AqnN2eGY6AuP2GpCVvdBzROG8m1D6uTpb9Wvmj
	 FkprpzumHvyjw+cIsymoctUZUOSJ7zj5tmlUTPH7XAMWq59nLnCMXH/EJmWzesev1o3jk
	 THKquAlB+Q5u75JOGLNsp41tQKv3QfR3P6J/NDn2nPH2uf7gkTiuvl2r3bL22rVbFwGD9
	 OQbvnyNgSzAKqjrYtF9bjYocfk35FCArb5jK8mOCnCIXaXk1KPT8RCKCmcH3IOIqjIUwC
	 Y4Z/flYyhe5zwz8fVMum2jWqdLuYNLjj4HJabYeIIeP8cMlkAKjf+DfRXJLFBr87xJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzNqZo0M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1169D606A31A
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzNqZo0M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7D01F000C0;
	Mon, 23 Nov 2026 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446783;
	bh=Ro2Chfw0QFibWaVmiO66cHoHw7YDEXNrQDCYrDP95oE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lzNqZo0MLXdPFlAknpYjZXpYwYaqUKQ7GUY3Zui71hjRfPRN99AdbqSZZZ8utKcqZ
	 +V0vWQp8JzkoVjq6u0B1/OUPEVyXxYYB72fvHXK+rjk1FNkGBAtFUDKSs5pCXfYFot
	 wHpsi8Lg4lUUqs1fc1vJ/ssSAY4rmAVWfGobkAspD6MKqWBiDgvInq3KYqrT7zKcyZ
	 FCILPF0tRABHKxCE7R7JqSgJ5kRBxlQSHYx8dX/4Mvhq+0LNCnRKkFL4n4vhFk4EH0
	 jCHCQHZ6DY6KGSEWncm4rBo0QYofj5TI2D+veD8MFP86oEMvmO7JkcXCSoSfgHnaOg
	 TP9gWahcIaJYQ==
Message-ID: <sashiko-outbox-229506@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 0/5] mfd: max8907: Schema, pdata and poweroff
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:13:02 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has finished reviewing this 5-patch series:

- Patches 1-3 and 5: no issues found.
- Patch 4 ("mfd: max8907: Convert to use device managed poweroff..."): 1
  potential issue (1 Medium)

A detailed review has been sent as a separate reply to patch 4.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123150224.1996=
01-1-clamor95@gmail.com
