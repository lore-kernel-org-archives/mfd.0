Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518041;
	b=oWhf7eXT8nihL/BC+QVcsL6nt47LMyw3bj9nx6bfXdemJbUfdO10St98kQH0S0xG+CrS
	 N5TxiYCcpmGceqmDjmacrOH+rcDc3sbSKkrso+KvbfbX+/aXRUZvwn9/BY3XSOfAFGRS2
	 ji+cegNPiKDgFrkX5uLHm46PmReGzlCzS0GU3usnl1ztHke3mWzOL5mMcwuhNFEFLaL4M
	 D+Ohe2viEm0fqq2rTsdthxGqsQ0Jb87I6t75orpF5S24wA5xbEhpWPInEeuejCRI0CB0o
	 Yp1YtIEyEiZun/3pb2u6jiUNa8hK2tQTZIbIhf0+ooXq1QKJ0juVjt+eDwY399crqdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518041;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sER6w4KEakxr/Cvu5LvjJ/YK2LYKaWKe21V9g42bM5A=;
	b=x/k8dtrqe/gFk2rH7qIiNjADtRv3vTxFcy/Lw1dfGUlv0gusAAp313F/7c8Ma3ulLYBF
	 BY6P32+3geOfJHWi3q/v6tKR/e8x1LvdR3Qls2+jI5E3q+dIxLAwU69MHFc1Y4kZSIGTT
	 3EkkZYA3vQCDg+lYwKrpQR3hFVApkuKJ5VzYzUa4Jrc7bdqlv+B7z2Oa5R52U2Ny6YVpG
	 Y5v27RinkckiWdtpPQqsOLaq9CVurugYh3p/WFlJM7APoTeUnL4O79uRve3uyOQptEYys
	 Y8vnRSAYHSM7Xyoj4tL0lqm2Wmo6ZZvk8v01wqMJKxwnGxPQwvnstRcx9LhOADiAKSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB926606A320
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD281F000C9;
	Tue, 20 Oct 2026 17:40:40 +0000 (UTC)
Message-ID: <sashiko-outbox-179430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v10 4/9] mfd: mt6397: Use MFD_CELL_* to describe
 sub-devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261020173556.632798-5-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
 <20261020173556.632798-5-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 17:40:09 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Use the MFD_CELL_* macros to describe sub-devices. No functional changes.
>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020173556.6327=
98-1-l.scorcia@gmail.com?part=3D4

