Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F7523EAB3
	for <mfd@lists.linux.dev>; Sun, 23 Aug 2026 17:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787507179; cv=none; b=jhvB2d3+yUTIs00v1t/Asa+CZax7LXW+Rhw1nplpMHRHJxzDHILfv5D9w3444kDUJVSKpAIQklPIE4xVXILEmLxtthDMthOJjIZPUQAoAQN7HVs24Oo7H0+1vFbFsXIc6WS8FJGjzO/DlBKJTrm6RIhSiDP77WSkV/Io3qWgpac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787507179; c=relaxed/simple;
	bh=hv/dFN4xfSY5tjVmWBAoSSIQwgzah1kLOcB5zxKOzbQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J4dvOpvHSUmS7xRe/peb1+uAyNg8X10xu21+QVhB9AHIuMOHVQwhEZJDQk5oHYIudb9xAqsT/0/SXNkj/VN3HpTvW40sdtdCxmFka4YucYRVew3lbnaeGyN9nemQZYc6Muny++RdQk4ayZrutAIPZqkKroi9ssYs+upE4t4LVs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k016t8wV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k016t8wV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F931F000E9;
	Sun, 23 Aug 2026 17:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787507177;
	bh=hv/dFN4xfSY5tjVmWBAoSSIQwgzah1kLOcB5zxKOzbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k016t8wVO+f5crFTvcWl66WjeRzJGYv62hAXfyESq9515hsAuGb12EpunNX4tqcmE
	 HEOPlmI+WUVpj+uSk1iQ2aIWVrD1/e9+sDENqaxPqSs08YL6oqVQCmb2M0UUeH0c/j
	 HwhToqL2eQst4f2hvHCRYJX343YBNC5uZ110wDgg3vfqt7B145bf4Y38Hg8LrNxERH
	 +fxhkdaeHEFZRjX2erDMEd5CMivUrkDqFzQExIx/t47qwHCp/FW2Ht7umcBshiwBe3
	 BpXXU9c+gbXRxrf8Yem6uFtCvaQXg/ZtGwsscYsPH7goraRYsEWIDGagN3A9C9GJ/K
	 17Tl0Dc1zr7Jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: da9062: Use DEFINE_RES_IRQ_NAMED()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hiroki Nakajima" <3na7nanana@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260823174248.833535-1-3na7nanana@gmail.com>
References: <20260823174248.833535-1-3na7nanana@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 17:46:16 +0000
Message-Id: <20260823174616.B6F931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Use the dedicated DEFINE_RES_IRQ_NAMED() helper for the DA9062 IRQ
> resources instead of open-coding it with DEFINE_RES_NAMED(). This makes
> the intended resource type explicit and keeps the definitions consistent
> with the DA9061 resources.
>=20
> This is a mechanical cleanup with no functional change.
>=20
> With an x86_64 allmodconfig and W=3D1, drivers/mfd/da9062-core.o builds
> successfully and is byte-identical before and after this change.
>=20
> Assisted-by: Codex:gpt-5 coccinelle
> Signed-off-by: Hiroki Nakajima <3na7nanana@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823174248.8335=
35-1-3na7nanana@gmail.com?part=3D1

