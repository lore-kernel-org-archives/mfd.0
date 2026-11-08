Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122257;
	b=UprznqY57A/JOY5idtmWVFkINwBNJDhwJtEO4qDIxLwJ2raVEpGZOJUpF/BDCE91/HLa
	 tcbQWvmNEI1Y6+7JD9jtvQcHNCVczKX3vpaYvUww3qNc7k+jdc5rkn3mHTj3JK2Z3zvCX
	 YaqCLk5yhFVJGvuX6mTvKV/5jUbK1aJ6MeQPw5znKQkGu6HNrLSED4x6jUwUjVlgpz5CI
	 ddREtd2jgL1dgw7UiO8bErFFSi0QCQab+4YeRlpn/+qSZR2qJ69ODbsaoHDhsiyqHEmGx
	 YxPdJ8DGItH2kbEc8O+pIHm8orInLwQRuYiD2owuE11kUiV4Motdk2YrzbFxLYt7n2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122257;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PHsBglHo/pA4DuiOyiLJa/uiBup7glCp95VAP+eJQHM=;
	b=PF6+MappVkE9sh2+1aOAHg7Kso1YvTSXHsrr6Dkv9dV3IxMoLDWzZHQmJY23Xf5Btfhp
	 8LDEAGiQpqS4DpMoFrclCCNNjUR9LQyY/i33B92gE172UV10pCOwIH4n8bCQFwUWvAoip
	 UsZlpqgerCE51Eqcsv7hrtyVsXilzESfQpI0vhhVaP4K6CluL+ZkqH8os5BYyBYCBk4Gj
	 Hb2InEaQQPdb9qd6fE0DuNGBLiW4BANPexLg52VJtBXPb65TQ3E0WniEyi7DntgCJv/nH
	 /A0seV2Y8gVQRwM7RMd4iVT0CpD1y/umtgbbWgD/F8wENQEZhloLVKC5jLmIMZaadgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N334dJVT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BD2606A31C
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 07:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N334dJVT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744FD1F0089F;
	Sun,  8 Nov 2026 07:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794122256;
	bh=PHsBglHo/pA4DuiOyiLJa/uiBup7glCp95VAP+eJQHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N334dJVT0fg+Fgxm7o45HGAPbLctSQ6S5CKElvIV+X0j6tLZnEHmO7ObyJy7VW37q
	 0dvrN1/yOB//DXP7qn9u2skLDE85r9G/sasVGbUO/wj/Dzr/SBMqy9h/ojOE0VSfEo
	 lvif4Xrbo74Kw+L/BIE459hcxjGdrQCoTQj+FQpQ6zzdU7u6DF4fKegE2Gk8YU39C5
	 tpL2VFBDvzYJ2TVYGg44Ge69hHB6G1v61gNBsE1O/bDr6qP2RdwHj+1mdPyBpXd5fS
	 4P/LT0eztCnxOlbaC5IScT1YpeeSkgIt4OdrYHLCBickxXbrDJBvHNX4Kc9qE5T+Bn
	 CeNmxjSt2kN4g==
Message-ID: <sashiko-outbox-203614@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: gateworks-gsc: Propagate I2C read errors
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261108151125513PyebyF3QC3r_DTxS9ZMf6@zte.com.cn>
References: <20261108151125513PyebyF3QC3r_DTxS9ZMf6@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 07:17:36 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mfd: gateworks-gsc: describe GSC_FW_CRC checks in commit message
--

commit 1340cbfd3c53f47394be4bc06cdd793fc0282e91
Author: Shao Mingyin <shao.mingyin@zte.com.cn>

> mfd: gateworks-gsc: Propagate I2C read errors
>
> gsc_read() retries the I2C transfer but then stores "ret & 0xff" in *val
> and returns 0 even when the transfer failed.  regmap_read() therefore
> never reports an error: the FW_VER check in gsc_probe() and the two
> GSC_FW_CRC checks added by the previous version are dead code, and on a
> failed read the firmware revision is built from the low byte of the
> negative errno.
>
> Return the error from gsc_read() before touching *val, so regmap_read()
> and its callers see the failure; the existing FW_VER check and the two
> CRC checks then work as intended.
>
> Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

[Severity: Low]
This isn't a bug, but the commit message refers to the two GSC_FW_CRC
checks in gsc_probe() as "added by the previous version" (v1 of the
patch on the mailing list).  Since v2 replaces v1 and adds those
GSC_FW_CRC error checks in this commit itself, could the commit message
be updated to state that this patch adds the GSC_FW_CRC checks as well
as propagating errors from gsc_read()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108151125513Py=
ebyF3QC3r_DTxS9ZMf6@zte.com.cn?part=3D1
